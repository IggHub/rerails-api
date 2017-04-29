class TodosController < ApplicationController
  def index
    @todos = Todo.all
    render json: @todos
  end

  def new
  end

  def edit
  end

  def show
    @todo = Todo.find(params[:id])
    render json: @todo
  end
end
