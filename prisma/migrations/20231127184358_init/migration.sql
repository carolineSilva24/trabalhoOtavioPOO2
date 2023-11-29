-- CreateTable
CREATE TABLE "Aluno" (
    "matricula" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "grupoId" TEXT NOT NULL,
    "lider" BOOLEAN,
    CONSTRAINT "Aluno_grupoId_fkey" FOREIGN KEY ("grupoId") REFERENCES "Grupo" ("idGrupo") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Grupo" (
    "idGrupo" TEXT NOT NULL PRIMARY KEY,
    "projetoId" TEXT NOT NULL,
    CONSTRAINT "Grupo_projetoId_fkey" FOREIGN KEY ("projetoId") REFERENCES "Projeto" ("idProjeto") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Projeto" (
    "idProjeto" TEXT NOT NULL PRIMARY KEY,
    "data" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "nome" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Avaliacao" (
    "idAvaliacao" TEXT NOT NULL PRIMARY KEY,
    "professorId" TEXT,
    "alunoId" TEXT,
    "notaFinal" REAL NOT NULL,
    "maturidade" REAL NOT NULL,
    "inovacao" REAL NOT NULL,
    "apresentacao" REAL NOT NULL,
    "atratividade" REAL NOT NULL,
    CONSTRAINT "Avaliacao_professorId_fkey" FOREIGN KEY ("professorId") REFERENCES "Professor" ("idProfessor") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Avaliacao_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "Aluno" ("matricula") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Professor" (
    "idProfessor" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Grupo_projetoId_key" ON "Grupo"("projetoId");
