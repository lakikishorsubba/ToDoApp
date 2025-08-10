class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    @tasks = Task.all.order(created_at: :desc)
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path, notice: "Task created successfully."
    else
      @tasks = Task.all.order(created_at: :desc)  # To re-render index with tasks
      render :index, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to root_path, notice: "Task updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path, notice: "Task deleted successfully."
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :priority, :completed)
  end
end
