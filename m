Return-Path: <linux-media+bounces-19163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 330B1993046
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 17:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F3A6B23E62
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 15:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67641DFF7;
	Mon,  7 Oct 2024 15:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HWfgBKTQ"
X-Original-To: linux-media@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080D61D7E47;
	Mon,  7 Oct 2024 15:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728313209; cv=none; b=Ul5EeMZt26n3lKX8uzHMeA2C8lKZKaMcp4qy5883tYwbzUsPAzRGJshAKLwEcBU2w9FareCQyCDJ2YrupNfgQjQiQKVG/B85RktmaT0efCaaIlr9obci0ixpQHCf1Z+6p6izrBX/bq3kzLKdYEi+bGOiGbPxAsd3jKF07VyXEHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728313209; c=relaxed/simple;
	bh=Dx9PLmuVECAcNhvxGlpAl5AXTv6lgKJyJFqsJJOcgZo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C1/LBsA2e6V+/BJYuZw1HUWUpKUV1aStzWgLy+6xXjD34N2jkaC3uFSfAJVytTyUbSOkWoQ7p2aaVZ3/spa/gbHr1yT7RLMIfJ9jP65HAkCpFEzY+ijVnAF5Y5QeDFbrBd1jjQha+NiO+JXwDrPT/x9TzAq4aVTRw6Ru/ncbmfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HWfgBKTQ; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3633CC0008;
	Mon,  7 Oct 2024 15:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728313204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1u+t30S4U0QrUxj08WB3PEspD5MBQ2xVAOijbNiE6NE=;
	b=HWfgBKTQEOfaJ2O9LZ2wSRIJD5fsYPNZmAaycK2BSUosek/xjzHgvHJbih/+RVXy7c8y+c
	YpUT4/GEqJ6hkZxNORUIVIGzRLa4Q2SdI9PTCYTHyQQUhHe6ol9IRAXc2b0miH7nDlVDS3
	dOM38nsQWJy+u76pXT+9kDBrwRoQOau44CJueOf1mwk4vCJexo0ggWvjvjY5sM07ox0qzO
	TG0thbMrhCVJ99aDBKDuSVw6L8sNsp1brmqwTKKrUsUgMfeujY2EzmRTccFyyDS7A5idxK
	mgCjy8q94tzHh313zqK1McvL4fiFzGqEcIdyIE2HVy1xQ//BY5MoiQ4g7VVryA==
Date: Mon, 7 Oct 2024 17:00:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Cc: keguang.zhang@gmail.com, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v10 2/2] mtd: rawnand: Add Loongson-1 NAND Controller
 Driver
Message-ID: <20241007170002.71f3a029@xps-13>
In-Reply-To: <20241002-loongson1-nand-v10-2-17162eff80e2@gmail.com>
References: <20241002-loongson1-nand-v10-0-17162eff80e2@gmail.com>
	<20241002-loongson1-nand-v10-2-17162eff80e2@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Keguang,

devnull+keguang.zhang.gmail.com@kernel.org wrote on Wed, 02 Oct 2024
16:10:46 +0800:

