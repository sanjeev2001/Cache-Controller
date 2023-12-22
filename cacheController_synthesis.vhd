--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: O.87xd
--  \   \         Application: netgen
--  /   /         Filename: cacheController_synthesis.vhd
-- /___/   /\     Timestamp: Fri Oct 13 17:16:36 2023
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm cacheController -w -dir netgen/synthesis -ofmt vhdl -sim cacheController.ngc cacheController_synthesis.vhd 
-- Device	: xc3s500e-5-fg320
-- Input file	: cacheController.ngc
-- Output file	: /home/student2/s22srith/coe758/project 1/Cache Controller/Cache_Controller/netgen/synthesis/cacheController_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: cacheController
-- Xilinx	: /CMC/tools/xilinx/13.4/ISE_DS/ISE/
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity cacheController is
  port (
    clk : in STD_LOGIC := 'X'; 
    boundary_cpu_cs : out STD_LOGIC; 
    rst : in STD_LOGIC := 'X'; 
    trig : in STD_LOGIC := 'X'; 
    boundary_cpu_rdy : out STD_LOGIC; 
    boundary_mstrb : out STD_LOGIC; 
    globalVbit : out STD_LOGIC; 
    boundary_cpu_w_r : out STD_LOGIC; 
    globalDbit : out STD_LOGIC; 
    globalIndex : out STD_LOGIC_VECTOR ( 2 downto 0 ); 
    globalState : out STD_LOGIC_VECTOR ( 2 downto 0 ); 
    globalOffset : out STD_LOGIC_VECTOR ( 4 downto 0 ); 
    boundary_cpu_dout : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    boundary_cpu_din : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    globalTag : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    boundary_cpu_address : out STD_LOGIC_VECTOR ( 15 downto 0 ) 
  );
end cacheController;

architecture Structure of cacheController is
  signal Mmux_globalDbit_3_f5 : STD_LOGIC; 
  signal Mmux_globalDbit_4_f5 : STD_LOGIC; 
  signal Mmux_globalVbit_4_f5 : STD_LOGIC; 
  signal N22 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal Q_mux0505 : STD_LOGIC; 
  signal Q_mux0516 : STD_LOGIC; 
  signal Q_mux0517 : STD_LOGIC; 
  signal address_table_0_0_Q : STD_LOGIC; 
  signal address_table_0_0_not0000 : STD_LOGIC; 
  signal address_table_0_1_Q : STD_LOGIC; 
  signal address_table_0_1_not0000 : STD_LOGIC; 
  signal address_table_0_1_not00001_12 : STD_LOGIC; 
  signal address_table_0_1_not00002_13 : STD_LOGIC; 
  signal address_table_2_0_Q : STD_LOGIC; 
  signal address_table_2_0_not0000 : STD_LOGIC; 
  signal boundary_cpu_address_10_OBUF_32 : STD_LOGIC; 
  signal boundary_cpu_address_12_OBUF_33 : STD_LOGIC; 
  signal boundary_cpu_address_13_OBUF_34 : STD_LOGIC; 
  signal boundary_cpu_address_1_OBUF_35 : STD_LOGIC; 
  signal boundary_cpu_address_6_OBUF_36 : STD_LOGIC; 
  signal boundary_cpu_dout_0_OBUF_54 : STD_LOGIC; 
  signal boundary_cpu_dout_1_OBUF_55 : STD_LOGIC; 
  signal boundary_cpu_dout_2_OBUF_56 : STD_LOGIC; 
  signal boundary_cpu_dout_3_OBUF_57 : STD_LOGIC; 
  signal boundary_cpu_rdy_OBUF_59 : STD_LOGIC; 
  signal clk_BUFGP_62 : STD_LOGIC; 
  signal cpu_cs_66 : STD_LOGIC; 
  signal cpu_cs_1_67 : STD_LOGIC; 
  signal cpu_cs_mux0005 : STD_LOGIC; 
  signal cpu_rReg1_72 : STD_LOGIC; 
  signal cpu_rReg2_73 : STD_LOGIC; 
  signal cpu_st1_FSM_FFd1_74 : STD_LOGIC; 
  signal cpu_st1_FSM_FFd2_75 : STD_LOGIC; 
  signal cpu_st1_FSM_FFd3_76 : STD_LOGIC; 
  signal cpu_st1_FSM_FFd4_77 : STD_LOGIC; 
  signal cpu_st1_FSM_FFd5_78 : STD_LOGIC; 
  signal cpu_st1_FSM_FFd5_In : STD_LOGIC; 
  signal cpu_st1_FSM_FFd6_80 : STD_LOGIC; 
  signal cpu_st1_FSM_FFd6_In : STD_LOGIC; 
  signal cpu_updPat_82 : STD_LOGIC; 
  signal cpu_updPat_or0000_83 : STD_LOGIC; 
  signal globalState_0_OBUF_96 : STD_LOGIC; 
  signal globalState_1_OBUF_97 : STD_LOGIC; 
  signal rst_IBUF_108 : STD_LOGIC; 
  signal sdram_mstrb_not0001 : STD_LOGIC; 
  signal sdram_mstrb_not00011 : STD_LOGIC; 
  signal state_FSM_FFd1_111 : STD_LOGIC; 
  signal state_FSM_FFd2_112 : STD_LOGIC; 
  signal state_FSM_FFd3_113 : STD_LOGIC; 
  signal state_FSM_FFd3_In : STD_LOGIC; 
  signal state_FSM_FFd4_115 : STD_LOGIC; 
  signal state_FSM_FFd5_116 : STD_LOGIC; 
  signal trig_IBUF_118 : STD_LOGIC; 
  signal cpu_Result : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal cpu_patCtrl : STD_LOGIC_VECTOR ( 2 downto 0 ); 
