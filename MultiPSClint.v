module MultiUart_Anon(
  input         clock,
  input         reset,
  input         client_AWID,
  input  [31:0] client_AWADDR,
  input         client_AWVALID,
  output        client_AWREADY,
  input  [31:0] client_WDATA,
  input         client_WLAST,
  input         client_WVALID,
  output        client_WREADY,
  output        client_BID,
  output        client_BVALID,
  input         client_ARID,
  input  [31:0] client_ARADDR,
  input  [7:0]  client_ARLEN,
  input         client_ARVALID,
  output        client_ARREADY,
  output        client_RID,
  output [31:0] client_RDATA,
  output        client_RLAST,
  output        client_RVALID,
  input         client_RREADY,
  input  [63:0] io_mtime,
  output        MTIP,
  output        putCharOut0_valid,
  output [7:0]  putCharOut0_byte,
  input  [31:0] ps_start_port0
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
`endif // RANDOMIZE_REG_INIT
  reg  readRequestBuffer_valid; // @[duel_uart.scala 20:34]
  reg [31:0] readRequestBuffer_address; // @[duel_uart.scala 20:34]
  reg [7:0] readRequestBuffer_len; // @[duel_uart.scala 20:34]
  reg  readRequestBuffer_id; // @[duel_uart.scala 20:34]
  reg  writeRequestBuffer_address_valid; // @[duel_uart.scala 28:35]
  reg [31:0] writeRequestBuffer_address_offset; // @[duel_uart.scala 28:35]
  reg  writeRequestBuffer_address_id; // @[duel_uart.scala 28:35]
  reg  writeRequestBuffer_data_valid; // @[duel_uart.scala 28:35]
  reg [31:0] writeRequestBuffer_data_data; // @[duel_uart.scala 28:35]
  reg  writeRequestBuffer_data_last; // @[duel_uart.scala 28:35]
  wire  _T = client_ARREADY & client_ARVALID; // @[duel_uart.scala 44:23]
  wire  _GEN_0 = client_ARREADY & client_ARVALID | readRequestBuffer_valid; // @[duel_uart.scala 44:42 45:29 20:34]
  wire [7:0] _readRequestBuffer_len_T_1 = readRequestBuffer_len - 8'h1; // @[duel_uart.scala 53:52]
  wire  _T_2 = |readRequestBuffer_len; // @[duel_uart.scala 54:33]
  reg [63:0] mtimecmp; // @[duel_uart.scala 57:25]
  reg [31:0] msip; // @[duel_uart.scala 58:21]
  reg [31:0] mtimecmplowtemp; // @[duel_uart.scala 59:28]
  reg [63:0] mtimeRead; // @[duel_uart.scala 61:22]
  reg [63:0] mtimecmpRead; // @[duel_uart.scala 62:25]
  reg [31:0] msipRead; // @[duel_uart.scala 63:21]
  reg [31:0] ps_stat; // @[duel_uart.scala 81:24]
  wire [31:0] _client_RDATA_T_3 = _T_2 ? mtimeRead[31:0] : mtimeRead[63:32]; // @[duel_uart.scala 86:44]
  wire [31:0] _client_RDATA_T_7 = _T_2 ? mtimecmpRead[31:0] : mtimecmpRead[63:32]; // @[duel_uart.scala 87:44]
  wire [31:0] _GEN_11 = 32'h4000000 == readRequestBuffer_address ? ps_stat : 32'h8; // @[duel_uart.scala 82:16 83:37 91:38]
  wire [31:0] _GEN_12 = 32'h2000004 == readRequestBuffer_address ? msipRead : _GEN_11; // @[duel_uart.scala 83:37 90:38]
  wire [31:0] _GEN_13 = 32'h2000000 == readRequestBuffer_address ? msipRead : _GEN_12; // @[duel_uart.scala 83:37 89:38]
  wire [31:0] _GEN_14 = 32'h2004008 == readRequestBuffer_address ? _client_RDATA_T_7 : _GEN_13; // @[duel_uart.scala 83:37 88:38]
  wire [31:0] _GEN_15 = 32'h2004000 == readRequestBuffer_address ? _client_RDATA_T_7 : _GEN_14; // @[duel_uart.scala 83:37 87:38]
  wire [31:0] _GEN_16 = 32'h200bff8 == readRequestBuffer_address ? _client_RDATA_T_3 : _GEN_15; // @[duel_uart.scala 83:37 86:38]
  wire [31:0] _GEN_17 = 32'he000102c == readRequestBuffer_address ? 32'h2 : _GEN_16; // @[duel_uart.scala 83:37 85:38]
  wire [31:0] _GEN_18 = 32'he000002c == readRequestBuffer_address ? 32'h2 : _GEN_17; // @[duel_uart.scala 83:37 84:38]
  wire [31:0] _putChar_valid_T = writeRequestBuffer_address_offset & 32'hff; // @[duel_uart.scala 102:58]
  wire  putChar_valid = _putChar_valid_T == 32'h30 & writeRequestBuffer_address_valid & writeRequestBuffer_data_valid; // @[duel_uart.scala 102:159]
  wire [7:0] putChar_byte = writeRequestBuffer_data_data[7:0]; // @[duel_uart.scala 103:47]
  reg [7:0] lastUartChars_0; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_1; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_2; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_3; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_4; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_5; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_6; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_7; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_8; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_9; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_10; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_11; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_12; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_13; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_14; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_15; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_16; // @[duel_uart.scala 105:30]
  reg  terminalReady; // @[duel_uart.scala 111:30]
  wire  _terminalReady_T = 8'h20 == lastUartChars_0; // @[duel_uart.scala 113:130]
  wire  _terminalReady_T_15 = 8'h75 == lastUartChars_15; // @[duel_uart.scala 113:130]
  wire  _terminalReady_T_31 = 8'h20 == lastUartChars_0 & 8'h3a == lastUartChars_1 & 8'h6e == lastUartChars_2 & 8'h69 ==
    lastUartChars_3 & 8'h67 == lastUartChars_4 & 8'h6f == lastUartChars_5 & 8'h6c == lastUartChars_6 & 8'h20 ==
    lastUartChars_7 & 8'h74 == lastUartChars_8 & 8'h6f == lastUartChars_9 & 8'h6f == lastUartChars_10 & 8'h72 ==
    lastUartChars_11 & 8'h64 == lastUartChars_12 & 8'h6c == lastUartChars_13 & 8'h69 == lastUartChars_14 &
    _terminalReady_T_15; // @[duel_uart.scala 113:151]
  reg  afterLogin; // @[duel_uart.scala 116:27]
  wire  _T_16 = ~afterLogin; // @[duel_uart.scala 117:8]
  reg  hardInput_0_valid; // @[duel_uart.scala 121:26]
  reg [7:0] hardInput_0_char; // @[duel_uart.scala 121:26]
  reg  hardInput_1_valid; // @[duel_uart.scala 121:26]
  reg [7:0] hardInput_1_char; // @[duel_uart.scala 121:26]
  reg  hardInput_2_valid; // @[duel_uart.scala 121:26]
  reg [7:0] hardInput_2_char; // @[duel_uart.scala 121:26]
  reg  hardInput_3_valid; // @[duel_uart.scala 121:26]
  reg [7:0] hardInput_3_char; // @[duel_uart.scala 121:26]
  reg  hardInput_4_valid; // @[duel_uart.scala 121:26]
  reg [7:0] hardInput_4_char; // @[duel_uart.scala 121:26]
  reg  hardInput_5_valid; // @[duel_uart.scala 121:26]
  reg [7:0] hardInput_5_char; // @[duel_uart.scala 121:26]
  reg  hardInput_6_valid; // @[duel_uart.scala 121:26]
  reg [7:0] hardInput_6_char; // @[duel_uart.scala 121:26]
  reg  hardInput_7_valid; // @[duel_uart.scala 121:26]
  reg [7:0] hardInput_7_char; // @[duel_uart.scala 121:26]
  reg  hardInput_8_valid; // @[duel_uart.scala 121:26]
  reg  hardInput_9_valid; // @[duel_uart.scala 121:26]
  reg  command_0_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_0_char; // @[duel_uart.scala 126:24]
  reg  command_1_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_1_char; // @[duel_uart.scala 126:24]
  reg  command_2_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_2_char; // @[duel_uart.scala 126:24]
  reg  command_3_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_3_char; // @[duel_uart.scala 126:24]
  reg  command_4_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_4_char; // @[duel_uart.scala 126:24]
  reg  command_5_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_5_char; // @[duel_uart.scala 126:24]
  reg  command_6_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_6_char; // @[duel_uart.scala 126:24]
  reg  command_7_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_7_char; // @[duel_uart.scala 126:24]
  reg  command_8_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_8_char; // @[duel_uart.scala 126:24]
  reg  command_9_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_9_char; // @[duel_uart.scala 126:24]
  reg  command_10_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_10_char; // @[duel_uart.scala 126:24]
  reg  command_11_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_11_char; // @[duel_uart.scala 126:24]
  reg  command_12_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_12_char; // @[duel_uart.scala 126:24]
  reg  command_13_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_13_char; // @[duel_uart.scala 126:24]
  reg  command_14_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_14_char; // @[duel_uart.scala 126:24]
  reg  command_15_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_15_char; // @[duel_uart.scala 126:24]
  reg  command_16_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_16_char; // @[duel_uart.scala 126:24]
  reg  command_17_valid; // @[duel_uart.scala 126:24]
  wire [31:0] _T_17 = readRequestBuffer_address & 32'hffff0fff; // @[duel_uart.scala 132:33]
  wire  _T_19 = _T_17 == 32'he000002c & readRequestBuffer_valid; // @[duel_uart.scala 132:69]
  wire  _T_22 = _T_19 & terminalReady & _T_16; // @[duel_uart.scala 133:46]
  wire  _client_RDATA_T_12 = ~hardInput_0_valid; // @[duel_uart.scala 135:38]
  wire [1:0] _client_RDATA_T_13 = {_client_RDATA_T_12,1'h0}; // @[Cat.scala 33:92]
  wire [31:0] _GEN_167 = {{30'd0}, _client_RDATA_T_13}; // @[duel_uart.scala 135:32]
  wire [31:0] _client_RDATA_T_14 = 32'h8 | _GEN_167; // @[duel_uart.scala 135:32]
  wire [31:0] _GEN_38 = _T_22 ? _client_RDATA_T_14 : _GEN_18; // @[duel_uart.scala 134:5 135:18]
  wire  _T_25 = _T_17 == 32'he0000030 & readRequestBuffer_valid; // @[duel_uart.scala 139:69]
  wire  _T_28 = _T_25 & terminalReady & _T_16; // @[duel_uart.scala 140:46]
  wire  _GEN_39 = client_RREADY ? hardInput_1_valid : hardInput_0_valid; // @[duel_uart.scala 143:25 121:26 144:88]
  wire  _GEN_41 = client_RREADY ? hardInput_2_valid : hardInput_1_valid; // @[duel_uart.scala 143:25 121:26 144:88]
  wire  _GEN_43 = client_RREADY ? hardInput_3_valid : hardInput_2_valid; // @[duel_uart.scala 143:25 121:26 144:88]
  wire  _GEN_45 = client_RREADY ? hardInput_4_valid : hardInput_3_valid; // @[duel_uart.scala 143:25 121:26 144:88]
  wire  _GEN_47 = client_RREADY ? hardInput_5_valid : hardInput_4_valid; // @[duel_uart.scala 143:25 121:26 144:88]
  wire  _GEN_49 = client_RREADY ? hardInput_6_valid : hardInput_5_valid; // @[duel_uart.scala 143:25 121:26 144:88]
  wire  _GEN_51 = client_RREADY ? hardInput_7_valid : hardInput_6_valid; // @[duel_uart.scala 143:25 121:26 144:88]
  wire  _GEN_53 = client_RREADY ? hardInput_8_valid : hardInput_7_valid; // @[duel_uart.scala 143:25 121:26 144:88]
  wire  _GEN_55 = client_RREADY ? hardInput_9_valid : hardInput_8_valid; // @[duel_uart.scala 143:25 121:26 144:88]
  wire  _GEN_57 = client_RREADY ? 1'h0 : hardInput_9_valid; // @[duel_uart.scala 143:25 121:26 145:28]
  wire [31:0] _GEN_58 = _T_28 ? {{24'd0}, hardInput_0_char} : _GEN_38; // @[duel_uart.scala 141:5 142:18]
  wire  _GEN_59 = _T_28 ? _GEN_39 : hardInput_0_valid; // @[duel_uart.scala 121:26 141:5]
  wire  _GEN_61 = _T_28 ? _GEN_41 : hardInput_1_valid; // @[duel_uart.scala 121:26 141:5]
  wire  _GEN_63 = _T_28 ? _GEN_43 : hardInput_2_valid; // @[duel_uart.scala 121:26 141:5]
  wire  _GEN_65 = _T_28 ? _GEN_45 : hardInput_3_valid; // @[duel_uart.scala 121:26 141:5]
  wire  _GEN_67 = _T_28 ? _GEN_47 : hardInput_4_valid; // @[duel_uart.scala 121:26 141:5]
  wire  _GEN_69 = _T_28 ? _GEN_49 : hardInput_5_valid; // @[duel_uart.scala 121:26 141:5]
  wire  _GEN_71 = _T_28 ? _GEN_51 : hardInput_6_valid; // @[duel_uart.scala 121:26 141:5]
  wire  _GEN_73 = _T_28 ? _GEN_53 : hardInput_7_valid; // @[duel_uart.scala 121:26 141:5]
  wire  _GEN_75 = _T_28 ? _GEN_55 : hardInput_8_valid; // @[duel_uart.scala 121:26 141:5]
  wire  _GEN_77 = _T_28 ? _GEN_57 : hardInput_9_valid; // @[duel_uart.scala 121:26 141:5]
  wire  _T_32 = _T_19 & afterLogin; // @[duel_uart.scala 151:29]
  wire  _client_RDATA_T_15 = ~command_0_valid; // @[duel_uart.scala 153:38]
  wire [1:0] _client_RDATA_T_16 = {_client_RDATA_T_15,1'h0}; // @[Cat.scala 33:92]
  wire [31:0] _GEN_168 = {{30'd0}, _client_RDATA_T_16}; // @[duel_uart.scala 153:32]
  wire [31:0] _client_RDATA_T_17 = 32'h8 | _GEN_168; // @[duel_uart.scala 153:32]
  wire [31:0] _GEN_78 = _T_32 ? _client_RDATA_T_17 : _GEN_58; // @[duel_uart.scala 152:5 153:18]
  wire  _T_36 = _T_25 & afterLogin; // @[duel_uart.scala 158:29]
  wire  _GEN_79 = client_RREADY ? command_1_valid : command_0_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_81 = client_RREADY ? command_2_valid : command_1_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_83 = client_RREADY ? command_3_valid : command_2_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_85 = client_RREADY ? command_4_valid : command_3_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_87 = client_RREADY ? command_5_valid : command_4_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_89 = client_RREADY ? command_6_valid : command_5_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_91 = client_RREADY ? command_7_valid : command_6_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_93 = client_RREADY ? command_8_valid : command_7_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_95 = client_RREADY ? command_9_valid : command_8_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_97 = client_RREADY ? command_10_valid : command_9_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_99 = client_RREADY ? command_11_valid : command_10_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_101 = client_RREADY ? command_12_valid : command_11_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_103 = client_RREADY ? command_13_valid : command_12_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_105 = client_RREADY ? command_14_valid : command_13_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_107 = client_RREADY ? command_15_valid : command_14_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_109 = client_RREADY ? command_16_valid : command_15_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_111 = client_RREADY ? command_17_valid : command_16_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_113 = client_RREADY ? 1'h0 : command_17_valid; // @[duel_uart.scala 126:24 161:25 163:26]
  wire  _GEN_115 = _T_36 ? _GEN_79 : command_0_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_117 = _T_36 ? _GEN_81 : command_1_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_119 = _T_36 ? _GEN_83 : command_2_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_121 = _T_36 ? _GEN_85 : command_3_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_123 = _T_36 ? _GEN_87 : command_4_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_125 = _T_36 ? _GEN_89 : command_5_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_127 = _T_36 ? _GEN_91 : command_6_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_129 = _T_36 ? _GEN_93 : command_7_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_131 = _T_36 ? _GEN_95 : command_8_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_133 = _T_36 ? _GEN_97 : command_9_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_135 = _T_36 ? _GEN_99 : command_10_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_137 = _T_36 ? _GEN_101 : command_11_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_139 = _T_36 ? _GEN_103 : command_12_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_141 = _T_36 ? _GEN_105 : command_13_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_143 = _T_36 ? _GEN_107 : command_14_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_145 = _T_36 ? _GEN_109 : command_15_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_147 = _T_36 ? _GEN_111 : command_16_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_149 = _T_36 ? _GEN_113 : command_17_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _T_37 = writeRequestBuffer_address_valid & writeRequestBuffer_data_valid; // @[duel_uart.scala 167:41]
  wire  _GEN_150 = writeRequestBuffer_data_last ? 1'h0 : writeRequestBuffer_address_valid; // @[duel_uart.scala 169:40 170:40 28:35]
  wire  _GEN_151 = writeRequestBuffer_address_valid & writeRequestBuffer_data_valid ? 1'h0 :
    writeRequestBuffer_data_valid; // @[duel_uart.scala 167:75 168:35 28:35]
  wire  _GEN_152 = writeRequestBuffer_address_valid & writeRequestBuffer_data_valid ? _GEN_150 :
    writeRequestBuffer_address_valid; // @[duel_uart.scala 167:75 28:35]
  wire  _GEN_153 = client_AWREADY & client_AWVALID | _GEN_152; // @[duel_uart.scala 174:42 175:38]
  wire  _GEN_158 = client_WREADY & client_WVALID | _GEN_151; // @[duel_uart.scala 182:40 183:35]
  wire [63:0] _mtimecmp_T = {writeRequestBuffer_data_data,mtimecmplowtemp}; // @[Cat.scala 33:92]
  assign client_AWREADY = ~writeRequestBuffer_address_valid; // @[duel_uart.scala 204:21]
  assign client_WREADY = ~writeRequestBuffer_data_valid | writeRequestBuffer_address_valid; // @[duel_uart.scala 205:51]
  assign client_BID = writeRequestBuffer_address_id; // @[duel_uart.scala 207:14]
  assign client_BVALID = _T_37 & writeRequestBuffer_data_last; // @[duel_uart.scala 209:86]
  assign client_ARREADY = ~readRequestBuffer_valid; // @[duel_uart.scala 202:21]
  assign client_RID = readRequestBuffer_id; // @[duel_uart.scala 93:14]
  assign client_RDATA = _T_36 ? {{24'd0}, command_0_char} : _GEN_78; // @[duel_uart.scala 159:5 160:18]
  assign client_RLAST = ~_T_2; // @[duel_uart.scala 94:19]
  assign client_RVALID = readRequestBuffer_valid; // @[duel_uart.scala 96:17]
  assign MTIP = io_mtime > mtimecmp; // @[duel_uart.scala 213:21]
  assign putCharOut0_valid = _putChar_valid_T == 32'h30 & writeRequestBuffer_address_valid &
    writeRequestBuffer_data_valid; // @[duel_uart.scala 102:159]
  assign putCharOut0_byte = writeRequestBuffer_data_data[7:0]; // @[duel_uart.scala 103:47]
  always @(posedge clock) begin
    if (reset) begin // @[duel_uart.scala 20:34]
      readRequestBuffer_valid <= 1'h0; // @[duel_uart.scala 20:34]
    end else if (readRequestBuffer_valid & client_RREADY) begin // @[duel_uart.scala 52:50]
      if (~(|readRequestBuffer_len)) begin // @[duel_uart.scala 54:38]
        readRequestBuffer_valid <= 1'h0; // @[duel_uart.scala 54:64]
      end else begin
        readRequestBuffer_valid <= _GEN_0;
      end
    end else begin
      readRequestBuffer_valid <= _GEN_0;
    end
    if (client_ARREADY & client_ARVALID) begin // @[duel_uart.scala 44:42]
      readRequestBuffer_address <= client_ARADDR; // @[duel_uart.scala 46:31]
    end
    if (readRequestBuffer_valid & client_RREADY) begin // @[duel_uart.scala 52:50]
      readRequestBuffer_len <= _readRequestBuffer_len_T_1; // @[duel_uart.scala 53:27]
    end else if (client_ARREADY & client_ARVALID) begin // @[duel_uart.scala 44:42]
      readRequestBuffer_len <= client_ARLEN; // @[duel_uart.scala 47:27]
    end
    if (client_ARREADY & client_ARVALID) begin // @[duel_uart.scala 44:42]
      readRequestBuffer_id <= client_ARID; // @[duel_uart.scala 49:26]
    end
    if (reset) begin // @[duel_uart.scala 28:35]
      writeRequestBuffer_address_valid <= 1'h0; // @[duel_uart.scala 28:35]
    end else begin
      writeRequestBuffer_address_valid <= _GEN_153;
    end
    if (client_AWREADY & client_AWVALID) begin // @[duel_uart.scala 174:42]
      writeRequestBuffer_address_offset <= client_AWADDR; // @[duel_uart.scala 176:39]
    end
    if (client_AWREADY & client_AWVALID) begin // @[duel_uart.scala 174:42]
      writeRequestBuffer_address_id <= client_AWID; // @[duel_uart.scala 177:35]
    end
    if (reset) begin // @[duel_uart.scala 28:35]
      writeRequestBuffer_data_valid <= 1'h0; // @[duel_uart.scala 28:35]
    end else begin
      writeRequestBuffer_data_valid <= _GEN_158;
    end
    if (client_WREADY & client_WVALID) begin // @[duel_uart.scala 182:40]
      writeRequestBuffer_data_data <= client_WDATA; // @[duel_uart.scala 184:34]
    end
    if (client_WREADY & client_WVALID) begin // @[duel_uart.scala 182:40]
      writeRequestBuffer_data_last <= client_WLAST; // @[duel_uart.scala 185:34]
    end
    if (reset) begin // @[duel_uart.scala 57:25]
      mtimecmp <= 64'h0; // @[duel_uart.scala 57:25]
    end else if (writeRequestBuffer_address_valid & writeRequestBuffer_address_offset == 32'h2004000 &
      writeRequestBuffer_data_valid & writeRequestBuffer_data_last) begin // @[duel_uart.scala 190:164]
      mtimecmp <= _mtimecmp_T; // @[duel_uart.scala 191:14]
    end else if (writeRequestBuffer_address_valid & writeRequestBuffer_address_offset == 32'h2004008 &
      writeRequestBuffer_data_valid & writeRequestBuffer_data_last) begin // @[duel_uart.scala 192:170]
      mtimecmp <= _mtimecmp_T; // @[duel_uart.scala 193:14]
    end
    if (reset) begin // @[duel_uart.scala 58:21]
      msip <= 32'h0; // @[duel_uart.scala 58:21]
    end else if (writeRequestBuffer_address_valid & writeRequestBuffer_address_offset == 32'h2000000 &
      writeRequestBuffer_data_valid & writeRequestBuffer_data_last) begin // @[duel_uart.scala 196:164]
      msip <= writeRequestBuffer_data_data; // @[duel_uart.scala 197:10]
    end else if (writeRequestBuffer_address_valid & writeRequestBuffer_address_offset == 32'h2004004 &
      writeRequestBuffer_data_valid & writeRequestBuffer_data_last) begin // @[duel_uart.scala 198:170]
      msip <= writeRequestBuffer_data_data; // @[duel_uart.scala 199:10]
    end
    if (writeRequestBuffer_data_valid & ~writeRequestBuffer_data_last) begin // @[duel_uart.scala 189:72]
      mtimecmplowtemp <= writeRequestBuffer_data_data; // @[duel_uart.scala 189:90]
    end
    if (_T) begin // @[duel_uart.scala 65:42]
      mtimeRead <= io_mtime; // @[duel_uart.scala 66:15]
    end
    if (_T) begin // @[duel_uart.scala 69:42]
      mtimecmpRead <= mtimecmp; // @[duel_uart.scala 70:18]
    end
    if (_T) begin // @[duel_uart.scala 73:42]
      msipRead <= msip; // @[duel_uart.scala 74:14]
    end
    if (reset) begin // @[duel_uart.scala 81:24]
      ps_stat <= 32'h0; // @[duel_uart.scala 81:24]
    end else begin
      ps_stat <= ps_start_port0; // @[duel_uart.scala 231:13]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_0 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_0 <= putChar_byte; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_1 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_1 <= lastUartChars_0; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_2 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_2 <= lastUartChars_1; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_3 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_3 <= lastUartChars_2; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_4 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_4 <= lastUartChars_3; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_5 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_5 <= lastUartChars_4; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_6 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_6 <= lastUartChars_5; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_7 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_7 <= lastUartChars_6; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_8 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_8 <= lastUartChars_7; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_9 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_9 <= lastUartChars_8; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_10 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_10 <= lastUartChars_9; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_11 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_11 <= lastUartChars_10; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_12 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_12 <= lastUartChars_11; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_13 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_13 <= lastUartChars_12; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_14 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_14 <= lastUartChars_13; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_15 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_15 <= lastUartChars_14; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_16 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_16 <= lastUartChars_15; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 111:30]
      terminalReady <= 1'h0; // @[duel_uart.scala 111:30]
    end else if (~terminalReady) begin // @[duel_uart.scala 112:24]
      terminalReady <= _terminalReady_T_31 & 8'h62 == lastUartChars_16; // @[duel_uart.scala 113:19]
    end
    if (reset) begin // @[duel_uart.scala 116:27]
      afterLogin <= 1'h0; // @[duel_uart.scala 116:27]
    end else if (~afterLogin) begin // @[duel_uart.scala 117:21]
      afterLogin <= _terminalReady_T & 8'h23 == lastUartChars_1 & 8'h20 == lastUartChars_2 & 8'h7e == lastUartChars_3; // @[duel_uart.scala 118:16]
    end
    hardInput_0_valid <= reset | _GEN_59; // @[duel_uart.scala 121:{26,26}]
    if (reset) begin // @[duel_uart.scala 121:26]
      hardInput_0_char <= 8'h72; // @[duel_uart.scala 121:26]
    end else if (_T_28) begin // @[duel_uart.scala 141:5]
      if (client_RREADY) begin // @[duel_uart.scala 143:25]
        hardInput_0_char <= hardInput_1_char; // @[duel_uart.scala 144:88]
      end
    end
    hardInput_1_valid <= reset | _GEN_61; // @[duel_uart.scala 121:{26,26}]
    if (reset) begin // @[duel_uart.scala 121:26]
      hardInput_1_char <= 8'h6f; // @[duel_uart.scala 121:26]
    end else if (_T_28) begin // @[duel_uart.scala 141:5]
      if (client_RREADY) begin // @[duel_uart.scala 143:25]
        hardInput_1_char <= hardInput_2_char; // @[duel_uart.scala 144:88]
      end
    end
    hardInput_2_valid <= reset | _GEN_63; // @[duel_uart.scala 121:{26,26}]
    if (reset) begin // @[duel_uart.scala 121:26]
      hardInput_2_char <= 8'h6f; // @[duel_uart.scala 121:26]
    end else if (_T_28) begin // @[duel_uart.scala 141:5]
      if (client_RREADY) begin // @[duel_uart.scala 143:25]
        hardInput_2_char <= hardInput_3_char; // @[duel_uart.scala 144:88]
      end
    end
    hardInput_3_valid <= reset | _GEN_65; // @[duel_uart.scala 121:{26,26}]
    if (reset) begin // @[duel_uart.scala 121:26]
      hardInput_3_char <= 8'h74; // @[duel_uart.scala 121:26]
    end else if (_T_28) begin // @[duel_uart.scala 141:5]
      if (client_RREADY) begin // @[duel_uart.scala 143:25]
        hardInput_3_char <= hardInput_4_char; // @[duel_uart.scala 144:88]
      end
    end
    hardInput_4_valid <= reset | _GEN_67; // @[duel_uart.scala 121:{26,26}]
    if (reset) begin // @[duel_uart.scala 121:26]
      hardInput_4_char <= 8'ha; // @[duel_uart.scala 121:26]
    end else if (_T_28) begin // @[duel_uart.scala 141:5]
      if (client_RREADY) begin // @[duel_uart.scala 143:25]
        hardInput_4_char <= hardInput_5_char; // @[duel_uart.scala 144:88]
      end
    end
    hardInput_5_valid <= reset | _GEN_69; // @[duel_uart.scala 121:{26,26}]
    if (reset) begin // @[duel_uart.scala 121:26]
      hardInput_5_char <= 8'h6c; // @[duel_uart.scala 121:26]
    end else if (_T_28) begin // @[duel_uart.scala 141:5]
      if (client_RREADY) begin // @[duel_uart.scala 143:25]
        hardInput_5_char <= hardInput_6_char; // @[duel_uart.scala 144:88]
      end
    end
    hardInput_6_valid <= reset | _GEN_71; // @[duel_uart.scala 121:{26,26}]
    if (reset) begin // @[duel_uart.scala 121:26]
      hardInput_6_char <= 8'h73; // @[duel_uart.scala 121:26]
    end else if (_T_28) begin // @[duel_uart.scala 141:5]
      if (client_RREADY) begin // @[duel_uart.scala 143:25]
        hardInput_6_char <= hardInput_7_char; // @[duel_uart.scala 144:88]
      end
    end
    hardInput_7_valid <= reset | _GEN_73; // @[duel_uart.scala 121:{26,26}]
    if (reset) begin // @[duel_uart.scala 121:26]
      hardInput_7_char <= 8'h20; // @[duel_uart.scala 121:26]
    end else if (_T_28) begin // @[duel_uart.scala 141:5]
      if (client_RREADY) begin // @[duel_uart.scala 143:25]
        hardInput_7_char <= 8'h2e; // @[duel_uart.scala 144:88]
      end
    end
    hardInput_8_valid <= reset | _GEN_75; // @[duel_uart.scala 121:{26,26}]
    hardInput_9_valid <= reset | _GEN_77; // @[duel_uart.scala 121:{26,26}]
    command_0_valid <= reset | _GEN_115; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_0_char <= 8'h6c; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_0_char <= command_1_char; // @[duel_uart.scala 162:84]
      end
    end
    command_1_valid <= reset | _GEN_117; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_1_char <= 8'h73; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_1_char <= command_2_char; // @[duel_uart.scala 162:84]
      end
    end
    command_2_valid <= reset | _GEN_119; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_2_char <= 8'h20; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_2_char <= command_3_char; // @[duel_uart.scala 162:84]
      end
    end
    command_3_valid <= reset | _GEN_121; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_3_char <= 8'h2e; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_3_char <= command_4_char; // @[duel_uart.scala 162:84]
      end
    end
    command_4_valid <= reset | _GEN_123; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_4_char <= 8'h2e; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_4_char <= command_5_char; // @[duel_uart.scala 162:84]
      end
    end
    command_5_valid <= reset | _GEN_125; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_5_char <= 8'h20; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_5_char <= command_6_char; // @[duel_uart.scala 162:84]
      end
    end
    command_6_valid <= reset | _GEN_127; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_6_char <= 8'h26; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_6_char <= command_7_char; // @[duel_uart.scala 162:84]
      end
    end
    command_7_valid <= reset | _GEN_129; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_7_char <= 8'h26; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_7_char <= command_8_char; // @[duel_uart.scala 162:84]
      end
    end
    command_8_valid <= reset | _GEN_131; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_8_char <= 8'h20; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_8_char <= command_9_char; // @[duel_uart.scala 162:84]
      end
    end
    command_9_valid <= reset | _GEN_133; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_9_char <= 8'h70; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_9_char <= command_10_char; // @[duel_uart.scala 162:84]
      end
    end
    command_10_valid <= reset | _GEN_135; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_10_char <= 8'h6f; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_10_char <= command_11_char; // @[duel_uart.scala 162:84]
      end
    end
    command_11_valid <= reset | _GEN_137; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_11_char <= 8'h77; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_11_char <= command_12_char; // @[duel_uart.scala 162:84]
      end
    end
    command_12_valid <= reset | _GEN_139; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_12_char <= 8'h65; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_12_char <= command_13_char; // @[duel_uart.scala 162:84]
      end
    end
    command_13_valid <= reset | _GEN_141; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_13_char <= 8'h72; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_13_char <= command_14_char; // @[duel_uart.scala 162:84]
      end
    end
    command_14_valid <= reset | _GEN_143; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_14_char <= 8'h6f; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_14_char <= command_15_char; // @[duel_uart.scala 162:84]
      end
    end
    command_15_valid <= reset | _GEN_145; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_15_char <= 8'h66; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_15_char <= command_16_char; // @[duel_uart.scala 162:84]
      end
    end
    command_16_valid <= reset | _GEN_147; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_16_char <= 8'h66; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_16_char <= 8'ha; // @[duel_uart.scala 162:84]
      end
    end
    command_17_valid <= reset | _GEN_149; // @[duel_uart.scala 126:{24,24}]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  readRequestBuffer_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  readRequestBuffer_address = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  readRequestBuffer_len = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  readRequestBuffer_id = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  writeRequestBuffer_address_valid = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  writeRequestBuffer_address_offset = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  writeRequestBuffer_address_id = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  writeRequestBuffer_data_valid = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  writeRequestBuffer_data_data = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  writeRequestBuffer_data_last = _RAND_9[0:0];
  _RAND_10 = {2{`RANDOM}};
  mtimecmp = _RAND_10[63:0];
  _RAND_11 = {1{`RANDOM}};
  msip = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  mtimecmplowtemp = _RAND_12[31:0];
  _RAND_13 = {2{`RANDOM}};
  mtimeRead = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  mtimecmpRead = _RAND_14[63:0];
  _RAND_15 = {1{`RANDOM}};
  msipRead = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  ps_stat = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  lastUartChars_0 = _RAND_17[7:0];
  _RAND_18 = {1{`RANDOM}};
  lastUartChars_1 = _RAND_18[7:0];
  _RAND_19 = {1{`RANDOM}};
  lastUartChars_2 = _RAND_19[7:0];
  _RAND_20 = {1{`RANDOM}};
  lastUartChars_3 = _RAND_20[7:0];
  _RAND_21 = {1{`RANDOM}};
  lastUartChars_4 = _RAND_21[7:0];
  _RAND_22 = {1{`RANDOM}};
  lastUartChars_5 = _RAND_22[7:0];
  _RAND_23 = {1{`RANDOM}};
  lastUartChars_6 = _RAND_23[7:0];
  _RAND_24 = {1{`RANDOM}};
  lastUartChars_7 = _RAND_24[7:0];
  _RAND_25 = {1{`RANDOM}};
  lastUartChars_8 = _RAND_25[7:0];
  _RAND_26 = {1{`RANDOM}};
  lastUartChars_9 = _RAND_26[7:0];
  _RAND_27 = {1{`RANDOM}};
  lastUartChars_10 = _RAND_27[7:0];
  _RAND_28 = {1{`RANDOM}};
  lastUartChars_11 = _RAND_28[7:0];
  _RAND_29 = {1{`RANDOM}};
  lastUartChars_12 = _RAND_29[7:0];
  _RAND_30 = {1{`RANDOM}};
  lastUartChars_13 = _RAND_30[7:0];
  _RAND_31 = {1{`RANDOM}};
  lastUartChars_14 = _RAND_31[7:0];
  _RAND_32 = {1{`RANDOM}};
  lastUartChars_15 = _RAND_32[7:0];
  _RAND_33 = {1{`RANDOM}};
  lastUartChars_16 = _RAND_33[7:0];
  _RAND_34 = {1{`RANDOM}};
  terminalReady = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  afterLogin = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  hardInput_0_valid = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  hardInput_0_char = _RAND_37[7:0];
  _RAND_38 = {1{`RANDOM}};
  hardInput_1_valid = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  hardInput_1_char = _RAND_39[7:0];
  _RAND_40 = {1{`RANDOM}};
  hardInput_2_valid = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  hardInput_2_char = _RAND_41[7:0];
  _RAND_42 = {1{`RANDOM}};
  hardInput_3_valid = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  hardInput_3_char = _RAND_43[7:0];
  _RAND_44 = {1{`RANDOM}};
  hardInput_4_valid = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  hardInput_4_char = _RAND_45[7:0];
  _RAND_46 = {1{`RANDOM}};
  hardInput_5_valid = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  hardInput_5_char = _RAND_47[7:0];
  _RAND_48 = {1{`RANDOM}};
  hardInput_6_valid = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  hardInput_6_char = _RAND_49[7:0];
  _RAND_50 = {1{`RANDOM}};
  hardInput_7_valid = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  hardInput_7_char = _RAND_51[7:0];
  _RAND_52 = {1{`RANDOM}};
  hardInput_8_valid = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  hardInput_9_valid = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  command_0_valid = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  command_0_char = _RAND_55[7:0];
  _RAND_56 = {1{`RANDOM}};
  command_1_valid = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  command_1_char = _RAND_57[7:0];
  _RAND_58 = {1{`RANDOM}};
  command_2_valid = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  command_2_char = _RAND_59[7:0];
  _RAND_60 = {1{`RANDOM}};
  command_3_valid = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  command_3_char = _RAND_61[7:0];
  _RAND_62 = {1{`RANDOM}};
  command_4_valid = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  command_4_char = _RAND_63[7:0];
  _RAND_64 = {1{`RANDOM}};
  command_5_valid = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  command_5_char = _RAND_65[7:0];
  _RAND_66 = {1{`RANDOM}};
  command_6_valid = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  command_6_char = _RAND_67[7:0];
  _RAND_68 = {1{`RANDOM}};
  command_7_valid = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  command_7_char = _RAND_69[7:0];
  _RAND_70 = {1{`RANDOM}};
  command_8_valid = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  command_8_char = _RAND_71[7:0];
  _RAND_72 = {1{`RANDOM}};
  command_9_valid = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  command_9_char = _RAND_73[7:0];
  _RAND_74 = {1{`RANDOM}};
  command_10_valid = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  command_10_char = _RAND_75[7:0];
  _RAND_76 = {1{`RANDOM}};
  command_11_valid = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  command_11_char = _RAND_77[7:0];
  _RAND_78 = {1{`RANDOM}};
  command_12_valid = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  command_12_char = _RAND_79[7:0];
  _RAND_80 = {1{`RANDOM}};
  command_13_valid = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  command_13_char = _RAND_81[7:0];
  _RAND_82 = {1{`RANDOM}};
  command_14_valid = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  command_14_char = _RAND_83[7:0];
  _RAND_84 = {1{`RANDOM}};
  command_15_valid = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  command_15_char = _RAND_85[7:0];
  _RAND_86 = {1{`RANDOM}};
  command_16_valid = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  command_16_char = _RAND_87[7:0];
  _RAND_88 = {1{`RANDOM}};
  command_17_valid = _RAND_88[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MultiUart_Anon_1(
  input         clock,
  input         reset,
  input         client_AWID,
  input  [31:0] client_AWADDR,
  input         client_AWVALID,
  output        client_AWREADY,
  input  [31:0] client_WDATA,
  input         client_WLAST,
  input         client_WVALID,
  output        client_WREADY,
  output        client_BID,
  output        client_BVALID,
  input         client_ARID,
  input  [31:0] client_ARADDR,
  input  [7:0]  client_ARLEN,
  input         client_ARVALID,
  output        client_ARREADY,
  output        client_RID,
  output [31:0] client_RDATA,
  output        client_RLAST,
  output        client_RVALID,
  input         client_RREADY,
  input  [63:0] io_mtime,
  output        MTIP,
  output        putCharOut1_valid,
  output [7:0]  putCharOut1_byte,
  input  [31:0] ps_start_port1
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
`endif // RANDOMIZE_REG_INIT
  reg  readRequestBuffer_valid; // @[duel_uart.scala 20:34]
  reg [31:0] readRequestBuffer_address; // @[duel_uart.scala 20:34]
  reg [7:0] readRequestBuffer_len; // @[duel_uart.scala 20:34]
  reg  readRequestBuffer_id; // @[duel_uart.scala 20:34]
  reg  writeRequestBuffer_address_valid; // @[duel_uart.scala 28:35]
  reg [31:0] writeRequestBuffer_address_offset; // @[duel_uart.scala 28:35]
  reg  writeRequestBuffer_address_id; // @[duel_uart.scala 28:35]
  reg  writeRequestBuffer_data_valid; // @[duel_uart.scala 28:35]
  reg [31:0] writeRequestBuffer_data_data; // @[duel_uart.scala 28:35]
  reg  writeRequestBuffer_data_last; // @[duel_uart.scala 28:35]
  wire  _T = client_ARREADY & client_ARVALID; // @[duel_uart.scala 44:23]
  wire  _GEN_0 = client_ARREADY & client_ARVALID | readRequestBuffer_valid; // @[duel_uart.scala 44:42 45:29 20:34]
  wire [7:0] _readRequestBuffer_len_T_1 = readRequestBuffer_len - 8'h1; // @[duel_uart.scala 53:52]
  wire  _T_2 = |readRequestBuffer_len; // @[duel_uart.scala 54:33]
  reg [63:0] mtimecmp; // @[duel_uart.scala 57:25]
  reg [31:0] msip; // @[duel_uart.scala 58:21]
  reg [31:0] mtimecmplowtemp; // @[duel_uart.scala 59:28]
  reg [63:0] mtimeRead; // @[duel_uart.scala 61:22]
  reg [63:0] mtimecmpRead; // @[duel_uart.scala 62:25]
  reg [31:0] msipRead; // @[duel_uart.scala 63:21]
  reg [31:0] ps_stat; // @[duel_uart.scala 81:24]
  wire [31:0] _client_RDATA_T_3 = _T_2 ? mtimeRead[31:0] : mtimeRead[63:32]; // @[duel_uart.scala 86:44]
  wire [31:0] _client_RDATA_T_7 = _T_2 ? mtimecmpRead[31:0] : mtimecmpRead[63:32]; // @[duel_uart.scala 87:44]
  wire [31:0] _GEN_11 = 32'h4000000 == readRequestBuffer_address ? ps_stat : 32'h8; // @[duel_uart.scala 82:16 83:37 91:38]
  wire [31:0] _GEN_12 = 32'h2000004 == readRequestBuffer_address ? msipRead : _GEN_11; // @[duel_uart.scala 83:37 90:38]
  wire [31:0] _GEN_13 = 32'h2000000 == readRequestBuffer_address ? msipRead : _GEN_12; // @[duel_uart.scala 83:37 89:38]
  wire [31:0] _GEN_14 = 32'h2004008 == readRequestBuffer_address ? _client_RDATA_T_7 : _GEN_13; // @[duel_uart.scala 83:37 88:38]
  wire [31:0] _GEN_15 = 32'h2004000 == readRequestBuffer_address ? _client_RDATA_T_7 : _GEN_14; // @[duel_uart.scala 83:37 87:38]
  wire [31:0] _GEN_16 = 32'h200bff8 == readRequestBuffer_address ? _client_RDATA_T_3 : _GEN_15; // @[duel_uart.scala 83:37 86:38]
  wire [31:0] _GEN_17 = 32'he000102c == readRequestBuffer_address ? 32'h2 : _GEN_16; // @[duel_uart.scala 83:37 85:38]
  wire [31:0] _GEN_18 = 32'he000002c == readRequestBuffer_address ? 32'h2 : _GEN_17; // @[duel_uart.scala 83:37 84:38]
  wire [31:0] _putChar_valid_T = writeRequestBuffer_address_offset & 32'hff; // @[duel_uart.scala 102:58]
  wire  putChar_valid = _putChar_valid_T == 32'h30 & writeRequestBuffer_address_valid & writeRequestBuffer_data_valid; // @[duel_uart.scala 102:159]
  wire [7:0] putChar_byte = writeRequestBuffer_data_data[7:0]; // @[duel_uart.scala 103:47]
  reg [7:0] lastUartChars_0; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_1; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_2; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_3; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_4; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_5; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_6; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_7; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_8; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_9; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_10; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_11; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_12; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_13; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_14; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_15; // @[duel_uart.scala 105:30]
  reg [7:0] lastUartChars_16; // @[duel_uart.scala 105:30]
  reg  terminalReady; // @[duel_uart.scala 111:30]
  wire  _terminalReady_T = 8'h20 == lastUartChars_0; // @[duel_uart.scala 113:130]
  wire  _terminalReady_T_15 = 8'h75 == lastUartChars_15; // @[duel_uart.scala 113:130]
  wire  _terminalReady_T_31 = 8'h20 == lastUartChars_0 & 8'h3a == lastUartChars_1 & 8'h6e == lastUartChars_2 & 8'h69 ==
    lastUartChars_3 & 8'h67 == lastUartChars_4 & 8'h6f == lastUartChars_5 & 8'h6c == lastUartChars_6 & 8'h20 ==
    lastUartChars_7 & 8'h74 == lastUartChars_8 & 8'h6f == lastUartChars_9 & 8'h6f == lastUartChars_10 & 8'h72 ==
    lastUartChars_11 & 8'h64 == lastUartChars_12 & 8'h6c == lastUartChars_13 & 8'h69 == lastUartChars_14 &
    _terminalReady_T_15; // @[duel_uart.scala 113:151]
  reg  afterLogin; // @[duel_uart.scala 116:27]
  wire  _T_16 = ~afterLogin; // @[duel_uart.scala 117:8]
  reg  hardInput_0_valid; // @[duel_uart.scala 121:26]
  reg [7:0] hardInput_0_char; // @[duel_uart.scala 121:26]
  reg  hardInput_1_valid; // @[duel_uart.scala 121:26]
  reg [7:0] hardInput_1_char; // @[duel_uart.scala 121:26]
  reg  hardInput_2_valid; // @[duel_uart.scala 121:26]
  reg [7:0] hardInput_2_char; // @[duel_uart.scala 121:26]
  reg  hardInput_3_valid; // @[duel_uart.scala 121:26]
  reg [7:0] hardInput_3_char; // @[duel_uart.scala 121:26]
  reg  hardInput_4_valid; // @[duel_uart.scala 121:26]
  reg [7:0] hardInput_4_char; // @[duel_uart.scala 121:26]
  reg  hardInput_5_valid; // @[duel_uart.scala 121:26]
  reg [7:0] hardInput_5_char; // @[duel_uart.scala 121:26]
  reg  hardInput_6_valid; // @[duel_uart.scala 121:26]
  reg [7:0] hardInput_6_char; // @[duel_uart.scala 121:26]
  reg  hardInput_7_valid; // @[duel_uart.scala 121:26]
  reg [7:0] hardInput_7_char; // @[duel_uart.scala 121:26]
  reg  hardInput_8_valid; // @[duel_uart.scala 121:26]
  reg  hardInput_9_valid; // @[duel_uart.scala 121:26]
  reg  command_0_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_0_char; // @[duel_uart.scala 126:24]
  reg  command_1_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_1_char; // @[duel_uart.scala 126:24]
  reg  command_2_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_2_char; // @[duel_uart.scala 126:24]
  reg  command_3_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_3_char; // @[duel_uart.scala 126:24]
  reg  command_4_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_4_char; // @[duel_uart.scala 126:24]
  reg  command_5_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_5_char; // @[duel_uart.scala 126:24]
  reg  command_6_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_6_char; // @[duel_uart.scala 126:24]
  reg  command_7_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_7_char; // @[duel_uart.scala 126:24]
  reg  command_8_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_8_char; // @[duel_uart.scala 126:24]
  reg  command_9_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_9_char; // @[duel_uart.scala 126:24]
  reg  command_10_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_10_char; // @[duel_uart.scala 126:24]
  reg  command_11_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_11_char; // @[duel_uart.scala 126:24]
  reg  command_12_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_12_char; // @[duel_uart.scala 126:24]
  reg  command_13_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_13_char; // @[duel_uart.scala 126:24]
  reg  command_14_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_14_char; // @[duel_uart.scala 126:24]
  reg  command_15_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_15_char; // @[duel_uart.scala 126:24]
  reg  command_16_valid; // @[duel_uart.scala 126:24]
  reg [7:0] command_16_char; // @[duel_uart.scala 126:24]
  reg  command_17_valid; // @[duel_uart.scala 126:24]
  wire [31:0] _T_17 = readRequestBuffer_address & 32'hffff0fff; // @[duel_uart.scala 132:33]
  wire  _T_19 = _T_17 == 32'he000002c & readRequestBuffer_valid; // @[duel_uart.scala 132:69]
  wire  _T_22 = _T_19 & terminalReady & _T_16; // @[duel_uart.scala 133:46]
  wire  _client_RDATA_T_12 = ~hardInput_0_valid; // @[duel_uart.scala 135:38]
  wire [1:0] _client_RDATA_T_13 = {_client_RDATA_T_12,1'h0}; // @[Cat.scala 33:92]
  wire [31:0] _GEN_167 = {{30'd0}, _client_RDATA_T_13}; // @[duel_uart.scala 135:32]
  wire [31:0] _client_RDATA_T_14 = 32'h8 | _GEN_167; // @[duel_uart.scala 135:32]
  wire [31:0] _GEN_38 = _T_22 ? _client_RDATA_T_14 : _GEN_18; // @[duel_uart.scala 134:5 135:18]
  wire  _T_25 = _T_17 == 32'he0000030 & readRequestBuffer_valid; // @[duel_uart.scala 139:69]
  wire  _T_28 = _T_25 & terminalReady & _T_16; // @[duel_uart.scala 140:46]
  wire  _GEN_39 = client_RREADY ? hardInput_1_valid : hardInput_0_valid; // @[duel_uart.scala 143:25 121:26 144:88]
  wire  _GEN_41 = client_RREADY ? hardInput_2_valid : hardInput_1_valid; // @[duel_uart.scala 143:25 121:26 144:88]
  wire  _GEN_43 = client_RREADY ? hardInput_3_valid : hardInput_2_valid; // @[duel_uart.scala 143:25 121:26 144:88]
  wire  _GEN_45 = client_RREADY ? hardInput_4_valid : hardInput_3_valid; // @[duel_uart.scala 143:25 121:26 144:88]
  wire  _GEN_47 = client_RREADY ? hardInput_5_valid : hardInput_4_valid; // @[duel_uart.scala 143:25 121:26 144:88]
  wire  _GEN_49 = client_RREADY ? hardInput_6_valid : hardInput_5_valid; // @[duel_uart.scala 143:25 121:26 144:88]
  wire  _GEN_51 = client_RREADY ? hardInput_7_valid : hardInput_6_valid; // @[duel_uart.scala 143:25 121:26 144:88]
  wire  _GEN_53 = client_RREADY ? hardInput_8_valid : hardInput_7_valid; // @[duel_uart.scala 143:25 121:26 144:88]
  wire  _GEN_55 = client_RREADY ? hardInput_9_valid : hardInput_8_valid; // @[duel_uart.scala 143:25 121:26 144:88]
  wire  _GEN_57 = client_RREADY ? 1'h0 : hardInput_9_valid; // @[duel_uart.scala 143:25 121:26 145:28]
  wire [31:0] _GEN_58 = _T_28 ? {{24'd0}, hardInput_0_char} : _GEN_38; // @[duel_uart.scala 141:5 142:18]
  wire  _GEN_59 = _T_28 ? _GEN_39 : hardInput_0_valid; // @[duel_uart.scala 121:26 141:5]
  wire  _GEN_61 = _T_28 ? _GEN_41 : hardInput_1_valid; // @[duel_uart.scala 121:26 141:5]
  wire  _GEN_63 = _T_28 ? _GEN_43 : hardInput_2_valid; // @[duel_uart.scala 121:26 141:5]
  wire  _GEN_65 = _T_28 ? _GEN_45 : hardInput_3_valid; // @[duel_uart.scala 121:26 141:5]
  wire  _GEN_67 = _T_28 ? _GEN_47 : hardInput_4_valid; // @[duel_uart.scala 121:26 141:5]
  wire  _GEN_69 = _T_28 ? _GEN_49 : hardInput_5_valid; // @[duel_uart.scala 121:26 141:5]
  wire  _GEN_71 = _T_28 ? _GEN_51 : hardInput_6_valid; // @[duel_uart.scala 121:26 141:5]
  wire  _GEN_73 = _T_28 ? _GEN_53 : hardInput_7_valid; // @[duel_uart.scala 121:26 141:5]
  wire  _GEN_75 = _T_28 ? _GEN_55 : hardInput_8_valid; // @[duel_uart.scala 121:26 141:5]
  wire  _GEN_77 = _T_28 ? _GEN_57 : hardInput_9_valid; // @[duel_uart.scala 121:26 141:5]
  wire  _T_32 = _T_19 & afterLogin; // @[duel_uart.scala 151:29]
  wire  _client_RDATA_T_15 = ~command_0_valid; // @[duel_uart.scala 153:38]
  wire [1:0] _client_RDATA_T_16 = {_client_RDATA_T_15,1'h0}; // @[Cat.scala 33:92]
  wire [31:0] _GEN_168 = {{30'd0}, _client_RDATA_T_16}; // @[duel_uart.scala 153:32]
  wire [31:0] _client_RDATA_T_17 = 32'h8 | _GEN_168; // @[duel_uart.scala 153:32]
  wire [31:0] _GEN_78 = _T_32 ? _client_RDATA_T_17 : _GEN_58; // @[duel_uart.scala 152:5 153:18]
  wire  _T_36 = _T_25 & afterLogin; // @[duel_uart.scala 158:29]
  wire  _GEN_79 = client_RREADY ? command_1_valid : command_0_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_81 = client_RREADY ? command_2_valid : command_1_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_83 = client_RREADY ? command_3_valid : command_2_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_85 = client_RREADY ? command_4_valid : command_3_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_87 = client_RREADY ? command_5_valid : command_4_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_89 = client_RREADY ? command_6_valid : command_5_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_91 = client_RREADY ? command_7_valid : command_6_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_93 = client_RREADY ? command_8_valid : command_7_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_95 = client_RREADY ? command_9_valid : command_8_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_97 = client_RREADY ? command_10_valid : command_9_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_99 = client_RREADY ? command_11_valid : command_10_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_101 = client_RREADY ? command_12_valid : command_11_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_103 = client_RREADY ? command_13_valid : command_12_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_105 = client_RREADY ? command_14_valid : command_13_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_107 = client_RREADY ? command_15_valid : command_14_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_109 = client_RREADY ? command_16_valid : command_15_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_111 = client_RREADY ? command_17_valid : command_16_valid; // @[duel_uart.scala 126:24 161:25 162:84]
  wire  _GEN_113 = client_RREADY ? 1'h0 : command_17_valid; // @[duel_uart.scala 126:24 161:25 163:26]
  wire  _GEN_115 = _T_36 ? _GEN_79 : command_0_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_117 = _T_36 ? _GEN_81 : command_1_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_119 = _T_36 ? _GEN_83 : command_2_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_121 = _T_36 ? _GEN_85 : command_3_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_123 = _T_36 ? _GEN_87 : command_4_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_125 = _T_36 ? _GEN_89 : command_5_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_127 = _T_36 ? _GEN_91 : command_6_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_129 = _T_36 ? _GEN_93 : command_7_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_131 = _T_36 ? _GEN_95 : command_8_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_133 = _T_36 ? _GEN_97 : command_9_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_135 = _T_36 ? _GEN_99 : command_10_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_137 = _T_36 ? _GEN_101 : command_11_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_139 = _T_36 ? _GEN_103 : command_12_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_141 = _T_36 ? _GEN_105 : command_13_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_143 = _T_36 ? _GEN_107 : command_14_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_145 = _T_36 ? _GEN_109 : command_15_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_147 = _T_36 ? _GEN_111 : command_16_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _GEN_149 = _T_36 ? _GEN_113 : command_17_valid; // @[duel_uart.scala 126:24 159:5]
  wire  _T_37 = writeRequestBuffer_address_valid & writeRequestBuffer_data_valid; // @[duel_uart.scala 167:41]
  wire  _GEN_150 = writeRequestBuffer_data_last ? 1'h0 : writeRequestBuffer_address_valid; // @[duel_uart.scala 169:40 170:40 28:35]
  wire  _GEN_151 = writeRequestBuffer_address_valid & writeRequestBuffer_data_valid ? 1'h0 :
    writeRequestBuffer_data_valid; // @[duel_uart.scala 167:75 168:35 28:35]
  wire  _GEN_152 = writeRequestBuffer_address_valid & writeRequestBuffer_data_valid ? _GEN_150 :
    writeRequestBuffer_address_valid; // @[duel_uart.scala 167:75 28:35]
  wire  _GEN_153 = client_AWREADY & client_AWVALID | _GEN_152; // @[duel_uart.scala 174:42 175:38]
  wire  _GEN_158 = client_WREADY & client_WVALID | _GEN_151; // @[duel_uart.scala 182:40 183:35]
  wire [63:0] _mtimecmp_T = {writeRequestBuffer_data_data,mtimecmplowtemp}; // @[Cat.scala 33:92]
  assign client_AWREADY = ~writeRequestBuffer_address_valid; // @[duel_uart.scala 204:21]
  assign client_WREADY = ~writeRequestBuffer_data_valid | writeRequestBuffer_address_valid; // @[duel_uart.scala 205:51]
  assign client_BID = writeRequestBuffer_address_id; // @[duel_uart.scala 207:14]
  assign client_BVALID = _T_37 & writeRequestBuffer_data_last; // @[duel_uart.scala 209:86]
  assign client_ARREADY = ~readRequestBuffer_valid; // @[duel_uart.scala 202:21]
  assign client_RID = readRequestBuffer_id; // @[duel_uart.scala 93:14]
  assign client_RDATA = _T_36 ? {{24'd0}, command_0_char} : _GEN_78; // @[duel_uart.scala 159:5 160:18]
  assign client_RLAST = ~_T_2; // @[duel_uart.scala 94:19]
  assign client_RVALID = readRequestBuffer_valid; // @[duel_uart.scala 96:17]
  assign MTIP = io_mtime > mtimecmp; // @[duel_uart.scala 213:21]
  assign putCharOut1_valid = _putChar_valid_T == 32'h30 & writeRequestBuffer_address_valid &
    writeRequestBuffer_data_valid; // @[duel_uart.scala 102:159]
  assign putCharOut1_byte = writeRequestBuffer_data_data[7:0]; // @[duel_uart.scala 103:47]
  always @(posedge clock) begin
    if (reset) begin // @[duel_uart.scala 20:34]
      readRequestBuffer_valid <= 1'h0; // @[duel_uart.scala 20:34]
    end else if (readRequestBuffer_valid & client_RREADY) begin // @[duel_uart.scala 52:50]
      if (~(|readRequestBuffer_len)) begin // @[duel_uart.scala 54:38]
        readRequestBuffer_valid <= 1'h0; // @[duel_uart.scala 54:64]
      end else begin
        readRequestBuffer_valid <= _GEN_0;
      end
    end else begin
      readRequestBuffer_valid <= _GEN_0;
    end
    if (client_ARREADY & client_ARVALID) begin // @[duel_uart.scala 44:42]
      readRequestBuffer_address <= client_ARADDR; // @[duel_uart.scala 46:31]
    end
    if (readRequestBuffer_valid & client_RREADY) begin // @[duel_uart.scala 52:50]
      readRequestBuffer_len <= _readRequestBuffer_len_T_1; // @[duel_uart.scala 53:27]
    end else if (client_ARREADY & client_ARVALID) begin // @[duel_uart.scala 44:42]
      readRequestBuffer_len <= client_ARLEN; // @[duel_uart.scala 47:27]
    end
    if (client_ARREADY & client_ARVALID) begin // @[duel_uart.scala 44:42]
      readRequestBuffer_id <= client_ARID; // @[duel_uart.scala 49:26]
    end
    if (reset) begin // @[duel_uart.scala 28:35]
      writeRequestBuffer_address_valid <= 1'h0; // @[duel_uart.scala 28:35]
    end else begin
      writeRequestBuffer_address_valid <= _GEN_153;
    end
    if (client_AWREADY & client_AWVALID) begin // @[duel_uart.scala 174:42]
      writeRequestBuffer_address_offset <= client_AWADDR; // @[duel_uart.scala 176:39]
    end
    if (client_AWREADY & client_AWVALID) begin // @[duel_uart.scala 174:42]
      writeRequestBuffer_address_id <= client_AWID; // @[duel_uart.scala 177:35]
    end
    if (reset) begin // @[duel_uart.scala 28:35]
      writeRequestBuffer_data_valid <= 1'h0; // @[duel_uart.scala 28:35]
    end else begin
      writeRequestBuffer_data_valid <= _GEN_158;
    end
    if (client_WREADY & client_WVALID) begin // @[duel_uart.scala 182:40]
      writeRequestBuffer_data_data <= client_WDATA; // @[duel_uart.scala 184:34]
    end
    if (client_WREADY & client_WVALID) begin // @[duel_uart.scala 182:40]
      writeRequestBuffer_data_last <= client_WLAST; // @[duel_uart.scala 185:34]
    end
    if (reset) begin // @[duel_uart.scala 57:25]
      mtimecmp <= 64'h0; // @[duel_uart.scala 57:25]
    end else if (writeRequestBuffer_address_valid & writeRequestBuffer_address_offset == 32'h2004000 &
      writeRequestBuffer_data_valid & writeRequestBuffer_data_last) begin // @[duel_uart.scala 190:164]
      mtimecmp <= _mtimecmp_T; // @[duel_uart.scala 191:14]
    end else if (writeRequestBuffer_address_valid & writeRequestBuffer_address_offset == 32'h2004008 &
      writeRequestBuffer_data_valid & writeRequestBuffer_data_last) begin // @[duel_uart.scala 192:170]
      mtimecmp <= _mtimecmp_T; // @[duel_uart.scala 193:14]
    end
    if (reset) begin // @[duel_uart.scala 58:21]
      msip <= 32'h0; // @[duel_uart.scala 58:21]
    end else if (writeRequestBuffer_address_valid & writeRequestBuffer_address_offset == 32'h2000000 &
      writeRequestBuffer_data_valid & writeRequestBuffer_data_last) begin // @[duel_uart.scala 196:164]
      msip <= writeRequestBuffer_data_data; // @[duel_uart.scala 197:10]
    end else if (writeRequestBuffer_address_valid & writeRequestBuffer_address_offset == 32'h2004004 &
      writeRequestBuffer_data_valid & writeRequestBuffer_data_last) begin // @[duel_uart.scala 198:170]
      msip <= writeRequestBuffer_data_data; // @[duel_uart.scala 199:10]
    end
    if (writeRequestBuffer_data_valid & ~writeRequestBuffer_data_last) begin // @[duel_uart.scala 189:72]
      mtimecmplowtemp <= writeRequestBuffer_data_data; // @[duel_uart.scala 189:90]
    end
    if (_T) begin // @[duel_uart.scala 65:42]
      mtimeRead <= io_mtime; // @[duel_uart.scala 66:15]
    end
    if (_T) begin // @[duel_uart.scala 69:42]
      mtimecmpRead <= mtimecmp; // @[duel_uart.scala 70:18]
    end
    if (_T) begin // @[duel_uart.scala 73:42]
      msipRead <= msip; // @[duel_uart.scala 74:14]
    end
    if (reset) begin // @[duel_uart.scala 81:24]
      ps_stat <= 32'h0; // @[duel_uart.scala 81:24]
    end else begin
      ps_stat <= ps_start_port1; // @[duel_uart.scala 237:13]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_0 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_0 <= putChar_byte; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_1 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_1 <= lastUartChars_0; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_2 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_2 <= lastUartChars_1; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_3 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_3 <= lastUartChars_2; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_4 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_4 <= lastUartChars_3; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_5 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_5 <= lastUartChars_4; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_6 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_6 <= lastUartChars_5; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_7 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_7 <= lastUartChars_6; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_8 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_8 <= lastUartChars_7; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_9 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_9 <= lastUartChars_8; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_10 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_10 <= lastUartChars_9; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_11 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_11 <= lastUartChars_10; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_12 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_12 <= lastUartChars_11; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_13 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_13 <= lastUartChars_12; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_14 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_14 <= lastUartChars_13; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_15 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_15 <= lastUartChars_14; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 105:30]
      lastUartChars_16 <= 8'h0; // @[duel_uart.scala 105:30]
    end else if (putChar_valid) begin // @[duel_uart.scala 106:23]
      lastUartChars_16 <= lastUartChars_15; // @[duel_uart.scala 108:47]
    end
    if (reset) begin // @[duel_uart.scala 111:30]
      terminalReady <= 1'h0; // @[duel_uart.scala 111:30]
    end else if (~terminalReady) begin // @[duel_uart.scala 112:24]
      terminalReady <= _terminalReady_T_31 & 8'h62 == lastUartChars_16; // @[duel_uart.scala 113:19]
    end
    if (reset) begin // @[duel_uart.scala 116:27]
      afterLogin <= 1'h0; // @[duel_uart.scala 116:27]
    end else if (~afterLogin) begin // @[duel_uart.scala 117:21]
      afterLogin <= _terminalReady_T & 8'h23 == lastUartChars_1 & 8'h20 == lastUartChars_2 & 8'h7e == lastUartChars_3; // @[duel_uart.scala 118:16]
    end
    hardInput_0_valid <= reset | _GEN_59; // @[duel_uart.scala 121:{26,26}]
    if (reset) begin // @[duel_uart.scala 121:26]
      hardInput_0_char <= 8'h72; // @[duel_uart.scala 121:26]
    end else if (_T_28) begin // @[duel_uart.scala 141:5]
      if (client_RREADY) begin // @[duel_uart.scala 143:25]
        hardInput_0_char <= hardInput_1_char; // @[duel_uart.scala 144:88]
      end
    end
    hardInput_1_valid <= reset | _GEN_61; // @[duel_uart.scala 121:{26,26}]
    if (reset) begin // @[duel_uart.scala 121:26]
      hardInput_1_char <= 8'h6f; // @[duel_uart.scala 121:26]
    end else if (_T_28) begin // @[duel_uart.scala 141:5]
      if (client_RREADY) begin // @[duel_uart.scala 143:25]
        hardInput_1_char <= hardInput_2_char; // @[duel_uart.scala 144:88]
      end
    end
    hardInput_2_valid <= reset | _GEN_63; // @[duel_uart.scala 121:{26,26}]
    if (reset) begin // @[duel_uart.scala 121:26]
      hardInput_2_char <= 8'h6f; // @[duel_uart.scala 121:26]
    end else if (_T_28) begin // @[duel_uart.scala 141:5]
      if (client_RREADY) begin // @[duel_uart.scala 143:25]
        hardInput_2_char <= hardInput_3_char; // @[duel_uart.scala 144:88]
      end
    end
    hardInput_3_valid <= reset | _GEN_65; // @[duel_uart.scala 121:{26,26}]
    if (reset) begin // @[duel_uart.scala 121:26]
      hardInput_3_char <= 8'h74; // @[duel_uart.scala 121:26]
    end else if (_T_28) begin // @[duel_uart.scala 141:5]
      if (client_RREADY) begin // @[duel_uart.scala 143:25]
        hardInput_3_char <= hardInput_4_char; // @[duel_uart.scala 144:88]
      end
    end
    hardInput_4_valid <= reset | _GEN_67; // @[duel_uart.scala 121:{26,26}]
    if (reset) begin // @[duel_uart.scala 121:26]
      hardInput_4_char <= 8'ha; // @[duel_uart.scala 121:26]
    end else if (_T_28) begin // @[duel_uart.scala 141:5]
      if (client_RREADY) begin // @[duel_uart.scala 143:25]
        hardInput_4_char <= hardInput_5_char; // @[duel_uart.scala 144:88]
      end
    end
    hardInput_5_valid <= reset | _GEN_69; // @[duel_uart.scala 121:{26,26}]
    if (reset) begin // @[duel_uart.scala 121:26]
      hardInput_5_char <= 8'h6c; // @[duel_uart.scala 121:26]
    end else if (_T_28) begin // @[duel_uart.scala 141:5]
      if (client_RREADY) begin // @[duel_uart.scala 143:25]
        hardInput_5_char <= hardInput_6_char; // @[duel_uart.scala 144:88]
      end
    end
    hardInput_6_valid <= reset | _GEN_71; // @[duel_uart.scala 121:{26,26}]
    if (reset) begin // @[duel_uart.scala 121:26]
      hardInput_6_char <= 8'h73; // @[duel_uart.scala 121:26]
    end else if (_T_28) begin // @[duel_uart.scala 141:5]
      if (client_RREADY) begin // @[duel_uart.scala 143:25]
        hardInput_6_char <= hardInput_7_char; // @[duel_uart.scala 144:88]
      end
    end
    hardInput_7_valid <= reset | _GEN_73; // @[duel_uart.scala 121:{26,26}]
    if (reset) begin // @[duel_uart.scala 121:26]
      hardInput_7_char <= 8'h20; // @[duel_uart.scala 121:26]
    end else if (_T_28) begin // @[duel_uart.scala 141:5]
      if (client_RREADY) begin // @[duel_uart.scala 143:25]
        hardInput_7_char <= 8'h2e; // @[duel_uart.scala 144:88]
      end
    end
    hardInput_8_valid <= reset | _GEN_75; // @[duel_uart.scala 121:{26,26}]
    hardInput_9_valid <= reset | _GEN_77; // @[duel_uart.scala 121:{26,26}]
    command_0_valid <= reset | _GEN_115; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_0_char <= 8'h6c; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_0_char <= command_1_char; // @[duel_uart.scala 162:84]
      end
    end
    command_1_valid <= reset | _GEN_117; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_1_char <= 8'h73; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_1_char <= command_2_char; // @[duel_uart.scala 162:84]
      end
    end
    command_2_valid <= reset | _GEN_119; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_2_char <= 8'h20; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_2_char <= command_3_char; // @[duel_uart.scala 162:84]
      end
    end
    command_3_valid <= reset | _GEN_121; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_3_char <= 8'h2e; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_3_char <= command_4_char; // @[duel_uart.scala 162:84]
      end
    end
    command_4_valid <= reset | _GEN_123; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_4_char <= 8'h2e; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_4_char <= command_5_char; // @[duel_uart.scala 162:84]
      end
    end
    command_5_valid <= reset | _GEN_125; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_5_char <= 8'h20; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_5_char <= command_6_char; // @[duel_uart.scala 162:84]
      end
    end
    command_6_valid <= reset | _GEN_127; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_6_char <= 8'h26; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_6_char <= command_7_char; // @[duel_uart.scala 162:84]
      end
    end
    command_7_valid <= reset | _GEN_129; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_7_char <= 8'h26; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_7_char <= command_8_char; // @[duel_uart.scala 162:84]
      end
    end
    command_8_valid <= reset | _GEN_131; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_8_char <= 8'h20; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_8_char <= command_9_char; // @[duel_uart.scala 162:84]
      end
    end
    command_9_valid <= reset | _GEN_133; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_9_char <= 8'h70; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_9_char <= command_10_char; // @[duel_uart.scala 162:84]
      end
    end
    command_10_valid <= reset | _GEN_135; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_10_char <= 8'h6f; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_10_char <= command_11_char; // @[duel_uart.scala 162:84]
      end
    end
    command_11_valid <= reset | _GEN_137; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_11_char <= 8'h77; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_11_char <= command_12_char; // @[duel_uart.scala 162:84]
      end
    end
    command_12_valid <= reset | _GEN_139; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_12_char <= 8'h65; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_12_char <= command_13_char; // @[duel_uart.scala 162:84]
      end
    end
    command_13_valid <= reset | _GEN_141; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_13_char <= 8'h72; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_13_char <= command_14_char; // @[duel_uart.scala 162:84]
      end
    end
    command_14_valid <= reset | _GEN_143; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_14_char <= 8'h6f; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_14_char <= command_15_char; // @[duel_uart.scala 162:84]
      end
    end
    command_15_valid <= reset | _GEN_145; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_15_char <= 8'h66; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_15_char <= command_16_char; // @[duel_uart.scala 162:84]
      end
    end
    command_16_valid <= reset | _GEN_147; // @[duel_uart.scala 126:{24,24}]
    if (reset) begin // @[duel_uart.scala 126:24]
      command_16_char <= 8'h66; // @[duel_uart.scala 126:24]
    end else if (_T_36) begin // @[duel_uart.scala 159:5]
      if (client_RREADY) begin // @[duel_uart.scala 161:25]
        command_16_char <= 8'ha; // @[duel_uart.scala 162:84]
      end
    end
    command_17_valid <= reset | _GEN_149; // @[duel_uart.scala 126:{24,24}]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  readRequestBuffer_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  readRequestBuffer_address = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  readRequestBuffer_len = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  readRequestBuffer_id = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  writeRequestBuffer_address_valid = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  writeRequestBuffer_address_offset = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  writeRequestBuffer_address_id = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  writeRequestBuffer_data_valid = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  writeRequestBuffer_data_data = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  writeRequestBuffer_data_last = _RAND_9[0:0];
  _RAND_10 = {2{`RANDOM}};
  mtimecmp = _RAND_10[63:0];
  _RAND_11 = {1{`RANDOM}};
  msip = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  mtimecmplowtemp = _RAND_12[31:0];
  _RAND_13 = {2{`RANDOM}};
  mtimeRead = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  mtimecmpRead = _RAND_14[63:0];
  _RAND_15 = {1{`RANDOM}};
  msipRead = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  ps_stat = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  lastUartChars_0 = _RAND_17[7:0];
  _RAND_18 = {1{`RANDOM}};
  lastUartChars_1 = _RAND_18[7:0];
  _RAND_19 = {1{`RANDOM}};
  lastUartChars_2 = _RAND_19[7:0];
  _RAND_20 = {1{`RANDOM}};
  lastUartChars_3 = _RAND_20[7:0];
  _RAND_21 = {1{`RANDOM}};
  lastUartChars_4 = _RAND_21[7:0];
  _RAND_22 = {1{`RANDOM}};
  lastUartChars_5 = _RAND_22[7:0];
  _RAND_23 = {1{`RANDOM}};
  lastUartChars_6 = _RAND_23[7:0];
  _RAND_24 = {1{`RANDOM}};
  lastUartChars_7 = _RAND_24[7:0];
  _RAND_25 = {1{`RANDOM}};
  lastUartChars_8 = _RAND_25[7:0];
  _RAND_26 = {1{`RANDOM}};
  lastUartChars_9 = _RAND_26[7:0];
  _RAND_27 = {1{`RANDOM}};
  lastUartChars_10 = _RAND_27[7:0];
  _RAND_28 = {1{`RANDOM}};
  lastUartChars_11 = _RAND_28[7:0];
  _RAND_29 = {1{`RANDOM}};
  lastUartChars_12 = _RAND_29[7:0];
  _RAND_30 = {1{`RANDOM}};
  lastUartChars_13 = _RAND_30[7:0];
  _RAND_31 = {1{`RANDOM}};
  lastUartChars_14 = _RAND_31[7:0];
  _RAND_32 = {1{`RANDOM}};
  lastUartChars_15 = _RAND_32[7:0];
  _RAND_33 = {1{`RANDOM}};
  lastUartChars_16 = _RAND_33[7:0];
  _RAND_34 = {1{`RANDOM}};
  terminalReady = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  afterLogin = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  hardInput_0_valid = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  hardInput_0_char = _RAND_37[7:0];
  _RAND_38 = {1{`RANDOM}};
  hardInput_1_valid = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  hardInput_1_char = _RAND_39[7:0];
  _RAND_40 = {1{`RANDOM}};
  hardInput_2_valid = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  hardInput_2_char = _RAND_41[7:0];
  _RAND_42 = {1{`RANDOM}};
  hardInput_3_valid = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  hardInput_3_char = _RAND_43[7:0];
  _RAND_44 = {1{`RANDOM}};
  hardInput_4_valid = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  hardInput_4_char = _RAND_45[7:0];
  _RAND_46 = {1{`RANDOM}};
  hardInput_5_valid = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  hardInput_5_char = _RAND_47[7:0];
  _RAND_48 = {1{`RANDOM}};
  hardInput_6_valid = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  hardInput_6_char = _RAND_49[7:0];
  _RAND_50 = {1{`RANDOM}};
  hardInput_7_valid = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  hardInput_7_char = _RAND_51[7:0];
  _RAND_52 = {1{`RANDOM}};
  hardInput_8_valid = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  hardInput_9_valid = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  command_0_valid = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  command_0_char = _RAND_55[7:0];
  _RAND_56 = {1{`RANDOM}};
  command_1_valid = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  command_1_char = _RAND_57[7:0];
  _RAND_58 = {1{`RANDOM}};
  command_2_valid = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  command_2_char = _RAND_59[7:0];
  _RAND_60 = {1{`RANDOM}};
  command_3_valid = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  command_3_char = _RAND_61[7:0];
  _RAND_62 = {1{`RANDOM}};
  command_4_valid = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  command_4_char = _RAND_63[7:0];
  _RAND_64 = {1{`RANDOM}};
  command_5_valid = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  command_5_char = _RAND_65[7:0];
  _RAND_66 = {1{`RANDOM}};
  command_6_valid = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  command_6_char = _RAND_67[7:0];
  _RAND_68 = {1{`RANDOM}};
  command_7_valid = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  command_7_char = _RAND_69[7:0];
  _RAND_70 = {1{`RANDOM}};
  command_8_valid = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  command_8_char = _RAND_71[7:0];
  _RAND_72 = {1{`RANDOM}};
  command_9_valid = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  command_9_char = _RAND_73[7:0];
  _RAND_74 = {1{`RANDOM}};
  command_10_valid = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  command_10_char = _RAND_75[7:0];
  _RAND_76 = {1{`RANDOM}};
  command_11_valid = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  command_11_char = _RAND_77[7:0];
  _RAND_78 = {1{`RANDOM}};
  command_12_valid = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  command_12_char = _RAND_79[7:0];
  _RAND_80 = {1{`RANDOM}};
  command_13_valid = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  command_13_char = _RAND_81[7:0];
  _RAND_82 = {1{`RANDOM}};
  command_14_valid = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  command_14_char = _RAND_83[7:0];
  _RAND_84 = {1{`RANDOM}};
  command_15_valid = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  command_15_char = _RAND_85[7:0];
  _RAND_86 = {1{`RANDOM}};
  command_16_valid = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  command_16_char = _RAND_87[7:0];
  _RAND_88 = {1{`RANDOM}};
  command_17_valid = _RAND_88[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MultiPSClint(
  input         clock,
  input         reset,
  input         client0_AWID,
  input  [31:0] client0_AWADDR,
  input  [7:0]  client0_AWLEN,
  input  [2:0]  client0_AWSIZE,
  input  [1:0]  client0_AWBURST,
  input         client0_AWLOCK,
  input  [3:0]  client0_AWCACHE,
  input  [2:0]  client0_AWPROT,
  input  [3:0]  client0_AWQOS,
  input         client0_AWVALID,
  output        client0_AWREADY,
  input  [31:0] client0_WDATA,
  input  [3:0]  client0_WSTRB,
  input         client0_WLAST,
  input         client0_WVALID,
  output        client0_WREADY,
  output        client0_BID,
  output [1:0]  client0_BRESP,
  output        client0_BVALID,
  input         client0_BREADY,
  input         client0_ARID,
  input  [31:0] client0_ARADDR,
  input  [7:0]  client0_ARLEN,
  input  [2:0]  client0_ARSIZE,
  input  [1:0]  client0_ARBURST,
  input         client0_ARLOCK,
  input  [3:0]  client0_ARCACHE,
  input  [2:0]  client0_ARPROT,
  input  [3:0]  client0_ARQOS,
  input         client0_ARVALID,
  output        client0_ARREADY,
  output        client0_RID,
  output [31:0] client0_RDATA,
  output [1:0]  client0_RRESP,
  output        client0_RLAST,
  output        client0_RVALID,
  input         client0_RREADY,
  input         client1_AWID,
  input  [31:0] client1_AWADDR,
  input  [7:0]  client1_AWLEN,
  input  [2:0]  client1_AWSIZE,
  input  [1:0]  client1_AWBURST,
  input         client1_AWLOCK,
  input  [3:0]  client1_AWCACHE,
  input  [2:0]  client1_AWPROT,
  input  [3:0]  client1_AWQOS,
  input         client1_AWVALID,
  output        client1_AWREADY,
  input  [31:0] client1_WDATA,
  input  [3:0]  client1_WSTRB,
  input         client1_WLAST,
  input         client1_WVALID,
  output        client1_WREADY,
  output        client1_BID,
  output [1:0]  client1_BRESP,
  output        client1_BVALID,
  input         client1_BREADY,
  input         client1_ARID,
  input  [31:0] client1_ARADDR,
  input  [7:0]  client1_ARLEN,
  input  [2:0]  client1_ARSIZE,
  input  [1:0]  client1_ARBURST,
  input         client1_ARLOCK,
  input  [3:0]  client1_ARCACHE,
  input  [2:0]  client1_ARPROT,
  input  [3:0]  client1_ARQOS,
  input         client1_ARVALID,
  output        client1_ARREADY,
  output        client1_RID,
  output [31:0] client1_RDATA,
  output [1:0]  client1_RRESP,
  output        client1_RLAST,
  output        client1_RVALID,
  input         client1_RREADY,
  output        putChar0_valid,
  output [7:0]  putChar0_byte,
  output        putChar1_valid,
  output [7:0]  putChar1_byte,
  output        MTIP0,
  output        MTIP1,
  input         psMaster_AWID,
  input  [31:0] psMaster_AWADDR,
  input  [7:0]  psMaster_AWLEN,
  input  [2:0]  psMaster_AWSIZE,
  input  [1:0]  psMaster_AWBURST,
  input         psMaster_AWLOCK,
  input  [3:0]  psMaster_AWCACHE,
  input  [2:0]  psMaster_AWPROT,
  input  [3:0]  psMaster_AWQOS,
  input         psMaster_AWVALID,
  output        psMaster_AWREADY,
  input  [31:0] psMaster_WDATA,
  input  [3:0]  psMaster_WSTRB,
  input         psMaster_WLAST,
  input         psMaster_WVALID,
  output        psMaster_WREADY,
  output        psMaster_BID,
  output [1:0]  psMaster_BRESP,
  output        psMaster_BVALID,
  input         psMaster_BREADY,
  input         psMaster_ARID,
  input  [31:0] psMaster_ARADDR,
  input  [7:0]  psMaster_ARLEN,
  input  [2:0]  psMaster_ARSIZE,
  input  [1:0]  psMaster_ARBURST,
  input         psMaster_ARLOCK,
  input  [3:0]  psMaster_ARCACHE,
  input  [2:0]  psMaster_ARPROT,
  input  [3:0]  psMaster_ARQOS,
  input         psMaster_ARVALID,
  output        psMaster_ARREADY,
  output        psMaster_RID,
  output [31:0] psMaster_RDATA,
  output [1:0]  psMaster_RRESP,
  output        psMaster_RLAST,
  output        psMaster_RVALID,
  input         psMaster_RREADY,
  output        STANDBY0,
  output        RUNNING0,
  output        STANDBY1,
  output        RUNNING1
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  wire  uart0_clock; // @[duel_uart.scala 227:21]
  wire  uart0_reset; // @[duel_uart.scala 227:21]
  wire  uart0_client_AWID; // @[duel_uart.scala 227:21]
  wire [31:0] uart0_client_AWADDR; // @[duel_uart.scala 227:21]
  wire  uart0_client_AWVALID; // @[duel_uart.scala 227:21]
  wire  uart0_client_AWREADY; // @[duel_uart.scala 227:21]
  wire [31:0] uart0_client_WDATA; // @[duel_uart.scala 227:21]
  wire  uart0_client_WLAST; // @[duel_uart.scala 227:21]
  wire  uart0_client_WVALID; // @[duel_uart.scala 227:21]
  wire  uart0_client_WREADY; // @[duel_uart.scala 227:21]
  wire  uart0_client_BID; // @[duel_uart.scala 227:21]
  wire  uart0_client_BVALID; // @[duel_uart.scala 227:21]
  wire  uart0_client_ARID; // @[duel_uart.scala 227:21]
  wire [31:0] uart0_client_ARADDR; // @[duel_uart.scala 227:21]
  wire [7:0] uart0_client_ARLEN; // @[duel_uart.scala 227:21]
  wire  uart0_client_ARVALID; // @[duel_uart.scala 227:21]
  wire  uart0_client_ARREADY; // @[duel_uart.scala 227:21]
  wire  uart0_client_RID; // @[duel_uart.scala 227:21]
  wire [31:0] uart0_client_RDATA; // @[duel_uart.scala 227:21]
  wire  uart0_client_RLAST; // @[duel_uart.scala 227:21]
  wire  uart0_client_RVALID; // @[duel_uart.scala 227:21]
  wire  uart0_client_RREADY; // @[duel_uart.scala 227:21]
  wire [63:0] uart0_io_mtime; // @[duel_uart.scala 227:21]
  wire  uart0_MTIP; // @[duel_uart.scala 227:21]
  wire  uart0_putCharOut0_valid; // @[duel_uart.scala 227:21]
  wire [7:0] uart0_putCharOut0_byte; // @[duel_uart.scala 227:21]
  wire [31:0] uart0_ps_start_port0; // @[duel_uart.scala 227:21]
  wire  uart1_clock; // @[duel_uart.scala 233:21]
  wire  uart1_reset; // @[duel_uart.scala 233:21]
  wire  uart1_client_AWID; // @[duel_uart.scala 233:21]
  wire [31:0] uart1_client_AWADDR; // @[duel_uart.scala 233:21]
  wire  uart1_client_AWVALID; // @[duel_uart.scala 233:21]
  wire  uart1_client_AWREADY; // @[duel_uart.scala 233:21]
  wire [31:0] uart1_client_WDATA; // @[duel_uart.scala 233:21]
  wire  uart1_client_WLAST; // @[duel_uart.scala 233:21]
  wire  uart1_client_WVALID; // @[duel_uart.scala 233:21]
  wire  uart1_client_WREADY; // @[duel_uart.scala 233:21]
  wire  uart1_client_BID; // @[duel_uart.scala 233:21]
  wire  uart1_client_BVALID; // @[duel_uart.scala 233:21]
  wire  uart1_client_ARID; // @[duel_uart.scala 233:21]
  wire [31:0] uart1_client_ARADDR; // @[duel_uart.scala 233:21]
  wire [7:0] uart1_client_ARLEN; // @[duel_uart.scala 233:21]
  wire  uart1_client_ARVALID; // @[duel_uart.scala 233:21]
  wire  uart1_client_ARREADY; // @[duel_uart.scala 233:21]
  wire  uart1_client_RID; // @[duel_uart.scala 233:21]
  wire [31:0] uart1_client_RDATA; // @[duel_uart.scala 233:21]
  wire  uart1_client_RLAST; // @[duel_uart.scala 233:21]
  wire  uart1_client_RVALID; // @[duel_uart.scala 233:21]
  wire  uart1_client_RREADY; // @[duel_uart.scala 233:21]
  wire [63:0] uart1_io_mtime; // @[duel_uart.scala 233:21]
  wire  uart1_MTIP; // @[duel_uart.scala 233:21]
  wire  uart1_putCharOut1_valid; // @[duel_uart.scala 233:21]
  wire [7:0] uart1_putCharOut1_byte; // @[duel_uart.scala 233:21]
  wire [31:0] uart1_ps_start_port1; // @[duel_uart.scala 233:21]
  reg [63:0] mtime; // @[duel_uart.scala 222:22]
  reg [3:0] couter_wrap; // @[duel_uart.scala 223:28]
  wire [3:0] _couter_wrap_T_1 = couter_wrap + 4'h1; // @[duel_uart.scala 224:30]
  wire [63:0] _GEN_9 = {{63'd0}, &couter_wrap}; // @[duel_uart.scala 225:18]
  wire [63:0] _mtime_T_2 = mtime + _GEN_9; // @[duel_uart.scala 225:18]
  reg  awFired; // @[duel_uart.scala 269:50]
  reg  wFired; // @[duel_uart.scala 269:50]
  reg  finished; // @[duel_uart.scala 269:50]
  wire  _GEN_0 = psMaster_AWVALID & psMaster_AWREADY | awFired; // @[duel_uart.scala 274:46 269:50 274:56]
  wire  _GEN_1 = psMaster_WVALID & psMaster_WREADY | wFired; // @[duel_uart.scala 275:44 269:50 275:53]
  wire  _GEN_2 = psMaster_BVALID & psMaster_BREADY | finished; // @[duel_uart.scala 276:44 269:50 276:55]
  reg  bid; // @[duel_uart.scala 283:16]
  reg [31:0] psStartReg0; // @[duel_uart.scala 296:28]
  reg [31:0] psStartReg1; // @[duel_uart.scala 297:28]
  MultiUart_Anon uart0 ( // @[duel_uart.scala 227:21]
    .clock(uart0_clock),
    .reset(uart0_reset),
    .client_AWID(uart0_client_AWID),
    .client_AWADDR(uart0_client_AWADDR),
    .client_AWVALID(uart0_client_AWVALID),
    .client_AWREADY(uart0_client_AWREADY),
    .client_WDATA(uart0_client_WDATA),
    .client_WLAST(uart0_client_WLAST),
    .client_WVALID(uart0_client_WVALID),
    .client_WREADY(uart0_client_WREADY),
    .client_BID(uart0_client_BID),
    .client_BVALID(uart0_client_BVALID),
    .client_ARID(uart0_client_ARID),
    .client_ARADDR(uart0_client_ARADDR),
    .client_ARLEN(uart0_client_ARLEN),
    .client_ARVALID(uart0_client_ARVALID),
    .client_ARREADY(uart0_client_ARREADY),
    .client_RID(uart0_client_RID),
    .client_RDATA(uart0_client_RDATA),
    .client_RLAST(uart0_client_RLAST),
    .client_RVALID(uart0_client_RVALID),
    .client_RREADY(uart0_client_RREADY),
    .io_mtime(uart0_io_mtime),
    .MTIP(uart0_MTIP),
    .putCharOut0_valid(uart0_putCharOut0_valid),
    .putCharOut0_byte(uart0_putCharOut0_byte),
    .ps_start_port0(uart0_ps_start_port0)
  );
  MultiUart_Anon_1 uart1 ( // @[duel_uart.scala 233:21]
    .clock(uart1_clock),
    .reset(uart1_reset),
    .client_AWID(uart1_client_AWID),
    .client_AWADDR(uart1_client_AWADDR),
    .client_AWVALID(uart1_client_AWVALID),
    .client_AWREADY(uart1_client_AWREADY),
    .client_WDATA(uart1_client_WDATA),
    .client_WLAST(uart1_client_WLAST),
    .client_WVALID(uart1_client_WVALID),
    .client_WREADY(uart1_client_WREADY),
    .client_BID(uart1_client_BID),
    .client_BVALID(uart1_client_BVALID),
    .client_ARID(uart1_client_ARID),
    .client_ARADDR(uart1_client_ARADDR),
    .client_ARLEN(uart1_client_ARLEN),
    .client_ARVALID(uart1_client_ARVALID),
    .client_ARREADY(uart1_client_ARREADY),
    .client_RID(uart1_client_RID),
    .client_RDATA(uart1_client_RDATA),
    .client_RLAST(uart1_client_RLAST),
    .client_RVALID(uart1_client_RVALID),
    .client_RREADY(uart1_client_RREADY),
    .io_mtime(uart1_io_mtime),
    .MTIP(uart1_MTIP),
    .putCharOut1_valid(uart1_putCharOut1_valid),
    .putCharOut1_byte(uart1_putCharOut1_byte),
    .ps_start_port1(uart1_ps_start_port1)
  );
  assign client0_AWREADY = uart0_client_AWREADY; // @[duel_uart.scala 241:16]
  assign client0_WREADY = uart0_client_WREADY; // @[duel_uart.scala 241:16]
  assign client0_BID = uart0_client_BID; // @[duel_uart.scala 241:16]
  assign client0_BRESP = 2'h0; // @[duel_uart.scala 241:16]
  assign client0_BVALID = uart0_client_BVALID; // @[duel_uart.scala 241:16]
  assign client0_ARREADY = uart0_client_ARREADY; // @[duel_uart.scala 241:16]
  assign client0_RID = uart0_client_RID; // @[duel_uart.scala 241:16]
  assign client0_RDATA = uart0_client_RDATA; // @[duel_uart.scala 241:16]
  assign client0_RRESP = 2'h0; // @[duel_uart.scala 241:16]
  assign client0_RLAST = uart0_client_RLAST; // @[duel_uart.scala 241:16]
  assign client0_RVALID = uart0_client_RVALID; // @[duel_uart.scala 241:16]
  assign client1_AWREADY = uart1_client_AWREADY; // @[duel_uart.scala 242:16]
  assign client1_WREADY = uart1_client_WREADY; // @[duel_uart.scala 242:16]
  assign client1_BID = uart1_client_BID; // @[duel_uart.scala 242:16]
  assign client1_BRESP = 2'h0; // @[duel_uart.scala 242:16]
  assign client1_BVALID = uart1_client_BVALID; // @[duel_uart.scala 242:16]
  assign client1_ARREADY = uart1_client_ARREADY; // @[duel_uart.scala 242:16]
  assign client1_RID = uart1_client_RID; // @[duel_uart.scala 242:16]
  assign client1_RDATA = uart1_client_RDATA; // @[duel_uart.scala 242:16]
  assign client1_RRESP = 2'h0; // @[duel_uart.scala 242:16]
  assign client1_RLAST = uart1_client_RLAST; // @[duel_uart.scala 242:16]
  assign client1_RVALID = uart1_client_RVALID; // @[duel_uart.scala 242:16]
  assign putChar0_valid = uart0_putCharOut0_valid; // @[duel_uart.scala 248:12]
  assign putChar0_byte = uart0_putCharOut0_byte; // @[duel_uart.scala 248:12]
  assign putChar1_valid = uart1_putCharOut1_valid; // @[duel_uart.scala 251:12]
  assign putChar1_byte = uart1_putCharOut1_byte; // @[duel_uart.scala 251:12]
  assign MTIP0 = uart0_MTIP; // @[duel_uart.scala 256:9]
  assign MTIP1 = uart1_MTIP; // @[duel_uart.scala 257:9]
  assign psMaster_AWREADY = finished ? 1'h0 : ~awFired; // @[duel_uart.scala 278:18 270:20 279:22]
  assign psMaster_WREADY = finished ? 1'h0 : ~wFired; // @[duel_uart.scala 278:18 271:19 280:21]
  assign psMaster_BID = bid; // @[duel_uart.scala 285:16]
  assign psMaster_BRESP = 2'h0; // @[duel_uart.scala 286:18]
  assign psMaster_BVALID = finished ? 1'h0 : awFired & wFired; // @[duel_uart.scala 278:18 272:19 281:21]
  assign psMaster_ARREADY = 1'h0; // @[duel_uart.scala 288:20]
  assign psMaster_RID = 1'h0; // @[duel_uart.scala 292:16]
  assign psMaster_RDATA = 32'h0; // @[duel_uart.scala 291:18]
  assign psMaster_RRESP = 2'h0; // @[duel_uart.scala 294:18]
  assign psMaster_RLAST = 1'h0; // @[duel_uart.scala 293:18]
  assign psMaster_RVALID = 1'h0; // @[duel_uart.scala 290:19]
  assign STANDBY0 = ~(|psStartReg0); // @[duel_uart.scala 312:15]
  assign RUNNING0 = |psStartReg0; // @[duel_uart.scala 315:27]
  assign STANDBY1 = ~(|psStartReg1); // @[duel_uart.scala 313:15]
  assign RUNNING1 = |psStartReg1; // @[duel_uart.scala 316:27]
  assign uart0_clock = clock;
  assign uart0_reset = reset;
  assign uart0_client_AWID = client0_AWID; // @[duel_uart.scala 241:16]
  assign uart0_client_AWADDR = client0_AWADDR; // @[duel_uart.scala 241:16]
  assign uart0_client_AWVALID = client0_AWVALID; // @[duel_uart.scala 241:16]
  assign uart0_client_WDATA = client0_WDATA; // @[duel_uart.scala 241:16]
  assign uart0_client_WLAST = client0_WLAST; // @[duel_uart.scala 241:16]
  assign uart0_client_WVALID = client0_WVALID; // @[duel_uart.scala 241:16]
  assign uart0_client_ARID = client0_ARID; // @[duel_uart.scala 241:16]
  assign uart0_client_ARADDR = client0_ARADDR; // @[duel_uart.scala 241:16]
  assign uart0_client_ARLEN = client0_ARLEN; // @[duel_uart.scala 241:16]
  assign uart0_client_ARVALID = client0_ARVALID; // @[duel_uart.scala 241:16]
  assign uart0_client_RREADY = client0_RREADY; // @[duel_uart.scala 241:16]
  assign uart0_io_mtime = mtime; // @[duel_uart.scala 244:18]
  assign uart0_ps_start_port0 = psStartReg0; // @[duel_uart.scala 306:24]
  assign uart1_clock = clock;
  assign uart1_reset = reset;
  assign uart1_client_AWID = client1_AWID; // @[duel_uart.scala 242:16]
  assign uart1_client_AWADDR = client1_AWADDR; // @[duel_uart.scala 242:16]
  assign uart1_client_AWVALID = client1_AWVALID; // @[duel_uart.scala 242:16]
  assign uart1_client_WDATA = client1_WDATA; // @[duel_uart.scala 242:16]
  assign uart1_client_WLAST = client1_WLAST; // @[duel_uart.scala 242:16]
  assign uart1_client_WVALID = client1_WVALID; // @[duel_uart.scala 242:16]
  assign uart1_client_ARID = client1_ARID; // @[duel_uart.scala 242:16]
  assign uart1_client_ARADDR = client1_ARADDR; // @[duel_uart.scala 242:16]
  assign uart1_client_ARLEN = client1_ARLEN; // @[duel_uart.scala 242:16]
  assign uart1_client_ARVALID = client1_ARVALID; // @[duel_uart.scala 242:16]
  assign uart1_client_RREADY = client1_RREADY; // @[duel_uart.scala 242:16]
  assign uart1_io_mtime = mtime; // @[duel_uart.scala 245:18]
  assign uart1_ps_start_port1 = psStartReg1; // @[duel_uart.scala 307:24]
  always @(posedge clock) begin
    if (reset) begin // @[duel_uart.scala 222:22]
      mtime <= 64'h0; // @[duel_uart.scala 222:22]
    end else begin
      mtime <= _mtime_T_2; // @[duel_uart.scala 225:9]
    end
    if (reset) begin // @[duel_uart.scala 223:28]
      couter_wrap <= 4'h0; // @[duel_uart.scala 223:28]
    end else begin
      couter_wrap <= _couter_wrap_T_1; // @[duel_uart.scala 224:15]
    end
    if (reset) begin // @[duel_uart.scala 269:50]
      awFired <= 1'h0; // @[duel_uart.scala 269:50]
    end else begin
      awFired <= _GEN_0;
    end
    if (reset) begin // @[duel_uart.scala 269:50]
      wFired <= 1'h0; // @[duel_uart.scala 269:50]
    end else begin
      wFired <= _GEN_1;
    end
    if (reset) begin // @[duel_uart.scala 269:50]
      finished <= 1'h0; // @[duel_uart.scala 269:50]
    end else begin
      finished <= _GEN_2;
    end
    if (psMaster_AWREADY & psMaster_AWVALID) begin // @[duel_uart.scala 284:46]
      bid <= psMaster_AWID; // @[duel_uart.scala 284:52]
    end
    if (reset) begin // @[duel_uart.scala 296:28]
      psStartReg0 <= 32'h0; // @[duel_uart.scala 296:28]
    end else if (psMaster_WREADY & psMaster_WVALID) begin // @[duel_uart.scala 299:44]
      psStartReg0 <= psMaster_WDATA; // @[duel_uart.scala 301:17]
    end
    if (reset) begin // @[duel_uart.scala 297:28]
      psStartReg1 <= 32'h0; // @[duel_uart.scala 297:28]
    end else if (psMaster_WREADY & psMaster_WVALID) begin // @[duel_uart.scala 299:44]
      psStartReg1 <= psMaster_WDATA; // @[duel_uart.scala 302:17]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  mtime = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  couter_wrap = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  awFired = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  wFired = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  finished = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  bid = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  psStartReg0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  psStartReg1 = _RAND_7[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
