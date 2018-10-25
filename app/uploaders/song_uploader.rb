class SongUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