> From: Keguang Zhang <keguang.zhang@gmail.com>
>=20
> Add NAND controller driver for Loongson-1 SoCs.
>=20
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
> Changes in v10:
> - Fix the build error reported by kernel test robot.
>   Link: https://lore.kernel.org/oe-kbuild-all/202409220010.vctkHddZ-lkp@i=
ntel.com
>=20
> Changes in v9:
> - Change the compatible to 'loongson,ls1*-nand-controller'.
> - Update MAINTAINERS file accordingly.
> - Rebasing due to recent upstream changes.
>=20
> Changes in v8:
> - Drop NAND_MONOLITHIC_READ and add support for real subpage read instead.
> - Simplify the logic of ls1b_nand_parse_address() and ls1c_nand_parse_add=
ress().
> - Split ls1x_nand_set_controller() into ls1x_nand_parse_instructions()
>   and ls1x_nand_trigger_op().
> - Implement ls1x_nand_op_cmd_mapping() to convert the opcodes instead of =
forcing them.
> - Add ls1x_nand_check_op().
> - Remove struct ls1x_nand after moving its members to struct ls1x_nfc.
> - Add the prefix 'LS1X_' for all registers and their bits.
> - Drop the macros: nand_readl() and nand_writel().
> - Some minor fixes and improvements.
>=20
> Changes in v7:
> - Rename the Kconfig dependency to LOONGSON1_APB_DMA
>=20
> Changes in v6:
> - Amend Kconfig
> - Add DT support
> - Use DT data instead of platform data
> - Remove MAX_ID_SIZE
> - Remove case NAND_OP_CMD_INSTR in ls1x_nand_set_controller()
> - Move ECC configuration to ls1x_nand_attach_chip()
> - Rename variable "nand" to "ls1x"
> - Rename variable "nc" to "nfc"
> - Some minor fixes
> - Link to v5: https://lore.kernel.org/all/20210520224213.7907-1-keguang.z=
hang@gmail.com
>=20
> Changes in v5:
> - Update the driver to fit the raw NAND framework.
> - Implement exec_op() instead of legacy cmdfunc().
> - Use dma_request_chan() instead of dma_request_channel().
> - Some minor fixes and cleanups.
>=20
> Changes in v4:
> - Retrieve the controller from nand_hw_control.
>=20
> Changes in v3:
> - Replace __raw_readl/__raw_writel with readl/writel.
> - Split ls1x_nand into two structures:
> ls1x_nand_chip and ls1x_nand_controller.
>=20
> Changes in v2:
> - Modify the dependency in Kconfig due to the changes of DMA module.
> ---
>  MAINTAINERS                           |   1 +
>  drivers/mtd/nand/raw/Kconfig          |   7 +
>  drivers/mtd/nand/raw/Makefile         |   1 +
>  drivers/mtd/nand/raw/loongson1_nand.c | 825 ++++++++++++++++++++++++++++=
++++++
>  4 files changed, 834 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 94cb3186865f..10f5d329c625 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15595,6 +15595,7 @@ F:	Documentation/devicetree/bindings/*/loongson,l=
s1*.yaml
>  F:	arch/mips/include/asm/mach-loongson32/
>  F:	arch/mips/loongson32/
>  F:	drivers/*/*loongson1*
> +F:	drivers/mtd/nand/raw/loongson1_nand.c
>  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> =20
>  MIPS/LOONGSON2EF ARCHITECTURE
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index d0aaccf72d78..54ad16a6a64e 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -454,6 +454,13 @@ config MTD_NAND_TS72XX
>  	help
>  	  Enables support for NAND controller on ts72xx SBCs.
> =20
> +config MTD_NAND_LOONGSON1
> +	tristate "Loongson1 NAND controller"
> +	depends on LOONGSON1_APB_DMA || COMPILE_TEST
> +	select REGMAP_MMIO
> +	help
> +	  Enables support for NAND controller on Loongson1 SoCs.
> +
>  comment "Misc"
> =20
>  config MTD_SM_COMMON
> diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
> index d0b0e6b83568..9ec0c38b4ee7 100644
> --- a/drivers/mtd/nand/raw/Makefile
> +++ b/drivers/mtd/nand/raw/Makefile
> @@ -58,6 +58,7 @@ obj-$(CONFIG_MTD_NAND_INTEL_LGM)	+=3D intel-nand-contro=
ller.o
>  obj-$(CONFIG_MTD_NAND_ROCKCHIP)		+=3D rockchip-nand-controller.o
>  obj-$(CONFIG_MTD_NAND_PL35X)		+=3D pl35x-nand-controller.o
>  obj-$(CONFIG_MTD_NAND_RENESAS)		+=3D renesas-nand-controller.o
> +obj-$(CONFIG_MTD_NAND_LOONGSON1)	+=3D loongson1_nand.o

					loongson1-nand-controller.o ?

