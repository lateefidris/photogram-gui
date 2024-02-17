class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({:username => :asc})
    render({:template => "user_templates/index"})
  end

  def show
    url_name = params.fetch("username")
    matching_username = User.where({ :username => url_name})

    @the_user = matching_username.at(0)

    if @the_user == nil
      redirect_to("/404")
    else      
    render({ :template => "user_templates/show"})
    end
  end

  def create
    input_user = params.fetch("new_user")
    new_user = User.new
    new_user.username = input_user

    new_user.save

    redirect_to("/users/#{new_user.username}")
  end

  def update
    path = params.fetch("path_id")

    matching_user = User.where({:id => path})

    user = matching_user.at(0)

    user.username = params.fetch("user_update")
    user.save
    redirect_to("/users/#{user.username}")  
  end
end
