$(function () {
    function display(bool) {
        if(bool) {
            $("#pet-container").show()
        } else {
            $("#pet-container").hide()
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        const zod = event.data;
        const petList = zod.pets

        const zone = document.getElementById("list-pet")
        zone.innerHTML = ""

        if(petList.length > 0) {
            let button = document.createElement("button")
            button.innerText = "Cancel / Annuler"
            button.addEventListener("click", () => {
                $.post('http://krp_pets/removePet', JSON.stringify({}));
            })
            button.style.background = "red"

            zone.appendChild(button)

            petList.forEach((e) => {
                let button = document.createElement("button")
                button.innerText = `${e.name} (${e.pet})`

                button.addEventListener("click", () => {
                    $.post('http://krp_pets/submit', JSON.stringify({name: e.name, race: e.pet}));
                })

                zone.appendChild(button)
            })
        } else {
            let button = document.createElement("button")
            button.innerText = `No pets`
            zone.appendChild(button)
        }

        if (zod.type === "ui") {
            if (zod.status) {
                display(true)
            } else {
                display(false)
            }
        }
    })
    
    document.onkeyup = function (data) {
        if (data.which === 27) {
            $.post('http://krp_pets/exit', JSON.stringify({}));
            return true
        }
    }

    $("#exit").click(function() {
        $.post('http://krp_pets/exit', JSON.stringify({}));
        return true
    })

    $("#discord").click(function() {
        const discord = "https://discord.gg/t3ZxqJJAAH"

        const copyToClipboard = (str) => {
            const el = document.createElement('textarea')
            el.value = str
            document.body.appendChild(el)
            el.select()
            document.execCommand('copy')
            document.body.removeChild(el)
        }

        copyToClipboard(discord)

        $.post('http://krp_pets/discord', JSON.stringify({}));
    })
})