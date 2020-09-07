class Song < ApplicationRecord
  # mount_uploader :avatar, AvatarUploader
  mount_uploader :audio_song, AudioSongUploader
   # mount_uploader :video_song, VideoSongUploader
 # has_one_attached :audio_track
end
