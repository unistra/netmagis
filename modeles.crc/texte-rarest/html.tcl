#
# $Id: html.tcl,v 1.2 2007-03-13 21:08:03 pda Exp $
#
# Mod�le "texte"
#
# Historique
#   1998/06/15 : pda : conception
#   1999/06/20 : pda : s�paration du langage HTML
#   1999/07/02 : pda : simplification
#   1999/07/25 : pda : int�gration des tableaux de droopy
#

#
# Inclure les directives de formattage de base
#

inclure-tcl include/html/base.tcl

###############################################################################
# Proc�dures de conversion HTML sp�cifiques au mod�le
###############################################################################

proc htg_titre {} {
    if [catch {set niveau [htg getnext]} v] then {error $v}
    check-int $niveau
    if [catch {set texte  [htg getnext]} v] then {error $v}
    switch $niveau {
	1	{
	    set texte "<CENTER><FONT COLOR=\"#286B7A\"><H2><BR>$texte</H2></FONT></CENTER>"
	}
	2	{
	    set texte "<FONT COLOR=\"#FF3D3D\"><H3>$texte</H3></FONT>"
	}
	default	{
	    incr niveau
	    set texte "<H$niveau>$texte</H$niveau>"
	}
    }
    return $texte
}

proc htg_partie {} {
    global partie

    if [catch {set id [htg getnext]} v] then {error $v}
    if [catch {set texte [htg getnext]} v] then {error $v}
    set texte [nettoyer-html $texte]

    switch -exact $id {
	banniere	-
	titrepage	{
	    regsub -all "\n" $texte "<BR>\n" texte
	}
	default {
	    regsub -all "\n\n+" $texte "<P>" texte
	}
    }

    set partie($id) $texte
    return {}
}

###############################################################################
# Proc�dures du bandeau, communes � tous les mod�les
###############################################################################

inclure-tcl include/html/bandeau.tcl
