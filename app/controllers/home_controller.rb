class HomeController < ApplicationController
  before_action :require_login, only: %i[protected]

  def index
  end

  def protected
  end
end
