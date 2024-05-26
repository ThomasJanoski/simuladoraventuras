local class = require("Libs.middleclass")

local NodeClass = require("Modules.Node")

local Container = {}

Container.Initial = {
    Description = "Voccê se encontra no meio de uma floresta densa, e está sem comida.",
    Choices = {
       {Description = "Procurar por comida.", Destination = "Explorar"},
       {Description = "Ficar no mesmo local.", Destination = "MorrerFome"}
    }
}

Container.MorrerFome = {
    Description = "Você esperou muito, e morreu de fome.",
    GameOver = true
}


Container.Explorar = {
    Description = "Você escolhe explorar a mata densa, e se depara com umas frutinhas.",
    Choices = {
        {Description = "Comer as frutinhas.", Destination = "ComerFrutinhas"},
        {Description = "Ignorar e continuar explorando.", Destination = "ContinuarExplorando"}
     }
}

Container.ComerFrutinhas = {
    Description = "Você comeu as frutinhas. Estavam deliciosas, e nada venenoso.",
    Choices = {
       {Description = "[Continuar Explorando]", Destination = "ContinuarExplorando"}
    }
}

Container.ContinuarExplorando = {
    Description = "Após um tempo, se depara com uma caverna.",
    Choices = {
        {Description = "Entrar na caverna.", Destination = "AdentrarCaverna"},
        {Description = "Seguir reto e ignorar.", Destination = "Mercante"}
     }
}

Container.AdentrarCaverna = {
    Description = "Você adentrou a caverna, e se deparou com um urso. Ele te matou.",
    GameOver = true
}

Container.Mercante = {
    Description = "Seguindo seu trajeto, se depara com uma estrada e um mercante. Decide seguí-lo e consegue chegar são e salvo na cidade.",
    GameOver = true
}

local NodeSystem = {}

function NodeSystem:ChooseNode(NodeName)
    local CurrentNode = NodeClass:new()
    local CurrentContainer = Container[NodeName]

    CurrentNode:Initialize(CurrentContainer.Description, CurrentContainer.Choices, CurrentContainer.GameOver)

    return CurrentNode
end

return NodeSystem