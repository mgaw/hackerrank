# https://www.hackerrank.com/challenges/ctci-find-the-running-median

# Kinds of heaps
MIN = 1
MAX = 2

# Based on https://de.wikipedia.org/wiki/Bin%C3%A4rer_Heap
def heapify(heap, i, heap_kind)
  min = i
  l = heap.length

  if left(i) < l && (heap_kind == MIN ? heap[left(i)] < heap[min] : heap[left(i)] > heap[min])
    min = left(i)
  end

  if right(i) < l && (heap_kind == MIN ? heap[right(i)] < heap[min] : heap[right(i)] > heap[min])
    min = right(i)
  end

  if min != i
    heap[min], heap[i] = heap[i], heap[min]
    heapify(heap, min, heap_kind)
  end
end

def insert(heap, key, heap_kind)
  heap << key
  i = heap.length - 1
  while (i > 0 && (heap_kind == MIN ? heap[i] < heap[parent(i)] : heap[i] > heap[parent(i)]))
    heap[i], heap[parent(i)] = heap[parent(i)], heap[i]
    i = parent(i)
  end
end

def remove(heap, heap_kind)
  ret = heap[0]
  heap[0] = heap.last
  heap.pop
  heapify(heap, 0, heap_kind)
  ret
end

def left(i) i*2+1 end
def right(i) i*2+2 end
def parent(i) (i-1)/2 end

min = [] # min heap representing numbers above the median
max = [] # max heap ............ ....... below ... ......
gets.strip.to_i.times do
  n = gets.strip.to_i
  #puts "memo=#{memo.inspect} n=#{n}"

  # insert
  if min.empty? || n > min[0]
    insert(min, n, MIN)
  else
    insert(max, n, MAX)
  end

  #puts "after insert min=#{min.inspect}"
  #puts "after insert max=#{max.inspect}"

  # balance
  if min.length - max.length > 1
    # need to pass a value from min to max
    value = remove(min, MIN)
    #puts "min->max value=#{value}"
    insert(max, value, MAX)
  elsif max.length - min.length > 1
    # need to pass a value from max to min
    value = remove(max, MAX)
    insert(min, value, MIN)
  end

  #puts "after balance min=#{min.inspect}"
  #puts "after balance max=#{max.inspect}"

  # print median
  if min.length < max.length
    puts "#{max[0]}.0"
  elsif min.length > max.length
    puts "#{min[0]}.0"
  else
    puts ((max[0] + min[0]) / 2.0).round(1)
  end
end
