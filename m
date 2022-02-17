Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71D074B990D
	for <lists+linux-media@lfdr.de>; Thu, 17 Feb 2022 07:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235446AbiBQGQI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Feb 2022 01:16:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbiBQGQG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Feb 2022 01:16:06 -0500
X-Greylist: delayed 465 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 16 Feb 2022 22:15:52 PST
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F78E2A2286
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 22:15:52 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id B9639580218;
        Thu, 17 Feb 2022 01:08:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 17 Feb 2022 01:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:date:date:from:from:in-reply-to:in-reply-to:message-id
        :references:reply-to:sender:subject:subject:to:to; s=fm2; bh=DV4
        eC2HC66+h0oCSZ3Hu32zxW+HIzDTjoZJ6OQ4xoL8=; b=X/QYnE+jcDXh2eJGOH+
        Lzboy5eV3xI6LjTU8IvothirL1hVd+sQsBFUmvp6R/+XpXkymZFZ/PjTxJq3DxLX
        ezwApyEEdu36Le+3GKF6V0d59piCM5uFS//7ayql/upmbeB8W9YVVsQxZzpjeUwW
        8Ii20OyXjSpr9UCExy8J2JNmLdPKxtEY+Hde8hvoLUdG2r0es5odRB0XJZxFCd6N
        0uQGFrUPNALLXTS61iPDRcakIMtZ9fd5VFmjYX8TjafNRoywQ6Prgqoc1KOGwC/s
        M9Wx4SJU/VeG8EXkzbZJTDyWensuT5CXf+4Dl3otaCGn05x1XILvkrreiXLQQFgK
        sNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:date:date:from:from:in-reply-to
        :in-reply-to:message-id:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=DV4eC2HC66+h0oCSZ3Hu32zxW+HIzDTjoZJ6OQ4xo
        L8=; b=EJIzEYfloidvRmX64mCehS0oS2D4BANOH+ORFuotQpa7qI4EagA8NaT41
        pL3Wdrs0+BweO9U4fAbNYC1mLWMIIt2KzYQg3ZEDKmhwZMj/Yjr9l/fZmfx3a/32
        2gTTlJIy6WIGrPM8oRZFYk1BXjdknz6iluPRXw4n07LSdQl/XTXl21i6yqUxiksT
        X0bwV9tNMGb6XgyQ/pkjvTTUGUy82VRji/a3Q3LH6lwCJinmZwwNQy/0iMZJVB7N
        EIHYBO3kqoCV57EoB3uhlOBwTp/BULNPYFAcUh/JcdpftWXqJubvVl5G7l6V15G4
        5l5q8hCZP8H6sEIsAs7xnyFKpBxZA==
X-ME-Sender: <xms:UOYNYjp-czPrO7L3RaO5nOAcM0_Qu1kp9h_A4uFROe-qkG51wHyW2g>
    <xme:UOYNYtr2Ap22gTeCAru6kRZgIPID-pnjwgfGVtriTottbUnRLLzdI4ZaoBe6J5DLA
    KesXMxjsro9VP5J7tA>
X-ME-Received: <xmr:UOYNYgNPYxhHfIH7HHPQTmKy1aPu-4NcuuGTSxO1UNNy-7IM2QoRH-qKNvsE-LuVbKEamWF12Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeejgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfsedttdertdertd
    dtnecuhfhrohhmpeffrghfnhgrucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghs
    thhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepieffvdfhkeelvdehlefgjeeuud
    ffffevueduudevgfejheffudekgfekgeetleefnecuffhomhgrihhnpehlkhhmlhdrohhr
    ghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurg
    hfnhgrsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:UOYNYm7C7FBF7q6ItzKdYN7cCjIpXSVUTbUpCCBlSE6VMJqWK77pBw>
    <xmx:UOYNYi5hKQnGBlK7mSYPfKBKB5t4hsy21epOq8NrIJmjHMWoriyzOw>
    <xmx:UOYNYuhQPA-ozi4K8IQAKFV4PgabZOXvqJhRLPPREFIFNPHD_-bsng>
    <xmx:UOYNYrFaj9zswzfr_xd0aPF_0PY3NUttTozmF0g5mhXdzxe2NrYHJQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Feb 2022 01:08:13 -0500 (EST)
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     ezequiel@vanguardiasur.com.ar
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, ribalda@chromium.org, tfiga@chromium.org,
        senozhatsky@google.com, hch@lst.de, dafna@fastmail.com,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com
Subject: [PATCH v3 4/4] media: stk1160: use dma_alloc_noncontiguous API
Date:   Thu, 17 Feb 2022 08:07:24 +0200
Message-Id: <20220217060724.7763-5-dafna@fastmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220217060724.7763-1-dafna@fastmail.com>
References: <20220217060724.7763-1-dafna@fastmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Replace the urb buffers allocation to use the noncontiguous API.

This improves performance on ARM platform where DMA coherent allocations
produce uncached mappings. Note that the noncontiguous API
requires the driver to handle synchronization.

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
Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
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
index f3c0497a8539..763c539b4a6e 100644
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
 
+static void stk1160_free_urb(struct stk1160 *dev, struct stk1160_urb *stk_urb)
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
+		stk1160_free_urb(dev, &dev->isoc_ctl.urb_ctl[i]);
 
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

