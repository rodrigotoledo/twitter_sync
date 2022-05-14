class TwitterMessagesController < ApplicationController
  before_action :set_twitter_messsage, only: %i[ show edit update destroy ]

  # GET /twitter_messages or /twitter_messages.json
  def index
    @twitter_messages = TwitterMessage.all
  end

  # GET /twitter_messages/1 or /twitter_messages/1.json
  def show
  end

  # GET /twitter_messages/new
  def new
    @twitter_messsage = TwitterMessage.new
  end

  # GET /twitter_messages/1/edit
  def edit
  end

  # POST /twitter_messages or /twitter_messages.json
  def create
    @twitter_messsage = TwitterMessage.new(twitter_messsage_params)

    respond_to do |format|
      if @twitter_message.save
        format.html { redirect_to twitter_messsage_url(@twitter_messsage), notice: "twitter_messsage was successfully created." }
        format.json { render :show, status: :created, location: @twitter_messsage }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @twitter_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twitter_messages/1 or /twitter_messages/1.json
  def update
    respond_to do |format|
      if @twitter_message.update(twitter_messsage_params)
        format.html { redirect_to twitter_messsage_url(@twitter_messsage), notice: "twitter_messsage was successfully updated." }
        format.json { render :show, status: :ok, location: @twitter_messsage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @twitter_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twitter_messages/1 or /twitter_messages/1.json
  def destroy
    @twitter_message.destroy

    respond_to do |format|
      format.html { redirect_to twitter_messages_url, notice: "twitter_messsage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twitter_messsage
      @twitter_messsage = TwitterMessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def twitter_messsage_params
      params.require(:twitter_messsage).permit(:twitter_messsagename)
    end
end
