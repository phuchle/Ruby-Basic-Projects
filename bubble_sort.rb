def bubble_sort(arr)
  idx1 = 0

  until arr.min == arr[0] && arr.max == arr[-1]
    while idx1 < arr.length - 1
      idx2 = idx1 + 1
      arr[idx1], arr[idx2] = arr[idx2], arr[idx1] if arr[idx1] > arr[idx2]
	  idx1 += 1
	end
	idx1 = 0
  end
  arr
end

p bubble_sort([4,3,78,2,0,2])

def bubble_sort_by(arr) #accepts block

  idx1 = 0

  until arr.min_by(&:length) == arr[0] && arr.max_by(&:length) == arr[-1]
    while idx1 < arr.length - 1
      idx2 = idx1 + 1
      arr[idx1], arr[idx2] = arr[idx2], arr[idx1] if yield(arr[idx1], arr[idx2]) > 0
    idx1 += 1
  end
  idx1 = 0
  end
  arr
end

p (bubble_sort_by(["hi","hello","hey"]) do |left, right|
  left.length - right.length
end)
