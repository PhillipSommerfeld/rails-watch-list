class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @movies = Movie.all
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmarks_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    @movies = Movie.all
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.update(bookmarks_params)
    @list = List.find(@bookmark.list_id)
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmarks_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
