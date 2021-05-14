# Importamos o Módulo PyMongo
import pymongo

# Criando a conexão com o MongoDB (neste caso, conexão padrão)
client_con = pymongo.MongoClient()

# Listando os bancos de dados disponíveis
print("Listando os bancos de dados disponíveis :" , client_con.database_names())

# Definindo o objeto db
db = client_con.twitterdb
print()

# Criando a collection "col"
col = db.tweets

# Listando as coleções disponíveis
print("Listando as coleções disponíveis :" ,db.collection_names())

# Verificando um documento no collection
print(col.find_one())
print()

# Análise de Dados com Pandas e Scikit-Learn
# criando um dataset com dados retornados do MongoDB

dataset = [{"created_at": item["created_at"],"text": item["text"],} for item in col.find()]

# Importando o módulo Pandas para trabalhar com datasets em Python
# Importando o módulo Scikit Learn
import pandas as pd
import sklearn
from sklearn.feature_extraction.text import CountVectorizer


print("Versão do Pandas: " , pd.__version__)
print("Versão do sklearn: " ,sklearn)
print()

# Criando um dataframe a partir do dataset
print("                 Criando um dataframe a partir do dataset                ")
df = pd.DataFrame(dataset)
print(df)


print("# Usando o método CountVectorizer para criar uma matriz de documentos")
cv = CountVectorizer()
count_matrix = cv.fit_transform(df.text)

print(" Contando o número de ocorrências das principais palavras em nosso dataset")
print()
word_count = pd.DataFrame(cv.get_feature_names(), columns=["word"])
word_count["count"] = count_matrix.sum(axis=0).tolist()[0]
word_count = word_count.sort_values("count", ascending=False).reset_index(drop=True)
print(word_count[:50])












