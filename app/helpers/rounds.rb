def current_round
  @round ||= Round.find(session[:round])
end