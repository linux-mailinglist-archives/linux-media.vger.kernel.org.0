Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 794B92C491A
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 21:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730034AbgKYUbV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 15:31:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730015AbgKYUbV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 15:31:21 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30DBCC0617A7
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 12:31:21 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id g14so3166658wrm.13
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 12:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q710+yuAXMJxe0nd7TtiMj+ZjNL+TkbdcSV2kJANPFc=;
        b=BIbP6CPisTVorSg5qoPf0+dLgPrcTLlTwlVp8ftZSvaFgDocUfy9W0QG0G5Ods6KYD
         yNuT+KUHJ3LuzVLi2aruhMW4cOqXa3HmxH07ArrA7Ka9z6jrGkuyP/FM26RjBdMrBi+s
         P4RXP9NBi6sM7Lf6VlkFS3ouGBO+VOYD2B60o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q710+yuAXMJxe0nd7TtiMj+ZjNL+TkbdcSV2kJANPFc=;
        b=PD2+70IVAbPcYe/Qnpoz3u1PRsReUjC/orhTSlxcknhIr5ZbNjq4vmourYZ+KR8zeA
         CFIbN5E8N4EgJZpl5WSvgwxZDluRSpEdw6zaMtMTu52cLiq308iNajFCrEo419OOuLSK
         fAwcirzBELLujRWMzlcTdSDaGZkuRkECn8mtbWDa/wRYNpYuTjT/EzDO7XVti1GLURkO
         AGZCUuEjPZg5EFhETHvpHCyTVbupKtbLZzaokxPO9rAevvh7dmYjRKUWmUcbqCTMHP2n
         69OudAJvwOg7/od+bdXggU6bsIDKvnGJeSYjyDRoK9T++P8URauWsjU7tyYVGOzRJGqi
         d/UQ==
X-Gm-Message-State: AOAM530nOJ8IydO2iQD4uljnHZEIVYJEcba2OJFrOy4ELe/e0azAIJWL
        KyUC6951xiXyvXcyNemSwgVn4fcbD5yXlA==
X-Google-Smtp-Source: ABdhPJyaT4T+JFlra8+I0dMKQzQ88jRUsULWXg1Du+OwyPFSmH7nHfduCIkjo/9lH+6AkK7sbuYwqA==
X-Received: by 2002:adf:fd52:: with SMTP id h18mr6084459wrs.90.1606336279903;
        Wed, 25 Nov 2020 12:31:19 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id h83sm4827088wmf.9.2020.11.25.12.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 12:31:19 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Robin Murphy <robin.murphy@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        auro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
Date:   Wed, 25 Nov 2020 21:31:14 +0100
Message-Id: <20201125203114.130967-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On architectures where the is no coherent caching such as ARM use the
dma_alloc_noncontiguos API and handle manually the cache flushing using
dma_sync_sg().

With this patch on the affected architectures we can measure up to 20x
performance improvement in uvc_video_copy_data_work().

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---

v2: Thanks to Robin!

Use dma_sync_sg instead of dma_sync_single


 drivers/media/usb/uvc/uvc_video.c | 83 ++++++++++++++++++++++++++-----
 drivers/media/usb/uvc/uvcvideo.h  |  2 +
 2 files changed, 73 insertions(+), 12 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a6a441d92b94..b2e6a9522999 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1490,6 +1490,11 @@ static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
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
@@ -1539,6 +1544,10 @@ static void uvc_video_complete(struct urb *urb)
 	 * Process the URB headers, and optionally queue expensive memcpy tasks
 	 * to be deferred to a work queue.
 	 */
+	if (uvc_urb->pages) {
+		dma_sync_sg_for_cpu(stream_to_dmadev(stream), uvc_urb->sgt.sgl,
+				    uvc_urb->sgt.nents,	DMA_FROM_DEVICE);
+	}
 	stream->decode(uvc_urb, buf, buf_meta);
 
 	/* If no async work is needed, resubmit the URB immediately. */
@@ -1566,8 +1575,16 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
 			continue;
 
 #ifndef CONFIG_DMA_NONCOHERENT
-		usb_free_coherent(stream->dev->udev, stream->urb_size,
-				  uvc_urb->buffer, uvc_urb->dma);
+		if (uvc_urb->pages) {
+			sg_free_table(&uvc_urb->sgt);
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
@@ -1577,6 +1594,56 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
 	stream->urb_size = 0;
 }
 
+#ifndef CONFIG_DMA_NONCOHERENT
+static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
+				 struct uvc_urb *uvc_urb, gfp_t gfp_flags)
+{
+	struct device *dma_dev = dma_dev = stream_to_dmadev(stream);
+
+	if (!dma_can_alloc_noncontiguous(dma_dev)) {
+		uvc_urb->buffer = usb_alloc_coherent(stream->dev->udev,
+						     stream->urb_size,
+						     gfp_flags | __GFP_NOWARN,
+						     &uvc_urb->dma);
+		return uvc_urb->buffer != NULL;
+	}
+
+	uvc_urb->pages = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
+						 &uvc_urb->dma,
+						 gfp_flags | __GFP_NOWARN, 0);
+	if (!uvc_urb->pages)
+		return false;
+
+	uvc_urb->buffer = vmap(uvc_urb->pages,
+			       PAGE_ALIGN(stream->urb_size) >> PAGE_SHIFT,
+			       VM_DMA_COHERENT, PAGE_KERNEL);
+	if (!uvc_urb->buffer) {
+		dma_free_noncontiguous(dma_dev, stream->urb_size,
+				       uvc_urb->pages, uvc_urb->dma);
+		return false;
+	}
+
+	if (sg_alloc_table_from_pages(&uvc_urb->sgt, uvc_urb->pages,
+				PAGE_ALIGN(stream->urb_size) >> PAGE_SHIFT, 0,
+				stream->urb_size, GFP_KERNEL)) {
+		vunmap(uvc_urb->buffer);
+		dma_free_noncontiguous(dma_dev, stream->urb_size,
+				       uvc_urb->pages, uvc_urb->dma);
+		return false;
+	}
+
+	return true;
+}
+#else
+static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
+				 struct uvc_urb *uvc_urb, gfp_t gfp_flags)
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
@@ -1607,19 +1674,11 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
 
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
index a3dfacf069c4..3e6618a2ac82 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -532,6 +532,8 @@ struct uvc_urb {
 
 	char *buffer;
 	dma_addr_t dma;
+	struct page **pages;
+	struct sg_table sgt;
 
 	unsigned int async_operations;
 	struct uvc_copy_op copy_operations[UVC_MAX_PACKETS];
-- 
2.29.2.454.gaff20da3a2-goog

