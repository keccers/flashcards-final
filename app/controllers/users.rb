get '/create_user' do 
  erb :create_user
end 

post '/create_user' do 
  @user = User.new(params[:person])
  if @user.save
  session[:user_id] = @user.id
  redirect "/users/#{@user.id}" #maybe change this later
  else
    @errors = @user.errors
    erb :create_user
  end 
end

get '/:user_id/edit' do 
  if current_user
    erb :edit_user
  else 
    redirect '/lol_nope'
  end
end

post '/edit' do
  current_user.update_attributes(params[:person])
  current_user.save
  redirect "/users/#{current_user.id}"
end

get '/login' do
 erb :login
end

post '/login' do 
    @user = User.authenticate(params[:person][:name], params[:person][:password])
  if @user
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = "Username and/or password does not exist."
    erb :login
  end
end

get "/logout" do
  session[:id] = nil
  redirect to "/"
end

get '/users/:user_id' do
  if User.find_by_id(params[:user_id]) == current_user
    @alltime = GChart.pie do |g|
      g.data = [current_user.guesses.right.count, current_user.guesses.wrong.count]
      g.colors = ['A1D8B1', 'EDFCC2']
      g.width = 700
      g.legend = ["Right", "Wrong"]
    end 
    erb :stats
  else 
    redirect '/lol_nope'
  end
end