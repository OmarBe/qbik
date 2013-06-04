class ApplicationController < ActionController::Base
  protect_from_forgery

  def title?
    :title.nil?
  end

end
