--       _ _            _     _   _                         
--   ___(_) | ___ _ __ | |_  | |_| |__   ___ _ __ ___   ___ 
--  / __| | |/ _ \ '_ \| __| | __| '_ \ / _ \ '_ ` _ \ / _ \
--  \__ \ | |  __/ | | | |_  | |_| | | |  __/ | | | | |  __/
--  |___/_|_|\___|_| |_|\__|  \__|_| |_|\___|_| |_| |_|\___|
--                                                         
-- Maintainer: Ilshat Sultanov <ilshat@sultanov.team> 
-- Modified:   2022-10-22 23:06+0500
-- License:    MIT


local lush = require('lush')
local hsl = lush.hsl



----
-- Base colors
----

local colors = {
  black = hsl(0, 0, 0),         -- "#000000"
  blue =  hsl(222, 59, 47),     -- "#325cc0"
  gray = hsl(100, 5, 55),       -- "#8a9287"
  green = hsl(120, 100, 25),    -- "#008000"
  orange = hsl(35, 100, 68),    -- "#ffbc5d"
  purple = hsl(278, 43, 43),    -- "#7a3e9d"
  red = hsl(0, 84, 63),         -- "#f05050"
  white = hsl(0, 0, 97),        -- "#f7f7f7"
}



----
-- Theme
----

