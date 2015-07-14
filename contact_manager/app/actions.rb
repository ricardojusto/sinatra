
get "/" do
  @users = User.all
  erb :index
end

post "/users/create" do
  user = User.new name: params[:name], email: params[:email]
  user.save
  redirect "/"
end

get '/edit/:id' do
	@user = User.find(params[:id]) 
	erb :edit
end

post "/edit/:id" do
  user = User.update(params[:id], { name: params[:name], email: params[:email]})
  user.save
  redirect "/"
end

post "/delete/:id" do
  User.destroy(params[:id].to_i) 
  redirect "/"
end

