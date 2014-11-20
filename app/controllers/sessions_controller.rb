class SessionsController < ApplicationController
  def create
    @user = User.login_from_omniauth(auth_hash)
    log_in(@user)
    redirect_to '/'
  end

  def destroy
    log_out
    redirect_to root_url
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end