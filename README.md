
# SAMMIVTubeStudioExtension
This is an extension/plugin for SAMMI that allows one to control Denchisoft's VTubeStudio using their API
I slapped this together for a friend in like two days and, although it could be a lot better or improved, it seems to work.

## Permissions and Liability Concern
The source code is available for viewing; feel free to look through it, get a third party consultation, or reach out to myself about any security or other concerns regarding this extension's operation.
Furthermore, I am not responsible for any end-user's actions regarding the use of this extension.

## Feedback
Please feel free to submit a bug report or to DM me directly on Twitter if you need help or have questions.
[Twitter/@Hue_SwordDevil](https://twitter.com/Hue_SwordDevil  "Twitter/@Hue_SwordDevil")

  ## Table of Contents
- [Usage](#usage)
- [Requirements](#requirements)
- [Installation](#installation)
- [Launching](#launching)

- [Commands](#commands)
* [VtubeStudio - Request Token](#vtubestudio---request-token)
* [VtubeStudio - Authenticate](#vtubestudio---authenticate)
* [VtubeStudio - Get VTS Info](#vtubestudio---get-vts-info)
* [VtubeStudio - Load Model](#vtubestudio---load-model)
* [VtubeStudio - Pull Value](#vtubestudio---pull-value)
* [VtubeStudio - Move Model](#vtubestudio---move-model)
* [VtubeStudio - Send Hotkey](#vtubestudio---send-hotkey)
* [VtubeStudio - Send Hotkey (Item)](#vtubestudio---send-hotkey--item-)
* [VtubeStudio - Get Items List](#vtubestudio---get-items-list)
* [VtubeStudio - Load Item](#vtubestudio---load-item)
* [VtubeStudio - Move Item](#vtubestudio---move-item)
* [VtubeStudio - Control Animation](#vtubestudio---control-animation)
* [VtubeStudio - Remove Item](#vtubestudio---remove-item)
* [VtubeStudio - Get Expression State](#vtubestudio---get-expression-state)
* [VtubeStudio - Toggle Expression](#vtubestudio---toggle-expression)
* [VtubeStudio - Listen to Event](#vtubestudio---listen-to-event)
* [VtubeStudio - Unsubscribe from Event](#vtubestudio---unsubscribe-from-event)
+ [VtubeStudio Extension Triggers](#vtubestudio-extension-triggers)
+ [Common Problems](#common-problems)

## Usage

  

#### Requirements

This extension requires the following:

- [VTube Studio 1.21.5](https://store.steampowered.com/app/1325860/VTube_Studio/  "VTube Studio 1.21.5")

- SAMMI (any version) (We no longer support Lioranboard 2, please refer to version [v1.1.0.0](https://github.com/HueVirtualCreature/SAMMIVtubeStudioExtension/releases/tag/v1.1.0.0  "v1.1.0.0"))

  

#### Installation

1. ⚠️**UNINSTALL OLD VERSIONS OF THE EXTENSION**. DO NOT SELECT [REINSTALL]

2. Download the sef file (SAMMI Extension File)

3. In SAMMI's main UI, Click on [Bridge] and Select [Install an extension]

4. Navigate to the downloaded sef file and select it

  

#### Launching

- The **Bridge MUST be opened** for the extension to even load commands, much less work at all.

- When the Bridge has connected to SAMMI, the extension will insert the VtubeStudio Extension commands

- You need to set up a button (or use one fromt he example deck) to trigger an authetication request between SAMMI and VtubeStudio

- You will see a prompt in VTubeStudio for SAMMIVtubeStudioExtension. Click [Allow].

- From here, you should see in the SAMMI alerts area that the extension successfully authenticated.

Note* You do not need to request a new token each time you launch, but you need to re-authenticate. I suggest doing this with a saved token.

  

#### Commands

This guide assumes that you are familiar with SAMMI/LioranBoard 2's Deck, Button, and Commands system(s). We will not go into detail on basic setup.

  

##### VtubeStudio - Request Token

⚠️ This command automatically inserts an authentication token into the global variable space! All commands will look for this variable in order to run!

Requests a token from VTS. Saves the token into global.SAMMIVtubeStudioExtension_AuthToken.

  

Param | Description

------------- | -------------

None | None

  

##### VtubeStudio - Authenticate

Uses a token to authenticate with the VTS API Server.

If successful, sets global.SAMMIVtubeStudioExtension_IsAuthenticated to 1. Otherwise, 0.

⚠️ This commands needs to run first, before all other commands (except VtubeStudio - Request Token)

  

Param | Description

------------- | -------------

None | None

  

##### VtubeStudio - Get VTS Info

Allows one to pull info about the connection to VtubeStudio and some stats/metrics

  

Param | Description

------------- | -------------

Variable Name | Variable to save the response into

Pull Value | Response Property. Leave blank to save entire response or select a property from the dropdown

Delay (ms) | Native to SAMMI

  

##### VtubeStudio - Load Model

Loads a model specified by the user, from a select list. The extension must be authenticated in order for the command to load.

  

Param | Description

------------- | -------------

Model to Load | Model to load, from a dropdown list

Delay (ms) | Native to SAMMI

  

##### VtubeStudio - Pull Value

Pulls data about the currently loaded model.

  

Param | Description

------------- | -------------

Variable | Variable to save the response into

Pull Value | Response Property. Leave blank to save entire response or select a property from the dropdown

Global | Checkbox. If true, variable will be inserted into the global object

Delay (ms) | Native to SAMMI

  

##### VtubeStudio - Move Model

This one is a little finicky and requires some trial and error. It works, but the numbers that you need to supply are a little particular.

(Hint) You can actually use this in conjuction with [VtubeStudio - Pull Value] to move a model and then return the model to its original positon using [modelPosition].

  

Param | Description

------------- | -------------

PositionX | Numerical value representing model's position on the X-axis. Try -1 to 1.

PositionY | Numerical value representing model's position on the Y-axis. Try -1 to 1.

Size | Numerical value representing model's scale. -50 seems like a normal value while -80 seems really small.

Rotation | Numerical value representing degrees of rotation. 0 - 360. I think 359 will cause a spin, but 360 does nothing if your model is alright upright?

Time (0-2) | Numerical value representing how long the transition should take to finish, in seconds. Only accepts 0 - 2

Relative Values | If checked off, the values will be added to the model's current position.

Dev Note | Ignore. Just a comment.

Delay (ms) | Native to SAMMI

  

##### VtubeStudio - Send Hotkey

Triggers a hotkey. Note that you will get an error if you attempt to trigger a hotkey on a model that is not currently loaded. However, SAMMI will not crash.

  

Param | Description

------------- | -------------

Hotkey | Hotkey to trigger, from a select list.

Delay (ms) | Native to SAMMI

  

##### VtubeStudio - Send Hotkey (Item)

This is the same as the Send Hotkey command, but allows one to include an instance ID. This is to allow you to trigger the hotkeys of items loaded into the scene.

Note that you will get an error if you attempt to trigger a non-existent hotkey or a item.

  

Param | Description

------------- | -------------

InstanceID | InstanceID of the item to be triggered (Note that this is not the name of the item. You can get the instanceID of an item using [VtubeStudio - Get Items List] and checking off [includeItemInstancesInScene])

Hotkey | Hotkey to trigger, from a select list.

Delay (ms) | Native to SAMMI

  

##### VtubeStudio - Get Items List

[This request lets you request a list of items that are currently in the scene. It also lets you request a list of item files that are available to be loaded on the user's PC, including Live2D items, animation folders, ... ](https://github.com/DenchiSoft/VTubeStudio#requesting-list-of-available-items-or-items-in-scene  "This request lets you request a list of items that are currently in the scene. It also lets you request a list of item files that are available to be loaded on the user's PC, including Live2D items, animation folders, ... ")

  

Param | Description

------------- | -------------

Variable | Variable to save the response into

includeAvailableSpots | Checkbox. If true, will return an array of numbers representing currently available order-spots, -30 to 30.

includeItemInstancesInScene | Checkbox. Returns an array of items are currently loaded in the scene.

includeAvailableItemFiles | Checkbox. Returns an array of item files that are available to be loaded.

onlyItemsWithFileName | Filter for only returning items with a specific file name. Case sensitive.

onlyItemsWithInstanceID | Filter for only returning items with a specific instance ID. Case sensitive.

Delay (ms) | Native to SAMMI

  

##### VtubeStudio - Load Item

Loads a specified item into the scene.

  

##### VtubeStudio - Move Item

Moves an existing/already loaded scene item.

  

##### VtubeStudio - Control Animation

Controls the animation and other visual details of a loaded Scene Item.

  

##### VtubeStudio - Remove Item

Removes a loaded Scene Item.

  

##### VtubeStudio - Get Expression State
[API Reference](https://github.com/DenchiSoft/VTubeStudio#requesting-current-expression-state-list)
Requests the state of all expressions for the currently loaded model. One may request a single expression if they include the name of a single expression file. You may check off Details to include more information per expression.
You will want to provide a variable name that the command will save the response data into.



##### VtubeStudio - Toggle Expression
[API Reference](https://github.com/DenchiSoft/VTubeStudio#requesting-activation-or-deactivation-of-expressions)
Toggles a single specific expression on the model. The command takes in a variable value for the On/Off state. So you may enter in "true" or "false" or, more useful in certain cases, a boolean variable.
  

##### VtubeStudio - Listen to Event

Param | Description

------------- | -------------

Event | Select. The event to subscribe to

Variable | Variable to save the response into

Delay (ms) | Native to SAMMI

  

##### VtubeStudio - Unsubscribe from Event

Param | Description

------------- | -------------

Event | Select. The event to unsubscribe from

Variable | Variable to save the response into

Delay (ms) | Native to SAMMI

  

###### VtubeStudio Extension Triggers

These are valid events that the extension will fire.

Enter one of these strings into the text box of the Extension Trigger type Trigger of a Button

- VTSEvent - TestEvent

- VTSEvent - ModelLoadedEvent

- VTSEvent - TrackingStatusChangedEvent

- VTSEvent - BackgroundChangedEvent

- VTSEvent - ModelConfigChangedEvent

- VTSEvent - ModelMovedEvent

- VTSEvent - ModelOutlineEvent

  

------------

### Common Problems

##### None of the commands are loaded

SAMMI Bridge needs to be open and connected to SAMMI Client.

  

##### Hotkey will not trigger

WIP