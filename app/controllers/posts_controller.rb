class PostsController < ApplicationController
  respond_to :json

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      render :json => @post
    else
      render :json => @post.errors
    end
  end

  def destroy
    current_user.posts.find(params[:id]).destroy
    render json: { :status => :ok }
  end

  def index
    @posts = Post.all
    render json: @posts, each_serializer: PostSerializer
  end

  def show
    @post = Post.find(params[:id])
    respond_with @post
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    render json: @post
  end

  private
    def post_params
      params.require(:post).permit(:title, :text)
    end
end