class ApplicationController < ActionController::Base
  include Sorcery::Controller

  before_action :require_active, if: -> { current_user }

  def not_authenticated
    redirect_to(new_session_path, alert: "Please login")
  end

  def require_active
    if current_user.activation_state != "active"
      logout
      redirect_to(:new_session, alert: "please activate!")
    end
  end
end
