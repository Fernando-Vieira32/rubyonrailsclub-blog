# frozen_string_literal: true

module Administrate
  class CategoriesController < AdministrateController
    before_action :set_category, only: %i[show edit update destroy]

    def index
      @categories = Category.all
    end

    def show; end

    def new
      @category = Category.new
    end

    def edit; end

    def create
      @category = Category.new(category_params)

      respond_to do |format|
        if @category.save
          format.html { redirect_to [:administrate, @category], notice: 'Category criado com sucesso .' }
          format.json { render :show, status: :created, location: @category }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to [:administrate, @category], notice: 'Categoria atualizado com sucesso.' }
          format.json { render :show, status: :ok, location: @category }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      respond_to do |format|
        format.html do
          if @category.articles.empty?
            @category.destroy!
            redirect_to administrate_categories_path, status: :see_other, notice: 'Categoria excluído com sucesso.'
          else
            redirect_to administrate_categories_path, status: :see_other,
                                                      alert: 'Não foi possível excluir a categoria, categoria tem artigos associados.'
          end
        end
        format.json { head :no_content }
      end
    end

    private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
  end
end
