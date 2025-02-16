***************************************************************
*---------------------------CLASE 1---------------------------*
*----------------Prof. Renzo Álvarez Carcheri-----------------*
*----------------Alumno. Benjamin Camizán-----------------*
***************************************************************
*1. Limpiando área de trabajo
clear all           //Limpiar todo
cls                //Dejar la ventana de resultados en blanco

*2. Definiendo macros
global root "C:\Users\Benjamin\Downloads\STATA EXPERTO"

	gl data $root\data          

	gl dofile $root\do

	gl output $root\output

* RECUERDA: El global (gl) es una macro que engloba la carpeta de trabajo y las sub carpetas de trabajo.

*3. Importando base de datos
/*Importar Excel
 - Sheet: Colocar la hoja a importar. Ejemplo "Anuales"
 - firstrow: trata la primera fila de datos de Excel como nombres de variables
 - clear: Borrar memoria y sobreescribir */
import excel "$data\Datos.xlsx", sheet("Anuales") firstrow clear 

/* Importar CSV
- comma: Si la separación son comas
- varnames(4): Estoy indincando que el nombre de las variables comienzen desde la fila 4 porque ahí considera los encabezados. 
*/
import delimited "$data\Data_Carros.csv", delimiter(comma) varnames(4) clear

sysuse auto

//====================================================================

*1. Principales comandos1
/*
 - help Ayuda de programa STATA para comandos
 - use Abrir una base de datos en STATA (extensión.dta)
 - codebook Muestra variables con estadísticos descriptivos
 - decribe Describe contenido de datos en memoria o sobre el disco
 - save Guarda los datos en disco con extensión*.dta
 - list Lista de valores de variable
 - drop Borrar variable o dato en memoria
 - keep Borra variables o datos no seleccionado
 */
 *------------------------------------------------
*2.  Principalescomandos2
 /*
 - sort Ordenardatosdemenoramayor
 - gsort Ordena datos de mayor a menor(signo+)
 - label Permite darle una etiqueta a cada variable
 - generate Describe contenido de datos en memoria o sobre el disco
 - replace Reemplaza observaciones de variable
 - table Crea tabla
 - tabulate Tabulación de variable.
 - tabstat Crea tabla con principales estadísticos descriptivos.
 */
  *------------------------------------------------
 *3. PREGUNTAS SURGUIDAS EN CLASE: 
  /* ¿Cuál es el cmd que funciona como ctrl Z?
  */
   *------------------------------------------------
  *4. CMD sumarize: Para ganar tiempo y me saque todas las estadisticas de una sola. Colocar la primera variable "-" y la última variable.
 
 *------------------------------------------------
  *5. OPERADORES: 
   /* Aritmética: 
   Suma (+)
   resta (-)
   multiplicación (*)
   División (/)
   Potenciación (^)
   Negación (-)
   Concatenación de string (+)
*/

    /* Logicos
	Y (&)             Es simultáneo: es A y B
	o (|)             Es disyuntivo: es A o B.
	No (!)
	No (~) 
	*/
	
	/* Relacional (Numérico y string)
	> mayor que
	< menor que
	>= mayor igual que
	<= menor igual que
	== igual
	!= No igual
	~= No igual
*/

* Ejemplo: 
 list precio if altura==40 & ancho<=72
 
  *------------------------------------------------
  *6. DOFILE
  *Abrir dofile con teclas: ctrl + 9
  
 
 
//=================================================================

br
br price rep78 weight length displacement-foreign
br rep78-turn
br price rep78 weight length
br in 11/23
br, nolabel
br price foreign, nolabel
br price foreign nolabel


help codebook
codebook
set more on

h operators
br price rep78 weight length if price<8000
br if price>8000
br if price<8000
br if foreign=1
br if foreign==1

codebook, com

sum price rep78 weight length


findit create variables      //CMD que ayuda a buscar comandos. Es un buscador de ayuda.
h generate
gen compra=1 if precio<=7000
gen compra=1 if price<=7000
replace compra=0 if compra==.
sum compra
codebook compra
compra1=(price<=7000)
g compra1=(price<=7000)
codebook compra1
h tabulate
tab precio
ta precio
ta precio, m
ta precio
ta altura, nol
ta precio altura
h table
table precio
table precio altura
table foreign rep78, row col
table rep78 foreign , row col
table rep78 foreign compra , row col
table foreign rep78, row col c(mean price)
table foreign rep78, row col c(max price mean price min price)
table precio ancho, row col c(count precio max precio mean precio min precio)
findit table
findit frequency table
tabstat precio altura
tabstat precio altura, s(sw k med mean n)
tabstat precio altura, s(sk k med mean n)
h histogram
histogram precio
histogram precio, bin(20)
histogram precio, bin(20)
histogram precio, bin(20) normal


