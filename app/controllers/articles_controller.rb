class ArticlesController < ApplicationController
   before_action :set_article, only: [:edit, :update, :show, :destroy]
   
    
  def new
     @article=Article.new
  end 
   
  def create
      @article=Article.new(article_params)
      if @article.save
        redirect_to article_path(@article)
        flash[:success] = "Article was successfully created"
      else
         render :new
      end
  end
  
  def edit
    
  end
  
  def show
    
  end
  
  def update
    if @article.update(article_params)
      redirect_to article_path(@article)
      flash[:success]="Article updated!"
    else
      render :edit
    end
  end
  
  def index
    @articles=Article.all
  end
  
  def destroy
    
    @article.destroy
    flash[:success]="Article deleted"
    redirect_to articles_path
  end
  
  private
    def article_params
        params.require(:article).permit(:title, :description)
    end
  
    def set_article
      @article = Article.find(params[:id])
    end
   
end