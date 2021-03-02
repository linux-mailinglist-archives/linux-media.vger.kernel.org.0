Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D852A32A84E
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1580141AbhCBRaG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:30:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377764AbhCBAsk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 19:48:40 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D252FC061221
        for <linux-media@vger.kernel.org>; Mon,  1 Mar 2021 16:47:04 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id h4so12691697pgf.13
        for <linux-media@vger.kernel.org>; Mon, 01 Mar 2021 16:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3ehy3NtZARWKqntzrYPlK6hSKlfy8OUUEgCoOD4fHSE=;
        b=HWdXl+wGHfyAD0jSdQV4KKDcE36igEeT1w0wjKhgKk5SIvItzRKr1GujotMl+J0e82
         PGhydmIoAsKJIeUM7230UpY9cZIH1i/4+9rm/Gu122fRJQd1Rl4w23h3kAWgCovzc5bY
         SSkOGozVvcJT3+9oBThl0XJPf6O8tvBf9vwUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3ehy3NtZARWKqntzrYPlK6hSKlfy8OUUEgCoOD4fHSE=;
        b=MmmIyJ6VgtwnPyuN9heVXoYVr3C5WCqHR+qk4Z/a6p6x33UiCFBxdiWWkWENjat69e
         ilgq+lBHkOcsWRQ8rkyJBFMcxIPSxhF9/dmixPogRawitx+Yr5tlRP79gRzF8Yc8XMTn
         51sK6HN8HYfoiq8wNNfN8+ITv6RAlrgUzZTkdR+x9ADqkQ8CzH6L0RKlfe/SezcMRyRI
         9bZVVoROHs0nsMawqaJVwKPa2P+K3kqp3OxkYYXrWMyPfz3rljWuRLxTUfCuRv85TTuq
         ivGLgfmHxn3c/DBqYlhr3Xnv5YpNyG0ooHHSVZXsSvb8gtHKb/zpQ8Rhvkj7ixbbcD7H
         drEg==
X-Gm-Message-State: AOAM533cFpoUo9trNsPC/IYK1MBWwNhQAPHEWr/wns1Uc5smLqZTE9xS
        wpodidKTfBSR6T3cKzFrhljvIw==
X-Google-Smtp-Source: ABdhPJxuPC6Un97/6i4LbPsWKyOZUv4BB/Ly+hLI8ZuL2VuI1/bEWIEH8k/aW6CxILcsZRx+k+Dr7g==
X-Received: by 2002:a65:4c0b:: with SMTP id u11mr16102700pgq.409.1614646024411;
        Mon, 01 Mar 2021 16:47:04 -0800 (PST)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:d5d7:1a61:2cdf:273c])
        by smtp.gmail.com with ESMTPSA id b14sm678881pji.14.2021.03.01.16.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 16:47:04 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 8/8] videobuf2: handle non-contiguous DMA allocations
Date:   Tue,  2 Mar 2021 09:46:24 +0900
Message-Id: <20210302004624.31294-9-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210302004624.31294-1-senozhatsky@chromium.org>
References: <20210302004624.31294-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds support for new noncontiguous DMA API, which
requires allocators to have two execution branches: one
for the current API, and one for the new one.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
[hch: untested conversion to the ne API]
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 .../common/videobuf2/videobuf2-dma-contig.c   | 141 +++++++++++++++---
 1 file changed, 117 insertions(+), 24 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 1e218bc440c6..d6a9f7b682f3 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -17,6 +17,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/dma-mapping.h>
+#include <linux/highmem.h>
 
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-dma-contig.h>
@@ -42,8 +43,14 @@ struct vb2_dc_buf {
 	struct dma_buf_attachment	*db_attach;
 
 	struct vb2_buffer		*vb;
+	unsigned int			non_coherent_mem:1;
 };
 
+static bool vb2_dc_is_coherent(struct vb2_dc_buf *buf)
+{
+	return !buf->non_coherent_mem;
+}
+
 /*********************************************/
 /*        scatterlist table functions        */
 /*********************************************/
