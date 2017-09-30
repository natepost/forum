class ExperimentsController < ApplicationController
  before_action :find_experiment, only: [:show, :edit, :update, :destroy]

  def index
    @experiments = Experiment.all.order("created_at DESC")
  end

  def new
    @experiment = current_user.experiments.build
  end

  def show
  end

  def create
    @experiment = current_user.experiments.build(experiment_params)

    if @experiment.save
      redirect_to @experiment
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @experiment.update(experiment_params)
      redirect_to @experiment
    else
      render 'edit'
    end
  end

  def destroy
    @experiment.destroy
    redirect_to root_path
  end

  private

  def find_experiment
    @experiment = Experiment.find(params[:id])
  end

  def experiment_params
    params.require(:experiment).permit(:title, :content)
  end
end
