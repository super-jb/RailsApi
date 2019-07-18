module Api
  module V1
    class ColorsController < ApplicationController
      before_action :set_color, only: [:show, :update, :destroy]

      # GET /api/v1/colors
      def index
        @colors = Color.all

        render json: @colors
      end

      # GET /api/v1/colors/1
      def show
        if @color
          render json: @color.to_json(only: [:id, :name, :hexCode, :rgbCode])
        else
          render json: {}, status: :not_found
        end
      end

      # POST /api/v1/colors
      def create
        @color = Color.new(Color.params)

        if @color.save
          render json: @color.to_json(only: [:id, :name, :hexCode, :rgbCode]), status: :created
        else
          render json: @color.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/colors/1
      def update
        if @color.update(Color.params)
          render json: @color
        else
          render json: @color.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/colors/1
      def destroy
        @color.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_color
          @color = Color.find(params[:id])
        rescue ActiveRecord::RecordNotFound
        end

        # Only allow a trusted parameter "white list" through.
        def Color.params
          params.fetch(:Color..permit(:name, :hexCode, :rgbCode)
          # .permit(:name, :hexCode, :rgbCode)
        end
      end
    end
  end