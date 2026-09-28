# Die Proteinstruktur und die ausgewählten Tunnel wurden aus der von CAVER Web 2.0
# ausgegebenen ZIP-Datei mit den CAVER-Daten in PyMOL geladen
# Der Code wurde direkt in PyMOL eingegeben und ausgeführt
# Hier ist MtoB2 als Beispiel gezeigt. Für die anderen Strukturen wurde das Skript analog
# mit den entsprechenden Struktur- und Tunnelobjekten verwendet
# "node3" ist nur ein Beispiel
# Für andere Strukturen wurde hier der jeweilige Objektname eingesetzt
# Das Struktur-Objekt "node3" diente hier als Referenz,
# an der die andere Struktur ausgerichtet wurde


align mtob2, node3

python

M = list(cmd.get_object_matrix("mtob2")) 

# Beim Alignment wird die Struktur gedreht und räumlich verschoben. 
# PyMOL speichert die dafür verwendete Drehung und Verschiebung in einer Transformationsmatrix
# Diese Information wird ausgelesen und als M 
# gespeichert, damit anschließend exakt dieselbe Bewegung auf die Tunnel angewendet wird 


for obj in [
    "MtoB2_tun_003", "MtoB2_tun_005", "MtoB2_tun_008", "MtoB2_tun_012", "MtoB2_tun_015",
    "MtoB2_tun_016", "MtoB2_tun_017", "MtoB2_tun_020", "MtoB2_tun_021", "MtoB2_tun_023",
    "MtoB2_tun_024", "MtoB2_tun_025", "MtoB2_tun_027", "MtoB2_tun_028", "MtoB2_tun_038"
]:

# PyMOL zählt die States ab 1. Da der Endwert bei range nicht mit eingeschlossen wird
# wird zur Anzahl der vorhandenen States 1 addiert
# sodass alle States vom ersten bis einschließlich des letzten durchlaufen 

    for st in range(1, cmd.count_states(obj) + 1):  

# Der jeweilige Tunnel-State wird mit derselben Drehung und Verschiebung wie die Proteinstruktur transformiert
# Mit homogenous = 0 wird M im PyMOL-eigenen Format verwendet

        cmd.transform_selection(obj, M, state=st, homogenous=0) 

python end
