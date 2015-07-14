
get "/" do  
  if params[:search]
    @users = User.where(first_name: params[:search]) + User.where(last_name: params[:search])
  else
    @users = User.all
  end

  # if params[:sort] && params[:order] #para esta solução alterou-se o caminho nos links dos butoes
  #   @users = User.order(params[:sort].to_sym => params[:order]) #?order=asc&sort=email&search=pedro - exemplo(a interface não permite)
  # end

  if params[:sort] == "asc"
    @users = User.order(first_name: :asc)
  end
  if params[:sort] == "desc"
    @users = User.order(first_name: :desc)
  end

  erb :index
end

post "/users/create" do
  user = User.new({
    first_name: params[:first_name], 
    last_name: params[:last_name], 
    email: params[:email], 
    phone_number: params[:phone_number], 
    address: params[:address]
  })
  user.save
  redirect "/"
end

get '/edit/:id' do
	@user = User.find(params[:id]) 
	erb :edit
end

post "/edit/:id" do
  user = User.update(params[:id], {first_name: params[:first_name],
    last_name: params[:last_name], 
    email: params[:email], 
    phone_number: params[:phone_number], 
    address: params[:address]
  })
  user.save
  redirect "/"
end

post "/delete/:id" do
  User.destroy(params[:id].to_i) 
  redirect "/"
end

