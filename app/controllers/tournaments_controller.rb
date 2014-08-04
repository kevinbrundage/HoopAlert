class TournamentsController < ApplicationController
  
  def index
    #@tournaments = Tournament.where('soft_delete != 1').find(:all)
    @tournaments = Tournament.find(:all)
  end
  
  def show
    @tournament = Tournament.find_by_id(params[:id])
    if !@tournament || @tournament.soft_delete
      flash[:danger] = "Requested tournament does not exist or is deleted."
      redirect_to tournaments_path
    else
      render 'show'
    end
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
  
  def destroy
    tournament = Tournament.find(params[:id])
    tournament.update_attributes(soft_delete: 1)
    #tournament.destroy
    flash[:danger] = "Tournament \"#{tournament.name}\" successfully deleted."
    redirect_to tournaments_path
  end
  
  
  private
  def tournament_params
    params.require(:tournament).permit(:name, :description, :primary_city, :primary_state, :start_date, :end_date)
  end
end
