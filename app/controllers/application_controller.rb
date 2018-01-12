class ApplicationController < ActionController::API
  before_action :authenticate

  def authenticate
    render json {error: "unauthorized"}, status: 401 unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def current_user
    if auth_present? && User.find(auth["user"])
      @current_user ||= user
    end
  end

  private

  def auth_present?
    !!request.env.fetch("HTTP_AUTHORIZATION", "").scan(/Bearer/).flatten.first
  end

  def auth
    Auth.decode(token)
  end

  def token
    request.env["HTTP_AUTHORIZATION"].scan(/Bearer(.*)/).flatten.last
  end
end