@@ -78,12 +85,21 @@ static void *vb2_dc_cookie(struct vb2_buffer *vb, void *buf_priv)
 static void *vb2_dc_vaddr(struct vb2_buffer *vb, void *buf_priv)
 {
 	struct vb2_dc_buf *buf = buf_priv;
-	struct dma_buf_map map;
-	int ret;
 
-	if (!buf->vaddr && buf->db_attach) {
-		ret = dma_buf_vmap(buf->db_attach->dmabuf, &map);
-		buf->vaddr = ret ? NULL : map.vaddr;
+	if (buf->vaddr)
+		return buf->vaddr;
+
+	if (buf->db_attach) {
+		struct dma_buf_map map;
+
+		if (!dma_buf_vmap(buf->db_attach->dmabuf, &map))
+			buf->vaddr = map.vaddr;
+	}
+
+	if (!vb2_dc_is_coherent(buf)) {
+		buf->vaddr = dma_vmap_noncontiguous(buf->dev,
+						    buf->size,
+						    buf->dma_sgt);
 	}
 
 	return buf->vaddr;
@@ -101,13 +117,26 @@ static void vb2_dc_prepare(void *buf_priv)
 	struct vb2_dc_buf *buf = buf_priv;
 	struct sg_table *sgt = buf->dma_sgt;
 
+	/* This takes care of DMABUF and user-enforced cache sync hint */
 	if (buf->vb->skip_cache_sync_on_prepare)
 		return;
 
+	/*
+	 * Coherent MMAP buffers do not need to be synced, unlike coherent
+	 * USERPTR and non-coherent MMAP buffers.
+	 */
+	if (buf->vb->memory == V4L2_MEMORY_MMAP && vb2_dc_is_coherent(buf))
+		return;
+
 	if (!sgt)
 		return;
 
+	/* For both USERPTR and non-coherent MMAP */
 	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
+
+	/* Non-coherrent MMAP only */
+	if (!vb2_dc_is_coherent(buf) && buf->vaddr)
+		flush_kernel_vmap_range(buf->vaddr, buf->size);
 }
 
 static void vb2_dc_finish(void *buf_priv)
@@ -115,19 +144,46 @@ static void vb2_dc_finish(void *buf_priv)
 	struct vb2_dc_buf *buf = buf_priv;
 	struct sg_table *sgt = buf->dma_sgt;
 
+	/* This takes care of DMABUF and user-enforced cache sync hint */
 	if (buf->vb->skip_cache_sync_on_finish)
 		return;
 
+	/*
+	 * Coherent MMAP buffers do not need to be synced, unlike coherent
+	 * USERPTR and non-coherent MMAP buffers.
+	 */
+	if (buf->vb->memory == V4L2_MEMORY_MMAP && vb2_dc_is_coherent(buf))
+		return;
+
 	if (!sgt)
 		return;
 
+	/* For both USERPTR and non-coherent MMAP */
 	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
+
+	/* Non-coherrent MMAP only */
+	if (!vb2_dc_is_coherent(buf) && buf->vaddr)
+		invalidate_kernel_vmap_range(buf->vaddr, buf->size);
 }
 
 /*********************************************/
 /*        callbacks for MMAP buffers         */
 /*********************************************/
 
+static void __vb2_dc_put(struct vb2_dc_buf *buf)
+{
+	if (vb2_dc_is_coherent(buf)) {
+		dma_free_attrs(buf->dev, buf->size, buf->cookie,
+			       buf->dma_addr, buf->attrs);
+		return;
+	}
+
+	if (buf->vaddr)
+		dma_vunmap_noncontiguous(buf->dev, buf->vaddr);
+	dma_free_noncontiguous(buf->dev, buf->size,
+			       buf->dma_sgt, buf->dma_addr);
+}
+
 static void vb2_dc_put(void *buf_priv)
 {
 	struct vb2_dc_buf *buf = buf_priv;
@@ -139,17 +195,47 @@ static void vb2_dc_put(void *buf_priv)
 		sg_free_table(buf->sgt_base);
 		kfree(buf->sgt_base);
 	}
-	dma_free_attrs(buf->dev, buf->size, buf->cookie, buf->dma_addr,
-		       buf->attrs);
+	__vb2_dc_put(buf);
 	put_device(buf->dev);
 	kfree(buf);
 }
 
