module SUT = struct
  let romanize = Roman_numerals.romanize
end

(* Tests *)

(* basic numerals *)
let test_numeral_I () =
  Alcotest.(check string) "1 translates to I" "I" (SUT.romanize 1)

let test_numeral_V () =
  Alcotest.(check string) "5 translates to V" "V" (SUT.romanize 5)

let test_numeral_X () =
  Alcotest.(check string) "10 translates to X" "X" (SUT.romanize 10)

let test_numeral_L () =
  Alcotest.(check string) "50 translates to L" "L" (SUT.romanize 50)

let test_numeral_C () =
  Alcotest.(check string) "100 translates to C" "C" (SUT.romanize 100)

let test_numeral_D () =
  Alcotest.(check string) "500 translates to D" "D" (SUT.romanize 500)

let test_numeral_M () =
  Alcotest.(check string) "1000 translates to M" "M" (SUT.romanize 1000)

(* repeating literals *)
let test_repeating_numerals_II () =
  Alcotest.(check string) "2 translates to II" "II" (SUT.romanize 2)

(* subtractive pattern *)
let test_subtractive_pattern_IV () =
  Alcotest.(check string) "4 translates to IV" "IV" (SUT.romanize 4)

(* Tests Runner *)
let () =
  let open Alcotest in
  run "Roman Numerals"
    [
      ( "Single letter numerals",
        [
          test_case "1    -> I" `Quick test_numeral_I;
          test_case "5    -> V" `Quick test_numeral_V;
          test_case "10   -> X" `Quick test_numeral_X;
          test_case "50   -> L" `Quick test_numeral_L;
          test_case "100  -> C" `Quick test_numeral_C;
          test_case "500  -> D" `Quick test_numeral_D;
          test_case "1000 -> M" `Quick test_numeral_M;
        ] );
      ( "Repeating numerals",
        [ test_case "2 -> II" `Quick test_repeating_numerals_II ] );
      ( "Subtractive pattern",
        [ test_case "4 -> IV" `Quick test_subtractive_pattern_IV ] );
    ]
