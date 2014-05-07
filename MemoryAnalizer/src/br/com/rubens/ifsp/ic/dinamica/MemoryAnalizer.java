package br.com.rubens.ifsp.ic.dinamica;

import java.util.Scanner;


public class MemoryAnalizer {
	static public void main(String args[]) {
		/* Get output stream to write from it
		String line;
		BufferedReader input = new BufferedReader(new InputStreamReader(child.getInputStream()));
		while ((line = input.readLine()) != null) {
			System.out.println(line);
		}*/
		MemoryAnalizer ma = new MemoryAnalizer();
		ProcessControl pc = new ProcessControl();
		Scanner s = new Scanner(System.in);
		
		ma.welcome();
		boolean loop = true;
		while(loop) {
			int op = ma.mainMenu(s);
			switch (op) {
			case 1:
				ma.scanValues(pc, s);
				break;
			case 2:
				System.out.print("Iniciado ... ");
				pc.run();
				System.out.println("finalizado!");
				break;
			case 9:
				loop = false;
				break;
			default:
				System.out.println("** OPCAO INVALIDA! **");
				break;
			}
		}
		
	}
	
	private int mainMenu(Scanner s) {
		System.out.println("+===========================================+");
		System.out.println("|                   MENU                    |");
		System.out.println("+===========================================+");
		System.out.println("|       1 - Configurar parametros           |");
		System.out.println("|       2 - Executar teste                  |");
		System.out.println("|       9 - Encerra aplicativo              |");
		System.out.println("+===========================================+");
		
		return s.nextInt();
		
	}
	
	private void welcome() {
		System.out.println("+===========================================+");
		System.out.println("+  Seja Bem-vindo ao Analisador de Memória  +");
		System.out.println("+===========================================+");
	}
	
	private void scanValues(ProcessControl pc, Scanner s) {
		int N = 25;
		int W = 10000;
		int S = (100*1024*1024);
		int tc = 10;
		int ts = 100;
		int seed = 42;
		
		System.out.print("Entre com um valor para N.....:");
		N = s.nextInt();
		System.out.print("Entre com um valor para W.....:");
		W = s.nextInt();
		//System.out.print("Entre com um valor para S...:");
		//S = s.nextInt();
		System.out.print("Entre com um valor para tc....:");
		tc = s.nextInt();
		System.out.print("Entre com um valor para ts:...:");
		ts = s.nextInt();
		System.out.print("Entre com um valor para seed:.:");
		ts = s.nextInt();
		
		pc.setParams(N, W, S, tc, ts, seed);
	}
}
