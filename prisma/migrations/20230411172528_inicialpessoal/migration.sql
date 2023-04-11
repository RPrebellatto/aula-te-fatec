-- CreateTable
CREATE TABLE "podutos" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(100) NOT NULL,
    "preco" DECIMAL(12,2) NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "categoriaId" INTEGER NOT NULL,

    CONSTRAINT "podutos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "fornecedors" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(100) NOT NULL,
    "cnpj" DECIMAL(65,30) NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "fornecedors_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "categorias" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(50) NOT NULL,

    CONSTRAINT "categorias_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "usuarios" (
    "id" SERIAL NOT NULL,
    "email" VARCHAR(100) NOT NULL,
    "senha" VARCHAR(50) NOT NULL,

    CONSTRAINT "usuarios_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_FornecedorToProduto" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "fornecedors_cnpj_key" ON "fornecedors"("cnpj");

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_email_key" ON "usuarios"("email");

-- CreateIndex
CREATE UNIQUE INDEX "_FornecedorToProduto_AB_unique" ON "_FornecedorToProduto"("A", "B");

-- CreateIndex
CREATE INDEX "_FornecedorToProduto_B_index" ON "_FornecedorToProduto"("B");

-- AddForeignKey
ALTER TABLE "podutos" ADD CONSTRAINT "podutos_categoriaId_fkey" FOREIGN KEY ("categoriaId") REFERENCES "categorias"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FornecedorToProduto" ADD CONSTRAINT "_FornecedorToProduto_A_fkey" FOREIGN KEY ("A") REFERENCES "fornecedors"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FornecedorToProduto" ADD CONSTRAINT "_FornecedorToProduto_B_fkey" FOREIGN KEY ("B") REFERENCES "podutos"("id") ON DELETE CASCADE ON UPDATE CASCADE;
