Return-Path: <linux-media+bounces-18963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8397E98CE6F
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 10:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 078EE1F21A03
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 08:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217EE194C69;
	Wed,  2 Oct 2024 08:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZIKvPnO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7508B193436;
	Wed,  2 Oct 2024 08:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727856659; cv=none; b=MmSy7wlhKVUkSKUQw+L0JR+7qQYAFSc9z/sx7WOEsm1GiwuEdN+Eat7d4TR6oK4+it8/B943q7Z7cgeKP6w+Q9nsEu70h9HV0XQQIJWIZXjg09X0TrkPxMEOMJqCSg4tuPGv8ABnNvZfahowqWo0wXmn1vs+TNOAXTXB991PCR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727856659; c=relaxed/simple;
	bh=78nozp/Mc27LH8gzkmfEGw4bmdaczO2JoemMKWTqfuM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tCdFXJa39coumi68Qeg6JqqI8kFr73XxaiD5nSObYrRMoWFxtEglQznffqM/ZlnLKRqjvbOYWQ9NLzO4VH7r0D01w3+Q457xTT9TNYZ9kAzDzpajmhF5mfuJvWONTB/AV7JjEGelfevno3AEPsXQJtn6tvLJeKRaqtJ2X3zvRqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZIKvPnO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04D41C4CEC5;
	Wed,  2 Oct 2024 08:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727856659;
	bh=78nozp/Mc27LH8gzkmfEGw4bmdaczO2JoemMKWTqfuM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jZIKvPnOEE7prazEgXSs6vnu0ylA6rLmfutcuHtTinDJvaNSt0LVBtTDOByY/4w+/
	 tgPtxWKnehZ65PvabEvZEixrTx/VpLrZnTRT7KushAW/BhAW4XxGMQUjmYuW4ldUI1
	 t3Ooo8mQI/4Lsib426C9wn4ZcngzQ53pYLXFfnVmDun0zK3ZydC4oC5Dcwmj+eeZG1
	 IHF+vKmFFS5nYHsbk64IkhgJRbeUt7T5fkgZiUH69C8sVI7lN1Dfgyp/PiTdjLKReK
	 k2X7CKh7pXtfULc1OWpTRal0CEtGZMcHPVwtUQ8g84aNxj8I5uqC2Re4Iiv7iZhC6e
	 ZpVIfwWCb61Jw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E629ECF319C;
	Wed,  2 Oct 2024 08:10:58 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Subject: [PATCH v10 0/2] Add support for Loongson-1 NAND
Date: Wed, 02 Oct 2024 16:10:44 +0800
Message-Id: <20241002-loongson1-nand-v10-0-17162eff80e2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAQA/WYC/2XOTW7DIBAF4KtErIs1/ISBrnqPKguCwUaNocKJ1
 Tby3YujVo7sDdIgfe+9Oxl9iX4kr4c7KX6KY8ypHgxeDsT1NnWexrZ+EA5cgmCKXnJO3ZgTo8m
 mlhotOLaIHoIiFX0WH+LXI/H9VO9Q8kCvffH2P4bBsb5cciYaNICU0Q/f3WpX87M0vnWDjZfG5
 WHJ6+N4zeX7MXBSS+rfFI7bKZOiQDEYwZjzATg8JS1TJly5FLDjWLkC1OgEk8HKLdcr16B3XFf
 ujGq9lUyfJdtys3LD9+2mcuMcno2QRwvimc/z/Au17NJxqgEAAA==
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727856656; l=3730;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=78nozp/Mc27LH8gzkmfEGw4bmdaczO2JoemMKWTqfuM=;
 b=Oxe63gylG8lnRhj7McdoIlvfA4KFcZDbC9qmCo9II6XObHzTiFewE4kKx/2hBPpJ1K9suJZPx
 LJcBroLOp6dCIiZA4p2b9sa0ewHN2t+T+CyWOblDJI2txCZHblaZeat
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

Add the driver and dt-binding document for Loongson-1 NAND.

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

 .../mtd/loongson,ls1b-nand-controller.yaml         |  75 ++
 MAINTAINERS                                        |   1 +
 drivers/mtd/nand/raw/Kconfig                       |   7 +
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/loongson1_nand.c              | 825 +++++++++++++++++++++
 5 files changed, 909 insertions(+)
---
base-commit: fe21733536749bb1b31c9c84e0b8d2ab8d82ce13
change-id: 20240316-loongson1-nand-98327d77e0f6

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>



