class TodosController < ApplicationController

    http_basic_authenticate_with name:"Admin", password:"password00", except: [:index, :show]

    def index
        @todos = Todo.all
    end

    def show
        @todo = Todo.find(params[:id])
    end

    def new 
        @todo = Todo.new
    end

    def create
        @todo = Todo.new(todo_params)
        
        if @todo.save
            redirect_to @todo
        else
            render :new , status: :unprocessable_entity
        end
    end

    def edit
        @todo = Todo.find(params[:id])
    end

    def update
        @todo = Todo.find(params[:id])
        if @todo.update(todo_params)
            redirect_to @todo
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy

        redirect_to root_path ,status: :see_other
    end

    private
    def todo_params
        params.require(:todo).permit(:title, :body, :status)
    end
end
