require 'sinatra'



def drink_age(age)
	if age == nil || age.empty?
		 "Error"
	elsif age.to_i < 18
		 "Not allowed"
	else
		 "Allowed"
	end
end

get '/' do 
	erb :form
end

get '/form' do 
	if params.key?('age')
		@message = drink_age(params[:age])
	end
	erb :answer
end