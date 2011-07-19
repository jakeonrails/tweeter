class StatusesController < ApplicationController

  before_filter :authenticate_user!, :only => [:create]
  before_filter :get_statuses
  
  def index
    @status = Status.new
  end
  
  def create
    @status = current_user.statuses.new(params[:status])
    if @status.save
      flash[:notice] = "Status updated successfully."
      redirect_to statuses_path
    else
      render :index
    end
  end
  
  private
  
    def get_statuses 
      @statuses = Status.order("created_at DESC").all
    end
  
end
