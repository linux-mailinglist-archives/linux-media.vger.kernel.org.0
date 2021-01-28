Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8875A307CA6
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 18:36:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233159AbhA1Rf6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 12:35:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233144AbhA1RfN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 12:35:13 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECAAC061574
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 09:34:58 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id hs11so9022305ejc.1
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 09:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Td9sExNDd3hj/YGqlp0vIv6OhdNcWQjkUwGW8vuRir4=;
        b=Uxsak+vsn3Rw/EU2SZgEIQVPM3OzUdIJE5hu8Bx3o7qpu1H5FVVeEQmUjsdr949ggG
         mdQ28e53aqaOx9uZMq4+rtNItHDyuNNlwpu9ZP9V31sOgRk41u+v0Vvo+OCBPV9sviSd
         X7P1Ur16H4y2YrNVdrWXFMQpCFr28YUpLXZ+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Td9sExNDd3hj/YGqlp0vIv6OhdNcWQjkUwGW8vuRir4=;
        b=tovcEw5gy7SyYSfajCKbVHPwr2oNflUI7/1sFM5wlfoYnjovnnCalmqlXgoIjFbTF4
         IHieO6nWVb+viMZfayQkIqmrCtl3Gy8NQPwsafJ/T2FEv13RDfZ0d1YQbqf/CUIXlMPt
         G5I7WhLNRQJr6FFW1kLPjBCsMy7Tb9ot5/YEUAYM8cI+JHo+2ZHuvKbqqoK4OxlLT0PY
         48EzatSxIbxNfN8cSpnISXUUL6+6D/VZ7Y9BuwgSclRs2JkRfJ2PcrSlv0XVXdJ6RVNo
         bgmG9Tsvwp6upyvWQsmre4RGWQsvXz3+tfg17NibaEdfeNKP0NdWEGUD8PV8EOnOdCiq
         0jIw==
X-Gm-Message-State: AOAM530PrnC7QhBltRU1ZoGBnQMPnOHFdvGa0QPX5k4hmQq+EOacE5YN
        Ahshexn8gozL4gImHv0c/hvs2A==
X-Google-Smtp-Source: ABdhPJw9qYyucqyOBiK9u5qIq0+j3tWpNsrxZy0mgIeznTneTv94aRdIiWJSM4W+Ba8ABXsxW5F/Eg==
X-Received: by 2002:a17:906:f755:: with SMTP id jp21mr527580ejb.22.1611855296992;
        Thu, 28 Jan 2021 09:34:56 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id s18sm3489358edw.66.2021.01.28.09.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 09:34:55 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 6/6] media: uvcvideo: Use dma_alloc_noncontiguos API
Date:   Thu, 28 Jan 2021 18:34:54 +0100
Message-Id: <20210128173454.255664-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On architectures where the is no coherent caching such as ARM use the
dma_alloc_noncontiguos API and handle manually the cache flushing using
dma_sync_sgtable().

With this patch on the affected architectures we can measure up to 20x
performance improvement in uvc_video_copy_data_work().

Eg: aarch64 with an external usb camera

NON_CONTIGUOUS
frames:  999
packets: 999
empty:   0 (0 %)
errors:  0
invalid: 0
pts: 0 early, 0 initial, 999 ok
scr: 0 count ok, 0 diff ok
sof: 2048 <= sof <= 0, freq 0.000 kHz
bytes 67034480 : duration 33303
FPS: 29.99
URB: 523446/4993 uS/qty: 104.836 avg 132.532 std 13.230 min 831.094 max (uS)
header: 76564/4993 uS/qty: 15.334 avg 15.229 std 3.438 min 186.875 max (uS)
latency: 468945/4992 uS/qty: 93.939 avg 132.577 std 9.531 min 824.010 max (uS)
decode: 54161/4993 uS/qty: 10.847 avg 6.313 std 1.614 min 111.458 max (uS)
raw decode speed: 9.931 Gbits/s
raw URB handling speed: 1.025 Gbits/s
throughput: 16.102 Mbits/s
URB decode CPU usage 0.162600 %

