Return-Path: <linux-media+bounces-23567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6E79F4917
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 11:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B64E67A24F3
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 10:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D92F1EB9EF;
	Tue, 17 Dec 2024 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSFolyBY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D931DDC3F;
	Tue, 17 Dec 2024 10:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734432072; cv=none; b=XTgsM8ZvzeKwBQigmtKHholRHcq79ODK1PSlg49zr8ZiYKYRF/IM95rRHJ1sA/aOF1vcE5a9ksFmCsySr0t8QpRaPOUnnkXW61cqzbAeEFwUQKNmDuN4Nj0s9qrGEsJT2/42u+7oZyc1LOxC/tvu3+2rEULoq4MXQ5bKHkWaCt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734432072; c=relaxed/simple;
	bh=98FF3LOBEr7oKmdyGphG8UQFVjYr36Q0YuvUEBzx2iI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AhIzvUeKkTBdrTtzVHnBFhaudmIoxDmiQIblez7DYSmqXOu0UiMn0GVnmzptPxGRlFEbyuYq4QScE6IV+tzTi65xFSCIHCXjEHFl0Yf77B3wKA6d99DsZj8fwqbVJca8jd1GjhYle+JqB0bzzng6By6etZydn62zXL5Io3Csips=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSFolyBY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E3E8C4CEDE;
	Tue, 17 Dec 2024 10:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734432072;
	bh=98FF3LOBEr7oKmdyGphG8UQFVjYr36Q0YuvUEBzx2iI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GSFolyBY15rfUGgeCSXGSrGXTI/0EfUSrud31xPZPukWDyK0F346ifBo7tpJDOv28
	 9Hhy8P+4D/oS/LeTLHEI7wU/RF8yrb0jU+EyjsDSw42yPhU4B7Rm6iqH94L4z7Qc49
	 t0oQlzPHp67H9m2VFtDQT86L8+dtuaXYF3zDHu4eSpilRg4c6I1b3e33JfXipRlz3p
	 6u6vUKQ1KOQgMkCH+dNAh+bpGR0LPOBABh38IRFu/97qrfSwIk167Gxk+zWbEGcEgW
	 6vmAHhGFgo7eziy2Ms3//DVTsqatAAPqzRmOXB0MIEpBu2RdLKIzWvbXFjnKQOu3aA
	 Jq9iKHBAKbHYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA5FE77188;
	Tue, 17 Dec 2024 10:41:12 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Tue, 17 Dec 2024 18:16:50 +0800
Subject: [PATCH v11 2/2] mtd: rawnand: Add Loongson-1 NAND Controller
 Driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-loongson1-nand-v11-2-b692c58988bb@gmail.com>
References: <20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com>
In-Reply-To: <20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734432069; l=29652;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=MlgcpmuA1/TGqG7ZuZVz8D8l+5TXvM4lgTobTcDr/V4=;
 b=QD8JNplsivBxAsQ7dEUcM2jof+Ncp+tZVmsx2YNhGptMJJHIoZveOHtE9YATcatJsGfO2WPCG
 cmxYgkigwzVDT11xpAQLYY4TfyYwtRNgvqz27y/itzR0r8cClsWpJdq
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

From: Keguang Zhang <keguang.zhang@gmail.com>

Add NAND controller driver for Loongson-1 SoCs.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
Changes in v11:
- Move the DMA address to DT.
- Rename the source file to loongson1-nand-controller.c.
- Improve the logic of ls1x_nand_op_cmd_mapping().
- Improve the logic of ls1x_nand_check_op() to exclude unsupported cases.
- Substitute 'host' for the improper term 'nfc'.
- Some minor fixes and adjustments.

Changes in v10:
- Fix the build error reported by kernel test robot.
  Link: https://lore.kernel.org/oe-kbuild-all/202409220010.vctkHddZ-lkp@intel.com

Changes in v9:
- Change the compatible to 'loongson,ls1*-nand-controller'.
- Update MAINTAINERS file accordingly.
- Rebasing due to recent upstream changes.

Changes in v8:
- Drop NAND_MONOLITHIC_READ and add support for real subpage read instead.
- Simplify the logic of ls1b_nand_parse_address() and ls1c_nand_parse_address().
- Split ls1x_nand_set_controller() into ls1x_nand_parse_instructions()
  and ls1x_nand_trigger_op().
- Implement ls1x_nand_op_cmd_mapping() to convert the opcodes instead of forcing them.
- Add ls1x_nand_check_op().
- Remove struct ls1x_nand after moving its members to struct ls1x_nfc.
- Add the prefix 'LS1X_' for all registers and their bits.
- Drop the macros: nand_readl() and nand_writel().
- Some minor fixes and improvements.

Changes in v7:
- Rename the Kconfig dependency to LOONGSON1_APB_DMA

Changes in v6:
- Amend Kconfig
- Add DT support
- Use DT data instead of platform data
- Remove MAX_ID_SIZE
- Remove case NAND_OP_CMD_INSTR in ls1x_nand_set_controller()
- Move ECC configuration to ls1x_nand_attach_chip()
- Rename variable "nand" to "ls1x"
- Rename variable "nc" to "nfc"
- Some minor fixes
- Link to v5: https://lore.kernel.org/all/20210520224213.7907-1-keguang.zhang@gmail.com

