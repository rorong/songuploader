# frozen_string_literal: true

# This is Session Controller
class SongsController < ApplicationController
  def create
    @song = Song.new(music_params)
    @song.save
    redirect_to dashboard_path
  end

  private

  def music_params
    params.permit(:description, :audio_song)
  end
end
