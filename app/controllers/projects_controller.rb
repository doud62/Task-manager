class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    find_project
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

  def edit
    @project = current_user.projects.find(params[:id])
  end

  def update
    @project = current_user.projects.find(params[:id])
    if @project.update(project_params)
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    find_project
    @project.destroy!
    
    redirect_to projects_path
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, user_id: current_user.id)
  end
end
