module SUT = struct
  let romanize = Roman_numerals.romanize
end

(* Tests *)

(* single literals *)
let test_literal_I () =
  Alcotest.(check string) "1 translates to I" "I" (SUT.romanize 1)

let test_literal_V () =
  Alcotest.(check string) "5 translates to V" "V" (SUT.romanize 5)

(* repeating literals *)
let test_repeating_literals_II () =
  Alcotest.(check string) "2 translates to II" "II" (SUT.romanize 2)

(* subtractive pattern *)
let test_subtractive_pattern_IV () =
  Alcotest.(check string) "4 translates to IV" "IV" (SUT.romanize 4)

(* Tests Runner *)
let () =
  let open Alcotest in
  run "Roman Numerals"
    [
      ( "Single letter literals",
        [
          test_case "1 -> I" `Quick test_literal_I;
          test_case "5 -> V" `Quick test_literal_V;
        ] );
      ( "Repeating literals",
        [ test_case "2 -> II" `Quick test_repeating_literals_II ] );
      ( "Subtractive pattern",
        [ test_case "4 -> IV" `Quick test_subtractive_pattern_IV ] );
    ]
