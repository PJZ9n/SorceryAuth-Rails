class ApplicationController < ActionController::Base
  include Sorcery::Controller

  def not_authenticated
    redirect_to(new_session_path, alert: "Please login")
  end
end
