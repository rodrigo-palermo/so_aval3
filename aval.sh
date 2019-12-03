# Script Avaliacao 3: Menu Linux
menu="\n-----------------------------"
menu+="\n------~- MENU LINUX -~-------"
menu+="\n-----------------------------"
menu+="\n 1- Criar pasta"
menu+="\n 2- Criar arquivo"
menu+="\n 3- Backup"
menu+="\n 4- Calculadora"
menu+="\n 5- Navegador"
menu+="\n 6- Abrir link no Navegador"
menu+="\n 7- Listar/Terminar processo"
menu+="\n 0- SAIR"
menu+="\n-----------------------------"
opcao=99
while [ $opcao -gt 0 ]
do  
    echo -e $menu
    echo -n "Escolha uma opcao: "; read opcao
    case $opcao in
    1) 
        echo '...'
        ;;
    
    2)  
        echo '...'
        ;;

    3) 
        echo -e '\n Iniciando PROGRAMA DE BACKUP...'
        echo -n " Pasta origem: ";read origem
        if ls $origem >> log.txt
        then
         echo "  A pasta $origem existe."
         echo -n " Pasta destino: "; read destino
         if ls $destino >> log.txt
         then
          echo "  A pasta $destino existe."
         else
          echo "  Criando a pasta destino"
          mkdir $destino
         fi
         echo -n " Selecione a extensao dos arquivos: ";read ext
         contagemGeral=`ls $origem/* | grep -c .`
         contagemExt=`ls $origem/*.$ext | grep -c .$ext`
         echo "Total de arquivos da pasta: $contagemGeral"
         echo "Total de arquivos selecionados: $contagemExt"
         if cp $origem/*.$ext $destino
         then
          echo "  Backup realizado com sucesso."
         else
          echo "  Erro ao fazer backup"
          #exit
         fi
        else
         echo "  A pasta $origem nao existe."
         #exit
        fi
        ;;

    4) 
        echo -e '\n Iniciando CALCULADORA...'
        # comando calc no bash do vs code - windows
        calc
        echo -e "\n Calculadora foi aberta em outra janela."
        ;;

    5)
        echo -e '\n Iniciando NAVEGADOR...'
        # comando start no bash vscode - windows
        start firefox
        echo -e "\n Navegador foi aberto em outra janela."
        ;;

    6)
        echo -n -e '\n Digite o link: '; read link
        echo -e '\n Iniciando NAVEGADOR...'
        # comando start no bash vscode - windows
        start firefox $link
        echo -e "\n Navegador foi aberto em outra janela."
        ;;
    
    7)  
        echo -e '\n Iniciando LISTAGEM DE PROCESSOS...\n'
        ps
        echo -e '\n Digite o PID do processo para terminar: '

    esac
    # CLEAR
done
echo 'Programa finalizado.'