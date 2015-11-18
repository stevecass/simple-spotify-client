class SessionsController < ApplicationController
  def create
    p request.env
    p "XXXXXXXXXXXXX"
    p request
    render text: 'OK'
  end
end