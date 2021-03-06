#encoding: utf-8
class TournamentRegistration < ActiveRecord::Base

  MONITORED_ATTRS = ['roster_send', 'roster_valid', 'payment_send']

  acts_as_paranoid 
  validates_as_paranoid

  belongs_to :tournament
  belongs_to :player
  has_many :pairings, :class_name => 'TournamentPairing', :finder_sql => Proc.new {
    %Q{
      SELECT DISTINCT *
      FROM tournament_pairings AS tp
      WHERE tp.player1_id = #{player.id} OR tp.player2_id = #{player.id}
    }
  }

  validates_uniqueness_of_without_deleted :player_id, :scope => :tournament_id
  validates_presence_of :player_id
  validates_uniqueness_of_without_deleted :player_email, :scope => :tournament_id, :allow_blank => true

  after_create :notify_player, :unless => Proc.new{ self.player_email.blank? }
  after_update :notify_player_of_change, :unless => Proc.new{ self.player_email.blank? }


  def notify_player
    RegistrationsMailer.tournament_signup_confirmation(self).deliver
  end

  def notify_player_of_change
    if change = (self.changed & MONITORED_ATTRS).first
      if self.send(change)
        RegistrationsMailer.tournament_change_confirmation(self, change).deliver    
      end
    end
  end


  def  self.to_csv(results)
    CSV.generate(:col_sep => ';') do |csv|
      csv << ['Miejsce', 'ID Ligowe', 'Imię', 'Nazwisko', 'Armia Miasto', 'Punkty', 'ID Sedziowka']
      results.each_with_index do |registration, i|
        csv << [
                i + 1,
                registration.player.league_id,
                registration.player.first_name,
                registration.player.last_name,
                registration.army,
                registration.player.city,
                registration.player.nick,
               ] 
      end 
    end 
  end

  def victory_points
    player.game_points_for_tournament(tournament)
  end
  
  def final_points
    current_points + extra_points - penalty_points
  end

end
