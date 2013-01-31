CREATE TABLE topo.dr_vlan (
    idgrp       INT,            -- group upon which this access right applies
    vlanid      INT,

    PRIMARY KEY (idgrp, vlanid),
    FOREIGN KEY (idgrp) REFERENCES global.groupe (idgrp)
) ;
