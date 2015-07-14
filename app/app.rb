require "sinatra"

get "/" do 
	"Hello World"
end

get "/about" do
	"Hello Gabriel. It's a me"
end

get "/hello/:name/:last_name" do
	"hello #{params[:name]}, #{params[:middle_name]} #{params[:last_name]}"
end

#o route não pode ser igual

get "/city/:name/:city" do
	"Hello #{params[:name]} from #{params[:city]}"
end

get '/form' do
	erb :form
end

get '/submission' do
	"Hello #{params[:name]} this is your mail #{params[:mail]}"
end
