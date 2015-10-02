class TicketsController < ApplicationController


  def index
    @in_progress_tickets = Ticket.in_progress
    @completed_tickets   = Ticket.completed
    @backlog_tickets     = Ticket.backlog
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new params[:ticket]
    if @ticket.save
      flash[:notice] = 'Ticket was successfully created.'
    else
      flash[:error] = 'There was an error saving the ticket.'
    end

    respond_with @ticket, location: tickets_path
  end

  def edit
    @ticket = Ticket.find params[:id]
  end

  def update
    @ticket = Ticket.find params[:id]
    if @ticket.update_attributes params[:ticket]
      flash[:notice] = 'Ticket was successfully updated.'
    else
      flash[:error] = 'There was an error updating the ticket.'
    end

    respond_with @ticket, location: tickets_path
  end

  def destroy
    @ticket = Ticket.find params[:id]
    @ticket.destroy
    flash[:notice] = 'Ticket was successfully deleted.'

    respond_with @ticket, location: tickets_path
  end
end
