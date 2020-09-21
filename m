Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEE7272098
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgIUKUt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgIUKUs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:20:48 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736D7C0613D5
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:42 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id q9so11566177wmj.2
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hrN3Tazs/CNvILE5Bj2raDzS8EMF0Eei2YZ/frmZsTs=;
        b=j1b3of5hWSLdhH7uMP0cnSDMUCCK9GHQoWeW933WF24UvLG10n9eZJyyCCiFjvy23L
         DzYGssX3rxCzRNxlfbtomUWVhwL+RAduaO7DUU8d6beNjROvb3NmwHPQGGhVJidWKXbL
         ws07Klo5s51H6WpjISDCqtyhyZQW/ndgKy41fTPqY9hf9CGGuXRx9eMn2VvvMmSEly2C
         SsJCwy6cFIByEOtcr1EwgTa3fU89ekIAWKHaOuLIoHhc1ECHBeGO4J2E8Lu9nqSLftDu
         slV24OpAv92KbjWTz3iR63DnaUDh3O7IaOG9vdXCZfNXNoneZWqAjBbWFfCAH1i638K2
         7rgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hrN3Tazs/CNvILE5Bj2raDzS8EMF0Eei2YZ/frmZsTs=;
        b=q3E+716NNkGN/zzo2yUtkKp2BcofSwdXbhzVQOfW/VILb5aC8eknplCCTNhj3i95lC
         3U4DCmhYKhsGeToqL6Osp0FP72hwvv9VBe6nA84BJZhVYfcgSSwnD1Bm7TjhHBx5K8dL
         sun81XJ7JcXTWTf1HHGXmPDArnsOh+eihEfwFRlr9H/VJCFyVEmhpOq1xUNaJvfbn8Wk
         CVHbAk4jmfRBQXBMFCNznzzw2IohMbzF9tHZsZNUJgEkWYfhdypM8T1X2alg2SlkaG+8
         r3qm116y0S4tk8tRkyFW1buydi9sM6pZJSjXxEMQ4VlzFa0Y28kmu+30zjL0/mzQK0JP
         Y3MQ==
X-Gm-Message-State: AOAM531ECDypb5uSAK4mObkxDPsCE62PQYTh4gS0hQbqe+DNaoZMZIj/
        HrUTAk1Wrol4LvGdNAQL+HSckg==
X-Google-Smtp-Source: ABdhPJwJvmN7W2B1ePJdoM966nluFYhO59lhl4DS5OGBPJwWsiseNY+NXKBLe6Knq9Y3M8Q4YoDP3g==
X-Received: by 2002:a1c:bdc4:: with SMTP id n187mr29264694wmf.109.1600683641133;
        Mon, 21 Sep 2020 03:20:41 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.20.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:20:40 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 09/49] staging: media: zoran: convert dprintk warn
Date:   Mon, 21 Sep 2020 10:19:44 +0000
Message-Id: <1600683624-5863-10-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
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
index 006f209c40ea..26f58e687333 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -933,19 +933,14 @@ static int zr36057_init(struct zoran *zr)
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
@@ -1369,11 +1364,8 @@ static int __init zoran_init(void)
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
index d7c85787e9c0..a04fbae30745 100644
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
@@ -1284,10 +1281,7 @@ irqreturn_t zoran_irq(int irq, void *dev_id)
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
@@ -1406,8 +1400,7 @@ irqreturn_t zoran_irq(int irq, void *dev_id)
 
 		count++;
 		if (count > 10) {
-			dprintk(2, KERN_WARNING "%s: irq loop %d\n",
-				ZR_DEVNAME(zr), count);
+			pci_warn(zr->pci_dev, "irq loop %d\n", count);
 			if (count > 20) {
 				btand(~ZR36057_ICR_IntPinEn, ZR36057_ICR);
 				pci_err(zr->pci_dev, "IRQ lockup, cleared int mask\n");
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 4082d5e53a24..3b061c3e4a82 100644
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
 
@@ -2285,9 +2270,7 @@ static int zoran_s_jpegcomp(struct file *file, void *__fh,
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

