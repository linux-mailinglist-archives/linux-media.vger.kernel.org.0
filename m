Return-Path: <linux-media+bounces-15993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD70C94BC2B
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 13:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F0F528326A
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 11:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8A818C33A;
	Thu,  8 Aug 2024 11:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nr3n7KQ2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010901891AC;
	Thu,  8 Aug 2024 11:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723116155; cv=none; b=jORDfHwajQA4FTQI78If7L2WJqeTdCgJLvoM04fA52fRuNYcMuFysu+vx4Kz4Q7AYE3cXGoi4o2TO91MdM9LkI4SN07QVxgc1fkftdi9lLr2CZaiDPfUtchFDunS7UNruh+BzZyBil7hCmH8HKg7KFub/WM4CffOyn18KUrBf7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723116155; c=relaxed/simple;
	bh=nMJ5ipPoSCdCFITUI50B1DzMLqNTR5+6qqFehLh2juA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ypd16OXCEGhMv2QHfm3ja3PSE9XUbXQ/IEyzZWtkz2JILjGd+45sJQdm2cXd3dZkyu6+PrNaNav0vk7qeb8oVcZNjaC35pH345WZ41Hil153HIkJAM9qLpADvGedUdBBuJvE9IllcKUtzgc0cWPrL1dXgMCBlkxOb137jdSFv2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nr3n7KQ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CF06C32782;
	Thu,  8 Aug 2024 11:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723116154;
	bh=nMJ5ipPoSCdCFITUI50B1DzMLqNTR5+6qqFehLh2juA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=nr3n7KQ2+kM4cwrQfrHGiZhMd4ZA0TutIyGIvhnJmoHdHFt/PhTTpL2YHc27umXOg
	 mVnHwq9xTt8B6GmXJUshhiggxB/X8uefBjGdY1gcBlCELUD80sfmgAMxt5X7NidLWs
	 z5mfl5yX2KNUbjDOkIrw2YbHK2G1YZSnWM7Cu0+swKt9BoQYhI8ZXye/wU+DvT2NLk
	 3wwc9CBCtlBEjrAmxNF85LKeYeCN1WXg5cJB+BT1SuUJQozleISOIVvNlTrJ8WZmZu
	 8/xRueOPd96XPkRVqi/hXG1lFFE70D7gERNGddLsM+7uoYJKU/puxD63oHf2WWEH0F
	 HFKiXfev8RI1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769E1C3DA4A;
	Thu,  8 Aug 2024 11:22:34 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Subject: [PATCH v8 0/2] Add support for Loongson-1 NAND
Date: Thu, 08 Aug 2024 19:22:18 +0800
Message-Id: <20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGqqtGYC/2WOzWrDMBAGXyXo3DWrn2jtnvIeoQdhr2zRWCpSY
 tIGv3vlkNLQXha+w8zOTRTOgYt43d1E5iWUkGId7ctO9JOLI0MY6hYKlUEtLZxSimNJUUJ0cYC
 u1YoGIkZvRYU+MvtwvQuPb3X7nGY4T5ndj0bivl5llNQNdUgg4Z3HS/3VfG0fD+Pswqnp07z5p
 lDOKX/e+xa7WR8piv6mLBYQyHdayp49KnwybSkL/eJG4z+cKm6RWuq1NN6ZZ3xd129Tf1ndKwE
 AAA==
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723116152; l=2926;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=nMJ5ipPoSCdCFITUI50B1DzMLqNTR5+6qqFehLh2juA=;
 b=WB92qpooblzVPCarQF1A6FPBQnb0XnrAJ63g7qCkxT/suSwku8yX8VdaX8mMH9VODx+DbYpiq
 Pb5ZboQF8kRCSSQIZ4JjCPwzhzr7BrZ9/cmJf+dTMtp2F0vzqZ0Eyu4
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

Add the driver and dt-binding document for Loongson-1 NAND.

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
      mtd: rawnand: Add Loongson-1 NAND Controller driver

 .../devicetree/bindings/mtd/loongson,ls1b-nfc.yaml |  75 ++
 drivers/mtd/nand/raw/Kconfig                       |   7 +
 drivers/mtd/nand/raw/Makefile                      |   1 +
 drivers/mtd/nand/raw/loongson1_nand.c              | 818 +++++++++++++++++++++
 4 files changed, 901 insertions(+)
---
base-commit: 222a3380f92b8791d4eeedf7cd750513ff428adf
change-id: 20240316-loongson1-nand-98327d77e0f6

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>



