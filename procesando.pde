proceso de importación.serial  .* ; // importa biblioteca para comunicación serial

importar  java.awt.event.KeyEvent ; // importa la biblioteca para leer los datos del puerto serie
importar  java.io.IOException ;
Serial myPort; // define el objeto en serie
// descifra variables
Angulo de cuerda = " " ;
Distancia de cadena = " " ;
Cadena datos = " " ;
String noObjeto;  
float pixsDistance;
int iÁngulo, iDistancia;
índice int1 = 0 ;
int índice2 = 0 ;
PFont orcFont;
 configuración vacía () {
  
 tamaño ( 1200 , 700 ); // ***CAMBIA ESTO A LA RESOLUCIÓN DE TU PANTALLA***
 suave ();
 Cadena portName =  Serial . lista()[ 3 ]; // cambie el 0 a 1 o 2, etc. para que coincida con su puerto
myPort =  new  Serial ( this , portName, 9600 );
miPuerto . bufferHasta( ' . ' ); // lee los datos del puerto serie hasta el caracter '.'. Así que en realidad dice esto: ángulo, distancia.
}
 empate vacío ( ) {
  
  llenar ( 98 , 245 , 31 );
  // simulando el desenfoque de movimiento y el desvanecimiento lento de la línea en movimiento
  sin carrera ();
  relleno ( 0 , 4 );
  rect ( 0 , 0 , ancho , alto - alto * 0.065 );
  
  llenar ( 98 , 245 , 31 ); // color verde
  // llama a las funciones para dibujar el radar
  dibujarRadar();
  Dibujar linea();
  dibujarObjeto();
  dibujarTexto();
}
void  serialEvent ( Serial  myPort ) { // comienza a leer datos del puerto serie
  // lee los datos del puerto serie hasta el carácter '.' y lo pone en la variable de cadena "datos".
  datos = miPuerto . leerCadenaHasta( ' . ' );
  datos = datos . subcadena ( 0 , datos . longitud () - 1 );
  
  índice1 = datos . índiceDe( " , " ); // encuentra el caracter ',' y lo pone en la variable "index1"
  ángulo = datos . subcadena ( 0 , índice1); // lee los datos desde la posición "0" hasta la posición de la variable index1 o ese es el valor del ángulo que la placa Arduino envió al puerto serie
  distancia = datos . subcadena (índice1 + 1 , datos . longitud ()); // lee los datos desde la posición "index1" hasta el final de los datos pr ese es el valor de la distancia
  
  // convierte las variables de cadena en enteros
  iAngle =  int (ángulo);
  iDistance =  int (distancia);
}
 dibujarRadar vacío () {
  empujarMatriz ();
  traducir ( ancho / 2 , alto - alto * 0.074 ); // mueve las coordenadas iniciales a una nueva ubicación
  sin relleno ();
  peso del trazo ( 2 );
  trazo ( 98 , 245 , 31 );
  // dibuja las lineas del arco
  arc ( 0 , 0 ,( ancho - ancho * 0.0625 ),( ancho - ancho * 0.0625 ), PI , TWO_PI );
  arc ( 0 , 0 ,( ancho - ancho * 0.27 ),( ancho - ancho * 0.27 ), PI , TWO_PI );
  arc ( 0 , 0 ,( ancho - ancho * 0.479 ),( ancho - ancho * 0.479 ), PI , TWO_PI );
  arc ( 0 , 0 ,( ancho - ancho * 0.687 ),( ancho - ancho * 0.687 ), PI , TWO_PI );
  // dibuja las líneas de los ángulos
  línea ( - ancho / 2 , 0 , ancho / 2 , 0 );
  línea ( 0 , 0 ,( - ancho / 2 ) * cos ( radianes ( 30 )),( - ancho / 2 ) * sin ( radianes ( 30 )));
  línea ( 0 , 0 ,( - ancho / 2 ) * cos ( radianes ( 60 )),( - ancho / 2 ) * sin ( radianes ( 60 )));
  línea ( 0 , 0 ,( - ancho / 2 ) * cos ( radianes ( 90 )),( - ancho / 2 ) * sin ( radianes ( 90 )));
  línea ( 0 , 0 ,( - ancho / 2 ) * cos ( radianes ( 120 )),( - ancho / 2 ) * sin ( radianes ( 120 )));
  línea ( 0 , 0 ,( - ancho / 2 ) * cos ( radianes ( 150 )),( - ancho / 2 ) * sin ( radianes ( 150 )));
  línea (( - ancho / 2 ) * cos ( radianes ( 30 )), 0 , ancho / 2 , 0 );
  popMatrix ();
}
void  dibujarObjeto () {
  empujarMatriz ();
  traducir ( ancho / 2 , alto - alto * 0.074 ); // mueve las coordenadas iniciales a una nueva ubicación
  peso del trazo ( 9 );
  trazo ( 255 , 10 , 10 ); // color rojo
  pixsDistance = iDistance * (( altura - altura * 0.1666 ) * 0.025 ); // cubre la distancia desde el sensor de cm a píxeles
  // limitando el rango a 40 cms
  si (iDistancia < 40 ){
    // dibuja el objeto según el ángulo y la distancia
  línea (pixsDistance * cos ( radianes (iAngle)), - pixsDistance * sin ( radianes (iAngle)),( ancho - ancho * 0.505 ) * cos ( radianes (iAngle)), - ( ancho - ancho * 0.505 ) * sin ( radianes (iAngle)));
  }
  popMatrix ();
}
void  dibujarLinea () {
  empujarMatriz ();
  peso del trazo ( 9 );
  trazo ( 30 , 250 , 60 );
  traducir ( ancho / 2 , alto - alto * 0.074 ); // mueve las coordenadas iniciales a una nueva ubicación
  línea ( 0 , 0 ,( altura - altura * 0.12 ) * cos ( radianes (iAngle)), - ( altura - altura * 0.12 ) * sin ( radianes (iAngle))); // dibuja la línea según el ángulo
  popMatrix ();
}
void  drawText () { // dibuja los textos en la pantalla
  
  empujarMatriz ();
  si (iDistancia > 40 ) {
  noObject =  " Fuera de Rango " ;
  }
  más {
  noObjeto =  " En Rango " ;
  }
  llenar ( 0 , 0 , 0 );
  sin carrera ();
  rect ( 0 , alto - alto * 0.0648 , ancho , alto );
  llenar ( 98 , 245 , 31 );
  tamaño de texto ( 25 );
  
  texto ( " 10cm " , ancho - ancho * 0.3854 , alto - alto * 0.0833 );
  texto ( " 20cm " , ancho - ancho * 0.281 , alto - alto * 0.0833 );
  texto ( " 30cm " , ancho - ancho * 0.177 , alto - alto * 0.0833 );
  texto ( " 40cm " , ancho - ancho * 0.0729 , alto - alto * 0.0833 );
  tamaño de texto ( 40 );
  texto ( " Radar " , ancho - ancho * 0.800 , alto - alto * 0.0200 );
  texto ( " Ángulo: "  + iAngle + " ° " , ancho - ancho * 0.48 , alto - alto * 0.0277 );
  // texto("Distancia: ", ancho-ancho*0.26, alto-alto*0.0277);
  si (iDistancia < 40 ) {
  texto ( " "  + iDistance + " cm " , ancho - ancho * 0.225 , alto - alto * 0.0277 );
  }
  tamaño de texto ( 25 );
  relleno ( 98 , 245 , 60 );
  traducir (( ancho - ancho * 0.4994 ) + ancho / 2 * cos ( radianes ( 30 )),( alto - alto * 0.0907 ) - ancho / 2 * sin ( radianes ( 30 )));
  rotar ( - radianes ( - 60 ));
  texto ( " 30° " , 0 , 0 );
  restablecerMatriz ();
  traducir (( ancho - ancho * 0.503 ) + ancho / 2 * cos ( radianes ( 60 )),( alto - alto * 0.0888 ) - ancho / 2 * sin ( radianes ( 60 )));
  rotar ( - radianes ( - 30 ));
  texto ( " 60° " , 0 , 0 );
  restablecerMatriz ();
  traducir (( ancho - ancho * 0.507 ) + ancho / 2 * cos ( radianes ( 90 )),( alto - alto * 0.0833 ) - ancho / 2 * sin ( radianes ( 90 )));
  rotar ( radianes ( 0 ));
  texto ( " 90° " , 0 , 0 );
  restablecerMatriz ();
  traducir ( ancho - ancho * 0.513 + ancho / 2 * cos ( radianes ( 120 )),( alto - alto * 0.07129 ) - ancho / 2 * sin ( radianes ( 120 )));
  rotar ( radianes ( - 30 ));
  texto ( " 120° " , 0 , 0 );
  restablecerMatriz ();
  traducir (( ancho - ancho * 0.5104 ) + ancho / 2 * cos ( radianes ( 150 )),( alto - alto * 0.0574 ) - ancho / 2 * sin ( radianes ( 150 )));
  rotar ( radianes ( - 60 ));
  texto ( " 150° " , 0 , 0 );
  popMatrix ();
}
