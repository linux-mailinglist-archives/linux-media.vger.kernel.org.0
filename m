Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F079E1C35C5
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728565AbgEDJam (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728071AbgEDJal (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 05:30:41 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96ACDC061A0E;
        Mon,  4 May 2020 02:30:41 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id g13so20045261wrb.8;
        Mon, 04 May 2020 02:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ILoe7y0shto7bU0P2H+2klHY8P228w9POxLvuitoG7I=;
        b=bJU8W1fM3zw2r4Ba5Dl1PuJBnxl0FmJIjrjpwbeYBXO4OlYdW7lQCPRbjaFrAZYsTT
         91aVNepFk6EylE+Ux5jwIBE+2zDHUDWgjwZhJwOTo0/F7O1H3+NTgCO+rPRZvQ8fmqoe
         FVgqDvpt3wT59lVSABdupwMmw4+nmai4HG6lzXT4BxEETAFXbCp/sSTwowDU/UaJvdd9
         UJL+6Wnt0HFxDCDw2PTSavg9pYv5fB/EC8bY8BcjZyNke0e6lDRXAf5vj20V8offQ84l
         EmMpo1B4aDnynA71nShdaLEnEtxCGBnLX6IRhCbmU0dn8pW7nxcC8acevT5mtmhoZa5J
         JVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ILoe7y0shto7bU0P2H+2klHY8P228w9POxLvuitoG7I=;
        b=oDb1kH5bODZC/8WyhcOAdeGI5VXnb7t8X3DtkGpKOE2uLIhP0lp2NpRlkUe8UI3sne
         Dn2MABODLURs+NKKqDS95eUZo4c67bfKqul10evZoElFC4sshcTyG06u4qbke5GqQYtC
         l89MK1+11Zp2JB/2KrPmy+99cKTiRxk3A9KBVvEQF4gGalRSShqspLZpNEr9SHb1FheY
         Dr6g0OuztYYcsKEQueAuDKjNIJKIGyorjhZe+aMhT7LPApVSVyDUsb/xTdfMyZlmN/zs
         QOk33JuCRHEhAKLUo3KFFU8UeALvNn8gRmwNAJEnOtU2L87SuWlamARb8KQnLl16yxOh
         jPzw==
X-Gm-Message-State: AGi0PuYXRCH5jq+78S9qhZyzPftifWsuGKwkxbzV9mrLIYXEsMHYOEdG
        /ocXZ0NJclKzf1LnYwU8VDg=
X-Google-Smtp-Source: APiQypLvAvPIqV4mmOd08kzXGbxUOuVUQXP/BU97hOB+1KAm8BHZmwLzY/vOTCYPLk1/KgNU/leseA==
X-Received: by 2002:a5d:6a04:: with SMTP id m4mr19509274wru.326.1588584640260;
        Mon, 04 May 2020 02:30:40 -0700 (PDT)
Received: from skynet.lan (246.red-83-44-9.dynamicip.rima-tde.net. [83.44.9.246])
        by smtp.gmail.com with ESMTPSA id u12sm13075570wmu.25.2020.05.04.02.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 02:30:39 -0700 (PDT)
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
Subject: [PATCH 1/2] nand: brcmnand: improve hamming oob layout
Date:   Mon,  4 May 2020 11:30:33 +0200
Message-Id: <20200504093034.2739968-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
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
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 28 +++++++++---------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index e4e3ceeac38f..1bba309c7684 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1100,29 +1100,21 @@ static int brcmnand_hamming_ooblayout_free(struct mtd_info *mtd, int section,
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
-	} else {
-		oobregion->length = 6;
+	if (section)
+		oobregion->offset = ((section - 1) * sas) + 9;
+	else
+		oobregion->offset = 1; /* BBI */
 
-		/* First sector of each page may have BBI */
-		if (!section) {
-			/*
-			 * Small-page NAND use byte 6 for BBI while large-page
-			 * NAND use byte 0.
-			 */
-			if (cfg->page_size > 512)
-				oobregion->offset++;
-			oobregion->length--;
-		}
-	}
+	oobregion->length = next - oobregion->offset;
 
 	return 0;
 }
-- 
2.26.2

