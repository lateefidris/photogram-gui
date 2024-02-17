class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at => :desc })
   
    render({ :template => "photo_templates/index"})
  end 

  def show
    p_id = params.fetch("photo_id")
    @photo = Photo.where({ :id => p_id}).at(0)

    @comments = Comment.where({:photo_id => p_id})
    render({ :template => "photo_templates/show"})
  end

  def destroy
    delete = params.fetch("destroy_id")
    matching_photo = Photo.where({:id => delete}).at(0)
    matching_photo.destroy

    redirect_to("/photos")
  end

  def create
    input_image = params.fetch("image")
    input_caption = params.fetch("caption")
    input_id = params.fetch("input_id")

    a_new_photo = Photo.new

    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_id

    a_new_photo.save

    redirect_to("/photos/#{a_new_photo.id.to_s}")
  end

  def update
    path = params.fetch("path_id")

    matching_photo = Photo.where({:id => path})

    photo = matching_photo.at(0)

    photo.image = params.fetch("pic")
    photo.caption = params.fetch("cap")

    photo.save

    redirect_to("/photos/#{photo.id.to_s}")
  end

  def comment
    
    p_id = params.fetch("pic_id")
  
    new_comment = Comment.new
    new_comment.body = params.fetch("new_text")
    new_comment.author_id = params.fetch("author_id")
    new_comment.photo_id = p_id

    new_comment.save

    redirect_to("/photos/#{p_id.to_s}")
  end
end
