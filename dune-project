(lang dune 3.7)

(name blog)

(package
 (name blog)
 (depends
  ocaml
  dune
  (ocamlfind (>= 1.9.8))
  dream
  cohttp-lwt-unix
  yojson
  cmarkit))

