require 'sinatra'

def make_acronym(val)
  return 'Not a string' unless val.is_a?(String)
  return 'Not letter' if !val.empty? && val !~ (/^([[:alpha:]]|\s)+$/)
  val.split.map{ |word| word[0].upcase }.join
end


get '/' do 
	erb :form
end

get '/form' do
		@message = make_acronym(params[:val])
end