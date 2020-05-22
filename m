Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE78D1DE0D8
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 09:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbgEVHZj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 03:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728778AbgEVHZf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 03:25:35 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B3FDC08C5C0;
        Fri, 22 May 2020 00:25:35 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id s8so9118069wrt.9;
        Fri, 22 May 2020 00:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eb0Vvf67rVnazNcMPHX6Y7dfwQbwJ0jDZhP20gwkoLk=;
        b=De7wwE5fF3blXyTuC4cSp42NJzC6yaCj0CKN8qQCbbuP2gBYuQq5StBCdCkAnCeenW
         yF4KFHvpiO6QWroo2Gnj+wW+jSlzyTaIfcBXEIE8Etf6NoAsD8s/Z2Q02gHLWNrCxtDx
         IhMDc1SEpGGvTWA8rQLU3ebrP6CpP1aHUEFdDv5pWXoSTdJUlMsFYhmQzPC3+vzCAB0a
         e8LJeNpfno01shi8glSUbGVAi8PLGrkavaNDBy0mkkvXPdYrDyur9xqmM9ZC1LodglG0
         9v2p/oo19igMvpvqcvUP4Lstfhnemd02fdzdTOTqttLa+hkuzU5oxbhGHkpCGI11opeT
         fL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eb0Vvf67rVnazNcMPHX6Y7dfwQbwJ0jDZhP20gwkoLk=;
        b=KxInQrAf7p+j/8R3NNpN9GbAh1H4604B8fVd1be92tyGz97R98IufDElf9JkF+oNqR
         laDTJpu3c/eJ4Nv5A9g4lSqacdrLZJVKcdy5ypDrGZhKTX4hL/ggh+NCUBsi6s+xOcRO
         Uittf406vmnv2xnKMmmGrZ7nlVy6Hxt/8c7fdcmO+HZOa2Gl+yJHNt8WV+jn5Wk9F42L
         uS9R/bxBr3PS1O7CJWMvOT6Rq6t22sg3ACkC8MwDKQII9vH4OO/Y2NMXEa0qDNmDamiQ
         18Ko88MWBIBs91bPkktHgL626WFGA1visuT7Rwaxj7Nai0CnwZDGFNhgmAY8ML+bAaTx
         3Xcg==
X-Gm-Message-State: AOAM533/8r/MnVzLSyqjcj164ey1aWx/3mVqQu6GzUP23+GITXWVC/6i
        R2vJakjcIMCJIK8mkUsJpAjS/5dayfM=
X-Google-Smtp-Source: ABdhPJwr2iUwrOYo5UFxFKNzSAHgDmpzK4R2WJ2xeTruftnuJH1G+oIOnRpZkHlFx8+bGdpZRNCDDw==
X-Received: by 2002:adf:ef47:: with SMTP id c7mr2372820wrp.57.1590132333608;
        Fri, 22 May 2020 00:25:33 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net. [83.44.12.159])
        by smtp.gmail.com with ESMTPSA id f128sm9299898wme.1.2020.05.22.00.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 00:25:33 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     computersforpeace@gmail.com, kdasu.kdev@gmail.com,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v3 5/5] nand: brcmnand: support v2.1-v2.2 controllers
Date:   Fri, 22 May 2020 09:25:25 +0200
Message-Id: <20200522072525.3919332-6-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522072525.3919332-1-noltari@gmail.com>
References: <20200512073329.742893-1-noltari@gmail.com>
 <20200522072525.3919332-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v2.1: tested on Netgear DGND3700v1 (BCM6368)
