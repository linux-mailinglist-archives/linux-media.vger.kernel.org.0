Return-Path: <linux-media+bounces-18414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 826C197D4AA
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 13:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD5491C21FBD
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 11:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BC21459EA;
	Fri, 20 Sep 2024 11:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hb+QmlIK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE11113A268;
	Fri, 20 Sep 2024 11:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726831137; cv=none; b=K+KF1Sb+sr0KzlE9ox4PMpt+n0F15Www0RhyU1zi4F8ax1HaF0WqC6bN6JaOpVOdzIIiqO2//1hPb550vWHZY2DsXVCkIayevUIuASFzXuIanIgBe6yADiRvL3DjIhLoi8UPKe6mlx7PUF2jxhV2P+df1s5CCcV1nsERN62wjPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726831137; c=relaxed/simple;
	bh=Gjm/OXw8AryyA1/fNIlK2HMCrdcZH4b/R9DMBkpA7VE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=peNY6quXFoF6HFYgB/vPApw/nedO7IzgAXAGHYHJZaw9Ob7r9svbg3xyTpIoGz9LXltoXfeGJPAqPtIffeVzWWIUJMMLo0x9qbagm4Z0lcPQ0PTNEN4eamDMtXHjVRn+AniLxCAxKtzoqcBn+AWmGUpbKFXoSrtbNE7OBcWzqB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hb+QmlIK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42830C4CEC3;
	Fri, 20 Sep 2024 11:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726831137;
	bh=Gjm/OXw8AryyA1/fNIlK2HMCrdcZH4b/R9DMBkpA7VE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Hb+QmlIKCvIlhOiJ9vJuC0V6H/rHbiy58toxZc5K+5tQu0I7fSwRy3IZMP3QHvZ1t
	 1xg6zfW3KK1EqUFc271G/q15ZeyeQFwAm/Da69vDCzoU6QgiXAHrog15V/wx9mqm0J
	 KA3njhNj85Ryt6A5BV/K9JztN5u0sfXucGC72Ec/YWlHUtzATkYDJ4vk1eJ2pxK5O5
	 kkJbwk4bMPiJ7jGpEK0mWwe0Mffpf30jkRWH/5Wj7hnnXJdFBdUm23JYd0M4dP4ouU
	 ak0vN//1/uN8GxPOp6YxK2M5UQAfal9p6/a9WcwYWvnEsCf2U58ZQNN5Vg38acCmTF
	 CEjCs/rRDSHxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E61C78829;
	Fri, 20 Sep 2024 11:18:57 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Subject: [PATCH v9 0/2] Add support for Loongson-1 NAND
Date: Fri, 20 Sep 2024 19:18:52 +0800
Message-Id: <20240920-loongson1-nand-v9-0-9cc7b9345a03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABxa7WYC/2WOzW7DIBAGXyXiXKzlpyzuqe9R5UDxYqPGUEFit
 Y387sVRq0TJZaXvMLNzZpVKpMpedmdWaIk15tRG/7RjfnJpJB6HtpkEqUEJww85p7HmJHhyaeC
 9VRIHRIJgWIM+C4X4dRG+7dsOJc/8OBVy/xoBz+1KLYXqsAfkgn/QeGq/up/t4+s4u3jofJ433
 xTrMZfvS99iNutfisT7lMVw4Bh6JYSnABJuTFvKgldcK3jAseEG0KJXQgen73F7xS3YB9w23Pd
 mIKeFfdfiFl/X9RdTr3CGagEAAA==
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726831135; l=3339;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=Gjm/OXw8AryyA1/fNIlK2HMCrdcZH4b/R9DMBkpA7VE=;
 b=q7t6wP+CKt0Ahu7sAppj6dtSYbC4IZd4qMaPVejH+1Li+NItb/JHeT0K6k6juHKYOtWTBL7y0
 nA18aZZWJDoCFpw4Sx5CZYKjbUo3BnKJEoxZdcOzH85OT6WvzuMRuG/
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

Add the driver and dt-binding document for Loongson-1 NAND.

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
 drivers/mtd/nand/raw/loongson1_nand.c              | 824 +++++++++++++++++++++
 5 files changed, 908 insertions(+)
---
base-commit: 62f92d634458a1e308bb699986b9147a6d670457
change-id: 20240316-loongson1-nand-98327d77e0f6

Best regards,
-- 
Keguang Zhang <keguang.zhang@gmail.com>



