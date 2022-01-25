Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E79849AFB1
	for <lists+linux-media@lfdr.de>; Tue, 25 Jan 2022 10:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354907AbiAYJPl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jan 2022 04:15:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1454017AbiAYI5S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jan 2022 03:57:18 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FB2FC04965B
        for <linux-media@vger.kernel.org>; Tue, 25 Jan 2022 00:02:56 -0800 (PST)
Received: from localhost.localdomain (unknown [IPv6:2a00:c281:1137:e00:5903:19ba:8e99:7984])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 135EF1F43E20;
        Tue, 25 Jan 2022 08:02:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1643097775;
        bh=k1vBY+tVVMeozFGqdPX6vnr57tjlNN2mxNYTTUMpTm0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PlGXFPbElPnZSwAYjiJpmQZngCNxxQEyVTgy40fOzyJTjvcsbsjKAdJ1/0fCpEnn4
         NwPFBDhYh/+vBAHNnEKOjS9TTWXHa1FEDxtvuR1Sh9CzjRbLUl9ZRYm3xB5YoB5lgV
         JcLMfM/eUhmRDnbhcSEAygAVvjXzcZD32s4L3pUBQHTDAoK8x8dUMT6GxRJkqxJob5
         xBC1HePBZY7+wGkgXSNuespEZhd50e7eRNRiJzL2FjcaeEMF8eXTQPci3A1lQJnYpU
         h63aB2yhnbHP9t8KqmxmNFr9n6kpU7e6cTrj1hdh+1LEFBeovzjHoND9ZITg6TfHIX
         o51bJDBrj9KdQ==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     ezequiel@vanguardiasur.com.ar
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        ribalda@chromium.org, tfiga@chromium.org, senozhatsky@google.com,
        hch@lst.de, dafna3@gmail.com
Subject: [PATCH v2 4/4] media: stk1160: use dma_alloc_noncontiguous API
Date:   Tue, 25 Jan 2022 10:02:13 +0200
Message-Id: <20220125080213.30090-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220125080213.30090-1-dafna.hirschfeld@collabora.com>
References: <20220125080213.30090-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace the urb buffers allocation to use the
noncontiguous API. This improves performance on ARM
platform since the previous dma allocation was
coherent dma allocation which disables the cache on
ARM platforms. With the noncontiguous API the cache
is not disabled.
The noncontiguous API requires the driver to
handle synchronization.
This commit is similar to this one for the uvc driver:

    https://lkml.org/lkml/2021/3/12/1506

Performance tests on rock-pi4 (Arm64) shows about 15x
improvements:

== DMA NONCONTIGUOUS ==
total durations: 20.63678480 sec
urb processing durations: 0.286864889 sec
uS/qty: 286864/2508 avg: 114.379 min: 0.583 max: 155.461 (uS)
FPS: 24.92
lost: 0 done: 500
raw decode speed: 11.603 Gbits/s
bytes 414831228.000
bytes/urb: 165403

== DMA COHERENT ==
total durations: 20.73551767 sec
urb processing durations: 4.541559160 sec
uS/qty: 4541559/2509 avg: 1810.107 min: 0.583 max: 2113.163 (uS)
FPS: 24.90
lost: 0 done: 500
raw decode speed: 730.738 Mbits/s
bytes 414785444.000
bytes/urb: 165319

Performance tests on x86 laptop show no significant
difference:

== DMA NONCONTIGUOUS ==
total durations: 20.220590102 sec
urb processing durations: 0.63021818 sec
uS/qty: 63021/2512 avg: 25.088 min: 0.138 max: 146.750 (uS)
FPS: 24.72
lost: 0 done: 500
raw decode speed: 52.751 Gbits/s
bytes 415421032.000
bytes/urb: 165374

== DMA COHERENT ==
total durations: 20.220475614 sec
urb processing durations: 0.64751972 sec
uS/qty: 64751/2512 avg: 25.777 min: 0.168 max: 132.250 (uS)
FPS: 24.72
lost: 0 done: 500
raw decode speed: 51.927 Gbits/s
bytes 415422794.000
bytes/urb: 165375

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/usb/stk1160/stk1160-v4l.c   |   4 +
 drivers/media/usb/stk1160/stk1160-video.c | 114 +++++++++++++---------
 drivers/media/usb/stk1160/stk1160.h       |  10 ++
 3 files changed, 84 insertions(+), 44 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-v4l.c b/drivers/media/usb/stk1160/stk1160-v4l.c
