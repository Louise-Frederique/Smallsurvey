class ChoicesController < ApplicationController
  def new
  	@question = Question.find(params[:question_id])
  	@choice = Choice.new
  end

  def create
  	question = Question.find params[:question_id]
  	@choice = question.choices.new(choice_params)
  	
  	@choice.save!
  	redirect_to questions_path
  end

  def choice_params
      params.require(:choice).permit(:title, :order)
    end
end