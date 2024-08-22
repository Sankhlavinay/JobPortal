class Company::JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @jobs = current_company.jobs
  end

  def new
    @job = current_company.jobs.new
  end

  def create
    @job = current_company.jobs.new(job_params)
    if @job.save
      redirect_to company_jobs_path, notice: 'Job has been Created successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @job = current_company.jobs.find_by(uuid: params[:id])
  end

  def update
    @job = current_company.jobs.find_by(uuid: params[:id])
    if @job.update(job_params)
      redirect_to company_job_path
    else
      render :edit
    end
  end

  def show
    @job = current_company.jobs.find_by(uuid: params[:id])
  end

  def destroy
    @job = current_company.jobs.find_by(uuid: params[:id])
    if @job.destroy
      redirect_to company_jobs_path, notice: 'Job has been updated successfully'
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :posted_by_id, :applicable_for, :job_type, :job_location, :salary_range, :total_positions, :status)
  end
end
