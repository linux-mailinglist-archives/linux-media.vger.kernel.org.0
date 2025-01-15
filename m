Return-Path: <linux-media+bounces-24809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F36E7A12B3C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 19:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EA5818873F7
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 18:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020D51D8A12;
	Wed, 15 Jan 2025 18:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V/ngaiic"
X-Original-To: linux-media@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D291D63F0;
	Wed, 15 Jan 2025 18:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736967270; cv=none; b=POkXhtaU5mqqcwew4XD64MiO8oQvv3y6KlyfmPzalG8NMPlFJUcvbsnkfoMKo7XAieVT4CrKksWJjZr/T6pYgEvulLWvY8kBazUifpBK061+1vlRuIM+LUZFH5Czr0fR/WePB3FNdSs1vP99xxr3AzrY6VU+C5iFZrZw4zqcCqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736967270; c=relaxed/simple;
	bh=UJgeODit0oPssfFa0cNX9lgrX4CDsdNt6vZPj6n+DkU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ELNqK8NaAUWVZ+2ekKLKS5tbRsLTx/s3EXAlHIqdzT7OwKj6hbU9sYeXYA8Fsjo/PS7wDux0Z8Oz3g7ZMe/h42gjGpzl+pAKuz8Te3qZNLMwePRDaMbyh9TmMfoZ5BB4dytvnk/EYaf0VV3yaX+/ZGeNp8he1C3Frvd0M0M+G2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V/ngaiic; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9F9D20004;
	Wed, 15 Jan 2025 18:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736967265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dQkA5beGm5rsGRni+AoHBlCFbxyYjwSxIyvpG2TQuog=;
	b=V/ngaiicgfFZCGHnAqnLEXmWdN0P32WNBk75Bx/XwZZ+DyMEP1pA6qGxXtkg324qsNXOF3
	mPTpLSjYV/O0qRf4bodeTklG4P/QPw2RBG1ZnTjQfvo1o7JDqnX42RfS3XF1utjjELq04L
	FViT5xu7ttWp17foLc243O1EPVV2mmC+Ps9MNd7O+TKxyfO/LPbD/rwI/D8EnYa9D7TtTs
	piqh6avkFJyD9/EEssFKtOMUI/vrP1EWlCmPhCcGPH8fgOPcpDUe31ZtqTD/qhq2CxCFbV
	MY95jrYgJunQwQnFVBvGi+Xs8yHjrPdr4GMt2KwLQ+wra/KRrTo5k/cVYgVSgg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  keguang.zhang@gmail.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-media@vger.kernel.org
Subject: Re: [PATCH v11 2/2] mtd: rawnand: Add Loongson-1 NAND Controller
 Driver
