def collatzSequence(num)
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

def findLongestSeq(num)
    i = 1
    startSeq = 0
    maxLength = 0

    while ( i <= num)
        array = collatzSequence(i)
        cLength = array.length
        
        if (cLength > maxLength)
            maxLength = cLength
            startSeq = i
        end
        i = i + 1
    end
   
    return startSeq, maxLength
end

puts findLongestSeq(1000000)