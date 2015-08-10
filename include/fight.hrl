-ifndef(__FIGHT_HRL__).
-define(__FIGHT_HRL__, 1).
-record(fight_state, {
          round_count = 0,
          is_over = false
         }).

-record(fight_side_state, {
          side = undefined,
          pname = undefined
    }).

-record(fight_unit_state, {
          name = undefined,
          order = 0,
          hp = 100,
          attack = 0, 
          defense = 0
         }).
-endif.
