class PhotosController < ApplicationController
  load_and_authorize_resource
  protect_from_forgery :except => [:create, :delete]
  
    def index
      @photos = Photoalbum.find(params[:photoalbum_id]).photos
      render :json => @photos.collect { |p| p.to_jq_upload }.to_json
    end

    def create
      @photo = Photoalbum.find(params[:photoalbum_id]).photos.build(params[:photo])
	  
	  if @photo.photo.content_type == "image/jpeg"
		exif = EXIFR::JPEG.new(params[:photo][:photo].path)
		@photo.exif_date = exif.date_time
	  end
	  
      if @photo.save
        respond_to do |format|
          format.html {
            render :json => [@photo.to_jq_upload].to_json
          }
          format.json {
            render :json => [@photo.to_jq_upload].to_json
          }
        end
      else 
        render :json => [{:error => "custom_failure"}], :status => 304
      end
    end

    def destroy
      @photo = Photo.find(params[:id])
      @photo.destroy
      respond_to do |format|
        format.html { redirect_to @photo.photoalbum }
        format.json {
          render :json => true
        }
      end
    end
  end