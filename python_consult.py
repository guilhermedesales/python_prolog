from pyswip import Prolog # pip3 install pyswip Collecting pyswip

prolog = Prolog()
prolog.consult('paises.pl')

def consulta_pais(clima, area, lingua, motivacao):
    consulta = f"pais({clima}, {area}, {lingua}, {motivacao}, Pais)"
    resultado = list(prolog.query(consulta))
    
    if resultado:
        pais = resultado[0]['Pais']
        print(f'O país sugerido é: {pais}')
    else:
        print('algum erro de digitação')

def main():

    clima = input('Qual o clima de preferência? (quente, frio): ')

    area = input('Qual a área de preferência? (urbana, rural): ')

    lingua = input('Qual a língua nativa de preferência? (ingles, espanhol, portugues): ')
    
    motivacao = input('Qual a sua motivação de mudança? (educacao, trabalho, melhoria_de_vida): ')
    
    consulta_pais(clima, area, lingua, motivacao)

if __name__ == '__main__':
    main()