In-Reply-To: <20241217-loongson1-nand-v11-2-b692c58988bb@gmail.com> (Keguang
	Zhang via's message of "Tue, 17 Dec 2024 18:16:50 +0800")
References: <20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com>
	<20241217-loongson1-nand-v11-2-b692c58988bb@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 15 Jan 2025 19:54:23 +0100
Message-ID: <87v7ufnc0w.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Keguang,

On 17/12/2024 at 18:16:50 +08, Keguang Zhang via B4 Relay <devnull+keguang.=
zhang.gmail.com@kernel.org> wrote:

> +static int ls1x_nand_op_cmd_mapping(struct nand_chip *chip, struct ls1x_=
nand_op *op, u8 opcode)
> +{
> +	struct ls1x_nand_host *host =3D nand_get_controller_data(chip);
> +	int ret =3D 0;

This return code is unused.

> +
> +	op->row_start =3D chip->page_shift + 1;
> +
> +	/* The controller abstracts the following NAND operations. */
> +	switch (opcode) {
> +	case NAND_CMD_STATUS:
> +		op->cmd_reg =3D LS1X_NAND_CMD_STATUS;
> +		break;
> +	case NAND_CMD_RESET:
> +		op->cmd_reg =3D LS1X_NAND_CMD_RESET;
> +		break;
> +	case NAND_CMD_READID:
> +		op->is_readid =3D true;
> +		op->cmd_reg =3D LS1X_NAND_CMD_READID;
> +		break;
> +	case NAND_CMD_ERASE1:
> +		op->is_erase =3D true;
> +		op->addrs_offset =3D 2;
> +		break;
> +	case NAND_CMD_ERASE2:
> +		if (!op->is_erase)
> +			return -EOPNOTSUPP;
> +		/* During erasing, row_start differs from the default value. */

...

> +static void ls1x_nand_trigger_op(struct ls1x_nand_host *host, struct ls1=
x_nand_op *op)
> +{
> +	struct nand_chip *chip =3D &host->chip;
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	int col0 =3D op->addrs[0];
> +	short col;
> +
> +	/* restore row address for column change */
> +	if (op->is_change_column) {
> +		op->addr2_reg =3D readl(host->reg_base + LS1X_NAND_ADDR2);
> +		op->addr1_reg =3D readl(host->reg_base + LS1X_NAND_ADDR1);
> +		op->addr1_reg &=3D ~(mtd->writesize - 1);
> +	}

This looks very suspicious. You should not have to do that and to be
honest, I don't undertand what this means.

> +
> +	if (!IS_ALIGNED(col0, chip->buf_align)) {
> +		col0 =3D ALIGN_DOWN(op->addrs[0], chip->buf_align);
> +		op->aligned_offset =3D op->addrs[0] - col0;
> +		op->addrs[0] =3D col0;
> +	}
> +
> +	if (host->data->parse_address)
> +		host->data->parse_address(op);
> +
> +	/* set address */
> +	writel(op->addr1_reg, host->reg_base + LS1X_NAND_ADDR1);
> +	writel(op->addr2_reg, host->reg_base + LS1X_NAND_ADDR2);
> +
> +	/* set operation length */
> +	if (op->is_write || op->is_read || op->is_change_column)
> +		op->len =3D ALIGN(op->orig_len + op->aligned_offset, chip->buf_align);
> +	else if (op->is_erase)
> +		op->len =3D 1;
> +	else
> +		op->len =3D op->orig_len;
> +
> +	writel(op->len, host->reg_base + LS1X_NAND_OP_NUM);
> +
> +	/* set operation area */
> +	col =3D op->addrs[1] << BITS_PER_BYTE | op->addrs[0];
> +	if (op->orig_len && !op->is_readid) {
> +		if (col < mtd->writesize)
> +			op->cmd_reg |=3D LS1X_NAND_CMD_OP_MAIN;
> +
> +		op->cmd_reg |=3D LS1X_NAND_CMD_OP_SPARE;
> +	}
> +
> +	/* set operation scope */
> +	if (host->data->op_scope_field) {
> +		unsigned int op_scope;
> +
> +		switch (op->cmd_reg & LS1X_NAND_CMD_OP_AREA_MASK) {
> +		case LS1X_NAND_CMD_OP_MAIN:
> +			op_scope =3D mtd->writesize;
> +			break;
> +		case LS1X_NAND_CMD_OP_SPARE:
> +			op_scope =3D mtd->oobsize;
> +			break;
> +		case LS1X_NAND_CMD_OP_AREA_MASK:
> +			op_scope =3D mtd->writesize + mtd->oobsize;
> +			break;
> +		default:
> +			op_scope =3D 0;
> +			break;
> +		}

Please get rid of this extra step. I'm not a big fan of it, but this can
be very well simplified and this whole switch removed.

> +
> +		op_scope <<=3D __ffs(host->data->op_scope_field);
> +		regmap_update_bits(host->regmap, LS1X_NAND_PARAM,
> +				   host->data->op_scope_field, op_scope);
> +	}
> +
> +	/* set command */
> +	writel(op->cmd_reg, host->reg_base + LS1X_NAND_CMD);
> +
> +	/* trigger operation */
> +	regmap_write_bits(host->regmap, LS1X_NAND_CMD, LS1X_NAND_CMD_VALID, LS1=
X_NAND_CMD_VALID);
> +}
> +

...

> +static const struct nand_op_parser ls1x_nand_op_parser =3D NAND_OP_PARSE=
R(
> +	NAND_OP_PARSER_PATTERN(
> +		ls1x_nand_read_id_type_exec,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_ADDR_ELEM(false, LS1X_NAND_MAX_ADDR_CYC),
> +		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 8)),
> +	NAND_OP_PARSER_PATTERN(
> +		ls1x_nand_read_status_type_exec,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 1)),
> +	NAND_OP_PARSER_PATTERN(
> +		ls1x_nand_zerolen_type_exec,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
> +	NAND_OP_PARSER_PATTERN(
> +		ls1x_nand_zerolen_type_exec,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_ADDR_ELEM(false, LS1X_NAND_MAX_ADDR_CYC),
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
> +	NAND_OP_PARSER_PATTERN(
> +		ls1x_nand_data_type_exec,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_ADDR_ELEM(false, LS1X_NAND_MAX_ADDR_CYC),
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
> +		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 0)),
> +	NAND_OP_PARSER_PATTERN(
> +		ls1x_nand_data_type_exec,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_ADDR_ELEM(false, LS1X_NAND_MAX_ADDR_CYC),
> +		NAND_OP_PARSER_PAT_DATA_OUT_ELEM(false, 0),
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
> +	);
> +
> +static inline bool ls1x_nand_is_valid_cmd(u8 opcode)
> +{
> +	return opcode =3D=3D NAND_CMD_RESET ||
> +	       opcode =3D=3D NAND_CMD_READID ||
> +	       opcode =3D=3D NAND_CMD_ERASE1 ||
> +	       opcode =3D=3D NAND_CMD_ERASE2 ||
> +	       opcode =3D=3D NAND_CMD_STATUS ||
> +	       opcode =3D=3D NAND_CMD_SEQIN ||
> +	       opcode =3D=3D NAND_CMD_PAGEPROG ||
> +	       opcode =3D=3D NAND_CMD_RNDOUT ||
> +	       opcode =3D=3D NAND_CMD_RNDOUTSTART ||
> +	       opcode =3D=3D NAND_CMD_READ0 ||
> +	       opcode =3D=3D NAND_CMD_READSTART;
> +}
> +
> +static inline bool ls1x_nand_is_cmd_sequence(const struct nand_op_instr =
*instr1,
> +					     const struct nand_op_instr *instr2)
> +{
> +	return instr1->type =3D=3D NAND_OP_CMD_INSTR && instr2->type =3D=3D NAN=
D_OP_CMD_INSTR;
> +}
> +
> +static inline bool ls1x_nand_is_erase_sequence(const struct nand_op_inst=
r *instr1,
> +					       const struct nand_op_instr *instr2)
> +{
> +	return instr1->ctx.cmd.opcode =3D=3D NAND_CMD_ERASE1 &&
> +	       instr2->ctx.cmd.opcode =3D=3D NAND_CMD_ERASE2;
> +}
> +
> +static inline bool ls1x_nand_is_write_sequence(const struct nand_op_inst=
r *instr1,
> +					       const struct nand_op_instr *instr2)
> +{
> +	return instr1->ctx.cmd.opcode =3D=3D NAND_CMD_SEQIN &&
> +	       instr2->ctx.cmd.opcode =3D=3D NAND_CMD_PAGEPROG;
> +}
> +
> +static inline bool ls1x_nand_is_read_sequence(const struct nand_op_instr=
 *instr1,
> +					      const struct nand_op_instr *instr2)
> +{
> +	return (instr1->ctx.cmd.opcode =3D=3D NAND_CMD_READ0 &&
> +		instr2->ctx.cmd.opcode =3D=3D NAND_CMD_READSTART) ||
> +	       (instr1->ctx.cmd.opcode =3D=3D NAND_CMD_RNDOUT &&
> +		instr2->ctx.cmd.opcode =3D=3D NAND_CMD_RNDOUTSTART);
> +}
> +
> +static int ls1x_nand_check_op(struct nand_chip *chip, const struct nand_=
operation *op)
> +{
> +	const struct nand_op_instr *instr;
> +	int op_id;
> +
> +	for (op_id =3D 0; op_id < op->ninstrs; op_id++) {
> +		instr =3D &op->instrs[op_id];
> +
> +		switch (instr->type) {
> +		case NAND_OP_CMD_INSTR:
> +			if (!ls1x_nand_is_valid_cmd(instr->ctx.cmd.opcode))
> +				return -EOPNOTSUPP;
> +			break;
> +		case NAND_OP_ADDR_INSTR:
> +			if (instr->ctx.addr.naddrs > LS1X_NAND_MAX_ADDR_CYC)
> +				return -EOPNOTSUPP;
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	if (op->ninstrs =3D=3D 4 &&
> +	    ls1x_nand_is_cmd_sequence(&op->instrs[0], &op->instrs[2]) &&
> +	    !ls1x_nand_is_erase_sequence(&op->instrs[0], &op->instrs[2]))
> +		return -EOPNOTSUPP;
> +
> +	if (op->ninstrs =3D=3D 5) {
> +		if (ls1x_nand_is_cmd_sequence(&op->instrs[0], &op->instrs[2]) &&
> +		    !ls1x_nand_is_read_sequence(&op->instrs[0], &op->instrs[2]))
> +			return -EOPNOTSUPP;
> +
> +		if (ls1x_nand_is_cmd_sequence(&op->instrs[0], &op->instrs[3]) &&
> +		    !ls1x_nand_is_write_sequence(&op->instrs[0], &op->instrs[3]))
> +			return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ls1x_nand_exec_op(struct nand_chip *chip,
> +			     const struct nand_operation *op,
> +			     bool check_only)
> +{
> +	if (check_only)
> +		return ls1x_nand_check_op(chip, op);
> +

It lookse like you're re-encoding all your requirements in
ls1x_nand_check_op(), whereas nand_op_parser_exec_op(check_only :=3D true)
should give you already a certain number of verifications which are
skipped here. I'd suggest to improve this to avoid repetitions between
the two. Of course the second part of nand_check_op is necessary, but
the initial checks seem redundant and would better be performed by the pars=
er.

> +	return nand_op_parser_exec_op(chip, &ls1x_nand_op_parser, op, check_onl=
y);
> +}
> +
> +static int ls1x_nand_attach_chip(struct nand_chip *chip)
> +{

...

> +static int ls1x_nand_controller_init(struct ls1x_nand_host *host)
> +{
> +	struct device *dev =3D host->dev;
> +	struct dma_chan *chan;
> +	struct dma_slave_config cfg =3D {};
> +	int ret;
> +
> +	host->regmap =3D devm_regmap_init_mmio(dev, host->reg_base, &ls1x_nand_=
regmap_config);
> +	if (IS_ERR(host->regmap))
> +		return dev_err_probe(dev, PTR_ERR(host->regmap), "failed to init regma=
p\n");
> +
> +	chan =3D dma_request_chan(dev, "rxtx");
> +	if (IS_ERR(chan))
> +		return dev_err_probe(dev, PTR_ERR(chan), "failed to request DMA channe=
l\n");
> +	host->dma_chan =3D chan;
> +
> +	cfg.src_addr =3D host->dma_base;
> +	cfg.src_addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> +	cfg.dst_addr =3D host->dma_base;

Don't you need a dma_addr_t here instead? You shall remap the resource.

> +	cfg.dst_addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> +	ret =3D dmaengine_slave_config(host->dma_chan, &cfg);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to config DMA channel\n");
> +
> +	init_completion(&host->dma_complete);
> +
> +	dev_dbg(dev, "got %s for %s access\n", dma_chan_name(host->dma_chan), d=
ev_name(dev));
> +
> +	return 0;
> +}
> +
> +static int ls1x_nand_chip_init(struct ls1x_nand_host *host)
> +{
> +	struct device *dev =3D host->dev;
> +	int nchips =3D of_get_child_count(dev->of_node);
> +	struct device_node *chip_np;
> +	struct nand_chip *chip =3D &host->chip;
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	int ret =3D 0;
> +
> +	if (nchips !=3D 1)
> +		return dev_err_probe(dev, -EINVAL, "Currently one NAND chip supported\=
n");
> +
> +	chip_np =3D of_get_next_child(dev->of_node, NULL);
> +	if (!chip_np)
> +		return dev_err_probe(dev, -ENODEV, "failed to get child node for NAND =
chip\n");
> +
> +	chip->controller =3D &host->controller;
> +	chip->options =3D NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA | NAND_BROKEN_X=
D;
> +	chip->buf_align =3D 16;
> +	nand_set_controller_data(chip, host);
> +	nand_set_flash_node(chip, chip_np);
> +
> +	mtd->dev.parent =3D dev;
> +	mtd->name =3D "ls1x-nand";

No, the name is gonna be filled automatically when you call
nand_set_flash_node IIRC.

> +	mtd->owner =3D THIS_MODULE;
> +
> +	ret =3D nand_scan(chip, 1);
> +	if (ret) {
> +		of_node_put(chip_np);
> +		return ret;
> +	}
> +

It looks like your controller does not support any ECC correction, if
that's the case you must make sure it's properly handled in attach_chip
hook by refusing to probe if the on_host engine is used.

Thanks,
Miqu=C3=A8l