COHERENT
frames:  999
packets: 999
empty:   0 (0 %)
errors:  0
invalid: 0
pts: 0 early, 0 initial, 999 ok
scr: 0 count ok, 0 diff ok
sof: 2048 <= sof <= 0, freq 0.000 kHz
bytes 54683536 : duration 33302
FPS: 29.99
URB: 1478135/4000 uS/qty: 369.533 avg 390.357 std 22.968 min 3337.865 max (uS)
header: 79761/4000 uS/qty: 19.940 avg 18.495 std 1.875 min 336.719 max (uS)
latency: 281077/4000 uS/qty: 70.269 avg 83.102 std 5.104 min 735.000 max (uS)
decode: 1197057/4000 uS/qty: 299.264 avg 318.080 std 1.615 min 2806.667 max (uS)
raw decode speed: 365.470 Mbits/s
raw URB handling speed: 295.986 Mbits/s
throughput: 13.136 Mbits/s
URB decode CPU usage 3.594500 %

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---

v2: 
- Replace DMA_BIDIRECTIONAL with DMA_FROM_DEVICE
- Add invalidate_kernel_vmap_range
- Tested in an X86 notebook and an ARM Chromebook

 drivers/media/usb/uvc/uvc_video.c | 80 ++++++++++++++++++++++---------
 drivers/media/usb/uvc/uvcvideo.h  |  4 +-
 2 files changed, 61 insertions(+), 23 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a6a441d92b94..378fb5f29920 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -6,11 +6,13 @@
  *          Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
+#include <linux/highmem.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/usb.h>
+#include <linux/usb/hcd.h>
 #include <linux/videodev2.h>
 #include <linux/vmalloc.h>
 #include <linux/wait.h>
@@ -1097,6 +1099,26 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 	return data[0];
 }
 
+static inline struct device *stream_to_dmadev(struct uvc_streaming *stream)
+{
+	return bus_to_hcd(stream->dev->udev->bus)->self.sysdev;
+}
+
+static void uvc_urb_dma_sync(struct uvc_urb *uvc_urb, bool for_device)
+{
+	struct device *dma_dev = dma_dev = stream_to_dmadev(uvc_urb->stream);
+
+	if (for_device) {
+		dma_sync_sgtable_for_device(dma_dev, uvc_urb->sgt,
+					    DMA_FROM_DEVICE);
+	} else {
+		dma_sync_sgtable_for_cpu(dma_dev, uvc_urb->sgt,
+					 DMA_FROM_DEVICE);
+		invalidate_kernel_vmap_range(uvc_urb->buffer,
+					     uvc_urb->stream->urb_size);
+	}
+}
+
 /*
  * uvc_video_decode_data_work: Asynchronous memcpy processing
  *
@@ -1118,6 +1140,8 @@ static void uvc_video_copy_data_work(struct work_struct *work)
 		uvc_queue_buffer_release(op->buf);
 	}
 
+	uvc_urb_dma_sync(uvc_urb, true);
+
 	ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
 	if (ret < 0)
 		uvc_printk(KERN_ERR, "Failed to resubmit video URB (%d).\n",
@@ -1539,10 +1563,12 @@ static void uvc_video_complete(struct urb *urb)
 	 * Process the URB headers, and optionally queue expensive memcpy tasks
 	 * to be deferred to a work queue.
 	 */
