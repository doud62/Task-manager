class TasksController < ApplicationController
  def index
    @project = current_user.projects.find(params[:project_id])
    @tasks = @project.tasks
  end

  def new
    @project = current_user.projects.find(params[:project_id])
    @task = @project.tasks.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @project = current_user.projects.find(params[:project_id])
    @task = @project.tasks.new(task_params)
    @task.save

    if @task.save
      redirect_to project_task_path(@project, @task)
    else
      render :new
    end
  end

  def edit
    @project = current_user.projects.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @project = @task.project_id
    if @task.update(task_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @project = @task.project_id
    @task.destroy!
    
    redirect_to project_path(@project)
  end

  private

  def task_params
    params.require(:task).permit(:name, :text, :date, :done, :project_id)
  end
end
