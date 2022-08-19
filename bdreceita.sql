-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20-Jun-2022 às 21:35
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdreceita`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbingrediente`
--

CREATE TABLE `tbingrediente` (
  `idIngrediente` int(11) NOT NULL,
  `nomeIngrediente` varchar(50) DEFAULT NULL,
  `qtdIngredientes` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbingrediente`
--

INSERT INTO `tbingrediente` (`idIngrediente`, `nomeIngrediente`, `qtdIngredientes`) VALUES
(1, 'hamburguer', 1),
(2, 'queijo', 2),
(3, 'alface', 1),
(4, 'tomate', 2),
(5, 'pão', 2),
(6, 'Bacon', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbpreparo`
--

CREATE TABLE `tbpreparo` (
  `idPreparo` int(11) NOT NULL,
  `idIngrediente` int(11) DEFAULT NULL,
  `idReceita` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbreceita`
--

CREATE TABLE `tbreceita` (
  `idReceita` int(11) NOT NULL,
  `nomeReceita` varchar(50) DEFAULT NULL,
  `tempoReceita` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbreceita`
--

INSERT INTO `tbreceita` (`idReceita`, `nomeReceita`, `tempoReceita`) VALUES
(2, 'X-Burguer', '00:00:00'),
(3, 'X-Bacon', '00:00:00'),
(5, 'Bolo de Morango', '20:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbuser`
--

CREATE TABLE `tbuser` (
  `idUser` int(11) NOT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `userPass` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tbuser`
--

INSERT INTO `tbuser` (`idUser`, `userName`, `userPass`) VALUES
(1, 'Khalwam', 'kauan123'),
(2, 'Davi', 'davi123');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbingrediente`
--
ALTER TABLE `tbingrediente`
  ADD PRIMARY KEY (`idIngrediente`);

--
-- Índices para tabela `tbpreparo`
--
ALTER TABLE `tbpreparo`
  ADD PRIMARY KEY (`idPreparo`),
  ADD KEY `idReceita` (`idReceita`),
  ADD KEY `idIngrediente` (`idIngrediente`);

--
-- Índices para tabela `tbreceita`
--
ALTER TABLE `tbreceita`
  ADD PRIMARY KEY (`idReceita`);

--
-- Índices para tabela `tbuser`
--
ALTER TABLE `tbuser`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbingrediente`
--
ALTER TABLE `tbingrediente`
  MODIFY `idIngrediente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tbpreparo`
--
ALTER TABLE `tbpreparo`
  MODIFY `idPreparo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbreceita`
--
ALTER TABLE `tbreceita`
  MODIFY `idReceita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tbuser`
--
ALTER TABLE `tbuser`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tbpreparo`
--
ALTER TABLE `tbpreparo`
  ADD CONSTRAINT `tbpreparo_ibfk_1` FOREIGN KEY (`idReceita`) REFERENCES `tbreceita` (`idReceita`),
  ADD CONSTRAINT `tbpreparo_ibfk_2` FOREIGN KEY (`idIngrediente`) REFERENCES `tbingrediente` (`idIngrediente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
