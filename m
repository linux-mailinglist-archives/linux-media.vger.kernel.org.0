Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84C823F4A93
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 14:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237215AbhHWMYG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 08:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237201AbhHWMYD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 08:24:03 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14FF0C061757
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 05:23:21 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id t13so15212029pfl.6
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 05:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K9y+4HvNNlNepJAviWbi2S3T+ez1PJPDzy7v093kzas=;
        b=AJIhfNXVbOWFyvd0XK3xL8P8aeBYOuu1cOCMFZii20yv1myxI0ApA236ChV7Yq/IWD
         MDEFOmWWj3/hIkN5PjAH/JIN1+IGxivAwAYKKABdwr/fJaspcY2+7EEwnPo+jbM4miF7
         9m0Kv6PmUarwICLaBZIsxiiigxrMJsCnbW9Q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K9y+4HvNNlNepJAviWbi2S3T+ez1PJPDzy7v093kzas=;
        b=Y/b/9KEVcDrtAK2lJ1sVT7lrm0ZPvm4zIatxxckQS/cHXFaCw00EQK+2b1Lb/XBojz
         7RNpORRPgf0IxuM+SWWMFO/KWkziLik1/EOvKKCZXnXYmhKAED0Qcm/CSmFfsYDVcW9L
         j88H/fTOmADKSVDgEtrWLuar5CwfFoxYyCCHsThNidOvDDnV8tg/Ps5LhxBkflzEh2le
         evMopPp4nJqsblBLvuuK+DCTsztlDLcu7/onY09zwZ/wVapFxoRx5uZUHJs4RCaSq3qH
         +tiHsztXFkRfnSRn7Vgf8spxKUybCfDgoFb+1mQ3JadQBTCwEib4vLJl/k0iz9RSVF33
         sbWg==
X-Gm-Message-State: AOAM533zJBliJiyK8e8b4IJJ9cau2gUvfImXxy69CU8Jo69zQado40JN
        APH32Qjk9jJTo0yIz81c8Uh8ig==
X-Google-Smtp-Source: ABdhPJwpx/5Z7SDttCuzkAAr50pJHJ0uTNG0p/G47YQKVCOo+PgiJqVrqWVr+uFSv6HXHqQ/x0lPVg==
X-Received: by 2002:a05:6a00:213c:b0:3e1:c3af:134 with SMTP id n28-20020a056a00213c00b003e1c3af0134mr33634071pfj.5.1629721400579;
        Mon, 23 Aug 2021 05:23:20 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:8821:8b2f:2912:f9e4])
        by smtp.gmail.com with ESMTPSA id a15sm9035576pfn.219.2021.08.23.05.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 05:23:19 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv5 8/8] videobuf2: handle non-contiguous DMA allocations
Date:   Mon, 23 Aug 2021 21:22:35 +0900
Message-Id: <20210823122235.116189-9-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
In-Reply-To: <20210823122235.116189-1-senozhatsky@chromium.org>
References: <20210823122235.116189-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds support for the new noncontiguous DMA API, which
requires allocators to have two execution branches: one
for the current API, and one for the new one.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Acked-by: Christoph Hellwig <hch@lst.de>
---
 .../common/videobuf2/videobuf2-dma-contig.c   | 164 +++++++++++++++---
 1 file changed, 138 insertions(+), 26 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 1e218bc440c6..f1ad36b04e3a 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -17,6 +17,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/dma-mapping.h>
+#include <linux/highmem.h>
 
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-dma-contig.h>
@@ -42,6 +43,7 @@ struct vb2_dc_buf {
 	struct dma_buf_attachment	*db_attach;
 
 	struct vb2_buffer		*vb;
+	bool				non_coherent_mem;
 };
 
 /*********************************************/
@@ -75,17 +77,39 @@ static void *vb2_dc_cookie(struct vb2_buffer *vb, void *buf_priv)
 	return &buf->dma_addr;
 }
 
+/*
+ * This function may fail if:
+ *
+ * - dma_buf_vmap() fails
+ *   E.g. due to lack of virtual mapping address space, or due to
+ *   dmabuf->ops misconfiguration.
+ *
+ * - dma_vmap_noncontiguous() fails
+ *   For instance, when requested buffer size is larger than totalram_pages().
+ *   Relevant for buffers that use non-coherent memory.
+ *
+ * - Queue DMA attrs have DMA_ATTR_NO_KERNEL_MAPPING set
+ *   Relevant for buffers that use coherent memory.
+ */
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
+
+		return buf->vaddr;
 	}
 
+	if (buf->non_coherent_mem)
+		buf->vaddr = dma_vmap_noncontiguous(buf->dev, buf->size,
+						    buf->dma_sgt);
 	return buf->vaddr;
 }
 
@@ -101,13 +125,26 @@ static void vb2_dc_prepare(void *buf_priv)
 	struct vb2_dc_buf *buf = buf_priv;
 	struct sg_table *sgt = buf->dma_sgt;
 
