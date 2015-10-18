class TasksController < ApplicationController

  before_action :require_login
  before_action :select_project_task, except: [:create]

  def create
    #@task=@project.tasks.create(task_params)
    @project=current_user.projects.find_by_id(params[:project_id])
    return redirect_to root_path unless @project

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
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def update_finish
    @task.toggle(:finish).save
    head 204
  end

  def destroy
    @task.destroy
    redirect_to @project
  end

  private
  def task_params
    params.require(:task).permit(:body)
  end

  def select_project_task
    @project=current_user.projects.find_by_id(params[:project_id])
    return redirect_to root_path unless @project

    @task=@project.tasks.find(params[:id])
  end

end
