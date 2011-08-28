class CatsController < ApplicationController
  #
  # index
  #
  def index
    @image = Image.get
  end

  #
  # reload
  #
  def reload
    @image = Image.get
    render :show
  end

  #
  # show
  #
  def show
    @image = Image.find params[:id]
    respond_to do |f|
      f.jpg { send_data @image.data }
      f.html{ render "index" }
      f.js
    end
  end
end
