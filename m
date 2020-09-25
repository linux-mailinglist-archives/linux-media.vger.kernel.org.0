Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81127279072
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729857AbgIYScH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729846AbgIYScH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:32:07 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7F23C0613D3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:32:06 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id l126so4002899pfd.5
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zLLV9JYO0YyYUfB1AfQEKLRQMALDVT42UYn/cxzBn8g=;
        b=euCaO8V9TMnLY2uMHydLam1JEgG9HK7EF7F+U2kIHsgSysbprajL3PqzKwZEf49+9s
         y3fVvdd3SMrhBGSq/6mMceYOjWE6zYqOYDbcf9IlDJzEeiEPQa8gxHNPNkQA5aBoMT8D
         8pVdu5dTydF7mtF0oNsas+EYwLEtsfqscIRxx1Z8JN2spZg7urMd9U4WB2E//5xgnZUd
         H4FkkurtzlXmilFLmjpK/lC5OiGBpXMDmg3AQzuMnt4/YdLLpbzxCX9I6qqAmw9B9op9
         41DEE3xcEDteFhvqBsnjqKqYKlplRxhiBfhY8NVdFRlnzNt2PWxVI/JEYs5lG3+6tSY5
         Ri6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zLLV9JYO0YyYUfB1AfQEKLRQMALDVT42UYn/cxzBn8g=;
        b=lYh7rBxLBOXrvl2bk7S0KrfFYTRSV8czb6UuVnu7/x0ReVFs57cXAEzLR7XyU6TF6X
         nVy4tI4OZkCslUNrvG8bQR7FC0pXN9ueH67ArKXxTwS7MsJ8QSr7GI1+aBrHGbhOa1Z3
         3Bxev4Yx6WZogtPWzxb8F1lrF7G/jzLbsOm2AwOjDJekBJdqZhF676UNCJtOUryNzgqI
         A92Xa76/XOPUFFtf0TJc6x1CamCOFBwDELjlTwBPYSxFONr0jvSVmX3BKzTATED7yRBM
         x84kkNGCU7EX/XU47IK8qp8JWe58O4yShXJYTc8pEUQkxvmcgte8OS31znmqptFphPrw
         eZqw==
X-Gm-Message-State: AOAM533lguyGpqpVwPDGn3FiqGx/hZsSOzinAqXem3CO44kMFAywzAsi
        ST3ZdU9yAPZSjdKB7gNn6Nkq7g==
X-Google-Smtp-Source: ABdhPJwdkNSfcwkguQ6JpPVodIK20stGhqq99sH2iU1pZTniBawx4FWjmc5MoeEN7yaQnAr9SdtgPQ==
X-Received: by 2002:a63:ce4e:: with SMTP id r14mr192733pgi.353.1601058725655;
        Fri, 25 Sep 2020 11:32:05 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.32.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:32:05 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 08/47] staging: media: zoran: convert dprintk warn
Date:   Fri, 25 Sep 2020 18:30:18 +0000
Message-Id: <1601058657-14042-9-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch convert dprintk(warn) to pci_warn.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c   | 18 ++++----------
 drivers/staging/media/zoran/zoran_device.c | 13 +++-------
 drivers/staging/media/zoran/zoran_driver.c | 29 +++++-----------------
 3 files changed, 14 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 27a79fffb01d..d0b93141df5b 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -938,19 +938,14 @@ static int zr36057_init(struct zoran *zr)
 		zr->timing = zr->card.tvn[2];
 	}
 	if (!zr->timing) {
-		dprintk(1,
-			KERN_WARNING
-			"%s: %s - default TV standard not supported by hardware. PAL will be used.\n",
-			ZR_DEVNAME(zr), __func__);
+		pci_warn(zr->pci_dev, "%s - default TV standard not supported by hardware. PAL will be used.\n", __func__);
 		zr->norm = V4L2_STD_PAL;
 		zr->timing = zr->card.tvn[0];
 	}
 
 	if (default_input > zr->card.inputs - 1) {
-		dprintk(1,
-			KERN_WARNING
-			"%s: default_input value %d out of range (0-%d)\n",
-			ZR_DEVNAME(zr), default_input, zr->card.inputs - 1);
+		pci_warn(zr->pci_dev, "default_input value %d out of range (0-%d)\n",
+			 default_input, zr->card.inputs - 1);
 		default_input = 0;
 	}
 	zr->input = default_input;
@@ -1378,11 +1373,8 @@ static int __init zoran_init(void)
 	}
 
 	/* some mainboards might not do PCI-PCI data transfer well */
