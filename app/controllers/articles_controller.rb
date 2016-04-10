class ArticlesController < ApplicationController

before_action :finding_articles, only: [:show, :edit, :update, :destroy]

  def index
  	@articles = Article.all
  end

  def new
	@article = Article.new
  end

  def create

  	@article = Article.new(article_params)
    @article.user = User.first
  	if @article.save
  	flash[:success] = "Article was successfull created"
  	redirect_to article_path(@article)
    else
    render 'new'	
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
    flash[:success] = "Article was successfull updated"
    redirect_to articles_path
	else
	render 'edit'
	end
  end

  def destroy
  	@article.destroy
    flash[:danger] = "Article was successfully deleted"
  	redirect_to articles_path
  end

private

  def finding_articles
  	@article = Article.find(params[:id])
  end

  def article_params
  	params.require(:article).permit(:name, :job_title, :description)
  end

end
