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

    def my_all?
        status = true
        i = 0
        while i < self.length
            if yield(self[i]) == true 
                i += 1
                next
            else
                status = !status
                break
            end
        end
        status
    end

    def my_none? #{|item | item == 3 }
        status = true
        i = 0
        while i < self.length
            if yield(self[i])
                status = !status
                break
            else
                i += 1
            end
        end 
        status
    end

    def my_count count = nil
        if count
            item_count = 0
            i = 0
            while i < self.length
                item_count += 1 if self[i] == count 
                i += 1
            end
        else
            return self.length
        end
        item_count
    end

end 