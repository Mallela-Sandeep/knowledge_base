class PostsController < ApplicationController

  before_filter :authenticate_user!, expect: :index
  before_filter :load_post, :only => %w(edit update show destroy)
  
  def index
    @posts = Post.all
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to new_post_path, notice: "Post creation successfull"
    else
      render :new, notice: "Something went wrong, please try again"
    end
  end
  
  def new
    @post = Post.new
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to posts_path, notice: "Post updated successfully"
    else
      render :edit, notice: "Something went wrong, please try again"
    end
  end
  
  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Record was deleted successfully'
  end
  
  private
  
    def load_post
      @post = Post.find(params[:id]) 
    end
  
end
