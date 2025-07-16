# Usa la imagen oficial de Golang
FROM golang:1.22

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos go.mod y go.sum y descarga dependencias
COPY go.mod ./
COPY go.sum ./
RUN go mod download

# Copia el resto del código
COPY . ./

# Compila la app
RUN go build -o main ./cmd/main.go

# Expone el puerto 8080
EXPOSE 8080

# Comando por defecto para ejecutar
CMD ["/app/main"]
