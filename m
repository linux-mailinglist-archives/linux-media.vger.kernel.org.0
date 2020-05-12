Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD6C1CEEA5
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 09:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729097AbgELH5o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 03:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729085AbgELH5m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 03:57:42 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31D2C061A0C;
        Tue, 12 May 2020 00:57:41 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id d207so5754552wmd.0;
        Tue, 12 May 2020 00:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tFcfq1Co9SytjH3sVz+L8DNsAe/xBUib75WR/Wft0yA=;
        b=jboMYWLVIcKnSUU1lJdYaZxv10npVgcGjiRko0heKTBbyZwALuh7aNckSBFb9pQ6Qj
         OzbRt8OvRcEjSV+iaALVoYUCch4Y/DVgfbF2Kxd0CK1swO00+poureihDJa/C2nAEYAF
         AZf+P1JXBsn1ivpGU7M2DMtnjz9gkFZNozDkfJTS4HAHdwRz6FHr9/hP0E9IWyWJ7LCO
         WWzrICbJHuDGRSrEr3wNNhv59Hgtutqav78MN2zDvo2G8RErxb6bQfHzNuSILOINqwO6
         7PJevt0JwnWoPz10Q+QVQOBIF/5erDihYrnF3nws0BDS8DjpvDoC2j/aRI38vBsaFonm
         3Abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tFcfq1Co9SytjH3sVz+L8DNsAe/xBUib75WR/Wft0yA=;
        b=Z28CkIVyUx013TmoJLrInPg7t3b635J/qS+gt6EhhmPazVjW112VD18m4U2zzQObW8
         tJ8xZ8whFyxDtSU4Lr0rUlOeBHggw3R+5BAIalr1K9T8dba+3f3wLfKTaLod34nGGobM
         okR81SjaXPcYtvo2nW3wujYnAx5PzpUPOziPxP3QBblhscmdDmFM8NLNGAWzhgDaaDiB
         1BDw7KalSpptSzC0eXnUdnNRM+U0VOK8bjALyronv3aS+wyXlsyP39vlfx/TpOhw+hv0
         xusuZxkUrrgs39y+Rp3NrfQELzDHte63cFhjrMQStoHtRHSzSNy6GEocuJZaWyj98SmK
         TNpA==
X-Gm-Message-State: AGi0PubpOLsJj7WNowaugrrcsoEzFSj3Wc2WvVFc8FZ8yEcIzEpMOrGt
        2fdBw27ws0OXl9kL5pUpLg4=
X-Google-Smtp-Source: APiQypLKON9sl5IDWScY2h+SLVUk6vFpneY1AgQBxbxsKwjUe6BaiRw1lQifpRUyFd55zPV9DE3r+Q==
X-Received: by 2002:a1c:b104:: with SMTP id a4mr34821227wmf.24.1589270260673;
        Tue, 12 May 2020 00:57:40 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net. [83.49.57.198])
        by smtp.gmail.com with ESMTPSA id p8sm25946618wma.45.2020.05.12.00.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 00:57:40 -0700 (PDT)
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
Subject: [PATCH v4 2/2] mtd: rawnand: brcmnand: improve hamming oob layout
Date:   Tue, 12 May 2020 09:57:33 +0200
Message-Id: <20200512075733.745374-3-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512075733.745374-1-noltari@gmail.com>
References: <20200512060023.684871-1-noltari@gmail.com>
 <20200512075733.745374-1-noltari@gmail.com>
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
 v4: clarify small/large pages comment
 v3: invert patch order
 v2: keep original comment and fix correctly skip byte 6 for small-page nand

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 35 +++++++++++-------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 1c1070111ebc..6292fac6cc4f 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1100,33 +1100,30 @@ static int brcmnand_hamming_ooblayout_free(struct mtd_info *mtd, int section,
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
+		if (cfg->page_size > 512) {
+			/* Large page NAND uses first 2 bytes for BBI */
+			oobregion->offset = 2;
+		} else {
+			/* Small page NAND uses last byte before ECC for BBI */
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
