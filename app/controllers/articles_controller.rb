class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to :root
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :edit
    end
end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to :root
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
