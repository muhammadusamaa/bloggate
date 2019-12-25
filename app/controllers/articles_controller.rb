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

	
	def edit
    @article = Article.find(params[:id])
    redirect_to  articles_path unless signed_in_user?(@article) 
  end


  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

	
  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article
    else
     render 'new'
    end
  end
 
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
    
  private
  def article_params
    params.require(:article).permit(:title, :text, :user_id)
  end
    
  def signed_in_user?(article)
    current_user.id == article.user_id
  end
end
