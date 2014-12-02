class CommentsController < ApplicationController
  respond_to :json

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      render json: @comment
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render json: { :status => :ok }
  end

  def index
    @comments = Post.find(params[:post_id]).comments
    respond_with @comments
  end

  def show
    @comment = Comment.find(params[:id])
    respond_with @comment
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      respond_with @comment
    end
  end

  private
    def set_collection
      @collection = Collection.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:post_id, :text)
    end

end