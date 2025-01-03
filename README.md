Example for a Mugen Repository to better track and move info across computers. Potentially useful for sharing with others if that's decided.



To ADD a character select.def must be updated and the character folder must be added.
-mugen/data/select.def (replace this)
-mugen/chars (place character folders into here)


To EDIT a character add the edited .def into the character's folder.
-mugen/chars/*characters.def* (put the edited .def into it's folder)


To REMOVE a character select.def must be updated and the folder must be removed.
-mugen/data/select.def (replace this)
-mugen/chars (remove the character folder here. DO NOT REMOVE "/chars")






To add a stage select.def must be updated and the folder must be added.
-mugen/data/select.def (replace this)
-mugen/sound (if the stage has sound, add the sound to this folder)
-mugen/stages (add the .def and .sff to this folder)


To EDIT a stage add the edited .def and .sff into the stage's folder.
-mugen/sound (if the stage has an edited sound, add the sound to this folder)
-mugen/stages/*stage.def and stage.sff* (replace the .def and .sff to this folder)


To REMOVE a stage select.def must be updated and the folder must be removed.
-mugen/data/select.def (replace this)
-mugen/sound (if the stage has sound, remove the sound from this folder. DO NOT REMOVE "/sound")
-mugen/stages (remove the *stage.def and stage.sff* files from here. DO NOT REMOVE "/stages")





DO NOT TOUCH THE OTHER FOLDERS OR FILES UNLESS YOU KNOW WHAT YOU'RE DOING
