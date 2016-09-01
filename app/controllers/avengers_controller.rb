class AvengersController < ApplicationController

  def index
    @avengers = Avenger.order(year: :asc).page(params[:page])
  end

  def show
    @avenger = Avenger.find(params[:id])
  end

  def new
    @avenger = Avenger.new
  end

  def create
    @avenger = Avenger.new(avenger_params)
    @avenger.alive = true
    @avenger.year = Time.now.year
    if @avenger.save
      flash[:success] = "Welcome to the Avengers, #{@avenger.name}!"
      redirect_to :root
    else
      render :new
    end
  end

  private

  def avenger_params
    params.require(:avenger).permit(:name, :alias_list, :gender)
  end

end