---@diagnostic disable: undefined-global
local theme = lush(function()
  return {

    -- Editor 

    ColorColumn  { }, -- Columns set with 'colorcolumn'
    Conceal      { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor       { }, -- Character under the cursor
    lCursor      { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM     { }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { bg = colors.white.darken(3) }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory    { fg = colors.gray.darken(50) }, -- Directory names (and other special names in listings)
    DiffAdd      { }, -- Diff mode: Added line |diff.txt|
    DiffChange   { }, -- Diff mode: Changed line |diff.txt|
    DiffDelete   { }, -- Diff mode: Deleted line |diff.txt|
    DiffText     { }, -- Diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer  { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    TermCursor   { }, -- Cursor in a focused terminal
    TermCursorNC { }, -- Cursor in an unfocused terminal
    ErrorMsg     { }, -- Error messages on the command line
    VertSplit    { }, -- Column separating vertically split windows
    Folded       { }, -- Line used for closed folds
    FoldColumn   { }, -- 'foldcolumn'
    SignColumn   { }, -- Column where |signs| are displayed
    IncSearch    { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute   { }, -- |:substitute| replacement text highlighting
    LineNr       { fg = colors.gray }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = colors.black }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen   { fg = colors.red }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea      { }, -- Area for messages and cmdline
    MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { }, -- |more-prompt|
    NonText      { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal       { bg = colors.white, fg = colors.black }, -- Normal text
    NormalFloat  { }, -- Normal text in floating windows.
    NormalNC     { }, -- normal text in non-current windows
    Pmenu        { }, -- Popup menu: Normal item.
    PmenuSel     { }, -- Popup menu: Selected item.
    PmenuSbar    { }, -- Popup menu: Scrollbar.
    PmenuThumb   { }, -- Popup menu: Thumb of the scrollbar.
    Question     { }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search       { bg = colors.orange }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine   { }, -- Status line of current window
    StatusLineNC { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine      { }, -- Tab pages line, not active tab page label
    TabLineFill  { bg = colors.white.darken(10) }, -- Tab pages line, where there are no labels
    TabLineSel   { }, -- Tab pages line, active tab page label
    Title        { }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual       { bg = colors.white.darken(5) }, -- Visual mode selection
    VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { }, -- Warning messages
    Whitespace   { fg = colors.gray }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Winseparator { fg = colors.gray }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu     { }, -- Current match in 'wildmenu' completion


    -- Syntax

    Comment        { fg = colors.gray }, -- Any comment

    Constant       { fg = colors.black }, -- (*) Any constant
    String         { fg = colors.green }, --   A string constant: "this is a string"
    Character      { fg = colors.green }, --   A character constant: 'c', '\n'
    Number         { fg = colors.purple }, --   A number constant: 234, 0xff
    Boolean        { fg = colors.purple }, --   A boolean constant: TRUE, false
    Float          { fg = colors.purple }, --   A floating point constant: 2.3e10

    Identifier     { fg = colors.black }, -- (*) Any variable name
    Function       { fg = colors.blue }, --   Function name (also: methods for classes)

    Statement      { fg = colors.blue }, -- (*) Any statement
    Conditional    { fg = colors.blue }, --   if, then, else, endif, switch, etc.
    Repeat         { fg = colors.blue }, --   for, do, while, etc.
    Label          { fg = colors.blue }, --   case, default, etc.
    Operator       { fg = colors.blue }, --   "sizeof", "+", "*", etc.
    Keyword        { fg = colors.blue }, --   any other keyword
    Exception      { fg = colors.blue }, --   try, catch, throw

    PreProc        { }, -- (*) Generic Preprocessor
    Include        { }, --   Preprocessor #include
    Define         { }, --   Preprocessor #define
    Macro          { }, --   Same as Define
    PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type           { }, -- (*) int, long, char, etc.
    StorageClass   { }, --   static, register, volatile, etc.
    Structure      { }, --   struct, union, enum, etc.
    Typedef        { }, --   A typedef

    Special        { }, -- (*) Any special symbol
    SpecialChar    { }, --   Special character in a constant
    Tag            { }, --   You can use CTRL-] on this
    Delimiter      { }, --   Character that needs attention
    SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    Debug          { }, --   Debugging statements

    Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { fg = colors.red }, -- Any erroneous construct
    Todo           { }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX


    -- LSP

    LspReferenceText            { }, -- Used for highlighting "text" references
    LspReferenceRead            { }, -- Used for highlighting "read" references
    LspReferenceWrite           { }, -- Used for highlighting "write" references
    LspCodeLens                 { fg = colors.gray }, -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    LspCodeLensSeparator        { }, -- Used to color the seperator between two or more code lens.
    LspSignatureActiveParameter { }, -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.


    -- Diagnostics 

    DiagnosticError            { }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn             { }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo             { }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint             { }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticVirtualTextError { }, -- Used for "Error" diagnostic virtual text.
    DiagnosticVirtualTextWarn  { }, -- Used for "Warn" diagnostic virtual text.
    DiagnosticVirtualTextInfo  { }, -- Used for "Info" diagnostic virtual text.
    DiagnosticVirtualTextHint  { }, -- Used for "Hint" diagnostic virtual text.
    DiagnosticUnderlineError   { }, -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn    { }, -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo    { }, -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint    { }, -- Used to underline "Hint" diagnostics.
    DiagnosticFloatingError    { }, -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    DiagnosticFloatingWarn     { }, -- Used to color "Warn" diagnostic messages in diagnostics float.
    DiagnosticFloatingInfo     { }, -- Used to color "Info" diagnostic messages in diagnostics float.
    DiagnosticFloatingHint     { }, -- Used to color "Hint" diagnostic messages in diagnostics float.
    DiagnosticSignError        { }, -- Used for "Error" signs in sign column.
    DiagnosticSignWarn         { }, -- Used for "Warn" signs in sign column.
    DiagnosticSignInfo         { }, -- Used for "Info" signs in sign column.
    DiagnosticSignHint         { }, -- Used for "Hint" signs in sign column.


    -- Tree-Sitter

    TSAttribute          { fg = colors.purple }, -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
    TSBoolean            { fg = colors.purple } , -- Boolean literals: `True` and `False` in Python.
    TSCharacter          { fg = colors.green } , -- Character literals: `'a'` in C.
    TSCharacterSpecial   { fg = colors.gray }, -- Special characters.
    TSComment            { fg = colors.gray }, -- Line comments and block comments.
    TSConditional        { fg = colors.blue }, -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
    TSConstant           { fg = colors.purple }, -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
    TSConstBuiltin       { fg = colors.purple }, -- Built-in constant values: `nil` in Lua.
    TSConstMacro         { fg = colors.purple }, -- Constants defined by macros: `NULL` in C.
    TSConstructor        { }, -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
    TSDebug              { }, -- Debugging statements.
    TSDefine             { }, -- Preprocessor #define statements.
    TSError              { fg = colors.red }, -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
    TSException          { fg = colors.blue }, -- Exception related keywords: `try`, `except`, `finally` in Python.
    TSField              { fg = colors.purple }, -- Object and struct fields.
    TSFloat              { fg = colors.purple }, -- Floating-point number literals.
    TSFunction           { fg = colors.blue }, -- Function calls and definitions.
    TSFuncBuiltin        { fg = colors.blue }, -- Built-in functions: `print` in Lua.
    TSFuncMacro          { fg = colors.blue }, -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
    TSInclude            { fg = colors.blue }, -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
    TSKeyword            { fg = colors.purple }, -- Keywords that don't fit into other categories.
    TSKeywordFunction    { fg = colors.blue }, -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
    TSKeywordOperator    { fg = colors.blue }, -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
    TSKeywordReturn      { fg = colors.blue }, -- Keywords like `return` and `yield`.
    TSLabel              { fg = colors.purple }, -- GOTO labels: `label:` in C, and `::label::` in Lua.
    TSMethod             { fg = colors.blue },  -- Method calls and definitions.
    TSNamespace          { fg = colors.black }, -- Identifiers referring to modules and namespaces.
    TSNone               { fg = colors.purple }, -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
    TSNumber             { fg = colors.purple }, -- Numeric literals that don't fit into other categories.
    TSOperator           { fg = colors.blue }, -- Binary or unary operators: `+`, and also `->` and `*` in C.
    TSParameter          { fg = colors.black }, -- Parameters of a function.
    TSParameterReference { } , -- References to parameters of a function.
    TSPreProc            { fg = colors.blue }, -- Preprocessor #if, #else, #endif, etc.
    TSProperty           { fg = colors.purple }, -- Same as `TSField`.
    TSPunctDelimiter     { fg = colors.gray }, -- Punctuation delimiters: Periods, commas, semicolons, etc.
    TSPunctBracket       { fg = colors.gray }, -- Brackets, braces, parentheses, etc.
    TSPunctSpecial       { fg = colors.gray }, -- Special punctuation that doesn't fit into the previous categories.
    TSRepeat             { fg = colors.blue }, -- Keywords related to loops: `for`, `while`, etc.
    TSStorageClass       { fg = colors.purple }, -- Keywords that affect how a variable is stored: `static`, `comptime`, `extern`, etc.
    TSString             { fg = colors.green }, -- String literals.
    TSStringRegex        { fg = colors.green }, -- Regular expression literals.
    TSStringEscape       { fg = colors.gray }, -- Escape characters within a string: `\n`, `\t`, etc.
    TSStringSpecial      { fg = colors.gray }, -- Strings with special meaning that don't fit into the previous categories.
    TSSymbol             { fg = colors.purple }, -- Identifiers referring to symbols or atoms.
    TSTag                { fg = colors.purple }, -- Tags like HTML tag names.
    TSTagAttribute       { fg = colors.gray }, -- HTML tag attributes.
    TSTagDelimiter       { fg = colors.gray }, -- Tag delimiters like `<` `>` `/`.
    TSText               { fg = colors.green }, -- Non-structured text. Like text in a markup language.
    TSStrong             { }, -- Text to be represented in bold.
    TSEmphasis           { fg = colors.purple}, -- Text to be represented with emphasis.
    TSUnderline          { }, -- Text to be represented with an underline.
    TSStrike             { }, -- Strikethrough text.
    TSTitle              { }, -- Text that is part of a title.
    TSLiteral            { }, -- Literal or verbatim text.
    TSURI                { fg = colors.blue }, -- URIs like hyperlinks or email addresses.
    TSMath               { }, -- Math environments like LaTeX's `$ ... $`
    TSTextReference      { }, -- Footnotes, text references, citations, etc.
    TSEnvironment        { }, -- Text environments of markup languages.
    TSEnvironmentName    { }, -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
    TSNote               { }, -- Text representation of an informational note.
    TSWarning            { }, -- Text representation of a warning note.
    TSDanger             { }, -- Text representation of a danger note.
    TSType               { fg = colors.purple }, -- Type (and class) definitions and annotations.
    TSTypeBuiltin        { fg = colors.purple }, -- Built-in types: `i32` in Rust.
    TSVariable           { fg = colors.black }, -- Variable names that don't fit into other categories.
    TSVariableBuiltin    { fg = colors.black }, -- Variable names defined by the language: `this` or `self` in Javascript.
  }
end)

return theme
