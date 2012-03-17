class CatsController < ApplicationController

  #
  # og-image
  #
  def og_image
    @image.path
  end

  #
  # index
  #
  def index
    @image = Image.get
  end

  #
  # 
  #
  def last
  end

  #
  # reload
  #
  def reload
    @image = Image.get
    respond_to do |f|
      f.js { render :show }
      f.html { redirect_to "/##{@image.id}" }
    end
  end

  #
  # show
  #
  def show
    @image = Image.find params[:id]
    respond_to do |f|
      f.jpg { send_data @image.data, :type=> :jpg, :disposition=>'inline' }
      f.html
      f.js
    end
  end
end
