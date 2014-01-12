package Mojolicious::Command::nopaste::Service::debian;
use Mojo::Base 'Mojolicious::Command::nopaste::Service';

has description => "Post to paste.debian.net\n";

has name => 'anonymous';

my %languages = (
  "abap" => 1,
  "ada" => 1,
  "ahk" => 1,
  "antlr" => 1,
  "antlr-as" => 1,
  "antlr-cpp" => 1,
  "antlr-csharp" => 1,
  "antlr-java" => 1,
  "antlr-objc" => 1,
  "antlr-perl" => 1,
  "antlr-python" => 1,
  "antlr-ruby" => 1,
  "apacheconf" => 1,
  "applescript" => 1,
  "as" => 1,
  "as3" => 1,
  "aspx-cs" => 1,
  "aspx-vb" => 1,
  "asy" => 1,
  "awk" => 1,
  "basemake" => 1,
  "bash" => 1,
  "bat" => 1,
  "bbcode" => 1,
  "befunge" => 1,
  "blitzmax" => 1,
  "boo" => 1,
  "brainfuck" => 1,
  "bro" => 1,
  "c" => 1,
  "cfengine3" => 1,
  "cfm" => 1,
  "cfs" => 1,
  "cheetah" => 1,
  "clojure" => 1,
  "cmake" => 1,
  "c-objdump" => 1,
  "coffee-script" => 1,
  "common-lisp" => 1,
  "console" => 1,
  "control" => 1,
  "coq" => 1,
  "cpp" => 1,
  "cpp-objdump" => 1,
  "csharp" => 1,
  "css" => 1,
  "css+django" => 1,
  "css+erb" => 1,
  "css+genshitext" => 1,
  "css+mako" => 1,
  "css+myghty" => 1,
  "css+php" => 1,
  "css+smarty" => 1,
  "Cucumber" => 1,
  "cython" => 1,
  "d" => 1,
  "dart" => 1,
  "delphi" => 1,
  "diff" => 1,
  "django" => 1,
  "d-objdump" => 1,
  "dpatch" => 1,
  "dtd" => 1,
  "duel" => 1,
  "dylan" => 1,
  "ec" => 1,
  "ecl" => 1,
  "elixir" => 1,
  "erb" => 1,
  "erl" => 1,
  "erlang" => 1,
  "evoque" => 1,
  "factor" => 1,
  "fan" => 1,
  "fancy" => 1,
  "felix" => 1,
  "fortran" => 1,
  "fsharp" => 1,
  "gas" => 1,
  "genshi" => 1,
  "genshitext" => 1,
  "glsl" => 1,
  "gnuplot" => 1,
  "go" => 1,
  "gooddata-cl" => 1,
  "gosu" => 1,
  "groff" => 1,
  "groovy" => 1,
  "gst" => 1,
  "haml" => 1,
  "haskell" => 1,
  "html" => 1,
  "html+cheetah" => 1,
  "html+django" => 1,
  "html+evoque" => 1,
  "html+genshi" => 1,
  "html+mako" => 1,
  "html+myghty" => 1,
  "html+php" => 1,
  "html+smarty" => 1,
  "html+velocity" => 1,
  "http" => 1,
  "hx" => 1,
  "hybris" => 1,
  "iex" => 1,
  "ini" => 1,
  "io" => 1,
  "ioke" => 1,
  "irc" => 1,
  "jade" => 1,
  "java" => 1,
  "js" => 1,
  "js+cheetah" => 1,
  "js+django" => 1,
  "js+erb" => 1,
  "js+genshitext" => 1,
  "js+mako" => 1,
  "js+myghty" => 1,
  "json" => 1,
  "jsp" => 1,
  "js+php" => 1,
  "js+smarty" => 1,
  "kotlin" => 1,
  "lhs" => 1,
  "lighty" => 1,
  "llvm" => 1,
  "logtalk" => 1,
  "lua" => 1,
  "make" => 1,
  "mako" => 1,
  "maql" => 1,
  "mason" => 1,
  "matlab" => 1,
  "matlabsession" => 1,
  "minid" => 1,
  "modelica" => 1,
  "modula2" => 1,
  "moocode" => 1,
  "moon" => 1,
  "mupad" => 1,
  "mxml" => 1,
  "myghty" => 1,
  "mysql" => 1,
  "nasm" => 1,
  "nemerle" => 1,
  "newlisp" => 1,
  "newspeak" => 1,
  "nginx" => 1,
  "nimrod" => 1,
  "numpy" => 1,
  "objdump" => 1,
  "objective-c" => 1,
  "objective-j" => 1,
  "ocaml" => 1,
  "octave" => 1,
  "ooc" => 1,
  "opa" => 1,
  "openedge" => 1,
  "perl" => 1,
  "php" => 1,
  "plpgsql" => 1,
  "postgresql" => 1,
  "postscript" => 1,
  "pot" => 1,
  "pov" => 1,
  "powershell" => 1,
  "prolog" => 1,
  "properties" => 1,
  "protobuf" => 1,
  "psql" => 1,
  "py3tb" => 1,
  "pycon" => 1,
  "pypylog" => 1,
  "pytb" => 1,
  "python" => 1,
  "python3" => 1,
  "ragel" => 1,
  "ragel-c" => 1,
  "ragel-cpp" => 1,
  "ragel-d" => 1,
  "ragel-em" => 1,
  "ragel-java" => 1,
  "ragel-objc" => 1,
  "ragel-ruby" => 1,
  "raw" => 1,
  "rb" => 1,
  "rbcon" => 1,
  "rconsole" => 1,
  "rebol" => 1,
  "redcode" => 1,
  "rhtml" => 1,
  "rst" => 1,
  "sass" => 1,
  "scala" => 1,
  "scaml" => 1,
  "scheme" => 1,
  "scilab" => 1,
  "scss" => 1,
  "smalltalk" => 1,
  "smarty" => 1,
  "sml" => 1,
  "snobol" => 1,
  "sourceslist" => 1,
  "splus" => 1,
  "sql" => 1,
  "sqlite3" => 1,
  "squidconf" => 1,
  "ssp" => 1,
  "sv" => 1,
  "tcl" => 1,
  "tcsh" => 1,
  "tea" => 1,
  "tex" => 1,
  "text" => 1,
  "trac-wiki" => 1,
  "urbiscript" => 1,
  "v" => 1,
  "vala" => 1,
  "vb.net" => 1,
  "velocity" => 1,
  "vhdl" => 1,
  "vim" => 1,
  "xml" => 1,
  "xml+cheetah" => 1,
  "xml+django" => 1,
  "xml+erb" => 1,
  "xml+evoque" => 1,
  "xml+mako" => 1,
  "xml+myghty" => 1,
  "xml+php" => 1,
  "xml+smarty" => 1,
  "xml+velocity" => 1,
  "xquery" => 1,
  "xslt" => 1,
  "yaml" => 1,
);

sub paste {
  my $self = shift;
  my $lang = exists $languages{$self->language} ? $self->language : 'text';

  my $tx = $self->ua->post( 'http://paste.debian.net', form => {
    code    => $self->text,
    expire  => '-1',
    poster  => $self->name,
    lang    => $lang,
    ( $self->private ? ( private => 1 ) : () ),
  });

  unless ($tx->res->is_status_class(200)) {
    say $tx->res->message;
    say $tx->res->body;
    exit 1;
  }

  return $tx->req->url;
}

1;

