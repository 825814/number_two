削除予定
# class Admin::UsersController < ApplicationController
#   def new
#     @user = User.new
#   end

#   def create
#     user = User.new(user_params)
#     if user.save!
#       redirect_to '/admin/admin', notice: '投稿しました。'
#       # あとでイメージを表示するページを作って遷移するように変更する
#     else
#       render :new

#     end
#   end



#   private
#   def user_params
#     params.require(:user).permit(:title, :body, :image)
#   end
# end