+	uvc_urb_dma_sync(uvc_urb, false);
 	stream->decode(uvc_urb, buf, buf_meta);
 
 	/* If no async work is needed, resubmit the URB immediately. */
 	if (!uvc_urb->async_operations) {
+		uvc_urb_dma_sync(uvc_urb, true);
 		ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
 		if (ret < 0)
 			uvc_printk(KERN_ERR,
@@ -1559,24 +1585,47 @@ static void uvc_video_complete(struct urb *urb)
  */
 static void uvc_free_urb_buffers(struct uvc_streaming *stream)
 {
+	struct device *dma_dev = dma_dev = stream_to_dmadev(stream);
 	struct uvc_urb *uvc_urb;
 
 	for_each_uvc_urb(uvc_urb, stream) {
 		if (!uvc_urb->buffer)
 			continue;
 
-#ifndef CONFIG_DMA_NONCOHERENT
-		usb_free_coherent(stream->dev->udev, stream->urb_size,
-				  uvc_urb->buffer, uvc_urb->dma);
-#else
-		kfree(uvc_urb->buffer);
-#endif
+		dma_vunmap_noncontiguous(dma_dev, uvc_urb->buffer);
+		dma_free_noncontiguous(dma_dev, stream->urb_size, uvc_urb->sgt,
+				       uvc_urb->dma, DMA_FROM_DEVICE);
+
 		uvc_urb->buffer = NULL;
 	}
 
 	stream->urb_size = 0;
 }
 
+static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
+				 struct uvc_urb *uvc_urb, gfp_t gfp_flags)
+{
+	struct device *dma_dev = stream_to_dmadev(stream);
+
+
+	uvc_urb->sgt = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
+					       &uvc_urb->dma, DMA_FROM_DEVICE,
+					       gfp_flags);
+	if (!uvc_urb->sgt)
+		return false;
+
+	uvc_urb->buffer = dma_vmap_noncontiguous(dma_dev, stream->urb_size,
+						 uvc_urb->sgt);
+	if (!uvc_urb->buffer) {
+		dma_free_noncontiguous(dma_dev, stream->urb_size,
+				       uvc_urb->sgt, uvc_urb->dma,
+				       DMA_FROM_DEVICE);
+		return false;
+	}
+
+	return true;
+}
+
 /*
  * Allocate transfer buffers. This function can be called with buffers
  * already allocated when resuming from suspend, in which case it will
@@ -1607,19 +1656,11 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
 
 	/* Retry allocations until one succeed. */
 	for (; npackets > 1; npackets /= 2) {
+		stream->urb_size = psize * npackets;
 		for (i = 0; i < UVC_URBS; ++i) {
 			struct uvc_urb *uvc_urb = &stream->uvc_urb[i];
 
-			stream->urb_size = psize * npackets;
-#ifndef CONFIG_DMA_NONCOHERENT
-			uvc_urb->buffer = usb_alloc_coherent(
-				stream->dev->udev, stream->urb_size,
-				gfp_flags | __GFP_NOWARN, &uvc_urb->dma);
-#else
-			uvc_urb->buffer =
-			    kmalloc(stream->urb_size, gfp_flags | __GFP_NOWARN);
-#endif
-			if (!uvc_urb->buffer) {
+			if (!uvc_alloc_urb_buffer(stream, uvc_urb, gfp_flags)) {
 				uvc_free_urb_buffers(stream);
 				break;
 			}
@@ -1728,12 +1769,8 @@ static int uvc_init_video_isoc(struct uvc_streaming *stream,
 		urb->context = uvc_urb;
 		urb->pipe = usb_rcvisocpipe(stream->dev->udev,
 				ep->desc.bEndpointAddress);
-#ifndef CONFIG_DMA_NONCOHERENT
 		urb->transfer_flags = URB_ISO_ASAP | URB_NO_TRANSFER_DMA_MAP;
 		urb->transfer_dma = uvc_urb->dma;
-#else
-		urb->transfer_flags = URB_ISO_ASAP;
-#endif
 		urb->interval = ep->desc.bInterval;
 		urb->transfer_buffer = uvc_urb->buffer;
 		urb->complete = uvc_video_complete;
@@ -1793,10 +1830,8 @@ static int uvc_init_video_bulk(struct uvc_streaming *stream,
 
 		usb_fill_bulk_urb(urb, stream->dev->udev, pipe,	uvc_urb->buffer,
 				  size, uvc_video_complete, uvc_urb);
-#ifndef CONFIG_DMA_NONCOHERENT
 		urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
 		urb->transfer_dma = uvc_urb->dma;
-#endif
 
 		uvc_urb->urb = urb;
 	}
@@ -1891,6 +1926,7 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
 
 	/* Submit the URBs. */
 	for_each_uvc_urb(uvc_urb, stream) {
+		uvc_urb_dma_sync(uvc_urb, true);
 		ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
 		if (ret < 0) {
 			uvc_printk(KERN_ERR, "Failed to submit URB %u (%d).\n",
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index a3dfacf069c4..a386114bd229 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -521,7 +521,8 @@ struct uvc_copy_op {
  * @urb: the URB described by this context structure
  * @stream: UVC streaming context
  * @buffer: memory storage for the URB
- * @dma: DMA coherent addressing for the urb_buffer
+ * @dma: Allocated DMA handle
+ * @sgt: sgt_table with the urb locations in memory
  * @async_operations: counter to indicate the number of copy operations
  * @copy_operations: work descriptors for asynchronous copy operations
  * @work: work queue entry for asynchronous decode
@@ -532,6 +533,7 @@ struct uvc_urb {
 
 	char *buffer;
 	dma_addr_t dma;
+	struct sg_table *sgt;
 
 	unsigned int async_operations;
 	struct uvc_copy_op copy_operations[UVC_MAX_PACKETS];
-- 
2.30.0.280.ga3ce27912f-goog

