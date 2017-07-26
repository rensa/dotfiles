#q <- function (save="no", ...) {
  quit(save=save, ...)
} james's rprofile

options(error = utils::recover)
options(stringsAsFactors = FALSE)
options(editor = 'vim')
options(width = 80)

# no asking for quit confirmation!
q <- function (save = "no", ...) {
  quit(save = save, ...)
}

.First = function()
{  
  # load tidyverse and colorout. maybe fix for raijin?
  if (Sys.getenv("TERM") == "xterm-256color")
  {
    library(colorout)
  }
  library(tidyverse)

  # send graphics to localhost:4320
  rmote::start_rmote(port = 4320) 
}
