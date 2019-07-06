module Enumerable 
    def my_each
        for i  in self
            yield(i)
        end
    end

    def my_each_with_index
        index = 0
        for i in self
            yield(i,index)
            index+= 1
        end
    end

    def my_select
        selected = []
        for i in self
            selected << i if ( yield(i) == true )
        end
        selected
    end

    def my_all?
        status = true
        for i in self
            if yield(i) == true 
                next
            else
                status = !status
                break
            end
        end
        status
    end

    def my_none? 
        status = true
        for i in self
            if yield(i)
                status = !status
                break
            end
        end 
        status
    end

    def my_count(count = nil)
        item_count = 0
        if count
            for item in self
                item_count += 1 if item == count 
            end
        elsif block_given?
            for i in self
                yield(i) ? item_count += 1 : nil
            end
        else
            return self.length
        end
        item_count
    end
    
    #The my_map method will accept a block. 
    def my_map 
        new_array = []
        for i in self
            new_array << yield(i)
        end
        new_array
    end

    #The my_proc_map method will work the same as the my_map method. However it will work with a proc instead.
    def my_proc_map &proc_to_block
        new_array = []
        for i in self
            new_array << proc_to_block.call(i)
        end
        new_array
    end

    #The proc_and_block_map will accept either a block or a proc.
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