> =20
>  nand-objs :=3D nand_base.o nand_legacy.o nand_bbt.o nand_timings.o nand_=
ids.o
>  nand-objs +=3D nand_onfi.o
> diff --git a/drivers/mtd/nand/raw/loongson1_nand.c b/drivers/mtd/nand/raw=
/loongson1_nand.c
> new file mode 100644
> index 000000000000..89e8a048b1a5
> --- /dev/null
> +++ b/drivers/mtd/nand/raw/loongson1_nand.c
> @@ -0,0 +1,825 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * NAND Controller Driver for Loongson-1 SoC
> + *
> + * Copyright (C) 2015-2024 Keguang Zhang <keguang.zhang@gmail.com>
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/iopoll.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/rawnand.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/sizes.h>
> +
> +/* Loongson-1 NAND Controller Registers */
> +#define LS1X_NAND_CMD		0x0
> +#define LS1X_NAND_ADDR1		0x4
> +#define LS1X_NAND_ADDR2		0x8
> +#define LS1X_NAND_TIMING	0xc
> +#define LS1X_NAND_IDL		0x10
> +#define LS1X_NAND_IDH_STATUS	0x14
> +#define LS1X_NAND_PARAM		0x18
> +#define LS1X_NAND_OP_NUM	0x1c
> +
> +/* NAND Command Register Bits */
> +#define LS1X_NAND_CMD_OP_DONE		BIT(10)
> +#define LS1X_NAND_CMD_OP_SPARE		BIT(9)
> +#define LS1X_NAND_CMD_OP_MAIN		BIT(8)
> +#define LS1X_NAND_CMD_STATUS		BIT(7)
> +#define LS1X_NAND_CMD_RESET		BIT(6)
> +#define LS1X_NAND_CMD_READID		BIT(5)
> +#define LS1X_NAND_CMD_BLOCKS_ERASE	BIT(4)
> +#define LS1X_NAND_CMD_ERASE		BIT(3)
> +#define LS1X_NAND_CMD_WRITE		BIT(2)
> +#define LS1X_NAND_CMD_READ		BIT(1)
> +#define LS1X_NAND_CMD_VALID		BIT(0)
> +
> +#define LS1X_NAND_CMD_OP_AREA_MASK	GENMASK(9, 8)
> +#define LS1X_NAND_WAIT_CYCLE_MASK	GENMASK(7, 0)
> +#define LS1X_NAND_HOLD_CYCLE_MASK	GENMASK(15, 8)
> +#define LS1X_NAND_CELL_SIZE_MASK	GENMASK(11, 8)
> +
> +#define LS1X_NAND_MAX_ADDR_CYC		5U
> +#define LS1X_NAND_DMA_ADDR		0x1fe78040

Please, never hardcode register physical values in a driver like that
:-)

This is a resource you should get from DT. Furthermore, when using it
as DMA address you should first call dma_map_resource() on it.

