import utilsEnigma as u

alfabeto = 'a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z'.split(',')
r1_base = 'c,d,z,r,m,g,h,x,a,w,q,v,u,f,s,b,p,l,t,o,e,i,y,n,k,j'.split(',')
r2_base = 'v,e,w,o,a,s,x,d,h,r,c,y,q,j,n,p,t,k,b,l,m,f,u,z,g,i'.split(',')
r3_base = 'i,p,r,n,f,m,w,o,z,j,q,c,x,g,t,d,b,k,e,l,y,v,a,h,s,u'.split(',')
r4_base = 'd,q,n,t,s,x,z,r,o,j,b,a,k,c,g,e,y,p,u,i,h,f,l,m,v,w'.split(',')
r5_base = 'b,k,q,s,l,p,m,d,c,a,n,y,h,g,i,r,z,v,j,f,t,u,x,e,o,w'.split(',')
rf_base = 'o,k,y,x,v,g,f,s,t,q,b,w,n,m,a,u,j,z,h,i,p,e,l,d,c,r'.split(',')

rbases = [r1_base, r2_base, r3_base, r4_base, r5_base]

tomadas = input().split(' ')
rotores = input().split(' ')
for i in range(len(rotores)):
    rotores[i] = int(rotores[i])
initRotores = input().split(' ')

tm = 'a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z'.split(',')

for i in tomadas:
    a,b = i.split('/')
    u.swap(u.find(a,tm), u.find(b,tm), tm)

r1 = rbases[rotores[0] - 1][u.find(initRotores[0], alfabeto):26]
r1 += rbases[rotores[0] - 1][0:u.find(initRotores[0], alfabeto)]

r2 = rbases[rotores[1] - 1][u.find(initRotores[1], alfabeto):26]
r2 += rbases[rotores[1] - 1][0:u.find(initRotores[1], alfabeto)]

r3 = rbases[rotores[2] - 1][u.find(initRotores[2], alfabeto):26]
r3 += rbases[rotores[2] - 1][0:u.find(initRotores[2], alfabeto)]

palavra = input()

for i in range(len(palavra)):
    letra = palavra[i]
    letra = tm[u.find(letra, alfabeto)]
    letra = r1[u.find(letra, alfabeto)]
    letra = r2[u.find(letra, alfabeto)]
    letra = r3[u.find(letra, alfabeto)]
    letra = rf_base[u.find(letra, alfabeto)]
    letra = alfabeto[u.find(letra, r3)]
    letra = alfabeto[u.find(letra, r2)]
    letra = alfabeto[u.find(letra, r1)]
    letra = alfabeto[u.find(letra, tm)]

    r3.append(r3[0])
    del r3[0]

    print(letra, end='')
