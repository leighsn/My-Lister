class UserController < ApplicationController

  post '/user' do
    @user = User.find_or_create_by(:name => params[:name])
    redirect to "/user/#{@user.slug}"
  end

  get '/user/all' do
    @users = User.all
    erb :'user/all'
  end

  get '/user/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'user/show'
  end

  get '/:user_slug/list/:list_slug' do
    @user = User.find_by_slug(params[:user_slug])
    @list = List.find_by_slug(params[:list_slug])
    @items =  @list.items.all
    erb :'list/show'
  end

  post '/user/:slug/new' do
    @user = User.find_by_slug(params[:slug])
    @list = List.create(name: params[:name])
    UserList.create(user_id: @user.id, list_id: @list.id)
    erb :'list/new'
  end




end
