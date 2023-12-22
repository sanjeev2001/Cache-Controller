--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:07:48 10/13/2023
-- Design Name:   
-- Module Name:   /home/student2/s22srith/coe758/project 1/Cache Controller/Cache_Controller/test_cache_controller.vhd
-- Project Name:  Cache_Controller
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cacheController
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_cache_controller IS
END test_cache_controller;
 
ARCHITECTURE behavior OF test_cache_controller IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cacheController
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         trig : IN  std_logic;
         boundary_cpu_address : OUT  std_logic_vector(15 downto 0);
         boundary_cpu_din : OUT  std_logic_vector(7 downto 0);
         boundary_cpu_dout : OUT  std_logic_vector(7 downto 0);
         boundary_cpu_w_r : OUT  std_logic;
         boundary_cpu_cs : OUT  std_logic;
         boundary_cpu_rdy : OUT  std_logic;
         boundary_mstrb : OUT  std_logic;
         globalState : OUT  std_logic_vector(2 downto 0);
         globalTag : OUT  std_logic_vector(7 downto 0);
         globalIndex : OUT  std_logic_vector(2 downto 0);
         globalOffset : OUT  std_logic_vector(4 downto 0);
         globalVbit : OUT  std_logic;
         globalDbit : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal trig : std_logic := '0';

 	--Outputs
   signal boundary_cpu_address : std_logic_vector(15 downto 0);
   signal boundary_cpu_din : std_logic_vector(7 downto 0);
   signal boundary_cpu_dout : std_logic_vector(7 downto 0);
   signal boundary_cpu_w_r : std_logic;
   signal boundary_cpu_cs : std_logic;
   signal boundary_cpu_rdy : std_logic;
   signal boundary_mstrb : std_logic;
   signal globalState : std_logic_vector(2 downto 0);
   signal globalTag : std_logic_vector(7 downto 0);
   signal globalIndex : std_logic_vector(2 downto 0);
   signal globalOffset : std_logic_vector(4 downto 0);
   signal globalVbit : std_logic;
   signal globalDbit : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cacheController PORT MAP (
          clk => clk,
          rst => rst,
          trig => trig,
          boundary_cpu_address => boundary_cpu_address,
          boundary_cpu_din => boundary_cpu_din,
          boundary_cpu_dout => boundary_cpu_dout,
          boundary_cpu_w_r => boundary_cpu_w_r,
          boundary_cpu_cs => boundary_cpu_cs,
          boundary_cpu_rdy => boundary_cpu_rdy,
          boundary_mstrb => boundary_mstrb,
          globalState => globalState,
          globalTag => globalTag,
          globalIndex => globalIndex,
          globalOffset => globalOffset,
          globalVbit => globalVbit,
          globalDbit => globalDbit
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
