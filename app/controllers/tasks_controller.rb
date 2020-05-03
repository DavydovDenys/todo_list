class TasksController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
  
    @task = @project.tasks.where(completed: false).order('priority DESC')
    @completed_tasks = @project.tasks.where(completed: true).order('updated_at')
  end

  def new
    @project = Project.find(params[:project_id])
  
    @task = @project.tasks.new
  end

  def create 
    @project = Project.find(params[:project_id])
  
    @task = @project.tasks.create(task_params)

    if @task.save
      flash[:notice] = 'Successfully created!'
      
      redirect_to project_tasks_path(@project) 
    else
      render action: :new 
    end
  end

  def show
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end
    
  def complete
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.complete!

    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:project_id])
    
    @task = @project.tasks.find(params[:id])
    @task.destroy
    
    redirect_to project_path(@project)
  end

  private

  def task_params
    params.require(:task).permit([:title, :priority, :completed])
  end  

end
