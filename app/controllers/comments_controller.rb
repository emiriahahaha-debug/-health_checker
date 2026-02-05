class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to result_health_checks_path, notice: "コメントを投稿しました😊"
    else
      redirect_to result_health_checks_path, alert: "コメントを入力してください"
    end
  end
def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to result_health_checks_path, notice: "コメントを消しちゃいました 🗑️"
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to result_health_checks_path, notice: "コメントを直したよ！ ✨"
    else
      render :edit
    end
  end
end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
