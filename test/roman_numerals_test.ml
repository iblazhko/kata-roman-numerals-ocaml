module SUT = struct
  let romanize = Roman_numerals.romanize
  let outOfRange = Roman_numerals.OutOfRange "Input is out of [0..4000] range"
end

(* Composing Alcotest `test_case`s *)

let compose_outofrange_cases data =
  data
  |> List.map (fun x ->
         let case_name, number = x in
         Alcotest.test_case (Printf.sprintf "%d: %s" number case_name) `Quick
           (fun _ ->
             Alcotest.check_raises
               (Printf.sprintf "Out of range input: %d: %s" number case_name)
               SUT.outOfRange (fun () -> SUT.romanize number |> ignore)))

let compose_test_cases data =
  data
  |> List.map (fun x ->
         let d, r = x in
         Alcotest.test_case (Printf.sprintf "%d -> %s" d r) `Quick (fun _ ->
             SUT.romanize d
             |> Alcotest.(check string)
                  (Printf.sprintf "%d translates to %s" d r)
                  r))

(* Test cases grouped by category *)

let test_single_symbol () =
  ( "Single symbol",
    [
      (1, "I");
      (5, "V");
      (10, "X");
      (50, "L");
      (100, "C");
      (500, "D");
      (1000, "M");
    ]
    |> compose_test_cases )

let test_repeating_symbol () =
  ( "Repeating symbol",
    [
      (2, "II");
      (3, "III");
      (20, "XX");
      (30, "XXX");
      (200, "CC");
      (300, "CCC");
      (2000, "MM");
      (3000, "MMM");
    ]
    |> compose_test_cases )

let test_subtractive_pattern () =
  ( "Subtractive pattern",
    [ (4, "IV"); (9, "IX"); (40, "XL"); (90, "XC"); (400, "CD"); (900, "CM") ]
    |> compose_test_cases )

let test_additive_pattern () =
  ( "Additive pattern",
    [
      (39, "XXXIX");
      (207, "CCVII");
      (246, "CCXLVI");
      (1066, "MLXVI");
      (1776, "MDCCLXXVI");
      (1873, "MDCCCLXXIII");
      (1984, "MCMLXXXIV");
      (2018, "MMXVIII");
      (2023, "MMXXIII");
    ]
    |> compose_test_cases )

let test_out_of_range_input () =
  ( "Out of range input",
    [ ("< 0", -1); ("< 0", -5); ("> 4000", 4001); ("> 4000", 4010) ]
    |> compose_outofrange_cases )

(* Tests Runner *)
let () =
  Alcotest.run "Roman Numerals"
    [
      test_single_symbol ();
      test_repeating_symbol ();
      test_subtractive_pattern ();
      test_additive_pattern ();
      test_out_of_range_input ();
    ]
