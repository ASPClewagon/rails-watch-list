
  class BookmarksController < ApplicationController

    def new
      # Initialize a new bookmark
      @bookmark = Bookmark.new
    end

    def create
      @bookmark = Bookmark.new(bookmark_params)
      if @bookmark.save
        redirect_to lists_path
      else
        render :new
      end
    end

    def destroy
      @bookmark.destroy
      redirect_to bookmarks_url, notice: 'Bookmark was successfully deleted.'
    end

    private


    def bookmark_params
      params.require(:bookmark).permit(
        :comment,
        :list_id,  # If bookmarks can belong to lists
        :movie_id   # If you're using tags
      )
    end
  end
