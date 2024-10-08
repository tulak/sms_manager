require 'sms_manager/error/error'

module SmsManager
  class SendingError < Error
    def initialize(body)
      code = body.split('|').last.to_i
      super code_to_message(code)
    end

    private

    def code_to_message(code)
      if code >= 900 && code <= 999
        CODE_9XX
      elsif CODES[code]
        "#{CODES[code]} (#{code})"
      else
        "Neznámý chybový kód (#{code})"
      end
    end

    CODES = {
      101 => 'Neexistující data požadavku (chybí XMLDATA parametr u XML API)',
      102 => 'Metoda neexistuje',
      103 => 'Neplatné uživatelské jméno nebo heslo',
      104 => 'Neplatný parametr gateway',
      105 => 'Nedostatek kreditu pro prepaid',
      109 => 'Požadavek neobsahuje všechna vyžadovaná data',
      201 => 'Žádná platná telefonní čísla v požadavku',
      202 => 'Text zprávy neexistuje nebo je příliš dlouhý',
      203 => 'Neplatný parametr sender (odesílatele nejprve nastavte ve webovém rozhraní)'
    }
    CODE_9XX = 'Systémová chyba (informujte se na support@smsmanager.cz)'
  end
end
