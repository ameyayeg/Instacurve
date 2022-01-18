class ImagesController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create, :destroy]


  def index
    @images = Image.order(created_at: :desc)
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = current_user.images.build(image_params)
    if @image.save
      redirect_to @image, notice: 'Image uploaded!'
    else
      render :new
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_back(fallback_location: "/"); 
  end
end

  private

  def image_params
    params.require(:image).permit(:image, :description)
  end