import json
import zipfile
import os


api_token = {"username":"pamepimentel","key":"8a74ecfeeb2cdcbc5a460020f87b9786"}

##conectar a kaggle con token
with open('C:/Users/USER/.kaggle/kaggle.json', 'w') as file:
    json.dump(api_token, file)

##determinar ruta de dataset
location = "C:/Users/USER/Documents/proyecto_parcial/dataset"

##validar que la carpeta exista
if not os.path.exists(location):
    os.makedirs(location)
else:
    for root, dirs, files in os.walk(location, topdown=False):
        for name in files:
            os.remove(os.path.join(root, name))
        for name in dirs:
            os.rmdir(os.path.join(root, name))

##se genera descarga de dataset desde plataforma KAGGLE
os.system("kaggle datasets download -d henryshan/starbucks -p C:/Users/USER/Documents/proyecto_parcial/dataset")

##vamos a carpeta con archivo.zip y lo descomprimimos
os.chdir('C:/Users/USER/Documents/proyecto_parcial/dataset')
for file in os.listdir():
    zip_ref = zipfile.ZipFile(file, 'r')
    zip_ref.extractall()
    zip_ref.close()