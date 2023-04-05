// Incluye la biblioteca Servo
# incluir  < Servo.h > .
// Define los pines Tirg y Echo del sensor ultrasónico
const  int trigPin = 13 ;
const  int echoPin = 12 ;
// Variables para la duración y la distancia
larga duración;
distancia int ;
Servo miServo; // Crea un objeto servo para controlar el servomotor
 configuración vacía () {
  pinMode (pin de disparo, SALIDA); // Establece el trigPin como una salida
  pinMode (echoPin, ENTRADA); // Establece el echoPin como una entrada
  De serie. comenzar ( 9600 );
  miServo. adjuntar ( 9 ); // Define en qué pin está conectado el servomotor
}
 bucle vacío () {
  // gira el servomotor de 15 a 165 grados
  para ( int i= 15 ;i<= 165 ;i++){  
  miServo. escribir (yo);
  retraso ( 10 );
  distancia = calcularDistancia (); // Llama a una función para calcular la distancia medida por el sensor ultrasónico para cada grado
  
  De serie. imprimir (yo); // Envía el grado actual al Puerto Serie
  De serie. imprimir ( " , " ); // Envía el carácter adicional justo al lado del valor anterior necesario más adelante en el IDE de procesamiento para la indexación
  De serie. imprimir (distancia); // Envía el valor de la distancia al puerto serie
  De serie. imprimir ( " . " ); // Envía el carácter adicional justo al lado del valor anterior necesario más adelante en el IDE de procesamiento para la indexación
  }
  // Repite las lineas anteriores de 165 a 15 grados
  para ( int i= 165 ;i> 15 ;i--){  
  miServo. escribir (yo);
  retraso ( 10 );
  distancia = calcularDistancia ();
  De serie. imprimir (yo);
  De serie. imprimir ( " , " );
  De serie. imprimir (distancia);
  De serie. imprimir ( " . " );
  }
}
// Función para calcular la distancia medida por el sensor ultrasónico
int  calcularDistancia (){
  
  escritura digital (pin de disparo, BAJO);
  retrasoMicrosegundos ( 2 );
  // Establece el trigPin en estado ALTO durante 10 microsegundos
  escritura digital (pin disparador, ALTO);
  retrasoMicrosegundos ( 10 );
  escritura digital (pin de disparo, BAJO);
  duración = pulseIn (echoPin, HIGH); // Lee el echoPin, devuelve el tiempo de viaje de la onda de sonido en microsegundos
  distancia= duración* 0.034 / 2 ;
  distancia de retorno ;
}
