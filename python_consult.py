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
    user_input = user_input.replace('ç', 'c')# substitui ç por c
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
    
    resultado = None
    if request.method == "POST":

        user_input = request.form["consulta"]
        clima, area, lingua, motivacao = process_input(user_input)

        consulta = f"pais_flexivel({clima if clima else '_'}, {area if area else '_'}, {lingua if lingua else '_'}, {motivacao if motivacao else '_'}, Pais)"

        resultado_query = list(prolog.query(consulta))# parar de duplicar paises

        if resultado_query:
            #resultado = resultado_query[0]["Pais"]
            resultado = list(set([item["Pais"] for item in resultado_query]))
        else:
            resultado = "Nenhum pais encontrado."
        #else:
        #    resultado = "Tente ser mais específico."

    return render_template("index.html", resultado=resultado)

if __name__ == "__main__":
    app.run(debug=True)
