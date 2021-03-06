class TournamentRegistrationSerializer < ActiveModel::Serializer
  attributes :id, :army, :current_points, :current_victory_points, :played_games, :extra_points, :penalty_points, :player_name, :player_full_name

  def player_name
    object.player.name
  end

  def player_full_name
    object.player.full_name
  end
end
