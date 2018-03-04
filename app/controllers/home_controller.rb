class HomeController < ApplicationController
  def index
    @tickets = Ticket.all_valids
  end
end