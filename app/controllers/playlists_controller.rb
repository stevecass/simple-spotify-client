class PlaylistsController < ApplicationController
  before_action :ensure_current_user

  def index
    user_id = current_user.uid
    endpoint = "https://api.spotify.com/v1/users/#{user_id}/playlists"
    uri = URI(endpoint)
    req = Net::HTTP::Get.new(uri)
    req['Authorization'] = "Bearer #{session[:token]}"
    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(req)
    end
    render json:res.body

  end
end