begin
  XST_GND : GND
    port map (
      G => Mmux_globalDbit_3_f5
    );
  XST_VCC : VCC
    port map (
      P => boundary_cpu_rdy_OBUF_59
    );
  address_table_0_0 : LD
    port map (
      D => Q_mux0517,
      G => address_table_0_0_not0000,
      Q => address_table_0_0_Q
    );
  address_table_0_1 : LD
    port map (
      D => Q_mux0516,
      G => address_table_0_1_not0000,
      Q => address_table_0_1_Q
    );
  address_table_2_0 : LD
    port map (
      D => Q_mux0505,
      G => address_table_2_0_not0000,
      Q => address_table_2_0_Q
    );
  state_FSM_FFd3 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_62,
      D => state_FSM_FFd3_In,
      Q => state_FSM_FFd3_113
    );
  state_FSM_FFd2 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_62,
      D => state_FSM_FFd3_113,
      Q => state_FSM_FFd2_112
    );
  state_FSM_FFd1 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_62,
      D => state_FSM_FFd2_112,
      Q => state_FSM_FFd1_111
    );
  cpu_st1_FSM_FFd1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_62,
      CLR => rst_IBUF_108,
      D => cpu_st1_FSM_FFd2_75,
      Q => cpu_st1_FSM_FFd1_74
    );
  cpu_st1_FSM_FFd2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_62,
      CLR => rst_IBUF_108,
      D => cpu_st1_FSM_FFd3_76,
      Q => cpu_st1_FSM_FFd2_75
    );
  cpu_st1_FSM_FFd3 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_62,
      CLR => rst_IBUF_108,
      D => cpu_st1_FSM_FFd4_77,
      Q => cpu_st1_FSM_FFd3_76
    );
  cpu_st1_FSM_FFd4 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_62,
      CLR => rst_IBUF_108,
      D => cpu_st1_FSM_FFd5_78,
      Q => cpu_st1_FSM_FFd4_77
    );
  cpu_st1_FSM_FFd5 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_62,
      CLR => rst_IBUF_108,
      D => cpu_st1_FSM_FFd5_In,
      Q => cpu_st1_FSM_FFd5_78
    );
  cpu_st1_FSM_FFd6 : FDP
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_BUFGP_62,
      D => cpu_st1_FSM_FFd6_In,
      PRE => rst_IBUF_108,
      Q => cpu_st1_FSM_FFd6_80
    );
  cpu_patCtrl_2 : FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_BUFGP_62,
      CE => cpu_updPat_82,
      D => cpu_Result(2),
      PRE => rst_IBUF_108,
      Q => cpu_patCtrl(2)
    );
  cpu_patCtrl_1 : FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_BUFGP_62,
      CE => cpu_updPat_82,
      D => cpu_Result(1),
      PRE => rst_IBUF_108,
      Q => cpu_patCtrl(1)
    );
  cpu_patCtrl_0 : FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_BUFGP_62,
      CE => cpu_updPat_82,
      D => cpu_Result(0),
      PRE => rst_IBUF_108,
      Q => cpu_patCtrl(0)
    );
  cpu_updPat : LD
    port map (
      D => cpu_st1_FSM_FFd5_78,
      G => cpu_updPat_or0000_83,
      Q => cpu_updPat_82
    );
  cpu_cs : LD
    port map (
      D => cpu_cs_mux0005,
      G => cpu_updPat_or0000_83,
      Q => cpu_cs_66
    );
  cpu_rReg2 : FD
    port map (
      C => clk_BUFGP_62,
      D => cpu_rReg1_72,
      Q => cpu_rReg2_73
    );
  cpu_rReg1 : FD
    port map (
      C => clk_BUFGP_62,
      D => trig_IBUF_118,
      Q => cpu_rReg1_72
    );
  cpu_cs_mux00051 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => cpu_st1_FSM_FFd1_74,
      I1 => cpu_st1_FSM_FFd2_75,
      I2 => cpu_st1_FSM_FFd3_76,
      I3 => cpu_st1_FSM_FFd4_77,
      O => cpu_cs_mux0005
    );
  cpu_updPat_or0000_SW0 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => cpu_st1_FSM_FFd3_76,
      I1 => cpu_st1_FSM_FFd4_77,
      I2 => cpu_st1_FSM_FFd5_78,
      O => N6
    );
  cpu_updPat_or0000 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => cpu_st1_FSM_FFd1_74,
      I1 => cpu_st1_FSM_FFd6_80,
      I2 => cpu_st1_FSM_FFd2_75,
      I3 => N6,
      O => cpu_updPat_or0000_83
    );
  state_or00011 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => state_FSM_FFd4_115,
      I1 => state_FSM_FFd2_112,
      O => globalState_0_OBUF_96
    );
  state_or00001 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => state_FSM_FFd3_113,
      I1 => state_FSM_FFd2_112,
      O => globalState_1_OBUF_97
    );
  cpu_Mrom_patOut101 : LUT3
    generic map(
      INIT => X"9C"
    )
    port map (
      I0 => cpu_patCtrl(1),
      I1 => cpu_patCtrl(0),
      I2 => cpu_patCtrl(2),
      O => boundary_cpu_address_1_OBUF_35
    );
  cpu_Mcount_patCtrl_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => cpu_patCtrl(0),
      I1 => cpu_patCtrl(1),
      O => cpu_Result(1)
    );
  cpu_st1_FSM_FFd5_In1 : LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => cpu_rReg2_73,
      I1 => cpu_rReg1_72,
      I2 => cpu_st1_FSM_FFd6_80,
      O => cpu_st1_FSM_FFd5_In
    );
  cpu_Mcount_patCtrl_xor_2_11 : LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => cpu_patCtrl(0),
      I1 => cpu_patCtrl(1),
      I2 => cpu_patCtrl(2),
      O => cpu_Result(2)
    );
  cpu_st1_FSM_FFd6_In1 : LUT4
    generic map(
      INIT => X"EFCC"
    )
    port map (
      I0 => cpu_rReg2_73,
      I1 => cpu_st1_FSM_FFd1_74,
      I2 => cpu_rReg1_72,
      I3 => cpu_st1_FSM_FFd6_80,
      O => cpu_st1_FSM_FFd6_In
    );
  cpu_patOut_4_21 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => cpu_patCtrl(2),
      I1 => cpu_patCtrl(1),
      O => boundary_cpu_dout_1_OBUF_55
    );
  cpu_patOut_4_11 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => cpu_patCtrl(2),
      I1 => cpu_patCtrl(1),
      I2 => cpu_patCtrl(0),
      O => boundary_cpu_dout_2_OBUF_56
    );
  cpu_patOut_21_1 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => cpu_patCtrl(0),
      I1 => cpu_patCtrl(2),
      O => boundary_cpu_address_12_OBUF_33
    );
  cpu_patOut_23_1 : LUT3
    generic map(
      INIT => X"A8"
    )
    port map (
      I0 => cpu_patCtrl(2),
      I1 => cpu_patCtrl(0),
      I2 => cpu_patCtrl(1),
      O => boundary_cpu_address_10_OBUF_32
    );
  cpu_patOut_22_1 : LUT3
    generic map(
      INIT => X"82"
    )
    port map (
      I0 => cpu_patCtrl(2),
      I1 => cpu_patCtrl(0),
      I2 => cpu_patCtrl(1),
      O => boundary_cpu_address_13_OBUF_34
    );
  cpu_Mrom_patOut151 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => cpu_patCtrl(1),
      I1 => cpu_patCtrl(2),
      O => boundary_cpu_address_6_OBUF_36
    );
  rst_IBUF : IBUF
    port map (
      I => rst,
      O => rst_IBUF_108
    );
  trig_IBUF : IBUF
    port map (
      I => trig,
      O => trig_IBUF_118
    );
  boundary_cpu_cs_OBUF : OBUF
    port map (
      I => cpu_cs_1_67,
      O => boundary_cpu_cs
    );
  boundary_cpu_rdy_OBUF : OBUF
    port map (
      I => boundary_cpu_rdy_OBUF_59,
      O => boundary_cpu_rdy
    );
  globalVbit_OBUF : OBUF
    port map (
      I => Mmux_globalVbit_4_f5,
      O => globalVbit
    );
  boundary_cpu_w_r_OBUF : OBUF
    port map (
      I => boundary_cpu_dout_3_OBUF_57,
      O => boundary_cpu_w_r
    );
  globalDbit_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_4_f5,
      O => globalDbit
    );
  globalIndex_2_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_3_f5,
      O => globalIndex(2)
    );
  globalIndex_1_OBUF : OBUF
    port map (
      I => boundary_cpu_address_6_OBUF_36,
      O => globalIndex(1)
    );
  globalIndex_0_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_3_f5,
      O => globalIndex(0)
    );
  globalState_2_OBUF : OBUF
    port map (
      I => state_FSM_FFd1_111,
      O => globalState(2)
    );
  globalState_1_OBUF : OBUF
    port map (
      I => globalState_1_OBUF_97,
      O => globalState(1)
    );
  globalState_0_OBUF : OBUF
    port map (
      I => globalState_0_OBUF_96,
      O => globalState(0)
    );
  globalOffset_4_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_3_f5,
      O => globalOffset(4)
    );
  globalOffset_3_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_3_f5,
      O => globalOffset(3)
    );
  globalOffset_2_OBUF : OBUF
    port map (
      I => cpu_patCtrl(2),
      O => globalOffset(2)
    );
  globalOffset_1_OBUF : OBUF
    port map (
      I => boundary_cpu_address_1_OBUF_35,
      O => globalOffset(1)
    );
  globalOffset_0_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_3_f5,
      O => globalOffset(0)
    );
  boundary_cpu_dout_7_OBUF : OBUF
    port map (
      I => boundary_cpu_dout_3_OBUF_57,
      O => boundary_cpu_dout(7)
    );
  boundary_cpu_dout_6_OBUF : OBUF
    port map (
      I => boundary_cpu_dout_2_OBUF_56,
      O => boundary_cpu_dout(6)
    );
  boundary_cpu_dout_5_OBUF : OBUF
    port map (
      I => boundary_cpu_dout_1_OBUF_55,
      O => boundary_cpu_dout(5)
    );
  boundary_cpu_dout_4_OBUF : OBUF
    port map (
      I => boundary_cpu_dout_0_OBUF_54,
      O => boundary_cpu_dout(4)
    );
  boundary_cpu_dout_3_OBUF : OBUF
    port map (
      I => boundary_cpu_dout_3_OBUF_57,
      O => boundary_cpu_dout(3)
    );
  boundary_cpu_dout_2_OBUF : OBUF
    port map (
      I => boundary_cpu_dout_2_OBUF_56,
      O => boundary_cpu_dout(2)
    );
  boundary_cpu_dout_1_OBUF : OBUF
    port map (
      I => boundary_cpu_dout_1_OBUF_55,
      O => boundary_cpu_dout(1)
    );
  boundary_cpu_dout_0_OBUF : OBUF
    port map (
      I => boundary_cpu_dout_0_OBUF_54,
      O => boundary_cpu_dout(0)
    );
  boundary_cpu_din_7_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_3_f5,
      O => boundary_cpu_din(7)
    );
  boundary_cpu_din_6_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_3_f5,
      O => boundary_cpu_din(6)
    );
  boundary_cpu_din_5_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_3_f5,
      O => boundary_cpu_din(5)
    );
  boundary_cpu_din_4_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_3_f5,
      O => boundary_cpu_din(4)
    );
  boundary_cpu_din_3_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_3_f5,
      O => boundary_cpu_din(3)
    );
  boundary_cpu_din_2_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_3_f5,
      O => boundary_cpu_din(2)
    );
  boundary_cpu_din_1_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_3_f5,
      O => boundary_cpu_din(1)
    );
  boundary_cpu_din_0_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_3_f5,
      O => boundary_cpu_din(0)
    );
  globalTag_7_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_3_f5,
      O => globalTag(7)
    );
  globalTag_6_OBUF : OBUF
    port map (
      I => boundary_cpu_address_10_OBUF_32,
      O => globalTag(6)
    );
  globalTag_5_OBUF : OBUF
    port map (
      I => boundary_cpu_address_13_OBUF_34,
      O => globalTag(5)
    );
  globalTag_4_OBUF : OBUF
    port map (
      I => boundary_cpu_address_12_OBUF_33,
      O => globalTag(4)
    );
  globalTag_3_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_3_f5,
      O => globalTag(3)
    );
  globalTag_2_OBUF : OBUF
    port map (
      I => boundary_cpu_address_10_OBUF_32,
      O => globalTag(2)
    );
  globalTag_1_OBUF : OBUF
    port map (
      I => boundary_cpu_address_13_OBUF_34,
      O => globalTag(1)
    );
  globalTag_0_OBUF : OBUF
    port map (
      I => boundary_cpu_address_12_OBUF_33,
      O => globalTag(0)
    );
  boundary_cpu_address_15_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_3_f5,
      O => boundary_cpu_address(15)
    );
  boundary_cpu_address_14_OBUF : OBUF
    port map (
      I => boundary_cpu_address_10_OBUF_32,
      O => boundary_cpu_address(14)
    );
  boundary_cpu_address_13_OBUF : OBUF
    port map (
      I => boundary_cpu_address_13_OBUF_34,
      O => boundary_cpu_address(13)
    );
  boundary_cpu_address_12_OBUF : OBUF
    port map (
      I => boundary_cpu_address_12_OBUF_33,
      O => boundary_cpu_address(12)
    );
  boundary_cpu_address_11_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_3_f5,
      O => boundary_cpu_address(11)
    );
  boundary_cpu_address_10_OBUF : OBUF
    port map (
      I => boundary_cpu_address_10_OBUF_32,
      O => boundary_cpu_address(10)
    );
  boundary_cpu_address_9_OBUF : OBUF
    port map (
      I => boundary_cpu_address_13_OBUF_34,
      O => boundary_cpu_address(9)
    );
  boundary_cpu_address_8_OBUF : OBUF
    port map (
      I => boundary_cpu_address_12_OBUF_33,
      O => boundary_cpu_address(8)
    );
  boundary_cpu_address_7_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_3_f5,
      O => boundary_cpu_address(7)
    );
  boundary_cpu_address_6_OBUF : OBUF
    port map (
      I => boundary_cpu_address_6_OBUF_36,
      O => boundary_cpu_address(6)
    );
  boundary_cpu_address_5_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_3_f5,
      O => boundary_cpu_address(5)
    );
  boundary_cpu_address_4_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_3_f5,
      O => boundary_cpu_address(4)
    );
  boundary_cpu_address_3_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_3_f5,
      O => boundary_cpu_address(3)
    );
  boundary_cpu_address_2_OBUF : OBUF
    port map (
      I => cpu_patCtrl(2),
      O => boundary_cpu_address(2)
    );
  boundary_cpu_address_1_OBUF : OBUF
    port map (
      I => boundary_cpu_address_1_OBUF_35,
      O => boundary_cpu_address(1)
    );
  boundary_cpu_address_0_OBUF : OBUF
    port map (
      I => Mmux_globalDbit_3_f5,
      O => boundary_cpu_address(0)
    );
  state_FSM_FFd4 : FDS
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_62,
      D => Mmux_globalDbit_3_f5,
      S => state_FSM_FFd1_111,
      Q => state_FSM_FFd4_115
    );
  state_FSM_FFd5 : FDSE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_BUFGP_62,
      CE => cpu_cs_66,
      D => Mmux_globalDbit_3_f5,
      S => state_FSM_FFd4_115,
      Q => state_FSM_FFd5_116
    );
  state_FSM_FFd3_In11 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => cpu_cs_66,
      I1 => state_FSM_FFd5_116,
      O => state_FSM_FFd3_In
    );
  cpu_patOut_4_1 : LUT3
    generic map(
      INIT => X"19"
    )
    port map (
      I0 => cpu_patCtrl(2),
      I1 => cpu_patCtrl(1),
      I2 => cpu_patCtrl(0),
      O => boundary_cpu_dout_3_OBUF_57
    );
  address_table_2_0_not00001 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => cpu_patCtrl(2),
      I1 => sdram_mstrb_not0001,
      I2 => cpu_patCtrl(1),
      O => address_table_2_0_not0000
    );
  address_table_0_0_not00001 : LUT3
    generic map(
      INIT => X"A2"
    )
    port map (
      I0 => sdram_mstrb_not0001,
      I1 => cpu_patCtrl(2),
      I2 => cpu_patCtrl(1),
      O => address_table_0_0_not0000
    );
  Q_mux05171 : LUT3
    generic map(
      INIT => X"A2"
    )
    port map (
      I0 => state_FSM_FFd1_111,
      I1 => cpu_patCtrl(2),
      I2 => cpu_patCtrl(1),
      O => Q_mux0517
    );
  Q_mux05051 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => cpu_patCtrl(2),
      I1 => state_FSM_FFd1_111,
      I2 => cpu_patCtrl(1),
      O => Q_mux0505
    );
  cpu_patOut_5_1 : LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => cpu_patCtrl(2),
      I1 => cpu_patCtrl(1),
      I2 => cpu_patCtrl(0),
      O => boundary_cpu_dout_0_OBUF_54
    );
  Mmux_globalDbit_4_f51 : LUT4
    generic map(
      INIT => X"CEC4"
    )
    port map (
      I0 => cpu_patCtrl(2),
      I1 => address_table_0_1_Q,
      I2 => cpu_patCtrl(1),
      I3 => Mmux_globalDbit_3_f5,
      O => Mmux_globalDbit_4_f5
    );
  Mmux_globalVbit_4_f51 : LUT4
    generic map(
      INIT => X"CEC4"
    )
    port map (
      I0 => cpu_patCtrl(2),
      I1 => address_table_0_0_Q,
      I2 => cpu_patCtrl(1),
      I3 => address_table_2_0_Q,
      O => Mmux_globalVbit_4_f5
    );
  Q_mux05161 : LUT4
    generic map(
      INIT => X"0282"
    )
    port map (
      I0 => state_FSM_FFd4_115,
      I1 => cpu_patCtrl(2),
      I2 => cpu_patCtrl(1),
      I3 => cpu_patCtrl(0),
      O => Q_mux0516
    );
  address_table_0_1_not0000_SW1_SW0 : LUT3
    generic map(
      INIT => X"DA"
    )
    port map (
      I0 => cpu_patCtrl(1),
      I1 => cpu_patCtrl(0),
      I2 => cpu_patCtrl(2),
      O => N22
    );
  clk_BUFGP : BUFGP
    port map (
      I => clk,
      O => clk_BUFGP_62
    );
  cpu_Mcount_patCtrl_xor_0_11_INV_0 : INV
    port map (
      I => cpu_patCtrl(0),
      O => cpu_Result(0)
    );
  sdram_mstrb_not000111 : LUT4
    generic map(
      INIT => X"0302"
    )
    port map (
      I0 => state_FSM_FFd1_111,
      I1 => state_FSM_FFd3_113,
      I2 => state_FSM_FFd4_115,
      I3 => state_FSM_FFd2_112,
      O => sdram_mstrb_not00011
    );
  sdram_mstrb_not00011_f5 : MUXF5
    port map (
      I0 => sdram_mstrb_not00011,
      I1 => Mmux_globalDbit_3_f5,
      S => state_FSM_FFd5_116,
      O => sdram_mstrb_not0001
    );
  address_table_0_1_not00001 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => state_FSM_FFd3_113,
      I1 => state_FSM_FFd5_116,
      I2 => N22,
      O => address_table_0_1_not00001_12
    );
  address_table_0_1_not00002 : LUT4
    generic map(
      INIT => X"0302"
    )
    port map (
      I0 => state_FSM_FFd1_111,
      I1 => state_FSM_FFd3_113,
      I2 => state_FSM_FFd5_116,
      I3 => state_FSM_FFd2_112,
      O => address_table_0_1_not00002_13
    );
  address_table_0_1_not0000_f5 : MUXF5
    port map (
      I0 => address_table_0_1_not00002_13,
      I1 => address_table_0_1_not00001_12,
      S => state_FSM_FFd4_115,
      O => address_table_0_1_not0000
    );
  cpu_cs_1 : LD
    port map (
      D => cpu_cs_mux0005,
      G => cpu_updPat_or0000_83,
      Q => cpu_cs_1_67
    );

end Structure;

