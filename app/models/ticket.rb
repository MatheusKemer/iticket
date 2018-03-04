class Ticket < ApplicationRecord

  def self.all_valids
    Ticket.where("date >= ?", Time.current).order(:date)
  end
end
