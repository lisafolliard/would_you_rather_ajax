class AnswersController < ApplicationController
  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])

    if params[:upVoteAction] == "upvote"
      @answer.upvote
      redirect_to root_path
    end
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new()
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:answer)
  end
end
