" OSL syntax file:
" https://github.com/luisbarrancos/osl-syntax/blob/master/README.md

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif


" move from .vimrc to syntax the intelisense and ctags loading plus vim settings
set nocompatible

"set autoindent
"set smartindent

set tabstop=4
set shiftwidth=4
set expandtab

set ruler
set virtualedit=all

set hlsearch
set showmatch

set columns=80
set textwidth=80
set colorcolumn=80
" no way to vizualize edge of >80 column, but this colors it (for 7.2)
autocmd BufWinEnter * call matchadd('ErrorMsg', '\%>'.&l:textwidth.'v.\+', -1) 

" Intelisense CTAGS
" set tags+=$HOME/.vim/tags/<my .ctags file here>

" Required, OmniCPP
" http://www.vim.org/scripts/script.php?script_id=1520
" https://github.com/vim-scripts/OmniCppComplete
let OmniCpp_NamespaceSearch     = 1
let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_ShowAccess          = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_MayCompleteDot      = 1
let OmniCpp_MayCompleteArrow    = 1
let OmniCpp_MayCompleteScope    = 1


" Reserved OSL keywords: these will generate compile errors w/ OSLC
syn keyword oslReserved     emit illuminance illuminate
syn keyword oslReserved     bool false true
syn keyword oslReserved     case catch char class const delete default double
syn keyword oslReserved     enum friend goto inline long new operator private
syn keyword oslReserved     protected short signed sizeof static switch
syn keyword oslReserved     template this throw try typedef uniform union
syn keyword oslReserved     unsigned varying virtual volatile 
syn keyword oslReserved     extern
" color reserved keywords dark red, easy fast warning
hi oslReserved guifg=DarkRed

" flow control
syn keyword oslStatement    break return continue
" conditionals
syn keyword oslConditional  if else
syn keyword oslRepeat       while do for

" OSL constants
syn keyword oslConstant     M_PI M_PI_2 M_PI_4 M_2_PI M_2PI M_4PI M_2_SQRTPI
syn keyword oslConstant     M_E M_LN2 M_LN10 M_LOG2E M_LOG10E M_SQRT2 M_SQRT1_2

" OSL global variables
syn keyword oslVariable     P I N Ng dPdu dPdv u v time dtime dPdtime Ci

" OSL types
" vim types: Type, Typedef, Structure, StorageClass
"
syn keyword oslType         int float point vector normal color matrix string
syn keyword oslType         void closure
syn keyword oslStructure    struct

" OSL extra type qualifiers (StorageClass)
"
" public is listed, but it seems unsupported
syn keyword oslQualifier    public
hi oslQualifier             guifg=LightGreen

syn keyword oslOutput       output
hi oslOutput                guifg=Green guibg=#444444

" no light shaders in OSL really
syn keyword oslShader       surface displacement light volume shader
hi oslShader                guifg=DarkGreen guibg=#272727 font=bold

" OSL operators
 
syn match oslOperator       "\v\*"
syn match oslOperator       "\v\\"
syn match oslOperator       "\v\+"
syn match oslOperator       "\v\-"  

" modules
syn match oslOperator       "\v\%"

" shift left and shift right
syn match oslOperator       "\v\<\<"
syn match oslOperator       "\v\>\>"

syn match oslOperator       "\v\*\="
syn match oslOperator       "\v\\\="
syn match oslOperator       "\v\+\="
syn match oslOperator       "\v\-\="
syn match oslOperator       "\v\+\+"
syn match oslOperator       "\v\-\-"

" equality, inequality, bigger/lower operators
syn match oslOperator       "\v\=\="
syn match oslOperator       "\v\!\="
syn match oslOperator       "\v\<"
syn match oslOperator       "\v\<\="
syn match oslOperator       "\v\>"
syn match oslOperator       "\v\>\="

" bitwise complement (1 and 0 bits flipped)
syn match oslOperator       "\v\~"

" boolean not
syn match oslOperator       "\v\!"

" bitwise and, xor, or, boolean and and boolean or
syn match oslOperator       "\v\&"
syn match oslOperator       "\v\^"
syn match oslOperator       "\v\|"
syn match oslOperator       "\v\&\&"
syn match oslOperator       "\v\|\|"

" the keywords: not, and, or, are synonyms for !, &&, ||
syn keyword oslOperator     not and or

" OSL functions
"
" mathematical functions
syn keyword oslStatement    radians degrees cos sin tan sincos acos asin atan
syn keyword oslStatement    atan2 cosh sinh tanh pow exp exp2 expm1
syn keyword oslStatement    log log2 log10 log logb sqrt inversesqrt hypot
syn keyword oslStatement    abs fabs sign floor ceil round trunc fmod mod
syn keyword oslStatement    min max clamp mix isnan isinf isfinite erf erfc

" geometric functions
syn keyword oslStatement    dot cross length distance normalize faceforward
syn keyword oslStatement    reflect refract fresnel rotate transform transformu

