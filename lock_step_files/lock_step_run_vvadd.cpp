#include <iostream>
#include <fstream>
#include <string>
#define LOCKSTEP
#define MISA_SPEC (0b100000001000100000001 | (0b1llu << 63))
// #define EMULATOR_LOGGING
#include "fyp18-riscv-emulator/src/emulator.h"
#undef SHOW_TERMINAL
#include "simulator/src/simulator.h"
#include <chrono>
#include <unistd.h>
#include <cstdlib>
#include <signal.h>
#include <sys/ioctl.h>
#include <termios.h>
#include <iomanip>
using namespace std;

using namespace std::chrono;

#define LOGGING
#define DUMP_CONDITION 1 //&& (bench.tickcount > 15878305144UL)
#define PROBE_DOUBLE (0x2004000UL+0x0UL) & (~7UL)

emulator golden_model;

struct keystroke_buffer {
  unsigned char reader, writer, char_buffer[128];
};

/* void enable_raw_mode() {
  termios term;
  tcgetattr(0, &term);
  term.c_lflag &= ~(ICANON | ECHO); // Disable echo as well
  tcsetattr(0, TCSANOW, &term);
}

void disable_raw_mode() {
  termios term;
  tcgetattr(0, &term);
  term.c_lflag |= ICANON | ECHO;
  tcsetattr(0, TCSANOW, &term);
} */

// Define the function to be called when ctrl-c (SIGINT) is sent to process
void signal_callback_handler(int signum) {
  golden_model.show_state(0);
  // disable_raw_mode();
  tcflush(0, TCIFLUSH); 
  // Terminate program
  exit(signum);
}

/* int kbhit()
{
  int byteswaiting;
  ioctl(0, FIONREAD, &byteswaiting);
  return byteswaiting > 0;
} */

// emulator emu;

