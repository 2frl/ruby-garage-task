class TasksController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(task_params)
    @task.save
    respond_to do |format|
      format.js {}
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @project = Project.find(@task.project_id)
    @task.destroy
    respond_to do |format|
      format.js { render "create.js.erb" }
    end
  end

  def moveup
    @task = Task.find(params[:id])
    @project = Project.find(@task.project_id)
    @task.move_higher
    respond_to do |format|
      format.js {render "create.js.erb"}
    end
  end

  def movedown
    @task = Task.find(params[:id])
    @project = Project.find(@task.project_id)
    @task.move_lower
    respond_to do |format|
      format.js {render "create.js.erb"}
    end
  end


  private

    def task_params
      params.require(:task).permit(:name, :id, :project_id)
    end
end
