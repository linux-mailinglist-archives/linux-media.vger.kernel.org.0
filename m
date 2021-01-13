Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 830D32F4CB8
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 15:07:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbhAMOGx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 09:06:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726223AbhAMOGx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 09:06:53 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D50AC061575
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 06:06:12 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id n16so3698352wmc.0
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 06:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PuB9AtsbL57Sf3a4kUmMKSYxRAD6+mN4emlNl3f9yCc=;
        b=CxVKPnmBcMg1ScTz2Wp7OQZJuPc9+gpiJ+JlCYN6Nyr7ytccijkhKaHNDHZxxaODJC
         sktKBeblYT6pNWHjIU2Bu1i27ImC4PNkMWua5Wz4rZ5EBI9AFNiwW4+rKC+qBYKTHVjC
         lGCPXwZhAXuQw3n7nI1i0AL1R5F9Cxp8tVREE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PuB9AtsbL57Sf3a4kUmMKSYxRAD6+mN4emlNl3f9yCc=;
        b=WEvdBfS8vlHWe+VuaTn16fG66AwI0wWVYHAwNASRru3p5UvBXUG9JdgcYqe148QAvT
         x47Pla+FLbm/qvICkDasjxant9pigC99Yuk0QLJpW3KhIohFZt+s0QIBcw5m20JPnCqm
         8y9CKwGh6Vg1Qr76Gqi4ERcSFZydLGeXg/KelV986NsKwKTDo/XBQ9XJSBTyZRGnrWy2
         pyANHRhHoZT5TjdI4ZH0CPZ5wF8bCW9kNexwbBrj7Yf8SQfLRr8oYiQDU69xNGwf0/nE
         sXhzj0f5vYqpLAbeTHRoxAgNNRidIshZXSRywQN87D6kIFi1ZYJqWtyYPuUklK7NyvD2
         SgkA==
X-Gm-Message-State: AOAM531DrQDuNqmT6EX2wc4HNs0T8K+dmhmCd0umf8S9PX/1CqjgyKkF
        +W3YK2T3aqQsWLH03sVkenB/SA==
X-Google-Smtp-Source: ABdhPJwDA7rrRqm6VAVvCKB++joJBjMpeLpdhwEvxaUmndBbZOKzgsDgvMWoa8xdALfSxtRH+BW4EA==
X-Received: by 2002:a05:600c:2219:: with SMTP id z25mr2385510wml.27.1610546771304;
        Wed, 13 Jan 2021 06:06:11 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y68sm3590295wmc.0.2021.01.13.06.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 06:06:10 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Stevens <stevensd@chromium.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drm-buf: Add debug option
Date:   Wed, 13 Jan 2021 15:06:04 +0100
Message-Id: <20210113140604.3615437-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We have too many people abusing the struct page they can get at but
really shouldn't in importers. Aside from that the backing page might
simply not exist (for dynamic p2p mappings) looking at it and using it
e.g. for mmap can also wreak the page handling of the exporter
completely. Importers really must go through the proper interface like
dma_buf_mmap for everything.

Just an RFC to see whether this idea has some stickiness. default y
for now to make sure intel-gfx-ci picks it up too.

I'm semi-tempted to enforce this for dynamic importers since those
really have no excuse at all to break the rules.

Unfortuantely we can't store the right pointers somewhere safe to make
sure we oops on something recognizable, so best is to just wrangle
them a bit by flipping all the bits. At least on x86 kernel addresses
have all their high bits sets and the struct page array is fairly low
in the kernel mapping, so flipping all the bits gives us a very high
pointer in userspace and hence excellent chances for an invalid
dereference.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Stevens <stevensd@chromium.org>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/dma-buf/Kconfig   |  8 +++++++
 drivers/dma-buf/dma-buf.c | 49 +++++++++++++++++++++++++++++++++++----
 2 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index 4f8224a6ac95..cddb549e5e59 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -50,6 +50,14 @@ config DMABUF_MOVE_NOTIFY
 	  This is marked experimental because we don't yet have a consistent
 	  execution context and memory management between drivers.
 
+config DMABUF_DEBUG
+	bool "DMA-BUF debug checks"
+	default y
+	help
+	  This option enables additional checks for DMA-BUF importers and
+	  exporters. Specifically it validates that importers do not peek at the
+	  underlying struct page when they import a buffer.
+
 config DMABUF_SELFTESTS
 	tristate "Selftests for the dma-buf interfaces"
 	default n
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 1c9bd51db110..6e4725f7dfde 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -666,6 +666,30 @@ void dma_buf_put(struct dma_buf *dmabuf)
 }
 EXPORT_SYMBOL_GPL(dma_buf_put);
 
+static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
+				       enum dma_data_direction direction)
+{
+	struct sg_table *sg_table;
+
+	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
+
+#if CONFIG_DMABUF_DEBUG
+	if (sg_table) {
+		int i;
+		struct scatterlist *sg;
+
+		/* To catch abuse of the underlying struct page by importers mix
+		 * up the bits, but take care to preserve the low SG_ bits to
+		 * not corrupt the sgt. The mixing is undone in __unmap_dma_buf
+		 * before passing the sgt back to the exporter. */
+		for_each_sgtable_sg(sg_table, sg, i)
+			sg->page_link ^= ~0xffUL;
+	}
+#endif
+
+	return sg_table;
+}
+
 /**
  * dma_buf_dynamic_attach - Add the device to dma_buf's attachments list
  * @dmabuf:		[in]	buffer to attach device to.
@@ -737,7 +761,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 				goto err_unlock;
 		}
 
-		sgt = dmabuf->ops->map_dma_buf(attach, DMA_BIDIRECTIONAL);
+		sgt = __map_dma_buf(attach, DMA_BIDIRECTIONAL);
 		if (!sgt)
 			sgt = ERR_PTR(-ENOMEM);
 		if (IS_ERR(sgt)) {
@@ -784,6 +808,23 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 }
 EXPORT_SYMBOL_GPL(dma_buf_attach);
 
+static void __unmap_dma_buf(struct dma_buf_attachment *attach,
+			    struct sg_table *sg_table,
+			    enum dma_data_direction direction)
+{
+
+#if CONFIG_DMABUF_DEBUG
+	if (sg_table) {
+		int i;
+		struct scatterlist *sg;
+
+		for_each_sgtable_sg(sg_table, sg, i)
+			sg->page_link ^= ~0xffUL;
+	}
+#endif
+	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
+}
+
 /**
  * dma_buf_detach - Remove the given attachment from dmabuf's attachments list
  * @dmabuf:	[in]	buffer to detach from.
@@ -802,7 +843,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 		if (dma_buf_is_dynamic(attach->dmabuf))
 			dma_resv_lock(attach->dmabuf->resv, NULL);
 
-		dmabuf->ops->unmap_dma_buf(attach, attach->sgt, attach->dir);
+		__unmap_dma_buf(attach, attach->sgt, attach->dir);
 
 		if (dma_buf_is_dynamic(attach->dmabuf)) {
 			dma_buf_unpin(attach);
@@ -924,7 +965,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 		}
 	}
 
-	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
+	sg_table = __map_dma_buf(attach, direction);
 	if (!sg_table)
 		sg_table = ERR_PTR(-ENOMEM);
 
@@ -987,7 +1028,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 	if (dma_buf_is_dynamic(attach->dmabuf))
 		dma_resv_assert_held(attach->dmabuf->resv);
 
-	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
+	__unmap_dma_buf(attach, sg_table, direction);
 
 	if (dma_buf_is_dynamic(attach->dmabuf) &&
 	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
-- 
2.29.2

