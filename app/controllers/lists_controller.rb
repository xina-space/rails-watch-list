class ListsController < ApplicationController
   before_action :set_list, only: [:show, :destroy]

  # GET /restaurants
  def index
    @lists = List.all
  end

  # GET /lists/1
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end


  # POST /lists
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'Watchlist was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /restaurants/1
  def update
    if @list.update(list_params)
      redirect_to @list, notice: 'Watchlist was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /restaurants/1
  def destroy
    @list.destroy
    # redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def list_params
    params.require(:list).permit(:name)
  end
end
