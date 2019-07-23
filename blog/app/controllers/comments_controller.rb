class CommentsController < ApplicationController

  # simple http authentication
  http_basic_authenticate_with name: "admin",
  password: "1234",
  only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comments_params)
    redirect_to article_path(@article)
  end
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private def comments_params
    params.require(:comment).permit(:commenter, :body)
  end
end