index ebf245d44005..a1f785a5ffd8 100644
--- a/drivers/media/usb/stk1160/stk1160-v4l.c
+++ b/drivers/media/usb/stk1160/stk1160-v4l.c
@@ -232,6 +232,10 @@ static int stk1160_start_streaming(struct stk1160 *dev)
 
 	/* submit urbs and enables IRQ */
 	for (i = 0; i < dev->isoc_ctl.num_bufs; i++) {
+		struct stk1160_urb *stk_urb = &dev->isoc_ctl.urb_ctl[i];
+
+		dma_sync_sgtable_for_device(stk1160_get_dmadev(dev), stk_urb->sgt,
+					    DMA_FROM_DEVICE);
 		rc = usb_submit_urb(dev->isoc_ctl.urb_ctl[i].urb, GFP_KERNEL);
 		if (rc) {
 			stk1160_err("cannot submit urb[%d] (%d)\n", i, rc);
diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index f3c0497a8539..6600afc565b8 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -295,7 +295,9 @@ static void stk1160_process_isoc(struct stk1160 *dev, struct urb *urb)
 static void stk1160_isoc_irq(struct urb *urb)
 {
 	int i, rc;
-	struct stk1160 *dev = urb->context;
+	struct stk1160_urb *stk_urb = urb->context;
+	struct stk1160 *dev = stk_urb->dev;
+	struct device *dma_dev = stk1160_get_dmadev(dev);
 
 	switch (urb->status) {
 	case 0:
@@ -310,6 +312,10 @@ static void stk1160_isoc_irq(struct urb *urb)
 		return;
 	}
 
+	invalidate_kernel_vmap_range(stk_urb->transfer_buffer,
+				     urb->transfer_buffer_length);
+	dma_sync_sgtable_for_cpu(dma_dev, stk_urb->sgt, DMA_FROM_DEVICE);
+
 	stk1160_process_isoc(dev, urb);
 
 	/* Reset urb buffers */
@@ -318,6 +324,7 @@ static void stk1160_isoc_irq(struct urb *urb)
 		urb->iso_frame_desc[i].actual_length = 0;
 	}
 
+	dma_sync_sgtable_for_device(dma_dev, stk_urb->sgt, DMA_FROM_DEVICE);
 	rc = usb_submit_urb(urb, GFP_ATOMIC);
 	if (rc)
 		stk1160_err("urb re-submit failed (%d)\n", rc);
@@ -353,37 +360,34 @@ void stk1160_cancel_isoc(struct stk1160 *dev)
 	stk1160_dbg("all urbs killed\n");
 }
 
+static void stk_free_urb_buffer(struct stk1160 *dev, struct stk1160_urb *stk_urb)
+{
+	struct device *dma_dev = stk1160_get_dmadev(dev);
+
+	dma_vunmap_noncontiguous(dma_dev, stk_urb->transfer_buffer);
+	dma_free_noncontiguous(dma_dev, stk_urb->urb->transfer_buffer_length,
+			       stk_urb->sgt, DMA_FROM_DEVICE);
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
-		urb = dev->isoc_ctl.urb_ctl[i].urb;
-		if (urb) {
-
-			if (dev->isoc_ctl.urb_ctl[i].transfer_buffer) {
-#ifndef CONFIG_DMA_NONCOHERENT
-				usb_free_coherent(dev->udev,
-					urb->transfer_buffer_length,
-					dev->isoc_ctl.urb_ctl[i].transfer_buffer,
-					urb->transfer_dma);
-#else
-				kfree(dev->isoc_ctl.urb_ctl[i].transfer_buffer);
-#endif
-			}
-			usb_free_urb(urb);
-			dev->isoc_ctl.urb_ctl[i].urb = NULL;
-		}
-		dev->isoc_ctl.urb_ctl[i].transfer_buffer = NULL;
-	}
+	for (i = 0; i < num_bufs; i++)
+		stk_free_urb_buffer(dev, &dev->isoc_ctl.urb_ctl[i]);
 
 	dev->isoc_ctl.num_bufs = 0;
 
@@ -400,6 +404,41 @@ void stk1160_uninit_isoc(struct stk1160 *dev)
 	stk1160_free_isoc(dev);
 }
 
