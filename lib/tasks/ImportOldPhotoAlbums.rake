namespace :import do
  desc "Import our old users into the new database."
  task :photoalbums => :environment do
    class OldPhotoalbum < ActiveRecord::Base
      has_many :photos, :class_name => 'OldPhoto', :foreign_key => 'FotoAlbumID'
    end
    class OldPhoto < ActiveRecord::Base
      belongs_to :photoalbum, :class_name => 'OldPhotoalbum'
    end
    
    
    OldPhotoalbum.find_each(:batch_size => 2000) do |old_album|
      
      album = Photoalbum.new(:name => old_album.Naam)
      old_album.photos.find_each do |old_photo|
        photo = album.photos.build
        photo.photo = File.new("/Volumes/Wouter's Secret Disk/Kronosbackup/website/_kronos/files/fotos/foto_#{old_photo.FotoID}.jpg")
      end
      album.save
    end
  end
end