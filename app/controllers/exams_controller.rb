class ExamsController < ApplicationController
 before_action :set_exam, only: [:edit, :update, :destroy]
 
 def index
  @exams = Exam.all
 end
  
 def new
  if params[:back]
   @exam = Exam.new(exams_params)
  else 
   @exam = Exam.new
  end 
 end
  
 def create
  @exam = Exam.new(exams_params)
  if @exam.save
   redirect_to exams_path, notice: "投稿を作成しました！"
  else
   render'new'
  end 
 end
 
 def edit
  @exam = Exam.find(params[:id])
 end
 
 def update
  @exam = Exam.find(params[:id])
  if @exam.update(exams_params)
   redirect_to exams_path, notice: "投稿を更新しました！"
  else
   render'edit'
  end 
 end
 
 def destroy
  @exam = Exam.find(params[:id])
  @exam.destroy
  redirect_to exams_path, notice: "投稿を削除しました！"
 end
 
 def confirm
  @exam = Exam.new(exams_params)
  render :new if @exam.invalid?
 end 
 
 private
  def exams_params
   params.require(:exam).permit(:content)
  end
  
  def set_exam
   @exam = Exam.find(params[:id])
  end 
end
