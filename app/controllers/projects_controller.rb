class ProjectsController < ApplicationController

  def index 
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new 
    @project = Project.new
  end

  def create 
    @project = Project.new(project_params)
  
    if @project.save
      flash[:notice] = 'Successfully created!'
      
      redirect_to projects_path 
    else
      render action: :new 
    end
  end

  def edit 
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    
    if @project.update(project_params)
      flash[:notice] = 'Successfully updated!'
      redirect_to project_path(@project)
    else
      flash[:alert] = 'Something went wrong'
      
      redirect_to edit_project_path
    end
  end

  def destroy
    @project = Project.find(params[:id])
    
    @project.destroy
  
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

end
