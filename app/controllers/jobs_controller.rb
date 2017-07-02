class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.save
      flash[:notice] = "Job created"
      redirect_to jobs_path
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
      flash[:notice] = "Job Updated"
      redirect_to jobs_path
    else
      render :new
    end
  end

  def destroy
    @job = Job.find(params[:id])

    @job.destroy
    flash[:alert] = "Job Deleted"
      redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end


end
