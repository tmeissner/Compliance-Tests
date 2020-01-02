library vunit_lib;
context vunit_lib.vunit_context;
library ieee;
use ieee.std_logic_1164.all;

entity tb_matching_operators_gt is
  generic ( runner_cfg : runner_cfg_t );
end entity tb_matching_operators_gt;

architecture tb of tb_matching_operators_gt is
begin
  test_runner: process is
  begin
    test_runner_setup(runner, runner_cfg);

    while test_suite loop
      if run("Test matching greater than between same values") then
        check_equal('1' ?> '1', '0');
      elsif run("Test matching greater than between a low and a high value") then
        check_equal('0' ?> '1', '0');
      elsif run("Test matching greater than between a high and a low value") then
        check_equal('1' ?> '0', '1');
      elsif run("Testing matching greater than between weak values") then
        check_equal('H' ?> 'L', '1');
      elsif run("Testing matching greater than with X") then
        check_equal('1' ?> 'X', 'X');
      elsif run("Testing matching greater than with W") then
        check_equal('1' ?> 'W', 'X');
      elsif run("Testing matching greater than with Z") then
        check_equal('1' ?> 'Z', 'X');
      elsif run("Testing matching greater than with U") then
        check_equal('1' ?> 'U', 'U');
      end if;
    end loop;

    test_runner_cleanup(runner);
    wait;
  end process test_runner;
end architecture tb;
