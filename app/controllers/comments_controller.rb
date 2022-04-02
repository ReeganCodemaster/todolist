class CommentsController < ApplicationController
    def update
        @todo = Todo.find(params[:id])
        @comment = @todo.comments.create()

        redirect_to todo_path(@todo)
    end

    private
    def comment_params
        params.require(:comment).permit(:person, :body)
    end
end
