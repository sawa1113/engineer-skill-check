class NoticesController < ApplicationController
  before_action :set_notice, only: %i(edit update destroy)

  def index
    @notices = Notice.active.order("#{sort_column} #{sort_direction}")
  end

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notice_params)

    if @notice.save
      redirect_to notices_url, notice: "お知らせ「#{@notice.title}」を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @notice.update(notice_params)
      redirect_to notices_url, notice: "お知らせ「#{@notice.title}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @notice = Notice.find(params["id"])

    if @notice.destroy
      redirect_to notices_url, notice: "お知らせ「#{@notice.title}」を削除しました。"
    else
      render :edit
    end
  end

  private

  def notice_params
    params.require(:notice).permit(:title, :content)
  end

  def set_notice
    @notice = Notice.find(params["id"])
  end

  def sort_column
    params[:sort] ? params[:sort] : 'updated_at'
  end

  def sort_direction
    params[:direction] ? params[:direction] : 'asc'
  end
end

