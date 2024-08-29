class JobsController < ApplicationController
  def index
    if params[:type].present?
      @jobs = Job.includes(:company).send("#{params[:type]}_jobs").active_jobs
    else
      @jobs = Job.includes(:company).active_jobs.find_each
    end
  end

  def show
    @job = Job.find_by(uuid: params[:id])
  end
end
