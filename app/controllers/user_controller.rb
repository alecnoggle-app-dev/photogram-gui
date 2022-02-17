class UserController < ActionController::Base
  def landing_page
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/landing.html.erb" })
  end

  def user_details
    # Params looks like this {"path_id"=>"22"}
    @the_id = params.fetch("path_id")

    render({ :template => "user_templates/detail.html.erb" })
  end
end