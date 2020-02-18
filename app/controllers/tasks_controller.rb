class TasksController < ApplicationController
  before_action :set_user_id, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = @user.tasks.new(task_params)
      if @task.save
        flash[:success] = "新規作成に成功しました"
        redirect_to @user
      else
        render :new
      end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
      if @task.save
        flash[:notice] = '更新しました'
        redirect_to user_tasks_path #indexページへ遷移
      else
        render :show
      end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to user_tasks_path
  end

  private
  
    def set_user_id
      @user = User.find(params[:user_id])
    end

    def task_params
      params.require(:task).permit(:task_name, :note)
    end
end