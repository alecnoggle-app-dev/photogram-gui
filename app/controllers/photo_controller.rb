class PhotoController < ApplicationController
  def landing_page

    render({ :template => "photo_templates/landing.html.erb" })
  end

  def photo_details
    # Params looks like this {"path_id"=>"22"}
    @the_id = params.fetch("path_id")

    render({ :template => "photo_templates/detail.html.erb" })
  end
end