class JobsController < ApplicationController
  def index
    if params[:type].present?
      @q = Job.active_jobs.send("#{params[:type]}_jobs").ransack(params[:q])
      @jobs = @q.result
    else
      @q = Job.active_jobs.ransack(params[:q])
      @jobs = @q.result
    end
  end

  def show
    @job = Job.find_by(uuid: params[:id])
  end
end
