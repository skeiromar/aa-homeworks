

arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


# O(n^2)

val = ''
arr.length.times do |i|
    (i+1...arr.length).each do |j|
        if arr[j].length > arr[i].length 
            val = arr[j] 
        end
    end
end

# O(nlogn)

class Array

    def merge_sort(&prc)
        prc ||= proc {|el, piv| el <=> piv}
        
        return self if self.length <= 1
        mid = self.length / 2

        left = self.take(mid)
        right = self.drop(mid)

        l = left.merge_sort(&prc)
        r = right.merge_sort(&prc)

        merge(l, r, &prc)
        
    end


    def merge(arr_left, arr_right, &prc)
        merged = []

        until arr_left.empty? || arr_right.empty? 
            merged << ((prc.call(arr_left.first, arr_right.first) <= 0) ? arr_left.shift : arr_right.shift)
        end
        
        
        merged + arr_left + arr_right

    end


end

val2 = arr.merge_sort.last

# O(n)
val3 = ''

arr.each {|el| val3 = el if el.length > val3.length}

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def show_dance(dir, tiles_array)
    tiles_array.each_with_index {|el, i| return i if el == dir}
end

tiles_hash = Hash[tiles_array.map.with_index {|v, i| [v, i]}]

def show_dance_constant(dir, tiles_hash)
    tiles_hash[dir]
end
