module SUT = struct
  let add = Roman_numerals.add
end

(* Tests *)
let test_add () =
  Alcotest.(check int) "adds up to 42" 42 (SUT.add 1 2)

(* Tests Runner *)
let () =
  let open Alcotest in
  run "Roman Numerals" [
      "test-add",   [ test_case "Add numbers"   `Slow  test_add ];
    ]
