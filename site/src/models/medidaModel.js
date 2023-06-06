var database = require("../database/config");

function buscarUltimasMedidas(idAquario, limite_linhas) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select generoMusical, count(generoMusical) as qtdVotos from usuario group by generoMusical;`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select generoMusical, count(generoMusical) as qtdVotos from usuario group by generoMusical;`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarDadosQuiz(idAquario, limite_linhas) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `SELECT round(AVG(porcentagem_acerto)) AS media_porcentagem_acerto
        FROM (
            SELECT (q.pontuacao / 10) * 100 AS porcentagem_acerto
            FROM usuario u
            JOIN quiz q ON q.fkUsuario = u.idUsuario
        ) AS subquery;`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `SELECT round(AVG(porcentagem_acerto)) AS media_porcentagem_acerto
        FROM (
            SELECT (q.pontuacao / 10) * 100 AS porcentagem_acerto
            FROM usuario u
            JOIN quiz q ON q.fkUsuario = u.idUsuario
        ) AS subquery;`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idAquario) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select generoMusical, count(generoMusical) as qtdVotos from usuario group by generoMusical;`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select generoMusical, count(generoMusical) as qtdVotos from usuario group by generoMusical;`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal2(idAquario) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select generoMusical, count(generoMusical) as qtdVotos from usuario group by generoMusical;`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select generoMusical, count(generoMusical) as qtdVotos from usuario group by generoMusical;`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    buscarMedidasEmTempoReal2,
    buscarDadosQuiz
}
