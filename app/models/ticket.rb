class Ticket < ActiveRecord::Base
  POINTS = [1,2,3,5,8,13,20,50,100].freeze
  STATES = [:backlog, :in_progress, :completed].freeze

  attr_accessor :description, :points, :state, :title

  attr_accessor :state

  validates :points, inclusion: { in: POINTS }
  validates :title, presence: true
  validates :state, inclusion: { in: STATES }

  def self.backlog
    where status: Ticket.status(:backlog)
  end

  def self.in_progress
    where status: Ticket.status(:in_progress)
  end

  def self.completed
    where status: Ticket.status(:completed)
  end

  def self.status state
    STATES.index state
  end

  def self.state status
    STATES[status] if status
  end

  def state
    Ticket.state(status)
  end

  def state= state
    self.status = Ticket.status(state.to_sym)
  end

  
end
