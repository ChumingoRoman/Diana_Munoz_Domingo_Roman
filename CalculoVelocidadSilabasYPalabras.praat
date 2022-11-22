# Script para Praat elaborado por 
# Domingo Román y Diana Muñoz
# Laboratorio de Fonética USACH
# 2022.
# Cálculo de velocidad: sílabas y palabras. Script para Praat 6.3.
# Para citar: Román, Domingo y Muñoz, Diana. 2022. Cálculo de velocidad: sílabas y palabras. Script para Praat 6.3. Alojado en 
# https://github.com/ChumingoRoman/Diana_Munoz_Domingo_Roman/edit/main/CalculoVelocidadSilabasYPalabras.praat

# Extrae las etiquetas de un TextGrid de un solo estrato
# Las etiquetas deben tener dos valores númericos separados por una coma
# el primer valor, corresponde a la cantidad de sílabas y el segundo, a la de palabras
# Entrega en una ventana de información las sílabas por segundo y las palabras por minuto.

tg = selected("TextGrid")

ene_intervalos = Get number of intervals: 1

for i to ene_intervalos
	etiqueta$ = Get label of interval: 1, i
	if etiqueta$ <> ""
		largo_etiqueta = length(etiqueta$)
		posicion_coma = index(etiqueta$, ",")
		n_silabas$ = left$(etiqueta$, largo_etiqueta-(posicion_coma-1))
		n_silabas = number(n_silabas$)
		n_palabras$ = right$(etiqueta$, (largo_etiqueta - posicion_coma))
		n_palabras = number(n_palabras$)

		fin_intervalo = Get end time of interval: 1, 2
		ini_intervalo = Get start time of interval: 1, 2
		dur_intervalo = fin_intervalo-ini_intervalo

		sil_por_segundo = n_silabas/dur_intervalo

		segundos_a_minutos = dur_intervalo/60

		palabras_por_minuto = n_palabras/segundos_a_minutos

		appendInfoLine: fixed$(sil_por_segundo,2),tab$,fixed$(palabras_por_minuto,2)

	endif

endfor
