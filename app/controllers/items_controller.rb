class ItemsController < ApplicationController
  # ログインしていないユーザーはログインページに促す
  # before_action :authenticate_user!, except: [:index, :show]

  # 重複処理をまとめる
  # before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
  end

end
