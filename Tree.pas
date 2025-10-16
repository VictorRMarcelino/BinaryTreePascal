Program Arvore;

type ptrNode = ^node;
	   node = record
							value: integer;
							left, right: ptrNode;
						end;
							
procedure initializate(var root:ptrNode);
begin;
	root := nil;
end;

procedure writeNode(root: ptrNode);
begin;
	writeln(root^.value);
end;

procedure preOrdemTree(root: ptrNode);
begin;
	while (root <> nil) do
		begin;
			writenode(root);
			preOrdemTree(root^.left);
			preOrdemTree(root^.right);
		end;
end;

procedure ordemTree(root: ptrNode);
begin;
	while (root <> nil) do
		begin;
			ordemTree(root^.left);
			writenode(root);
			ordemTree(root^.right);
		end;
end;

procedure posOrdemTree(root: ptrNode);
begin;
	while (root <> nil) do
		begin;
			posOrdemTree(root^.left);
			writenode(root);
			posOrdemTree(root^.right);
		end;
end;

procedure addNode(var root: ptrNode; value: integer); 
begin;
	if (root <> nil) then
		begin;
			if (value > root^.value) then
				begin;
					addNode(root^.right, value);
				end	 
			else if (value < root^.value) then
				begin;
					addNode(root^.left, value);
				end
			else if (value = root^.value) then
				begin;
					writeln('O valor já está presente na árvore');
				end
			else
		end
	else
		begin;
			new(root);
			root^.value := value;
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
		writeln('4 - Adicionar elemento');
		writeln('5 - Finalizar');
		write('Escolha uma opção: ');
		readln(op);
		clrscr;

		case op of
			1: preOrdemTree(root);
			2: ordemTree(root);
			3: posOrdemTree(root);
			4: 
				begin;
					writeln('Informe o valor que deseja inserir');
					readln(value);
					addNode(root, value);
				end;
		end;

		if op <> 5 then
		begin
			writeln;
			write('Pressione ENTER para continuar...');
			readln;
		end;
	until op = 5;
end;

Begin
menu();
End.