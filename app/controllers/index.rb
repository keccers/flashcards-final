get "/" do
  @rounds = Round.all
  erb :index
end

post "/start" do 
  if @deck = Deck.find(params[:deck])
    @round = current_user.rounds.build 
    @round.deck = @deck
    @round.save
    session[:round] = @round.id
    redirect to ("/rounds/#{current_round.id}/show_front/#{@deck.cards.first.id}")
  else
    redirect '/'
  end
end

get "/rounds/:round_id/show_front/:id" do
  if @card = current_round.deck.cards.find_by_id(params[:id])
    @deck = current_round.deck
    erb :show_front
  else
    redirect "/users/#{current_user.id}"
  end
end

post "/rounds/:round_id/show_back/:id" do 
  @card = current_round.deck.cards.find(params[:id])
  @deck = current_round.deck
  @guess = current_round.guesses.build
  @guess.card = @card
  if @guess.answer(params[:guess])
    erb :show_back
  else
    @error = @guess.errors
    erb :show_front
  end
end