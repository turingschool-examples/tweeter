class PostersController < ApplicationController
  # GET /posters
  # GET /posters.json
  def index
    @posters = Poster.all

    render json: @posters
  end

  # GET /posters/1
  # GET /posters/1.json
  def show
    @poster = Poster.includes(:tweets).find(params[:id])

    render json: @poster
  end

  # POST /posters
  # POST /posters.json
  def create
    @poster = Poster.new(poster_params)

    if @poster.save
      render json: @poster, status: :created, location: @poster
    else
      render json: @poster.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posters/1
  # PATCH/PUT /posters/1.json
  def update
    @poster = Poster.find(params[:id])

    if @poster.update(poster_params)
      head :no_content
    else
      render json: @poster.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posters/1
  # DELETE /posters/1.json
  def destroy
    @poster = Poster.find(params[:id])
    @poster.destroy

    head :no_content
  end

  private

    def poster_params
      params.require(:poster).permit(:name)
    end
end
