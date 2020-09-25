Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84F2727906E
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729839AbgIYSbz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729753AbgIYSby (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:31:54 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 347D3C0613D3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:31:54 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 7so3283869pgm.11
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZBmnWlX2CGGKmPgqT5voHSsbFlrIBNatw9iHdtmWYAE=;
        b=SqKlWJvtpYa5wAEnP6Y5TZiFRnF3W3mL1IGbZv9hyo1xESy84AtfpXvt0oj9rVeebA
         LfASBHDTq9pLel5EKqlhJ769gBfsXO0mhuJiy4DrJIlotBnsS4CH/1lfyYfMOYW+MJxT
         g6GunrkTS+mt6GnMry3otEaxJ4CJozFfptbraSL7gP+Ejp4X7zLMUe//2PPfiDfZZ4HS
         DkF1PXumaTkP+V6JAiLZX9H0PN3N59FdVTq8PgfhFNb9aMOjJVY0Sr7vN7uvy2HCvQS/
         x8euWthjnJgoOk4Ot4a4LgsQ/a9GwCKabWHU2NvCJ52hbDXtzyv7xujEvUjdl70KoRr/
         pgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZBmnWlX2CGGKmPgqT5voHSsbFlrIBNatw9iHdtmWYAE=;
        b=dpUsmSIguLktRxcxZzBnsfAZY2FXeMm8IwB/D7XdwyQUjLMDISm9oFKx46V4icSmHK
         lQLUbD9/37kiGn9aCkRXsDpbduRDFUDdQzGfO3FZhILqocrnjHWXsSGsYtYOE26+eAEK
         DFzlKt0D9t4Zh2DhcAty7Guh5IngN5NE3oLUA7bvfEQ6sBO8dJb267Q6TzyItZBl0cfU
         /lOGd3zD9v7TaAomqZpsePMk8uM+sRVW8wjF9ExskySmJ4Km1CZ5CpFNuhmvtrgcFEz6
         3+GpPGg8NbuSC3yFNSXBUqi1VvBkjjCUNTVKKIBCIWXCJT2QLbVUsVmBtrcJcbrWfOW6
         8t1g==
X-Gm-Message-State: AOAM532EJN/2MIcfgrEdFdH4nVzCsZ7mRxbTzc2yd/5MNo3reU2gB65z
        M8PGMSLtulucg4AfhGRl2MVVxw==
X-Google-Smtp-Source: ABdhPJwbSKP0r+P9sRO2NtyK33xmUUmsyEIYLyJiPw2ucdSAydodag1HaSYX/NuZg+Rz/Dcu2zPb0Q==
X-Received: by 2002:a17:902:74c1:b029:d1:e598:401b with SMTP id f1-20020a17090274c1b02900d1e598401bmr661262plt.85.1601058713773;
        Fri, 25 Sep 2020 11:31:53 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.31.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:31:53 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 06/47] staging: media: zoran: do not forward declare zr36057_init_vfe
Date:   Fri, 25 Sep 2020 18:30:16 +0000
Message-Id: <1601058657-14042-7-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

move function for avoiding forward declaration

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_device.c | 44 +++++++++++-----------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index cbacfa4ea2d0..cf3e2b5e4b4e 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -55,7 +55,27 @@ static bool lml33dpath;		/* default = 0
 module_param(lml33dpath, bool, 0644);
 MODULE_PARM_DESC(lml33dpath, "Use digital path capture mode (on LML33 cards)");
 
-static void zr36057_init_vfe(struct zoran *zr);
+/*
+ * initialize video front end
+ */
+static void zr36057_init_vfe(struct zoran *zr)
+{
+	u32 reg;
+
+	reg = btread(ZR36057_VFESPFR);
+	reg |= ZR36057_VFESPFR_LittleEndian;
+	reg &= ~ZR36057_VFESPFR_VCLKPol;
+	reg |= ZR36057_VFESPFR_ExtFl;
+	reg |= ZR36057_VFESPFR_TopField;
+	btwrite(reg, ZR36057_VFESPFR);
+	reg = btread(ZR36057_VDCR);
+	if (pci_pci_problems & PCIPCI_TRITON)
+		// || zr->revision < 1) // Revision 1 has also Triton support
+		reg &= ~ZR36057_VDCR_Triton;
+	else
+		reg |= ZR36057_VDCR_Triton;
+	btwrite(reg, ZR36057_VDCR);
+}
 
 /*
  * General Purpose I/O and Guest bus access
@@ -1491,25 +1511,3 @@ void zr36057_restart(struct zoran *zr)
 	btwrite((0x81 << 24) | 0x8888, ZR36057_GPPGCR1);
 }
 
-/*
- * initialize video front end
- */
-
-static void zr36057_init_vfe(struct zoran *zr)
-{
-	u32 reg;
-
-	reg = btread(ZR36057_VFESPFR);
-	reg |= ZR36057_VFESPFR_LittleEndian;
-	reg &= ~ZR36057_VFESPFR_VCLKPol;
-	reg |= ZR36057_VFESPFR_ExtFl;
-	reg |= ZR36057_VFESPFR_TopField;
-	btwrite(reg, ZR36057_VFESPFR);
-	reg = btread(ZR36057_VDCR);
-	if (pci_pci_problems & PCIPCI_TRITON)
-		// || zr->revision < 1) // Revision 1 has also Triton support
-		reg &= ~ZR36057_VDCR_Triton;
-	else
-		reg |= ZR36057_VDCR_Triton;
-	btwrite(reg, ZR36057_VDCR);
-}
-- 
2.26.2

