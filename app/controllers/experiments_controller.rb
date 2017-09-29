class ExperimentsController < ApplicationController
  def index
  end

  def new
    @experiment = Experiment.new
  end

  def create
    @experiment = Experiment.new(post_params)
  end

  private

  def post_params
    params.require(:experiment).permit(:title, :content)
  end
end
