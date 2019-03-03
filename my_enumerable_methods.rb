module Enumerable 
    def my_each
        i = 0
        while i < self.length
            yield(self[i])
            i += 1
        end
    end

    def my_each_with_index
        i = 0
        while i < self.length
            yield(self[i],i)
            i += 1
        end
    end

    def my_select
        selected = []
        i = 0
        while i < self.length
            selected << self[i] if ( yield(self[i]) == true )
            i += 1
        end
        selected
    end
end