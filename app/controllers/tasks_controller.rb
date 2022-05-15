class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params.merge(user_id: current_user.id))
    if @task.save
      redirect_to tasks_url, notice: "登録しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    task.update!(task_params)
    redirect_to tasks_url, notice: "更新しました"
  end

  def destroy
    task.destroy
    redirect_to tasks_url, notice: "タスクを削除しました"
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
