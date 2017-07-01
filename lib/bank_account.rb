require "transfer.rb"

class BankAccount

	attr_accessor :balance, :status

	def initialize(name)
		@name = name
		@balance = 1000
		@status = 'open'
	end

	def name
		@name
	end

	def balance
		@balance
	end

	def status
		@status
	end

	def deposit(money)
		self.balance += money
	end

	def display_balance
		"Your balance is $#{self.balance}."
	end

	def valid?
		self.status == 'open' && self.balance > 0
	end

	def close_account
		self.status = 'closed'
	end
end
