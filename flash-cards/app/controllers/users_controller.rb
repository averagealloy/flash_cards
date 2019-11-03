class UsersController < ApplicationController

get '/users/signup' do
  erb :"/users/signup"
end

post '/users' do
  binding.pry
  @user = User.new(params)
  if @user.save
    session[:user_id] = @user.id
    redirect "/flashcards"
  else
    redirect "/users/signup"
  end 
end




end
