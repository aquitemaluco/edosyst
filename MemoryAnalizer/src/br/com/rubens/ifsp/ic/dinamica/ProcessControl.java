package br.com.rubens.ifsp.ic.dinamica;

import java.io.IOException;

public class ProcessControl {
	private int N = 25;
	private int W = 10000;
	private int S = (100*1024*1024);
	private int tc = 10;
	private int ts = 100;
	private int pidGetStat;
	String filestats = "./filestats.csv";
	Process[] childs;
	
	public ProcessControl() {
		pidGetStat = N;
		this.childs = new Process[N+1];
	}
	
	public void setParams(int N, int W, int S, int tc, int ts) {
		this.N = N;
		this.W = W;
		this.S = S;
		this.tc = tc;
		this.ts = ts;
		pidGetStat = N;
		this.childs = new Process[N+1];
		
	}
	
	private String formatProcessCall(int i, long t) {
		/*
		unsigned int i = atoi(argv[1]);
		unsigned int N = atoi(argv[2]);
		unsigned int S = atoi(argv[3]);
		unsigned int W = atoi(argv[4]);
		unsigned int tc = atoi(argv[5]);
		unsigned int ts = atoi(argv[6]);
		 */
		return String.format("./loadsys %s %s %s %s %s %s %s", i, N, S, W, tc, ts, t);
	}
	
	public void run() {
		int i = 0;
		long t = System.currentTimeMillis();
		
		try {
			childs[pidGetStat] = Runtime.getRuntime().exec("./getstats " + filestats);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		for(i=0; i<N; i++) {
			try {
				String command = formatProcessCall(i, (t/1000));
				childs[i] = Runtime.getRuntime().exec(command);
				/*// Get output stream to write from it
				String line;
				BufferedReader input = new BufferedReader(new InputStreamReader(childs[i].getInputStream()));
				while ((line = input.readLine()) != null) {
					System.out.println(line);
				}*/
			} catch (IOException IOe) {
				IOe.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		i = 0;
		boolean procRunning = true;
		while(procRunning) {
			procRunning = false;
			procRunning = procRunning || isRunning(childs[i]);
			if(i == N)
				i = 0;
			
			try {
			    Thread.sleep(1000);
			} catch(InterruptedException ex) {
			    Thread.currentThread().interrupt();
			}
		}
		
		childs[pidGetStat].destroy();
	}
	
	boolean isRunning(Process process) {
	    try {
	        process.exitValue();
	        return false;
	    } catch (Exception e) {
	        return true;
	    }
	}

}