Changes in v5:
- Update the driver to fit the raw NAND framework.
- Implement exec_op() instead of legacy cmdfunc().
- Use dma_request_chan() instead of dma_request_channel().
- Some minor fixes and cleanups.

Changes in v4:
- Retrieve the controller from nand_hw_control.

Changes in v3:
- Replace __raw_readl/__raw_writel with readl/writel.
- Split ls1x_nand into two structures:
ls1x_nand_chip and ls1x_nand_controller.

Changes in v2:
- Modify the dependency in Kconfig due to the changes of DMA module.
---
 MAINTAINERS                                      |   1 +
 drivers/mtd/nand/raw/Kconfig                     |   7 +
 drivers/mtd/nand/raw/Makefile                    |   1 +
 drivers/mtd/nand/raw/loongson1-nand-controller.c | 885 +++++++++++++++++++++++
 4 files changed, 894 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b332995b3350..030eb198da01 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15828,6 +15828,7 @@ F:	Documentation/devicetree/bindings/*/loongson,ls1*.yaml
 F:	arch/mips/include/asm/mach-loongson32/
 F:	arch/mips/loongson32/
 F:	drivers/*/*loongson1*
+F:	drivers/mtd/nand/raw/loongson1-nand-controller.c
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
 
 MIPS/LOONGSON2EF ARCHITECTURE
diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index d0aaccf72d78..54ad16a6a64e 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -454,6 +454,13 @@ config MTD_NAND_TS72XX
 	help
 	  Enables support for NAND controller on ts72xx SBCs.
 
+config MTD_NAND_LOONGSON1
+	tristate "Loongson1 NAND controller"
+	depends on LOONGSON1_APB_DMA || COMPILE_TEST
+	select REGMAP_MMIO
+	help
+	  Enables support for NAND controller on Loongson1 SoCs.
+
 comment "Misc"
 
 config MTD_SM_COMMON
diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index d0b0e6b83568..24a97fd983c0 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_MTD_NAND_INTEL_LGM)	+= intel-nand-controller.o
 obj-$(CONFIG_MTD_NAND_ROCKCHIP)		+= rockchip-nand-controller.o
 obj-$(CONFIG_MTD_NAND_PL35X)		+= pl35x-nand-controller.o
 obj-$(CONFIG_MTD_NAND_RENESAS)		+= renesas-nand-controller.o
+obj-$(CONFIG_MTD_NAND_LOONGSON1)	+= loongson1-nand-controller.o
 
 nand-objs := nand_base.o nand_legacy.o nand_bbt.o nand_timings.o nand_ids.o
 nand-objs += nand_onfi.o
