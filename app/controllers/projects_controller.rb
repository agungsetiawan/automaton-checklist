class ProjectsController < ApplicationController

	before_action :require_login

	def index
	  #Project.order(created_at: :desc) #collect all projects, doesn't mind the owner
      @projects=current_user.projects.order(created_at: :desc) 
	end

	def show
      #@project=Project.find(params[:id]) #throw an exception if record not found
      @project=current_user.projects.find_by_id(params[:id])
      redirect_to root_path unless @project
	end

	def new
	  @project=Project.new
	end

	def create
	  #@project=Project.new(project_params)
      
      @project=current_user.projects.build(project_params)

	  if @project.save
	  	redirect_to @project
	  else
	  	render 'new'
	  end
	end

	def edit
	  #@project=Project.find(params[:id])
	  @project=current_user.projects.find_by_id(params[:id])
	  redirect_to root_path unless @project
	end

	def update
	  #@project=Project.find(params[:id])
	  @project=current_user.projects.find_by_id(params[:id])
	  redirect_to root_path unless @project

      if @project.update_attributes(project_params)
        redirect_to @project
      else
      	render 'edit'
      end
	end

	def destroy
      #@project=Project.find(params[:id])
      @project=current_user.projects.find_by_id(params[:id])
      redirect_to root_path unless @project

      @project.destroy
      redirect_to projects_path
	end

	private
	def project_params
      params.require(:project).permit(:name,:date,:description)
	end
end