" color functions
syn keyword oslStatement    luminance blackbody wavelength_color transformc

" matrix functions
syn keyword oslStatement    getmatrix determinant transpose

" pattern generation
syn keyword oslStatement    step linearstep smoothstep smooth_linearstep
syn keyword oslStatement    noise pnoise snoise psnoise cellnoise spline
syn keyword oslStatement    splineinverse

" derivatives and area operators
syn keyword oslStatement    Dx Dy Dz filterwidth area calculatenormal aastep

" displacement functions
syn keyword oslStatement    displace bump

" string functions
syn keyword oslStatement    printf format error warning fprintf concat strlen
syn keyword oslStatement    startswith endswith stoi stof split substr
syn keyword oslStatement    regex_search regex_match hash

" texture functions
syn keyword oslStatement    texture texture3d environment gettextureinfo
syn keyword oslStatement    pointcloud_search pointcloud_get pointcloud_write

" renderer state and message passing
syn keyword oslStatement    getattribute setmessage getmessage surfacearea
syn keyword oslStatement    raytype backfacing isconnected isconstant

" dictionary lookups
syn keyword oslStatement    dict_find dict_next dict_value trace

" miscellaneous
syn keyword oslStatement    arraylength exit


" Closures

" Surface material closures
syn keyword oslClosure      diffuse phong oren_nayar ward microfacet
syn keyword oslClosure      reflection refraction subsurface
syn keyword oslClosure      \transparent translucent

" Volumetric material closures
syn keyword oslClosure      isotropic henyey_greenstein absorption

" light emission closures
syn keyword oslClosure      emission background

" signalling closures
syn keyword oslClosure      holdout debug

hi oslClosure               guifg=#60cc00 gui=bold

" Custom closures here:
"


"
" Comments
syn keyword oslTodo contained   TODO FIXME XXX NOTE README

" String and Character constants
" Highlight special characters (those which have a backslash) differently
syn match oslSpecial contained	"\\[0-9][0-9][0-9]\|\\."

syn region oslString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=oslSpecial

syn match oslCharacter		    "'[^\\]'"
syn match oslSpecialCharacter	"'\\.'"
syn match oslSpecialCharacter	"'\\[0-9][0-9]'"
syn match oslSpecialCharacter	"'\\[0-9][0-9][0-9]'"


" Preset OSL spaces
" Color spaces:
syn match oslSpaces   '\v"rgb"'
syn match oslSpaces   "\v\"hsv\""
syn match oslSpaces   "\v\"hsl\""
syn match oslSpaces   "\v\"YIQ\""
syn match oslSpaces   "\v\"XYZ\""
syn match oslSpaces   "\v\"xyY\""
" Coordinate systems
syn match oslSpaces   "\v\"common\""
syn match oslSpaces   "\v\"object\""
syn match oslSpaces   "\v\"shader\""
syn match oslSpaces   "\v\"world\""
syn match oslSpaces   "\v\"camera\""
syn match oslSpaces   "\v\"screen\""
syn match oslSpaces   "\v\"raster\""
syn match oslSpaces   "\v\"NDC\""

hi oslSpaces guifg=#8cb2d9


" Catch errors caused by wrong parenthesis
" 
syn region oslParen     transparent start='(' end=')' contains=ALLBUT,oslParenError,oslIncluded,oslSpecial,oslTodo,oslUserLabel

syn match oslParenError		    ")"
syn match oslInParen contained	"[{}]"

"
" OSL metadata
" syn region oslMetadata metadata start="\[\[" end="\]\]"
syn region oslMetadata matchgroup=Metadata start='\[\[' end='\]\]' contains=Text

hi oslMetadata guifg=#9daaae


" ignore
"
" integer number, or floating point number without a dot and with "f".
"
syn case ignore
syn match oslNumber		    "\<[0-9]\+\(u\=l\=\|lu\|f\)\>"

" floating point number, with dot, optional exponent
syn match oslFloat		    "\<[0-9]\+\.[0-9]*\(e[-+]\=[0-9]\+\)\=[fl]\=\>"

" floating point number, starting with a dot, optional exponent
syn match oslFloat		    "\.[0-9]\+\(e[-+]\=[0-9]\+\)\=[fl]\=\>"

" floating point number, without dot, with exponent
syn match oslFloat		    "\<[0-9]\+e[-+]\=[0-9]\+[fl]\=\>"

" hex number
syn match oslNumber		    "\<0x[0-9a-f]\+\(u\=l\=\|lu\)\>"

" syn match oslIdentifier	"\<[a-z_][a-z0-9_]*\>"
syn case match



