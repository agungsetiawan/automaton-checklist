class TasksController < ApplicationController

  def create
    @project=Project.find(params[:project_id])
    @task=@project.tasks.create(task_params)
    redirect_to @project
  end

  def edit
  	@project=Project.find(params[:project_id])
  	# @task=@project.tasks.find(params[:id])
  end

  def update
    @project=Project.find(params[:project_id])
    @task=@project.tasks.find(params[:id])
    @task.update_attributes(task_params)
    redirect_to @project
  end

  def destroy
    @project=Project.find(params[:project_id])
    @task=@project.tasks.find(params[:id])
    @task.destroy
    redirect_to @project
  end

  private
  def task_params
    params.require(:task).permit(:body)
  end

end
