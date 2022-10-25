class TweetsController < ApplicationController
    def index
      @tweets = Tweet.all.order(created_at: :desc)
    end 
  
    def show
      @tweet = Tweet.find(params[:id])
    end

    def creat
      # Se crea un tweet con los strong params
      @tweet = Tweet.new(tweets_params)
      
      # Si se pudo crear se muestra
      if @tweet.save 
          # Se muestra el tweet
          redirect_to @tweet, notice: "Puta madre"
      else
          # Se renderiza el new.html.erb
          render :new, status: :see_other
      end
  

    private
    # Defino strong params
    # solo se permite usar los parametros aqui definidos
    def tweets_params
      params.require(:tweet).permit(:content, :monster_id)
    end
end


# The require method ensures that a specific parameter is present, and if it's not provided,
# the require method throws an error. It returns an instance of ActionController::Parameters 
# for the key passed into require.

# The permit method returns a copy of the parameters object, returning only the permitted keys 
# and values. When creating a new ActiveRecord model, only the permitted attributes are passed into 
# the model.
end