require './config/environment'



class ApplicationController < Sinatra::Base

  configure do

    set :public_folder, 'public'
    set :views, 'app/views'
    # enable :sessions
    # set :session_secret, "rockjockjayhawk"

  end

  get "/" do
    erb :home
  end

  post "/flashcards" do
    


  #   session[:card] = params[:card]
  # @session = session
  erb :created_flash
end

end
