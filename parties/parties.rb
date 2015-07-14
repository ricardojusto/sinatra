require 'sinatra'
require 'date'
# require 'rack-flash'
# require 'sinatra/redirect_with_flash'
#
# enable :sessions
# use Rack::Flash, :sweep => true

class Party
  attr_reader :id, :theme, :date, :description

  def initialize(hash)
    @id = hash[:id]
    @theme = hash[:theme]
    @date = hash[:date]
    @description = hash[:description]
    @users = []
  end

  def change_theme(theme)
    @theme = theme
  end

  def change_date(date)
    @date = date
  end

  def change_description(description)
    @description = description
  end

  def users
    @users
  end

  def add_user(email)
    @users << email
  end


  # def remove_user(email)
  #   @users.reject! do |user|
  #     user(email) == email
  #   end
  #
  # def attending_users_count
  #   ...
  # end
end

parties = [
  Party.new({ id: 0, theme: "halloween", date: Date.new(2016,7,12), description: "description of the party of the halloween", users: ""}),
  Party.new({ id: 1, theme: "summer party", date: Date.new(2015,6,12), description: "description of the party of the gold ", users: ""}),
  Party.new({ id: 2, theme: "graduation", date: Date.new(2014,7,12), description: "description of the party of the graduation", users: ""})
]

get '/' do
  # if parties.empty?
  #       flash[:error] = 'No notes found. Add your first below.'
  #   end
  if params[:search]
    @party = parties.select do |party|
      party.theme.include?(params[:search]) || party.description.include?(params[:search])
    end
  else
    @party = parties
  end

  @party = @party.sort_by do |party|
    party.date.to_s
  end

  if params[:sort] == "desc"
    @party = @party.reverse
  end

  if params[:sort] == "outdated"
    @party = @party.select do |party|
      party.date.to_s >= Date.today.to_s
    end
  end
  erb :index
end

# show individual post
get '/show/:id' do
  @party = parties.find do |party| # ESTA FoRMULA PROCURA O PRODUCTO PELO ID PARA EXECUTAR OPERAcoesS COM ELE INDIVIDUALMENTE (NB)
    party.id == params[:id].to_i
  end
  erb :show
end

# # form to edit a single party
get '/:id/edit' do
  @party = parties.find do |party|
    party.id == params[:id].to_i
  end
  erb :edit
end

# # form to create a new party
get '/new' do
  erb :new
end

get '/remove/:id' do
  parties.reject! do |party|
    party.id == params[:id].to_i
  end
  redirect '/'
end

# # method to save a new party, the /new route should point here
# post '/create' do
#   ...
# end
post '/create' do
  parties << Party.new({:id => parties.length, :theme => params[:theme], :date => params[DateTime.new], :description => params[:description]})
  redirect '/'
end

# # method to update an existing party, the /:id/edit should point here
# post '/:id/update' do
#   ...
# end
post '/update/:id' do
  party = parties.find do |party|
    party.id == params[:id].to_i
  end
  party.change_theme(params[:theme])
  party.change_date(params[:date])
  party.change_description(params[:description])
  redirect "/show/#{params[:id]}"
end

get '/parties/:id/form' do
  @party = parties.find do |party|
    party.id == params[:id].to_i
  end
  erb :form
end

post '/parties/:id/form' do
  party = parties.find do |party|
    party.id == params[:id].to_i
  end
  party.add_user(params[:email])
  redirect '/'
end

# get '/remove/user/:id' do
#     party.remove_user(params[:email])
#   redirect '/'
# end