int main(int argc, char* argv[]) {
  // Name of kernel image must be provided at run time
  /* if (argc == 1) {
    printf("Name of kerenl image must be provided at run time\n");
    return 1;
  } else if (argc > 2) {
    printf("Too many arguments provided\n");
  } */

  /* if (!golden_model.load_kernel(argv[1])) {
    printf("kernel loading failed\n");
    return 1;
  } */

  simulator bench;
  bench.init("fyp18-riscv-emulator/src/Image", argv[2], argv[3]);
  printf("bench inititated!\n");
  cout << endl;

  // golden_model.load_dtb(argv[2], 0x7e00000UL);
  // golden_model.load_bootrom(argv[3]);
  // golden_model.load_symbols("resources/symbol_names.txt", "resources/symbol_pointers.bin");
  int x=1;
  // golden_model.init();
  golden_model.init("fyp18-riscv-emulator/src/Image");
  //golden_model.print_symbols();
  /* golden_model.step();
  golden_model.step(); */
  #ifdef LOGGING
  std::ofstream outFile_core0("run_core0.log"); // This will create or overwrite the file
  std::ofstream outFile_core1("run_core1.log");
  std::ofstream outState("states.log");

  // Check if the file is open
  if (!outFile_core0.is_open()) {
    std::cerr << "Error opening the file." << std::endl;
    return 1;
  }


  if (!outFile_core1.is_open()) {
    std::cerr << "Error opening the file." << std::endl;
    return 1;
  }


  #endif
  /* std::ifstream inputFile("resources/symbol_names.txt");

  if (!inputFile.is_open()) {
    std::cerr << "Failed to open the file." << std::endl;
    return 1;
  } */

  std::vector<std::string> symbols;

  std::string line;
  /* while (std::getline(inputFile, line)) {
    symbols.push_back(line);
  } */

  // inputFile.close();

  // Now you can access and print the stored symbols
  /* for (const std::string& storedLine : symbols) {
    std::cout << storedLine << std::endl;
  } */
  unsigned long old_symbol = 1;
  unsigned long mem_address, data;
  unsigned long delta = 10000000;
  //for (int i; i < 10; i++) {
  printf("stepping\n");
  // Use auto keyword to avoid typing long
  // type definitions to get the timepoint
  // at this instant use function now()
  auto start = high_resolution_clock::now();
  int timer_interr = 0;
  signal(SIGINT, signal_callback_handler);

  // enable_raw_mode();
  
  keystroke_buffer keys_rx;
  keys_rx.reader = 0;
  keys_rx.writer = 0;
  unsigned long gprs[32];
  bench.set_probe(PROBE_DOUBLE);

  //bench.step_nodump();
  unsigned long sim_prev = 0x80100000UL;
	printf("Simulation start time: %s %s\n", __DATE__, __TIME__);
  int count = 0; 
  int i=0;
  int j=0;
  int prev_i=1;
  int prev_j=1;
  int now_i = 0;
  int now_j = 0;

    int core0_count=0;
    int core1_count=0;
    int stop_count=1000;

  while (1 || (bench.tickcount + bench.dump_tick) < 800351768UL) {
    //cout<<"instruction is :" << golden_model.get_instruction()<<endl;
    //cout<<"pc is :" << golden_model.get_pc()<<endl;
    //golden_model.show_state();
    //cin >> x;
    //printf("i value first: %d \n",i);
    //printf("x value first: %d \n",x);

    if (kbhit()) {
      // printf("detected input, %c\n", getchar());
      keys_rx.char_buffer[keys_rx.writer++] = getchar();
      keys_rx.reader += (keys_rx.reader == keys_rx.writer); // overflow
      outFile_core0 << "keyhit\n";
    }

    // if (keys_rx.reader != keys_rx.writer) { keys_rx.reader += golden_model.load_rx_char(keys_rx.char_buffer[keys_rx.reader]); }

    #ifdef LOGGING
    /* if (golden_model.get_instruction() == 0x00100073) 
      break; */

    //unsigned long current_symbol = golden_model.get_symbom_index(golden_model.get_pc(), old_symbol);

    /* if (current_symbol != old_symbol)
    {
      outFile_core0 << setfill('0') << setw(8) << hex << golden_model.get_pc() << " " << symbols[current_symbol];// << "\n";
      outFile_core0 << setfill('0') << setw(8) << hex << golden_model.get_csr_value(MIE) << "\n";
      old_symbol = current_symbol;
    } */

   
     core0_count++;
     core1_count++;


   if(x==0 || x==3 || x==2){
    core0_count=0;
    outFile_core0 <<  setfill('0') << setw(16) << dec <<  (bench.dump_tick)  << " ";
    outFile_core0 <<  setfill('0') << setw(16) << hex << golden_model.get_pc(0) << " ";
    outFile_core0 <<  setfill('0') << setw(16) << hex << golden_model.get_instruction(0) << " ";
    outFile_core0 <<  setfill('0') << setw(16) << hex << golden_model.fetch_long(PROBE_DOUBLE) << " ";
    outFile_core0 <<  setfill('0') << setw(16) << hex << bench.get_probe() << endl;

    // outState <<  setfill('0') << setw(16) << hex << golden_model.get_instruction(0) << endl;
    // outState << golden_model.return_state(0);

   }

  if(x==3 || x==4 || x==5){
    core1_count=0;
    outFile_core1 <<  setfill('0') << setw(16) << dec <<  (bench.dump_tick)  << " ";
    outFile_core1 <<  setfill('0') << setw(16) << hex << golden_model.get_pc(1) << " ";
    outFile_core1 <<  setfill('0') << setw(16) << hex << golden_model.get_instruction(1) << " ";
    outFile_core1 <<  setfill('0') << setw(16) << hex << golden_model.fetch_long(PROBE_DOUBLE) << " ";
    outFile_core1 <<  setfill('0') << setw(16) << hex << bench.get_probe() << endl;
  }

    if(core0_count==stop_count ){
     printf("leon Time out \n");
     printf("core0 stoped \n");
     break;
   }

   if(core1_count==stop_count){
     printf("leon Time out \n");
     printf("core1 stoped \n");
     break;
   }

  //printf("prev_i = %d, now_i = %d, prev_j = %d, now_j = %d\n", prev_i, now_i, prev_j, now_j);

  /*
  if((prev_i==now_i) || (prev_j==now_j)){
      printf("leon time out!!!!!! \n");
      break;
   }

   */
  /*
  count++;

  if(count%1000==0){
      prev_i = now_i;
      prev_j = now_j;
      now_i = i;
      now_j = j;
   }

   */

    /* switch (golden_model.check_for_mem_access(&mem_address, &data))
    {
    case 1:
      //if (mem_address == 0x80001000) { printf("0x%016lx\n", data); }
      if (mem_address >= 0x80000001 || mem_address < 0x90000000) { break; }
      outFile_core0 << "load access at " << setfill('0') << setw(16) << hex << mem_address;
      outFile_core0 << " reading data " << setfill('0') << setw(16) << hex << data << "\n";
      break;
    
    case 2:
      if (mem_address >= 0x80000001 || mem_address < 0x90000000) { break; }
      outFile_core0 << "store access at " << setfill('0') << setw(16) << hex << mem_address;
      outFile_core0 << " writing data " << setfill('0') << setw(16) << hex << data << "\n";
      break;

    case 3:
      if (mem_address >= 0x80000001 || mem_address < 0x90000000) { break; }
      outFile_core0 << "atomic access at " << setfill('0') << setw(16) << hex << mem_address;
      outFile_core0 << " reading data " << setfill('0') << setw(16) << hex << data << "\n";
      break;
        
    default:
      break;
    } */

    
    #endif

    /* if (
      golden_model.check_for_mem_access(&mem_address, &data) && 
      (mem_address == 0x10000004) &&
      (data == 0))
    {
      break;
    } */
    // golden_model.show_state();

    auto stop = high_resolution_clock::now();
    auto duration = duration_cast<microseconds>(stop - start);
    /* if (timer_interr == 0)
      if (duration.count() > 10000000) { printf("Timer might be working"); timer_interr++; } */
    if (duration.count() > 10000000) {
      //printf("Timer might be working"); 
      //start = high_resolution_clock::now();
      //golden_model.set_mtip();
    }
    // golden_model.set_mtime(duration.count()*10);
    //printf("%d\n", timer_interr);
    // Write data to the file
    //printf("Timer might be working");

    /**
     * bench.prev_pc - executed pc by cpu pipeline
     * golden_model.get_pc - The next instruction to be executed
     * 
     * This happens because we get bench.prev_pc after it is executed.
     * This needs to be fixed to have a common semantic for both pc values
    */

   //core0
   //printf("x value: %d \n",x);
   if( x==0 || x==3){
    if (bench.prev_pc_core0 != golden_model.get_pc(0)) { 
      printf("core0 \n");
      cout << "PC mismatech emulator: " << hex << golden_model.get_pc(0);
      cout << " emulator instruction: " << setfill('0') << setw(8) << hex << golden_model.get_instruction(0);      cout << " simulator: " << hex << bench.prev_pc_core0 << endl;
      golden_model.show_state(0); 
      break;
    }

    if (bench.check_registers_core0(golden_model.reg_file(0), golden_model.get_mstatus(0))) { 
      printf("core0 \n");
      cout << "Register mismatch at register " << dec << bench.check_registers_core0(golden_model.reg_file(0), golden_model.get_mstatus(0));
      cout << " simulator value: " << setfill('0') << setw(16) << hex << bench.read_register_core0(bench.check_registers_core0(golden_model.reg_file(0), golden_model.get_mstatus(0))) << endl;
      golden_model.show_state(0);
      cout << dec << (bench.tickcount + bench.dump_tick) << endl;bench.step(); bench.step(); bench.step(); bench.step(); bench.step(); break;
   }

   }

    
   if(x==3 || x==4){
    if (bench.prev_pc_core1 != golden_model.get_pc(1)) { 
      printf("core1 \n");
      cout << "PC mismatech emulator: " << hex << golden_model.get_pc(1);
      cout << " emulator instruction: " << setfill('0') << setw(8) << hex << golden_model.get_instruction(1);      cout << " simulator: " << hex << bench.prev_pc_core1 << endl;
      golden_model.show_state(1); 
      break;
    }

    if (bench.check_registers_core1(golden_model.reg_file(1), golden_model.get_mstatus(1))) { 
      printf("core1 \n");
      cout << "Register mismatch at register " << dec << bench.check_registers_core1(golden_model.reg_file(1), golden_model.get_mstatus(1));
      cout << " simulator value: " << setfill('0') << setw(16) << hex << bench.read_register_core1(bench.check_registers_core1(golden_model.reg_file(1), golden_model.get_mstatus(1))) << endl;
      golden_model.show_state(1);
     cout << dec << (bench.tickcount + bench.dump_tick) << endl;bench.step(); bench.step(); bench.step(); bench.step(); bench.step(); break;
    }

   }

    //printf("x value leon: %d \n",x);
    // bench.step();


    if (x == 0 || x==3) {
      if (golden_model.is_peripheral_read(0)) {
        // cout << "peripheral read" << endl;
        __uint32_t p_instruction = golden_model.get_instruction(0);
        golden_model.step(0);
        //golden_model.set_register_with_value((p_instruction>>7)&0x1f, bench.get_register_value_core0((p_instruction>>7)&0x1f),0);
      } else{
        golden_model.step(0);
      }

      while (
        ((golden_model.get_instruction(0) & 0x0000007f) == 0x73) && 
        (golden_model.get_instruction(0) & 0x00007000)
      )
      {
        golden_model.step(0);
      }
    } //else if ((x == 2) && (golden_model.set_interrupts(bench.get_register_value_core0((golden_model.get_instruction()>>7)&0x1f), 0/*don't care*/)))
    //{
      //cout << "Setting interrupts failed in emulator" << endl;
      //cout << "tickcount: " << dec << (bench.tickcount + bench.dump_tick) << endl;
      //golden_model.show_state();
      //break;
    //}


    //core1
    if (x == 3 || x==4) {
      if (golden_model.is_peripheral_read(1)) {
        // cout << "peripheral read" << endl;
        __uint32_t p_instruction = golden_model.get_instruction(1);
        golden_model.step(1);
        //printf("came here");
        //golden_model.set_register_with_value((p_instruction>>7)&0x1f, bench.get_register_value_core0((p_instruction>>7)&0x1f),1);
      } else{
        golden_model.step(1);
        //printf("came here");
      }

      while (
        ((golden_model.get_instruction(1) & 0x0000007f) == 0x73) && 
        (golden_model.get_instruction(1) & 0x00007000)
      )
      {
        golden_model.step(1);
        //printf("came here");
      }
    }


    if (x == 2) { 
      if (DUMP_CONDITION) {
        x = bench.step();
      } else {
        x = bench.step_nodump();
      } 
      // printf("Taking interrupt\n");
      // golden_model.show_state();
      if (x == 1) { return 1; }
      if (golden_model.is_peripheral_read(0)) {
        // cout << "peripheral read" << endl;
        __uint32_t p_instruction = golden_model.get_instruction(0);
        golden_model.step(0);
        //golden_model.set_register_with_value((p_instruction>>7)&0x1f, bench.get_register_value_core0((p_instruction>>7)&0x1f),0);
      } else{
        golden_model.step(0);
      }
      while (
        ((golden_model.get_instruction(0) & 0x0000007f) == 0x73) && 
        (golden_model.get_instruction(0) & 0x00007000)
      )
      {
        golden_model.step(0);
      }
    }


    if (x == 5) { 
      if (DUMP_CONDITION) {
        x = bench.step();
      } else {
        x = bench.step_nodump();
      } 
      // printf("Taking interrupt\n");
      // golden_model.show_state();
      if (x == 1) { return 1; }
      if (golden_model.is_peripheral_read(1)) {
        // cout << "peripheral read" << endl;
        __uint32_t p_instruction = golden_model.get_instruction(1);
        golden_model.step(1);
        //printf("came here");
        //golden_model.set_register_with_value((p_instruction>>7)&0x1f, bench.get_register_value_core0((p_instruction>>7)&0x1f),1);
      } else{
        golden_model.step(1);
        //printf("came here");
      }
      while (
        ((golden_model.get_instruction(1) & 0x0000007f) == 0x73) && 
        (golden_model.get_instruction(1) & 0x00007000)
      )
      {
        golden_model.step(1);
        //printf("came here");
      }
    } 
    //printf("x value last: %d \n",x);

    x = 1;
    if (DUMP_CONDITION) {
      x = bench.step();
      //printf("x value dump: %d \n",x);
    } else {
      x= bench.step_nodump();
    }

    if (x == 1) { break; }

    // Check for test completion
    //VVADD
    if (bench.prev_pc_core0 == 0x1000074c) {
      printf("Test complete \n");
      #ifdef LOGGING
      outFile_core0.close();
      outFile_core1.close();
      #endif
      tcflush(0, TCIFLUSH);
      return 0; // Exit the program here with success.
    }

  }


  #ifdef LOGGING
  outFile_core0.close();
  outFile_core1.close();
  #endif

  printf("Test failed: Time-out!\n");
  printf("Total ticks: %ld \n", (bench.tickcount+bench.dump_tick));
  // disable_raw_mode();
  tcflush(0, TCIFLUSH); 

  return 1;
}
