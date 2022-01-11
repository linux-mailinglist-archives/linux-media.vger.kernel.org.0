Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCFB48A801
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 07:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348346AbiAKG4L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 01:56:11 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45396 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348350AbiAKG4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 01:56:10 -0500
Received: from localhost.localdomain (unknown [IPv6:2a00:c281:14a3:8100:8072:ec19:b639:c4ab])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1E44B1F440A3;
        Tue, 11 Jan 2022 06:56:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1641884169;
        bh=jHqPcllJUl78adEDHwmwCcFl58cLfyU+YE5J3CQy4G4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QThwvQp6anD2sMAHC1k/dKsbPkQZ9ppkMJHwp5YYBXXu+4BBF49m6NOqxu5H5jWnl
         tTlA6XMC0gEo4pAf3kxMe4Xzg4A4VGtpXwBYyBMsoOnwzRXNT9gEDRZxQXYyKvIsGn
         X6Ozlu48NIhYxEOxaN8wnvcStSppvTwIn/JhowPVRYwUmFHtd96VJkUAjLnlZXJ+EP
         j2QTEfaV/ylYPvguWlB2FOxjlNufnjuW6HVoa8jgdig68vk+zv2s8MOk7mfwePkaAu
         Fqe/9v5fiLtotfP2+iKihq9bOB/A+0qneHdgIk3uSM7kf9Qm6thExbvw+TsIfQChHU
         95aEvuxbBTcMw==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     ezequiel@vanguardiasur.com.ar
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, ribalda@chromium.org, tfiga@chromium.org,
        senozhatsky@google.com, hch@lst.de,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com
Subject: [PATCH 3/3] media: stk1160: use dma_alloc_noncontiguous API
Date:   Tue, 11 Jan 2022 08:55:05 +0200
Message-Id: <20220111065505.6323-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220111065505.6323-1-dafna.hirschfeld@collabora.com>
References: <20220111065505.6323-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace the urb buffers allocation to
use the noncontiguous API. This improve performance
on Arm.
The noncontiguous API require handling
synchronization.
This commit is similar to the one sent to
uvc: [1]

[1] https://lkml.org/lkml/2021/3/12/1506

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/usb/stk1160/stk1160-v4l.c   |   3 +
 drivers/media/usb/stk1160/stk1160-video.c | 109 +++++++++++++---------
 drivers/media/usb/stk1160/stk1160.h       |  10 ++
 3 files changed, 79 insertions(+), 43 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-v4l.c b/drivers/media/usb/stk1160/stk1160-v4l.c
