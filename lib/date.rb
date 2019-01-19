# Klasa zawierajaca wlasciwosci daty
class Date
  def initialize(date)
    @year = date[0].to_i
    @month = date[1].to_i
    @day = date[2].to_i
  end

  # Metoda sprawdzajaca czy rok miesci sie w przedziale 1900-2019
  def year_valid?()
    if !(@year < 1900)
      if @year > 2019
        return true
      end
    else
      return true
    end
    return false
  end

  # Metoda sprawdzajaca czy ilosc miesiecy znajduje sie w przedziale 1-12
  def month_valid?()
    if !(@month < 1) 
      if @month > 12
        return true
      end
    else
      return true
    end
    return false
  end

  # Metoda sprawdzajaca czy numer dnia nie jest mniejszy od 0
  # i nie wiekszy od liczby dni w miesiacu
  def day_valid?()
    wrong_day = false

    # Sprawdzenie czy ilosc dni nie jest mniejsza od 0
    if @day < 1
      wrong_day = true
    end

    # Sprwdzenie czy ilosc dni w danym miesiacu sie zgadza
    case @month
    when 1
      if @day > 31
        wrong_day = true
      end
    when 2
      if @day > 28
        wrong_day = true
      end
    when 3
      if @day > 31
        wrong_day = true
      end
    when 4
      if @day > 30
        wrong_day = true
      end
    when 5
      if @day > 31
        wrong_day = true
      end
    when 6
      if @day > 30
      wrong_day = true
      end
    when 7
      if @day > 31
        wrong_day = true
      end
    when 8
      if @day > 31
        wrong_day = true
      end
    when 9
      if @day > 30
        wrong_day = true
      end
    when 10
      if @day > 31
        wrong_day = true
      end
    when 11
      if @day > 30
        wrong_day = true
      end
    when 12
      if @day > 31
        wrong_day = true
      end  
    else
      "something is wrong with month"
    end

    # sprawdzenie w przypadku roku przestepnego
    if (@year % 4 == 0 && @year % 100 != 100) || (@year % 400 == 0)
      if @month == 2
        wrong_day = false
        if @day < 1 || @day > 29
          wrong_day = true
        end
      end
    end
    return wrong_day
  end

  # Metoda sprowadzajaca date do czytelnego formatu
  def to_string
    return @year.to_s + " " + @month.to_s + " " + @day.to_s
  end

  def get_year
    return @year
  end

  def get_month
    return @month
  end

  def get_day
    return  @day
  end
end
