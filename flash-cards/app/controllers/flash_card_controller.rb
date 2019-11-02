class FlashCardController < ApplicationController

    get '/flashcards' do
        @flashcards = Flashcard.all
        erb :"flashcards/index"
    end

    get '/flashcards/new'do
      erb :"flashcards/new"

    end

      get '/flashcards/:id' do
        @flashcards = Flashcard.find_by_id(params["id"])
        erb :"flashcards/show"
      end
end
