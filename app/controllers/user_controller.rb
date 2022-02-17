class UserController < ActionController::Base
  def landing_page

    render({ :template => "user_templates/landing.html.erb" })
  end

  def user_details

    render({ :template => "user_templates/detail.html.erb" })
  end
end