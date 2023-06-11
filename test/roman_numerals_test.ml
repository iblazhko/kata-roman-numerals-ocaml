module SUT = struct
  let romanize = Roman_numerals.romanize
end

(* Tests *)

(* basic numerals *)
let test_numeral_I () =
  SUT.romanize 1 |> Alcotest.(check string) "1 translates to I" "I"

let test_numeral_V () =
  SUT.romanize 5 |> Alcotest.(check string) "5 translates to V" "V"

let test_numeral_X () =
  SUT.romanize 10 |> Alcotest.(check string) "10 translates to X" "X"

let test_numeral_L () =
  SUT.romanize 50 |> Alcotest.(check string) "50 translates to L" "L"

let test_numeral_C () =
  SUT.romanize 100 |> Alcotest.(check string) "100 translates to C" "C"

let test_numeral_D () =
  SUT.romanize 500 |> Alcotest.(check string) "500 translates to D" "D"

let test_numeral_M () =
  SUT.romanize 1000 |> Alcotest.(check string) "1000 translates to M" "M"

(* repeating literals *)
let test_repeating_numerals_II () =
  SUT.romanize 2 |> Alcotest.(check string) "2 translates to II" "II"

(* subtractive pattern *)
let test_subtractive_pattern_IV () =
  SUT.romanize 4 |> Alcotest.(check string) "4 translates to IV" "IV"

(* out of range input *)
let test_negative_number () =
  Alcotest.check_raises "Negative numbers should be rejected"
    (Roman_numerals.OutOfRange "Input is out of [0..4000] range") (fun () ->
      SUT.romanize (-1) |> ignore);
  Alcotest.check_raises "Negative numbers should be rejected"
    (Roman_numerals.OutOfRange "Input is out of [0..4000] range") (fun () ->
      SUT.romanize (-2) |> ignore)

let test_number_over_4000 () =
  Alcotest.check_raises "Numbers over 4000 should be rejected"
    (Roman_numerals.OutOfRange "Input is out of [0..4000] range") (fun () ->
      SUT.romanize 4001 |> ignore);
  Alcotest.check_raises "Numbers over 4000 should be rejected"
    (Roman_numerals.OutOfRange "Input is out of [0..4000] range") (fun () ->
      SUT.romanize 4010 |> ignore)

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
      ( "Out of range input",
        [
          test_case "< 0" `Quick test_negative_number;
          test_case "> 4000" `Quick test_number_over_4000;
        ] );
    ]
