class TodoitemsController < ApplicationController
  before_action :set_todoitem, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token  


  # GET /todoitems
  # GET /todoitems.json
  def index
    @todoitems = Todoitem.all
    render json: @todoitems
  end

  # GET /todoitems/1
  # GET /todoitems/1.json
  def show
    render json: @todoitem
  end

  
  # POST /todoitems
  # POST /todoitems.json
  def create
    @todoitem = Todoitem.new(todoitem_params)
      if @todoitem.save
        render json: @todoitem, status: :created
      else
        render json: @todoitem.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /todoitems/1
  # PATCH/PUT /todoitems/1.json
  def update
    if @todoitem.update(todoitem_params)
       render :show, status: :accepted, location: @todoitem
    else
       render json: @todoitem.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todoitems/1
  # DELETE /todoitems/1.json
  def destroy
    @todoitem.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todoitem
      @todoitem = Todoitem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todoitem_params
      params.require(:todoitem).permit(:title, :description)
    end
end
