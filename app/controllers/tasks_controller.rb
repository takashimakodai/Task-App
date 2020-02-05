class TasksController < ApplicationController
  
  def index
    @task = Task.all
  end

  def show
    @user = User.find(params[:user_id])
    @task = Task.find(params[:id])
  end
  
  def new
    @user = User.find(params[:user_id])
    @task = Task.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @task = @user.tasks.new(task_params)
      if @task.save
        flash[:success] = "新規作成に成功しました"
        redirect_to @user
      else
        render :new
      end
  end

  def edit
    @user = User.find(params[:user_id])
    @task = Task.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @task = Task.find(params[:id])
      if @task.save
        flash[:notice] = '更新しました'
        redirect_to user_tasks_path #indexページへ遷移
      else
        render :show
      end
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @task = Task.find(prams[:id])
    @task.destroy
    redirect_to user_tasks_path
  end

  private

    def task_params
      params.require(:task).permit(:task_name, :note)
    end
end