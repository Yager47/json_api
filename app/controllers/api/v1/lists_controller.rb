module Api::V1
  class ListsController < ApplicationController
    before_action :set_list, only: [:show, :update, :destroy]

    def index
      @lists = List.all

      render json: @lists
    end

    def show
      render json: @list
    end

    def create
      @list = List.new(list_params)

      if @list.save
        render json: @list, status: :created
      else
        render json: @list.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /lists/1
    def update
      if @list.update(list_params)
        render json: @list
      else
        render json: @list.errors, status: :unprocessable_entity
      end
    end

    # DELETE /lists/1
    def destroy
      if @list.destroy
        head :no_content, status: :ok
      else
        render json: @list.errors, status: :unprocessable_entity
      end
    end

    private

    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:title, :excerpt, :description, :upvotes)
    end
  end
end
