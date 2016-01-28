require "/home/ubuntu/workspace/blog/app/models/dictionary_word.rb"
class WebSpellchecker < Spellchecker
    def initialize()
    end
    
    def known(words)
          #result = words.find_all {|w| DictionaryWord.where(word: w) } #find all words for which condition is true
        result = DictionaryWord.select("word, count").where(word: words).order(count: :desc)
   
      return result.map{|wd| wd[:word]}  
    end
    
end