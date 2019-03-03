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
    
    #The my_map method will accept a block. 
    def my_map 
        new_array = []
        i = 0
        while i < self.length
            new_array << yield(self[i])
            i += 1
        end
        new_array
    end

    #The my_proc_map method will work the same as the my_map method. However it will work with a proc instead.
    def my_proc_map &proc_to_block
        new_array = []
        i = 0
        while i < self.length
            new_array << proc_to_block.call(self[i])
            i += 1
        end
        new_array
    end

    #The proc_and_block_map will accept either a block or a proc. If both block and proc are probvided then only the proc is used. 
    def proc_and_block_map &proc
        new_array = []
        for i in self
            new_array << yield(i)
        end
        new_array
    end

    def my_inject accumulator = nil 
        i = 0
        accumulator = self[i] if accumulator == nil 
        while i < self.length 
            if accumulator == self[0] && i == 0
                i += 1
                accumulator = yield(accumulator,self[i]) 
                i += 1
            else
                accumulator = yield(accumulator,self[i])
                i += 1
            end
        end
        accumulator 
    end



end 