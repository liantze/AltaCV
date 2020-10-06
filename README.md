# AltaCV, yet another LaTeX CV/Résumé class

v1.3.2 (17 May 2020), by LianTze Lim (liantze@gmail.com)

_Clickable hyperlinked info fields added on 10 May 2020_

_Sample file with new paracol layout added on 2 February 2020_

(Thanks to [Nur](https://github.com/nurh) for the name.)

It all started with this:

[<img src="tweet-that-started-this.png" width="500px">](https://twitter.com/Leonduck/status/764281546408923136)

Leonardo was talking about a [résumé of Marissa Mayer that Business Insider put together](http://www.businessinsider.my/a-sample-resume-for-marissa-mayer-2016-7/) using [enhancv.com](https://enhancv.com).
I _knew_ I had to do something about it. And so AltaCV was born.

## Samples

This is how the re-created résumé looks like ([view/open on Overleaf](https://www.overleaf.com/latex/examples/recreating-business-insiders-cv-of-marissa-mayer-using-altacv/gtqfpbwncfvp)):

<img src="mmayer.png" alt="Marissa Mayer's résumé, re-created with AltaCV" width="600px">

Though if you're creating your own CV/résumé, you'd probably prefer using the basic template ([view/open on Overleaf](https://www.overleaf.com/latex/templates/altacv-template/trgqjpwnmtgv)):

<img src="sample.png" alt="sample barebones AltaCV template" width="600px">


## Requirements and Compilation

* pdflatex + biber + pdflatex
* AltaCV uses [`fontawesome5`](http://www.ctan.org/pkg/fontawesome5) and [`academicons`](http://www.ctan.org/pkg/academicons); they're included in both TeX Live 2016 and MikTeX 2.9.
* Loading `academicons` is optional: enable it by adding the `academicons` option to `\documentclass`.
* Use the `normalphoto` option to get normal (i.e. non-circular) photos.
* As of v1.2 you can add multiple photos on the left or right: `\photoL{2cm}{logo1}` and `\photoR{2.5cm}{logo2,photo}`. (`\photo` will work like `\photoR`.) Separate your image filenames with commas _without_ spaces.
* Use the `ragged2d` option to activate hyphenations while keeping text left-justified; line endings will thus be less jagged and more aesthetically pleasing.
* As of v1.3 the `withhyper` document class option will make the "personal info" fields into clickable hyperlinks (where it makes sense). See below for more details.
* Can now be compiled with pdflatex, XeLaTeX and LuaLaTeX!
* However if you're using `academicons`, you _must_ use either XeLaTeX or LuaLaTeX. If the doc then compiles but the icons don't show up in the output PDF, try compiling with LuaLaTeX instead.
* The samples here use the [Lato](http://www.latofonts.com/lato-free-fonts/) and [Roboto Slab fonts](https://github.com/googlefonts/robotoslab). Feel free to use a different typeface package instead—often a different typeface will change the entire CV's feel.

## Docker and Docker-compose

We now offer a `Dockefile` and `docker-compose.yaml` with all the requirements for compilation locally.

1. Run `docker-compose build`
  * It will generate a local docker image `liantze/altacv:latest`
2. Go to one of the dirs `mmayer` and `sample`
3. Run `docker-compose up`
  * Reuses the docker image `liantze/altacv:latest`
  * The pdf is generated automatically locally.
  * The options to `docker-compose.yaml` is described in the samples dir

## `sample.tex` [WAS `sample-alt.tex` 2 FEBRUARY 2020, DEFAULT SINCE 10 MAY 2020] ##
Many users have overlooked the optional argument of `\cvsection` to insert the right sidebar contents, and often confused that the right sidebar doesn't automatically break across pages. This new layout uses the `paracol` package for typesetting the left and right columns that _can_ break across pages. It also makes changing the column widths easier:

```latex
%% Set the left/right column width ratio to 6:4.
\columnratio{0.6}

% Start a 2-column paracol. Both the left and right columns will automatically
% break across pages if things get too long.
\begin{paracol}{2}
\cvsection{Experience}
...
... END OF LEFT COLUMN CONTENTS ...

% Now switch to the right column.
\switchcolumn
\cvsection{Education}
...
...END OF RIGHT COLUMN CONTENTS ...
\end{paracol}
```
You can also use `\swithcolumn*` for "synchronising" the columns, as well as other commands from the `paracol` package. See the [`paracol` package documentation](http://texdoc.net/pkg/paracol) for further details.

**You do not need use the `fullwidth` environment nor use optional arguments with `\cvsection` with this new template.**

## Clickable Info fields

As of v1.3, the `withhyper` document class option will load the `hyperref` package, and make fields in the personal detail fields into clickable hyperlinks (where it makes sense anyway).

*BIG CAVEAT:* Remember that not all readers may want to click on hyperlinks in PDFs. You may therefore sometimes want to _remove_ `withhyper`, and spell out the field URL details a bit more completely, e.g. `\github{github.com/your-id}`.

Anyway assuming that you _do_ keep `withhyper` enabled: For each field e.g. `\homepage{foobar.com}`, a `\homepagesymbol` has been defined, and the clickable hyperlink is generated by prepending the `\homepagehyperprefix` to `foobar.com`. The `\homepgehyperprefix` is defined to be `\https://`, so this generates the hyperlink `https://foobar.com`.

If your homepage doesn't use HTTPS yet, or if you want to use a different symbol, you can re-define them with
```latex
\renewcommand{\homepagehyperprefix}{http://}
\renewcommand{\homepagesymbol}{\faLink}
```


## New Information Fields ####

I've decided against adding definitions for too many fields and symbols in the `.cls` itself; otherwise we'll have all possible platforms in the world (and more services are born everyday!) within `altacv.cls` before we know it.

You can actually just typeset your own arbitrary information fields using the `\printinfo{symbol}{detail}[optional hyperlink prefix]` command within `\personalinfo`:

````latex
\printinfo{\faPaw}{Hey ho!}
\printinfo{\faGitLab}{your-handle}[https://gitlab.com/]
````

Or if you really prefer, you can define a new field yourself with `\NewInfoFiled{fieldname}{symbol}[optional hyperlink prefix]` before  using it:

````latex
\NewInfoField{gitlab}{\faGitlab}[https://gitlab.com/]
\gitlab{your_id}
````

## Configurable colours

Use `\colorlet` or `\definecolor` to change these.
* `accent`
* `emphasis`
* `heading`
* `headingrule`
* `subheading`
* `body`
* `name`
* `tagline`

## Configurable fonts

Use `\renewcommand` to change these.
* `\namefont`
* `\taglinefont`
* `\personalinfofont`
* `\cvsectionfont`
* `\cvsubsectionfont`

---

## `legacy/sample-old.tex`

This is the original sample template file until 5 May 2020. The right sidebar is actually a _marginpar_, so it doesn't support footnote and cannot automatically break across pages if it's too long. You would need to split your right sidebar contents into separate files e.g. `p1sidebar.tex` and `p2sidebar.tex`, and insert them as the optional argument of the `\cvsection{...}` that you want to align them with:

```latex
\cvsection[p1sidebar]{Experience}
...
... END OF FIRST PAGE OF YOUR CV ...
\cvsection[page2sidebar]{Publications}
...
```

This assumes that the next page's main column would start immediately with a `\cvsection`, so that the top of your right sidebar contents also appear at the top of the page. Now if the _next_ page doesn't start with a `\cvsection` but you'd still like to add a sidebar, then use this command on the _current_ page to add it. The optional argument lets you pull up the sidebar a bit so that it looks aligned with the top of the main column:

```latex
\addnextpagesidebar[-1ex]{page3sidebar}
```

If you want to change the left and right columns' widths, you'll need to tinker with the `right` (distance from paper's right edge until the main column's right edge) and `marginparwidth` (width of the right sidebar) options in the `\geometry` line. For example, to make the right sidebar wider by 2cm, you could use

```latex
%% original was right=9cm, marginparwidth=6.8cm
\geometry{left=1cm,right=11cm,marginparwidth=8.8cm,marginparsep=1.2cm,top=1cm,bottom=1cm}
```
as well as doing a bit of arithmetic when you're making the header to get it full-width, i.e. reducing the sidebar by 2cm and extending the main column by 2cm.

```latex
\begin{adjustwidth}{}{-10cm}  %% original was -8cm
\makecvheader
\end{adjustwidth}
```
