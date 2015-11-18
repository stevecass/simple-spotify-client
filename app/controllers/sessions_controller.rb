class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    u = User.find_or_create_by uid: auth_hash[:uid], provider: auth_hash[:provider]
    u.email = auth_hash[:info][:email]
    u.name  = auth_hash[:info][:name]
    u.image = auth_hash[:info][:image]
    u.save if u.changed?
    session[:user_id] = u.id
    redirect_to root_path

  end
end