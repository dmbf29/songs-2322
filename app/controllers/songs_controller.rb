class SongsController < ApplicationController
  # /search?query=thriller
  def search
    # @songs = Song.where(title: params[:query])
    @songs = Song.where('title ILIKE ?', "%#{params[:query]}%")
  end

  # /songs/named/thriller
  def search_two
    @songs = Song.where('title ILIKE ?', "%#{params[:name]}%")
  end

  def index # read all
    @songs = Song.all
  end

  def show # read one
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def song_params
    # make sure the user's are only giving us what we want
    params.require(:song).permit(:title, :year, :category)
  end
end
