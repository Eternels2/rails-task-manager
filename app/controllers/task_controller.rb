# frozen_string_literal: true

class TaskController < ApplicationController
  before_action :find_task, only: %i[destroy show edit update]

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def edit
    find_task
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to index_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to index_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
