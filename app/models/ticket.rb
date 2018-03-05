class Ticket < ApplicationRecord
  has_many :order
  def self.all_valids
    Ticket.where("date >= ?", Time.current).order(:date)
  end
end