-	if (pci_pci_problems & (PCIPCI_FAIL | PCIAGP_FAIL | PCIPCI_ALIMAGIK)) {
-		dprintk(1,
-			KERN_WARNING
-			"%s: chipset does not support reliable PCI-PCI DMA\n", ZORAN_NAME);
-	}
+	if (pci_pci_problems & (PCIPCI_FAIL | PCIAGP_FAIL | PCIPCI_ALIMAGIK))
+		pr_warn("%s: chipset does not support reliable PCI-PCI DMA\n", ZORAN_NAME);
 
 	res = pci_register_driver(&zoran_driver);
 	if (res) {
diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 806c7285a5e3..f090ee92f0c8 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -547,10 +547,7 @@ void zr36057_set_memgrab(struct zoran *zr, int mode)
 		 * will be stuck at 1 until capturing is turned back on.
 		 */
 		if (btread(ZR36057_VSSFGR) & ZR36057_VSSFGR_SnapShot)
-			dprintk(1,
-				KERN_WARNING
-				"%s: zr36057_set_memgrab(1) with SnapShot on!?\n",
-				ZR_DEVNAME(zr));
+			pci_warn(zr->pci_dev, "zr36057_set_memgrab(1) with SnapShot on!?\n");
 
 		/* switch on VSync interrupts */
 		btwrite(IRQ_MASK, ZR36057_ISR);	// Clear Interrupts
@@ -1300,10 +1297,7 @@ irqreturn_t zoran_irq(int irq, void *dev_id)
 			if (zr->v4l_memgrab_active) {
 				/* A lot more checks should be here ... */
 				if ((btread(ZR36057_VSSFGR) & ZR36057_VSSFGR_SnapShot) == 0)
-					dprintk(1,
-						KERN_WARNING
-						"%s: BuzIRQ with SnapShot off ???\n",
-						ZR_DEVNAME(zr));
+					pci_warn(zr->pci_dev, "BuzIRQ with SnapShot off ???\n");
 
 				if (zr->v4l_grab_frame != NO_GRAB_ACTIVE) {
 					/* There is a grab on a frame going on, check if it has finished */
@@ -1422,8 +1416,7 @@ irqreturn_t zoran_irq(int irq, void *dev_id)
 
 		count++;
 		if (count > 10) {
-			dprintk(2, KERN_WARNING "%s: irq loop %d\n",
-				ZR_DEVNAME(zr), count);
+			pci_warn(zr->pci_dev, "irq loop %d\n", count);
 			if (count > 20) {
 				btand(~ZR36057_ICR_IntPinEn, ZR36057_ICR);
 				pci_err(zr->pci_dev, "IRQ lockup, cleared int mask\n");
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index f23e9c063919..aed2ac82bfee 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -210,10 +210,7 @@ static int v4l_fbuffer_alloc(struct zoran_fh *fh)
 
 	for (i = 0; i < fh->buffers.num_buffers; i++) {
 		if (fh->buffers.buffer[i].v4l.fbuffer)
-			dprintk(2,
-				KERN_WARNING
-				"%s: %s - buffer %d already allocated!?\n",
-				ZR_DEVNAME(zr), __func__, i);
+			pci_warn(zr->pci_dev, "%s - buffer %d already allocated!?\n", __func__, i);
 
 		//udelay(20);
 		mem = kmalloc(fh->buffers.buffer_size, GFP_KERNEL | __GFP_NOWARN);
@@ -300,10 +297,7 @@ static int jpg_fbuffer_alloc(struct zoran_fh *fh)
 
 	for (i = 0; i < fh->buffers.num_buffers; i++) {
 		if (fh->buffers.buffer[i].jpg.frag_tab)
-			dprintk(2,
-				KERN_WARNING
-				"%s: %s - buffer %d already allocated!?\n",
-				ZR_DEVNAME(zr), __func__, i);
+			pci_warn(zr->pci_dev, "%s - buffer %d already allocated!?\n", __func__, i);
 
 		/* Allocate fragment table for this buffer */
 
@@ -490,10 +484,7 @@ static int zoran_v4l_queue_frame(struct zoran_fh *fh, int num)
 			res = -EBUSY;	/* what are you doing? */
 			break;
 		case BUZ_STATE_DONE:
-			dprintk(2,
-				KERN_WARNING
-				"%s: %s - queueing buffer %d in state DONE!?\n",
-				ZR_DEVNAME(zr), __func__, num);
+			pci_warn(zr->pci_dev, "%s - queueing buffer %d in state DONE!?\n", __func__, num);
 			/* fallthrough */
 		case BUZ_STATE_USER:
 			/* since there is at least one unused buffer there's room for at least
@@ -627,10 +618,7 @@ static int zoran_jpg_queue_frame(struct zoran_fh *fh, int num,
 	if (!res) {
 		switch (zr->jpg_buffers.buffer[num].state) {
 		case BUZ_STATE_DONE:
-			dprintk(2,
-				KERN_WARNING
-				"%s: %s - queuing frame in BUZ_STATE_DONE state!?\n",
-				ZR_DEVNAME(zr), __func__);
+			pci_warn(zr->pci_dev, "%s - queuing frame in BUZ_STATE_DONE state!?\n", __func__);
 			/* fallthrough */
 		case BUZ_STATE_USER:
 			/* since there is at least one unused buffer there's room for at
@@ -1330,10 +1318,7 @@ static int zoran_set_input(struct zoran *zr, int input)
 
 	if (zr->v4l_buffers.active != ZORAN_FREE ||
 	    zr->jpg_buffers.active != ZORAN_FREE) {
-		dprintk(1,
-			KERN_WARNING
-			"%s: %s called while in playback/capture mode\n",
-			ZR_DEVNAME(zr), __func__);
+		pci_warn(zr->pci_dev, "%s called while in playback/capture mode\n", __func__);
 		return -EBUSY;
 	}
 
@@ -2294,9 +2279,7 @@ static int zoran_s_jpegcomp(struct file *file, void *__fh,
 	settings.jpg_comp = *params;
 
 	if (fh->buffers.active != ZORAN_FREE) {
-		dprintk(1, KERN_WARNING
-			"%s: VIDIOC_S_JPEGCOMP called while in playback/capture mode\n",
-			ZR_DEVNAME(zr));
+		pci_warn(zr->pci_dev, "VIDIOC_S_JPEGCOMP called while in playback/capture mode\n");
 		res = -EBUSY;
 		return res;
 	}
-- 
2.26.2

