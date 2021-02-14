class ArticlesController < ApplicationController

  before_action :_set_article_with_id, only: [:edit, :update, :destroy, :show] 
  def destroy
    @article.destroy
    redirect_to articles_path, notice:"投稿を削除しました！"
  end

  def edit
  end

  def update

    if @article.update(_article_params)
      redirect_to edit_article_path, notice: "投稿を編集しました!"
    else
      notice='保存に失敗しました'
      render :edit
    end
  end

  def index
    if (current_user)
      @user_articles_url = articles_path + '?self_articles=1'
      if params[:self_articles] && params[:self_articles]=='1'
        @articles = Article.where(user_id: current_user.id).order(updated_at: 'DESC')
        @self_articles=true;
      else
        @articles = Article.all.order(updated_at: 'DESC')
        @self_articles=false;
      end
    else
      authenticate_user
    end
  end

  def new
    if (current_user)
      @article = Article.new
    else
      authenticate_user
    end
  end

  def confirm
    @article=Article.new(_article_params)
    render :new if @article.invalid?
  end

  def create
    @article = Article.new(_article_params)
    if params[:back]
      render :new
    else
      if @article.save
        redirect_to articles_path, notice: '投稿を保存しました!'
      else
        notice='保存に失敗しました'
        render :new
      end
    end
  end

  def show
  end

  private
  def _article_params
    params.require(:article).permit(:user_id, :content, :image, :image_cache, :remove_image)
  end

  def _set_article_with_id
    @article=Article.find(params[:id])
  end
end
