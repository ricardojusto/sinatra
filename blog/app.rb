require 'sinatra'

class Post
  attr_reader :id, :title, :body, :author, :created_at
  def initialize(id, title, body, author, created_at)
    @id = id
    @title = title
    @body = body
    @author = author
    @created_at = created_at
  end
  
end

class Comment
	attr_reader :id, :body, :author, :post_id 
  def initialize(id, body, author, post_id)
    @id = id
    @body = body
    @author = author
    @post_id = post_id
  end
end


posts = [
  Post.new(0, 'O meu post', 'Assunto do Blog', 'Ricardo','7 Julho'),
  Post.new(1,'título do segundo','Assunto 2 do Blog', 'Joana','9 Julho'),
  Post.new(2,'título do terceiro','Assunto 3 do Blog', 'Maria','10 Julho')
]
comments = [
  Comment.new(0, 'I really like the first post', 'Gabriel', 0),
  Comment.new(1, 'I really like the second post', 'Joao', 1),
  Comment.new(2, 'I really like the third post', 'Joao', 2)
]

comment_input = []


get '/' do
  @posts = posts
  @comments = comments
  erb :index
end

get '/show/:id' do
  @post = posts.find do |post|
  	post.id == params[:id].to_i
  end
  @comments = comments.find do |comment|
  	comment.post_id == @post.id  # find comments where post_id is equal to @post.id
  end
  erb :show
end

get '/form/:id' do
	@comment_input = comment_input
	erb :form
end

