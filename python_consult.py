from flask import Flask, render_template, request
from pyswip import Prolog
import nltk
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords
from unidecode import unidecode

nltk.download("punkt")

nltk.download("stopwords")

app = Flask(__name__)
prolog = Prolog()
prolog.consult('paises.pl')

def process_input(user_input):
    
    # substituições de palavras
    user_input = user_input.replace('ç', 'c')
    user_input = user_input.replace('melhoria de vida', 'melhoria_de_vida')
    user_input = user_input.replace('rurais', 'rural')
    
    user_input = unidecode(user_input.lower())#ignora os acentos e deixa os texto minusculos
    tokens = word_tokenize(user_input)

    stop_words = set(stopwords.words('portuguese'))
    filtered_tokens = [word for word in tokens if word not in stop_words]

    clima = next((word for word in filtered_tokens if word in ['quente', 'frio', 'moderado']), None)
    area = next((word for word in filtered_tokens if word in ['urbana', 'rural']), None)
    lingua = next((word for word in filtered_tokens if word in ['ingles', 'espanhol', 'portugues']), None)
    motivacao = next((word for word in filtered_tokens if word in ['educacao', 'trabalho', 'melhoria_de_vida']), None)

    return clima, area, lingua, motivacao

@app.route("/", methods=["GET", "POST"])
def consulta_pais():
    
    resultado = []
    mensagem = ""  # mensagem erro

    if request.method == "POST":
        user_input = request.form["consulta"]

        if not user_input.strip():
            mensagem = "Digite algo para que possamos identificar um país ideal para você."
        else:
            clima, area, lingua, motivacao = process_input(user_input)

            if not any([clima, area, lingua, motivacao]):
                mensagem = "Digite algo válido como clima, área, língua ou motivação"
                
            else:
                consulta = f"pais_flexivel({clima if clima else '_'}, {area if area else '_'}, {lingua if lingua else '_'}, {motivacao if motivacao else '_'}, Pais, Descricao)"
                resultado_query = list(prolog.query(consulta))

                if resultado_query:

                    resultado = []
                    for item in resultado_query:
                        pais = item["Pais"].encode('latin1').decode('utf-8')                # tirar o erro de caracter especial
                        descricao = item["Descricao"].encode('latin1').decode('utf-8')

                        if not any(d["pais"] == pais for d in resultado):
                            resultado.append({"pais": pais, "descricao": descricao})
                else:
                    mensagem = "Nenhum país encontrado."

    return render_template("index.html", resultado=resultado, mensagem=mensagem)

if __name__ == "__main__":
    app.run(debug=True)
