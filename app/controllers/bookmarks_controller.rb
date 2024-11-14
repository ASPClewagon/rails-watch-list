class BookmarksController < ApplicationController
  class BookmarksController < ApplicationController
    # Optional: Add authentication/authorization
    before_action :authenticate_user!

    # Optional: Set up a common finder for individual bookmarks
    before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

    def index
      # Retrieve all bookmarks, potentially scoped to current user
      @bookmarks = current_user.bookmarks.order(created_at: :desc)
    end

    def show
      # Show details of a specific bookmark
    end

    def new
      # Initialize a new bookmark
      @bookmark = Bookmark.new
    end

    def create
      @bookmark = current_user.bookmarks.build(bookmark_params)

      if @bookmark.save
        redirect_to @bookmark, notice: 'Bookmark was successfully created.'
      else
        render :new
      end
    end

    def edit
      # Prepare a bookmark for editing
    end

    def update
      if @bookmark.update(bookmark_params)
        redirect_to @bookmark, notice: 'Bookmark was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @bookmark.destroy
      redirect_to bookmarks_url, notice: 'Bookmark was successfully deleted.'
    end

    private

    def set_bookmark
      @bookmark = current_user.bookmarks.find(params[:id])
    end

    def bookmark_params
      params.require(:bookmark).permit(
        :title,
        :url,
        :description,
        :list_id,  # If bookmarks can belong to lists
        :tag_list   # If you're using tags
      )
    end
  end
end
