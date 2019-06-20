$collArray = Array.new

def getCollatzSequence(num)
    array = Array.new
    array << num

    while num > 1
        if num.even?
            num = num/2
        else
            num = 3 * num +1
        end
        array << num
    end
    return array
end

def getCollatzSequenceLength(num)
    seqLength = 0
    startNum = num

    while num > 1
        if startNum > num
            return seqLength + $collArray[num]
        end

        if num.even?
            num = num/2
        else
            num = 3 * num +1
        end
        seqLength = seqLength + 1
    end
    return seqLength
end

def findLongestSeq(num)
    i = 1
    startSeq = 0
    maxLength = 0
    

    while ( i <= num)
        array = getCollatzSequence(i)
        cLength = array.length
        if (cLength > maxLength)
            maxLength = cLength
            startSeq = i
        end
        $collArray[i] = cLength
        i = i + 1
    end
   
    return startSeq, maxLength
end


def findLongestSeqLength(num)
    i = 1
    startSeq = 0
    maxLength = 0
    
    while ( i <= num)
        cLength = getCollatzSequenceLength(i)
        
        if (cLength > maxLength)
            maxLength = cLength
            startSeq = i
        end
        $collArray[i] = cLength
        i = i + 1
    end
   
    return startSeq, maxLength
end

puts findLongestSeq(1000000)
puts findLongestSeqLength(1000000)

 require 'benchmark'
 num = 10000
 Benchmark.bm do |x|
   x.report("findLongestSeq") { findLongestSeq(num) }
   x.report("findLongestSeqLength")  { findLongestSeqLength(num)  }
 end