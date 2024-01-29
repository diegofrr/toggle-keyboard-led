#!/bin/bash

# Obter o nome do dispositivo do teclado associado ao "scrolllock"
keyboard_device=$(brightnessctl -ls | grep "scrolllock" | awk -F"'" '{print $2}')

# Verificar se o dispositivo do teclado foi encontrado
if [ -z "$keyboard_device" ]; then
    echo "Dispositivo do teclado não encontrado."
    exit 1
fi

# Exibir o nome do dispositivo do teclado
echo "Dispositivo do teclado encontrado: $keyboard_device"

# Obter o valor atual do LED do teclado
current_led_value=$(brightnessctl --device="$keyboard_device" get)

# Definir o valor desejado para o LED do teclado (inverter o estado atual)
if [ "$current_led_value" -eq 1 ]; then
    led_value=0
else
    led_value=1
fi

# Configurar o LED do teclado com o valor desejado
brightnessctl --device="$keyboard_device" set "$led_value"

# Exibir mensagem indicando que o LED foi configurado
echo "LED do teclado configurado para $led_value."
