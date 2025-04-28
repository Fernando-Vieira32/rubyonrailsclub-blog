# frozen_string_literal: true

module Administrate
  class CategoriesController < AdministrateController
    #before_action :set_article, only: %i[destroy_cover_image show edit update destroy]
    #before_action :set_categories, only: %i[show edit new]

    def index
      @categories = Category.all
    end

    #def show; end

    #def new
    #  @article = Article.new
    #end

    #def edit; end

    #def create
    #  @article = Article.new(article_params)
#
    #  respond_to do |format|
    #    if @article.save
    #      format.html { redirect_to [:administrate, @article], notice: 'Artigo criado com sucesso .' }
    #      format.json { render :show, status: :created, location: @article }
    #    else
    #      format.html { render :new, status: :unprocessable_entity }
    #      format.json { render json: @article.errors, status: :unprocessable_entity }
    #    end
    #  end
    #end

    #def update
    #  respond_to do |format|
    #    if @article.update(article_params)
    #      format.html { redirect_to [:administrate, @article], notice: 'Artigo atualizado com sucesso.' }
    #      format.json { render :show, status: :ok, location: @article }
    #    else
    #      format.html { render :edit, status: :unprocessable_entity }
    #      format.json { render json: @article.errors, status: :unprocessable_entity }
    #    end
    #  end
    #end

    #def destroy
    #  @article.destroy!
#
    #  respond_to do |format|
    #    format.html do
    #      redirect_to administrate_articles_path, status: :see_other, notice: 'Artigo excluído com sucesso.'
    #    end
    #    format.json { head :no_content }
    #  end
    #end

    #def destroy_cover_image
    #  @article.cover_image.purge
    #  respond_to do |format|
    #    format.turbo_stream { render(turbo_stream: turbo_stream.remove(@article)) }
    #  end
    #end

    private

    #def set_categories
    #  @categories = Category.all
    #end#
#
    #def set_article
    ##  @article = Article.friendly.find(params[:id])
    #end

    #def article_params
    #  params.require(:article).permit(:title, :body, :cover_image, :category_id)
    #end
  end
end
