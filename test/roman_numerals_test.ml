module SUT = struct
  let romanize = Roman_numerals.romanize
end

(* Tests *)
let test_literal_I () =
  Alcotest.(check string) "1 translates to I" "I" (SUT.romanize 1)

(* Tests Runner *)
let () =
  let open Alcotest in
  run "Roman Numerals" [
      "Single letter literals",
          [ test_case "I" `Quick test_literal_I ];
    ]
