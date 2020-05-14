Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 601821D35E8
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 18:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728140AbgENQDI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 12:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgENQDI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 12:03:08 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A143C061A0C;
        Thu, 14 May 2020 09:03:08 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id k19so1320046pll.9;
        Thu, 14 May 2020 09:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j+7rcI71ob1TCh3mFTQUYSyuPNtTEDwVHxFopC5n+l4=;
        b=fWxeT1ZT6UVUHS2GF8VAtUgKyPspjfFm5v903g5YSUOUw1OuN9sFtBd6MhOzzVCi7R
         NDws98zU6RofXDjz40SoZ0jxxz1ZW6j94w1BYBM52wPhvAdMgRydw3ptQaOFWM96jVp3
         PuCUXs8hNqiaQDl3B8zCxkfSCZ/Nik8QTmYN5LMFclVQkUIicnDIbt019I/kFxa8dNsy
         SiNP8SRm5CkiUJWuJC8F5nVgVHaIe90rx3rLQU6KTmQAl3EWz+fUf83PcJB0Xcnv6LFe
         Zja74k5sCnCuovHqEZNpY+c5Zw0rnwZyW1HFDPoauA0V81Zj2EGsG/KW/ux4+nmnD0Hv
         e/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j+7rcI71ob1TCh3mFTQUYSyuPNtTEDwVHxFopC5n+l4=;
        b=JIuoAK8cVAPsb2KQZnmPvfX1RKo2cYNtYF+C5MmevCqcsM+Df0cH05XM3ctY6mixXs
         aIpYNpu8Vw6VPl0ibnSFGDAqpJhS2qyydhjLEVAQ6b2rOOqKOUpBjol2fitmia5eReR4
         URyh6DY3h6rBc1nRx9Jpokg4pIuS+Y6w7QuysB1APr8qEpq7zrcX1pISLbd9KrVO6dWj
         1x3FepNXXlBBbhd7Is03hFSXW7aCF5St22ZTgYJdCWlqn0tsFOGACrx/YB5FeMe0jrSf
         URYPJ0N1PrCjkxoJ4maXDOmFX2faDzRINWiDUXnyshKEOEjDQa+a6UYm9IQBlQtEg/+N
         kUHA==
X-Gm-Message-State: AGi0PuYACll9B7cVnhz1VocUngGo4Ld1RyUu2Uke2KR/ug63kaEnFRRs
        fmOTJCMGZY+CiiMOXru+FF4=
X-Google-Smtp-Source: APiQypLorpEj8Og92qIBtUjHv70O0po3EFOWp2HeX2dSpSQF+qRPmqE+Xuln771lc69lZww9JQW40Q==
X-Received: by 2002:a17:90a:3687:: with SMTP id t7mr40214024pjb.233.1589472187634;
        Thu, 14 May 2020 09:03:07 -0700 (PDT)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id y6sm18178691pjw.15.2020.05.14.09.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 09:03:06 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v6 11/14] videobuf2: add begin/end cpu_access callbacks to dma-sg
Date:   Fri, 15 May 2020 01:01:50 +0900
Message-Id: <20200514160153.3646-12-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
References: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sergey Senozhatsky <senozhatsky@chromium.org>

Provide begin_cpu_access() and end_cpu_access() dma_buf_ops
callbacks for cache synchronisation on exported buffers.

V4L2_FLAG_MEMORY_NON_CONSISTENT has no effect on dma-sg buffers.
dma-sg allocates memory using the page allocator directly, so
there is no memory consistency guarantee.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../media/common/videobuf2/videobuf2-dma-sg.c | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index 92072a08af25..595137e358e7 100644
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
@@ -469,6 +475,28 @@ static void vb2_dma_sg_dmabuf_ops_release(struct dma_buf *dbuf)
 	vb2_dma_sg_put(dbuf->priv);
 }
 
+static int
+vb2_dma_sg_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
+				       enum dma_data_direction direction)
+{
+	struct vb2_dma_sg_buf *buf = dbuf->priv;
+	struct sg_table *sgt = buf->dma_sgt;
+
+	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
+	return 0;
+}
+
+static int
+vb2_dma_sg_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
+				     enum dma_data_direction direction)
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
@@ -487,6 +515,8 @@ static const struct dma_buf_ops vb2_dma_sg_dmabuf_ops = {
 	.detach = vb2_dma_sg_dmabuf_ops_detach,
 	.map_dma_buf = vb2_dma_sg_dmabuf_ops_map,
 	.unmap_dma_buf = vb2_dma_sg_dmabuf_ops_unmap,
+	.begin_cpu_access = vb2_dma_sg_dmabuf_ops_begin_cpu_access,
+	.end_cpu_access = vb2_dma_sg_dmabuf_ops_end_cpu_access,
 	.vmap = vb2_dma_sg_dmabuf_ops_vmap,
 	.mmap = vb2_dma_sg_dmabuf_ops_mmap,
 	.release = vb2_dma_sg_dmabuf_ops_release,
-- 
2.26.2

