# Klasa zawierajaca metody pozwalajacymi okreslic cechy charakteru
class Personality
  # Metoda tworzaca stringa z wybranymi cechami charakteru
  def get_characteristics(date_value)
    # slownik cech charakteru
    characteristics = {
      1 => ["ambitność", "racjonalizm", "egocentryzm"],
      2 => ["wyrozumiałość", "dyplomacja", "niepewność"],
      3 => ["charyzma", "twórczy", "lekkomyślność"],
      4 => ["zorganizowanie", "odpowiedzialność", "szorstkość"],
      5 => ["śmiałość", "pomysłowość", "niecierpliwość"],
      6 => ["wrażliwość", "zrównoważenie", "lenistwo"],
      7 => ["szlachetność", "elegancja", "samotność"],
      8 => ["nieustepliowść", "samokontrola", "radykalizm"],
      9 => ["wielkoduszność", "wyrozumiałość", "wybuchowość"]
    }
    character_string = String.new
    characteristics[date_value].each do |c|
      character_string << c
      character_string << ", "
    end
    character_string = character_string[0..-3]
  end
end
