class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save!
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy!
    
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, user_id: current_user.id)
  end
end
