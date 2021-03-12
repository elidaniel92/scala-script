object HTML {
  def txt(txt: String,
               bold: Boolean = false,
               italic: Boolean = false) = {
    var newTxt: String = txt
    if(bold) {
      newTxt = "<b>" + newTxt + "</b>" 
    }
    if(italic) {
      newTxt = "<i>" + newTxt + "</i>"
    }
    newTxt
  } 
}

