Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8F5D1C5023
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 10:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbgEEIVC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 04:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725766AbgEEIVB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 04:21:01 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A78C061A0F;
        Tue,  5 May 2020 01:21:01 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h9so1645943wrt.0;
        Tue, 05 May 2020 01:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tu5nPp2tsr/xXDZw6NiH6JY/janBM8/TqJS/baK6bXk=;
        b=hfCvpOqo590T0shuE1cPR7Tyz4uhd2A/5uh7k+1VU2jedYxG9T1l4vgT1N5LVp7/rU
         tBOap/HTZwM8PxrP/4Ry1VPhX+JjSr7aTQj32sKsZ361l7KSOldxc+/lOT4bb08zXTIY
         bGsadrq+6cxj1FWYpnXSU1qMjEJQcvbHecedCmrt9tDQfKV5bNW1DJCKuqHw6OqylKyK
         0nVefIu/SOI2KBuHsym/FdIb5P6Oza1bDm+mZMzXdIDrCWd106b5mQDChyD92l0ppLwI
         pSAuWHwF8e1cLmCubRyxw+0jZgwwurLfMxVchOT31Zqja55LvsEICbiRb/7Zxlh3MSFy
         TSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tu5nPp2tsr/xXDZw6NiH6JY/janBM8/TqJS/baK6bXk=;
        b=N+qZPeHjAzeInpmDIlsN3wI+LKpVqe4tmKa9vbjw7Fs2U3mIxwoOZCWYX7+SXlFmzX
         hFYi1qYvut0lgraxmy4uEsy2fkTVh2cYbYpoMlC18JFnHUBtegW0I7SKEBTTzjLHsGES
         MATG9ZTsujMeaksHw56/9pvi3hm0zeIpUn59EfrRa8+c1DtsObcivURHRmY8GlYNtY9/
         5ep/A3TemTAocSZgS9aW1FHnCbRoxYPDH3YfMfzPso9U7Z+O/tTovYYGMLpn6rI6MlR8
         PvAhd2o9mG0o+f1CS+Ne1aDUv86wU91FmDhtcgBHbNET1hYM7/uyvs29Siprk4qeKvHL
         KT4A==
X-Gm-Message-State: AGi0PuYH7E8ZLK80mI0NaNY1vTAcihhJBXB6xNWMa1F+buSA+mDNtuEh
        Ren5X6mid3tK4Bt3QmxaLT70iCX44U9nsDF0
X-Google-Smtp-Source: APiQypLrjmQKo6d9M8OL1hHuv8HTAuaj9UpwYWqHt0WxaUQvw0OPHJw9ZyiR41AHYzey4MuSaYo7Cw==
X-Received: by 2002:adf:fa41:: with SMTP id y1mr2198454wrr.131.1588666860081;
        Tue, 05 May 2020 01:21:00 -0700 (PDT)
Received: from skynet.lan (246.red-83-44-9.dynamicip.rima-tde.net. [83.44.9.246])
        by smtp.gmail.com with ESMTPSA id k9sm1969160wrd.17.2020.05.05.01.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 01:20:59 -0700 (PDT)
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
Subject: [PATCH v2] nand: brcmnand: correctly verify erased pages
Date:   Tue,  5 May 2020 10:20:55 +0200
Message-Id: <20200505082055.2843847-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504092943.2739784-1-noltari@gmail.com>
References: <20200504092943.2739784-1-noltari@gmail.com>
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
Correct this by only checking that the ECC aren't 0xff.

Fixes: 02b88eea9f9c ("mtd: brcmnand: Add check for erased page bitflips")

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: Add Fixes tag

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index e4e3ceeac38f..546f0807b887 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2018,6 +2018,7 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
 		  struct nand_chip *chip, void *buf, u64 addr)
 {
+	struct mtd_oob_region oobecc;
 	int i, sas;
 	void *oob = chip->oob_poi;
 	int bitflips = 0;
@@ -2035,11 +2036,24 @@ static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
 	if (ret)
 		return ret;
 
-	for (i = 0; i < chip->ecc.steps; i++, oob += sas) {
+	for (i = 0; i < chip->ecc.steps; i++) {
 		ecc_chunk = buf + chip->ecc.size * i;
-		ret = nand_check_erased_ecc_chunk(ecc_chunk,
-						  chip->ecc.size,
-						  oob, sas, NULL, 0,
+
+		ret = nand_check_erased_ecc_chunk(ecc_chunk, chip->ecc.size,
+						  NULL, 0, NULL, 0,
+						  chip->ecc.strength);
+		if (ret < 0)
+			return ret;
+
+		bitflips = max(bitflips, ret);
+	}
+
+	for (i = 0; mtd->ooblayout->ecc(mtd, i, &oobecc) != -ERANGE; i++)
+	{
+		ret = nand_check_erased_ecc_chunk(NULL, 0,
+						  oob + oobecc.offset,
+						  oobecc.length,
+						  NULL, 0,
 						  chip->ecc.strength);
 		if (ret < 0)
 			return ret;
-- 
2.26.2