+	/* This takes care of DMABUF and user-enforced cache sync hint */
 	if (buf->vb->skip_cache_sync_on_prepare)
 		return;
 
+	/*
+	 * Coherent MMAP buffers do not need to be synced, unlike USERPTR
+	 * and non-coherent MMAP buffers.
+	 */
+	if (buf->vb->memory == V4L2_MEMORY_MMAP && !buf->non_coherent_mem)
+		return;
+
 	if (!sgt)
 		return;
 
+	/* For both USERPTR and non-coherent MMAP */
 	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
+
+	/* Non-coherent MMAP only */
+	if (buf->non_coherent_mem && buf->vaddr)
+		flush_kernel_vmap_range(buf->vaddr, buf->size);
 }
 
 static void vb2_dc_finish(void *buf_priv)
@@ -115,13 +152,26 @@ static void vb2_dc_finish(void *buf_priv)
 	struct vb2_dc_buf *buf = buf_priv;
 	struct sg_table *sgt = buf->dma_sgt;
 
+	/* This takes care of DMABUF and user-enforced cache sync hint */
 	if (buf->vb->skip_cache_sync_on_finish)
 		return;
 
+	/*
+	 * Coherent MMAP buffers do not need to be synced, unlike USERPTR
+	 * and non-coherent MMAP buffers.
+	 */
+	if (buf->vb->memory == V4L2_MEMORY_MMAP && !buf->non_coherent_mem)
+		return;
+
 	if (!sgt)
 		return;
 
+	/* For both USERPTR and non-coherent MMAP */
 	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
+
+	/* Non-coherent MMAP only */
+	if (buf->non_coherent_mem && buf->vaddr)
+		invalidate_kernel_vmap_range(buf->vaddr, buf->size);
 }
 
 /*********************************************/
@@ -139,17 +189,66 @@ static void vb2_dc_put(void *buf_priv)
 		sg_free_table(buf->sgt_base);
 		kfree(buf->sgt_base);
 	}
-	dma_free_attrs(buf->dev, buf->size, buf->cookie, buf->dma_addr,
-		       buf->attrs);
+
+	if (buf->non_coherent_mem) {
+		if (buf->vaddr)
+			dma_vunmap_noncontiguous(buf->dev, buf->vaddr);
+		dma_free_noncontiguous(buf->dev, buf->size,
+				       buf->dma_sgt, buf->dma_dir);
+	} else {
+		dma_free_attrs(buf->dev, buf->size, buf->cookie,
+			       buf->dma_addr, buf->attrs);
+	}
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
+
+	if (q->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
+		return 0;
+
+	buf->vaddr = buf->cookie;
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
+
+	buf->dma_addr = sg_dma_address(buf->dma_sgt->sgl);
+
+	/*
+	 * For requests that need kernel mapping (DMA_ATTR_NO_KERNEL_MAPPING
+	 * bit is cleared) we perform dma_vmap_noncontiguous() in vb2_dc_vaddr()
+	 */
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
@@ -159,27 +258,28 @@ static void *vb2_dc_alloc(struct vb2_buffer *vb,
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
+	if (buf->non_coherent_mem)
+		ret = vb2_dc_alloc_non_coherent(buf);
+	else
+		ret = vb2_dc_alloc_coherent(buf);
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
 
@@ -196,9 +296,12 @@ static int vb2_dc_mmap(void *buf_priv, struct vm_area_struct *vma)
 		return -EINVAL;
 	}
 
-	ret = dma_mmap_attrs(buf->dev, vma, buf->cookie,
-		buf->dma_addr, buf->size, buf->attrs);
-
+	if (buf->non_coherent_mem)
+		ret = dma_mmap_noncontiguous(buf->dev, vma, buf->size,
+					     buf->dma_sgt);
+	else
+		ret = dma_mmap_attrs(buf->dev, vma, buf->cookie, buf->dma_addr,
+				     buf->size, buf->attrs);
 	if (ret) {
 		pr_err("Remapping memory failed, error: %d\n", ret);
 		return ret;
@@ -360,9 +463,15 @@ vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
 
 static int vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf, struct dma_buf_map *map)
 {
-	struct vb2_dc_buf *buf = dbuf->priv;
+	struct vb2_dc_buf *buf;
+	void *vaddr;
+
+	buf = dbuf->priv;
+	vaddr = vb2_dc_vaddr(buf->vb, buf);
+	if (!vaddr)
+		return -EINVAL;
 
-	dma_buf_map_set_vaddr(map, buf->vaddr);
+	dma_buf_map_set_vaddr(map, vaddr);
 
 	return 0;
 }
@@ -390,6 +499,9 @@ static struct sg_table *vb2_dc_get_base_sgt(struct vb2_dc_buf *buf)
 	int ret;
 	struct sg_table *sgt;
 
+	if (buf->non_coherent_mem)
+		return buf->dma_sgt;
+
 	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
 	if (!sgt) {
 		dev_err(buf->dev, "failed to alloc sg table\n");
-- 
2.33.0.rc2.250.ged5fa647cd-goog

