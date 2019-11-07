class FlashCardsController < ApplicationController

    get '/flashcards' do
      if logged_in?
        @flashcards = current_user.flashcards.all
        erb :"flashcards/index"
      else
        redirect "/login"
      end
    end

    get '/flashcards/new'do
    if logged_in? 
      erb :"flashcards/new"
    else 
      redirect "/login"
    end 
    end

    get '/flashcards/:id/edit' do
      @flashcards = Flashcard.find_by_id(params[:id])
      if @flashcards.user.id == current_user.id
             erb :"flashcards/edit"
         else
             redirect "/flashcards"
         end
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


      get '/flashcards/:id' do
        @flashcards = Flashcard.find_by_id(params["id"])
        erb :"flashcards/show"
      end



      post '/flashcards' do
        flashcard = Flashcard.new(user_id: current_user.id, title: params[:title], description: params[:description])
        if flashcard.save
          redirect "/flashcards/#{flashcard.id}"
        else
          redirect "flashcard/new"
        end
      end


      delete '/flashcards/:id' do
        @flashcards = Flashcard.find_by_id(params[:id])
        if @flashcards.user.id == current_user.id
          @flashcards.delete
          redirect "/flashcards"
        else
          redirect "/flashcards"
        end
      end


end
