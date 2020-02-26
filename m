Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0A416FD28
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 12:16:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728355AbgBZLQZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 06:16:25 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:36026 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728347AbgBZLQY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 06:16:24 -0500
Received: by mail-pj1-f67.google.com with SMTP id gv17so1148263pjb.1
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2020 03:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vqnI8gtSZFQZzEwQepw4bYm9gKT2/CP5tzXnaA3LBtQ=;
        b=geNq2EXfBike1hJuxtOmzbDGmZhTw10QbWW/5PJpq0K8lAJXxQQv7XP8IRT/oQjC85
         /6vgd1mLwaHPSGSDlCELRu9d2b2DugBCNJBjPfPqiKHgznRKffVevlMSs51mkxMCYFMV
         YxWpgSJBAwLB4hpisWuehWaxAUSmOr4NJE5EE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vqnI8gtSZFQZzEwQepw4bYm9gKT2/CP5tzXnaA3LBtQ=;
        b=W81JfQbslcjj4rTOfJUAeLpHA6KUT41PXKANAmk+5kRwge6N9KdEUiPBq3JeYLbla8
         TtBhRDpLhkTRTz/vy4hEbqaqYvK97ejMNqJyLdDOL/F0dBXQv9ZVbaNX/zWqQUyEva/6
         0pvO16QK3f+KBdNq6p4DDPQoAXBiqctQ0/ycyJjIyBvWM32a2WcA00pN9hAFbvasTg7j
         7mI28zrFEKS/w5FXIRGCp9NEFlSwVg9uxaBWuKWG20xyOavoOndJSqR6sUCjbZKdIrD0
         PWYmHUKJ6GbrI/1NprWTnx3l/tUzPwJqfIxlbyc1h451199ZxuI1VLsRv3ehOpvX9ITo
         wjMw==
X-Gm-Message-State: APjAAAXoll0wmeEGdrGX/CXgMakR/OynYAdQvO/CspUc8H7EbRhSgGrN
        Hd5TqwHAhr2Qkzoie7LKtPBKIg==
X-Google-Smtp-Source: APXvYqyv+iska2Eim0BK6W5wb56qt7LUqloQ/7gNoQ/GwfqHGj0R2iuxoBePy/vYFjWu0MYyKrh3kg==
X-Received: by 2002:a17:902:8215:: with SMTP id x21mr3817650pln.59.1582715783534;
        Wed, 26 Feb 2020 03:16:23 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id o22sm2429993pgj.58.2020.02.26.03.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 03:16:22 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 10/11] videobuf2: add begin/end cpu_access callbacks to dma-sg
Date:   Wed, 26 Feb 2020 20:15:28 +0900
Message-Id: <20200226111529.180197-11-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200226111529.180197-1-senozhatsky@chromium.org>
References: <20200226111529.180197-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Provide begin_cpu_access() and end_cpu_access() dma_buf_ops
callbacks for cache synchronisation on exported buffers.

V4L2_FLAG_MEMORY_NON_CONSISTENT has no effect on dma-sg buffers.
dma-sg allocates memory using the page allocator directly, so
there is no memory consistency guarantee.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/common/videobuf2/videobuf2-dma-sg.c | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index 6db60e9d5183..ddc67c9aaedb 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -120,6 +120,12 @@ static void *vb2_dma_sg_alloc(struct device *dev, unsigned long dma_attrs,
 	buf->num_pages = size >> PAGE_SHIFT;
 	buf->dma_sgt = &buf->sg_table;
 
+	/*
+	 * NOTE: dma-sg allocates memory using the page allocator directly, so
+	 * there is no memory consistency guarantee, hence dma-sg ignores DMA
+	 * attributes passed from the upper layer. That means that
+	 * V4L2_FLAG_MEMORY_NON_CONSISTENT has no effect on dma-sg buffers.
+	 */
 	buf->pages = kvmalloc_array(buf->num_pages, sizeof(struct page *),
 				    GFP_KERNEL | __GFP_ZERO);
 	if (!buf->pages)
@@ -470,6 +476,26 @@ static void vb2_dma_sg_dmabuf_ops_release(struct dma_buf *dbuf)
 	vb2_dma_sg_put(dbuf->priv);
 }
 
+static int vb2_dma_sg_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
+					enum dma_data_direction direction)
+{
+	struct vb2_dma_sg_buf *buf = dbuf->priv;
+	struct sg_table *sgt = buf->dma_sgt;
+
+	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
+	return 0;
+}
+
+static int vb2_dma_sg_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
+					enum dma_data_direction direction)
+{
+	struct vb2_dma_sg_buf *buf = dbuf->priv;
+	struct sg_table *sgt = buf->dma_sgt;
+
+	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
+	return 0;
+}
+
 static void *vb2_dma_sg_dmabuf_ops_vmap(struct dma_buf *dbuf)
 {
 	struct vb2_dma_sg_buf *buf = dbuf->priv;
@@ -488,6 +514,8 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops = {
 	.detach = vb2_dma_sg_dmabuf_ops_detach,
 	.map_dma_buf = vb2_dma_sg_dmabuf_ops_map,
 	.unmap_dma_buf = vb2_dma_sg_dmabuf_ops_unmap,
+	.begin_cpu_access = vb2_dma_sg_dmabuf_ops_begin_cpu_access,
+	.end_cpu_access = vb2_dma_sg_dmabuf_ops_end_cpu_access,
 	.vmap = vb2_dma_sg_dmabuf_ops_vmap,
 	.mmap = vb2_dma_sg_dmabuf_ops_mmap,
 	.release = vb2_dma_sg_dmabuf_ops_release,
-- 
2.25.0.265.gbab2e86ba0-goog

