# Used to calculate interst in recurring depost
# Interest : in percentage
# Term : in months
class RecuringDeposit
  def initialize amount, interest, term
    @amount = amount
    @interest = interest/100.0
    @term = term
  end
  
  # Total amount one would get deposit + interest 
  def recuring iteration = @term
    return (@amount + @amount*@interest) if iteration == 0
    (@amount + recuring(iteration-1))*@interest + @amount*iteration
  end

  # Total interest
  def earning
    recuring - @amount*@term
  end

  # %return one would get
  def return
    earning/(@amount*@term)
  end
end

savings = RecuringDeposit.new(ARGV[0].to_i, ARGV[1].to_i,  ARGV[2].to_i)

puts savings.recuring.round(2)
puts savings.return.round(4)
