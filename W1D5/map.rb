
class Map 
    def initialize
        @map = []
    end

    def set(key, val)
        pair = [nil, nil]

        @map.each do |i|
            if i[0] == key 
                i[1] = val
                return val
            end
        end
        pair[0], pair[1] = key, val 
        @map.append(pair)
    end

    def get(key)
        @map.each do |i|
            if i[0] == key 
                return i[1]
            end
        end
        return nil
    end

    def delete(key)
        @map.delete_if {|el| el[0] == key}
    end

    def show 
        @map
    end
end

