$DockButtons = {};

CreateDockButton[ assoc_Association ] := Module[{db},
  db = (DockButton[assoc["Name"]] = Tooltip[ Button[ assoc["Icon"], assoc["Action"] ], assoc["Tooltip"] ]);
  AppendTo[ $DockButtons, db ];
  db
]

Map[
  CreateDockButton,
  {
    <|
      "Name" -> "DocumentationCenter",
      "Icon" -> Import[FileNameJoin[{ $InputDirectoryName, "icons", "spikey.png" }]] ,
      "Action" :> SystemOpen["paclet:guide/WolframRoot"],
      "Tooltip" -> "Open Documentation Center"
    |>,
    <|
      "Name" -> "CopyBuildInfo",
      "Icon" -> Import[FileNameJoin[{ $InputDirectoryName, "icons", "copy-info.png" }]] ,
      "Action" :> CopyToClipboard[$BuildInfo],
      "Tooltip" -> "Copy build information"
    |>,
    <|
      "Name" -> "NeuralNetRepository",
      "Icon" -> Import[FileNameJoin[{ $InputDirectoryName, "icons", "neuralnet-repo.png" }]] ,
      "Action" :> SystemOpen["https://resources.wolframcloud.com/NeuralNetRepository"],
      "Tooltip" -> "Open Neural Network Repository"
    |>,
    <|
      "Name" -> "GitHub",
      "Icon" -> Import[FileNameJoin[{ $InputDirectoryName, "icons", "github.png" }]] ,
      "Action" :> SystemOpen["https://github.com/arnoudbuzing/prototypes"],
      "Tooltip" -> "Open Prototypes Repository"
    |>,
  }
]

CreateDock[] := CreateDock[ $DockButtons ];

CreateDock[ buttons_ ] := SetOptions[ $FrontEndSession , DockedCells -> {Cell[ BoxData@ToBoxes@Row[buttons], "Text",CellFrameMargins -> 0, CellMargins -> 0]}]

(*

CreateDockButton
DockAppend
DockInsert
DockRemove

Scope of docked cells: notebook, session, global/persistent ?

*)
