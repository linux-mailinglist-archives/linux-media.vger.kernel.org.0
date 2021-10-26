Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C298543BAE8
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 21:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238844AbhJZTgz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 15:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238823AbhJZTgs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 15:36:48 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A46A2C061745
        for <linux-media@vger.kernel.org>; Tue, 26 Oct 2021 12:34:23 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id e12so153794wra.4
        for <linux-media@vger.kernel.org>; Tue, 26 Oct 2021 12:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=swEGGVp8+HI45UprzcHEDFUC6TlCIZ4vzEzvc39jOtk=;
        b=AP2b0sFj6Hhl3C/23pSETWqc+SJ1kCmJLy6DsZi22SBcfGMHyt659cW6XPvasxm5rl
         fhf/N7N4pthI4u5PZKqapZZd7LsjpuWnwMt2XcUte3AseU/64/qoUrWCI3OwDvo2gXON
         oUEUbAH3YcP5tZoICiXBau8EUNrmGW93lwoyYt8MruOM8PhI2pilDQvPmot+SU73abeY
         j6NaxxcCzt199Fnke4bjyYHEUcfqQCjzeUzkRy7zedN1Bmngxn7hSvSbIZc0ra3VVq59
         /AYqoZEWc1HGgC9OKez0wPANUy7n2ecM3/5oZACc3a88ma/JyzvBN9QGgLd5JlN3zoRo
         2LYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=swEGGVp8+HI45UprzcHEDFUC6TlCIZ4vzEzvc39jOtk=;
        b=KIfhT8H33sDTvPpReIHTwZaLV+cGMW3kWhfYYF66/6iNeP8/d6nFvKBpef30CZUtlP
         SQix56Tuu5oLCVRm6Ma12+tzptwwNZDOCBCOSjCjK+CHXhon16I7WEEVPdG0Gj0ThL7a
         nkVQohFYExTLqmXnbNoKO6dvjadVOGmXYMpYzDCikRo3oQrjREfsa3W4qR0e9kRH0iOL
         2cIDbyDRywLJLCTO4VueQY513ksWVKfB073u8lZBMGyY6E1KqFf1hubwcWV4Tmr+JpWa
         3CMo/iTcx7QqSUenzpVgXPoKQTKKm/5T6zIpyFaPGeOlxAsGwDyLcjwZ/gqq7/ukHhNX
         DyIg==
X-Gm-Message-State: AOAM5305qJNPnDDsoRXNnvISgW3Rz9H3Uzek0XxIOTekNrQ3jiDgRtL9
        AG5g6ltqsfTTPYoZ2igWIYRH0A==
X-Google-Smtp-Source: ABdhPJwrZRrtHioQOddQjP2HQ1bNLKGF3uQJky4wtgQOcnlEykmxKlLP/UvYZ8qD1frUXD/rO4JK2A==
X-Received: by 2002:a05:6000:18a8:: with SMTP id b8mr18157726wri.340.1635276862201;
        Tue, 26 Oct 2021 12:34:22 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id s18sm17676123wrb.95.2021.10.26.12.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 12:34:21 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 01/14] staging: media: zoran: move module parameter checks to zoran_probe
Date:   Tue, 26 Oct 2021 19:34:03 +0000
Message-Id: <20211026193416.1176797-2-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026193416.1176797-1-clabbe@baylibre.com>
References: <20211026193416.1176797-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We need to empty zoran_init() for removing it later.
Furthermore, this permit to use pci_xxx instead of pr_xxx for prettier
printing.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 64 ++++++++++++------------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index f259585b0689..3bc0e64f1007 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -1067,6 +1067,39 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	unsigned int nr;
 	int err;
 
+	pci_info(pdev, "Zoran MJPEG board driver version %s\n", ZORAN_VERSION);
+
+	/* check the parameters we have been given, adjust if necessary */
+	if (v4l_nbufs < 2)
+		v4l_nbufs = 2;
+	if (v4l_nbufs > VIDEO_MAX_FRAME)
+		v4l_nbufs = VIDEO_MAX_FRAME;
+	/* The user specifies the in KB, we want them in byte (and page aligned) */
+	v4l_bufsize = PAGE_ALIGN(v4l_bufsize * 1024);
+	if (v4l_bufsize < 32768)
+		v4l_bufsize = 32768;
+	/* 2 MB is arbitrary but sufficient for the maximum possible images */
+	if (v4l_bufsize > 2048 * 1024)
+		v4l_bufsize = 2048 * 1024;
+	if (jpg_nbufs < 4)
+		jpg_nbufs = 4;
+	if (jpg_nbufs > BUZ_MAX_FRAME)
+		jpg_nbufs = BUZ_MAX_FRAME;
+	jpg_bufsize = PAGE_ALIGN(jpg_bufsize * 1024);
+	if (jpg_bufsize < 8192)
+		jpg_bufsize = 8192;
+	if (jpg_bufsize > (512 * 1024))
+		jpg_bufsize = 512 * 1024;
+	/* Use parameter for vidmem or try to find a video card */
+	if (vidmem)
+		pci_info(pdev, "%s: Using supplied video memory base address @ 0x%lx\n",
+			 ZORAN_NAME, vidmem);
+
+	/* some mainboards might not do PCI-PCI data transfer well */
+	if (pci_pci_problems & (PCIPCI_FAIL | PCIAGP_FAIL | PCIPCI_ALIMAGIK))
+		pci_warn(pdev, "%s: chipset does not support reliable PCI-PCI DMA\n",
+			 ZORAN_NAME);
+
 	err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
 	if (err)
 		return -ENODEV;
@@ -1285,37 +1318,6 @@ static int __init zoran_init(void)
 {
 	int res;
 
-	pr_info("Zoran MJPEG board driver version %s\n", ZORAN_VERSION);
-
-	/* check the parameters we have been given, adjust if necessary */
-	if (v4l_nbufs < 2)
-		v4l_nbufs = 2;
-	if (v4l_nbufs > VIDEO_MAX_FRAME)
-		v4l_nbufs = VIDEO_MAX_FRAME;
-	/* The user specifies the in KB, we want them in byte (and page aligned) */
-	v4l_bufsize = PAGE_ALIGN(v4l_bufsize * 1024);
-	if (v4l_bufsize < 32768)
-		v4l_bufsize = 32768;
-	/* 2 MB is arbitrary but sufficient for the maximum possible images */
-	if (v4l_bufsize > 2048 * 1024)
-		v4l_bufsize = 2048 * 1024;
-	if (jpg_nbufs < 4)
-		jpg_nbufs = 4;
-	if (jpg_nbufs > BUZ_MAX_FRAME)
-		jpg_nbufs = BUZ_MAX_FRAME;
-	jpg_bufsize = PAGE_ALIGN(jpg_bufsize * 1024);
-	if (jpg_bufsize < 8192)
-		jpg_bufsize = 8192;
-	if (jpg_bufsize > (512 * 1024))
-		jpg_bufsize = 512 * 1024;
-	/* Use parameter for vidmem or try to find a video card */
-	if (vidmem)
-		pr_info("%s: Using supplied video memory base address @ 0x%lx\n", ZORAN_NAME, vidmem);
-
-	/* some mainboards might not do PCI-PCI data transfer well */
-	if (pci_pci_problems & (PCIPCI_FAIL | PCIAGP_FAIL | PCIPCI_ALIMAGIK))
-		pr_warn("%s: chipset does not support reliable PCI-PCI DMA\n", ZORAN_NAME);
-
 	res = pci_register_driver(&zoran_driver);
 	if (res) {
 		pr_err("Unable to register ZR36057 driver\n");
-- 
2.32.0

