val romanize : int -> string
(** Convert decimal number to Roman Numerals representation. *)

exception OutOfRange of string
(** Indicates that the input decimal number is out of the supported range and cannot be converted to Roman Numerals representation. *)
