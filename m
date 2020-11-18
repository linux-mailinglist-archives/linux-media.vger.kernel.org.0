Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF482B7F5A
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 15:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbgKROZ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 09:25:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726570AbgKROZ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 09:25:58 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FF7AC061A48
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2020 06:25:56 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id 1so2901154wme.3
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2020 06:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M3TahTJ7BjaCKL6cCJzT4YU2/8yPvTg3NC9HtjjwB6E=;
        b=QZFQ9NMjk1u7iGKZodsPpAnv4GlhVxHP8yp3CWAfrgMAFbKO6nrCYfFkg+HMWylVQy
         4xwD0VvkN7cxe+o3TpUlsr0F0spio0q+/q9/CytGbvrKuOW6e2SVvNhL1cG+BP9zGKNv
         BIj2bn9jiVUoV6HSPLoZZs/rv8hIxQB7+6vjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M3TahTJ7BjaCKL6cCJzT4YU2/8yPvTg3NC9HtjjwB6E=;
        b=mFpOqkuGDefFiwk6ZZCtxcUsQRgK+vuf7jxl1SJqs1dPwszPWVidyQCZoeGbOWWZTk
         UUtnxuceV7KtJPps8/yd+arQO1xwyvTHixcCmGv0AF8mXp3G8sbuD4N4WPtuhBgOndt6
         45bRR6x/Id6+rfRiKDr6TdnUl5Hj/EjFcY/K/KShkVkEFsOBG0y0740TzZnOVsTPBWuh
         Dc8lLLPad7axqQOt3EzNmDjg3HgYqUMqM1PqfnuKPRmtE1pCAnJO/xgMke1NyArLVoJi
         Oc2e9238euDXggyDZOi+Rc6CCp6Iox4BlYGP61oXDBg1x7d9KxTV3PhSRGZ5KDUgPKQb
         JxSg==
X-Gm-Message-State: AOAM530xw/IQrOIh1h1ug3bPLb9XAi6tCtVteDAArKE4P6XNC+vEzy7f
        A3tjjeE5VNjpkRmfcZw3/Q7+Pg==
X-Google-Smtp-Source: ABdhPJwIJfDIcqzIaOjyyYLoJOkj2Cs5fEWxJOZTYwXsOeX7KufPglMZqaylZEbPYySTYkeFoUw2eg==
X-Received: by 2002:a1c:7f90:: with SMTP id a138mr292131wmd.61.1605709555144;
        Wed, 18 Nov 2020 06:25:55 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id o4sm491028wmh.33.2020.11.18.06.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 06:25:54 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH] WIP! media: uvcvideo: Use dma_alloc_noncontiguos API
Date:   Wed, 18 Nov 2020 15:25:46 +0100
Message-Id: <20201118142546.170621-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
In-Reply-To: <20200930160917.1234225-9-hch@lst.de>
References: <20200930160917.1234225-9-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On architectures where the is no coherent caching such as ARM use the
dma_alloc_noncontiguos API and handle manually the cache flushing using
dma_sync_single().

With this patch on the affected architectures we can measure up to 20x
performance improvement in uvc_video_copy_data_work().

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---

This patch depends on dma_alloc_contiguous API￼1315351diffmboxseries

https://lore.kernel.org/patchwork/patch/1315351/#1535182

 drivers/media/usb/uvc/uvc_video.c | 69 +++++++++++++++++++++++++------
 drivers/media/usb/uvc/uvcvideo.h  |  1 +
 2 files changed, 58 insertions(+), 12 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index ff624bb857d3..ef1b029b8576 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1641,6 +1641,11 @@ static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
 	urb->transfer_buffer_length = stream->urb_size - len;
 }
 
+static inline struct device *stream_to_dmadev(struct uvc_streaming *stream)
+{
+	return stream->dev->udev->bus->controller->parent;
+}
+
 static void uvc_video_complete(struct urb *urb)
 {
 	struct uvc_urb *uvc_urb = urb->context;
@@ -1693,6 +1698,11 @@ static void uvc_video_complete(struct urb *urb)
 	 * Process the URB headers, and optionally queue expensive memcpy tasks
 	 * to be deferred to a work queue.
 	 */
+	if (uvc_urb->pages)
+		dma_sync_single_for_cpu(stream_to_dmadev(stream),
+					urb->transfer_dma,
+					urb->transfer_buffer_length,
+					DMA_FROM_DEVICE);
 	stream->decode(uvc_urb, buf, buf_meta);
 
 	/* If no async work is needed, resubmit the URB immediately. */
@@ -1723,8 +1733,15 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
 			continue;
 
 #ifndef CONFIG_DMA_NONCOHERENT
-		usb_free_coherent(stream->dev->udev, stream->urb_size,
-				  uvc_urb->buffer, uvc_urb->dma);
+		if (uvc_urb->pages) {
+			vunmap(uvc_urb->buffer);
+			dma_free_noncontiguous(stream_to_dmadev(stream),
+					       stream->urb_size,
+					       uvc_urb->pages, uvc_urb->dma);
+		} else {
+			usb_free_coherent(stream->dev->udev, stream->urb_size,
+					  uvc_urb->buffer, uvc_urb->dma);
+		}
 #else
 		kfree(uvc_urb->buffer);
 #endif
@@ -1734,6 +1751,42 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
 	stream->urb_size = 0;
 }
 
+#ifndef CONFIG_DMA_NONCOHERENT
+static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream, struct uvc_urb *uvc_urb,
+				 gfp_t gfp_flags)
+{
+	struct device *dma_dev = dma_dev = stream_to_dmadev(stream);
+
+	if (!dma_can_alloc_noncontiguous(dma_dev)) {
+		uvc_urb->buffer = usb_alloc_coherent(stream->dev->udev, stream->urb_size,
+						     gfp_flags | __GFP_NOWARN, &uvc_urb->dma);
+		return uvc_urb->buffer != NULL;
+	}
+
+	uvc_urb->pages = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
+						 &uvc_urb->dma, gfp_flags | __GFP_NOWARN, 0);
+	if (!uvc_urb->pages)
+		return false;
+
+	uvc_urb->buffer = vmap(uvc_urb->pages, PAGE_ALIGN(stream->urb_size) >> PAGE_SHIFT,
+			       VM_DMA_COHERENT, PAGE_KERNEL);
+	if (!uvc_urb->buffer) {
+		dma_free_noncontiguous(dma_dev, stream->urb_size, uvc_urb->pages, uvc_urb->dma);
+		return false;
+	}
+
+	return true;
+}
+#else
+static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream, struct uvc_urb *uvc_urb,
+				 gfp_t gfp_flags)
+{
+	uvc_urb->buffer = kmalloc(stream->urb_size, gfp_flags | __GFP_NOWARN);
+
+	return uvc_urb->buffer != NULL;
+}
+#endif
+
 /*
  * Allocate transfer buffers. This function can be called with buffers
  * already allocated when resuming from suspend, in which case it will
@@ -1764,19 +1817,11 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
 
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
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 60d830d74ac1..80eeeaf3cd06 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -544,6 +544,7 @@ struct uvc_urb {
 
 	char *buffer;
 	dma_addr_t dma;
+	struct page **pages;
 
 	unsigned int async_operations;
 	struct uvc_copy_op copy_operations[UVC_MAX_PACKETS];
-- 
2.29.2.299.gdc1121823c-goog

