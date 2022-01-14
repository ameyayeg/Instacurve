class ImagesController < ApplicationController
    def new
      @image = Image.new
    end

    def create
      @image = current_user.images.build(image_params)
      if @images.save
        redirect_to image_path(@image.id), notice: 'Image uploaded!'
      else
        render :new
      end
    end
  
    def image_params
      params.require(:image).permit(:image, :description)
    end
  end