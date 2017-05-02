class TodosController < ApplicationController
  def index
    @todos = Todo.all
    render json: @todos
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render json: @todo
    else
      render json: @todo, status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
    @todo = Todo.find(params[:id])
    render json: @todo
  end

  def destroy
    @todo = Todo.find(params[:id]).destroy
    head :no_content
  end

  private

  def todo_params
    params.permit(:description)
  end
end
