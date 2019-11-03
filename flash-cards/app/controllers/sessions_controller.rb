class SessionsController < ApplicationController

get '/login' do
  erb :"sessions/login"
end

post "/login" do
user = User.find_by(name: params[:name])
if user.authenticate(params[:password])
  session[:user_id] = user.id
  redirect "/flashcards"
else
  redirect "/login"
end

end
