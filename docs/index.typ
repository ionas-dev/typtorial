#import "../lib.typ": diff-off, diff-on, tutorial
// Not part of the public API: the header buttons repeated inside the text.
#import "../src/tutorial.typ": download-button, theme-button

#show: tutorial.with(
  title: [Create coding tutorials with typtorial],
  abstract: [
    Explanation on the left, code on the right, and every change highlighted by itself.
    typtorial turns a plain Typst file into a step-by-step coding tutorial, as PDF slides
    and as a website from the very same source.

    You are reading one right now. On the following pages you install Typst, write your
    first tutorial and see everything typtorial can do, most of it in action on this very
    page.
  ],
  source: read("index.typ"),
  source-name: "typtorial.typ",
)

= Install Typst

#diff-off

Typst is a program that turns a text file into a finished document. Where to get it and
how to set it up on your machine is described on the #link(
  "https://typst.app/open-source/#download",
)[Typst download page].

To check that it worked, run the command on the right in a terminal. It prints the
installed version.

```sh
typst --version
```

= Pick an editor

#diff-on

Any text editor will do for writing a tutorial.

One with a Typst extension is more comfortable, though: it shows you the result while you
type. For VS Code there is #link(
  "https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist",
)[Tinymist], or you write right in your browser on #link("https://typst.app")[typst.app].

= Start a new tutorial

Create an empty file, for example `my-tutorial.typ`.

Two lines are enough to begin: the first fetches typtorial from the Typst Universe, the
second applies it to everything that follows in the file.

There is nothing to download. Typst fetches the package by itself the first time you
compile.

```typst my-tutorial.typ
#import "@preview/typtorial:0.1.0": tutorial

#show: tutorial
```

= Or start from an example

#diff-off

Rather begin with a complete tutorial to change? The command on the right creates the
folder `my-tutorial` with a short example in it.

```sh
typst init @preview/typtorial my-tutorial
```

= Give it a title

#diff-on

Pass the title with `title` by turning `tutorial` into `tutorial.with(...)`.

It is shown large on the first page and at the top left of every other one, just like
"Create coding tutorials with typtorial" above.

```typst my-tutorial.typ
#import "@preview/typtorial:0.1.0": tutorial

#show: tutorial.with(
  title: [My first tutorial],
)
```

= Add a summary

`abstract` adds a short summary below the title.

Tell your readers what they are about to learn, like the text you scrolled past to get
here.

```typst my-tutorial.typ
#import "@preview/typtorial:0.1.0": tutorial

#show: tutorial.with(
  title: [My first tutorial],
  abstract: [You will learn to say hello.],
)
```

= Name the language

With `lang` you name the language of your text.

It sets the hyphenation and the labels of the buttons on the website. English is the
default, so you only need it for other languages.

```typst my-tutorial.typ
#import "@preview/typtorial:0.1.0": tutorial

#show: tutorial.with(
  title: [My first tutorial],
  abstract: [You will learn to say hello.],
  lang: "en",
)
```

= Write the first step

A tutorial is made of steps, and every step starts with a heading. Write it as `=`
followed by a space and the title of the step. "Write the first step" right above this
paragraph is one.

The explanation follows as normal text below, just like the one you are reading. Every
heading starts a new page by itself.

```typst my-tutorial.typ
#import "@preview/typtorial:0.1.0": tutorial

#show: tutorial.with(
  title: [My first tutorial],
  abstract: [You will learn to say hello.],
  lang: "en",
)

= Say hello

First we print a greeting.
```

= Show code next to the step

If a step comes with code, put it between two lines of three backticks each. After the
opening backticks go the language and, if you like, the name of the file.

The code lands in the panel on the right, with line numbers, the file name and a matching
icon. Have a look, your own code block is waiting there.

````typst my-tutorial.typ
#import "@preview/typtorial:0.1.0": tutorial

#show: tutorial.with(
  title: [My first tutorial],
  abstract: [You will learn to say hello.],
  lang: "en",
)

= Say hello

First we print a greeting.

```python hello.py
print("Hello")
```
````

= Let the code grow

In a good tutorial the code grows from step to step. So show the whole file in every step,
not just the change.

typtorial finds out by itself what changed since the last version of the same file: new
lines are marked green.

You have been watching it all along. The green lines on the right are the new step,
nothing else of `my-tutorial.typ` changed since the last page.

````typst my-tutorial.typ
#import "@preview/typtorial:0.1.0": tutorial

