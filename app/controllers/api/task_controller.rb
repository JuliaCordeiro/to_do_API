class Api::TaskController < ApplicationController
  def create
    task = Task.new(task_params)

    if task.save
      render json: {status: 'SUCCESS', message:'Saved task', data:task},status: :ok
    else
      render json: {status: 'ERROR', message:'Task not saved', data:task.errors},status: :unprocessable_entity
    end
  end

  def index
    tasks = Task.order('created_at ASC')
    render json: {status: 'SUCCESS', message:'Find all tasks', data:tasks},status: :ok
  end

  def update
    task = Task.find(params[:id])

    if task.update_attribute(:isDone, task_status)
      render json: {status: 'SUCCESS', message:'Updated task', data:task},status: :ok
    else
      render json: {status: 'ERROR', message:'Task not updated', data:task.errors},status: :unprocessable_entity
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    render json: {status: 'SUCCESS', message:'Deleted task', data:task},status: :ok
  end

  private

  def task_status
    params.permit(:isDone)
  end

  def task_params
    params.permit(:description, :isUrgent, :isDone)
  end
end
