def find(item, lista):
    for i in range(len(lista)):
        if(lista[i] == item):
            return i

def swap(pos1, pos2, lista):
    lista[pos1], lista[pos2] = lista[pos2], lista[pos1]