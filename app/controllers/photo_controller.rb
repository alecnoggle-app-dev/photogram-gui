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

    if @the_photo == nil
      redirect_to("/404")
    else
      render({ :template => "photo_templates/detail.html.erb" })
    end
  end

  def delete
    the_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => the_id })
    the_photo = matching_photos.at(0)
    the_photo.destroy

    #render({ :template => "photo_templates/delete.html.erb"})
    redirect_to("/photos")
  end

  def add
    # Params looks like this: {"query_image"=>"a", "query_caption"=>"b", "query_owner_id"=>"c"}
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new 
    
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    # render({ :template => "photo_templates/add.html.erb"})
    redirect_to("/photos/#{a_new_photo.id.to_s}")
  end

  def update
    # Params looks like this: Parameters: {"query_image"=>"url", "query_caption"=>"text", "path_id"=>"785"}
    
    the_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => the_id })
    the_photo = matching_photos.at(0)

    new_image = params.fetch("query_image")
    new_caption = params.fetch("query_caption")

    the_photo.image = new_image
    the_photo.caption = new_caption

    the_photo.save

    # render({ :template => "photo_templates/update.html.erb"})
    redirect_to("/photos/#{the_photo.id.to_s}")
  end

  def new_comment
    # Params looks like this: Parameters: {"input_photo_id"=>"785", "input_author_id"=>"177", "input_body"=>"You are cool"}
    photo_id = params.fetch("input_photo_id")
    author_id = params.fetch("input_author_id")
    body = params.fetch("input_body")

    a_new_comment = Comment.new 
    
    a_new_comment.photo_id = photo_id
    a_new_comment.author_id = author_id
    a_new_comment.body = body

    a_new_comment.save

    redirect_to("/photos/#{photo_id}")
  end
end