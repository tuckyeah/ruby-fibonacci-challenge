# fibonacci:
# 0 1 1 2 3 5 8 13
# the next num in the sequence is the sum of the previous two

class FibonacciRange
  include Enumerable

  attr_reader :start, :stop

  def initialize(stop)
    @stop = stop
    @start = 0
  end

  def each
    previous_fib = start
    current_fib = start
    next_fib = 1

    while current_fib <= stop
      yield current_fib
      previous_fib = current_fib
      current_fib = next_fib
      next_fib = previous_fib + current_fib
    end
  end
end

class FibonacciNumber
  # this is ugly and hacky, but it works!
  def self.new(num = 1)
    return 0 if num <= 1
    prev = 0
    current = 0
    next_fib = 1

    (num - 1).times do
      prev = current
      current = next_fib
      next_fib = prev + current
    end
    current
  end
end
