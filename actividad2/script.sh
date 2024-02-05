GITHUB_USER=${GITHUB_USER}


if [ -z "$GITHUB_USER" ]; then
  echo "La variable GITHUB_USER no está definida."
  exit 1
fi

URL="https://api.github.com/users/$GITHUB_USER"

RESPONSE=$(curl -s $URL)

USER_NAME=$(echo $RESPONSE | jq -r '.login')
USER_ID=$(echo $RESPONSE | jq -r '.id')
CREATED_AT=$(echo $RESPONSE | jq -r '.created_at')

echo "Hola $USER_NAME. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT."

LOG_DIR="/tmp/$(date +%F)"
mkdir -p $LOG_DIR

echo "Hola $USER_NAME. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT." >> "$LOG_DIR/saludos.log"
