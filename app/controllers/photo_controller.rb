class PhotoController < ActionController::Base
  def landing_page

    render({ :template => "photo_templates/landing.html.erb" })
  end

  def photo_details

    render({ :template => "photo_templates/detail.html.erb" })
  end
end