#show: tutorial.with(
  title: [My first tutorial],
  abstract: [You will learn to say hello.],
  lang: "en",
)

= Say hello

First we print a greeting.

```python hello.py
print("Hello")
```

= Greet the world

Now we greet the whole world.

```python hello.py
print("Hello, world")
```
````

= Show several files at once

Several code blocks in one step are shown as tabs, one per file.

This step has three of them: `my-tutorial.typ` with a new step that splits the code into
two files, and those two files, exactly as your readers will see them. Click through the
tabs on the right.

In the PDF every tab gets its own page with the same explanation.

````typst my-tutorial.typ
#import "@preview/typtorial:0.1.0": tutorial

#show: tutorial.with(
  title: [My first tutorial],
  abstract: [You will learn to say hello.],
  lang: "en",
)

= Say hello

First we print a greeting.

```python hello.py
print("Hello")
```

= Greet the world

Now we greet the whole world.

```python hello.py
print("Hello, world")
```

= Split it up

The greeting moves into a function of its own.

```python greet.py
def greet(name):
    print(f"Hello, {name}!")
```

```python main.py
from greet import greet

greet("world")
```
````

```python greet.py
def greet(name):
    print(f"Hello, {name}!")
```

```python main.py
from greet import greet

greet("world")
```

= Pause the highlighting

#diff-off

Not every code block is a new version of the one before. The code on the right is only an
excerpt, so not a single line of it is green.

That is because this step begins with `#diff-off`: the blocks after it are shown plainly.
`#diff-on` resumes the comparison with the last block shown before, as you will see on the
next page.

````typst my-tutorial.typ
#import "@preview/typtorial:0.1.0": tutorial, diff-off, diff-on

= A side note

#diff-off

By the way, this is how a test looks.

```python test_greet.py
def test_greet():
    assert True
```

#diff-on
````

= Switch the highlighting off

#diff-on

`diff: false` switches the highlighting off for the whole tutorial, for example when the
code blocks have nothing to do with each other.

From here on the panel shows only the top of `my-tutorial.typ`, where the settings go.

`show-removed: false` keeps the highlighting but leaves out removed lines. Turn the page
to see what they look like otherwise.

```typst
#import "@preview/typtorial:0.1.0": tutorial

#show: tutorial.with(
  title: [My first tutorial],
  abstract: [You will learn to say hello.],
  lang: "en",
  show-removed: false,
)
```

= Pick a theme

The line from the last page is gone, so it is shown in red. typtorial ships five themes;
import `themes` next to `tutorial` and pass one of them:

- `themes.default`: minimal and white with a teal accent, the one on this page
- `themes.paper`: warm paper tones, a serif font and a yellow accent
- `themes.forest`: sage tones, a deep green accent and a framed code panel
- `themes.indigo`: a cool indigo gradient with progress dots
- `themes.coral`: warm peach tones, square corners and headings on a coral bar

```typst
#import "@preview/typtorial:0.1.0": tutorial, themes

#show: tutorial.with(
  title: [My first tutorial],
  abstract: [You will learn to say hello.],
  lang: "en",
  theme: themes.paper,
)
```

= Go dark

`mode: "dark"` gives the PDF the dark color scheme.

The website follows the reader's system setting and offers a button at the top right to
switch. It works down here as well: #theme-button

```typst
#import "@preview/typtorial:0.1.0": tutorial, themes

#show: tutorial.with(
  title: [My first tutorial],
  abstract: [You will learn to say hello.],
  lang: "en",
  theme: themes.paper,
  mode: "dark",
)
```

= Make your own theme

Fonts, colors and the text at the top right live in a small file of their own. Put it next
to your tutorial and pass it with `theme: yaml("my.theme.yaml")`.

Only enter what you want to change. Everything else stays as it is. A `dark` section gives
your theme its own dark color scheme.

All settings are listed with comments in `themes/default.theme.yaml` of the package.

```typst
#import "@preview/typtorial:0.1.0": tutorial

#show: tutorial.with(
  title: [My first tutorial],
  abstract: [You will learn to say hello.],
  lang: "en",
  theme: yaml("my.theme.yaml"),
  mode: "dark",
)
```

```yaml my.theme.yaml
sizes:
  text: 16
  heading: 20
colors:
  accent: "#239dad"
  heading: "#127885"
brand:
  text: My team
dark:
  colors:
    background: "#15141a"
```

= Fine-tune the layout

