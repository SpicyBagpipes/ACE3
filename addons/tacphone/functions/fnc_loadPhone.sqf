#include "..\script_component.hpp"
/*
 * Author: KJW
 * Loads tacphone
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_tacphone_fnc_loadPhone
 *
 * Public: No
 */

/*


This is absolutely not even slightly feature complete nor organised.


*/

private _emptyDisplay = findDisplay 46 createDisplay "RscDisplayEmpty";
ace_tacphone_phoneCtrlGroup = _emptyDisplay ctrlCreate ["RscControlsGroup",-1];
ace_tacphone_background = _emptyDisplay ctrlCreate ["RscPicture", -1, ace_tacphone_phoneCtrlGroup];

#define WIDTH 0.75
#define HEIGHT 0.5

ace_tacphone_background ctrlSetPosition [(1-(WIDTH+0.1))/2, (1-(HEIGHT+0.1))/2, WIDTH+0.1, HEIGHT+0.1];
ace_tacphone_background ctrlSetText "#(rgb,1,1,1)color(0.3,0.3,0.3,1)";
ace_tacphone_background ctrlCommit 0;

ace_tacphone_app_selected = "";

if (ace_tacphone_app_selected isEqualTo "") then {
    ace_tacphone_home_background = _emptyDisplay ctrlCreate ["RscPicture", -1, ace_tacphone_phoneCtrlGroup];
    ace_tacphone_home_background ctrlSetPosition [(1-WIDTH)/2, (1-HEIGHT)/2, WIDTH, HEIGHT];
    ace_tacphone_home_background ctrlSetText "#(rgb,1,1,1)color(0.1,0.1,0.1,1)";
    ace_tacphone_home_background ctrlCommit 0;
};

if (ace_tacphone_app_selected == "map") then {
    ace_tacphone_map = _emptyDisplay ctrlCreate ["ace_tacphone_mapControl", -1, ace_tacphone_phoneCtrlGroup];
    ace_tacphone_map ctrlMapSetPosition [(1-WIDTH)/2, (1-HEIGHT)/2, WIDTH, HEIGHT]; 
    ace_tacphone_map ctrlCommit 0;
    private _plrPos = ace_tacphone_map ctrlMapWorldToScreen position player;

    ace_tacphone_map ctrlAddEventHandler ["Draw", {
        params ["_ctrl"];
        _ctrl drawIcon ["\A3\ui_f\data\map\markers\nato\b_air.paa", [1,0,0,1], getPosASLVisual player, 20, 20, 0, "boobies!!", 0, -1]
    }];

    ace_tacphone_map ctrlAddEventHandler ["MouseButtonDblClick", {
        params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
        private _worldPos = (_control ctrlMapScreenToWorld [_xPos, _yPos]);
        
        /*
            Create map marker menu.
        */
    }];
};