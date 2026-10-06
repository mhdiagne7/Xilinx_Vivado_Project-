# Chemins relatifs au script, indépendants du répertoire courant.
set project_root [file normalize [file join [file dirname [info script]] ..]]
set project_dir [file join $project_root build lab2]
if {[file exists $project_dir]} {
    error "Le dossier $project_dir existe déjà. Ouvrez le projet existant."
}
create_project lab2 $project_dir -part xc7a100tcsg324-1
set_property target_language VHDL [current_project]
set_property simulator_language VHDL [current_project]
set sources [glob -nocomplain -directory [file join $project_root src] *.vhd]
if {[llength $sources] > 0} {
    add_files -norecurse $sources
    set_property top alu_top [get_filesets sources_1]
}
set constraints [glob -nocomplain -directory [file join $project_root constraints] *.xdc]
if {[llength $constraints] > 0} {
    add_files -fileset constrs_1 -norecurse $constraints
}
set testbenches [glob -nocomplain -directory [file join $project_root sim] *.vhd]
if {[llength $testbenches] > 0} {
    add_files -fileset sim_1 -norecurse $testbenches
}
update_compile_order -fileset sources_1
puts "Projet de départ créé : $project_dir/lab2.xpr"
puts "Compléter les circuits, les contraintes et les bancs d'essai avant synthèse."
