# frozen_string_literal: true

# This is Session Controller
class HomeController < ApplicationController
	# skip_before_action :authenticate_user!, except: [:new, :create]
  # before_action :find_user
  before_action :authenticate_user!, only: [:dashboard]

  def index
  end

  def dashboard
    @song = Song.all
  end
end
