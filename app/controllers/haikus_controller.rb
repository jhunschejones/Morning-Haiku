class HaikusController < ApplicationController
  before_action :set_haiku, only: [:edit, :update]

  def index
    @haikus = Haiku.all.includes(:user).order(created_at: :desc)
    @filter_users = @haikus.map(&:user).uniq
  end

  def new
    @haiku = Haiku.new
  end

  def create
    Haiku.create!(
      user: @current_user,
      **haiku_params
    )
    redirect_to root_path
  end

  def edit
  end

  def update
    @haiku.update!(**haiku_params)
    redirect_to root_path
  end

  private

  def haiku_params
    params.require(:haiku).permit(:title, :body)
  end

  def set_haiku
    @haiku = Haiku.find(params[:id])
    if @haiku.user != @current_user
      redirect_to root_path, alert: "You cannot update someone elses haiku"
    end
  end
end
