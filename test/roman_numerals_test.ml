module SUT = struct
  let romanize = Roman_numerals.romanize
end

(* Tests *)
let test_literal_I () =
  Alcotest.(check string) "1 translates to I" "I" (SUT.romanize 1)

let test_literal_V () =
  Alcotest.(check string) "5 translates to V" "V" (SUT.romanize 5)

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
    ]
