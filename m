Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6A016FD2B
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 12:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbgBZLQa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 06:16:30 -0500
Received: from mail-pf1-f180.google.com ([209.85.210.180]:42295 "EHLO
        mail-pf1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728370AbgBZLQ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 06:16:29 -0500
Received: by mail-pf1-f180.google.com with SMTP id 4so1292809pfz.9
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2020 03:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CxsIIu+/8DSr9yF0CIvvdp+l+R1SqYNd7xvzR+EPPKE=;
        b=drOYBsxYOXn2Xeb56l6caTledM7axnNRIci8lv/j5g0baIJWB2DvjJbjzDaydlaz2L
         8PMa4wUDNdoQrnRBx6edGr6JU/YzLzA7uRqCV24MS4D09M+Fp7JXOB1OalwDH0Scu9Zh
         3Le4Sjj4Akni+tjxM0v6nRkRPGUUYyP90oACM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CxsIIu+/8DSr9yF0CIvvdp+l+R1SqYNd7xvzR+EPPKE=;
        b=YaBwoiLkckwhrILHGj9U6lE+9Xh9RslIys6Hkb5OkpyDdqoHnighq5ig6y7mGeMI3E
         2Ck/P+XFcnL/1Y8F5iwNSZ8KEbOE2/RTvRauN/RxkvB1Qjl/6X9CZG4hj5CX6OjNsHSb
         p9o6WA7+h8emzNKga+fmUbKizjePTIPRtJmQTi+sGv1j0i2++xlKs+uoUn8MneCT1BG4
         liIddUHrOccLQCeelXs9wr0WpyGPARXnGZnBPoPkFFFonSfQ19g83wo8VHFm9uDv4U66
         34jqGwtcAkNagZlqZ2tZp+PzxhQxMq0nKn94Usm4qk9YUXejoKFIM3pJIszYwvGpqFx/
         vEdQ==
X-Gm-Message-State: APjAAAV1FTpX6K8PraMYeb0Gzp4nzNFtz0BfoYva9b2OrvQjqPFvG8vS
        rgNBAhh1mMWDvwWIT7MzA+yR0A==
X-Google-Smtp-Source: APXvYqw7geSaJHKQXNxHd+nJsVEm3hH3f9VMmmCHh3bRl9MgtjuMWJBqY01Dt28pW7thPsYChjxijA==
X-Received: by 2002:a62:25c6:: with SMTP id l189mr3901463pfl.136.1582715788057;
        Wed, 26 Feb 2020 03:16:28 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id o22sm2429993pgj.58.2020.02.26.03.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 03:16:27 -0800 (PST)
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
Subject: [PATCHv3 11/11] videobuf2: don't test db_attach in dma-contig prepare and finish
Date:   Wed, 26 Feb 2020 20:15:29 +0900
Message-Id: <20200226111529.180197-12-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200226111529.180197-1-senozhatsky@chromium.org>
References: <20200226111529.180197-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We moved cache management decision making to the upper layer and
rely on buffer's need_cache_sync flags and videobuf2 core. If the
upper layer (core) has decided to invoke ->prepare() or ->finish()
then we must sync.

For DMABUF ->need_cache_sync_on_prepare and ->need_cache_sync_on_flush
are always false so videobuf core does not call ->prepare() and
->finish() on such buffers.

Additionally, scratch the DMABUF comment.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 6 ++----
 drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 8 --------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index a387260fb321..6ea0961149d7 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -100,8 +100,7 @@ static void vb2_dc_prepare(void *buf_priv)
 	struct vb2_dc_buf *buf = buf_priv;
 	struct sg_table *sgt = buf->dma_sgt;
 
-	/* DMABUF exporter will flush the cache for us */
-	if (!sgt || buf->db_attach)
+	if (!sgt)
 		return;
 
 	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->orig_nents,
@@ -113,8 +112,7 @@ static void vb2_dc_finish(void *buf_priv)
 	struct vb2_dc_buf *buf = buf_priv;
 	struct sg_table *sgt = buf->dma_sgt;
 
-	/* DMABUF exporter will flush the cache for us */
-	if (!sgt || buf->db_attach)
+	if (!sgt)
 		return;
 
 	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->orig_nents, buf->dma_dir);
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index ddc67c9aaedb..2a01bc567321 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -204,10 +204,6 @@ static void vb2_dma_sg_prepare(void *buf_priv)
 	struct vb2_dma_sg_buf *buf = buf_priv;
 	struct sg_table *sgt = buf->dma_sgt;
 
-	/* DMABUF exporter will flush the cache for us */
-	if (buf->db_attach)
-		return;
-
 	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->orig_nents,
 			       buf->dma_dir);
 }
@@ -217,10 +213,6 @@ static void vb2_dma_sg_finish(void *buf_priv)
 	struct vb2_dma_sg_buf *buf = buf_priv;
 	struct sg_table *sgt = buf->dma_sgt;
 
-	/* DMABUF exporter will flush the cache for us */
-	if (buf->db_attach)
-		return;
-
 	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->orig_nents, buf->dma_dir);
 }
 
-- 
2.25.0.265.gbab2e86ba0-goog

