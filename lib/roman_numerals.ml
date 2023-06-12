type bucket = { size : int; numerals : string }

let roman_buckets =
  [
    { size = 1; numerals = "I" };
    { size = 5; numerals = "V" };
    { size = 10; numerals = "X" };
    { size = 50; numerals = "L" };
    { size = 100; numerals = "C" };
    { size = 500; numerals = "D" };
    { size = 1000; numerals = "M" };
    (* given the small number of cases for subtractive pattern,
       we define them here explicitly rather than algorithmically
       deriving "1<x> less than 5<x>"/"1<x> less than 10<x>" *)
    { size = 4; numerals = "IV" };
    { size = 9; numerals = "IX" };
    { size = 40; numerals = "XL" };
    { size = 90; numerals = "XC" };
    { size = 400; numerals = "CD" };
    { size = 900; numerals = "CM" };
  ]
  (* sort in descending size order *)
  |> List.sort (fun x y -> y.size - x.size)

let find_largest_full_bucket d =
  roman_buckets |> List.filter (fun b -> b.size <= d) |> List.hd

let rec append_buckets (numerals : string list) (reminder : int) =
  if reminder <= 0 then numerals |> String.concat ""
  else
    let b = find_largest_full_bucket reminder in
    append_buckets (List.append numerals [ b.numerals ]) (reminder - b.size)

exception OutOfRange of string

let romanize n =
  if n < 0 || n > 4000 then raise (OutOfRange "Input is out of [0..4000] range")
  else append_buckets [] n
