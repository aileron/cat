class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :og_image

  def og_image
  end
end
