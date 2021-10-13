Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C501542C924
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 20:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238833AbhJMTA0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 15:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238771AbhJMTAY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 15:00:24 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98D1DC061570
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 11:58:20 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id e12so11626594wra.4
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 11:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=swEGGVp8+HI45UprzcHEDFUC6TlCIZ4vzEzvc39jOtk=;
        b=JrOSiHSKdtbyWWctZ9NAsgtCsnE0KQ6VHOwaYAeCd8oNBaBTrKQhLGLlPx/8PwtDn7
         TN58vGYqUfJvRTAe04UF6EYtXU0uSGZ3KNoVOwPqnsLs9J0ooefApbxLxNfnaupf+JkZ
         /yEc0mHCzCGQAp3BnbYlyvZYtNH7w/VeHLy6EhLg3groNHEg+z0y4UTXgcDt2pQC0M4C
         dxfuNuW3atZpnUOBPfSucK9kyLkdwQgxrqbo9+zApEUf2OAfEkF1QP5J957eB1c+5fuz
         cOJuoVpWWayBpITdZRsh4ZIGRPvM0mbUS70AMwQDUURYr09lOcTSXmYYbGoafO5ab+1b
         e4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=swEGGVp8+HI45UprzcHEDFUC6TlCIZ4vzEzvc39jOtk=;
        b=azPtvR0NdfFDsd7j2yB0TghnGFcenAdWK3bkmSRcNVHpR12mMo6U5YNlp6FGjodSGa
         O37vEKxQRtrTkd0bjGxXtCV0n066nlXGh1wUMfq6QxCM+0iHiQr2PmyFXmARiO45FDOt
         72dtjapsBRz/W5OcM3FKC2lvATJdNxXL5ExM6+/W8kxRT84VRzjfPyBgUtWe4S1ac9y0
         bmZmaoUIsomCxHi6Pw7R23cyLpfop2gaZ/N/kc5xKT0FVy4XeO/mGB/2W+Or2QZbud88
         6wrtb1cwXxj0ar5EeNFJxy5/uVOmi7b1Pw18ybgZZntZHpu51xLjWZmsmKZBAks8Ly7Z
         D1dA==
X-Gm-Message-State: AOAM531UCesKumCeY7b6X+plIgUdq/Ifjwd5aHmIkB9HmL1iwDF4bHpM
        JdkNajkElytfqRkjk+XCexs5tA==
X-Google-Smtp-Source: ABdhPJxUDB3R8kV8oX9X4TJup7RvBtk2AA0jBartwo52KDFba2am78BYc1O8Fe7vsJyy9Kue3UsY1g==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr946871wrb.385.1634151499173;
        Wed, 13 Oct 2021 11:58:19 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e8sm573059wrg.48.2021.10.13.11.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 11:58:18 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 01/10] staging: media: zoran: move module parameter checks to zoran_probe
Date:   Wed, 13 Oct 2021 18:58:03 +0000
Message-Id: <20211013185812.590931-2-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013185812.590931-1-clabbe@baylibre.com>
References: <20211013185812.590931-1-clabbe@baylibre.com>
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

