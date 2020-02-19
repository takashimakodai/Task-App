class TasksController < ApplicationController
  before_action :set_user_id, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_task_id, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:index, :destroy]
  
  def index
    @tasks = Task.all
  end

  def show
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
  end

  def update
    if @task.update_attributes(task_params)
       flash[:success] = '更新しました'
       redirect_to user_task_path 
    else
       render :show
    end
  end
  
  def destroy
    @task.destroy
    flash[:danger] = '削除しました'
    redirect_to user_tasks_path
  end

  private
  
    def set_user_id
      @user = User.find(params[:user_id])
    end
    
    def set_task_id
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:task_name, :note)
    end
    
    def admin_user
      redirect_to root_url unless current_user.admin?
    end
end
