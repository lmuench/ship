# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[show edit update destroy].concat(Ticket.aasm.events.map(&:name))

  # GET /tickets
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  def show; end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit; end

  # POST /tickets
  def create
    @ticket = Ticket.new(
      ticket_params.merge(creator_id: current_user.id)
    )
    if @ticket.save
      redirect_to tickets_url, notice: 'Ticket was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tickets/1
  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: 'Ticket was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tickets/1
  def destroy
    @ticket.destroy
    redirect_to tickets_url, notice: 'Ticket was successfully destroyed.'
  end

  # Events
  Ticket.aasm.events.map(&:name).each do |event|
    define_method event do
      @ticket.public_send "#{event}!"
      redirect_to @ticket
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ticket_params
    params
      .require(:ticket)
      .permit(:title, :description, :category, :priority, :assignee_id)
  end
end
