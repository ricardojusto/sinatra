require 'sinatra'

class Bob
  def hey(statement)
    if statement.strip.empty?
      'Fine. Be that way!'
    elsif statement.upcase == statement && statement.downcase != statement
      'Woah, chill out!'
    elsif statement.end_with?('?')
      'Sure.'
    else
      'Whatever.'
    end
  end
end

get '/bob' do 
	@message = Bob.new.hey(params[:name])
	erb :bob
end

get '/' do 
	if params.key?('name')
		@message = Bob.new.hey(params[:name])
	end
	erb :bob
end

