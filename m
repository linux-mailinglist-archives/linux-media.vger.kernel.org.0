Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E660148A802
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 07:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348349AbiAKG4M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 01:56:12 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45392 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348348AbiAKG4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 01:56:10 -0500
Received: from localhost.localdomain (unknown [IPv6:2a00:c281:14a3:8100:8072:ec19:b639:c4ab])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CF2B61F4409B;
        Tue, 11 Jan 2022 06:56:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1641884167;
        bh=8oowA17GymZEoHGk/YGso5OcG6BlTUZOleF572Qbu7U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LcIXyR8wpZofzlhrVgLTteyz2kpa57Xw9nqqCgJYzSGshx4es0y8hE+/vk/tMgQM8
         eipVAxJ/kGyj2JkiA1YLLLf4Q1+O0XCRLs60ClQwP01p04gdLK7uDBmQGyyjkVyWPK
         s7DzdYRoZ+2rWIHrnWrDkYgKTtx6D+DX41QvEjP5bX91YLq4s12bs4VWmYRL9PbSPM
         3TlNq/K4QuQb/qVE6c5mIT/6qpy2o8oUu0se6A2CO8ZZ6iIK2fqRC4ssA4QrU9yu7j
         zvje52rtRzaoK7xRqo3kT0mu53aCElMCNgS/5wubu1K0Qqdk5Uyok921UjtPqU1gPa
         ZSbqWG6+vpQ3Q==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     ezequiel@vanguardiasur.com.ar
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, ribalda@chromium.org, tfiga@chromium.org,
        senozhatsky@google.com, hch@lst.de,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com
Subject: [PATCH 2/3] media: stk1160: move transfer_buffer and urb to same struct 'stk1160_urb'
Date:   Tue, 11 Jan 2022 08:55:04 +0200
Message-Id: <20220111065505.6323-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220111065505.6323-1-dafna.hirschfeld@collabora.com>
References: <20220111065505.6323-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of having two separated arrays, one for the urbs and
one for their buffers, have one array of a struct containing both.
In addition, the array is just 16 pointers, no need to dynamically
allocate it.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/usb/stk1160/stk1160-v4l.c   |  2 +-
 drivers/media/usb/stk1160/stk1160-video.c | 50 ++++++++---------------
 drivers/media/usb/stk1160/stk1160.h       | 11 ++---
 3 files changed, 23 insertions(+), 40 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-v4l.c b/drivers/media/usb/stk1160/stk1160-v4l.c
