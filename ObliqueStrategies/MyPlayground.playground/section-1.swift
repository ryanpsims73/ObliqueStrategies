// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

var strategyDictionaryText = [Int: String]()

var strategyDictionaryImage = [Int: String]()

strategyDictionaryText = [
    0: "Abandon normal instruments",
    1: "Always first steps",
    2: "Make an exhaustive list of everything you might do and do the last thing on the list",
    3: "Destroy: Nothing. The most important thing.",
    4: "Discover the recipes you are using and abandon them.",
    5: "Be extravagant",
    6: "Disconnect from desire",
    7: "Think: Inside the work. Outside the work.",
    8: "Try faking it!",
    9: "Voice nagging suspicions",
    10: "Who should do this job? How would they do it?",
    11: "Take away the elements in order of apparent non importance",
    12: "In total darkness or in a very large room, very quietly",
    13: "What wouldn't you do?",
    14: "Take a break",
    15: "Be less critical more often",
    16: "Water",
    17: "Give way to your worst impulse",
    18: "Only a part, not the whole",
    19: "Make it more sensual",
    20: "State the problem in words as clearly as possible",
    21: "Overtly resist change",
    22: "The inconsistency principle",
    23: "Remember .those quiet evenings",
    24: "Question the heroic approach",
    25: "Only one element of each kind",
    26: "Courage!",
    27: "Do something boring",
    28: "Do we need holes?",
    29: "Decorate, decorate",
    30: "Change nothing and continue with immaculate consistency",
    31: "Cut a vital connection",
    32: "Just carry on",
    33: "Listen to the quiet voice",
    34: "Is there something missing?",
    35: "Simply a matter of work",
    36: "Do the words need changing?",
    37: "Accretion",
    38: "Don't be afraid of things because they're easy to do",
    39: "Accept advice",
    40: "Don't break the silence",
    41: "Be dirty",
    42: "Disciplined self-indulgence",
    43: "The most important thing is the thing most easily forgotten",
    44: "What mistakes did you make last time?",
    45: "Use 'unqualified' people",
    46: "Look at the order in which you do things",
    47: "Breathe more deeply",
    48: "Give the game away",
    49: "Tidy up",
    50: "Use filters",
    51: "Gardening, not architecture",
    52: "Distorting time",
    53: "Remove ambiguities and convert to specifics",
    54: "Use an old idea",
    55: "You are an engineer",
    56: "You don't have to be ashamed of using your own ideas",
    57: "Trust in the you of now",
    58: "When is it for?",
    59: "Would anybody want it?",
    60: "Go to an extreme, move back to a more comfortable place",
    61: "What to maintain?",
    62: "Work at a different speed",
    63: "Which frame would make this look right?",
    64: "How would you have done it?",
    65: "Short circuit (example: a man eating peas with the idea that they will improve his virility shovels them straight into his lap)",
    66: "Retrace your steps",
    67: "Make a sudden, destructive unpredictable action; incorporate",
    68: "Discard an axiom",
    69: "Define an area as 'safe' and use it as an anchor",
    70: "Do nothing for as long as possible",
    71: "Which elements can be groupd?",
    72: "Where's the edge? Where does the frame start?",
    73: "Faced with a choice do both",
    74: "Turn it upside down",
    75: "What to increase? What to reduce?",
    76: "Go outside. Shut the door",
    77: "Towards the insignificant",
    78: "Honor thy error as a hidden intention",
    79: "Repitition is a form of change",
    80: "Make a blank valuable by putting it in an equisite frame",
    81: "Not building a wall but making a brick",
    82: "Reverse",
    83: "Are there sections? Consider transitions",
    84: "Ask your body",
    85: "Emphasize the flaws",
    86: "Emphasize differences",
    87: "Use an unacceptable colour",
    88: "Remove specifics and convert to ambiquities",
    89: "What would your closest friend do?",
    90: "Is it finished?",
    91: "Once the search is in progress, something will be found",
    92: "What are you really thinking about just now? Incorporate",
    93: "Don't be afraid of cliches",
    94: "Allow an easement (an easement is the abandonment of a stricture)",
    95: "Dont' be frightended to display your talents",
    96: "Dont' stress one thing more than another",
    97: "Ask people to work against their better judgement",
    98: "Simple subtraction",
    99: "Look closely at the most embarassment details and amplify them",
    100: "Make something implied more definite (reinforce, duplicate)",
    101: "Slow preparation... Fast execution",
    102: "Humanize something free of error"
]

strategyDictionaryText.count

let randomIndex: Int = Int(arc4random_uniform(UInt32(strategyDictionaryText.count)))
let randomStrategy = Array(strategyDictionaryText.values)[randomIndex]

