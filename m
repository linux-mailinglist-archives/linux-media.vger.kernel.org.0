Return-Path: <linux-media+bounces-23568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ED99F4914
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 11:41:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2695218827AA
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 10:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7981EB9FF;
	Tue, 17 Dec 2024 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HiWRioGg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7809B1E2611;
	Tue, 17 Dec 2024 10:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734432072; cv=none; b=eGp7G0r8QPQJPvD3BJF2m3NieMdJB2fFIe0PY9Btuje4JCmd0QKa5lyj0Y/4qqVCUknUNDaSvMIJ8hAoSiG4L/B2EyBVvhSXdibjGjoRCdxn1i4jVdYC3+Klp0fMr4EzvKP8S5fLT1/T/jJF+tRs0GMLHmZbTzUF46YSkJfHIRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734432072; c=relaxed/simple;
	bh=9mRoE7wM4QwVj6qUPEjFIQ8Rbd3kLri9AMpGTcwBN7E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y1f4qf01qYff4eUJoZMv8aNDCxtqTMKn4+58I430Tl/9frgxgPAoCEwxIXPnQUaCIvallQAcebvgy/b4dl6JBroS5ZgsQV3iu+PaC1qyeRoMny0EO51/rCXstRUx7hmTPT5wa+O2zQhXKFTKrJO9c0LYOAnL0wGZwuJLJr/EvQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HiWRioGg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F328CC4CED3;
	Tue, 17 Dec 2024 10:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734432072;
	bh=9mRoE7wM4QwVj6qUPEjFIQ8Rbd3kLri9AMpGTcwBN7E=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=HiWRioGgfudBK/kg5blCgrhJcGPJyToJBBnvvYHIaVlANCzORz2CGZmL8MPRKvgQ8
	 SlN91qzeHviOWTyoNl4MWZzIZCiQZ7ruvjJUz0eyOzfLhpuaCcjpZz04AoW0tvHg1w
	 P9Ptf/49I+3FXpVFJaRvAnRmsX1XDKhtyJnboKmsmaiJkQ3GIjwKLAfjYfoBMjfP73
	 4+2MgJfB8PDKoIRX7OhOK2zIbzXlLwHf6FdXipourdgJODPoz5yzlo92dvlP7+XF98
	 iPILxy5kQrV2nuOfldMNht15msp9vRc8bkbLHqmrEQjf0g9MAkDJLsDGXhGt/wLF9A
	 oYj7ZekiUNWpw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4771E7717F;
	Tue, 17 Dec 2024 10:41:11 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Subject: [PATCH v11 0/2] Add support for Loongson-1 NAND
Date: Tue, 17 Dec 2024 18:16:48 +0800
Message-Id: <20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJBPYWcC/2XOQW7DIBAF0KtEXhdrBggDWfUeVRcEg40aQ2WnV
 tvIdy+O2jqyN0iD9P7/t2r0Q/RjdTrcqsFPcYw5lQPx6VC5zqbWs9iUj4oDlyBQsUvOqR1zQpZ
 sapjRglND5CGoqqD3wYf4eU98eS13GHLPrt3g7V8MwrG8XHIUNRkghuzNtx+lq/5eGp/b3sZL7
 XK/5HVxvObh6z5wUkvq7xRO2ymTYsAoGIHofAAOD0nLlIlWLgXsOBWugDQ5gTJYueV65Rr0juv
 CnVGNtxL1WeKWm5Ubvm83hRvn6GyEPFoQW47w7xGA7zxCCUBCxX0IGjx/DJjn+Qec4hrd6wEAA
 A==
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734432069; l=4270;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=9mRoE7wM4QwVj6qUPEjFIQ8Rbd3kLri9AMpGTcwBN7E=;
 b=I8AtOD+L2TcFkaKK76hI6nw1kA+M+mN2JN9yg2se3S340Oc9pbxFOzlTfZIJzIfpugBZHwuuk
 Pe4BS7gW5+KCDUPkr9rHbxp2fuROL4UG4Efn0dFy+VM6TcQILfqsep6
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

Add the driver and dt-binding document for Loongson-1 NAND.

Changes in v11:
- Remove the requirement for 'nand-use-soft-ecc-engine' and 'nand-ecc-algo'.
- Add 'reg-names' to support DMA address.
- Move the DMA address to DT.
- Rename the source file to 'loongson1-nand-controller.c'.
- Improve the logic of ls1x_nand_op_cmd_mapping().
- Improve the logic of ls1x_nand_check_op() to exclude unsupported cases.
- Substitute 'host' for the improper term 'nfc'.
- Some minor fixes and adjustments.
- Link to v10: https://lore.kernel.org/r/20241002-loongson1-nand-v10-0-17162eff80e2@gmail.com

Changes in v10:                                                                                                                                              
- Fix the build error reported by kernel test robot.
  Link: https://lore.kernel.org/oe-kbuild-all/202409220010.vctkHddZ-lkp@intel.com
- Link to v9: https://lore.kernel.org/r/20240920-loongson1-nand-v9-0-9cc7b9345a03@gmail.com

Changes in v9:
- Change the compatible to 'loongson,ls1*-nand-controller'.
- Rename the dt-binding file to loongson,ls1b-nand-controller.yaml.
- Update MAINTAINERS file accordingly.
- Some minor adjustments.
- Rebasing due to recent upstream changes.
- Link to v8: https://lore.kernel.org/r/20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com

Changes in v8:
- Add a description part.
- Adjust the compatible because the match data for ls1c-nfc differs from ls1b-nfc.
- Mark 'nand-use-soft-ecc-engine' and 'nand-ecc-algo' as mandatory.
- Delete the superfluous blank lines.
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
- Link to v7: https://lore.kernel.org/r/20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com

Changes in v7:
- Rename the file to loongson,ls1b-nfc.yaml
- Rename the Kconfig dependency to LOONGSON1_APB_DMA
- Link to v6: https://lore.kernel.org/r/20240327-loongson1-nand-v6-0-7f9311cef020@gmail.com

Changes in v6:
- Amend Kconfig
- Add the dt-binding document
- Modify nand_read_subpage() to allow subpage read by a single operation
- Add DT support for driver
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

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
Keguang Zhang (2):
      dt-bindings: mtd: Add Loongson-1 NAND Controller
      mtd: rawnand: Add Loongson-1 NAND Controller Driver

 .../mtd/loongson,ls1b-nand-controller.yaml         |  71 ++
 MAINTAINERS                                        |   1 +
 drivers/mtd/nand/raw/Kconfig                       |   7 +
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/loongson1-nand-controller.c   | 885 +++++++++++++++++++++
 5 files changed, 965 insertions(+)
---
base-commit: fdb298fa865b0136f7be842e6c2e6310dede421a
change-id: 20240316-loongson1-nand-98327d77e0f6

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>



