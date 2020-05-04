Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 675911C4682
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 20:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbgEDS7x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 14:59:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725956AbgEDS7w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 14:59:52 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A90CC061A0E;
        Mon,  4 May 2020 11:59:51 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id e26so656143wmk.5;
        Mon, 04 May 2020 11:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2NDwq7adscftTrwiJQh+VER8nqxnsXi/L2yYoLQDIBw=;
        b=HXnA4P7h4efQixO7cYzcRhvRD93Ncw3vXuzps64vW0rY/ha+K3x9lOlgfUPy41i7av
         oZNH72AzCZIzOoW28BgnfC9fZL4qNCAPNfZT0wT/K2BWXmCK2/K5hTdfv9sWug1fTvYt
         mHJ/E9TnVFUObJF6sy9rFm4erjzgu1pqsSTxxQUwJJT+D2hUMhfi0xZj5+WxjKkhqpzd
         9vG8G6C/E2weGyQhFtsnsQtdzMSAo6BJDORuwDHr0dQL+IRWxxlF+sNNIYCy0YLCrqAR
         kGqexMqX4kwgHMdw2+/oE6h5buDdAIFsRHn03G/hVV5kfeM2Mn/5HCvQaD+Xdq5l7FzH
         Axog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2NDwq7adscftTrwiJQh+VER8nqxnsXi/L2yYoLQDIBw=;
        b=SuUi17kcf4rHpwqWZYpBtPEF4URVe0jY6EU8/MTxmcmqfddF3ZP+wDrie+hn9T0yMg
         g6eE1HpxrB3uu77iDnwXgfCYteNhCSlEI/sWLbkfEbNLVj97GY4cKUSlZc8Jnaty3rJU
         fVfwKXu0oam6+vQf4i7D1HED4h6rUa61E4lnhYYamkmKiPCPb8ojV1scsoIbn4wZGBbR
         auzE8/b01Ql6WK6QG2rWM8nElqoSEr+AOAmApFIdlHWQZdPukEec7BjJdjtDBXqrWnHo
         07xk/gzUa735Gfs/zX5EYyx2rdq7b813K8BoZ+FmwdaKtrgtzKPJ7LoiIIlD6vHqosxY
         kN3A==
X-Gm-Message-State: AGi0PubXxxRXXslxmnhI7fPzZZVWAxmA5lf5oB/ClBkkzH1OfRZp62k8
        9oXJzHhIxRLtIgVgzP/3Cd4=
X-Google-Smtp-Source: APiQypJSTQuFjpD6p2G9gmeFTpAmO96arAeQQH23JsTcN6wYA30d9Ts7qzlC5PKevWHz0bmf9ibNtw==
X-Received: by 2002:a1c:1983:: with SMTP id 125mr15856870wmz.43.1588618789726;
        Mon, 04 May 2020 11:59:49 -0700 (PDT)
Received: from skynet.lan (246.red-83-44-9.dynamicip.rima-tde.net. [83.44.9.246])
        by smtp.gmail.com with ESMTPSA id i25sm452952wml.43.2020.05.04.11.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 11:59:49 -0700 (PDT)
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
Subject: [PATCH v2 1/2] nand: brcmnand: improve hamming oob layout
Date:   Mon,  4 May 2020 20:59:44 +0200
Message-Id: <20200504185945.2776148-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504093034.2739968-1-noltari@gmail.com>
References: <20200504093034.2739968-1-noltari@gmail.com>
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

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: keep original comment and fix correctly skip byte 6 for small-page nand

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 34 +++++++++++++-----------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index e4e3ceeac38f..767343e0e6e7 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1100,30 +1100,32 @@ static int brcmnand_hamming_ooblayout_free(struct mtd_info *mtd, int section,
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
-			 * NAND use byte 0.
-			 */
-			if (cfg->page_size > 512)
-				oobregion->offset++;
-			oobregion->length--;
+		/*
+		 * Small-page NAND use byte 6 for BBI while large-page
+		 * NAND use byte 0.
+		 */
+		if (cfg->page_size > 512) {
+			oobregion->offset = 1;
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

