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
	
	new(nodeYes);
	nodeYes^.value := answerYes;
	
	nodeElement^.left := nodeNo;
	nodeElement^.right := nodeYes;
end;

procedure loopPerguntas(nodeElement:ptrNode);
var nodeEscolha: ptrNode;
var novaPergunta, respostaCorreta: string;
var answer: byte;
begin;
	writeln(nodeElement^.value, ' (Informe a resposta com número)');
	writeln('1 - Sim');
	writeln('2 - Não');
	readln(answer);
	
	
	if (answer = 1) then
		begin;
			nodeEscolha := nodeElement^.right;
		end
	else
		begin;
			nodeEscolha := nodeElement^.left;
		end;
		
	writeln(nodeEscolha^.value, '? (Informe a resposta com número)');
	writeln('1 - Sim');
	writeln('2 - Não');
	readln(answer);
	
	if (answer = 1) then
		begin;
			writeln('Campeão Encontrado! Jogo encerrado! Deseja jogar novamente?');
			readln(answer);
			
			if (answer = 1) then
				begin;
					loopPerguntas(nodeElement);
				end;	
		end
	else
		begin;
			writeln('Qual campeão você pensou?');
			readln(respostaCorreta);
			writeln('Qual pergunta pode diferenciar ', respostaCorreta, ' de ', nodeEscolha^.value, '?');
			readln(novaPergunta);
			nodeEscolha^.value := novaPergunta;
			criaOpcoesPergunta(nodeEscolha, respostaCorreta, nodeEscolha^.value);
			loopPerguntas(nodeElement);
		end;
	
	readln(answer);
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