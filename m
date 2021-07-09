Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55DE23C2168
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 11:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbhGIJXb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 05:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231942AbhGIJX3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 05:23:29 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C58C0613DD
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 02:20:45 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id y4so6873946pgl.10
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 02:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QLXUZBRHh2cvMbVsyzoUjwR/QxweXhkqlwCKs767ZuA=;
        b=js0xHWoF97L/2sMxV8sH5OTjPoMS6Hogtgujs6t52Y6QDZmbvFlwq/TBHT64s/s6P9
         stT6TGDasjOdS3pKQ9NpTbPFVVnRUaeJCj1BrPgYO+xisdiNhfIyKs0q/6BGThVPOEls
         Tf43k6KJ7Z22ToTrbdgpxxCxPEV2qgl96OsFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QLXUZBRHh2cvMbVsyzoUjwR/QxweXhkqlwCKs767ZuA=;
        b=H4l/ArW4gZca2W/PEG4UDBBhkkHCvdeNQvDmpSu3XdUI7CtFdUn9+nmtpdBZwrSw28
         /33piEx8ZdtNEoG4M/pdjHojKiv/sXtg9L1Gr+JzA0DYleAaqupAeUFfpapUR4HS6pqA
         obShxMJnvfEAS8SHxVFfesNK/S1t4Ul4YcbNbrZdmGDlg2LF8Mb45F30J4ywx2PPtLpR
         qtpvUMQoWxBfxO6IVks8yjOaReFZitqPRVcgrM2wTKT0xceRGzfXVoaMKqbbBdLByao8
         6edr3xWRF/PfG2jJNfnhrQ66tsnWCSvXOeYx4qkpvs7gYjtQrrtZjmwEmAU/wigiG4qg
         CCqw==
X-Gm-Message-State: AOAM53171/ps2NERL7wSJYDDdT8ow/FNOoVOYBKFEzdWmwyKg9gSW+/t
        uBZGKfhR8q+lkXeJbov+jDzOTA==
X-Google-Smtp-Source: ABdhPJyqHZLnczOIQCpUFHKZIk6Tp7bXLKpqnFKgfWOQufFeOBHA56pX/Wf0Nq7sf/qwbLBKJApk3w==
X-Received: by 2002:a63:1a4f:: with SMTP id a15mr36607390pgm.313.1625822445092;
        Fri, 09 Jul 2021 02:20:45 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:a30d:fc4:7834:ee08])
        by smtp.gmail.com with ESMTPSA id e24sm5496539pfn.127.2021.07.09.02.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 02:20:44 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 4/8] videobuf2: move cache_hints handling to allocators
Date:   Fri,  9 Jul 2021 18:20:23 +0900
Message-Id: <20210709092027.1050834-5-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210709092027.1050834-1-senozhatsky@chromium.org>
References: <20210709092027.1050834-1-senozhatsky@chromium.org>
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
index 50265080cfc8..33ee63a99139 100644
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
2.32.0.93.g670b81a890-goog

