class WelcomeController < ApplicationController
  def index
    render text: 'Hi'
  end
end