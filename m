Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2FEE3F4A83
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 14:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236967AbhHWMXd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 08:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236951AbhHWMXd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 08:23:33 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB503C061760
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 05:22:50 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id w6so10030662plg.9
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 05:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+KTq50FnH+E9KwQgtUAcRhS/WrqoH21LoQWEQXSh4xk=;
        b=ZzFq3gW4mMzwbgfjCNRgwMuLAdhhGtdM/mm2RbhpVlFAuYwNrtlWR1mCDUFIQxNf+R
         8pH+XH+0rhGhrac/mwHcSKVmVZEOxG1JIN4IVSNiPHhe4zlOhOTnjZK2DvP7eHHcWC+F
         dSpi/U0XVeRBk2gL80/UD91+5WCMY6A53eYZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+KTq50FnH+E9KwQgtUAcRhS/WrqoH21LoQWEQXSh4xk=;
        b=PxFFsKe+lqJB3xsVv2rukYHbrTuqRJ0kZBkYSh2Rvv8n6ckmdjJk8A82p42gmM6V7a
         s4lHNKHNI1HuFidn2h8zVEWeH9XC4hd3NfrQjXTMf7QvLQSrQ0iTDZdAZNiUTbO3lWk0
         gr5NQqeUVPgxd3SXqNxBWgYen9N85owBHoWgYkgzSPLphe7hsElKmONIuA8kI+mokB59
         4MMG45le+TTEd5vtSZc7+iBYoX1rpXo9INZ3WnErAfmIw631uKtItoTLpW/VD2+sWFad
         HhJ6l1aR60VsnUbRn5K788i+0v4Y2kK/jDbODGQkm7DRp2QOGBAMr+PWPoQ3twkeC+MV
         NUEA==
X-Gm-Message-State: AOAM533hTxEgWN4aI4AFUQO3ELjLvxDKNmy7N9mKbt3sxBo3aj/WTviJ
        urjz59uO2yiOQNn23idib6PHsQ==
X-Google-Smtp-Source: ABdhPJxv5DJ7ys+7gyPTnTA6o/BvVVLZhxslpK22xRp/jGhsLDvDxfF/K4ABRl5thAG5pOt/ejuqHg==
X-Received: by 2002:a17:902:b193:b029:11a:a179:453a with SMTP id s19-20020a170902b193b029011aa179453amr28281676plr.69.1629721370152;
        Mon, 23 Aug 2021 05:22:50 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:8821:8b2f:2912:f9e4])
        by smtp.gmail.com with ESMTPSA id a15sm9035576pfn.219.2021.08.23.05.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 05:22:49 -0700 (PDT)
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
Subject: [PATCHv5 1/8] videobuf2: rework vb2_mem_ops API
Date:   Mon, 23 Aug 2021 21:22:28 +0900
Message-Id: <20210823122235.116189-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
In-Reply-To: <20210823122235.116189-1-senozhatsky@chromium.org>
References: <20210823122235.116189-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the new DMA API we need an extension of the videobuf2 API.
Previously, videobuf2 core would set the non-coherent DMA bit
in the vb2_queue dma_attr field (if user-space would pass a
corresponding memory hint); the vb2 core then would pass the
vb2_queue dma_attrs to the vb2 allocators. The vb2 allocator
would use the queue's dma_attr and the DMA API would allocate
either coherent or non-coherent memory.

But we cannot do this anymore, since there is no corresponding DMA
attr flag and, hence, there is no way for the allocator to become
aware of what type of allocation user-space has requested. So we
need to pass more context from videobuf2 core to the allocators.

