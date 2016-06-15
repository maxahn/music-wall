# Homepage (Root path)
get '/' do
  erb :'/index'
end

before do
  cookies[:page_views] ? cookies[:page_views] = cookies[:page_views].to_i + 1 : cookies[:page_views] = 1
end

helpers do
  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
#-----tracks-----# 

get '/tracks' do
  @tracks = Track.all
  erb :'/tracks/index'
end

post '/tracks' do   #TODO: make sure that tracks won't be able to be created by non logged in users
  @track = Track.new(
    song_title: params[:song_title],
    author: params[:author],
    url: params[:url],
    posted_by: current_user.id || 0
  )
  if @track.save 
    redirect '/tracks'
  else
    erb :'/tracks/new'
  end
end

get '/tracks/new' do
  erb :'tracks/new'
end

get '/tracks/:id' do
  @track = Track.find params[:id]
  erb :'tracks/show'
end

#-----users-----# 

get '/users' do
  @users = User.all
  erb :'users/index'
end

post '/users' do
  @user = User.new(
    username: params[:username],
    email: params[:email],
  )
  
  @user.password = params[:password]   #TODO: hash this
  if @user.save
    redirect '/users'
  else
    rediret 'users/sign_up'
  end
end

get '/users/login' do
  erb :'users/login'
end

post '/users/login' do
  @login_user = User.find_by(username: params[:username])
  if @login_user.password == params[:password]
    session[:user_id] = @login_user.id
    redirect '/'
  else
    redirect 'users/login'
  end
end

get'/users/sign_up' do
  erb :'users/sign_up'
end

get '/users/:id' do
  @find_user = User.find params[:id]
  erb :'users/show'
end
get '/logout' do
  session.clear
  redirect '/'
end
