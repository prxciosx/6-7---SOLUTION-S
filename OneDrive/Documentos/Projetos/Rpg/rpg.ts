// Personagem.ts

class Personagem {
    name: string;
    forg: number;
    agil: number;
    HP: number;
    MP: number;

    constructor(name: string, forg: number, agil: number, HP: number, MP: number) {
        this.name = name;
        this.forg = forg;
        this.agil = agil;
        this.HP = HP;
        this.MP = MP;
    }

    Atacar(): number {
        const dado20 = Math.floor(Math.random() * 20) + 1;
        const ataqueTotal = dado20 + this.forg + this.agil;
        
        console.log(this.name + " rolou um dado: " + dado20 + " + Forca: " + this.forg + " + Agilidade: " + this.agil + " = " + ataqueTotal);
        return ataqueTotal;
    }

    SofrerDano(dano: number): void {
        this.HP = this.HP - dano;
        console.log(this.name + " sofreu " + dano + " de dano! HP restante: " + this.HP);
        
        if (this.HP <= 0) {
            console.log(this.name + " foi derrotado!");
        }
    }
}

const guerreiro = new Personagem("Aragorn", 5.5, 4.2, 100, 50);
const ataque = guerreiro.Atacar();
guerreiro.SofrerDano(ataque);

export default Personagem;