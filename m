Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A249E2F7FFF
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 16:51:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbhAOPvc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 10:51:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbhAOPvb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 10:51:31 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB17C061757
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 07:50:51 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id w5so9731214wrm.11
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 07:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q7gBk18YmNOfMyE9S30pIp1RMFiN+uN9pi0ooJEWKGo=;
        b=EMXJxp0QXEfuZFc9Hg65q9oCxA/7Plboe2KHhwINPr4QUoGbmqvd8ES4svJj+XxQ7B
         DF3VL1EM4NWySE1Z+NhMEzjcCCFzRMRiAly8nXBzADMCyR22AhXyCzftDjtrPmREoMSZ
         RwuioYvEjRMxAkfRAKv+iTxl9E5/dhBDw4ka4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q7gBk18YmNOfMyE9S30pIp1RMFiN+uN9pi0ooJEWKGo=;
        b=aY2SeZ5lZIbG6CTgpDP0UcGYRYJ2eI6NkZzJ9N3Zou1YEdo0sYdQLbPFRM1R2mFFM0
         H0hk9ekz3etEQAU4qvdGY30jyUbDvbZtsSJFy0veQcgQ7X+yPMACdwdHmQkwGTFeQxix
         CQmBI1QIu3CX+2+9g2oVLjEUPYefUveNF1URINZsq31SB1gmahL9mxU1U5FlscAxOnzl
         fEeQQEQxSMHNTQF486qfdguFvNd5hIoOLIrd1JmLL4QkQyTk0qy4VBCjgXFcUowFZSfq
         DIVum2OnqWHInnvMawSTqdpPHqIMKtjJ8kan2TwXeuvmkbPqNc2+9PhCld1EitBSmuwn
         7e6A==
X-Gm-Message-State: AOAM5330238tKTsR9nTeyaMzhfx4QSYDExKMVnIbV/BwcIjMl4WTX7o/
        dEb7gHWE1oBgBl352ZoZ67oyCA==
X-Google-Smtp-Source: ABdhPJyCCsVdQ1OCcsH1MF+bkVvPFwRrX0Y7BJk9sYFE8183W2+eoPDbk/imPGj4Qh8hlsse6RRZTg==
X-Received: by 2002:a5d:6749:: with SMTP id l9mr13992139wrw.395.1610725849836;
        Fri, 15 Jan 2021 07:50:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a17sm15109135wrs.20.2021.01.15.07.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 07:50:49 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Stevens <stevensd@chromium.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf: Add debug option
Date:   Fri, 15 Jan 2021 16:50:43 +0100
Message-Id: <20210115155043.3942935-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115130219.3915789-1-daniel.vetter@ffwll.ch>
References: <20210115130219.3915789-1-daniel.vetter@ffwll.ch>
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

I'm semi-tempted to enforce this for dynamic importers since those
really have no excuse at all to break the rules.

Unfortuantely we can't store the right pointers somewhere safe to make
sure we oops on something recognizable, so best is to just wrangle
them a bit by flipping all the bits. At least on x86 kernel addresses
have all their high bits sets and the struct page array is fairly low
in the kernel mapping, so flipping all the bits gives us a very high
pointer in userspace and hence excellent chances for an invalid
dereference.

v2: Add a note to the @map_dma_buf hook that exporters shouldn't do
fancy caching tricks, which would blow up with this address scrambling
trick here (Chris)

Enable by default when CONFIG_DMA_API_DEBUG is enabled.

v3: Only one copy of the mangle/unmangle code (Christian)

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk> (v2)
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Stevens <stevensd@chromium.org>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/dma-buf/Kconfig   |  8 +++++++
 drivers/dma-buf/dma-buf.c | 48 +++++++++++++++++++++++++++++++++++----
 include/linux/dma-buf.h   |  6 +++++
 3 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index 4f8224a6ac95..4e16c71c24b7 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -50,6 +50,14 @@ config DMABUF_MOVE_NOTIFY
 	  This is marked experimental because we don't yet have a consistent
 	  execution context and memory management between drivers.
 
