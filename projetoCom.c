#include <stdio.h>

#define OPEN 0
#define CLOSED 1

#define FLOOR_0 0
#define FLOOR_1 1
#define FLOOR_2 2

#define MAX_PEOPLE 3
#define MIN_PEOPLE 0


typedef struct Estado {
    int level, door, people;
} Estado;

Estado estadoAtual;
char command;

void init(){
    estadoAtual.level = FLOOR_0;
    estadoAtual.door = CLOSED;
    estadoAtual.people = 0;
}


void print(Estado estado){
    printf("\nO elevador está no andar %d\n",estadoAtual.level);
    if(estadoAtual.door)
        printf("O elevador está com a porta fechada\n");
    else
        printf("O elevador está com a porta aberta\n");
    printf("O elevador tem %d pessoas\n",estadoAtual.people);
}

void description(){
    printf("\n~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*\n\n");
    printf("   Maquina de estados para simular um elevador com capacidade de 3 pessoas\nem um edificio com 3 andares \n");
    printf("   Para comandar o elevador são disponibilizadas os seguintes comandos:\n\n");
    printf("^ -> subir de andar\n");
    printf("v -> descer de andar\n");
    printf("[ -> abrir a porta para a entrada de pessoas\n");
    printf("] -> fecha a porta para o elevador poder se mover\n");
    printf("+ -> uma pessoa entrou no elevador\n");
    printf("- -> uma pessoa saiu no elevador\n");
    printf("q -> acaba a execução da maquina de estados\n");
    printf("\n~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*\n");
}

char option(){
    printf("\nInsira a opção que deseja: ");
    command = getchar();
    getchar();
    return command;
}


void solve(){
    description();
    while(1){
        

        print(estadoAtual);
        switch(option()){
            case '[':
                estadoAtual.door = OPEN;
            break;

            case ']':
                estadoAtual.door = CLOSED;
            break;

            case '^':
                if(estadoAtual.level == FLOOR_2)
                    printf("\n----------------- ERRO --------------\n        -> Você já está no último andar\n\n");
                else if(estadoAtual.door == OPEN)
                    printf("\n----------------- ERRO --------------\n        -> Você não pode subir com o elevador de porta aberta\n\n");
                else
                    estadoAtual.level = estadoAtual.level + 1;
            break;

            case 'v':
                if(estadoAtual.level == FLOOR_0)
                    printf("\n------------------ ERRO ------------------\n        -> Você já está no térreo\n\n") ;
                else if(estadoAtual.door == OPEN)
                    printf("\n----------------- ERRO --------------\n        -> Você não pode descer com o elevador de porta aberta\n\n");
                else
                    estadoAtual.level = estadoAtual.level - 1;
            break;

            case '+':
                if(estadoAtual.door == CLOSED)
                    printf("\n------------------ ERRO ------------------\n        -> A porta do elevador está fechada\n\n");
                else if(estadoAtual.people == MAX_PEOPLE)
                    printf("\n------------------ ERRO ------------------\n        -> O elevador está cheio\n\n");
                else
                    estadoAtual.people = estadoAtual.people + 1;
            break;
            
            case '-':
                if(estadoAtual.door == CLOSED)
                    printf("\n------------------ ERRO ------------------\n        -> A porta do elevador está fechada\n\n");
                else if(estadoAtual.people == MIN_PEOPLE)
                    printf("\n------------------ ERRO ------------------\n        -> O elevador está vazio\n\n");
                else
                    estadoAtual.people = estadoAtual.people - 1;
            break;
            
            case 'q':
                return;
            break;

            default:
                printf("\n--------------- COMANDO NÃO EXISTE --------------\n\n");
        }     
    }

}


int main(){
   init();
   solve();
}