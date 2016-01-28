require '/home/ubuntu/workspace/blog/app/models/web_spellchecker.rb'

class DictionayWordsController < ApplicationController
  
  def spellcheck
    input_word = params[:word]
    w_spellchecker = WebSpellchecker.new()
    inputHash = Hash.new()
    
    inputHash["term"] = [input_word]
    inputHash["known"] = w_spellchecker.known([input_word]).any?
    inputHash["suggestions"] =  w_spellchecker.correct(input_word) 
    render :json => inputHash 
  end
end
