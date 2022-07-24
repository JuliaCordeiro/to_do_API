class Api::TaskController < ApplicationController
  def create
    task = Task.new(task_params)

    if task.save
      render json: {status: 'SUCCESS', message:'Saved task', data:task},status: :ok
    else
      render json: {status: 'ERROR', message:'Task not saved', data:task.errors},status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.permit(:description, :isUrgent, :isDone)
  end
end
