Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4C4A1B70EE
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 11:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbgDXJbY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 05:31:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726523AbgDXJbX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 05:31:23 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB07AC09B045;
        Fri, 24 Apr 2020 02:31:21 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id y6so3685173pjc.4;
        Fri, 24 Apr 2020 02:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+rsYbWWzoE0lVJTAtJ90p8tOUmwZIRJ0zy7fKEnpH4c=;
        b=b36VpCzV7zti4L8z9p4NJt/YfJChnE42aDZFhVYDX4Ysh0fulcs8UGIkiwGWLYuEEf
         dQQDeBMcoPSsO/s4CqMt++DRIxpMZF5n5vQvrl83F4N+7Q1FErqOSY6d4NKuOCCQFW/H
         YmacrQ/0T1Qn5tx1SmHHLne+B3eWRhNdQ2ehD7VyXjgNngu83vQy5AZA8MTmB4DhLCKM
         W9j5tCP8E6xsOjV2cEdTk24REYkiBWhKTqLtQ9YLYMbo7SpFFfUFxedsSh+0DA98ENKL
         m3u09CKUtlTYuJrp05n//2mBrRgpBb5tjGn1pGk8CYi8rcdahC6MCyjmZcA9Tmo3GllQ
         N1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+rsYbWWzoE0lVJTAtJ90p8tOUmwZIRJ0zy7fKEnpH4c=;
        b=Hs0KT+ESu6fXgKB5XeSlZwFgEk7I6RJ4MKZqeLgkZecpZr+rvdUnMfG+qSAFu/elNC
         eM5krbaEhwIZcJROMyqETxbxRHxV/iuX4YZQQpmbXtL7dbVrIQ0E/Fz9C8hAmLb3Y00k
         lM1cJ9UjHtavr4M8cEIdIadPvmT0axKqznZKFHNJMyDLIJOnbbpeJmzmXylT4nKMpWuJ
         46oA0jG9h/Q5qOmyJfJAptK7PJZl+ryoYn6LNSo5aUdRGRgjkRNAgbHEjnUbtz9Gh9i/
         /gSFsn+yFfcd8Dh57e5wFvHJTWB7+NDHJClQrr1wmjgKKq8ai5inlSVwLxGCO2z9oxLc
         wSWw==
X-Gm-Message-State: AGi0PubAo/4hG/tSmdz+NySPgGi8X2lHVvIMe4RyuPm27vE40Qsot12m
        OoxTYL7BqXtWETP71q+sGJY=
X-Google-Smtp-Source: APiQypJp7ndABcDIcAJcH/x3UIeGvoQUWaE7aoN/rWhfc8p42rvhjgMLDfX1vf1A2j1n+lDtxAPu+A==
X-Received: by 2002:a17:90a:30a5:: with SMTP id h34mr5050464pjb.171.1587720681431;
        Fri, 24 Apr 2020 02:31:21 -0700 (PDT)
Received: from localhost.localdomain (146.85.30.125.dy.iij4u.or.jp. [125.30.85.146])
        by smtp.gmail.com with ESMTPSA id 185sm5541315pfv.9.2020.04.24.02.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 02:31:20 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv5 10/13] videobuf2: add begin/end cpu_access callbacks to dma-contig
Date:   Fri, 24 Apr 2020 18:29:17 +0900
Message-Id: <20200424092920.4801-11-sergey.senozhatsky@gmail.com>
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

Provide begin_cpu_access() and end_cpu_access() callbacks for
cache synchronisation on exported buffers.

The patch also adds a new helper function - vb2_dc_buffer_consistent(),
which returns true is if the buffer is consistent (DMA_ATTR_NON_CONSISTENT
bit cleared), so then we don't need to sync anything.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 .../common/videobuf2/videobuf2-dma-contig.c   | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index d3a3ee5b597b..6787e2cb905e 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -42,6 +42,11 @@ struct vb2_dc_buf {
 	struct dma_buf_attachment	*db_attach;
 };
 
+static inline bool vb2_dc_buffer_consistent(unsigned long attr)
+{
+	return !(attr & DMA_ATTR_NON_CONSISTENT);
+}
+
 /*********************************************/
 /*        scatterlist table functions        */
 /*********************************************/
@@ -335,6 +340,34 @@ static void vb2_dc_dmabuf_ops_release(struct dma_buf *dbuf)
 	vb2_dc_put(dbuf->priv);
 }
 
+static int
+vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
+				   enum dma_data_direction direction)
+{
+	struct vb2_dc_buf *buf = dbuf->priv;
+	struct sg_table *sgt = buf->dma_sgt;
+
+	if (vb2_dc_buffer_consistent(buf->attrs))
+		return 0;
+
+	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
+	return 0;
+}
+
+static int
+vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
+				 enum dma_data_direction direction)
+{
+	struct vb2_dc_buf *buf = dbuf->priv;
+	struct sg_table *sgt = buf->dma_sgt;
+
+	if (vb2_dc_buffer_consistent(buf->attrs))
+		return 0;
+
+	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir);
+	return 0;
+}
+
 static void *vb2_dc_dmabuf_ops_vmap(struct dma_buf *dbuf)
 {
 	struct vb2_dc_buf *buf = dbuf->priv;
@@ -353,6 +386,8 @@ static const struct dma_buf_ops vb2_dc_dmabuf_ops = {
 	.detach = vb2_dc_dmabuf_ops_detach,
 	.map_dma_buf = vb2_dc_dmabuf_ops_map,
 	.unmap_dma_buf = vb2_dc_dmabuf_ops_unmap,
+	.begin_cpu_access = vb2_dc_dmabuf_ops_begin_cpu_access,
+	.end_cpu_access = vb2_dc_dmabuf_ops_end_cpu_access,
 	.vmap = vb2_dc_dmabuf_ops_vmap,
 	.mmap = vb2_dc_dmabuf_ops_mmap,
 	.release = vb2_dc_dmabuf_ops_release,
-- 
2.26.2

