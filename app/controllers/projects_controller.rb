class ProjectsController < ApplicationController

	def index
      @projects=Project.order(created_at: :desc)
	end

	def show
      @project=Project.find(params[:id])
	end

	def new
	  @project=Project.new
	end

	def create
	  @project=Project.new(project_params)

	  if @project.save
	  	redirect_to @project
	  else
	  	render 'new'
	  end
	end

	def edit
	  @project=Project.find(params[:id])
	end

	def update
	  @project=Project.find(params[:id])
      @project.update_attributes(project_params)
      redirect_to @project
	end

	def destroy
      @project=Project.find(params[:id])
      @project.destroy
      redirect_to projects_path
	end

	private
	def project_params
      params.require(:project).permit(:name,:date,:description)
	end
end