The `layout` section decides how the pages are built: progress dots next to the heading,
rounded or square corners, a border around the code, where the text of a step sits, and
whether there is a title page.

Every setting of a theme can also be passed directly to the function. A value given this
way overrides the one from the theme file.

```typst
#import "@preview/typtorial:0.1.0": tutorial

#show: tutorial.with(
  title: [My first tutorial],
  abstract: [You will learn to say hello.],
  lang: "en",
  theme: yaml("my.theme.yaml"),
  mode: "dark",
  colors: (accent: "#d6336c"),
  layout: (
    dots: true,
    corner-radius: 0,
    abstract: "separate",
  ),
)
```

= Add a logo

`logo` puts an image at the top right, next to the text of the brand.

`logo-dark` is a variant for the dark color scheme, for example white instead of black.

`favicon` replaces the typtorial icon in the browser tab of the website. Pass the file
with `read("icon.svg", encoding: none)`.

```typst
#import "@preview/typtorial:0.1.0": tutorial

#show: tutorial.with(
  title: [My first tutorial],
  abstract: [You will learn to say hello.],
  lang: "en",
  theme: yaml("my.theme.yaml"),
  mode: "dark",
  colors: (accent: "#d6336c"),
  layout: (
    dots: true,
    corner-radius: 0,
    abstract: "separate",
  ),
  logo: image("logo.svg"),
  logo-dark: image("logo-dark.svg"),
  favicon: read("icon.svg", encoding: none),
)
```

= Add your own rules

Set and show rules work as usual when they come after `#show: tutorial...`.

They only affect the PDF, though: Typst's HTML export carries structure, not styling. Font
sizes for the website belong under `sizes` in the theme.

```typst
#import "@preview/typtorial:0.1.0": tutorial

#show: tutorial.with(
  title: [My first tutorial],
  abstract: [You will learn to say hello.],
  lang: "en",
  theme: yaml("my.theme.yaml"),
  mode: "dark",
  colors: (accent: "#d6336c"),
  layout: (
    dots: true,
    corner-radius: 0,
    abstract: "separate",
  ),
  logo: image("logo.svg"),
  logo-dark: image("logo-dark.svg"),
  favicon: read("icon.svg", encoding: none),
)

#set par(justify: true)
#show heading.where(level: 1): it => text(size: 24pt, it)
```

= Choose your fonts

A package cannot bring its own fonts, so every font setting accepts a list. The first font
that is installed is used, on the website as well.

The default theme looks best with the free #link(
  "https://fonts.google.com/specimen/Hanken+Grotesk",
)[Hanken Grotesk]. Typst warns about every font of a list that is missing; the result is
still correct.

```yaml my.theme.yaml
fonts:
  text:
    - Hanken Grotesk
    - Helvetica Neue
    - Arial
sizes:
  text: 16
  heading: 20
colors:
  accent: "#239dad"
  heading: "#127885"
brand:
  text: My team
dark:
  colors:
    background: "#15141a"
```

= Create the PDF

Time to turn the file into a document. The command on the right creates a PDF in which
every step has a page of its own.

Code too long for one page continues on the next, and so does text.

```sh compile.sh
typst compile my-tutorial.typ
```

= Create the website

The second command creates a website, and you are looking at one. The explanation scrolls,
while the code on the right stays in place and changes from step to step. The arrow keys ←
and → move one step forward or back, try them.

The HTML export of Typst is still experimental, so expect two warnings. The result is a
single file you can put anywhere.

```sh compile.sh
typst compile my-tutorial.typ

typst compile --features html --format html \
  my-tutorial.typ
```

= Watch while you write

`typst watch` saves you from compiling by hand: it keeps running and updates the PDF or
the website every time you save. Stop it with Ctrl+C.

Every code block comes with a copy button. Try the one next to `compile.sh`, then paste
the commands into your terminal.

```sh compile.sh
typst compile my-tutorial.typ

typst compile --features html --format html \
  my-tutorial.typ

typst watch --features html --format html \
  my-tutorial.typ
```

= Made with typtorial

This very page is a typtorial, written in a single Typst file.

Pass the text of your file as `source`, and the website offers it for download with the
button at the top right. Here it is once more: #download-button Click it to get the source
of this page and see how it is built.

```typst typtorial.typ
#import "@preview/typtorial:0.1.0": tutorial

#show: tutorial.with(
  title: [Create coding tutorials with typtorial],
  abstract: [...],
  source: read("typtorial.typ"),
  source-name: "typtorial.typ",
)
```
