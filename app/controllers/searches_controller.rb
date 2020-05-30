require 'net/http'

class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :update, :destroy]

  # GET /searches
  def index
    # @searches = Search.all

    net = Net::HTTP.new("trefle.io", 443)
    net.use_ssl = true
    response = net.get("/api/plants?token=ZlF4c04zeTMzVXJ5RUVXT2huUmNRUT09")

    render json: response.body
  end

  # GET /searches/1
  def show
    render json: @search
  end

  # POST /searches
  def create
    @search = Search.new(search_params)

    if @search.save
      render json: @search, status: :created, location: @search
    else
      render json: @search.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /searches/1
  def update
    if @search.update(search_params)
      render json: @search
    else
      render json: @search.errors, status: :unprocessable_entity
    end
  end

  # DELETE /searches/1
  def destroy
    @search.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def search_params
      params.fetch(:search, {})
    end
end
