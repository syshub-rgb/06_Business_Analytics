
"""
Stream de Dados do Twitter com MongoDB, Pandas e Scikit Learn
Esse é um projeto academigo da Data Science Academy
Data Science Academy - Python Fundamentos - Capítulo 6

Esse projeto subiu com poucos dados, mas o original está salvo

"""

# Importando os módulos Tweepy, Datetime e Json

from tweepy.streaming import StreamListener
from tweepy import  OAuthHandler
from tweepy import Stream
from datetime import datetime
import json


# Adicione aqui sua Consumer Key
#consumer_key = "xxxxxxxxx"
 

# Adicione aqui sua Consumer Secret
#consumer_secret = "xxxxxxxxx"


# Adicione aqui seu Access Token
#access_token = "xxxxxxxxx"


# Adicione aqui seu Access Token Secret
#access_token_secret = "xxxxxxxxx"



# Criando as chaves de autenticação
auth = OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token,access_token_secret)

# Criando uma classe para capturar os stream de dados do Twitter e
# armazenar no MongoDB

class MyListener(StreamListener):
    def on_data(self, dados):
        tweet = json.loads(dados)
        created_at = tweet["created_at"]
        id_str = tweet["id_str"]
        text = tweet["text"]
      
	  
        print (obj)
        return True

# Criando o objeto mylistener
mylistener = MyListener()

# Criando o objeto mystream
mystream = Stream(auth, listener = mylistener)

# Preparando a Conexão com o MongoDB
from pymongo import MongoClient

# Criando a conexão ao MongoDB
client = MongoClient('localhost', 27017)

# Criando o banco de dados twitterdb
db = client.twitterdb

# Criando a collection "col"
col = db.tweets

# Criando uma lista de palavras chave para buscar nos Tweets
keywords = ['Big Data', 'Python', 'Data Mining', 'Data Science','Bolsonaro']

# Coletando os Tweets
# Iniciando o filtro e gravando os tweets no MongoDB
mystream.filter(track=keywords)

mystream.disconnect()

# Verificando um documento no collection
print(col.find_one())



























































