+config DMABUF_DEBUG
+	bool "DMA-BUF debug checks"
+	default y if DMA_API_DEBUG
+	help
+	  This option enables additional checks for DMA-BUF importers and
+	  exporters. Specifically it validates that importers do not peek at the
+	  underlying struct page when they import a buffer.
+
 config DMABUF_SELFTESTS
 	tristate "Selftests for the dma-buf interfaces"
 	default n
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 1c9bd51db110..820927474cc8 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -666,6 +666,36 @@ void dma_buf_put(struct dma_buf *dmabuf)
 }
 EXPORT_SYMBOL_GPL(dma_buf_put);
 
+static void mangle_sg_table(struct sg_table *sg_table)
+{
+#if CONFIG_DMABUF_DEBUG
+	int i;
+	struct scatterlist *sg;
+
+	if (!sg_table)
+		return;
+
+	/* To catch abuse of the underlying struct page by importers mix
+	 * up the bits, but take care to preserve the low SG_ bits to
+	 * not corrupt the sgt. The mixing is undone in __unmap_dma_buf
+	 * before passing the sgt back to the exporter. */
+	for_each_sgtable_sg(sg_table, sg, i)
+		sg->page_link ^= ~0xffUL;
+#endif
+
+}
+static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
+				       enum dma_data_direction direction)
+{
+	struct sg_table *sg_table;
+
+	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
+
+	mangle_sg_table(sg_table);
+
+	return sg_table;
+}
+
 /**
  * dma_buf_dynamic_attach - Add the device to dma_buf's attachments list
  * @dmabuf:		[in]	buffer to attach device to.
@@ -737,7 +767,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 				goto err_unlock;
 		}
 
-		sgt = dmabuf->ops->map_dma_buf(attach, DMA_BIDIRECTIONAL);
+		sgt = __map_dma_buf(attach, DMA_BIDIRECTIONAL);
 		if (!sgt)
 			sgt = ERR_PTR(-ENOMEM);
 		if (IS_ERR(sgt)) {
@@ -784,6 +814,16 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 }
 EXPORT_SYMBOL_GPL(dma_buf_attach);
 
+static void __unmap_dma_buf(struct dma_buf_attachment *attach,
+			    struct sg_table *sg_table,
+			    enum dma_data_direction direction)
+{
+	/* uses XOR, hence this unmangles */
+	mangle_sg_table(sg_table);
+
+	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
+}
+
 /**
  * dma_buf_detach - Remove the given attachment from dmabuf's attachments list
  * @dmabuf:	[in]	buffer to detach from.
@@ -802,7 +842,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 		if (dma_buf_is_dynamic(attach->dmabuf))
 			dma_resv_lock(attach->dmabuf->resv, NULL);
 
-		dmabuf->ops->unmap_dma_buf(attach, attach->sgt, attach->dir);
+		__unmap_dma_buf(attach, attach->sgt, attach->dir);
 
 		if (dma_buf_is_dynamic(attach->dmabuf)) {
 			dma_buf_unpin(attach);
@@ -924,7 +964,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 		}
 	}
 
-	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
+	sg_table = __map_dma_buf(attach, direction);
 	if (!sg_table)
 		sg_table = ERR_PTR(-ENOMEM);
 
@@ -987,7 +1027,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 	if (dma_buf_is_dynamic(attach->dmabuf))
 		dma_resv_assert_held(attach->dmabuf->resv);
 
-	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
+	__unmap_dma_buf(attach, sg_table, direction);
 
 	if (dma_buf_is_dynamic(attach->dmabuf) &&
 	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 628681bf6c99..efdc56b9d95f 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -154,6 +154,12 @@ struct dma_buf_ops {
 	 * On failure, returns a negative error value wrapped into a pointer.
 	 * May also return -EINTR when a signal was received while being
 	 * blocked.
+	 *
+	 * Note that exporters should not try to cache the scatter list, or
+	 * return the same one for multiple calls. Caching is done either by the
+	 * DMA-BUF code (for non-dynamic importers) or the importer. Ownership
+	 * of the scatter list is transferred to the caller, and returned by
+	 * @unmap_dma_buf.
 	 */
 	struct sg_table * (*map_dma_buf)(struct dma_buf_attachment *,
 					 enum dma_data_direction);
-- 
2.29.2

