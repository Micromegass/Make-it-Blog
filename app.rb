require "sinatra"
require "sinatra/activerecord"
require "./models.rb"

set :database, "sqlite3:MakeItBlogDB.sqlite3"

get '/' do
  @posts = Post.all
  erb :index
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post
end

delete "/post/:id" do
  @post = Post.find(params[:id])
  @post.destroy
  redirect "/"
end

get "/post" do
  erb :create
end

post "/post" do
  Post.create(title: params[:title], body: params[:body])
  redirect "/"
end
