Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EAF81CCBE4
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2020 17:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729267AbgEJPOl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 May 2020 11:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729264AbgEJPOk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 May 2020 11:14:40 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29B48C061A0E;
        Sun, 10 May 2020 08:14:40 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id i15so7678375wrx.10;
        Sun, 10 May 2020 08:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yiL2tcabQtZNrRAU/oMLA5eE5aSSg/TjZU7sFTCXXN4=;
        b=ckUlrDuQ0zm6rn6qcAsAGwsaDfCJw3scCynfrSkGG8YUBvYGWO2QDHzLngz7WC3XNS
         6j4y+pWUinVujnBYPHAvCbn2aCy49TgTAJSQ6WCh9RPGZPyMFXXpa4VdspvLJv0XpTFE
         5XI5NX0yjDmHPMemYCZEU2IYL5itIZGYDIR63Ol2zrC0VQ5q9W1UCQ3x0v2p+tOyq490
         YauzUNzP5QgmTE/voH124WkiYaVBu4Yxob7V+5Wb1Q+sj/HVIlwzBqHHMBC48HEgzoHI
         ZhXpsnyMKooSiHqHECEaDQocfaowjw5VVZJ39qFqxxg1WH4tlZzLaqCxGyJVcPJxkfat
         gLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yiL2tcabQtZNrRAU/oMLA5eE5aSSg/TjZU7sFTCXXN4=;
        b=UpL7a+5azzK2LyQixZWMKqbkIfcKzTIA/fuAQ5omhoe3270qNdzLv+qqpRJxI2anud
         LrLjRIROr3tnvOZPfIleS9rAZH8qcU+1Esk/FnJWiVGU8QCM5+0TLY9OHF0bj/+yEa/3
         smFbf89SB0UqKStEwnMLXtdNjeuDjtY1CzNW3w2dUOQtMBqKv5VdVRcd0jcJDH7d2gUy
         sFna73WSB5/bWBQrzG5bLGyUMPMCtUoLXj/IEPDTMZFrElLxKWuztB6mPWnAqZzRz+Aj
         e/bFP8kFJwAiemUHSRO73T6yiRUWmyYFrYrXVwUCrfS0FwLlQplnqXsaZKtaT0nkt2Wx
         EyXg==
X-Gm-Message-State: AGi0Pua76p0cYVpRuIFrQjmvSyNs3TkZa/r37XXyVZjd0ICRfKVGBDi/
        OHdRFoP9cD1ofDpL/St33KwbnrPtsEs=
