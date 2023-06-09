class Admin::ChoicesController < ApplicationController
  before_action :authenticate_admin!
  # before_action :check_answer_existence, only: [:edit, :update, :destroy]

  def new
    @choice = Choice.new
  end

  def create
    @choice = Choice.new(choice_params)
    if @choice.save!
      flash[:notice] = "成功！"
      redirect_to "/admin/choices"
    else
      flash.now[:alert] = "失敗！"
      render "new"
    end
  end

  def index
    @choices = Choice.all
  end

  def edit
    @choice = Choice.find(params[:id])
    if @choice.answers.present?
      flash[:alert] = "回答があるため、編集できません。"
      redirect_to admin_choices_path
    end
  end

  def update
    @choice = Choice.find(params[:id])
    if @choice.update!(choice_params)
      flash[:notice] = "成功"
      redirect_to admin_choices_path
    else
      flash.now[:alert] = "失敗"
      render "edit"
    end
  end

  def destroy
    @choice = Choice.find(params[:id])
    if @choice.answers.empty?
      if @choice.destroy!
        flash[:notice] = "成功"
        redirect_to admin_choices_path
      else
        flash.now[:alert] = "失敗"
        render admin_choices_path
      end
    else
      # 選択肢に回答がある場合は削除しないように
      flash[:alert] = "この選択肢はすでに回答されているため、削除できません。"
      redirect_to admin_choices_path
    end
  end

  private
    def choice_params
      params.require(:choice).permit(:choice, :question_id)
    end

    # def check_answer_existence
    #   @choice = Choice.find(params[:id])
    #   if @Choice.answers.exists?
    #     flash[:alert] = "既に回答が存在するため、編集や削除はできません。"
    #     redirect_to admin_choices_path
    #   end
    # end



end
