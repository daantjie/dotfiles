(TeX-add-style-hook
 "glyph"
 (lambda ()
   (TeX-add-symbols
    "numberthis"
    "glyphstartstage"
    "glyphstopstage"
    "glyphstartemphasis"
    "glyphstopemphasis"
    "glyphemphasis"
    "startforall"
    "stopforall")
   (LaTeX-add-labels
    "#1"))
 :latex)

