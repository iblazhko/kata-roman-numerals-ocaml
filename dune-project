(lang dune 3.8)

(name kata_roman_numerals)

(generate_opam_files true)

(source
 (github iblazhko/kata-roman-numerals-ocaml))

(authors "Ivan Blazhko")

(maintainers "Ivan Blazhko")

(license MIT)

(documentation https://github.com/iblazhko/kata-roman-numerals-ocaml)

(package
 (name kata_roman_numerals)
 (synopsis "TDD exercise in OCaml")
 (description "Convert a number to Roman Numerals representation")
 (depends ocaml dune)
 (tags
  (tdd ocaml)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
