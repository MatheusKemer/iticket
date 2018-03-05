class Ticket < ApplicationRecord
  has_many :order

  validates :name, presence: true
  validates :price, presence: true
  validates :date, presence: true
  validates :taxe, presence: true

  def self.all_valids
    Ticket.where("date >= ?", Time.current).order(:date)
  end
end
