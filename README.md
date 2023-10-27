# osl-syntax

### About osl-syntax

A [Vim][1] syntax highlighting file for [OpenShadingLanguage][2] and basic configuration files for a dark grey theme, automagical file detection for OSL.
Why all this you may ask? It does provides immediate visual cues, i.e, reserved keywords that will trigger a OSLC compiler fail, and hopefully will reduce eyestrain.

### Installing

Copy the .vim syntax file to your ~/.vim/syntax directory, and the .vimrc to your ~.
For more information on creating, modifying and installing [Vim][1] [syntax highlighting][3] files, visit [this link][4]

#### Requirements

[Vim][1] obviously, and the vimrc configuration file is set for [OmniCompletion][5], which requires [Ctags][6]. Depending on how complex your shader library is, it might be worth it. You can create your [ctags][6] file by running it with
```
ctags –R --c++-kinds=+p --fields=+iaS --extra=+q <path/to/your/stdosl.h> <path/to/your/headers & files>
```
Then copy it to your ~/.vim/tags/ directory.

The vimrc file is using the [Liberation][7] fonts. If you use [Fedora][8], install via
```
sudo dnf install liberation-mono-fonts
```

### Screenshots

Everyone wants screenshots, so here go you:

![cap1](/img/cap1.jpg?raw=true)

  [1]: http://www.vim.org/
  [2]: https://github.com/imageworks/OpenShadingLanguage
  [3]: http://vimdoc.sourceforge.net/htmldoc/syntax.html
  [4]: http://vim.wikia.com/wiki/Creating_your_own_syntax_files
  [5]: http://www.vim.org/scripts/script.php?script_id=1520
  [6]: http://ctags.sourceforge.net/
  [7]: https://fedorahosted.org/liberation-fonts/
  [8]: https://getfedora.org/
  
  
