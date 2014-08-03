class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.find(:all)
  end
  
  def show
    @tournament = Tournament.find(params[:id])
  end
  
  def new
    @tournament = Tournament.new
  end
  
  def create
    @tournament = Tournament.new(tournament_params)
    if @tournament.save
      flash[:danger] = "Tournament successfully created"
      redirect_to @tournament
    else
      render 'new'
    end    
  end
  
  
  private
  def tournament_params
    params.require(:tournament).permit(:name, :description, :primary_city, :primary_state, :start_date, :end_date)
  end
end
