class Song < ApplicationRecord
  mount_uploader :track, SongUploader
end
