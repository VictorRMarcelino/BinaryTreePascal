Program Arvore;

type ptrNode = ^node;
	   node = record
							value: integer;
							left, right: ptrNode;
						end;
							
procedure initializate(var nodeElement:ptrNode);
begin;
	nodeElement := nil;
end;

procedure preOrdemTree(nodeElement: ptrNode);
begin;
	if (nodeElement <> nil) then
		begin;
			writeln(nodeElement^.value);
			preOrdemTree(nodeElement^.left);
			preOrdemTree(nodeElement^.right);
		end;
end;

procedure ordemTree(nodeElement: ptrNode);
begin;
	if (nodeElement <> nil) then
		begin;
			ordemTree(nodeElement^.left);
			writeln(nodeElement^.value);
			ordemTree(nodeElement^.right);
		end;
end;

procedure posOrdemTree(nodeElement: ptrNode);
begin;
	if (nodeElement <> nil) then
		begin;
			posOrdemTree(nodeElement^.left);
			posOrdemTree(nodeElement^.right);
			writeln(nodeElement^.value);
		end;
end;

procedure showLeafs(nodeElement: ptrNode);
begin;
	if (nodeElement <> nil) then
		begin;
			if ((nodeElement^.left = nil) and (nodeElement^.right = nil)) then
				begin;
					writeln(nodeElement^.value);
				end;
				
			showLeafs(nodeElement^.left);
			showLeafs(nodeElement^.right);
		end;
end;

procedure addNode(var nodeElement: ptrNode; value: integer); 
begin;
	if (nodeElement <> nil) then
		begin;
			if (value > nodeElement^.value) then
				begin;
					addNode(nodeElement^.right, value);
				end	 
			else if (value < nodeElement^.value) then
				begin;
					addNode(nodeElement^.left, value);
				end
			else if (value = nodeElement^.value) then
				begin;
					writeln('O valor já está presente na árvore');
				end
			else
		end
	else
		begin;
			new(nodeElement);
			nodeElement^.value := value;
			nodeElement^.left := nil;
			nodeElement^.right := nil;
		end;
end;

procedure menu();
var op: byte;
var value: integer;
var root: ptrNode;
begin
	initializate(root);
	repeat
		clrscr;
		writeln('1 - Ler em Pré-Ordem');
		writeln('2 - Ler em Ordem');
		writeln('3 - Ler em Pós-Ordem');
		writeln('4 - Ler folhas');
		writeln('5 - Adicionar elemento');
		writeln('6 - Finalizar');
		write('Escolha uma opção: ');
		readln(op);
		clrscr;

		case op of
			1: preOrdemTree(root);
			2: ordemTree(root);
			3: posOrdemTree(root);
			4: showLeafs(root);
			5: 
				begin;
					writeln('Informe o valor que deseja inserir');
					readln(value);
					addNode(root, value);
				end;
		end;

		if op <> 6 then
		begin
			writeln;
			write('Pressione ENTER para continuar...');
			readln;
		end;
	until op = 6;
end;

Begin
menu();
End.