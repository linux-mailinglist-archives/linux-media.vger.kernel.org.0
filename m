Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9019332A849
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1574070AbhCBR30 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:29:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377617AbhCBAsC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 19:48:02 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EF83C0617A9
        for <linux-media@vger.kernel.org>; Mon,  1 Mar 2021 16:46:53 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id p5so11004587plo.4
        for <linux-media@vger.kernel.org>; Mon, 01 Mar 2021 16:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tPtwr2neP+OiOmpPux1oreakjuSKI9yoO0qXcal+M7U=;
        b=oJYLXEKlpHuykh16FGJ0isIxqEQ9faa+G2FRhv2+ZPgz6zjbLZkJSOicl5fi+6UybM
         b7XOEZLtzzQtmUKXgkAR4CBj2D78lE/rBky2CjF4vYolXZfipdZF10VYWMjvy93myFpv
         JUTo+kXZcF0gpoyNdnsC9YAvl2qTFj1hWs0L8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tPtwr2neP+OiOmpPux1oreakjuSKI9yoO0qXcal+M7U=;
        b=c5BraxVg41DjMQi/EmGslKN7Zi1fM2hM4XVwfxdp6TZnYFW1G2OKTlx/RybOVHL0jE
         cfRBAVpqdqcAt6AFxbtPyb/PG9zoQaBZ4n16C8WJgKIMgDUWjFPMaakWvmhiMIMcsjFU
         FmDu5Kif1Ncq8el9hOT8Wx0xtuiwsWZbz4hKwgZu7wgYCJ1tVsWnGzQDUg7kyU8bfrbY
         7H8MJx5D9sE0DuDB5+AjapycYC+7E2kuKsmORphZP5WfNeoMK/wy0hQPQ1Q3PrQgXdI+
         R9eTkPgGdrCx48KX0VbfREPnGe3va+RzowPwCeqlAsELZ2I49SEwofOHjPA1rphZuFws
         6hlw==
X-Gm-Message-State: AOAM530nwBJS6tq56SBs5JVNRHUo0vJNqyS9wIC8vjV660aIO50P3VG2
        ODmjHXaW6qS0QNcVDRTI0TzYf9DFPyB3SQ==
X-Google-Smtp-Source: ABdhPJxIHKHMMlq80AT0vJXpomE75BBtsQSI88IG5KPGZAZMZIWmmG499WrhipNQtsiwGRRoZR+MYQ==
X-Received: by 2002:a17:90b:253:: with SMTP id fz19mr1575692pjb.160.1614646012219;
        Mon, 01 Mar 2021 16:46:52 -0800 (PST)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:d5d7:1a61:2cdf:273c])
        by smtp.gmail.com with ESMTPSA id b14sm678881pji.14.2021.03.01.16.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 16:46:51 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 4/8] videobuf2: move cache_hints handling to allocators
Date:   Tue,  2 Mar 2021 09:46:20 +0900
Message-Id: <20210302004624.31294-5-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210302004624.31294-1-senozhatsky@chromium.org>
References: <20210302004624.31294-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This moves cache hints handling from videobuf2 core down
to allocators level, because allocators do the sync/flush
caches eventually and may take better decisions. Besides,
allocators already decide whether cache sync/flush should
be done or can be skipped. This patch moves the scattered
buffer cache sync logic to one common place.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-core.c       | 6 ------
 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 6 ++++++
 drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 6 ++++++
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 76210c006958..55af63d54f23 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -328,9 +328,6 @@ static void __vb2_buf_mem_prepare(struct vb2_buffer *vb)
 		return;
 
 	vb->synced = 1;
-	if (vb->skip_cache_sync_on_prepare)
-		return;
-
 	for (plane = 0; plane < vb->num_planes; ++plane)
 		call_void_memop(vb, prepare, vb->planes[plane].mem_priv);
 }
@@ -347,9 +344,6 @@ static void __vb2_buf_mem_finish(struct vb2_buffer *vb)
 		return;
 
 	vb->synced = 0;
-	if (vb->skip_cache_sync_on_finish)
-		return;
-
 	for (plane = 0; plane < vb->num_planes; ++plane)
 		call_void_memop(vb, finish, vb->planes[plane].mem_priv);
 }
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 019c3843dc6d..1e218bc440c6 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -101,6 +101,9 @@ static void vb2_dc_prepare(void *buf_priv)
 	struct vb2_dc_buf *buf = buf_priv;
 	struct sg_table *sgt = buf->dma_sgt;
 
+	if (buf->vb->skip_cache_sync_on_prepare)
+		return;
+
 	if (!sgt)
 		return;
 
@@ -112,6 +115,9 @@ static void vb2_dc_finish(void *buf_priv)
 	struct vb2_dc_buf *buf = buf_priv;
 	struct sg_table *sgt = buf->dma_sgt;
 
+	if (buf->vb->skip_cache_sync_on_finish)
+		return;
+
 	if (!sgt)
 		return;
 
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index 71094cb5c5d7..cb587c5a345b 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -204,6 +204,9 @@ static void vb2_dma_sg_prepare(void *buf_priv)
 	struct vb2_dma_sg_buf *buf = buf_priv;
 	struct sg_table *sgt = buf->dma_sgt;
 
+	if (buf->vb->skip_cache_sync_on_prepare)
+		return;
+
 	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
 }
 
@@ -212,6 +215,9 @@ static void vb2_dma_sg_finish(void *buf_priv)
 	struct vb2_dma_sg_buf *buf = buf_priv;
 	struct sg_table *sgt = buf->dma_sgt;
 
+	if (buf->vb->skip_cache_sync_on_finish)
+		return;
+
 	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
 }
 
-- 
2.30.1.766.gb4fecdf3b7-goog