+static int vb2_dc_alloc_coherent(struct vb2_dc_buf *buf)
+{
+	struct vb2_queue *q = buf->vb->vb2_queue;
+
+	buf->cookie = dma_alloc_attrs(buf->dev,
+				      buf->size,
+				      &buf->dma_addr,
+				      GFP_KERNEL | q->gfp_flags,
+				      buf->attrs);
+	if (!buf->cookie)
+		return -ENOMEM;
+	if ((q->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING) == 0)
+		buf->vaddr = buf->cookie;
+	return 0;
+}
+
+static int vb2_dc_alloc_non_coherent(struct vb2_dc_buf *buf)
+{
+	struct vb2_queue *q = buf->vb->vb2_queue;
+
+	buf->dma_sgt = dma_alloc_noncontiguous(buf->dev,
+					       buf->size,
+					       buf->dma_dir,
+					       GFP_KERNEL | q->gfp_flags,
+					       buf->attrs);
+	if (!buf->dma_sgt)
+		return -ENOMEM;
+	return 0;
+}
+
 static void *vb2_dc_alloc(struct vb2_buffer *vb,
 			  struct device *dev,
 			  unsigned long size)
 {
 	struct vb2_dc_buf *buf;
+	int ret;
 
 	if (WARN_ON(!dev))
 		return ERR_PTR(-EINVAL);
@@ -159,27 +245,28 @@ static void *vb2_dc_alloc(struct vb2_buffer *vb,
 		return ERR_PTR(-ENOMEM);
 
 	buf->attrs = vb->vb2_queue->dma_attrs;
-	buf->cookie = dma_alloc_attrs(dev, size, &buf->dma_addr,
-				      GFP_KERNEL | vb->vb2_queue->gfp_flags,
-				      buf->attrs);
-	if (!buf->cookie) {
-		dev_err(dev, "dma_alloc_coherent of size %ld failed\n", size);
-		kfree(buf);
-		return ERR_PTR(-ENOMEM);
-	}
-
-	if ((buf->attrs & DMA_ATTR_NO_KERNEL_MAPPING) == 0)
-		buf->vaddr = buf->cookie;
+	buf->dma_dir = vb->vb2_queue->dma_dir;
+	buf->vb = vb;
+	buf->non_coherent_mem = vb->vb2_queue->non_coherent_mem;
 
+	buf->size = size;
 	/* Prevent the device from being released while the buffer is used */
 	buf->dev = get_device(dev);
-	buf->size = size;
-	buf->dma_dir = vb->vb2_queue->dma_dir;
+
+	if (vb2_dc_is_coherent(buf))
+		ret = vb2_dc_alloc_coherent(buf);
+	else
+		ret = vb2_dc_alloc_non_coherent(buf);
+
+	if (ret) {
+		dev_err(dev, "dma alloc of size %ld failed\n", size);
+		kfree(buf);
+		return ERR_PTR(-ENOMEM);
+	}
 
 	buf->handler.refcount = &buf->refcount;
 	buf->handler.put = vb2_dc_put;
 	buf->handler.arg = buf;
-	buf->vb = vb;
 
 	refcount_set(&buf->refcount, 1);
 
@@ -196,9 +283,12 @@ static int vb2_dc_mmap(void *buf_priv, struct vm_area_struct *vma)
 		return -EINVAL;
 	}
 
-	ret = dma_mmap_attrs(buf->dev, vma, buf->cookie,
-		buf->dma_addr, buf->size, buf->attrs);
-
+	if (vb2_dc_is_coherent(buf))
+		ret = dma_mmap_attrs(buf->dev, vma, buf->cookie, buf->dma_addr,
+				     buf->size, buf->attrs);
+	else
+		ret = dma_mmap_noncontiguous(buf->dev, vma, buf->size,
+					     buf->dma_sgt);
 	if (ret) {
 		pr_err("Remapping memory failed, error: %d\n", ret);
 		return ret;
@@ -390,6 +480,9 @@ static struct sg_table *vb2_dc_get_base_sgt(struct vb2_dc_buf *buf)
 	int ret;
 	struct sg_table *sgt;
 
+	if (!vb2_dc_is_coherent(buf))
+		return buf->dma_sgt;
+
 	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
 	if (!sgt) {
 		dev_err(buf->dev, "failed to alloc sg table\n");
-- 
2.30.1.766.gb4fecdf3b7-goog

