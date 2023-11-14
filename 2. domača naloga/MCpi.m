(* ::Package:: *)

mccPi[n_Integer] := Module[{tocke, znotraj,zunaj},
  (* Generate random points in the square [0, 1] x [0, 1] *)
  tocke=RandomReal[1, {n, 2}];
  znotraj=Select[tocke, Norm[#]<=1&];
  zunaj=Complement[tocke, znotraj];
  {znotraj, zunaj}
  ]
