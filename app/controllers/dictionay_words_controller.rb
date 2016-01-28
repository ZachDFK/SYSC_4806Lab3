class DictionayWordsController < ApplicationController
  def spellcheck
    input_word = params[:word]
    render text:'Spellching for ' + input_word + " ..."
    
  end
end
