Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 480811CECC4
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 08:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728871AbgELGAf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 02:00:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728853AbgELGAd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 02:00:33 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63AEAC061A0E;
        Mon, 11 May 2020 23:00:33 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id w19so7081159wmc.1;
        Mon, 11 May 2020 23:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i7Lx33UKkxslFdo8QHuCccIO/lqVvcYa4SP0ggmO3GI=;
        b=MSWdVSN2PLhXKmWdXV4InAQUewuHIILW49yuj24ZsC0PAzddqf+XEl8mKq9OYMAHx9
         WRPKn7ulJl19RDPCC0gGmokdlcFpcw9Utp3umxvAeJp6HPJewBiNhXS7H9CVkw18YvvF
         WlcYCfIG1mazchF7psTM+hBBrrhENC07BIJatzDGloq7yZOCD7sGDeBXIOBlmICk+ox0
         e1LHKyn09Nm79Dj3W+80eo71+FEQBVpZGU7HFmnKKh9mgA2grfZ/oAhzyN6eTHuijB3p
         XUpag0snJKkOQpuhPOeEyDL6AY838LBXSBF1feLHar3QK8VOhYWoHHeaxc9cnG5ActsN
         lF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i7Lx33UKkxslFdo8QHuCccIO/lqVvcYa4SP0ggmO3GI=;
        b=hMHxr34NV/M1qcrWywzFQKRmKUQTXSTURN6Dzq9xaMWpTpRAltcTVbTmZHtc7xWsHA
         x5mnE9IV43pKXZh+uXokWckMkWEFtq5LwZBouNI1mzWFj2jg5LJW3sSh2sgtVCQ1J6w5
         8O5lzbQhkcEsGUbfDksYa3B5vU9KdLZ+JP41nlBEYwfy5eQeyorG3AIU4ZKXP50+6qlq
         jM25WVxYaDPOcw1nyA373fgeuJQeeKFzWDsVm/CgOrNGh+gQFIs4HqlZv3KNTrUE5lz5
         Ll91z+7qmFl3DzXeTZejsYg5d3C38jyJMZldqPRoWU5j5cVOjU4rhiTZB13+/liLlxJF
         7XEA==
X-Gm-Message-State: AGi0PuZ+cllmZEECbDeMoCYZazKK7b7QrvnjI4Rw6cm/rGcbFFtGhJNZ
        YVPadnB/a+eL0YjeWZI4Z58=
X-Google-Smtp-Source: APiQypLR46CdyNcJlUI6nV5xgk1vjwfU9n2fBxYWf/SpCFTUy+EEps+/pDPxhOqWbF8EwnSlai0XgQ==
X-Received: by 2002:a1c:7fc6:: with SMTP id a189mr34970700wmd.27.1589263232092;
        Mon, 11 May 2020 23:00:32 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net. [83.49.57.198])
        by smtp.gmail.com with ESMTPSA id a13sm20539150wrv.67.2020.05.11.23.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 23:00:31 -0700 (PDT)
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
Subject: [PATCH v3 2/2] mtd: rawnand: brcmnand: improve hamming oob layout
Date:   Tue, 12 May 2020 08:00:23 +0200
Message-Id: <20200512060023.684871-3-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512060023.684871-1-noltari@gmail.com>
References: <20200504185945.2776148-1-noltari@gmail.com>
 <20200512060023.684871-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current code generates 8 oob sections:
S1	1-5
ECC	6-8
S2	9-15
S3	16-21
ECC	22-24
S4	25-31
S5	32-37
ECC	38-40
S6	41-47
S7	48-53
ECC	54-56
S8	57-63

Change it by merging continuous sections:
S1	1-5
ECC	6-8
S2	9-21
ECC	22-24
S3	25-37
ECC	38-40
S4	41-53
ECC	54-56
S5	57-63

Fixes: ef5eeea6e911 ("mtd: nand: brcm: switch to mtd_ooblayout_ops")
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v3: invert patch order
 v2: keep original comment and fix correctly skip byte 6 for small-page nand

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 37 ++++++++++++------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 1c1070111ebc..0a1d76fde37b 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1100,33 +1100,32 @@ static int brcmnand_hamming_ooblayout_free(struct mtd_info *mtd, int section,
 	struct brcmnand_cfg *cfg = &host->hwcfg;
 	int sas = cfg->spare_area_size << cfg->sector_size_1k;
 	int sectors = cfg->page_size / (512 << cfg->sector_size_1k);
+	u32 next;
 
-	if (section >= sectors * 2)
+	if (section > sectors)
 		return -ERANGE;
 
-	oobregion->offset = (section / 2) * sas;
+	next = (section * sas);
+	if (section < sectors)
+		next += 6;
 
-	if (section & 1) {
-		oobregion->offset += 9;
-		oobregion->length = 7;
+	if (section) {
+		oobregion->offset = ((section - 1) * sas) + 9;
 	} else {
-		oobregion->length = 6;
-
-		/* First sector of each page may have BBI */
-		if (!section) {
-			/*
-			 * Small-page NAND use byte 6 for BBI while large-page
-			 * NAND use bytes 0 and 1.
-			 */
-			if (cfg->page_size > 512) {
-				oobregion->offset += 2;
-				oobregion->length -= 2;
-			} else {
-				oobregion->length--;
-			}
+		/*
+		 * Small-page NAND use byte 6 for BBI while large-page
+		 * NAND use bytes 0 and 1.
+		 */
+		if (cfg->page_size > 512) {
+			oobregion->offset = 2;
+		} else {
+			oobregion->offset = 0;
+			next--;
 		}
 	}
 
+	oobregion->length = next - oobregion->offset;
+
 	return 0;
 }
 
-- 
2.26.2

