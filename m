Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF0123F4A8A
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 14:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237127AbhHWMXq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 08:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237080AbhHWMXp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 08:23:45 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 480E2C061575
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 05:23:03 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id 2so1146805pfo.8
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 05:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ozl8o6JIg8rZEIGFMghcvZxUVf25DBS5z4hVHiIyzFo=;
        b=YEqgAIHXJ1ehLWPKaP6nzRWX+xKICssu6Psv/RPMpVgcWgEpDDBIciFE9IFstrnbfA
         5qiDR5MX0mnK8k4CtP0iQjzaWbjVEF4bh3Y3oz+5x/8o0UPm83P2ZlWSG5yfXGvOIYCC
         M3yybPI4Ubbb4hvIB8AMI7bU77num2vrse9Ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ozl8o6JIg8rZEIGFMghcvZxUVf25DBS5z4hVHiIyzFo=;
        b=bGMRBsMeSePHBryJ1FQZ5q1MMGSIP2w1Rm2chJ4RYTKl4Zs0FqAgA8o6sy3XCpmnM0
         AdCyz6AH3bSyjQb116sk53TcYrZBbz20/ee9ikUQDpSIgmZDhznz6vQSF/7pggxATaGR
         aB5xtC3iOwRI8s/odhjdYqtXKutOz+1VOhc7EWTlepNs8EqOCM8OYP5wU9mjVK4DRHOL
         y8IMq5GGApvWavBxtpySFIwEzHZFTgFty54g+uyqpsaKP+Ybn6Qvcb/+4vRm4htbqOz/
         Ke6xSoLfM0T2eInAnR2xV04rP2SZnihaB6ocpGVM+NrNgvKEFTkPIv2O+NbJQq4sODya
         NVQQ==
X-Gm-Message-State: AOAM533TbFAZXeAUdGzpw0Yf35Pr8Zgmt6q3F7nZuQvLqDU10y9ul0Dv
        2yQv557JCtiH/glKPneKsWdK3A==
X-Google-Smtp-Source: ABdhPJzhBFKfUgJf2U8BbB8XX6gxYDHEToUDDv3e+dfWFSki2sxpXjlCoXUt67DeM3DurCFVaBIzyw==
X-Received: by 2002:a63:dd46:: with SMTP id g6mr31821458pgj.347.1629721382912;
        Mon, 23 Aug 2021 05:23:02 -0700 (PDT)
Received: from senozhatsky.flets-east.jp ([2409:10:2e40:5100:8821:8b2f:2912:f9e4])
        by smtp.gmail.com with ESMTPSA id a15sm9035576pfn.219.2021.08.23.05.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 05:23:02 -0700 (PDT)
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
Subject: [PATCHv5 4/8] videobuf2: move cache_hints handling to allocators
Date:   Mon, 23 Aug 2021 21:22:31 +0900
Message-Id: <20210823122235.116189-5-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
In-Reply-To: <20210823122235.116189-1-senozhatsky@chromium.org>
References: <20210823122235.116189-1-senozhatsky@chromium.org>
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
2.33.0.rc2.250.ged5fa647cd-goog

