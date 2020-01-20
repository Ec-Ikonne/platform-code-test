require 'award'

def update_quality(awards)

  awards.each do |award|

    case award.name
    when "Blue Star"
      handle_blue_star(award)
    when "Blue Distinction Plus"
      #do nothing. We can put this as default or omit it entirely from the switch case.
    when "Blue First"
      handle_blue_first(award)
    when "Blue Compare"
      handle_blue_compare(award)
    else
      handle_normal(award)
    end
  end
end


def handle_blue_star(award)
  if award.quality > 0 && award.quality < 50
    award.quality -= 2
  end
  award.expires_in -= 1
  if (award.expires_in < 0) && (award.quality > 0)
    award.quality -= 2
  end    
end


def handle_blue_first(award)
  if award.quality < 50
    award.quality += 1
  end

  award.expires_in -= 1

  if award.expires_in < 0 && award.quality < 50
    award.quality += 1
  end
end


def handle_blue_compare(award)
  if award.quality < 50
    award.quality += 1
    if award.expires_in < 11 
      award.quality += 1
    end
    if award.expires_in < 6
      award.quality += 1
    end
  end 

  award.expires_in -= 1

  if award.expires_in < 0
    award.quality = award.quality - award.quality
  end
end

def handle_normal(award)
  if award.quality < 50 && award.quality > 0
    award.quality -= 1
  end

  award.expires_in -= 1

  if award.expires_in < 0 && award.quality > 0
    award.quality -= 1
  end
end