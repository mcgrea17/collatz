$seqLengthArray = Array.new


# Find the Callotaz sequence for the given start point
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


# Find the sequence length for the given num
#
# While creating the sequence if a number in the sequence has already had the 
# length calculated and saved in $seqLengthArray, just add the length and return the value
# otherwise create the sequence and keep the count (length)
def getSequenceLength(num)
    seqLength = 0

    while num > 1
        if $seqLengthArray[num]
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


# Find the longest Collatz Sequence starting from 1 to the given maxNum
# Find the longest length and starting point and then get the sequence from
# the starting point startSeq
def findLongestSeq(maxNum)
    i = 1
    startSeq = 0
    maxLength = 0
    
    while ( i <= maxNum)
        cLength = getSequenceLength(i)
        
        if (cLength > maxLength)
            maxLength = cLength
            startSeq = i
        end
        $seqLengthArray[i] = cLength
        i = i + 1
    end
   
    return getCollatzSequence(startSeq)
    
end

answerArray = findLongestSeq(1000000)
puts answerArray.inspect
puts answerArray.length
puts answerArray[0]


 require 'benchmark'
 num = 1000000
 Benchmark.bm do |x|
   x.report("findLongestSeq") { findLongestSeq(num) }
 end