def caesarCipher(string, num) 
  alpha = 'abcdefghijklmnopqrstuvwxyz'
  alphaCaps = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

  fullAlpha = Array.new


  
  alphaArr = alpha.split('')
  alphaCapsArr = alphaCaps.split('')
  alpha1 = Hash.new
  alpha2 = Hash.new

  alphaCap1 = Hash.new
  alphaCap2 = Hash.new

  
  

  strSplit = string.split('')
  strArr = Array.new

  alphaArr.each_with_index do |letter, index|
    fullAlpha.push(letter)
    alpha1[letter] = index
    alpha2[index] = letter
  end

  alphaCapsArr.each_with_index do |letter, index|
    fullAlpha.push(letter)
    alphaCap1[letter] = index + 100
    alphaCap2[index + 100] = letter
  end

  strSplit.each_with_index do |letter|
    unless fullAlpha.include? letter 
      strArr.push(letter)
    else
      if alphaArr.include? letter
        if alpha1[letter] + num > 25
          strArr.push((alpha1[letter] + num )- 26) 
        else
          strArr.push(alpha1[letter] + num) 
        end
      else
        if alphaCap1[letter] + num > 125
          strArr.push((alphaCap1[letter] + num )- 26) 
        else
          strArr.push(alphaCap1[letter] + num) 
        end

      end


      
      
    end
    
  end

  converted = Array.new
  
  strArr.each_with_index do |number|
    unless number.is_a? Integer
      converted.push(number)
    else
      if number < 100
        converted.push(alpha2[number])
      else
        converted.push(alphaCap2[number])
      end
    end
  end
  
  puts converted.join('')
  puts alphaCap1
  puts alpha1
  
end

caesarCipher('What a string!', 5)