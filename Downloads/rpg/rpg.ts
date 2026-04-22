import * as  readline from 'readline/promises';

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const sleep = (ms: number) => new Promise(resolve => setTimeout(resolve, ms));

class RPG {
    strength: number = 0;
    agility: number = 0;
    HP: number = 20;
    MP: number = 50;
    slimeHealth: number = 14;

    constructor(arma: string) {
        if (arma == '1') {
            this.strength = 7;
            this.agility = 3;
        }
        if (arma == '2') {
            this.strength = 5;
            this.agility = 5;
        }
        if (arma == '3') {
            this.strength = 3;
            this.agility = 7;
        }

    }

    Atacar() {
        this.slimeHealth = this.slimeHealth - this.strength
        return this.slimeHealth;
    }

    SofrerDano() {
        let HitChance = Math.floor(Math.random() * 10) + this.agility;
        let damage = 0;
        if (HitChance < 11) {
            let damage = HitChance;
            return damage;
        } else {
            return damage;
        }
    }

    MPGasto() {
        let MPusado = Math.floor(Math.random() * 10)
        return MPusado;
    }

}

let Name: string = await rl.question("Digite seu nome -> ")
console.log("Olá ", Name, " escolha uma arma inicial.")
let arma: string = await rl.question("1 - Marretão ; 2 - Bastão da Piggy ; 3 - Faca do Murder Mystery - > ")
const Usuario = new RPG(arma)

console.log(Name, " Você tem os seguinte status:")
console.log("--- STATUS ---")
console.log("Força:", Usuario.strength, "| Agilidade:", Usuario.agility)
console.log("--- STATUS ---")
await sleep(3500);
console.log("--- !!  ---")
console.log("OH NAOOOOO UM SLIME APARECEU! É hora de atacar!")
console.log("Vida do slime :", Usuario.slimeHealth)

while (Usuario.slimeHealth > 0) {
    let MPnow = Usuario.MP
    let vidaslime = Usuario.slimeHealth
    let choice: string = await rl.question(`Digite 1 para usar sua arma | Digite 2 para pular seu turno. Quantidade de MP: ${MPnow} -> `);
    if (choice == '1') {
        let vidaslime = Usuario.Atacar()
        let MPusado = Usuario.MPGasto()
        MPnow = MPnow - MPusado
        if (MPnow <= 0) {
            console.log("Você perdeu...")
        }

    } else {
        console.log("Vida do slime :", vidaslime)
        await sleep(2000);
        console.log("Cuidado, ele vai atacar!")
        let dano = Usuario.SofrerDano()
        if (Usuario.HP <= 0) {
            console.log("Você perdeu...")
        }
        await sleep(2000);
        if (dano > 0) {
            console.log("Você tomou dano! Sua nova vida é:", Usuario.HP - dano)
        } else {
            console.log("Você desviou! Que sorte hein :>")
        }
    }
}