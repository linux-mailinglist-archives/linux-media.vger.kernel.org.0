Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82E033D6FE6
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 09:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235742AbhG0HFr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 03:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235735AbhG0HFq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 03:05:46 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91509C061760
        for <linux-media@vger.kernel.org>; Tue, 27 Jul 2021 00:05:45 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id a4-20020a17090aa504b0290176a0d2b67aso2819606pjq.2
        for <linux-media@vger.kernel.org>; Tue, 27 Jul 2021 00:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/pKNnVPAqe3m77IYg2BW7KYO05OH4I/d04wCbZzUH8Y=;
        b=deEc+YCPLUl1qYuzL/5yeGDCSkYw2uvX9PIDiTg14+7pzytPC3ssoeC7UVaEiFgusJ
         gQkRfNBoATxWa/EFFzus9u0tT5bzs794AnsqZzech2idTbiM4OP0Vt4fOBI3PQsd09pm
         ezvo79A/V5yY/402RZkg5MKme4x7GLmb/Qaeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/pKNnVPAqe3m77IYg2BW7KYO05OH4I/d04wCbZzUH8Y=;
        b=I0AccTNHVa6bTEGclGFI8Jve+x/qH3qgmR9klByGHA8Gs//nk5LiJIGhyn2uBwrmVt
         J4XUJxRGTblreNqWMivPLLZpd6fwFBirglGBxpbSKI1vage8EqTaaNF/s4n9ar0uoHga
         RLX29X/2UQRYePi1nBrwhOMX+Tyb1CHE0ZGl3XuGyr1W3F9uU80XmBop3Ggukpx+3AmL
         kVxFzjq6HWQA1+UXj9YNeuIN3+CqEJaFLIDa8AL1s55TOQIHw+gKZTPZ2sTa4ir6w8el
         TZWY2YNYJr81D9n7/HCH252oDuSjhE/QPxYFRTGyc2TXZO2DsfmFLfSx7Q04sX7A/tfd
         QR9Q==
X-Gm-Message-State: AOAM530JvRgu+PhVXMZWZNqhyj21V53hbjKisl0v79S7HyuOw5xrRPi9
        An7pBnN/AZSVvLZECYgV3lvYXw==
X-Google-Smtp-Source: ABdhPJwFsD+xCVJnOjF5KLgueGLdDuFkPVuJfLWK/3E/taVevFdXQw0E49cN0WFAybNSIB62yPmS1g==
X-Received: by 2002:a62:7bd1:0:b029:336:ea94:6650 with SMTP id w200-20020a627bd10000b0290336ea946650mr21269729pfc.48.1627369545163;
        Tue, 27 Jul 2021 00:05:45 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:ba3e:509b:495:ec84])
        by smtp.gmail.com with ESMTPSA id 30sm2343447pgq.31.2021.07.27.00.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 00:05:44 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 4/8] videobuf2: move cache_hints handling to allocators
Date:   Tue, 27 Jul 2021 16:05:13 +0900
Message-Id: <20210727070517.443167-5-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
In-Reply-To: <20210727070517.443167-1-senozhatsky@chromium.org>
References: <20210727070517.443167-1-senozhatsky@chromium.org>
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
2.32.0.432.gabb21c7263-goog