if exists("osl_comment_strings")

  " A comment can contain oslString, oslCharacter and oslNumber.
  "
  " But a "*/" inside a oslString in a oslComment DOES end the comment!
  " So we need to use a special type of oslString:
  "     oslCommentString, which also ends on "*/", and sees a "*" at the start
  " of the line as comment again.
  " Unfortunately this doesn't very well work for // type of comments :-(
  "
  syntax match oslCommentSkip       contained "^\s*\*\($\|\s\+\)"

  syntax region oslCommentString    contained start=+"+ skip=+\\\\\|\\"+ end=+"+ end=+\*/+me=s-1 contains=oslSpecial,oslCommentSkip

  syntax region slComment2String	contained start=+"+ skip=+\\\\\|\\"+ end=+"+ end="$" contains=oslSpecial

  syntax region oslComment	start="/\*" end="\*/" contains=oslTodo,oslCommentString,oslCharacter,oslNumber

  syntax region oslCommentL	start="//" skip="\\$" end="$"
  contains=oslTodo,oslCommentString,oslCharacter,oslNumber

else
  syn region oslComment		start="/\*" end="\*/" contains=oslTodo
  syn region oslCommentL	start="//" skip="\\$" end="$" contains=oslTodo
endif

syntax match oslCommentError	"\*/"


"
" preprocessor definitions
"

syn region   oslPreCondit	start="^\s*\(%:\|#\)\s*\(if\|ifdef\|ifndef\|elif\)\>" skip="\\$" end="$" end="//"me=s-1 contains=oslComment,oslCommentString,oslCharacter,oslParen,oslParenError,oslNumbers,oslCommentError,oslSpaceError,oslSpecial,oslCommentSkip,oslComment2String,oslTodo

syn match oslPreCondit  display "^\s*\(%:\|#\)\s*\(else\|endif\)\>"

syn region oslIncluded  display contained start=+"+ skip=+\\\\\|\\"+ end=+"+

syn match oslIncluded   display contained "<[^>]*>"

syn match oslInclude    display "^\s*\(%:\|#\)\s*include\>\s*["<]" contains=oslIncluded

syn region oslDefine    start="^\s*\(%:\|#\)\s*\(define\|undef\)\>" skip="\\$" end="$" end="//"me=s-1 keepend contains=ALLBUT,@oslPreProcGroup,oslSpell

syn region  oslPreProc	start="^\s*\(%:\|#\)\s*\(pragma\>\|line\>\|warning\>\|warn\>\|error\>\)" skip="\\$" end="$" keepend contains=ALLBUT,@oslPreProcGroup,oslSpell


" Matching of AOVs/custom AOVs, assuming suffix _aov as an example
" syn match oslAOVs display "[_a-zA-Z0-9]*_aov"
" hi oslAOVs guifg=DarkRed guibg=#666666


" Your custom OSL macros here, i.e, SQR(X) ((X)*(X))
syn keyword oslMacro SQR


" Custom primitive variables (primvars)
" syn keyword oslPrimvars <here>
" hi oslPrimvars guifg=#83A9FF

" Custom calls
" syn keyword oslFunctions <here>
" hi oslFunctions guifg=#D47200 guibg=#333333
" or: guifg=#FFB900 font=bold


syn sync ccomment oslComment minlines=10

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_osl_syntax_inits")
  if version < 508
    let did_osl_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink oslLabel               Label
  HiLink oslUserLabel	        Label
  HiLink oslConditional	        Conditional
  HiLink oslRepeat	            Repeat
  HiLink oslCharacter	        Character

  HiLink oslSpecial	            SpecialChar
  HiLink oslSpecialCharacter    oslSpecial

  HiLink oslNumber	            Number
  HiLink oslFloat               Float

  HiLink oslError	            Error
  HiLink oslParenError	        oslError
  HiLink oslInParen	            oslError
  HiLink oslCommentError	    oslError
  
  HiLink oslOperator	        Operator

  HiLink oslStorageClass	    StorageClass
  HiLink oslStatement	        Statement
  HiLink oslUnderlined	        Underlined
  HiLink oslType		        Type
  HiLink oslStructure           Structure
  HiLink oslClosure             Function

  HiLink oslComment	            Comment
  HiLink oslCommentL	        Comment
  HiLink oslCommentString       oslString
  HiLink oslComment2String      oslString
  HiLink oslCommentSkip	        oslComment

  HiLink oslString	            String
  HiLink oslTodo	            Todo
  HiLink oslVariable	        Identifier

  HiLink oslIdentifier	        Identifier
  HiLink oslConstant	        SpecialChar
  HiLink oslMacro	            Macro
  HiLink oslPreproc	            Preproc
  HiLink oslInclude	            Include
  HiLink oslDefine	            Define
  HiLink oslPrecondit	        Precondit
  HiLink oslAOVs		        Underlined

  delcommand HiLink
endif

" highlight/dropdown color for omnicomplete, magenta is unreadable
highlight Pmenu guibg=#777777 guifg=darkred gui=bold

let b:current_file = "osl"
let b:current_syntax = "osl"

