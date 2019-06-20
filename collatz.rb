$seqLengthArray = Array.new
$seqArray = Array.new


def findLongestSeq(num)
    i = 1
    maxLength = 0
    seqArray = Array.new
    

    while ( i <= num)

        array = getCollatzSequence(i)

        if (array.length > maxLength)
            maxLength = array.length
            seqArray = array
        end

        # $seqArray[i] = array
        i += 1
    end
    return seqArray
end


def getCollatzSequence(num)
    array = Array.new
    array << num
    startNum = num

    while num > 1

        # if startNum > num
        #    return array | $seqArray[num]  
        # end

        if num.even?
            num = num/2
        else
            num = 3 * num +1
        end

        array << num
    end

    return array
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
        $seqLengthArray[i] = cLength
        i = i + 1
    end
   
    # return getCollatzSequence(startSeq)
    return startSeq, maxLength
end


def getCollatzSequenceLength(num)
    seqLength = 0
    startNum = num

    while num > 1
        if startNum > num
            return seqLength + $seqLengthArray[num] 
        end

        if num.even?
            num = num/2
        else
            num = 3 * num +1
        end

        seqLength = seqLength + 1

    end

    return seqLength + 1
end

# puts findLongestSeqLength(1000000)
# answerArray = findLongestSeq(1000000)
# puts answerArray.length
# puts answerArray[0]


 require 'benchmark'
 num = 1000000
 Benchmark.bm do |x|
   x.report("findLongestSeqLength")  { findLongestSeqLength(num)  }
   x.report("findLongestSeq") { findLongestSeq(num) }
 end