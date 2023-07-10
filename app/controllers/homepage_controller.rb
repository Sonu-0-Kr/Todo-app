# class HomepageController < ApplicationController
#   def index

#   end
#   def all_todos
#     completed = Todo.where(completed: true)
#     pending = Todo.where(completed: false).order(:id)
#     render json: { completed: completed, pending: pending }
#   end

#   def update
#     todo = Todo.find(params[:id])
#     if todo.update_attributes!(todo_params)
#       render json: { message: "Todo Item updated successfully" }
#     else
#       render json: { message: "An error occured" }
#     end
#   end

#   def create
#     new_todo = Todo.create!(todo_params)
#     if new_todo
#       render json: { message: "Todo Item created successfully" }
#     else
#       render json: { message: "An error occured" }
#     end
#   end


#   private

#   def todo_params
#     params.require(:todo).permit(:id, :title, :completed)
#   end
# end

class HomepageController < ApplicationController
  before_action :set_recipe, only: %i[show destroy]

  def index

   end
  def all_todos
    completed = Todo.where(completed: true)
    pending = Todo.where(completed: false).order(:id)
    render json: { completed: completed, pending: pending }
  end

  def create
    new_todo = Todo.create!(todo_params)
    if new_todo
      render json: { message: "Todo Item created successfully" }
    else
      render json: { message: "An error occured" }
    end
  end

  def update
    todo = Todo.find(params[:id])
    if todo.update!(todo_params)
      render json: { message: "Todo Item updated successfully" }
    else
      render json: { message: "An error occured" }
    end
  end

  def show
    render json: @todo
  end

  def destroy
    @todo&.destroy
    render json: { message: 'todos deleted!' }
  end

  private

  def todo_params
    params.permit(:title,:completed)
  end

  def set_recipe
    @todo = Todo.find(params[:id])
  end
end