X-Google-Smtp-Source: APiQypKCRMY/lFgd4MaeiDb3UBHqQ/6/dIiXz2n5GB8T9aqaTh4Zsfk4c54EfFkDgBBpbRto7oU3jw==
X-Received: by 2002:adf:fa04:: with SMTP id m4mr13746562wrr.30.1589123678844;
        Sun, 10 May 2020 08:14:38 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net. [83.49.57.198])
        by smtp.gmail.com with ESMTPSA id d133sm25176897wmc.27.2020.05.10.08.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 08:14:38 -0700 (PDT)
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
Subject: [PATCH 3/3] nand: brcmnand: support v2.1-v2.2 controllers
Date:   Sun, 10 May 2020 17:14:06 +0200
Message-Id: <20200510151406.2527856-3-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510151406.2527856-1-noltari@gmail.com>
References: <20200510151406.2527856-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tested on Netgear DGND3700v2 (BCM6362 with v2.2 controller).

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 76 +++++++++++++++++++++---
 1 file changed, 67 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 72b268d8e3a4..718c601d0e59 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -338,6 +338,36 @@ enum brcmnand_reg {
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
@@ -571,12 +601,16 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
 {
 	static const unsigned int block_sizes_v6[] = { 8, 16, 128, 256, 512, 1024, 2048, 0 };
 	static const unsigned int block_sizes_v4[] = { 16, 128, 8, 512, 256, 1024, 2048, 0 };
-	static const unsigned int page_sizes[] = { 512, 2048, 4096, 8192, 0 };
+	static const unsigned int block_sizes_v2_2[] = { 16, 128, 8, 512, 256, 0 };
+	static const unsigned int block_sizes[] = { 16, 128, 8, 512, 0 };
+	static const unsigned int page_sizes_v3_4[] = { 512, 2048, 4096, 8192, 0 };
+	static const unsigned int page_sizes_v2_2[] = { 512, 2048, 4096, 0 };
+	static const unsigned int page_sizes[] = { 512, 2048, 0 };
 
 	ctrl->nand_version = nand_readreg(ctrl, 0) & 0xffff;
 
-	/* Only support v4.0+? */
-	if (ctrl->nand_version < 0x0400) {
+	/* Only support v2.1+ */
+	if (ctrl->nand_version < 0x0201) {
 		dev_err(ctrl->dev, "version %#x not supported\n",
 			ctrl->nand_version);
 		return -ENODEV;
@@ -593,6 +627,8 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
 		ctrl->reg_offsets = brcmnand_regs_v50;
 	else if (ctrl->nand_version >= 0x0303)
 		ctrl->reg_offsets = brcmnand_regs_v33;
+	else if (ctrl->nand_version >= 0x0201)
+		ctrl->reg_offsets = brcmnand_regs_v21;
 
 	/* Chip-select stride */
 	if (ctrl->nand_version >= 0x0701)
@@ -618,14 +654,27 @@ static int brcmnand_revision_init(struct brcmnand_controller *ctrl)
 		ctrl->max_page_size = 16 * 1024;
 		ctrl->max_block_size = 2 * 1024 * 1024;
 	} else {
-		ctrl->page_sizes = page_sizes;
+		if (ctrl->nand_version >= 0x0304)
+			ctrl->page_sizes = page_sizes_v3_4;
+		else if (ctrl->nand_version >= 0x0202)
+			ctrl->page_sizes = page_sizes_v2_2;
+		else
+			ctrl->page_sizes = page_sizes;
+
 		if (ctrl->nand_version >= 0x0600)
 			ctrl->block_sizes = block_sizes_v6;
-		else
+		else if (ctrl->nand_version >= 0x0400)
 			ctrl->block_sizes = block_sizes_v4;
+		else if (ctrl->nand_version >= 0x0202)
+			ctrl->block_sizes = block_sizes_v2_2;
+		else
+			ctrl->block_sizes = block_sizes;
 
 		if (ctrl->nand_version < 0x0400) {
-			ctrl->max_page_size = 4096;
+			if (ctrl->nand_version < 0x0202)
+				ctrl->max_page_size = 2048;
+			else
+				ctrl->max_page_size = 4096;
 			ctrl->max_block_size = 512 * 1024;
 		}
 	}
@@ -811,6 +860,9 @@ static void brcmnand_wr_corr_thresh(struct brcmnand_host *host, u8 val)
 	enum brcmnand_reg reg = BRCMNAND_CORR_THRESHOLD;
 	int cs = host->cs;
 
+	if (!ctrl->reg_offsets[reg])
+		return;
+
 	if (ctrl->nand_version == 0x0702)
 		bits = 7;
 	else if (ctrl->nand_version >= 0x0600)
@@ -869,8 +921,10 @@ static inline u32 brcmnand_spare_area_mask(struct brcmnand_controller *ctrl)
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
@@ -2390,9 +2444,11 @@ static int brcmnand_set_cfg(struct brcmnand_host *host,
 
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
@@ -2766,6 +2822,8 @@ const struct dev_pm_ops brcmnand_pm_ops = {
 EXPORT_SYMBOL_GPL(brcmnand_pm_ops);
 
 static const struct of_device_id brcmnand_of_match[] = {
+	{ .compatible = "brcm,brcmnand-v2.1" },
+	{ .compatible = "brcm,brcmnand-v2.2" },
 	{ .compatible = "brcm,brcmnand-v4.0" },
 	{ .compatible = "brcm,brcmnand-v5.0" },
 	{ .compatible = "brcm,brcmnand-v6.0" },
-- 
2.26.2

