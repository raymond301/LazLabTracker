class AliquotsController < ApplicationController
  before_action :set_aliquot, only: [:show, :edit, :update, :destroy]

  # GET /aliquots
  # GET /aliquots.json
  def index
    @aliquots = Aliquot.all
  end

  # GET /aliquots/1
  # GET /aliquots/1.json
  def show
  end

  # GET /aliquots/new
  def new
    @aliquot = Aliquot.new
  end

  # GET /aliquots/1/edit
  def edit
  end

  # POST /aliquots
  # POST /aliquots.json
  def create
    @aliquot = Aliquot.new(aliquot_params)

    respond_to do |format|
      if @aliquot.save
        format.html { redirect_to @aliquot, notice: 'Aliquot was successfully created.' }
        format.json { render :show, status: :created, location: @aliquot }
      else
        format.html { render :new }
        format.json { render json: @aliquot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aliquots/1
  # PATCH/PUT /aliquots/1.json
  def update
    respond_to do |format|
      if @aliquot.update(aliquot_params)
        format.html { redirect_to @aliquot, notice: 'Aliquot was successfully updated.' }
        format.json { render :show, status: :ok, location: @aliquot }
      else
        format.html { render :edit }
        format.json { render json: @aliquot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aliquots/1
  # DELETE /aliquots/1.json
  def destroy
    @aliquot.destroy
    respond_to do |format|
      format.html { redirect_to aliquots_url, notice: 'Aliquot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aliquot
      @aliquot = Aliquot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aliquot_params
      params.fetch(:aliquot, {})
    end
end
