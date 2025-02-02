class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params(:name))
    @genre = Genre.find(params[:song][:genre_id])
    @artist = Artist.find(params[:song][:artist_id])
    @song.update(genre: @genre, artist: @artist)

    redirect_to song_path(@song)
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @genre = Genre.find(params[:song][:genre_id])
    @artist = Artist.find(params[:song][:artist_id])
    @song.update(song_params(:name))
    @song.update(genre: @genre, artist: @artist)

    redirect_to song_path(@song)

  end

  def show
    @song = Song.find(params[:id])
    @genre = @song.genre
    @artist = @song.artist
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end
end
