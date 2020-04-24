Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1D281B70F0
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 11:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgDXJb2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 05:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726523AbgDXJb1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 05:31:27 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19104C09B045;
        Fri, 24 Apr 2020 02:31:26 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id f7so4531873pfa.9;
        Fri, 24 Apr 2020 02:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j+7rcI71ob1TCh3mFTQUYSyuPNtTEDwVHxFopC5n+l4=;
        b=Mc5wOBEovvA8VKll9zKSSt0ov271hrgBPfmA98Z/XaypAeo4uqXxobP2NkwsWHnxdt
         3Bv3O1RGAjVThwSCEzfhN49ebUXyAw4Ubyn1hbyxrOAWofEsDym7QLxFboksPhWHMEgg
         5UdlfSkEp1oH83GhIqzbkwEZsYzmctmnvsKzMcCn3F/ERW4kPSLmXJTeVNmkwgRzpYPO
         tcfrONxc7B0ZWbDUnxe4wCh/JoTPR3oMSjN7WFgaMYpL/ZcUjCI67FGYsp33XThvR1+i
         5d8gKhDMXf/7Umf0UkO7LudWIs2jgm7TJMvwSYZmKwY1GSOqtjEyrhUQaqWUcdDlKoBF
         pZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j+7rcI71ob1TCh3mFTQUYSyuPNtTEDwVHxFopC5n+l4=;
        b=VRV+rHUcexv8jcuiFgVF1+SMmalAk6q2TK3I2bSWr2jYpLQBraDFtz35k30PUUdLwI
         l/1f9lIxjpJhQQvS8Cx4ohboXN2pwK9TpY53Wx0n/zgG4yrtWp3aLbsj+tPrsvjt0dI2
         ELXx8d0WgYGZSFOZmSjFRKboyH7kTBZFtm+CL7nNAS11Tbjmow8wnSFnonHdg2WWdkHD
         Hr8y6DMJGngWC9fJY41sk8xyj94fqOuF9UfAD0wcN63PG3xM70cgH8ydrzWhdmvzub5p
         omVFjzNIBXAr45crer+kUAM9mUI3D/bQaa1cchXgMYlMfLLRhKT8GacUCCGW/p9b4ACC
         3KHQ==
X-Gm-Message-State: AGi0PuZ+GrN2EdWeHIRtMs21OdKmAg6U+g7udP6x+CtFqTkta9QhIHCo
        nU31JCatHlLtYBetSm/7hEU=
X-Google-Smtp-Source: APiQypLhXYrHZOSJHOuryWHWBpBYQsMMElc0pgZq88wVU1rhQQzjGKMWRz+S0LVctnvH1GMN4CW+Eg==
X-Received: by 2002:aa7:850f:: with SMTP id v15mr8386664pfn.204.1587720685442;
        Fri, 24 Apr 2020 02:31:25 -0700 (PDT)
Received: from localhost.localdomain (146.85.30.125.dy.iij4u.or.jp. [125.30.85.146])
        by smtp.gmail.com with ESMTPSA id 185sm5541315pfv.9.2020.04.24.02.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 02:31:24 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv5 11/13] videobuf2: add begin/end cpu_access callbacks to dma-sg
Date:   Fri, 24 Apr 2020 18:29:18 +0900
Message-Id: <20200424092920.4801-12-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200424092920.4801-1-sergey.senozhatsky@gmail.com>
References: <20200424092920.4801-1-sergey.senozhatsky@gmail.com>
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

