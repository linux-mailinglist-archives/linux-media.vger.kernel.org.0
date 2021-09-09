Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54845404944
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 13:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236231AbhIIL0Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 07:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235985AbhIIL0M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Sep 2021 07:26:12 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F671C0617AE
        for <linux-media@vger.kernel.org>; Thu,  9 Sep 2021 04:25:03 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso1198031pjh.5
        for <linux-media@vger.kernel.org>; Thu, 09 Sep 2021 04:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=63y+Nvbu3ZhbvvsHZ5iki7ccOe2n+6icYzDmluSM4VA=;
        b=jPGT+14bKZaoYAHz/5KtHy7p1uKq7L3S7XucQ9PPI58jmS5DlmENtRfTnvVWaJOlbc
         7XiZzv/BMTMw604tg/13yAnuFHf61gcr85GoloFYw+67QMSvfCnpBtY1gJ41lLHHI+wH
         oxYtZihqvxpmyVN8pBlzznbIROa/2ye+cg0NE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=63y+Nvbu3ZhbvvsHZ5iki7ccOe2n+6icYzDmluSM4VA=;
        b=R50oZWREGtkz5vpCNjmJcUO65Q/mLvoUAlIONkDVe7AxY8lz1YbZWSGJ7ZuBhYvtHq
         LEVrb9gQUIL9wRLNTmzMvmdKQ4bRoqo3jPacOSVIEZ+lfImD+BtJtN74ij0eTAKKn0el
         BHiwa6Dyt4nbtUUOchxTluweJBg/SBqDOtFXCsLhADggvJ6c3dkTiUjQ5Wx0FvqInFmB
         4vbHuOn0pRb5ZS7E99QfZO9lXJ4BrMRin9J9XUwc/xk2cufRXoMGAnb3F1yb83RgCxaZ
         eF78iPLD77mx3YMP/w2tXdFIjJgqvhHVQPCm7Vmi/xz9g9WMncC/MwMTlOqzO+EyY0ka
         TCkQ==
X-Gm-Message-State: AOAM533wAeafg0zP9EfWW92XyzvTw5GCQzehp02OGAEjnVVpsI962soS
        Jt9CEsbTTXY8H5Pf7KO14r0bMA==
X-Google-Smtp-Source: ABdhPJw/fuN/2PZfis/IeehsuU+UapJHLB9IMty8UK5u7t+g63TV8DOPkeJVLYGYIWExlQY/MtqguQ==
X-Received: by 2002:a17:902:9346:b0:132:6ba5:109 with SMTP id g6-20020a170902934600b001326ba50109mr2251585plp.19.1631186702682;
        Thu, 09 Sep 2021 04:25:02 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:166b:dcfc:dcf2:bbe2])
        by smtp.gmail.com with ESMTPSA id 141sm2046860pgg.16.2021.09.09.04.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 04:25:02 -0700 (PDT)
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
Subject: [PATCHv6 8/8] videobuf2: handle non-contiguous DMA allocations
Date:   Thu,  9 Sep 2021 20:24:30 +0900
Message-Id: <20210909112430.61243-9-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
In-Reply-To: <20210909112430.61243-1-senozhatsky@chromium.org>
References: <20210909112430.61243-1-senozhatsky@chromium.org>
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
 .../common/videobuf2/videobuf2-dma-contig.c   | 161 ++++++++++++++----
 1 file changed, 130 insertions(+), 31 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 1e218bc440c6..b052a4e36961 100644
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
 
@@ -101,13 +125,19 @@ static void vb2_dc_prepare(void *buf_priv)
 	struct vb2_dc_buf *buf = buf_priv;
 	struct sg_table *sgt = buf->dma_sgt;
 
+	/* This takes care of DMABUF and user-enforced cache sync hint */
 	if (buf->vb->skip_cache_sync_on_prepare)
 		return;
 
-	if (!sgt)
+	if (!buf->non_coherent_mem)
 		return;
 
+	/* For both USERPTR and non-coherent MMAP */
 	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
+
+	/* Non-coherent MMAP only */
+	if (buf->vaddr)
+		flush_kernel_vmap_range(buf->vaddr, buf->size);
 }
 
 static void vb2_dc_finish(void *buf_priv)
@@ -115,13 +145,19 @@ static void vb2_dc_finish(void *buf_priv)
 	struct vb2_dc_buf *buf = buf_priv;
 	struct sg_table *sgt = buf->dma_sgt;
 
+	/* This takes care of DMABUF and user-enforced cache sync hint */
 	if (buf->vb->skip_cache_sync_on_finish)
 		return;
 
-	if (!sgt)
+	if (!buf->non_coherent_mem)
 		return;
 
+	/* For both USERPTR and non-coherent MMAP */
 	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
+
+	/* Non-coherent MMAP only */
+	if (buf->vaddr)
+		invalidate_kernel_vmap_range(buf->vaddr, buf->size);
 }
 
 /*********************************************/
@@ -135,21 +171,69 @@ static void vb2_dc_put(void *buf_priv)
 	if (!refcount_dec_and_test(&buf->refcount))
 		return;
 
-	if (buf->sgt_base) {
-		sg_free_table(buf->sgt_base);
-		kfree(buf->sgt_base);
+	if (buf->non_coherent_mem) {
+		if (buf->vaddr)
+			dma_vunmap_noncontiguous(buf->dev, buf->vaddr);
+		dma_free_noncontiguous(buf->dev, buf->size,
+				       buf->dma_sgt, buf->dma_dir);
+	} else {
+		if (buf->sgt_base) {
+			sg_free_table(buf->sgt_base);
+			kfree(buf->sgt_base);
+		}
+		dma_free_attrs(buf->dev, buf->size, buf->cookie,
+			       buf->dma_addr, buf->attrs);
 	}
-	dma_free_attrs(buf->dev, buf->size, buf->cookie, buf->dma_addr,
-		       buf->attrs);
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
+	 * For non-coherent buffers the kernel mapping is created on demand
+	 * in vb2_dc_vaddr().
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
@@ -159,27 +243,28 @@ static void *vb2_dc_alloc(struct vb2_buffer *vb,
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
 
@@ -196,9 +281,12 @@ static int vb2_dc_mmap(void *buf_priv, struct vm_area_struct *vma)
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
@@ -360,9 +448,15 @@ vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
 
 static int vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf, struct dma_buf_map *map)
 {
-	struct vb2_dc_buf *buf = dbuf->priv;
+	struct vb2_dc_buf *buf;
+	void *vaddr;
 
-	dma_buf_map_set_vaddr(map, buf->vaddr);
+	buf = dbuf->priv;
+	vaddr = vb2_dc_vaddr(buf->vb, buf);
+	if (!vaddr)
+		return -EINVAL;
+
+	dma_buf_map_set_vaddr(map, vaddr);
 
 	return 0;
 }
@@ -390,6 +484,9 @@ static struct sg_table *vb2_dc_get_base_sgt(struct vb2_dc_buf *buf)
 	int ret;
 	struct sg_table *sgt;
 
+	if (buf->non_coherent_mem)
+		return buf->dma_sgt;
+
 	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
 	if (!sgt) {
 		dev_err(buf->dev, "failed to alloc sg table\n");
@@ -567,6 +664,8 @@ static void *vb2_dc_get_userptr(struct vb2_buffer *vb, struct device *dev,
 
 	buf->dma_addr = sg_dma_address(sgt->sgl);
 	buf->dma_sgt = sgt;
+	buf->non_coherent_mem = 1;
+
 out:
 	buf->size = size;
 
-- 
2.33.0.153.gba50c8fa24-goog