Fix this by changing the call_ptr_memop() macro to pass the
vb2 pointer to the corresponding op callbacks.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/common/videobuf2/videobuf2-core.c   | 42 +++++++++++--------
 .../common/videobuf2/videobuf2-dma-contig.c   | 36 +++++++++-------
 .../media/common/videobuf2/videobuf2-dma-sg.c | 33 ++++++++-------
 .../common/videobuf2/videobuf2-vmalloc.c      | 30 ++++++-------
 include/media/videobuf2-core.h                | 37 ++++++++--------
 5 files changed, 98 insertions(+), 80 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 38ce7c274727..c4ff356da600 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -68,13 +68,13 @@ module_param(debug, int, 0644);
 	err;								\
 })
 
-#define call_ptr_memop(vb, op, args...)					\
+#define call_ptr_memop(op, vb, args...)					\
 ({									\
 	struct vb2_queue *_q = (vb)->vb2_queue;				\
 	void *ptr;							\
 									\
 	log_memop(vb, op);						\
-	ptr = _q->mem_ops->op ? _q->mem_ops->op(args) : NULL;		\
+	ptr = _q->mem_ops->op ? _q->mem_ops->op(vb, args) : NULL;	\
 	if (!IS_ERR_OR_NULL(ptr))					\
 		(vb)->cnt_mem_ ## op++;					\
 	ptr;								\
@@ -144,9 +144,9 @@ module_param(debug, int, 0644);
 	((vb)->vb2_queue->mem_ops->op ?					\
 		(vb)->vb2_queue->mem_ops->op(args) : 0)
 
-#define call_ptr_memop(vb, op, args...)					\
+#define call_ptr_memop(op, vb, args...)					\
 	((vb)->vb2_queue->mem_ops->op ?					\
-		(vb)->vb2_queue->mem_ops->op(args) : NULL)
+		(vb)->vb2_queue->mem_ops->op(vb, args) : NULL)
 
 #define call_void_memop(vb, op, args...)				\
 	do {								\
@@ -230,9 +230,10 @@ static int __vb2_buf_mem_alloc(struct vb2_buffer *vb)
 		if (size < vb->planes[plane].length)
 			goto free;
 
-		mem_priv = call_ptr_memop(vb, alloc,
-				q->alloc_devs[plane] ? : q->dev,
-				q->dma_attrs, size, q->dma_dir, q->gfp_flags);
+		mem_priv = call_ptr_memop(alloc,
+					  vb,
+					  q->alloc_devs[plane] ? : q->dev,
+					  size);
 		if (IS_ERR_OR_NULL(mem_priv)) {
 			if (mem_priv)
 				ret = PTR_ERR(mem_priv);
@@ -975,7 +976,7 @@ void *vb2_plane_vaddr(struct vb2_buffer *vb, unsigned int plane_no)
 	if (plane_no >= vb->num_planes || !vb->planes[plane_no].mem_priv)
 		return NULL;
 
-	return call_ptr_memop(vb, vaddr, vb->planes[plane_no].mem_priv);
+	return call_ptr_memop(vaddr, vb, vb->planes[plane_no].mem_priv);
 
 }
 EXPORT_SYMBOL_GPL(vb2_plane_vaddr);
@@ -985,7 +986,7 @@ void *vb2_plane_cookie(struct vb2_buffer *vb, unsigned int plane_no)
 	if (plane_no >= vb->num_planes || !vb->planes[plane_no].mem_priv)
 		return NULL;
 
-	return call_ptr_memop(vb, cookie, vb->planes[plane_no].mem_priv);
+	return call_ptr_memop(cookie, vb, vb->planes[plane_no].mem_priv);
 }
 EXPORT_SYMBOL_GPL(vb2_plane_cookie);
 
@@ -1125,10 +1126,11 @@ static int __prepare_userptr(struct vb2_buffer *vb)
 		vb->planes[plane].data_offset = 0;
 
 		/* Acquire each plane's memory */
-		mem_priv = call_ptr_memop(vb, get_userptr,
-				q->alloc_devs[plane] ? : q->dev,
-				planes[plane].m.userptr,
-				planes[plane].length, q->dma_dir);
+		mem_priv = call_ptr_memop(get_userptr,
+					  vb,
+					  q->alloc_devs[plane] ? : q->dev,
+					  planes[plane].m.userptr,
+					  planes[plane].length);
 		if (IS_ERR(mem_priv)) {
 			dprintk(q, 1, "failed acquiring userspace memory for plane %d\n",
 				plane);
@@ -1249,9 +1251,11 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 		vb->planes[plane].data_offset = 0;
 
 		/* Acquire each plane's memory */
-		mem_priv = call_ptr_memop(vb, attach_dmabuf,
-				q->alloc_devs[plane] ? : q->dev,
-				dbuf, planes[plane].length, q->dma_dir);
+		mem_priv = call_ptr_memop(attach_dmabuf,
+					  vb,
+					  q->alloc_devs[plane] ? : q->dev,
+					  dbuf,
+					  planes[plane].length);
 		if (IS_ERR(mem_priv)) {
 			dprintk(q, 1, "failed to attach dmabuf\n");
 			ret = PTR_ERR(mem_priv);
@@ -2197,8 +2201,10 @@ int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
 
 	vb_plane = &vb->planes[plane];
 
-	dbuf = call_ptr_memop(vb, get_dmabuf, vb_plane->mem_priv,
-				flags & O_ACCMODE);
+	dbuf = call_ptr_memop(get_dmabuf,
+			      vb,
+			      vb_plane->mem_priv,
+			      flags & O_ACCMODE);
 	if (IS_ERR_OR_NULL(dbuf)) {
 		dprintk(q, 1, "failed to export buffer %d, plane %d\n",
 			index, plane);
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index a7f61ba85440..019c3843dc6d 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -40,6 +40,8 @@ struct vb2_dc_buf {
 
 	/* DMABUF related */
 	struct dma_buf_attachment	*db_attach;
+
+	struct vb2_buffer		*vb;
 };
 
 /*********************************************/
@@ -66,14 +68,14 @@ static unsigned long vb2_dc_get_contiguous_size(struct sg_table *sgt)
 /*         callbacks for all buffers         */
 /*********************************************/
 
-static void *vb2_dc_cookie(void *buf_priv)
+static void *vb2_dc_cookie(struct vb2_buffer *vb, void *buf_priv)
 {
 	struct vb2_dc_buf *buf = buf_priv;
 
 	return &buf->dma_addr;
 }
 
-static void *vb2_dc_vaddr(void *buf_priv)
+static void *vb2_dc_vaddr(struct vb2_buffer *vb, void *buf_priv)
 {
 	struct vb2_dc_buf *buf = buf_priv;
 	struct dma_buf_map map;
@@ -137,9 +139,9 @@ static void vb2_dc_put(void *buf_priv)
 	kfree(buf);
 }
 
-static void *vb2_dc_alloc(struct device *dev, unsigned long attrs,
-			  unsigned long size, enum dma_data_direction dma_dir,
-			  gfp_t gfp_flags)
+static void *vb2_dc_alloc(struct vb2_buffer *vb,
+			  struct device *dev,
+			  unsigned long size)
 {
 	struct vb2_dc_buf *buf;
 
@@ -150,9 +152,10 @@ static void *vb2_dc_alloc(struct device *dev, unsigned long attrs,
 	if (!buf)
 		return ERR_PTR(-ENOMEM);
 
-	buf->attrs = attrs;
+	buf->attrs = vb->vb2_queue->dma_attrs;
 	buf->cookie = dma_alloc_attrs(dev, size, &buf->dma_addr,
-					GFP_KERNEL | gfp_flags, buf->attrs);
+				      GFP_KERNEL | vb->vb2_queue->gfp_flags,
+				      buf->attrs);
 	if (!buf->cookie) {
 		dev_err(dev, "dma_alloc_coherent of size %ld failed\n", size);
 		kfree(buf);
@@ -165,11 +168,12 @@ static void *vb2_dc_alloc(struct device *dev, unsigned long attrs,
 	/* Prevent the device from being released while the buffer is used */
 	buf->dev = get_device(dev);
 	buf->size = size;
-	buf->dma_dir = dma_dir;
+	buf->dma_dir = vb->vb2_queue->dma_dir;
 
 	buf->handler.refcount = &buf->refcount;
 	buf->handler.put = vb2_dc_put;
 	buf->handler.arg = buf;
+	buf->vb = vb;
 
 	refcount_set(&buf->refcount, 1);
 
@@ -397,7 +401,9 @@ static struct sg_table *vb2_dc_get_base_sgt(struct vb2_dc_buf *buf)
 	return sgt;
 }
 
-static struct dma_buf *vb2_dc_get_dmabuf(void *buf_priv, unsigned long flags)
+static struct dma_buf *vb2_dc_get_dmabuf(struct vb2_buffer *vb,
+					 void *buf_priv,
+					 unsigned long flags)
 {
 	struct vb2_dc_buf *buf = buf_priv;
 	struct dma_buf *dbuf;
@@ -459,8 +465,8 @@ static void vb2_dc_put_userptr(void *buf_priv)
 	kfree(buf);
 }
 
-static void *vb2_dc_get_userptr(struct device *dev, unsigned long vaddr,
-	unsigned long size, enum dma_data_direction dma_dir)
+static void *vb2_dc_get_userptr(struct vb2_buffer *vb, struct device *dev,
+				unsigned long vaddr, unsigned long size)
 {
 	struct vb2_dc_buf *buf;
 	struct frame_vector *vec;
@@ -490,7 +496,7 @@ static void *vb2_dc_get_userptr(struct device *dev, unsigned long vaddr,
 		return ERR_PTR(-ENOMEM);
 
 	buf->dev = dev;
-	buf->dma_dir = dma_dir;
+	buf->dma_dir = vb->vb2_queue->dma_dir;
 
 	offset = lower_32_bits(offset_in_page(vaddr));
 	vec = vb2_create_framevec(vaddr, size);
@@ -660,8 +666,8 @@ static void vb2_dc_detach_dmabuf(void *mem_priv)
 	kfree(buf);
 }
 
-static void *vb2_dc_attach_dmabuf(struct device *dev, struct dma_buf *dbuf,
-	unsigned long size, enum dma_data_direction dma_dir)
+static void *vb2_dc_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
+				  struct dma_buf *dbuf, unsigned long size)
 {
 	struct vb2_dc_buf *buf;
 	struct dma_buf_attachment *dba;
@@ -685,7 +691,7 @@ static void *vb2_dc_attach_dmabuf(struct device *dev, struct dma_buf *dbuf,
 		return dba;
 	}
 
-	buf->dma_dir = dma_dir;
+	buf->dma_dir = vb->vb2_queue->dma_dir;
 	buf->size = size;
 	buf->db_attach = dba;
 
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index c5b06a509566..50265080cfc8 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -51,6 +51,8 @@ struct vb2_dma_sg_buf {
 	struct vb2_vmarea_handler	handler;
 
 	struct dma_buf_attachment	*db_attach;
+
+	struct vb2_buffer		*vb;
 };
 
 static void vb2_dma_sg_put(void *buf_priv);
@@ -96,9 +98,8 @@ static int vb2_dma_sg_alloc_compacted(struct vb2_dma_sg_buf *buf,
 	return 0;
 }
 
-static void *vb2_dma_sg_alloc(struct device *dev, unsigned long dma_attrs,
-			      unsigned long size, enum dma_data_direction dma_dir,
-			      gfp_t gfp_flags)
+static void *vb2_dma_sg_alloc(struct vb2_buffer *vb, struct device *dev,
+			      unsigned long size)
 {
 	struct vb2_dma_sg_buf *buf;
 	struct sg_table *sgt;
@@ -113,7 +114,7 @@ static void *vb2_dma_sg_alloc(struct device *dev, unsigned long dma_attrs,
 		return ERR_PTR(-ENOMEM);
 
 	buf->vaddr = NULL;
-	buf->dma_dir = dma_dir;
+	buf->dma_dir = vb->vb2_queue->dma_dir;
 	buf->offset = 0;
 	buf->size = size;
 	/* size is already page aligned */
@@ -130,7 +131,7 @@ static void *vb2_dma_sg_alloc(struct device *dev, unsigned long dma_attrs,
 	if (!buf->pages)
 		goto fail_pages_array_alloc;
 
-	ret = vb2_dma_sg_alloc_compacted(buf, gfp_flags);
+	ret = vb2_dma_sg_alloc_compacted(buf, vb->vb2_queue->gfp_flags);
 	if (ret)
 		goto fail_pages_alloc;
 
@@ -154,6 +155,7 @@ static void *vb2_dma_sg_alloc(struct device *dev, unsigned long dma_attrs,
 	buf->handler.refcount = &buf->refcount;
 	buf->handler.put = vb2_dma_sg_put;
 	buf->handler.arg = buf;
+	buf->vb = vb;
 
 	refcount_set(&buf->refcount, 1);
 
@@ -213,9 +215,8 @@ static void vb2_dma_sg_finish(void *buf_priv)
 	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
 }
 
-static void *vb2_dma_sg_get_userptr(struct device *dev, unsigned long vaddr,
-				    unsigned long size,
-				    enum dma_data_direction dma_dir)
+static void *vb2_dma_sg_get_userptr(struct vb2_buffer *vb, struct device *dev,
+				    unsigned long vaddr, unsigned long size)
 {
 	struct vb2_dma_sg_buf *buf;
 	struct sg_table *sgt;
@@ -230,7 +231,7 @@ static void *vb2_dma_sg_get_userptr(struct device *dev, unsigned long vaddr,
 
 	buf->vaddr = NULL;
 	buf->dev = dev;
-	buf->dma_dir = dma_dir;
+	buf->dma_dir = vb->vb2_queue->dma_dir;
 	buf->offset = vaddr & ~PAGE_MASK;
 	buf->size = size;
 	buf->dma_sgt = &buf->sg_table;
@@ -292,7 +293,7 @@ static void vb2_dma_sg_put_userptr(void *buf_priv)
 	kfree(buf);
 }
 
-static void *vb2_dma_sg_vaddr(void *buf_priv)
+static void *vb2_dma_sg_vaddr(struct vb2_buffer *vb, void *buf_priv)
 {
 	struct vb2_dma_sg_buf *buf = buf_priv;
 	struct dma_buf_map map;
@@ -511,7 +512,9 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops = {
 	.release = vb2_dma_sg_dmabuf_ops_release,
 };
 
-static struct dma_buf *vb2_dma_sg_get_dmabuf(void *buf_priv, unsigned long flags)
+static struct dma_buf *vb2_dma_sg_get_dmabuf(struct vb2_buffer *vb,
+					     void *buf_priv,
+					     unsigned long flags)
 {
 	struct vb2_dma_sg_buf *buf = buf_priv;
 	struct dma_buf *dbuf;
@@ -605,8 +608,8 @@ static void vb2_dma_sg_detach_dmabuf(void *mem_priv)
 	kfree(buf);
 }
 
-static void *vb2_dma_sg_attach_dmabuf(struct device *dev, struct dma_buf *dbuf,
-	unsigned long size, enum dma_data_direction dma_dir)
+static void *vb2_dma_sg_attach_dmabuf(struct vb2_buffer *vb, struct device *dev,
+				      struct dma_buf *dbuf, unsigned long size)
 {
 	struct vb2_dma_sg_buf *buf;
 	struct dma_buf_attachment *dba;
@@ -630,14 +633,14 @@ static void *vb2_dma_sg_attach_dmabuf(struct device *dev, struct dma_buf *dbuf,
 		return dba;
 	}
 
-	buf->dma_dir = dma_dir;
+	buf->dma_dir = vb->vb2_queue->dma_dir;
 	buf->size = size;
 	buf->db_attach = dba;
 
 	return buf;
 }
 
-static void *vb2_dma_sg_cookie(void *buf_priv)
+static void *vb2_dma_sg_cookie(struct vb2_buffer *vb, void *buf_priv)
 {
 	struct vb2_dma_sg_buf *buf = buf_priv;
 
diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
index 83f95258ec8c..ef36abd912dc 100644
--- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
+++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
@@ -34,13 +34,12 @@ struct vb2_vmalloc_buf {
 
 static void vb2_vmalloc_put(void *buf_priv);
 
-static void *vb2_vmalloc_alloc(struct device *dev, unsigned long attrs,
-			       unsigned long size, enum dma_data_direction dma_dir,
-			       gfp_t gfp_flags)
+static void *vb2_vmalloc_alloc(struct vb2_buffer *vb, struct device *dev,
+			       unsigned long size)
 {
 	struct vb2_vmalloc_buf *buf;
 
-	buf = kzalloc(sizeof(*buf), GFP_KERNEL | gfp_flags);
+	buf = kzalloc(sizeof(*buf), GFP_KERNEL | vb->vb2_queue->gfp_flags);
 	if (!buf)
 		return ERR_PTR(-ENOMEM);
 
@@ -52,7 +51,7 @@ static void *vb2_vmalloc_alloc(struct device *dev, unsigned long attrs,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	buf->dma_dir = dma_dir;
+	buf->dma_dir = vb->vb2_queue->dma_dir;
 	buf->handler.refcount = &buf->refcount;
 	buf->handler.put = vb2_vmalloc_put;
 	buf->handler.arg = buf;
@@ -71,9 +70,8 @@ static void vb2_vmalloc_put(void *buf_priv)
 	}
 }
 
-static void *vb2_vmalloc_get_userptr(struct device *dev, unsigned long vaddr,
-				     unsigned long size,
-				     enum dma_data_direction dma_dir)
+static void *vb2_vmalloc_get_userptr(struct vb2_buffer *vb, struct device *dev,
+				     unsigned long vaddr, unsigned long size)
 {
 	struct vb2_vmalloc_buf *buf;
 	struct frame_vector *vec;
@@ -84,7 +82,7 @@ static void *vb2_vmalloc_get_userptr(struct device *dev, unsigned long vaddr,
 	if (!buf)
 		return ERR_PTR(-ENOMEM);
 
-	buf->dma_dir = dma_dir;
+	buf->dma_dir = vb->vb2_queue->dma_dir;
 	offset = vaddr & ~PAGE_MASK;
 	buf->size = size;
 	vec = vb2_create_framevec(vaddr, size);
@@ -147,7 +145,7 @@ static void vb2_vmalloc_put_userptr(void *buf_priv)
 	kfree(buf);
 }
 
-static void *vb2_vmalloc_vaddr(void *buf_priv)
+static void *vb2_vmalloc_vaddr(struct vb2_buffer *vb, void *buf_priv)
 {
 	struct vb2_vmalloc_buf *buf = buf_priv;
 
@@ -339,7 +337,9 @@ static const struct dma_buf_ops vb2_vmalloc_dmabuf_ops = {
 	.release = vb2_vmalloc_dmabuf_ops_release,
 };
 
-static struct dma_buf *vb2_vmalloc_get_dmabuf(void *buf_priv, unsigned long flags)
+static struct dma_buf *vb2_vmalloc_get_dmabuf(struct vb2_buffer *vb,
+					      void *buf_priv,
+					      unsigned long flags)
 {
 	struct vb2_vmalloc_buf *buf = buf_priv;
 	struct dma_buf *dbuf;
@@ -403,8 +403,10 @@ static void vb2_vmalloc_detach_dmabuf(void *mem_priv)
 	kfree(buf);
 }
 
-static void *vb2_vmalloc_attach_dmabuf(struct device *dev, struct dma_buf *dbuf,
-	unsigned long size, enum dma_data_direction dma_dir)
+static void *vb2_vmalloc_attach_dmabuf(struct vb2_buffer *vb,
+				       struct device *dev,
+				       struct dma_buf *dbuf,
+				       unsigned long size)
 {
 	struct vb2_vmalloc_buf *buf;
 
@@ -416,7 +418,7 @@ static void *vb2_vmalloc_attach_dmabuf(struct device *dev, struct dma_buf *dbuf,
 		return ERR_PTR(-ENOMEM);
 
 	buf->dbuf = dbuf;
-	buf->dma_dir = dma_dir;
+	buf->dma_dir = vb->vb2_queue->dma_dir;
 	buf->size = size;
 
 	return buf;
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 12955cb460d2..3b5986cee073 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -46,6 +46,7 @@ enum vb2_memory {
 
 struct vb2_fileio_data;
 struct vb2_threadio_data;
+struct vb2_buffer;
 
 /**
  * struct vb2_mem_ops - memory handling/memory allocator operations.
@@ -53,10 +54,8 @@ struct vb2_threadio_data;
  *		return ERR_PTR() on failure or a pointer to allocator private,
  *		per-buffer data on success; the returned private structure
  *		will then be passed as @buf_priv argument to other ops in this
- *		structure. Additional gfp_flags to use when allocating the
- *		are also passed to this operation. These flags are from the
- *		gfp_flags field of vb2_queue. The size argument to this function
- *		shall be *page aligned*.
+ *		structure. The size argument to this function shall be
+ *		*page aligned*.
  * @put:	inform the allocator that the buffer will no longer be used;
  *		usually will result in the allocator freeing the buffer (if
  *		no other users of this buffer are present); the @buf_priv
@@ -117,31 +116,33 @@ struct vb2_threadio_data;
  *       map_dmabuf, unmap_dmabuf.
  */
 struct vb2_mem_ops {
-	void		*(*alloc)(struct device *dev, unsigned long attrs,
-				  unsigned long size,
-				  enum dma_data_direction dma_dir,
-				  gfp_t gfp_flags);
+	void		*(*alloc)(struct vb2_buffer *vb,
+				  struct device *dev,
+				  unsigned long size);
 	void		(*put)(void *buf_priv);
-	struct dma_buf *(*get_dmabuf)(void *buf_priv, unsigned long flags);
-
-	void		*(*get_userptr)(struct device *dev, unsigned long vaddr,
-					unsigned long size,
-					enum dma_data_direction dma_dir);
+	struct dma_buf *(*get_dmabuf)(struct vb2_buffer *vb,
+				      void *buf_priv,
+				      unsigned long flags);
+
+	void		*(*get_userptr)(struct vb2_buffer *vb,
+					struct device *dev,
+					unsigned long vaddr,
+					unsigned long size);
 	void		(*put_userptr)(void *buf_priv);
 
 	void		(*prepare)(void *buf_priv);
 	void		(*finish)(void *buf_priv);
 
-	void		*(*attach_dmabuf)(struct device *dev,
+	void		*(*attach_dmabuf)(struct vb2_buffer *vb,
+					  struct device *dev,
 					  struct dma_buf *dbuf,
-					  unsigned long size,
-					  enum dma_data_direction dma_dir);
+					  unsigned long size);
 	void		(*detach_dmabuf)(void *buf_priv);
 	int		(*map_dmabuf)(void *buf_priv);
 	void		(*unmap_dmabuf)(void *buf_priv);
 
-	void		*(*vaddr)(void *buf_priv);
-	void		*(*cookie)(void *buf_priv);
+	void		*(*vaddr)(struct vb2_buffer *vb, void *buf_priv);
+	void		*(*cookie)(struct vb2_buffer *vb, void *buf_priv);
 
 	unsigned int	(*num_users)(void *buf_priv);
 
-- 
2.33.0.rc2.250.ged5fa647cd-goog

