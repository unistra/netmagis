# $Id: bandeau.tcl,v 1.2 2007-03-13 21:07:58 pda Exp $

proc xxx_elementtableau {bgcoul titre texte} {
    #
    # mettre le titre s'il y a besoin
    #
    if {[string length $titre] > 0} then {
	set titre "<STRONG><FONT COLOR=\"#FF3D3D\">$titre</FONT></STRONG>"
    }

    #
    # Mettre le contenu s'il y a besoin
    #
    if {[string length $texte] > 0} then {
	set texte "<FONT SIZE=\"-1\">$texte</FONT>"
    }

    #
    # Tout mettre en forme
    #
    set bg ""
    if {[string length $bgcoul] > 0} then {
	set bg " BGCOLOR=\"$bgcoul\""
    }
    return "<TR><TD$bg>\n$titre$texte\n</TD></TR>"
}


proc htg_bandeau {} {
    global partie

    if [catch {set titre   [htg getnext]} v] then {error $v}
    if [catch {set contenu [htg getnext]} v] then {error $v}

    set titre [nettoyer-html $titre]
    regsub -all "\n" $titre "<BR>" titre

    set retour [xxx_elementtableau {} {} "<A HREF=\"/\">Retour au sommaire</A>"]
    set contenu "$retour\n$contenu"

    set partie(titrebandeau) $titre
    set partie(contenubandeau) $contenu

    return {}
}

proc htg_elementbandeau {} {
    if [catch {set titre [htg getnext]} v] then {error $v}
    if [catch {set refs  [htg getnext]} v] then {error $v}

    return [xxx_elementtableau {} $titre $refs]
}

proc htg_reference {} {
    if [catch {set texte [htg getnext]} v] then {error $v}
    return "<LI>$texte</LI>"
}