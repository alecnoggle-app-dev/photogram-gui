class PhotoController < ApplicationController
  def landing_page

    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc})

    render({ :template => "photo_templates/landing.html.erb" })
  end

  def photo_details
    # Params looks like this {"path_id"=>"22"}
    the_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => the_id })
    @the_photo = matching_photos.at(0)

    render({ :template => "photo_templates/detail.html.erb" })
  end
end