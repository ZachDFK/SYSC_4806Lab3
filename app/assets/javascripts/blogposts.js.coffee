# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'page:change', -> #when the page has loaded… do all this.
    # initialize current word to an empty string.
    currentWord = "";
    $("#blogpost_contents").keypress (e) -> #update this line with correct selector and event
        inp = String.fromCharCode(e.which) # get the 1-character string that the user typed
        
        if (inp.match(/[a-z]/i)) #if this was a letter (use .match method and regular expression)
            #add letter to current word
            currentWord += inp
            
        else
            if (currentWord.match(/\w+/i)) # if the current word is a sequence of letters
                $.get window.location.origin + "/spellcheck/" + currentWord, (data) -> #send ajax request with current word.
                    #unless the word was known:
                    if(data.known == false && (data.suggestions != null))
                        #join suggestions in a single string
                        str = "did ya mean " + data.suggestions[0] + "?"
                    
                    else
                        str= "No suggestions :("
        
                    $("#spellcheck").text(str)
                    #reset current word to an empty string
                
                    currentWord = ""
                    str = "