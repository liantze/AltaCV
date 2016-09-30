# AltaCV, yet another LaTeX CV/Résumé class

v1.0.1 (11 September 2016), by LianTze Lim (liantze@gmail.com)

(Thanks to [Nur](https://github.com/nurh) for the name.)

It all started with this:

[<img src="tweet-that-started-this.png" width="500px">]
(https://twitter.com/Leonduck/status/764281546408923136)

Leonardo was talking about a [résumé of Marissa Mayer that Business Insider put together](http://www.businessinsider.my/a-sample-resume-for-marissa-mayer-2016-7/) using [enhancv.com](https://enhancv.com).
I _knew_ I had to do something about it. And so AltaCV was born.

## Samples

This is how the re-created résumé looks like ([view/open on Overleaf](https://www.overleaf.com/read/gtqfpbwncfvp)):

<img src="mmayer.png" alt="Marissa Mayer's résumé, re-created with AltaCV" width="600px">

Though if you're creating your own CV/résumé, you'd probably prefer using the basic template ([view/open on Overleaf](https://www.overleaf.com/read/trgqjpwnmtgv)):

<img src="sample.png" alt="sample barebones AltaCV template" width="600px">


## Requirements and Compilation

* AltaCV uses [`fontawesome`](http://www.ctan.org/pkg/fontawesome) and [`academicons`](http://www.ctan.org/pkg/academicons); they're included in both TeX Live 2016 and MikTeX 2.9.
* The samples here use the [Lato](http://www.latofonts.com/lato-free-fonts/) font.
* LuaLaTeX compilation is **strongly** recommended. If you want to use XeLaTeX instead, that's fine, but you may need to make sure `academicons.ttf` is installed _on_ your operating system, not just available in your `TEXMF` tree with the `academicons` LaTeX package.
