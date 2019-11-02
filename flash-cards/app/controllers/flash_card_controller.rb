class FlashCardController < ApplicationController

    get '/flashcards' do
        @flashcards = Flashcard.all
        erb :"flashcards/index"
    end

    get '/flashcards/new'do
      @users = User.all
      erb :"flashcards/new"
    end

    get '/flashcards/:id/edit' do
       @users = User.all
      @flashcards = Flashcard.find_by_id(params[:id])
      erb :"/flashcards/edit"
    end

      get '/flashcards/:id' do
        @flashcards = Flashcard.find_by_id(params["id"])
        erb :"flashcards/show"
      end

      post '/flashcards' do
        flashcard = Flashcard.new(params)
        if flashcard.save
          redirect "/flashcards/#{flashcard.id}"
        else
          redirect "flashcard/new"
        end
      end
end
