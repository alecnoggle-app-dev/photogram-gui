class UserController < ApplicationController
  
  def homepage

    redirect_to("/users")
  end
  
  
  def landing_page
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/landing.html.erb" })
  end

  def user_details
    # Params looks like this {"path_id"=>"22"}
    the_username = params.fetch("path_id")
    matching_users = User.where({ :username => the_username })
    @the_user = matching_users.at(0)

    if @the_user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/detail.html.erb" })
    end
  end

  def add
    #Params looks like this: {"input_username"=>"mike"}
    new_username = params.fetch("input_username")

    a_new_user = User.new 
    
    a_new_user.username = new_username

    a_new_user.save

    redirect_to("/users/#{a_new_user.username}")
  end

  def update
    # Params looks like this: Parameters: {"input_username"=>"updated name", "path_id"=>"original name"}
        
    old_username = params.fetch("path_id")

    matching_users = User.where({ :username => old_username })
    the_user = matching_users.at(0)

    new_username = params.fetch("input_username")

    the_user.username = new_username

    the_user.save

    redirect_to("/users/#{the_user.username.to_s}")
  end
end