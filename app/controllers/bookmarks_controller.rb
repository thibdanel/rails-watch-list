class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_param)
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:bookmark][:movie_id])
    @bookmark.list = @list
    @bookmark.movie = @movie

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @movie = Movie.find(params[:movie_id])
    @bookmark = Bookmark.find_by(list_id: @list.id, movie_id: @movie.id)
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  def bookmark_param
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
