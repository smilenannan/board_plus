class CommentsController < ApplicationController
  def new
    @comment = Comment.new(params.permit(:my_thread_id))
  end

  def create 
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = @my_thread.comments.new(comment_params)
    if @comment.save
      redirect_to my_thread_path(@comment.my_thread_id)
    else
      render 'new'
    end 
  end

  def edit
   @comment = Comment.find(params[:id]) 
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to my_thread_path(@comment.my_thread_id)
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to my_thread_path(@comment.my_thread_id)
  end

  private
    def comment_params
      params.require(:comment).permit(:content).merge(user_id: current_user.id)
    end
end