index a06030451db4..31c34734425b 100644
--- a/drivers/media/usb/stk1160/stk1160-v4l.c
+++ b/drivers/media/usb/stk1160/stk1160-v4l.c
@@ -232,6 +232,9 @@ static int stk1160_start_streaming(struct stk1160 *dev)
 
 	/* submit urbs and enables IRQ */
 	for (i = 0; i < dev->isoc_ctl.num_bufs; i++) {
+		struct stk1160_urb *stk_urb = &dev->isoc_ctl.stk1160_urb[i];
+
+		dma_sync_sgtable_for_device(stk1160_get_dmadev(dev), stk_urb->sgt, DMA_FROM_DEVICE);
 		rc = usb_submit_urb(dev->isoc_ctl.stk1160_urb[i].urb, GFP_KERNEL);
 		if (rc) {
 			stk1160_err("cannot submit urb[%d] (%d)\n", i, rc);
diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index 4194d31b53bb..fdc0de2af4c0 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -295,7 +295,8 @@ static void stk1160_process_isoc(struct stk1160 *dev, struct urb *urb)
 static void stk1160_isoc_irq(struct urb *urb)
 {
 	int i, rc;
-	struct stk1160 *dev = urb->context;
+	struct stk1160_urb *stk_urb = urb->context;
+	struct stk1160 *dev = stk_urb->dev;
 
 	switch (urb->status) {
 	case 0:
@@ -310,6 +311,9 @@ static void stk1160_isoc_irq(struct urb *urb)
 		return;
 	}
 
+	dma_sync_sgtable_for_cpu(stk1160_get_dmadev(dev), stk_urb->sgt, DMA_FROM_DEVICE);
+	invalidate_kernel_vmap_range(stk_urb->transfer_buffer, urb->transfer_buffer_length);
+
 	stk1160_process_isoc(dev, urb);
 
 	/* Reset urb buffers */
@@ -318,6 +322,7 @@ static void stk1160_isoc_irq(struct urb *urb)
 		urb->iso_frame_desc[i].actual_length = 0;
 	}
 
+	dma_sync_sgtable_for_device(stk1160_get_dmadev(dev), stk_urb->sgt, DMA_FROM_DEVICE);
 	rc = usb_submit_urb(urb, GFP_ATOMIC);
 	if (rc)
 		stk1160_err("urb re-submit failed (%d)\n", rc);
@@ -353,37 +358,34 @@ void stk1160_cancel_isoc(struct stk1160 *dev)
 	stk1160_dbg("all urbs killed\n");
 }
 
+static void stk_free_urb_buffer(struct stk1160 *dev, struct stk1160_urb *stk_urb)
+{
+	struct device *dma_dev = stk1160_get_dmadev(dev);
+
+	dma_vunmap_noncontiguous(dma_dev, stk_urb->transfer_buffer);
+	dma_free_noncontiguous(dma_dev, stk_urb->urb->transfer_buffer_length, stk_urb->sgt,
+			       DMA_FROM_DEVICE);
+	usb_free_urb(stk_urb->urb);
+
+	stk_urb->transfer_buffer = NULL;
+	stk_urb->sgt = NULL;
+	stk_urb->urb = NULL;
+	stk_urb->dev = NULL;
+	stk_urb->dma = 0;
+}
+
 /*
  * Releases urb and transfer buffers
  * Obviusly, associated urb must be killed before releasing it.
  */
 void stk1160_free_isoc(struct stk1160 *dev)
 {
-	struct urb *urb;
 	int i, num_bufs = dev->isoc_ctl.num_bufs;
 
 	stk1160_dbg("freeing %d urb buffers...\n", num_bufs);
 
-	for (i = 0; i < num_bufs; i++) {
-
-		urb = dev->isoc_ctl.stk1160_urb[i].urb;
-		if (urb) {
-
-			if (dev->isoc_ctl.stk1160_urb[i].transfer_buffer) {
-#ifndef CONFIG_DMA_NONCOHERENT
-				usb_free_coherent(dev->udev,
-					urb->transfer_buffer_length,
-					dev->isoc_ctl.stk1160_urb[i].transfer_buffer,
-					urb->transfer_dma);
-#else
-				kfree(dev->isoc_ctl.stk1160_urb[i].transfer_buffer);
-#endif
-			}
-			usb_free_urb(urb);
-			dev->isoc_ctl.stk1160_urb[i].urb = NULL;
-		}
-		dev->isoc_ctl.stk1160_urb[i].transfer_buffer = NULL;
-	}
+	for (i = 0; i < num_bufs; i++)
+		stk_free_urb_buffer(dev, &dev->isoc_ctl.stk1160_urb[i]);
 
 	dev->isoc_ctl.num_bufs = 0;
 
@@ -400,6 +402,39 @@ void stk1160_uninit_isoc(struct stk1160 *dev)
 	stk1160_free_isoc(dev);
 }
 
+static int stk1160_fill_urb(struct stk1160 *dev, struct stk1160_urb *stk_urb, int sb_size,
+			    int max_packets)
+{
+	struct device *dma_dev = stk1160_get_dmadev(dev);
+
+	stk_urb->urb = usb_alloc_urb(max_packets, GFP_KERNEL);
+	if (!stk_urb->urb)
+		return -ENOMEM;
+	stk_urb->sgt = dma_alloc_noncontiguous(dma_dev, sb_size, DMA_FROM_DEVICE, GFP_KERNEL, 0);
+
+	/*
+	 * If the buffer allocation failed, we exit but return 0 since we allow driver
+	 * working with less buffers
+	 */
+	if (!stk_urb->sgt)
+		goto free_urb;
+
+	stk_urb->transfer_buffer = dma_vmap_noncontiguous(dma_dev, sb_size, stk_urb->sgt);
+	if (!stk_urb->transfer_buffer)
+		goto free_sgt;
+
+	stk_urb->dma = stk_urb->sgt->sgl->dma_address;
+	stk_urb->dev = dev;
+	return 0;
+free_sgt:
+	dma_free_noncontiguous(dma_dev, sb_size, stk_urb->sgt, DMA_FROM_DEVICE);
+	stk_urb->sgt = NULL;
+free_urb:
+	usb_free_urb(stk_urb->urb);
+	stk_urb->urb = NULL;
+
+	return 0;
+}
 /*
  * Allocate URBs
  */
@@ -407,6 +442,7 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 {
 	struct urb *urb;
 	int i, j, k, sb_size, max_packets, num_bufs;
+	int ret;
 
 	/*
 	 * It may be necessary to release isoc here,
@@ -428,21 +464,13 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 	/* allocate urbs and transfer buffers */
 	for (i = 0; i < num_bufs; i++) {
 
-		urb = usb_alloc_urb(max_packets, GFP_KERNEL);
-		if (!urb)
+		ret = stk1160_fill_urb(dev, &dev->isoc_ctl.stk1160_urb[i], sb_size, max_packets);
+		if (ret)
 			goto free_i_bufs;
-		dev->isoc_ctl.stk1160_urb[i].urb = urb;
-
-#ifndef CONFIG_DMA_NONCOHERENT
-		dev->isoc_ctl.stk1160_urb[i].transfer_buffer =
-			usb_alloc_coherent(dev->udev, sb_size, GFP_KERNEL, &urb->transfer_dma);
-#else
-		dev->isoc_ctl.stk1160_urb[i].transfer_buffer = kmalloc(sb_size, GFP_KERNEL);
-#endif
-		if (!dev->isoc_ctl.stk1160_urb[i].transfer_buffer) {
-			stk1160_err("cannot alloc %d bytes for tx[%d] buffer\n",
-				sb_size, i);
 
+		urb = dev->isoc_ctl.stk1160_urb[i].urb;
+
+		if (!urb) {
 			/* Not enough transfer buffers, so just give up */
 			if (i < STK1160_MIN_BUFS)
 				goto free_i_bufs;
@@ -458,15 +486,12 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 		urb->transfer_buffer = dev->isoc_ctl.stk1160_urb[i].transfer_buffer;
 		urb->transfer_buffer_length = sb_size;
 		urb->complete = stk1160_isoc_irq;
-		urb->context = dev;
+		urb->context = &dev->isoc_ctl.stk1160_urb[i];
 		urb->interval = 1;
 		urb->start_frame = 0;
 		urb->number_of_packets = max_packets;
-#ifndef CONFIG_DMA_NONCOHERENT
 		urb->transfer_flags = URB_ISO_ASAP | URB_NO_TRANSFER_DMA_MAP;
-#else
-		urb->transfer_flags = URB_ISO_ASAP;
-#endif
+		urb->transfer_dma = dev->isoc_ctl.stk1160_urb[i].dma;
 
 		k = 0;
 		for (j = 0; j < max_packets; j++) {
@@ -490,8 +515,6 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 	 * enough to work fine, so we just free the extra urb,
 	 * store the allocated count and keep going, fingers crossed!
 	 */
-	usb_free_urb(dev->isoc_ctl.stk1160_urb[i].urb);
-	dev->isoc_ctl.stk1160_urb[i].urb = NULL;
 
 	stk1160_warn("%d urbs allocated. Trying to continue...\n", i);
 
@@ -501,7 +524,7 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 
 free_i_bufs:
 	/* Save the allocated buffers so far, so we can properly free them */
-	dev->isoc_ctl.num_bufs = i+1;
+	dev->isoc_ctl.num_bufs = i;
 	stk1160_free_isoc(dev);
 	return -ENOMEM;
 }
diff --git a/drivers/media/usb/stk1160/stk1160.h b/drivers/media/usb/stk1160/stk1160.h
index 1ffca1343d88..52bea7815ae5 100644
--- a/drivers/media/usb/stk1160/stk1160.h
+++ b/drivers/media/usb/stk1160/stk1160.h
@@ -16,6 +16,8 @@
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
 
 #define STK1160_VERSION		"0.9.5"
 #define STK1160_VERSION_NUM	0x000905
@@ -87,6 +89,9 @@ struct stk1160_buffer {
 struct stk1160_urb {
 	struct urb *urb;
 	char *transfer_buffer;
+	struct sg_table *sgt;
+	struct stk1160 *dev;
+	dma_addr_t dma;
 };
 
 struct stk1160_isoc_ctl {
@@ -190,3 +195,8 @@ void stk1160_select_input(struct stk1160 *dev);
 
 /* Provided by stk1160-ac97.c */
 void stk1160_ac97_setup(struct stk1160 *dev);
+
+static inline struct device *stk1160_get_dmadev(struct stk1160 *dev)
+{
+	return bus_to_hcd(dev->udev->bus)->self.sysdev;
+}
-- 
2.17.1

