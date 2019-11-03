class FlashCardController < ApplicationController

    get '/flashcards' do
      if logged_in?
        @flashcards = Flashcard.all
        erb :"flashcards/index"
      else redirect "/login"
      end
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

      patch '/flashcards/:id' do
        @flashcards = Flashcard.find_by_id(params[:id])
        params.delete("_method")
        if @flashcards.update(params)
          redirect "/flashcards/#{@flashcards.id}"
        else
          redirect "/flashcards/#{@flashcards.id}/edit"
        end
      end


      post '/flashcards' do
        flashcard = Flashcard.new(params)
        if flashcard.save
          redirect "/flashcards/#{flashcard.id}"
        else
          redirect "flashcard/new"
        end
      end


      delete '/flashcards/:id' do
        @flashcards = Flashcard.find_by_id(params[:id])
        @flashcards.delete
        redirect "/flashcards"
      end


end
