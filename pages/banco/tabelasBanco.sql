-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql111.epizy.com
-- Tempo de geração: 08/05/2023 às 20:55
-- Versão do servidor: 10.4.17-MariaDB
-- Versão do PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `epiz_33710508_trabppi`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `anunciante`
--

CREATE TABLE `anunciante` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `cpf` char(14) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `senhahash` varchar(255) DEFAULT NULL,
  `telefone` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `anuncio`
--

CREATE TABLE `anuncio` (
  `codigo` int(11) NOT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `datahora` datetime DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `codcategoria` int(11) NOT NULL,
  `codanunciante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `enderecosAjax`
--

CREATE TABLE `enderecosAjax` (
  `cep` varchar(8) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `foto`
--

CREATE TABLE `foto` (
  `nomearqfoto` varchar(255) DEFAULT NULL,
  `codanuncio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `interesse`
--

CREATE TABLE `interesse` (
  `codigo` int(11) NOT NULL,
  `mensagem` varchar(255) DEFAULT NULL,
  `datahora` datetime DEFAULT NULL,
  `contato` varchar(50) DEFAULT NULL,
  `codanuncio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `anunciante`
--
ALTER TABLE `anunciante`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `anuncio`
--
ALTER TABLE `anuncio`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codcategoria` (`codcategoria`),
  ADD KEY `codanunciante` (`codanunciante`);

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `enderecosAjax`
--
ALTER TABLE `enderecosAjax`
  ADD UNIQUE KEY `cep` (`cep`);

--
-- Índices de tabela `foto`
--
ALTER TABLE `foto`
  ADD KEY `codanuncio` (`codanuncio`);

--
-- Índices de tabela `interesse`
--
ALTER TABLE `interesse`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codanuncio` (`codanuncio`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `anunciante`
--
ALTER TABLE `anunciante`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `anuncio`
--
ALTER TABLE `anuncio`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `interesse`
--
ALTER TABLE `interesse`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `anuncio`
--
ALTER TABLE `anuncio`
  ADD CONSTRAINT `anuncio_ibfk_1` FOREIGN KEY (`codcategoria`) REFERENCES `categoria` (`codigo`) ON DELETE CASCADE,
  ADD CONSTRAINT `anuncio_ibfk_2` FOREIGN KEY (`codanunciante`) REFERENCES `anunciante` (`codigo`) ON DELETE CASCADE;

--
-- Restrições para tabelas `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `foto_ibfk_1` FOREIGN KEY (`codanuncio`) REFERENCES `anuncio` (`codigo`) ON DELETE CASCADE;

--
-- Restrições para tabelas `interesse`
--
ALTER TABLE `interesse`
  ADD CONSTRAINT `interesse_ibfk_1` FOREIGN KEY (`codanuncio`) REFERENCES `anuncio` (`codigo`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
