Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBC31CED4B
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 08:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728948AbgELGvR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 02:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725987AbgELGvQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 02:51:16 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2CE3C061A0C;
        Mon, 11 May 2020 23:51:15 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id y24so21992336wma.4;
        Mon, 11 May 2020 23:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PzqUJAgwkfPwZqY9huLuJ57Jz2DxDsPXmmqSEmn6iEQ=;
        b=jYYn2rm9tXXBGEfdfNQxs0IaQPLDPbZSznuhX3K3+inFDcNXl0KqQtlWqLM9/BjpNP
         kVv7wd8np8uF/tWqF7LnPYZiT9kKEfwIdiBsKmde+aZznx/vHd5yLgXEiJ8u98GMTMm/
         Gsv4kEFmvrb1jC/i9LQB3C+LyUCfjfqEwgt12dDtMEOnNbO0QMLxQwIa2COQGzigJXAe
         4CaHT90CiQBrTZ2ua2AHa+d8Mi+GHAtvKm9bHHumm3st3Gi8TwvFOWQJTogShROTWwN9
         OmVGoAxdexdjEQoAoQEigGrj3xKbHKGvBoDQU53JtJj2qNesFI9pkKokCm7CWUhcF4NW
         GQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PzqUJAgwkfPwZqY9huLuJ57Jz2DxDsPXmmqSEmn6iEQ=;
        b=PRRpqQRHdTXg+LpL8hkkd1ya4OPrzV6h31q422IpRhu4Gh1mzelUKGAmGPR1Ke7YqL
         r0WJfJyjmU0iE27M2Ph5Z9CbG8w5fWUQO2hGFHw8ojx8r4SJGX/4qk32GvxdGXaZNPL6
         smito80wpiS6RqgzdYwwUzKLo+PSjWgv26ujnT+VoAW+gxAcjqTWU7yiI/TSdao8ruVw
         25WxhuBFbtzMgt67wgCznMrjlONg5Nz1G40oQEuI5ciBfVQOGPp4bHsT+nqfxyoqpgeP
         fDyWZmfzvpD9R26f29ibv3kb3ldzEp7FrXqkXUOzLbUXXOpjRcXJv0FAWF+dec3m9eOk
         ONkg==
X-Gm-Message-State: AGi0PuZxP89QPhIrrVOvRUBbMq91Cm4rdqgj3r5V8w4o4N+v/ZyrxoCD
        rBXVtJ26Ma3J+1g/WVbJuM4=
X-Google-Smtp-Source: APiQypJvYf4NALaAkFyguhqo82x6QEXVkcwJJetASyREMrQ2k+rzJEeg2imq5+2NaLIPszqT4KSHyA==
X-Received: by 2002:a7b:cf23:: with SMTP id m3mr34648915wmg.36.1589266274574;
        Mon, 11 May 2020 23:51:14 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net. [83.49.57.198])
        by smtp.gmail.com with ESMTPSA id n25sm30740119wmk.9.2020.05.11.23.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 23:51:14 -0700 (PDT)
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
Subject: [PATCH v3] mtd: rawnand: brcmnand: correctly verify erased pages
Date:   Tue, 12 May 2020 08:51:11 +0200
Message-Id: <20200512065111.716801-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200505082055.2843847-1-noltari@gmail.com>
References: <20200505082055.2843847-1-noltari@gmail.com>
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
 v3: Fix commit log and merge nand_check_erased_ecc_chunk calls.
 v2: Add Fixes tag

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index e4e3ceeac38f..80fe01f03516 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2018,8 +2018,9 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
 		  struct nand_chip *chip, void *buf, u64 addr)
 {
+	struct mtd_oob_region oobecc;
 	int i, sas;
-	void *oob = chip->oob_poi;
+	void *oob;
 	int bitflips = 0;
 	int page = addr >> chip->page_shift;
 	int ret;
@@ -2035,11 +2036,19 @@ static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
 	if (ret)
 		return ret;
 
-	for (i = 0; i < chip->ecc.steps; i++, oob += sas) {
+	for (i = 0; i < chip->ecc.steps; i++) {
 		ecc_chunk = buf + chip->ecc.size * i;
-		ret = nand_check_erased_ecc_chunk(ecc_chunk,
-						  chip->ecc.size,
-						  oob, sas, NULL, 0,
+
+		if (mtd->ooblayout->ecc(mtd, i, &oobecc)) {
+			oob = NULL;
+			oobecc.length = 0;
+		} else {
+			oob = chip->oob_poi + oobecc.offset;
+		}
+
+		ret = nand_check_erased_ecc_chunk(ecc_chunk, chip->ecc.size,
+						  oob, oobecc.length,
+						  NULL, 0,
 						  chip->ecc.strength);
 		if (ret < 0)
 			return ret;
-- 
2.26.2

