get "/" do
	@todos = Todo.all
	@notcomplete = Todo.where(completed: false)
	@complete = Todo.where(completed: true)
  erb :index
end

post '/' do 
		Todo.create({
		title: params[:title]
		})
	redirect '/'
end

get "/delete/:id" do
  Todo.destroy(params[:id]) 
  redirect "/"
end

get '/complete/:id' do
	todo = Todo.find(params[:id])
	todo.completed = !todo.completed 
	todo.save

  redirect '/'
end
