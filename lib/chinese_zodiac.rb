# Klasa zawierajaca metody pozwalajacymi okreslic znak chinskiego zodiaku
class ChineseZodiac
  # Metoda zwracajaca chinski znak zodiaku
  def get_chinese_zodiac(year)
    # slownik chinskiego zodiaku
    chinese_zodiacs = {
      0 => "Szczur",
      1 => "Bawół",
      2 => "Tygyrs",
      3 => "Królik",
      4 => "Smok",
      5 => "Wąż",
      6 => "Koń",
      7 => "Koza",
      8 => "Małpa",
      9 => "Kogut",
      10 => "Pies",
      11 => "Świnia"
    }
    zodiac_result = (year - 1900) % 12
    zodiac_result = chinese_zodiacs[zodiac_result]
    return zodiac_result
  end
end
