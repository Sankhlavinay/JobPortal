class JobsController < ApplicationController
  def index
    if params[:type].present?
      @q = Job.includes(:company).send("#{params[:type]}_jobs").active_jobs.ransack(params[:q])
    else
      @q = Job.includes(:company).active_jobs.ransack(params[:q])
    end
      @jobs = @q.result
  end

  def show
    @job = Job.find_by(uuid: params[:id])
  end
end
