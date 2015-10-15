class TasksController < ApplicationController

  def create
    @project=Project.find(params[:project_id])
    #@task=@project.tasks.create(task_params)

    @task=Task.new(task_params)
    @task.project_id=@project.id

    if @task.save
      redirect_to @project
    else
      render 'projects/show'
      # redirect_to root_path
    end
  end

  def edit
  	@project=Project.find(params[:project_id])
  	# @task=@project.tasks.find(params[:id])
  end

  def update
    @project=Project.find(params[:project_id])
    @task=@project.tasks.find(params[:id])

    if @task.update_attributes(task_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def update_finish
    @project=Project.find(params[:project_id])
    @task=@project.tasks.find(params[:id])

    @task.toggle(:finish).save
    head 204
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