> +
> +#define BITS_PER_WORD		(4 * BITS_PER_BYTE)
> +
> +struct ls1x_nfc_op {
> +	char addrs[LS1X_NAND_MAX_ADDR_CYC];
> +	unsigned int naddrs;
> +	unsigned int addrs_offset;
> +	unsigned int addr1_reg;
> +	unsigned int addr2_reg;
> +	unsigned int aligned_offset;
> +	unsigned int row_shift;
> +	unsigned int cmd_reg;
> +	unsigned int rdy_timeout_ms;
> +	unsigned int len;
> +	size_t dma_len;
> +	bool restore_row;
> +	bool is_write;
> +	char *buf;
> +};
> +
> +struct ls1x_nfc_data {
> +	unsigned int status_field;
> +	unsigned int op_scope_field;
> +	unsigned int hold_cycle;
> +	unsigned int wait_cycle;
> +	void (*parse_address)(struct ls1x_nfc_op *op);
> +};
> +
> +struct ls1x_nfc {
> +	struct device *dev;
> +	struct nand_chip chip;
> +	struct nand_controller controller;
> +	const struct ls1x_nfc_data *data;
> +	void __iomem *reg_base;
> +	struct regmap *regmap;
> +	/* DMA Engine stuff */
> +	struct dma_chan *dma_chan;
> +	dma_cookie_t dma_cookie;
> +	struct completion dma_complete;
> +};
> +
> +static const struct regmap_config ls1x_nand_regmap_config =3D {
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +};
> +
> +static int ls1x_nand_op_cmd_mapping(struct nand_chip *chip,
> +				    struct ls1x_nfc_op *op, u8 opcode)
> +{
> +	struct ls1x_nfc *nfc =3D nand_get_controller_data(chip);
> +	int ret =3D 0;
> +
> +	op->row_shift =3D chip->page_shift + 1;

Looks like you're hardcoding the third row for large nands?
What about using chip->options & NAND_ROW_ADDR_3 instead?

> +
> +	/* The controller abstracts the following NAND operations. */
> +	switch (opcode) {
> +	case NAND_CMD_RESET:
> +		op->cmd_reg =3D LS1X_NAND_CMD_RESET;
> +		break;
> +	case NAND_CMD_READID:
> +		op->cmd_reg =3D LS1X_NAND_CMD_READID;
> +		break;
> +	case NAND_CMD_ERASE1:
> +	case NAND_CMD_ERASE2:
> +		op->cmd_reg =3D LS1X_NAND_CMD_ERASE;
> +		op->addrs_offset =3D 2;
> +		op->row_shift =3D chip->page_shift;
> +		break;
> +	case NAND_CMD_STATUS:
> +		op->cmd_reg =3D LS1X_NAND_CMD_STATUS;
> +		break;
> +	case NAND_CMD_SEQIN:
> +	case NAND_CMD_PAGEPROG:

This is typically something that scares me. Mapping two distinct
commands to a single register value. How can this be valid? You should
never guess what the core wants to do. You have all the operation, so
if you want to map two commands to a single register value, then please
check what you do is valid and do not iterate blindly across commands
like that. Otherwise please error out if that's unsupported.

Please carefully try to describe all possible cases and error what when
they are not supported.

Also, based on this feedback, your check_op() function might need a
little bit of polishing.

> +		op->cmd_reg =3D LS1X_NAND_CMD_WRITE;
> +		op->is_write =3D true;
> +		break;
> +	case NAND_CMD_RNDOUT:
> +	case NAND_CMD_RNDOUTSTART:
> +		op->restore_row =3D true;
> +		fallthrough;
> +	case NAND_CMD_READ0:
> +	case NAND_CMD_READSTART:
> +		op->cmd_reg =3D LS1X_NAND_CMD_READ;
> +		break;
> +	default:
> +		dev_err(nfc->dev, "Opcode not supported: %u\n", opcode);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return ret;
> +}
> +
> +static int ls1x_nand_parse_instructions(struct nand_chip *chip,
> +					const struct nand_subop *subop,
> +					struct ls1x_nfc_op *op)
> +{
> +	unsigned int op_id;
> +	int ret;
> +
> +	for (op_id =3D 0; op_id < subop->ninstrs; op_id++) {
> +		const struct nand_op_instr *instr =3D &subop->instrs[op_id];
> +		unsigned int offset, naddrs;
> +		const u8 *addrs;
> +
> +		switch (instr->type) {
> +		case NAND_OP_CMD_INSTR:
> +			ret =3D ls1x_nand_op_cmd_mapping(chip, op,
> +						       instr->ctx.cmd.opcode);
> +			if (ret < 0)
> +				return ret;
> +			break;
> +		case NAND_OP_ADDR_INSTR:
> +			naddrs =3D nand_subop_get_num_addr_cyc(subop, op_id);
> +			if (naddrs > LS1X_NAND_MAX_ADDR_CYC)
> +				return -EOPNOTSUPP;
> +			op->naddrs =3D naddrs;
> +			offset =3D nand_subop_get_addr_start_off(subop, op_id);
> +			addrs =3D &instr->ctx.addr.addrs[offset];
> +			memcpy(op->addrs + op->addrs_offset, addrs, naddrs);
> +			break;
> +		case NAND_OP_DATA_IN_INSTR:
> +		case NAND_OP_DATA_OUT_INSTR:
> +			offset =3D nand_subop_get_data_start_off(subop, op_id);
> +			op->len =3D nand_subop_get_data_len(subop, op_id);
> +			if (instr->type =3D=3D NAND_OP_DATA_IN_INSTR)
> +				op->buf =3D instr->ctx.data.buf.in + offset;
> +			else if (instr->type =3D=3D NAND_OP_DATA_OUT_INSTR)
> +				op->buf =3D
> +				    (void *)instr->ctx.data.buf.out + offset;
> +
> +			break;
> +		case NAND_OP_WAITRDY_INSTR:
> +			op->rdy_timeout_ms =3D instr->ctx.waitrdy.timeout_ms;
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void ls1b_nand_parse_address(struct ls1x_nfc_op *op)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < LS1X_NAND_MAX_ADDR_CYC; i++) {
> +		if (i < 2)
> +			op->addr1_reg |=3D (u32)op->addrs[i] << i * BITS_PER_BYTE;
> +		else if (i < 4)
> +			op->addr1_reg |=3D
> +			    (u32)op->addrs[i] << (op->row_shift +
> +						  (i - 2) * BITS_PER_BYTE);
> +		else
> +			op->addr2_reg |=3D
> +			    (u32)op->addrs[i] >> (BITS_PER_WORD -
> +						  op->row_shift - (i - 4) *
> +						  BITS_PER_BYTE);

Please break these lines at 100 char, not 80, it will make the reading
easier.

> +	}
> +}
> +
> +static void ls1c_nand_parse_address(struct ls1x_nfc_op *op)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < LS1X_NAND_MAX_ADDR_CYC; i++) {
> +		if (i < 2)
> +			op->addr1_reg |=3D (u32)op->addrs[i] << i * BITS_PER_BYTE;
> +		else
> +			op->addr2_reg |=3D
> +			    (u32)op->addrs[i] << (i - 2) * BITS_PER_BYTE;

Same

> +	}
> +}
> +
> +static void ls1x_nand_trigger_op(struct ls1x_nfc *nfc, struct ls1x_nfc_o=
p *op)
> +{
> +	struct nand_chip *chip =3D &nfc->chip;
> +	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	int col0 =3D op->addrs[0];
> +	short col;
> +
> +	/* restore row address for column change */
> +	if (op->restore_row) {
> +		op->addr2_reg =3D readl(nfc->reg_base + LS1X_NAND_ADDR2);
> +		op->addr1_reg =3D readl(nfc->reg_base + LS1X_NAND_ADDR1);
> +		op->addr1_reg &=3D ~(mtd->writesize - 1);

This is strange and cannot work during the identification phase while
mtd->writesize is not yet known.

> +	}
> +
> +	if (!IS_ALIGNED(col0, chip->buf_align)) {
> +		col0 =3D ALIGN_DOWN(op->addrs[0], chip->buf_align);
> +		op->aligned_offset =3D op->addrs[0] - col0;
> +		op->addrs[0] =3D col0;
> +	}
> +
> +	if (nfc->data->parse_address)
> +		nfc->data->parse_address(op);
> +
> +	/* set address */
> +	writel(op->addr1_reg, nfc->reg_base + LS1X_NAND_ADDR1);
> +	writel(op->addr2_reg, nfc->reg_base + LS1X_NAND_ADDR2);
> +
> +	/* set data length */
> +	op->dma_len =3D ALIGN(op->len + op->aligned_offset, chip->buf_align);
> +	if (op->cmd_reg & LS1X_NAND_CMD_ERASE)
> +		writel(1, nfc->reg_base + LS1X_NAND_OP_NUM);
> +	else
> +		writel(op->dma_len, nfc->reg_base + LS1X_NAND_OP_NUM);
> +
> +	/* set operation area */
> +	col =3D op->addrs[1] << BITS_PER_BYTE | op->addrs[0];
> +	if (op->len) {
> +		if (col < mtd->writesize)

should'nt this be <=3D mtd->writesize?

Also what about startup-times again, while we don't yet know writesize?

> +			op->cmd_reg |=3D LS1X_NAND_CMD_OP_MAIN;
> +
> +		op->cmd_reg |=3D LS1X_NAND_CMD_OP_SPARE;
> +	}
> +
> +	/* set operation scope */
> +	if (nfc->data->op_scope_field) {
> +		int op_area =3D op->cmd_reg & LS1X_NAND_CMD_OP_AREA_MASK;
> +		unsigned int op_scope;
> +
> +		switch (op_area) {
> +		case LS1X_NAND_CMD_OP_MAIN:
> +			op_scope =3D mtd->writesize;
> +			break;
> +		case LS1X_NAND_CMD_OP_SPARE:
> +			op_scope =3D mtd->oobsize;
> +			break;
> +		case LS1X_NAND_CMD_OP_AREA_MASK:
> +			op_scope =3D mtd->writesize + mtd->oobsize;

Can you please just use the length of the operation?

> +			break;
> +		default:
> +			op_scope =3D 0;
> +			break;
> +		}
> +
> +		op_scope <<=3D __ffs(nfc->data->op_scope_field);
> +		regmap_update_bits(nfc->regmap, LS1X_NAND_PARAM,
> +				   nfc->data->op_scope_field, op_scope);
> +	}
> +
> +	/* set command */
> +	writel(op->cmd_reg, nfc->reg_base + LS1X_NAND_CMD);
> +
> +	/* trigger operation */
> +	regmap_write_bits(nfc->regmap, LS1X_NAND_CMD,
> +			  LS1X_NAND_CMD_VALID, LS1X_NAND_CMD_VALID);
> +}
> +
> +static int ls1x_nand_wait_for_op_done(struct ls1x_nfc *nfc,
> +				      struct ls1x_nfc_op *op)
> +{
> +	unsigned int val;
> +	int ret =3D 0;
> +
> +	if (op->rdy_timeout_ms) {
> +		ret =3D regmap_read_poll_timeout(nfc->regmap, LS1X_NAND_CMD,
> +					       val, val & LS1X_NAND_CMD_OP_DONE,
> +					       0, op->rdy_timeout_ms * 1000);

 * MSECS_PER_SEC?

> +		if (ret)
> +			dev_err(nfc->dev, "operation failed\n");
> +	}
> +
> +	return ret;
> +}
> +
> +static void ls1x_nand_dma_callback(void *data)
> +{
> +	struct ls1x_nfc *nfc =3D (struct ls1x_nfc *)data;
> +	struct dma_chan *chan =3D nfc->dma_chan;
> +	struct device *dev =3D chan->device->dev;
> +	enum dma_status status;
> +
> +	status =3D dmaengine_tx_status(chan, nfc->dma_cookie, NULL);
> +	if (likely(status =3D=3D DMA_COMPLETE))
> +		dev_dbg(dev, "DMA complete with cookie=3D%d\n", nfc->dma_cookie);
> +	else
> +		dev_err(dev, "DMA error with cookie=3D%d\n", nfc->dma_cookie);
> +
> +	complete(&nfc->dma_complete);

Do you gracefully handle the dma error condition? You should not return
normally to userspace if DMA failed and I see no mechanism to forward
the error up.

> +}
> +
> +static int ls1x_nand_dma_transfer(struct ls1x_nfc *nfc,
> +				  struct ls1x_nfc_op *op)
> +{
> +	struct nand_chip *chip =3D &nfc->chip;
> +	struct dma_chan *chan =3D nfc->dma_chan;
> +	struct device *dev =3D chan->device->dev;
> +	struct dma_async_tx_descriptor *desc;
> +	enum dma_data_direction data_dir =3D
> +	    op->is_write ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
> +	enum dma_transfer_direction xfer_dir =3D
> +	    op->is_write ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
> +	void *buf =3D op->buf;
> +	char *dma_buf =3D NULL;
> +	dma_addr_t dma_addr;
> +	int ret;
> +
> +	if (IS_ALIGNED((uintptr_t)buf, chip->buf_align) &&
> +	    IS_ALIGNED(op->len, chip->buf_align)) {
> +		dma_addr =3D dma_map_single(dev, buf, op->len, data_dir);
> +		if (dma_mapping_error(dev, dma_addr)) {
> +			dev_err(dev, "failed to map DMA buffer\n");
> +			return -ENXIO;
> +		}
> +	} else if (!op->is_write) {
> +		dma_buf =3D dma_alloc_coherent(dev, op->dma_len, &dma_addr,
> +					     GFP_KERNEL);
> +		if (!dma_buf)
> +			return -ENOMEM;
> +	} else {
> +		dev_err(dev, "subpage writing not supported\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	desc =3D dmaengine_prep_slave_single(chan, dma_addr, op->dma_len,
> +					   xfer_dir, DMA_PREP_INTERRUPT);
> +	if (!desc) {
> +		dev_err(dev, "failed to prepare DMA descriptor\n");
> +		ret =3D PTR_ERR(desc);
> +		goto err;
> +	}
> +	desc->callback =3D ls1x_nand_dma_callback;
> +	desc->callback_param =3D nfc;
> +
> +	nfc->dma_cookie =3D dmaengine_submit(desc);
> +	ret =3D dma_submit_error(nfc->dma_cookie);
> +	if (ret) {
> +		dev_err(dev, "failed to submit DMA descriptor\n");
> +		goto err;
> +	}
> +
> +	dev_dbg(dev, "issue DMA with cookie=3D%d\n", nfc->dma_cookie);
> +	dma_async_issue_pending(chan);
> +
> +	ret =3D wait_for_completion_timeout(&nfc->dma_complete,
> +					  msecs_to_jiffies(2000));
> +	if (!ret) {
> +		dmaengine_terminate_sync(chan);
> +		reinit_completion(&nfc->dma_complete);
> +		ret =3D -ETIMEDOUT;
> +		goto err;
> +	}
> +	ret =3D 0;
> +
> +	if (dma_buf)
> +		memcpy(buf, dma_buf + op->aligned_offset, op->len);
> +err:
> +	if (dma_buf)
> +		dma_free_coherent(dev, op->dma_len, dma_buf, dma_addr);
> +	else
> +		dma_unmap_single(dev, dma_addr, op->len, data_dir);
> +
> +	return ret;
> +}
> +
> +static int ls1x_nand_data_type_exec(struct nand_chip *chip,
> +				    const struct nand_subop *subop)
> +{
> +	struct ls1x_nfc *nfc =3D nand_get_controller_data(chip);
> +	struct ls1x_nfc_op op =3D { };
> +	int ret;
> +
> +	ret =3D ls1x_nand_parse_instructions(chip, subop, &op);
> +	if (ret)
> +		return ret;
> +
> +	ls1x_nand_trigger_op(nfc, &op);
> +
> +	ret =3D ls1x_nand_dma_transfer(nfc, &op);
> +	if (ret)
> +		return ret;
> +
> +	return ls1x_nand_wait_for_op_done(nfc, &op);
> +}
> +
> +static int ls1x_nand_misc_type_exec(struct nand_chip *chip,
> +				    const struct nand_subop *subop,
> +				    struct ls1x_nfc_op *op)
> +{
> +	struct ls1x_nfc *nfc =3D nand_get_controller_data(chip);
> +	int ret;
> +
> +	ret =3D ls1x_nand_parse_instructions(chip, subop, op);
> +	if (ret)
> +		return ret;
> +
> +	ls1x_nand_trigger_op(nfc, op);
> +
> +	return ls1x_nand_wait_for_op_done(nfc, op);
> +}
> +
> +static int ls1x_nand_zerolen_type_exec(struct nand_chip *chip,
> +				       const struct nand_subop *subop)
> +{
> +	struct ls1x_nfc_op op =3D { };

You don't need this space        ^

> +
> +	return ls1x_nand_misc_type_exec(chip, subop, &op);
> +}
> +
> +static int ls1x_nand_read_id_type_exec(struct nand_chip *chip,
> +				       const struct nand_subop *subop)
> +{
> +	struct ls1x_nfc *nfc =3D nand_get_controller_data(chip);
> +	struct ls1x_nfc_op op =3D { };
> +	int i, ret;
> +	union {
> +		char ids[5];
> +		struct {
> +			int idl;
> +			char idh;
> +		};
> +	} nand_id;
> +
> +	ret =3D ls1x_nand_misc_type_exec(chip, subop, &op);
> +	if (ret) {
> +		dev_err(nfc->dev, "failed to read ID! %d\n", ret);
> +		return ret;
> +	}
> +
> +	nand_id.idl =3D readl(nfc->reg_base + LS1X_NAND_IDL);
> +	nand_id.idh =3D readb(nfc->reg_base + LS1X_NAND_IDH_STATUS);
> +
> +	for (i =3D 0; i < min(sizeof(nand_id.ids), op.len); i++)
> +		op.buf[i] =3D nand_id.ids[sizeof(nand_id.ids) - 1 - i];
> +
> +	return ret;
> +}
> +
> +static int ls1x_nand_read_status_type_exec(struct nand_chip *chip,
> +					   const struct nand_subop *subop)
> +{
> +	struct ls1x_nfc *nfc =3D nand_get_controller_data(chip);
> +	struct ls1x_nfc_op op =3D { };
> +	int val, ret;
> +
> +	ret =3D ls1x_nand_misc_type_exec(chip, subop, &op);
> +	if (ret) {
> +		dev_err(nfc->dev, "failed to read status! %d\n", ret);
> +		return ret;
> +	}
> +
> +	val =3D readl(nfc->reg_base +
> +		    LS1X_NAND_IDH_STATUS) & ~nfc->data->status_field;

Just split this into:

	val =3D readl();
	val &=3D ~mask;

> +	op.buf[0] =3D val << ffs(nfc->data->status_field);
> +
> +	return ret;
> +}
> +

The rest look good.

Thanks,
Miqu=C3=A8l

