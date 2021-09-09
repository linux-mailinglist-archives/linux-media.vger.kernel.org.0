Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A929B40493C
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 13:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235739AbhIIL0D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Sep 2021 07:26:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235738AbhIIL0A (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Sep 2021 07:26:00 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4ABBC061757
        for <linux-media@vger.kernel.org>; Thu,  9 Sep 2021 04:24:50 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so1199108pjc.3
        for <linux-media@vger.kernel.org>; Thu, 09 Sep 2021 04:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XfTVnM+Kdt1HMBYOgi0OID403DvPUnw+Oe4D7AokcIc=;
        b=TXa6Dh43j/RiJZcZfGp/U/VMI+kPFpebUW9dJNRgCKOI8Rkz3AqIXHDOcLjE4jOHZU
         zsG5+VjKHQpcIow4nejBjuuyDQJKo7pC/ClLLcCpI3wvY4p3IBlEGV4ZyHCVgkyj965P
         BhrhuBZoTAhWscYuMsZE2jSZSbL/geboBEpxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XfTVnM+Kdt1HMBYOgi0OID403DvPUnw+Oe4D7AokcIc=;
        b=jEexwMLfw3uXqtRvAnupUSh/AwEOzI3HGGncirzmJE+Q57Dgr4l7e1jJpQBcy35Nv/
         AUrgmxJErNUQLaBanj7e4EE+awvxsN/QxxZNQt4XCyiGhHpvbYhIzKw3sNBjuia0Wmb7
         vUpYPAaVtFKMDW0QI6ps/1CR2CfJhS3doDu6wNor+1IoiMx5hqAlfAkP9npB2r/OYpPm
         Ee6Ia7sU0iVutwMuMj7COlvchb0Uxoxcrn6RXkNujiWf/uqdOKRovEbFsVOEaMaksI7n
         H9yItSwfeyBzdNW9FxwyTOxQ6VhgS8cjvZXxOOJNRUiM7KUsOawAp3E6MnopBR1e74W+
         U/CQ==
X-Gm-Message-State: AOAM532+dJ5QEWEShU8bmA3dHIQwhaXhWZ8L4odCm0HIqKYiu1nYo/HJ
        nXAZtzA7DtTmC/pnTEQmBt7mTw==
X-Google-Smtp-Source: ABdhPJyYcIxqMXzbTTXZ+BGYIqnO0OtUvhfEBnjB2NdtsZQsyV5eTybm60VfLtu7rj7YAHjskwgpXQ==
X-Received: by 2002:a17:902:9008:b0:12d:8258:e07c with SMTP id a8-20020a170902900800b0012d8258e07cmr2304758plp.42.1631186690246;
        Thu, 09 Sep 2021 04:24:50 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:166b:dcfc:dcf2:bbe2])
        by smtp.gmail.com with ESMTPSA id 141sm2046860pgg.16.2021.09.09.04.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 04:24:49 -0700 (PDT)
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
Subject: [PATCHv6 4/8] videobuf2: move cache_hints handling to allocators
Date:   Thu,  9 Sep 2021 20:24:26 +0900
Message-Id: <20210909112430.61243-5-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
In-Reply-To: <20210909112430.61243-1-senozhatsky@chromium.org>
References: <20210909112430.61243-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This moves cache hints handling from the videobuf2 core down
to the allocator's level, because allocators do the sync/flush
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
index 59bd781c9a34..8fa9f92ed028 100644
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
2.33.0.153.gba50c8fa24-goog

