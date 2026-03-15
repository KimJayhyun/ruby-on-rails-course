class ArticlesController < ApplicationController
  def show
    # debugger
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))

    if @article.save      # 성공하면 true, 실패하면 false
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity # 실패하면 폼으로 돌아가기
    end
  end
end