index 6a4eb616d516..a06030451db4 100644
--- a/drivers/media/usb/stk1160/stk1160-v4l.c
+++ b/drivers/media/usb/stk1160/stk1160-v4l.c
@@ -232,7 +232,7 @@ static int stk1160_start_streaming(struct stk1160 *dev)
 
 	/* submit urbs and enables IRQ */
 	for (i = 0; i < dev->isoc_ctl.num_bufs; i++) {
-		rc = usb_submit_urb(dev->isoc_ctl.urb[i], GFP_KERNEL);
+		rc = usb_submit_urb(dev->isoc_ctl.stk1160_urb[i].urb, GFP_KERNEL);
 		if (rc) {
 			stk1160_err("cannot submit urb[%d] (%d)\n", i, rc);
 			goto out_uninit;
diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index 91bd6adccdd1..4194d31b53bb 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -347,7 +347,7 @@ void stk1160_cancel_isoc(struct stk1160 *dev)
 		 * We don't care for NULL pointer since
 		 * usb_kill_urb allows it.
 		 */
-		usb_kill_urb(dev->isoc_ctl.urb[i]);
+		usb_kill_urb(dev->isoc_ctl.stk1160_urb[i].urb);
 	}
 
 	stk1160_dbg("all urbs killed\n");
@@ -366,30 +366,25 @@ void stk1160_free_isoc(struct stk1160 *dev)
 
 	for (i = 0; i < num_bufs; i++) {
 
-		urb = dev->isoc_ctl.urb[i];
+		urb = dev->isoc_ctl.stk1160_urb[i].urb;
 		if (urb) {
 
-			if (dev->isoc_ctl.transfer_buffer[i]) {
+			if (dev->isoc_ctl.stk1160_urb[i].transfer_buffer) {
 #ifndef CONFIG_DMA_NONCOHERENT
 				usb_free_coherent(dev->udev,
 					urb->transfer_buffer_length,
-					dev->isoc_ctl.transfer_buffer[i],
+					dev->isoc_ctl.stk1160_urb[i].transfer_buffer,
 					urb->transfer_dma);
 #else
-				kfree(dev->isoc_ctl.transfer_buffer[i]);
+				kfree(dev->isoc_ctl.stk1160_urb[i].transfer_buffer);
 #endif
 			}
 			usb_free_urb(urb);
-			dev->isoc_ctl.urb[i] = NULL;
+			dev->isoc_ctl.stk1160_urb[i].urb = NULL;
 		}
-		dev->isoc_ctl.transfer_buffer[i] = NULL;
+		dev->isoc_ctl.stk1160_urb[i].transfer_buffer = NULL;
 	}
 
-	kfree(dev->isoc_ctl.urb);
-	kfree(dev->isoc_ctl.transfer_buffer);
-
-	dev->isoc_ctl.urb = NULL;
-	dev->isoc_ctl.transfer_buffer = NULL;
 	dev->isoc_ctl.num_bufs = 0;
 
 	stk1160_dbg("all urb buffers freed\n");
@@ -429,19 +424,6 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 
 	dev->isoc_ctl.buf = NULL;
 	dev->isoc_ctl.max_pkt_size = dev->max_pkt_size;
-	dev->isoc_ctl.urb = kcalloc(num_bufs, sizeof(void *), GFP_KERNEL);
-	if (!dev->isoc_ctl.urb) {
-		stk1160_err("out of memory for urb array\n");
-		return -ENOMEM;
-	}
-
-	dev->isoc_ctl.transfer_buffer = kcalloc(num_bufs, sizeof(void *),
-						GFP_KERNEL);
-	if (!dev->isoc_ctl.transfer_buffer) {
-		stk1160_err("out of memory for usb transfers\n");
-		kfree(dev->isoc_ctl.urb);
-		return -ENOMEM;
-	}
 
 	/* allocate urbs and transfer buffers */
 	for (i = 0; i < num_bufs; i++) {
@@ -449,15 +431,15 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 		urb = usb_alloc_urb(max_packets, GFP_KERNEL);
 		if (!urb)
 			goto free_i_bufs;
-		dev->isoc_ctl.urb[i] = urb;
+		dev->isoc_ctl.stk1160_urb[i].urb = urb;
 
 #ifndef CONFIG_DMA_NONCOHERENT
-		dev->isoc_ctl.transfer_buffer[i] = usb_alloc_coherent(dev->udev,
-			sb_size, GFP_KERNEL, &urb->transfer_dma);
+		dev->isoc_ctl.stk1160_urb[i].transfer_buffer =
+			usb_alloc_coherent(dev->udev, sb_size, GFP_KERNEL, &urb->transfer_dma);
 #else
-		dev->isoc_ctl.transfer_buffer[i] = kmalloc(sb_size, GFP_KERNEL);
+		dev->isoc_ctl.stk1160_urb[i].transfer_buffer = kmalloc(sb_size, GFP_KERNEL);
 #endif
-		if (!dev->isoc_ctl.transfer_buffer[i]) {
+		if (!dev->isoc_ctl.stk1160_urb[i].transfer_buffer) {
 			stk1160_err("cannot alloc %d bytes for tx[%d] buffer\n",
 				sb_size, i);
 
@@ -466,14 +448,14 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 				goto free_i_bufs;
 			goto nomore_tx_bufs;
 		}
-		memset(dev->isoc_ctl.transfer_buffer[i], 0, sb_size);
+		memset(dev->isoc_ctl.stk1160_urb[i].transfer_buffer, 0, sb_size);
 
 		/*
 		 * FIXME: Where can I get the endpoint?
 		 */
 		urb->dev = dev->udev;
 		urb->pipe = usb_rcvisocpipe(dev->udev, STK1160_EP_VIDEO);
-		urb->transfer_buffer = dev->isoc_ctl.transfer_buffer[i];
+		urb->transfer_buffer = dev->isoc_ctl.stk1160_urb[i].transfer_buffer;
 		urb->transfer_buffer_length = sb_size;
 		urb->complete = stk1160_isoc_irq;
 		urb->context = dev;
@@ -508,8 +490,8 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
 	 * enough to work fine, so we just free the extra urb,
 	 * store the allocated count and keep going, fingers crossed!
 	 */
-	usb_free_urb(dev->isoc_ctl.urb[i]);
-	dev->isoc_ctl.urb[i] = NULL;
+	usb_free_urb(dev->isoc_ctl.stk1160_urb[i].urb);
+	dev->isoc_ctl.stk1160_urb[i].urb = NULL;
 
 	stk1160_warn("%d urbs allocated. Trying to continue...\n", i);
 
diff --git a/drivers/media/usb/stk1160/stk1160.h b/drivers/media/usb/stk1160/stk1160.h
index a31ea1c80f25..1ffca1343d88 100644
--- a/drivers/media/usb/stk1160/stk1160.h
+++ b/drivers/media/usb/stk1160/stk1160.h
@@ -84,6 +84,11 @@ struct stk1160_buffer {
 	unsigned int pos;		/* current pos inside buffer */
 };
 
+struct stk1160_urb {
+	struct urb *urb;
+	char *transfer_buffer;
+};
+
 struct stk1160_isoc_ctl {
 	/* max packet size of isoc transaction */
 	int max_pkt_size;
@@ -91,11 +96,7 @@ struct stk1160_isoc_ctl {
 	/* number of allocated urbs */
 	int num_bufs;
 
-	/* urb for isoc transfers */
-	struct urb **urb;
-
-	/* transfer buffers for isoc transfer */
-	char **transfer_buffer;
+	struct stk1160_urb stk1160_urb[STK1160_NUM_BUFS];
 
 	/* current buffer */
 	struct stk1160_buffer *buf;
-- 
2.17.1

