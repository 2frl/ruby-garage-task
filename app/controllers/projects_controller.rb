class ProjectsController < ApplicationController
  def create
    @project = current_user.projects.new()
    @project.save
    respond_to do |format|
      format.js {}
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    @projects = current_user.projects.all()
    respond_to do |format|
      format.js {}
    end
  end

  def edit
    @project = Project.find(params[:id])
    respond_to do |format|
      format.js {}
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    @projects = current_user.projects.all()
    respond_to do |format|
      format.js { render "destroy.js.erb" }
    end
  end


  private
    def project_params
      params.require(:project).permit(:name, :id)
    end
end
