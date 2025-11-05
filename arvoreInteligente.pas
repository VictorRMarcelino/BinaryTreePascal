Program arvoreInteligente;

type ptrNode = ^node;
	   node = record
							value: string;
							left, right: ptrNode;
						end;

procedure criaOpcoesPergunta(var nodeElement:ptrNode; answerNo, answerYes: string);
var nodeNo, nodeYes: ptrNode;
begin;
	new(nodeNo);
	nodeNo^.value := answerNo;
	nodeNo^.left := nil;
	nodeNo^.right := nil;
	
	new(nodeYes);
	nodeYes^.value := answerYes;
	nodeYes^.left := nil;
	nodeYes^.right := nil;
	
	nodeElement^.left := nodeNo;
	nodeElement^.right := nodeYes;
end;

procedure loopPerguntas(nodeElement:ptrNode);
var nodeEscolha: ptrNode;
var novaPergunta, respostaCorreta, respostaAntiga: string;
var answer: byte;
begin;
	clrscr; 
	nodeEscolha := nodeElement;

	while ((nodeEscolha^.left <> nil) AND (nodeEscolha^.right <> nil)) do
		begin;
			writeln(nodeEscolha^.value, ' (Informe a resposta com número)');
			writeln('1 - Sim');
			writeln('2 - Não');
			readln(answer);
			writeln('');
			
			if (answer = 1) then
				begin;
					nodeEscolha := nodeEscolha^.right;
				end
			else
				begin;
					nodeEscolha := nodeEscolha^.left;
				end;
		end;
		
	writeln('O seu campeão é o(a) ', nodeEscolha^.value, '? (Informe a resposta com número)');
	writeln('1 - Sim');
	writeln('2 - Não');
	readln(answer);
	writeln('');
			
	if (answer = 1) then
		begin;
			writeln('Campeão Encontrado! Jogo encerrado! Deseja jogar novamente?');
			writeln('1 - Sim');
			writeln('2 - Não');
			readln(answer);
			writeln('');
					
			if (answer = 1) then
				begin;
					loopPerguntas(nodeElement);
				end
			else
				begin;
					exit;
				end;	
		end
	else
		begin;
		  respostaAntiga := nodeEscolha^.value;
			writeln('Qual campeão você pensou?');
			readln(respostaCorreta);
			writeln('');
			writeln('Qual pergunta pode diferenciar ', respostaCorreta, ' de ', respostaAntiga, '?');
			readln(novaPergunta);
			writeln('');
			nodeEscolha^.value := novaPergunta;
			criaOpcoesPergunta(nodeEscolha, respostaAntiga, respostaCorreta);
			loopPerguntas(nodeElement);
		end;
end;

procedure init();
var root: ptrNode;
begin;
	writeln('Pense em um campeão do lol');
	new(root);
	root^.value := 'Esse campeão ataca de longa distância?';
	criaOpcoesPergunta(root, 'Garen', 'Ashe');
	loopPerguntas(root);
end;

Begin
	init();
End.