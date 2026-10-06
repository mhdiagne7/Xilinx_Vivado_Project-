# Contraintes à ajouter

Créer `nexys_a7_100t.xdc` à partir des affectations du tableau 5 de l'énoncé.
Vérifier les noms avec les ports de `src/alu_top.vhd`.

- Composant : xc7a100tcsg324-1.
- CLK100MHZ : E3, période de 10 ns.
- GClock : N17 (BTNC), routage d'horloge non dédié selon l'énoncé.
- GReset : M18 (BTNU).
- OperationSelect : SW8/SW9, LVCMOS18 ; autres E/S : LVCMOS33.
- Afficheurs : cathodes et anodes actives à zéro.

Le dossier ne contient pas encore de XDC complet : aucune génération de
bitstream ne doit être considérée comme prête à ce stade.
