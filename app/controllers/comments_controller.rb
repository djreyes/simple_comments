class CommentsController < ApplicationController
  def index
    case params[:filter]
    when "hidden"
      @comments = Comment.hidden.search(params[:search_term])
    when "unhidden"
      @comments = Comment.unhidden.search(params[:search_term])
    else
      @comments = Comment.search(params[:search_term])
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    if Comment.create_from_url(params[:url])
      flash[:success] = "Successfully created comments"
      redirect_to comments_path
    else
      flash[:error] = "An error occurred"
      redirect_to new_comment_path
    end
  end

  def edit
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(hidden: params[:hidden])
      redirect_to comments_path
    else
      redirect_to comments_path, notice: "error"
    end
  end
end
