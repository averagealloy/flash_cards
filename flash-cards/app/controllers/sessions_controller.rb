class SessionsController < ApplicationController

get '/login' do
  erb :"sessions/login"
end

post "/login" do
user = User.find_by(name: params[:name])
end

end