diff --git a/drivers/mtd/nand/raw/loongson1-nand-controller.c b/drivers/mtd/nand/raw/loongson1-nand-controller.c
new file mode 100644
index 000000000000..7d642833fa4a
--- /dev/null
+++ b/drivers/mtd/nand/raw/loongson1-nand-controller.c
@@ -0,0 +1,885 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * NAND Controller Driver for Loongson-1 SoC
+ *
+ * Copyright (C) 2015-2024 Keguang Zhang <keguang.zhang@gmail.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
+#include <linux/iopoll.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/rawnand.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/sizes.h>
+
+/* Loongson-1 NAND Controller Registers */
+#define LS1X_NAND_CMD		0x0
+#define LS1X_NAND_ADDR1		0x4
+#define LS1X_NAND_ADDR2		0x8
+#define LS1X_NAND_TIMING	0xc
+#define LS1X_NAND_IDL		0x10
+#define LS1X_NAND_IDH_STATUS	0x14
+#define LS1X_NAND_PARAM		0x18
+#define LS1X_NAND_OP_NUM	0x1c
+
+/* NAND Command Register Bits */
+#define LS1X_NAND_CMD_OP_DONE		BIT(10)
+#define LS1X_NAND_CMD_OP_SPARE		BIT(9)
+#define LS1X_NAND_CMD_OP_MAIN		BIT(8)
+#define LS1X_NAND_CMD_STATUS		BIT(7)
+#define LS1X_NAND_CMD_RESET		BIT(6)
+#define LS1X_NAND_CMD_READID		BIT(5)
+#define LS1X_NAND_CMD_BLOCKS_ERASE	BIT(4)
+#define LS1X_NAND_CMD_ERASE		BIT(3)
+#define LS1X_NAND_CMD_WRITE		BIT(2)
+#define LS1X_NAND_CMD_READ		BIT(1)
+#define LS1X_NAND_CMD_VALID		BIT(0)
+
+#define LS1X_NAND_CMD_OP_AREA_MASK	GENMASK(9, 8)
+#define LS1X_NAND_WAIT_CYCLE_MASK	GENMASK(7, 0)
+#define LS1X_NAND_HOLD_CYCLE_MASK	GENMASK(15, 8)
+#define LS1X_NAND_CELL_SIZE_MASK	GENMASK(11, 8)
+
+#define LS1X_NAND_MAX_ADDR_CYC		5U
+
+#define BITS_PER_WORD		(4 * BITS_PER_BYTE)
+
+struct ls1x_nand_op {
+	char addrs[LS1X_NAND_MAX_ADDR_CYC];
+	unsigned int naddrs;
+	unsigned int addrs_offset;
+	unsigned int addr1_reg;
+	unsigned int addr2_reg;
+	unsigned int aligned_offset;
+	unsigned int row_start;
+	unsigned int cmd_reg;
+	unsigned int rdy_timeout_ms;
+	unsigned int orig_len;
+	bool is_readid;
+	bool is_erase;
+	bool is_write;
+	bool is_read;
+	bool is_change_column;
+	size_t len;
+	char *buf;
+};
+
+struct ls1x_nand_data {
+	unsigned int status_field;
+	unsigned int op_scope_field;
+	unsigned int hold_cycle;
+	unsigned int wait_cycle;
+	void (*parse_address)(struct ls1x_nand_op *op);
+};
+
+struct ls1x_nand_host {
+	struct device *dev;
+	struct nand_chip chip;
+	struct nand_controller controller;
+	const struct ls1x_nand_data *data;
+	void __iomem *reg_base;
+	struct regmap *regmap;
+	/* DMA Engine stuff */
+	dma_addr_t dma_base;
+	struct dma_chan *dma_chan;
+	dma_cookie_t dma_cookie;
+	struct completion dma_complete;
+};
+
+static const struct regmap_config ls1x_nand_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int ls1x_nand_op_cmd_mapping(struct nand_chip *chip, struct ls1x_nand_op *op, u8 opcode)
+{
+	struct ls1x_nand_host *host = nand_get_controller_data(chip);
+	int ret = 0;
+
+	op->row_start = chip->page_shift + 1;
+
+	/* The controller abstracts the following NAND operations. */
+	switch (opcode) {
+	case NAND_CMD_STATUS:
+		op->cmd_reg = LS1X_NAND_CMD_STATUS;
+		break;
+	case NAND_CMD_RESET:
+		op->cmd_reg = LS1X_NAND_CMD_RESET;
+		break;
+	case NAND_CMD_READID:
+		op->is_readid = true;
+		op->cmd_reg = LS1X_NAND_CMD_READID;
+		break;
+	case NAND_CMD_ERASE1:
+		op->is_erase = true;
+		op->addrs_offset = 2;
+		break;
+	case NAND_CMD_ERASE2:
+		if (!op->is_erase)
+			return -EOPNOTSUPP;
+		/* During erasing, row_start differs from the default value. */
+		op->row_start = chip->page_shift;
+		op->cmd_reg = LS1X_NAND_CMD_ERASE;
+		break;
+	case NAND_CMD_SEQIN:
+		op->is_write = true;
+		break;
+	case NAND_CMD_PAGEPROG:
+		if (!op->is_write)
+			return -EOPNOTSUPP;
+		op->cmd_reg = LS1X_NAND_CMD_WRITE;
+		break;
+	case NAND_CMD_READ0:
+		op->is_read = true;
+		break;
+	case NAND_CMD_READSTART:
+		if (!op->is_read)
+			return -EOPNOTSUPP;
+		op->cmd_reg = LS1X_NAND_CMD_READ;
+		break;
+	case NAND_CMD_RNDOUT:
+		op->is_change_column = true;
+		break;
+	case NAND_CMD_RNDOUTSTART:
+		if (!op->is_change_column)
+			return -EOPNOTSUPP;
+		op->cmd_reg = LS1X_NAND_CMD_READ;
+		break;
+	default:
+		dev_err(host->dev, "Opcode not supported: %u\n", opcode);
+		return -EOPNOTSUPP;
+	}
+
+	return ret;
+}
+
+static int ls1x_nand_parse_instructions(struct nand_chip *chip,
+					const struct nand_subop *subop,
+					struct ls1x_nand_op *op)
+{
+	unsigned int op_id;
+	int ret;
+
+	for (op_id = 0; op_id < subop->ninstrs; op_id++) {
+		const struct nand_op_instr *instr = &subop->instrs[op_id];
+		unsigned int offset, naddrs;
+		const u8 *addrs;
+
+		switch (instr->type) {
+		case NAND_OP_CMD_INSTR:
+			ret = ls1x_nand_op_cmd_mapping(chip, op, instr->ctx.cmd.opcode);
+			if (ret < 0)
+				return ret;
+
+			break;
+		case NAND_OP_ADDR_INSTR:
+			naddrs = nand_subop_get_num_addr_cyc(subop, op_id);
+			if (naddrs > LS1X_NAND_MAX_ADDR_CYC)
+				return -EOPNOTSUPP;
+			op->naddrs = naddrs;
+			offset = nand_subop_get_addr_start_off(subop, op_id);
+			addrs = &instr->ctx.addr.addrs[offset];
+			memcpy(op->addrs + op->addrs_offset, addrs, naddrs);
+			break;
+		case NAND_OP_DATA_IN_INSTR:
+		case NAND_OP_DATA_OUT_INSTR:
+			offset = nand_subop_get_data_start_off(subop, op_id);
+			op->orig_len = nand_subop_get_data_len(subop, op_id);
+			if (instr->type == NAND_OP_DATA_IN_INSTR)
+				op->buf = instr->ctx.data.buf.in + offset;
+			else if (instr->type == NAND_OP_DATA_OUT_INSTR)
+				op->buf = (void *)instr->ctx.data.buf.out + offset;
+
+			break;
+		case NAND_OP_WAITRDY_INSTR:
+			op->rdy_timeout_ms = instr->ctx.waitrdy.timeout_ms;
+			break;
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static void ls1b_nand_parse_address(struct ls1x_nand_op *op)
+{
+	int i;
+
+	for (i = 0; i < LS1X_NAND_MAX_ADDR_CYC; i++) {
+		int shift;
+
+		if (i < 2) {
+			shift = i * BITS_PER_BYTE;
+		} else {
+			shift = op->row_start + (i - 2) * BITS_PER_BYTE;
+
+			if (i == 4) {
+				int shift1 = BITS_PER_WORD - shift;
+
+				op->addr2_reg |= (u32)op->addrs[i] >> shift1;
+			}
+		}
+
+		op->addr1_reg |= (u32)op->addrs[i] << shift;
+	}
+}
+
+static void ls1c_nand_parse_address(struct ls1x_nand_op *op)
+{
+	int i;
+
+	for (i = 0; i < LS1X_NAND_MAX_ADDR_CYC; i++) {
+		int shift;
+
+		if (i < 2) {
+			shift = i * BITS_PER_BYTE;
+			op->addr1_reg |= (u32)op->addrs[i] << shift;
+		} else {
+			shift = (i - 2) * BITS_PER_BYTE;
+			op->addr2_reg |= (u32)op->addrs[i] << shift;
+		}
+	}
+}
+
+static void ls1x_nand_trigger_op(struct ls1x_nand_host *host, struct ls1x_nand_op *op)
+{
+	struct nand_chip *chip = &host->chip;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int col0 = op->addrs[0];
+	short col;
+
+	/* restore row address for column change */
+	if (op->is_change_column) {
+		op->addr2_reg = readl(host->reg_base + LS1X_NAND_ADDR2);
+		op->addr1_reg = readl(host->reg_base + LS1X_NAND_ADDR1);
+		op->addr1_reg &= ~(mtd->writesize - 1);
+	}
+
+	if (!IS_ALIGNED(col0, chip->buf_align)) {
+		col0 = ALIGN_DOWN(op->addrs[0], chip->buf_align);
+		op->aligned_offset = op->addrs[0] - col0;
+		op->addrs[0] = col0;
+	}
+
+	if (host->data->parse_address)
+		host->data->parse_address(op);
+
+	/* set address */
+	writel(op->addr1_reg, host->reg_base + LS1X_NAND_ADDR1);
+	writel(op->addr2_reg, host->reg_base + LS1X_NAND_ADDR2);
+
+	/* set operation length */
+	if (op->is_write || op->is_read || op->is_change_column)
+		op->len = ALIGN(op->orig_len + op->aligned_offset, chip->buf_align);
+	else if (op->is_erase)
+		op->len = 1;
+	else
+		op->len = op->orig_len;
+
+	writel(op->len, host->reg_base + LS1X_NAND_OP_NUM);
+
+	/* set operation area */
+	col = op->addrs[1] << BITS_PER_BYTE | op->addrs[0];
+	if (op->orig_len && !op->is_readid) {
+		if (col < mtd->writesize)
+			op->cmd_reg |= LS1X_NAND_CMD_OP_MAIN;
+
+		op->cmd_reg |= LS1X_NAND_CMD_OP_SPARE;
+	}
+
+	/* set operation scope */
+	if (host->data->op_scope_field) {
+		unsigned int op_scope;
+
+		switch (op->cmd_reg & LS1X_NAND_CMD_OP_AREA_MASK) {
+		case LS1X_NAND_CMD_OP_MAIN:
+			op_scope = mtd->writesize;
+			break;
+		case LS1X_NAND_CMD_OP_SPARE:
+			op_scope = mtd->oobsize;
+			break;
+		case LS1X_NAND_CMD_OP_AREA_MASK:
+			op_scope = mtd->writesize + mtd->oobsize;
+			break;
+		default:
+			op_scope = 0;
+			break;
+		}
+
+		op_scope <<= __ffs(host->data->op_scope_field);
+		regmap_update_bits(host->regmap, LS1X_NAND_PARAM,
+				   host->data->op_scope_field, op_scope);
+	}
+
+	/* set command */
+	writel(op->cmd_reg, host->reg_base + LS1X_NAND_CMD);
+
+	/* trigger operation */
+	regmap_write_bits(host->regmap, LS1X_NAND_CMD, LS1X_NAND_CMD_VALID, LS1X_NAND_CMD_VALID);
+}
+
+static int ls1x_nand_wait_for_op_done(struct ls1x_nand_host *host, struct ls1x_nand_op *op)
+{
+	unsigned int val;
+	int ret = 0;
+
+	if (op->rdy_timeout_ms) {
+		ret = regmap_read_poll_timeout(host->regmap, LS1X_NAND_CMD,
+					       val, val & LS1X_NAND_CMD_OP_DONE,
+					       0, op->rdy_timeout_ms * MSEC_PER_SEC);
+		if (ret)
+			dev_err(host->dev, "operation failed\n");
+	}
+
+	return ret;
+}
+
+static void ls1x_nand_dma_callback(void *data)
+{
+	struct ls1x_nand_host *host = (struct ls1x_nand_host *)data;
+	struct dma_chan *chan = host->dma_chan;
+	struct device *dev = chan->device->dev;
+	enum dma_status status;
+
+	status = dmaengine_tx_status(chan, host->dma_cookie, NULL);
+	if (likely(status == DMA_COMPLETE)) {
+		dev_dbg(dev, "DMA complete with cookie=%d\n", host->dma_cookie);
+		complete(&host->dma_complete);
+	} else {
+		dev_err(dev, "DMA error with cookie=%d\n", host->dma_cookie);
+	}
+}
+
+static int ls1x_nand_dma_transfer(struct ls1x_nand_host *host, struct ls1x_nand_op *op)
+{
+	struct nand_chip *chip = &host->chip;
+	struct dma_chan *chan = host->dma_chan;
+	struct device *dev = chan->device->dev;
+	struct dma_async_tx_descriptor *desc;
+	enum dma_data_direction data_dir = op->is_write ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
+	enum dma_transfer_direction xfer_dir = op->is_write ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
+	void *buf = op->buf;
+	char *dma_buf = NULL;
+	dma_addr_t dma_addr;
+	int ret;
+
+	if (IS_ALIGNED((uintptr_t)buf, chip->buf_align) &&
+	    IS_ALIGNED(op->orig_len, chip->buf_align)) {
+		dma_addr = dma_map_single(dev, buf, op->orig_len, data_dir);
+		if (dma_mapping_error(dev, dma_addr)) {
+			dev_err(dev, "failed to map DMA buffer\n");
+			return -ENXIO;
+		}
+	} else if (!op->is_write) {
+		dma_buf = dma_alloc_coherent(dev, op->len, &dma_addr, GFP_KERNEL);
+		if (!dma_buf)
+			return -ENOMEM;
+	} else {
+		dev_err(dev, "subpage writing not supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	desc = dmaengine_prep_slave_single(chan, dma_addr, op->len, xfer_dir, DMA_PREP_INTERRUPT);
+	if (!desc) {
+		dev_err(dev, "failed to prepare DMA descriptor\n");
+		ret = PTR_ERR(desc);
+		goto err;
+	}
+	desc->callback = ls1x_nand_dma_callback;
+	desc->callback_param = host;
+
+	host->dma_cookie = dmaengine_submit(desc);
+	ret = dma_submit_error(host->dma_cookie);
+	if (ret) {
+		dev_err(dev, "failed to submit DMA descriptor\n");
+		goto err;
+	}
+
+	dev_dbg(dev, "issue DMA with cookie=%d\n", host->dma_cookie);
+	dma_async_issue_pending(chan);
+
+	ret = wait_for_completion_timeout(&host->dma_complete, msecs_to_jiffies(2000));
+	if (!ret) {
+		dmaengine_terminate_sync(chan);
+		reinit_completion(&host->dma_complete);
+		ret = -ETIMEDOUT;
+		goto err;
+	}
+	ret = 0;
+
+	if (dma_buf)
+		memcpy(buf, dma_buf + op->aligned_offset, op->orig_len);
+err:
+	if (dma_buf)
+		dma_free_coherent(dev, op->len, dma_buf, dma_addr);
+	else
+		dma_unmap_single(dev, dma_addr, op->orig_len, data_dir);
+
+	return ret;
+}
+
+static int ls1x_nand_data_type_exec(struct nand_chip *chip, const struct nand_subop *subop)
+{
+	struct ls1x_nand_host *host = nand_get_controller_data(chip);
+	struct ls1x_nand_op op = {};
+	int ret;
+
+	ret = ls1x_nand_parse_instructions(chip, subop, &op);
+	if (ret)
+		return ret;
+
+	ls1x_nand_trigger_op(host, &op);
+
+	ret = ls1x_nand_dma_transfer(host, &op);
+	if (ret)
+		return ret;
+
+	return ls1x_nand_wait_for_op_done(host, &op);
+}
+
+static int ls1x_nand_misc_type_exec(struct nand_chip *chip,
+				    const struct nand_subop *subop,
+				    struct ls1x_nand_op *op)
+{
+	struct ls1x_nand_host *host = nand_get_controller_data(chip);
+	int ret;
+
+	ret = ls1x_nand_parse_instructions(chip, subop, op);
+	if (ret)
+		return ret;
+
+	ls1x_nand_trigger_op(host, op);
+
+	return ls1x_nand_wait_for_op_done(host, op);
+}
+
+static int ls1x_nand_zerolen_type_exec(struct nand_chip *chip, const struct nand_subop *subop)
+{
+	struct ls1x_nand_op op = {};
+
+	return ls1x_nand_misc_type_exec(chip, subop, &op);
+}
+
+static int ls1x_nand_read_id_type_exec(struct nand_chip *chip, const struct nand_subop *subop)
+{
+	struct ls1x_nand_host *host = nand_get_controller_data(chip);
+	struct ls1x_nand_op op = {};
+	int i, ret;
+	union {
+		char ids[5];
+		struct {
+			int idl;
+			char idh;
+		};
+	} nand_id;
+
+	ret = ls1x_nand_misc_type_exec(chip, subop, &op);
+	if (ret) {
+		dev_err(host->dev, "failed to read ID! %d\n", ret);
+		return ret;
+	}
+
+	nand_id.idl = readl(host->reg_base + LS1X_NAND_IDL);
+	nand_id.idh = readb(host->reg_base + LS1X_NAND_IDH_STATUS);
+
+	for (i = 0; i < min(sizeof(nand_id.ids), op.orig_len); i++)
+		op.buf[i] = nand_id.ids[sizeof(nand_id.ids) - 1 - i];
+
+	return ret;
+}
+
+static int ls1x_nand_read_status_type_exec(struct nand_chip *chip, const struct nand_subop *subop)
+{
+	struct ls1x_nand_host *host = nand_get_controller_data(chip);
+	struct ls1x_nand_op op = {};
+	int val, ret;
+
+	ret = ls1x_nand_misc_type_exec(chip, subop, &op);
+	if (ret) {
+		dev_err(host->dev, "failed to read status! %d\n", ret);
+		return ret;
+	}
+
+	val = readl(host->reg_base + LS1X_NAND_IDH_STATUS);
+	val &= ~host->data->status_field;
+	op.buf[0] = val << ffs(host->data->status_field);
+
+	return ret;
+}
+
+static const struct nand_op_parser ls1x_nand_op_parser = NAND_OP_PARSER(
+	NAND_OP_PARSER_PATTERN(
+		ls1x_nand_read_id_type_exec,
+		NAND_OP_PARSER_PAT_CMD_ELEM(false),
+		NAND_OP_PARSER_PAT_ADDR_ELEM(false, LS1X_NAND_MAX_ADDR_CYC),
+		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 8)),
+	NAND_OP_PARSER_PATTERN(
+		ls1x_nand_read_status_type_exec,
+		NAND_OP_PARSER_PAT_CMD_ELEM(false),
+		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 1)),
+	NAND_OP_PARSER_PATTERN(
+		ls1x_nand_zerolen_type_exec,
+		NAND_OP_PARSER_PAT_CMD_ELEM(false),
+		NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
+	NAND_OP_PARSER_PATTERN(
+		ls1x_nand_zerolen_type_exec,
+		NAND_OP_PARSER_PAT_CMD_ELEM(false),
+		NAND_OP_PARSER_PAT_ADDR_ELEM(false, LS1X_NAND_MAX_ADDR_CYC),
+		NAND_OP_PARSER_PAT_CMD_ELEM(false),
+		NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
+	NAND_OP_PARSER_PATTERN(
+		ls1x_nand_data_type_exec,
+		NAND_OP_PARSER_PAT_CMD_ELEM(false),
+		NAND_OP_PARSER_PAT_ADDR_ELEM(false, LS1X_NAND_MAX_ADDR_CYC),
+		NAND_OP_PARSER_PAT_CMD_ELEM(false),
+		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
+		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 0)),
+	NAND_OP_PARSER_PATTERN(
+		ls1x_nand_data_type_exec,
+		NAND_OP_PARSER_PAT_CMD_ELEM(false),
+		NAND_OP_PARSER_PAT_ADDR_ELEM(false, LS1X_NAND_MAX_ADDR_CYC),
+		NAND_OP_PARSER_PAT_DATA_OUT_ELEM(false, 0),
+		NAND_OP_PARSER_PAT_CMD_ELEM(false),
+		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
+	);
+
+static inline bool ls1x_nand_is_valid_cmd(u8 opcode)
+{
+	return opcode == NAND_CMD_RESET ||
+	       opcode == NAND_CMD_READID ||
+	       opcode == NAND_CMD_ERASE1 ||
+	       opcode == NAND_CMD_ERASE2 ||
+	       opcode == NAND_CMD_STATUS ||
+	       opcode == NAND_CMD_SEQIN ||
+	       opcode == NAND_CMD_PAGEPROG ||
+	       opcode == NAND_CMD_RNDOUT ||
+	       opcode == NAND_CMD_RNDOUTSTART ||
+	       opcode == NAND_CMD_READ0 ||
+	       opcode == NAND_CMD_READSTART;
+}
+
+static inline bool ls1x_nand_is_cmd_sequence(const struct nand_op_instr *instr1,
+					     const struct nand_op_instr *instr2)
+{
+	return instr1->type == NAND_OP_CMD_INSTR && instr2->type == NAND_OP_CMD_INSTR;
+}
+
+static inline bool ls1x_nand_is_erase_sequence(const struct nand_op_instr *instr1,
+					       const struct nand_op_instr *instr2)
+{
+	return instr1->ctx.cmd.opcode == NAND_CMD_ERASE1 &&
+	       instr2->ctx.cmd.opcode == NAND_CMD_ERASE2;
+}
+
+static inline bool ls1x_nand_is_write_sequence(const struct nand_op_instr *instr1,
+					       const struct nand_op_instr *instr2)
+{
+	return instr1->ctx.cmd.opcode == NAND_CMD_SEQIN &&
+	       instr2->ctx.cmd.opcode == NAND_CMD_PAGEPROG;
+}
+
+static inline bool ls1x_nand_is_read_sequence(const struct nand_op_instr *instr1,
+					      const struct nand_op_instr *instr2)
+{
+	return (instr1->ctx.cmd.opcode == NAND_CMD_READ0 &&
+		instr2->ctx.cmd.opcode == NAND_CMD_READSTART) ||
+	       (instr1->ctx.cmd.opcode == NAND_CMD_RNDOUT &&
+		instr2->ctx.cmd.opcode == NAND_CMD_RNDOUTSTART);
+}
+
+static int ls1x_nand_check_op(struct nand_chip *chip, const struct nand_operation *op)
+{
+	const struct nand_op_instr *instr;
+	int op_id;
+
+	for (op_id = 0; op_id < op->ninstrs; op_id++) {
+		instr = &op->instrs[op_id];
+
+		switch (instr->type) {
+		case NAND_OP_CMD_INSTR:
+			if (!ls1x_nand_is_valid_cmd(instr->ctx.cmd.opcode))
+				return -EOPNOTSUPP;
+			break;
+		case NAND_OP_ADDR_INSTR:
+			if (instr->ctx.addr.naddrs > LS1X_NAND_MAX_ADDR_CYC)
+				return -EOPNOTSUPP;
+			break;
+		default:
+			break;
+		}
+	}
+
+	if (op->ninstrs == 4 &&
+	    ls1x_nand_is_cmd_sequence(&op->instrs[0], &op->instrs[2]) &&
+	    !ls1x_nand_is_erase_sequence(&op->instrs[0], &op->instrs[2]))
+		return -EOPNOTSUPP;
+
+	if (op->ninstrs == 5) {
+		if (ls1x_nand_is_cmd_sequence(&op->instrs[0], &op->instrs[2]) &&
+		    !ls1x_nand_is_read_sequence(&op->instrs[0], &op->instrs[2]))
+			return -EOPNOTSUPP;
+
+		if (ls1x_nand_is_cmd_sequence(&op->instrs[0], &op->instrs[3]) &&
+		    !ls1x_nand_is_write_sequence(&op->instrs[0], &op->instrs[3]))
+			return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int ls1x_nand_exec_op(struct nand_chip *chip,
+			     const struct nand_operation *op,
+			     bool check_only)
+{
+	if (check_only)
+		return ls1x_nand_check_op(chip, op);
+
+	return nand_op_parser_exec_op(chip, &ls1x_nand_op_parser, op, check_only);
+}
+
+static int ls1x_nand_attach_chip(struct nand_chip *chip)
+{
+	struct ls1x_nand_host *host = nand_get_controller_data(chip);
+	u64 chipsize = nanddev_target_size(&chip->base);
+	int cell_size = 0;
+
+	switch (chipsize) {
+	case SZ_128M:
+		cell_size = 0x0;
+		break;
+	case SZ_256M:
+		cell_size = 0x1;
+		break;
+	case SZ_512M:
+		cell_size = 0x2;
+		break;
+	case SZ_1G:
+		cell_size = 0x3;
+		break;
+	case SZ_2G:
+		cell_size = 0x4;
+		break;
+	case SZ_4G:
+		cell_size = 0x5;
+		break;
+	case SZ_8G:
+		cell_size = 0x6;
+		break;
+	case SZ_16G:
+		cell_size = 0x7;
+		break;
+	default:
+		dev_err(host->dev, "unsupported chip size: %llu MB\n", chipsize);
+		return -EOPNOTSUPP;
+	}
+
+	/* set cell size */
+	regmap_update_bits(host->regmap, LS1X_NAND_PARAM, LS1X_NAND_CELL_SIZE_MASK,
+			   FIELD_PREP(LS1X_NAND_CELL_SIZE_MASK, cell_size));
+
+	regmap_update_bits(host->regmap, LS1X_NAND_TIMING, LS1X_NAND_HOLD_CYCLE_MASK,
+			   FIELD_PREP(LS1X_NAND_HOLD_CYCLE_MASK, host->data->hold_cycle));
+
+	regmap_update_bits(host->regmap, LS1X_NAND_TIMING, LS1X_NAND_WAIT_CYCLE_MASK,
+			   FIELD_PREP(LS1X_NAND_WAIT_CYCLE_MASK, host->data->wait_cycle));
+
+	chip->ecc.read_page_raw = nand_monolithic_read_page_raw;
+	chip->ecc.write_page_raw = nand_monolithic_write_page_raw;
+
+	return 0;
+}
+
+static const struct nand_controller_ops ls1x_nand_controller_ops = {
+	.exec_op = ls1x_nand_exec_op,
+	.attach_chip = ls1x_nand_attach_chip,
+};
+
+static void ls1x_nand_controller_cleanup(struct ls1x_nand_host *host)
+{
+	if (host->dma_chan)
+		dma_release_channel(host->dma_chan);
+}
+
+static int ls1x_nand_controller_init(struct ls1x_nand_host *host)
+{
+	struct device *dev = host->dev;
+	struct dma_chan *chan;
+	struct dma_slave_config cfg = {};
+	int ret;
+
+	host->regmap = devm_regmap_init_mmio(dev, host->reg_base, &ls1x_nand_regmap_config);
+	if (IS_ERR(host->regmap))
+		return dev_err_probe(dev, PTR_ERR(host->regmap), "failed to init regmap\n");
+
+	chan = dma_request_chan(dev, "rxtx");
+	if (IS_ERR(chan))
+		return dev_err_probe(dev, PTR_ERR(chan), "failed to request DMA channel\n");
+	host->dma_chan = chan;
+
+	cfg.src_addr = host->dma_base;
+	cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	cfg.dst_addr = host->dma_base;
+	cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	ret = dmaengine_slave_config(host->dma_chan, &cfg);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to config DMA channel\n");
+
+	init_completion(&host->dma_complete);
+
+	dev_dbg(dev, "got %s for %s access\n", dma_chan_name(host->dma_chan), dev_name(dev));
+
+	return 0;
+}
+
+static int ls1x_nand_chip_init(struct ls1x_nand_host *host)
+{
+	struct device *dev = host->dev;
+	int nchips = of_get_child_count(dev->of_node);
+	struct device_node *chip_np;
+	struct nand_chip *chip = &host->chip;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int ret = 0;
+
+	if (nchips != 1)
+		return dev_err_probe(dev, -EINVAL, "Currently one NAND chip supported\n");
+
+	chip_np = of_get_next_child(dev->of_node, NULL);
+	if (!chip_np)
+		return dev_err_probe(dev, -ENODEV, "failed to get child node for NAND chip\n");
+
+	chip->controller = &host->controller;
+	chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA | NAND_BROKEN_XD;
+	chip->buf_align = 16;
+	nand_set_controller_data(chip, host);
+	nand_set_flash_node(chip, chip_np);
+
+	mtd->dev.parent = dev;
+	mtd->name = "ls1x-nand";
+	mtd->owner = THIS_MODULE;
+
+	ret = nand_scan(chip, 1);
+	if (ret) {
+		of_node_put(chip_np);
+		return ret;
+	}
+
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		dev_err(dev, "failed to register MTD device! %d\n", ret);
+		nand_cleanup(chip);
+		of_node_put(chip_np);
+	}
+
+	return ret;
+}
+
+static int ls1x_nand_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct ls1x_nand_data *data;
+	struct ls1x_nand_host *host;
+	struct resource *res;
+	int ret;
+
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -ENODEV;
+
+	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	if (!host)
+		return -ENOMEM;
+
+	host->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(host->reg_base))
+		return PTR_ERR(host->reg_base);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand-dma");
+	host->dma_base = dma_map_resource(dev, res->start, resource_size(res),
+					  DMA_BIDIRECTIONAL, 0);
+	if (dma_mapping_error(dev, host->dma_base))
+		return -ENXIO;
+
+	nand_controller_init(&host->controller);
+
+	host->dev = dev;
+	host->data = data;
+	host->controller.ops = &ls1x_nand_controller_ops;
+
+	ret = ls1x_nand_controller_init(host);
+	if (ret)
+		goto err;
+
+	ret = ls1x_nand_chip_init(host);
+	if (ret)
+		goto err;
+
+	platform_set_drvdata(pdev, host);
+
+	return 0;
+err:
+	ls1x_nand_controller_cleanup(host);
+
+	return ret;
+}
+
+static void ls1x_nand_remove(struct platform_device *pdev)
+{
+	struct ls1x_nand_host *host = platform_get_drvdata(pdev);
+	struct nand_chip *chip = &host->chip;
+	int ret;
+
+	ret = mtd_device_unregister(nand_to_mtd(chip));
+	WARN_ON(ret);
+	nand_cleanup(chip);
+	ls1x_nand_controller_cleanup(host);
+}
+
+static const struct ls1x_nand_data ls1b_nand_data = {
+	.status_field = GENMASK(15, 8),
+	.hold_cycle = 0x2,
+	.wait_cycle = 0xc,
+	.parse_address = ls1b_nand_parse_address,
+};
+
+static const struct ls1x_nand_data ls1c_nand_data = {
+	.status_field = GENMASK(23, 16),
+	.op_scope_field = GENMASK(29, 16),
+	.hold_cycle = 0x2,
+	.wait_cycle = 0xc,
+	.parse_address = ls1c_nand_parse_address,
+};
+
+static const struct of_device_id ls1x_nand_match[] = {
+	{
+		.compatible = "loongson,ls1b-nand-controller",
+		.data = &ls1b_nand_data,
+	},
+	{
+		.compatible = "loongson,ls1c-nand-controller",
+		.data = &ls1c_nand_data,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ls1x_nand_match);
+
+static struct platform_driver ls1x_nand_driver = {
+	.probe = ls1x_nand_probe,
+	.remove = ls1x_nand_remove,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = ls1x_nand_match,
+	},
+};
+
+module_platform_driver(ls1x_nand_driver);
+
+MODULE_AUTHOR("Keguang Zhang <keguang.zhang@gmail.com>");
+MODULE_DESCRIPTION("Loongson-1 NAND Controller Driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0



