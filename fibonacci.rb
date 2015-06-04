require 'Benchmark'

def fibonacci_recursive(n)
	if n == 0
		return 0
	elsif n == 1
		return 1
	else
		fibonacci_recursive(n-1) + fibonacci_recursive(n-2)
	end
end

def fibonacci_iterative(n)
	res = 0
	res_next = 1
	aux = 0
	if n == 0
		res_next = 1
	elsif n == 1
		res_next = 1
	else
		for i in 2..n
			aux = res_next
			res_next = res + res_next
			res = aux
			# puts res_next
			# res = i + ( - 1)
			# puts res
		end
	end
	res_next
end

fibonacci_iterative(8)

# p fibonacci_recursive(0) == 0
# p fibonacci_recursive(1) == 1
# p fibonacci_recursive(2) == 1
# p fibonacci_recursive(3) == 2
# p fibonacci_recursive(4) == 3
# p fibonacci_recursive(5) == 5

# p fibonacci_iterative(0) == 0
# p fibonacci_iterative(1) == 1
# p fibonacci_iterative(2) == 1
# p fibonacci_iterative(3) == 2
# p fibonacci_iterative(4) == 3
# p fibonacci_iterative(5) == 5



Benchmark.bm do |x|
  x.report("iterative") { 1000.times { fibonacci_iterative(20) } }
  x.report("recursive") { 1000.times { fibonacci_recursive(20) } }
end