v2.2: tested on Netgear DGND3700v2 (BCM6362)

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v3: fix page size shift for v2.1 controllers.
 v2: split page sizes rename into a different patch.
     name all block and page sizes versions.

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 85 +++++++++++++++++++++---
 1 file changed, 76 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index ef60dbbeac2b..2c8a468c2e38 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -264,6 +264,7 @@ struct brcmnand_controller {
 	const unsigned int	*block_sizes;
 	unsigned int		max_page_size;
 	const unsigned int	*page_sizes;
+	unsigned int		page_size_shift;
 	unsigned int		max_oob;
 	u32			features;
 
@@ -338,6 +339,36 @@ enum brcmnand_reg {
 	BRCMNAND_FC_BASE,
 };
 
+/* BRCMNAND v2.1-v2.2 */
+static const u16 brcmnand_regs_v21[] = {
+	[BRCMNAND_CMD_START]		=  0x04,
+	[BRCMNAND_CMD_EXT_ADDRESS]	=  0x08,
+	[BRCMNAND_CMD_ADDRESS]		=  0x0c,
+	[BRCMNAND_INTFC_STATUS]		=  0x5c,
+	[BRCMNAND_CS_SELECT]		=  0x14,
+	[BRCMNAND_CS_XOR]		=  0x18,
+	[BRCMNAND_LL_OP]		=     0,
+	[BRCMNAND_CS0_BASE]		=  0x40,
+	[BRCMNAND_CS1_BASE]		=     0,
+	[BRCMNAND_CORR_THRESHOLD]	=     0,
+	[BRCMNAND_CORR_THRESHOLD_EXT]	=     0,
+	[BRCMNAND_UNCORR_COUNT]		=     0,
+	[BRCMNAND_CORR_COUNT]		=     0,
+	[BRCMNAND_CORR_EXT_ADDR]	=  0x60,
+	[BRCMNAND_CORR_ADDR]		=  0x64,
+	[BRCMNAND_UNCORR_EXT_ADDR]	=  0x68,
+	[BRCMNAND_UNCORR_ADDR]		=  0x6c,
+	[BRCMNAND_SEMAPHORE]		=  0x50,
+	[BRCMNAND_ID]			=  0x54,
+	[BRCMNAND_ID_EXT]		=     0,
+	[BRCMNAND_LL_RDATA]		=     0,
+	[BRCMNAND_OOB_READ_BASE]	=  0x20,
+	[BRCMNAND_OOB_READ_10_BASE]	=     0,
+	[BRCMNAND_OOB_WRITE_BASE]	=  0x30,
+	[BRCMNAND_OOB_WRITE_10_BASE]	=     0,
+	[BRCMNAND_FC_BASE]		= 0x200,
+};
+
 /* BRCMNAND v3.3-v4.0 */
 static const u16 brcmnand_regs_v33[] = {
 	[BRCMNAND_CMD_START]		=  0x04,
@@ -536,6 +567,9 @@ enum {
 	CFG_BUS_WIDTH			= BIT(CFG_BUS_WIDTH_SHIFT),
 	CFG_DEVICE_SIZE_SHIFT		= 24,
 
+	/* Only for v2.1 */
+	CFG_PAGE_SIZE_SHIFT_v2_1	= 30,
+
 	/* Only for pre-v7.1 (with no CFG_EXT register) */
 	CFG_PAGE_SIZE_SHIFT		= 20,
 	CFG_BLK_SIZE_SHIFT		= 28,
@@ -571,12 +605,16 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
 {
 	static const unsigned int block_sizes_v6[] = { 8, 16, 128, 256, 512, 1024, 2048, 0 };
 	static const unsigned int block_sizes_v4[] = { 16, 128, 8, 512, 256, 1024, 2048, 0 };
+	static const unsigned int block_sizes_v2_2[] = { 16, 128, 8, 512, 256, 0 };
+	static const unsigned int block_sizes_v2_1[] = { 16, 128, 8, 512, 0 };
 	static const unsigned int page_sizes_v3_4[] = { 512, 2048, 4096, 8192, 0 };
+	static const unsigned int page_sizes_v2_2[] = { 512, 2048, 4096, 0 };
+	static const unsigned int page_sizes_v2_1[] = { 512, 2048, 0 };
 
 	ctrl->nand_version = nand_readreg(ctrl, 0) & 0xffff;
 
-	/* Only support v4.0+? */
-	if (ctrl->nand_version < 0x0400) {
+	/* Only support v2.1+ */
+	if (ctrl->nand_version < 0x0201) {
 		dev_err(ctrl->dev, "version %#x not supported\n",
 			ctrl->nand_version);
 		return -ENODEV;
@@ -593,6 +631,8 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
 		ctrl->reg_offsets = brcmnand_regs_v50;
 	else if (ctrl->nand_version >= 0x0303)
 		ctrl->reg_offsets = brcmnand_regs_v33;
+	else if (ctrl->nand_version >= 0x0201)
+		ctrl->reg_offsets = brcmnand_regs_v21;
 
 	/* Chip-select stride */
 	if (ctrl->nand_version >= 0x0701)
@@ -618,14 +658,32 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
 		ctrl->max_page_size = 16 * 1024;
 		ctrl->max_block_size = 2 * 1024 * 1024;
 	} else {
-		ctrl->page_sizes = page_sizes_v3_4;
+		if (ctrl->nand_version >= 0x0304)
+			ctrl->page_sizes = page_sizes_v3_4;
+		else if (ctrl->nand_version >= 0x0202)
+			ctrl->page_sizes = page_sizes_v2_2;
+		else
+			ctrl->page_sizes = page_sizes_v2_1;
+
+		if (ctrl->nand_version >= 0x0202)
+			ctrl->page_size_shift = CFG_PAGE_SIZE_SHIFT;
+		else
+			ctrl->page_size_shift = CFG_PAGE_SIZE_SHIFT_v2_1;
+
 		if (ctrl->nand_version >= 0x0600)
 			ctrl->block_sizes = block_sizes_v6;
-		else
+		else if (ctrl->nand_version >= 0x0400)
 			ctrl->block_sizes = block_sizes_v4;
+		else if (ctrl->nand_version >= 0x0202)
+			ctrl->block_sizes = block_sizes_v2_2;
+		else
+			ctrl->block_sizes = block_sizes_v2_1;
 
 		if (ctrl->nand_version < 0x0400) {
-			ctrl->max_page_size = 4096;
+			if (ctrl->nand_version < 0x0202)
+				ctrl->max_page_size = 2048;
+			else
+				ctrl->max_page_size = 4096;
 			ctrl->max_block_size = 512 * 1024;
 		}
 	}
@@ -811,6 +869,9 @@ static void brcmnand_wr_corr_thresh(struct brcmnand_host *host, u8 val)
 	enum brcmnand_reg reg = BRCMNAND_CORR_THRESHOLD;
 	int cs = host->cs;
 
+	if (!ctrl->reg_offsets[reg])
+		return;
+
 	if (ctrl->nand_version == 0x0702)
 		bits = 7;
 	else if (ctrl->nand_version >= 0x0600)
@@ -869,8 +930,10 @@ static inline u32 brcmnand_spare_area_mask(struct brcmnand_controller *ctrl)
 		return GENMASK(7, 0);
 	else if (ctrl->nand_version >= 0x0600)
 		return GENMASK(6, 0);
-	else
+	else if (ctrl->nand_version >= 0x0303)
 		return GENMASK(5, 0);
+	else
+		return GENMASK(4, 0);
 }
 
 #define NAND_ACC_CONTROL_ECC_SHIFT	16
@@ -2378,7 +2441,7 @@ static int brcmnand_set_cfg(struct brcmnand_host *host,
 		(!!(cfg->device_width == 16) << CFG_BUS_WIDTH_SHIFT) |
 		(device_size << CFG_DEVICE_SIZE_SHIFT);
 	if (cfg_offs == cfg_ext_offs) {
-		tmp |= (page_size << CFG_PAGE_SIZE_SHIFT) |
+		tmp |= (page_size << ctrl->page_size_shift) |
 		       (block_size << CFG_BLK_SIZE_SHIFT);
 		nand_writereg(ctrl, cfg_offs, tmp);
 	} else {
@@ -2390,9 +2453,11 @@ static int brcmnand_set_cfg(struct brcmnand_host *host,
 
 	tmp = nand_readreg(ctrl, acc_control_offs);
 	tmp &= ~brcmnand_ecc_level_mask(ctrl);
-	tmp |= cfg->ecc_level << NAND_ACC_CONTROL_ECC_SHIFT;
 	tmp &= ~brcmnand_spare_area_mask(ctrl);
-	tmp |= cfg->spare_area_size;
+	if (ctrl->nand_version >= 0x0302) {
+		tmp |= cfg->ecc_level << NAND_ACC_CONTROL_ECC_SHIFT;
+		tmp |= cfg->spare_area_size;
+	}
 	nand_writereg(ctrl, acc_control_offs, tmp);
 
 	brcmnand_set_sector_size_1k(host, cfg->sector_size_1k);
@@ -2766,6 +2831,8 @@ const struct dev_pm_ops brcmnand_pm_ops = {
 EXPORT_SYMBOL_GPL(brcmnand_pm_ops);
 
 static const struct of_device_id brcmnand_of_match[] = {
+	{ .compatible = "brcm,brcmnand-v2.1" },
+	{ .compatible = "brcm,brcmnand-v2.2" },
 	{ .compatible = "brcm,brcmnand-v4.0" },
 	{ .compatible = "brcm,brcmnand-v5.0" },
 	{ .compatible = "brcm,brcmnand-v6.0" },
-- 
2.26.2