+static int stk1160_fill_urb(struct stk1160 *dev, struct stk1160_urb *stk_urb,
+			    int sb_size, int max_packets)
+{
+	struct device *dma_dev = stk1160_get_dmadev(dev);
+
+	stk_urb->urb = usb_alloc_urb(max_packets, GFP_KERNEL);
+	if (!stk_urb->urb)
+		return -ENOMEM;
+	stk_urb->sgt = dma_alloc_noncontiguous(dma_dev, sb_size,
+					       DMA_FROM_DEVICE, GFP_KERNEL, 0);
+
+	/*
+	 * If the buffer allocation failed, we exit but return 0 since
+	 * we allow the driver working with less buffers
+	 */
+	if (!stk_urb->sgt)
+		goto free_urb;
+
+	stk_urb->transfer_buffer = dma_vmap_noncontiguous(dma_dev, sb_size,
+							  stk_urb->sgt);
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
@@ -407,6 +446,7 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 {
 	struct urb *urb;
 	int i, j, k, sb_size, max_packets, num_bufs;
+	int ret;
 
 	/*
 	 * It may be necessary to release isoc here,
@@ -428,23 +468,14 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 	/* allocate urbs and transfer buffers */
 	for (i = 0; i < num_bufs; i++) {
 
-		urb = usb_alloc_urb(max_packets, GFP_KERNEL);
-		if (!urb)
+		ret = stk1160_fill_urb(dev, &dev->isoc_ctl.urb_ctl[i],
+				       sb_size, max_packets);
+		if (ret)
 			goto free_i_bufs;
-		dev->isoc_ctl.urb_ctl[i].urb = urb;
-
-#ifndef CONFIG_DMA_NONCOHERENT
-		dev->isoc_ctl.urb_ctl[i].transfer_buffer =
-			usb_alloc_coherent(dev->udev, sb_size, GFP_KERNEL,
-					   &urb->transfer_dma);
-#else
-		dev->isoc_ctl.urb_ctl[i].transfer_buffer =
-			kmalloc(sb_size, GFP_KERNEL);
-#endif
-		if (!dev->isoc_ctl.urb_ctl[i].transfer_buffer) {
-			stk1160_err("cannot alloc %d bytes for tx[%d] buffer\n",
-				sb_size, i);
 
+		urb = dev->isoc_ctl.urb_ctl[i].urb;
+
+		if (!urb) {
 			/* Not enough transfer buffers, so just give up */
 			if (i < STK1160_MIN_BUFS)
 				goto free_i_bufs;
@@ -460,15 +491,12 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 		urb->transfer_buffer = dev->isoc_ctl.urb_ctl[i].transfer_buffer;
 		urb->transfer_buffer_length = sb_size;
 		urb->complete = stk1160_isoc_irq;
-		urb->context = dev;
+		urb->context = &dev->isoc_ctl.urb_ctl[i];
 		urb->interval = 1;
 		urb->start_frame = 0;
 		urb->number_of_packets = max_packets;
-#ifndef CONFIG_DMA_NONCOHERENT
 		urb->transfer_flags = URB_ISO_ASAP | URB_NO_TRANSFER_DMA_MAP;
-#else
-		urb->transfer_flags = URB_ISO_ASAP;
-#endif
+		urb->transfer_dma = dev->isoc_ctl.urb_ctl[i].dma;
 
 		k = 0;
 		for (j = 0; j < max_packets; j++) {
@@ -492,8 +520,6 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 	 * enough to work fine, so we just free the extra urb,
 	 * store the allocated count and keep going, fingers crossed!
 	 */
-	usb_free_urb(dev->isoc_ctl.urb_ctl[i].urb);
-	dev->isoc_ctl.urb_ctl[i].urb = NULL;
 
 	stk1160_warn("%d urbs allocated. Trying to continue...\n", i);
 
diff --git a/drivers/media/usb/stk1160/stk1160.h b/drivers/media/usb/stk1160/stk1160.h
index 0c355bb078c1..7b498d14ed7a 100644
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

