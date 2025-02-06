Return-Path: <linux-media+bounces-25717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 711DAA2AEA9
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 18:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DF55165DF8
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 17:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C653D1632E6;
	Thu,  6 Feb 2025 17:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bMRNtHrT"
X-Original-To: linux-media@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3324B239588;
	Thu,  6 Feb 2025 17:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738862241; cv=none; b=uOCmyPWAegaSf72tO7jki4cJQ0x4RNaDIIxiPuLNqwmU170JFRSQKf/cbOHWgAmXcgHgmj8N+gNiICGfvOTkbqz+zXTzUbgBoEAzC8CEoNnFoq6baYmzcHLpXxaXxA9s47EM73awW3V+yAzFoTwX0YLHbWDXijukkdyUd/wSzVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738862241; c=relaxed/simple;
	bh=zlo4C9Tvhxf4/57WA1N4h+WA5+QJ2Xjr/e4qgnsfxJ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GRUUBpP0bs4ekYXy6XgyC4+3QUf1QQp95brZrSD2wjCvKcumFUMLcocURZV/w428y6VNq1IltAgexjAicXZRBriXF9ua6OZBpF93Ld8w4YnubhQ0QVxlmPdJrz2Mz3PR94TGQYQDe5upDz8AeJ7dasANuIRty/fXAa+JsAoLnjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bMRNtHrT; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE1984434D;
	Thu,  6 Feb 2025 17:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738862236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yPqgb82RV5Eh4di0p99++tt4PTXyauGdKJYgPKVgVkw=;
	b=bMRNtHrTdtXyip9IgAG/87kFux8hrvKvIyVVkK4rTjddnJCgjV7/VvqodbfSOmbeFgDN7r
	gOR4J9InWsRbIAibyYjrCTbWpH02z8hR6/0O/7aGeg2C7oBd1vrVVGAMJxKdUj6IuEB9m1
	kO5ZmvQzDG3y1/yw4Au0LnpvzqYIkPqtn89hLSfh0rmujsPEDHF+vp5ufVvC+11qmUfNvE
	BIRBcjZb/UyXd2GlBfiajECikuzA58XBzf1kg7jiJm4dqYMBgEtwnIZcbGhjPK8+rOuCOf
	wn8ZG3a7iRFdJba2ws9HyH6GEE9sRc8e1RJLRLn/TPPQbrlrgZ5vSLlGpQx9ug==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  keguang.zhang@gmail.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-media@vger.kernel.org
Subject: Re: [PATCH v12 2/2] mtd: rawnand: Add Loongson-1 NAND Controller
 Driver
In-Reply-To: <20250121-loongson1-nand-v12-2-53507999de39@gmail.com> (Keguang
	Zhang via's message of "Tue, 21 Jan 2025 18:27:34 +0800")
References: <20250121-loongson1-nand-v12-0-53507999de39@gmail.com>
	<20250121-loongson1-nand-v12-2-53507999de39@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 06 Feb 2025 18:17:15 +0100
Message-ID: <87tt972dt0.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohepuggvvhhnuhhllhdokhgvghhurghnghdriihhrghnghdrghhmrghilhdrtghomheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 heptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghguhgrnhhgrdiihhgrnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com

Hello,

> +static inline int ls1x_nand_check_op(struct nand_chip *chip, const
>  struct nand_operation *op)

No inline function in a c file.

> +{
> +	struct ls1x_nand_host *host =3D nand_get_controller_data(chip);
> +	const struct nand_op_instr *instr1 =3D NULL, *instr2 =3D NULL;
> +	int op_id;
> +
> +	for (op_id =3D 0; op_id < op->ninstrs; op_id++) {
> +		const struct nand_op_instr *instr =3D &op->instrs[op_id];
> +
> +		if (instr->type =3D=3D NAND_OP_CMD_INSTR) {
> +			if (!instr1)
> +				instr1 =3D instr;
> +			else if (!instr2)
> +				instr2 =3D instr;
> +			else
> +				break;
> +		}
> +	}
> +
> +	if (!instr1 || !instr2)
> +		return 0;

Is this expected?

> +
> +	if (instr1->ctx.cmd.opcode =3D=3D NAND_CMD_RNDOUT &&
> +	    instr2->ctx.cmd.opcode =3D=3D NAND_CMD_RNDOUTSTART)
> +		return 0;
> +
> +	if (instr1->ctx.cmd.opcode =3D=3D NAND_CMD_READ0 &&
> +	    instr2->ctx.cmd.opcode =3D=3D NAND_CMD_READSTART)
> +		return 0;
> +
> +	if (instr1->ctx.cmd.opcode =3D=3D NAND_CMD_ERASE1 &&
> +	    instr2->ctx.cmd.opcode =3D=3D NAND_CMD_ERASE2)
> +		return 0;
> +
> +	if (instr1->ctx.cmd.opcode =3D=3D NAND_CMD_SEQIN &&
> +	    instr2->ctx.cmd.opcode =3D=3D NAND_CMD_PAGEPROG)
> +		return 0;
> +
> +	dev_err(host->dev, "unsupported opcode sequence: %x %x",
> +		instr1->ctx.cmd.opcode, instr2->ctx.cmd.opcode);
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int ls1x_nand_exec_op(struct nand_chip *chip,
> +			     const struct nand_operation *op,
> +			     bool check_only)
> +{
> +	int ret;
> +

        if (check_only) ?

> +	ret =3D ls1x_nand_check_op(chip, op);
> +	if (ret)
> +		return ret;
> +
> +	return nand_op_parser_exec_op(chip, &ls1x_nand_op_parser, op, check_onl=
y);
> +}
> +
> +static const char * const nand_ecc_algos[] =3D {
> +	[NAND_ECC_ALGO_UNKNOWN] =3D "none",
> +	[NAND_ECC_ALGO_HAMMING] =3D "hamming",
> +	[NAND_ECC_ALGO_BCH] =3D "bch",
> +};

No way you need this in your driver :-)

Thanks,
Miqu=C3=A8l

