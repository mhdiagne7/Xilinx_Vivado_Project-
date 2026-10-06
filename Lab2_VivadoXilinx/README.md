# Lab2_VivadoXilinx

Base du laboratoire 2 de CEG 3555 : ALU signée à point fixe.
Cible : Digilent Nexys A7-100T, FPGA `xc7a100tcsg324-1`.

## État du projet

Structure initiale uniquement : les circuits arithmétiques, le contrôleur
 d'affichage et les bancs d'essai restent à réaliser. Aucun résultat de
simulation, synthèse ou programmation de carte n'est encore validé.

## Organisation

- `src/` : sources VHDL et interface du module supérieur `alu_top`.
- `sim/` : futurs bancs d'essai.
- `constraints/` : contraintes à compléter selon le tableau 5 de l'énoncé.
- `scripts/create_project.tcl` : création reproductible du projet Vivado.
- `docs/` : pseudocode, diagrammes ASM et notes de conception.
- `build/` : projet Vivado généré, exclu de Git.

## Créer le projet

Depuis ce dossier, dans un terminal où Vivado est disponible :

```sh
vivado -mode batch -source scripts/create_project.tcl
```

Ou dans la console Tcl de Vivado :

```tcl
source /chemin/vers/Lab2_VivadoXilinx/scripts/create_project.tcl
```

Le script refuse d'écraser un projet existant. Ouvrir ensuite
`build/lab2/lab2.xpr`. Ajouter les sources, contraintes et bancs d'essai
au fur et à mesure. Le script importe les fichiers présents à sa création.

## Interfaces prévues

Opérandes signés de 4 bits en complément à 2.

| OperationSelect | Opération | MuxOut |
| --- | --- | --- |
| 00 | Addition | 0000 & somme sur 4 bits |
| 01 | Soustraction | 0000 & différence sur 4 bits |
| 10 | Multiplication | produit sur 8 bits |
| 11 | Division | reste sur 4 bits & quotient sur 4 bits |

Les indicateurs sont `CarryOut`, `ZeroOut` et `OverflowOut`.
`GClock` commande les étapes de calcul ; `CLK100MHZ` rafraîchit l'affichage.

## À réaliser

1. Additionneur 1 bit et additionneur/soustracteur structurel de 4 bits.
2. Pseudocode, ASM, chemins de données et commande des unités signées.
3. Multiplicateur et diviseur signés structurels, sans conversion préalable
   des opérandes négatifs en valeurs positives (section 6 de l'énoncé).
4. Contrôleur d'affichage multiplexé et intégration structurelle.
5. Contraintes de broches et d'horloge, simulations et vérification sur carte.

Préciser les conventions de retenue/emprunt, de dépassement, de division par
zéro et du signe du reste avant les tests. Respecter les restrictions VHDL,
RTL/structurelles et l'absence de cœurs IP de l'énoncé.
