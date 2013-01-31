#encoding: utf-8
class TournamentsController < ApplicationController
  before_filter :load_tournament, :only => [:show, :generate_pairings]

  respond_to :json

 def show
  respond_to do |format|
    format.html{ redirect_to tournament_posts_path(@tournament) }
    format.json{ respond_with @tournament }
  end
 end

 def index
  @tournaments = Tournament.all
 end

 def new
  @tournament = Tournament.new 
 end

 def create
   @tournament = Tournament.new(params[:tournament])
   @tournament.user = current_user
   if @tournament.save
     redirect_to tournament_posts_path(@tournament), :notice => "Tournament created"
   else
     render :action => 'new'
   end
 end

 def generate_pairings
   if @tournament.generate_pairings
     pairings = @tournament.pairings
     respond_with pairings
   else
     render :json => {:msg => 'Aktualne runda jest ostatnią', :code => '400'}, :status => 422
   end
 end

end
