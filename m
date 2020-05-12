Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BAC81CEF0D
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 10:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728986AbgELIZR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 04:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725987AbgELIZQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 04:25:16 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82EE6C061A0C;
        Tue, 12 May 2020 01:25:16 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id e1so284576wrt.5;
        Tue, 12 May 2020 01:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dise/Ltq/8sPUlFw9YHaPR8/vtAeRgM3btPcexpNyWQ=;
        b=XC8k0dinPlJ2lvGmOqDpvhxBSveCJi3dXzkR0maYhVUJ9RsfihA8jhSuLsu+W/DjG4
         MATmPbXbdV/sUUhtFi3MzFv7YGK/rODp185eFekYg2Tk4PChrgd/cQtlKZxMWRJMcqE0
         FTxuQFoB0ThmDmizWbdg1N+IpDMqup4QGgGM1MnZKXNt4uX09n6JYWGGBXGh424j9sq1
         yuj5IvJT7xFOv5N8d8EfvSMaJKADZM+/wvwRF+LciyTT1O1FproupWDlLdfH8Y4rk/Ms
         EJ6+cLCT/xGpAGzm2orEoMmIjmcOHs110mVWphRhVSh+FXLNqmk+JtEmj7FHpOtFByyV
         NogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dise/Ltq/8sPUlFw9YHaPR8/vtAeRgM3btPcexpNyWQ=;
        b=Fbew90RZine/o6zKxQEGiwPC/fM9KUI2qDv5RkH0N4EDb/ZenuZiqQLRCMLwcqiwyp
         +CaXTWDg0ULkZVGyLD2FiGRTCK3EP10OVFucknKJL/gWEdBnMhWyRphjJr5r+jshaxxb
         QuRjXGTioTKdsRRVONvEwxlhI5kPL3STBrffMJkJ05bcFGDLOAB0wzFmYCFS048672mc
         yWzfh5nRwndvNbx3fEc8uYCUfgKr7mjRSNwTdbtqOKhBBB5pnLcgriv/sMFVNoRE3y4J
         TMc9YCLAYNe/MBmV+QKXfCnxvWP+xVfcb2Jxd+uJdHfS1VARN6Ux6a0a1kn/I6yJ1Yqn
         3W3Q==
X-Gm-Message-State: AGi0PuYESztc/Gdd2uUoEkRwPKnMWYLqwIFx93vfXZYz5SrPWWKx/0Tx
        AXM4tmNJ6mT6oT3+/PzE3gs=
X-Google-Smtp-Source: APiQypKTZOzCoXzgumrk5YfFOoibdoApMy36qfKw6hTJ2mEDbldC1ZxFTRmuKlE0M1lAGh6UcljBrw==
X-Received: by 2002:a5d:5105:: with SMTP id s5mr18599515wrt.202.1589271915167;
        Tue, 12 May 2020 01:25:15 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net. [83.49.57.198])
        by smtp.gmail.com with ESMTPSA id w82sm1809746wmg.28.2020.05.12.01.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 01:25:14 -0700 (PDT)
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
Subject: [PATCH v4] mtd: rawnand: brcmnand: correctly verify erased pages
Date:   Tue, 12 May 2020 10:24:51 +0200
Message-Id: <20200512082451.771212-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512065111.716801-1-noltari@gmail.com>
References: <20200512065111.716801-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current code checks that the whole OOB area is erased.
This is a problem when JFFS2 cleanmarkers are added to the OOB, since it will
fail due to the usable OOB bytes not being 0xff.
Correct this by only checking that data and ECC bytes aren't 0xff.

Fixes: 02b88eea9f9c ("mtd: brcmnand: Add check for erased page bitflips")
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v4: Use mtd_ooblayout_ecc function, rename oob to ecc_bytes and remove unused
     sas variable.
 v3: Fix commit log and merge nand_check_erased_ecc_chunk calls.
 v2: Add Fixes tag

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index e4e3ceeac38f..a001483b3614 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2018,28 +2018,31 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
 		  struct nand_chip *chip, void *buf, u64 addr)
 {
-	int i, sas;
-	void *oob = chip->oob_poi;
+	struct mtd_oob_region ecc;
+	int i;
 	int bitflips = 0;
 	int page = addr >> chip->page_shift;
 	int ret;
+	void *ecc_bytes;
 	void *ecc_chunk;
 
 	if (!buf)
 		buf = nand_get_data_buf(chip);
 
-	sas = mtd->oobsize / chip->ecc.steps;
-
 	/* read without ecc for verification */
 	ret = chip->ecc.read_page_raw(chip, buf, true, page);
 	if (ret)
 		return ret;
 
-	for (i = 0; i < chip->ecc.steps; i++, oob += sas) {
+	for (i = 0; i < chip->ecc.steps; i++) {
 		ecc_chunk = buf + chip->ecc.size * i;
-		ret = nand_check_erased_ecc_chunk(ecc_chunk,
-						  chip->ecc.size,
-						  oob, sas, NULL, 0,
+
+		mtd_ooblayout_ecc(mtd, i, &ecc);
+		ecc_bytes = chip->oob_poi + ecc.offset;
+
+		ret = nand_check_erased_ecc_chunk(ecc_chunk, chip->ecc.size,
+						  ecc_bytes, ecc.length,
+						  NULL, 0,
 						  chip->ecc.strength);
 		if (ret < 0)
 			return ret;
-- 
2.26.2

