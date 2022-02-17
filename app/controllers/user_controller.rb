class UserController < ApplicationController
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
end