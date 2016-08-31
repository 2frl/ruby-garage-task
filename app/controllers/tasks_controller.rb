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
    @project = @task.project
    @task.destroy
    respond_to do |format|
      format.js { render "create.js.erb" }
    end
  end

  def moveup
    @task = Task.find(params[:id])
    @project = @task.project
    @task.move_higher
    respond_to do |format|
      format.js {render "create.js.erb"}
    end
  end

  def edit
    @task = Task.find(params[:id])
    respond_to do |format|
      format.js {}
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    @project = @task.project
    respond_to do |format|
      format.js { render "create.js.erb" }
    end
  end

  def movedown
    @task = Task.find(params[:id])
    @project = @task.project
    @task.move_lower
    respond_to do |format|
      format.js {render "create.js.erb"}
    end
  end

  def progress
    progress = params[:task_params] != true && params[:task_params] != false ? false :  params[:task_params]
    @task = Task.find(params[:id])
    @task.update_attribute(:progress, params[:task_params])
    render nothing: true
  end


  private

  def task_params
    params.require(:task).permit(:name, :progress, :id, :project_id)
  end
end
