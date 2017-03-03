class MyThreadsController < ApplicationController

  def index
    @my_threads = MyThread.all
  end  

  def new
    @my_thread = MyThread.new
  end
   
  def create
    @my_thread = MyThread.new(my_thread_params)
    if @my_thread.save
      redirect_to my_threads_path
    else
      render :new
    end
  end

  def show
    @my_thread = MyThread.find(params[:id]) 
  end

  def edit
    @my_thread = MyThread.find(params[:id]) 
  end

  def update
    @my_thread = MyThread.find(params[:id])
    if @my_thread.update(my_thread_params)
      redirect_to my_threads_path
    else
      render :edit
    end
  end

  def destroy
    @my_thread = MyThread.find(params[:id])
    @my_thread.destroy
    redirect_to my_threads_path 
  end

  private
    def my_thread_params
      params.require(:my_thread).permit(:title, :content, :user_id)
    end
end

