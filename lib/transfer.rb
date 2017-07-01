require 'bank_account.rb'
require 'pry'

class Transfer
	attr_accessor :status
  
  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@status = 'pending'
  	@amount = amount
  end

  def sender
  	@sender
  end

  def receiver
  	@receiver
  end

  def status
  	@status
  end
  
  def amount
  	@amount
  end

  def valid?
  	@receiver.valid? && @sender.valid?
  end

  def execute_transaction
  	if @sender.balance >= @amount && self.status == 'pending'
  		@sender.balance -= @amount
  		receiver.balance += @amount
		self.status = 'complete'
	else
  		self.status = 'rejected'
  		'Transaction rejected. Please check your account balance.'
  	end

  end

  def reverse_transfer
  	if self.status == 'complete'
  		receiver.balance -= @amount
  		@sender.balance += @amount
  		self.status = 'reversed'
  	end
  end
end
