class ArticlesController < ApplicationController

	before_action :set_article, only: [:edit, :update, :destroy, :show]
	def new
      @article = Article.new
	end

	def create
		#if you want to display the passed data to create 
		#action
		
		@article = Article.new(article_params)
		if @article.save
		  flash[:notice] = "Article was successfully created"
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
			flash[:notic] = "Article was successfully updated"
			redirect_to article_path(@article)
		else
			render 'edit'
			
		end

	end

	def index
		@articles = Article.all


	end

	def destroy
		
		if @article.destroy
			flash[:notic] = "Article was successfully deleted"
            redirect_to articles_path
        else
        	render 'index'
        end

	end


	private 
	  def set_article
	  	@article = Article.find(params[:id])
	  end
	  def article_params
	    params.require(:article).permit(:title, :description)
	  end

end