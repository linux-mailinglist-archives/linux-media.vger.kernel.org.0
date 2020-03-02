Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13C7D17528D
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 05:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbgCBENU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Mar 2020 23:13:20 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43823 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgCBENU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Mar 2020 23:13:20 -0500
Received: by mail-pl1-f194.google.com with SMTP id p11so3650775plq.10
        for <linux-media@vger.kernel.org>; Sun, 01 Mar 2020 20:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vqnI8gtSZFQZzEwQepw4bYm9gKT2/CP5tzXnaA3LBtQ=;
        b=h+hb2CDBO3It2UCMkrG6UzXN8ZD97LJ2y7IP1ZA7oK9uwPR3WHp/TwSiOUMa49OxJn
         PAgUXLXDG+kcoQ1a72e4ZpOzvGyAQOsDNGAQi+JCI2CA9mgpy3nNVexqzHZOrEd0q/pf
         DOy3XfvenMlwx2AtPL/jpZjYDi93yW2odD17k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vqnI8gtSZFQZzEwQepw4bYm9gKT2/CP5tzXnaA3LBtQ=;
        b=nbTbmIAykihvPAQhnPV68YqDz19Z20h6OSeoEJc9goVLP+hxZscj61pSD/NUqdSkIe
         1pSmG227r0nnxZv6NfiZoUXuDcqV3j22//XSBpZaAICGLa4zHwRyoX3DQ3tqMfDX8DaM
         RL4jl3vlsRsndUBH3MtR9vlyQ5a18MShamgJmTCGuuUsTIkLqFTUNa80eaB16LPSjeX0
         xm8/Ipy4H7EkqsHgdoUOxyms/XsAIOu3h3Q3uoVURJyLe/GKmq3SjGYeNPsfvYwpTk3V
         Ht1aDcXgpH2tmkkD5tOnofuZj8s82Qe31M38+/XK8W+J3W37WMak3o1YsfWcdA9oWgaU
         43pQ==
X-Gm-Message-State: APjAAAXoT+XdGXTfofJbbx2RIN/Wqq8isfziEw1f0fWNWm/CxgiR+RJn
        ithgfWM6jzgYFa+8dXQ2POPkXA==
X-Google-Smtp-Source: APXvYqwfxxAXtiIt2hNbFb1EKkOpeM1qWBuwmSb8pUM3hAaRD5PccjlfUFm6MgFAeFfQPW80413mwQ==
X-Received: by 2002:a17:90a:664c:: with SMTP id f12mr17907257pjm.61.1583122399076;
        Sun, 01 Mar 2020 20:13:19 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id d82sm1698114pfd.187.2020.03.01.20.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 20:13:18 -0800 (PST)
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
Subject: [PATCHv4 10/11] videobuf2: add begin/end cpu_access callbacks to dma-sg
Date:   Mon,  2 Mar 2020 13:12:12 +0900
Message-Id: <20200302041213.27662-11-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200302041213.27662-1-senozhatsky@chromium.org>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
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

