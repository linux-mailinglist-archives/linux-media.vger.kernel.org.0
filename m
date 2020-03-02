Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93D89175290
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 05:13:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbgCBEN0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Mar 2020 23:13:26 -0500
Received: from mail-pf1-f173.google.com ([209.85.210.173]:44777 "EHLO
        mail-pf1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727194AbgCBENZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Mar 2020 23:13:25 -0500
Received: by mail-pf1-f173.google.com with SMTP id y5so4882997pfb.11
        for <linux-media@vger.kernel.org>; Sun, 01 Mar 2020 20:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CxsIIu+/8DSr9yF0CIvvdp+l+R1SqYNd7xvzR+EPPKE=;
        b=NfkXxwE0BJXx6VznfLq3+TLrkcYj+Bd8JMt7XwZ/gLY6AnA12lM4KgasNRpqCaHJ/3
         WZDZRB0oBnZGfd9KLE+ZF4S+mVBeMuImh9aIpm+02SemxBUTOmOHkPwlK0TxSw87erKC
         EHpO7rLpaKKo5/AgmsafdCRkBQkS3yWp37CsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CxsIIu+/8DSr9yF0CIvvdp+l+R1SqYNd7xvzR+EPPKE=;
        b=jVEf2cE1Q9dzK9nWT0cgIOv2PXlH/7MP25WEwhCDP2uAchJvRxdWQIrwmNbniRIBt+
         LlkbVodQs9B4Gz9RBUAFTY2lF1mb4xCh6WBmYFXSgxMYOd/8mgZVbwhw44WLllREBuVH
         VIyi53lHLh6xfVobQW/chqV+Bbb1F3ZkVRDJ7d7N9xthNhou47bWwhP4TOO+lWd9YO+R
         0CqxkXEbM78aDp5jVYOqdwc27Lc66+OpV5L1c0v5jHuiH5I+tDB2b2pko5ptsQwaPEjj
         I4DJNpnje8oFwReT4+ny9Cg/Y4EsLic6oTzvpeAceeOu7Xqe30F3s4/xqTqC9eLVQkUc
         w1OA==
X-Gm-Message-State: APjAAAWnV6yhmvjaLV3Ul+6zEWhWascXx5/PRDY3ufsZVFvE4ZTvS6WH
        kpD5FMKnuHWidwmtPFs+dzkQyAaxOfE=
X-Google-Smtp-Source: APXvYqy2P0RLXAO/iaD6PSxmAoR9E0Ta7ZhsYA/73Gha5XVmyVbImRUyF/AYogQA0cr6jsaCacRF1A==
X-Received: by 2002:aa7:9789:: with SMTP id o9mr14416433pfp.138.1583122404529;
        Sun, 01 Mar 2020 20:13:24 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id d82sm1698114pfd.187.2020.03.01.20.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2020 20:13:24 -0800 (PST)
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
Subject: [PATCHv4 11/11] videobuf2: don't test db_attach in dma-contig prepare and finish
Date:   Mon,  2 Mar 2020 13:12:13 +0900
Message-Id: <20200302041213.27662-12-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200302041213.27662-1-senozhatsky@chromium.org>
References: <20200302041213.27662-1-senozhatsky@chromium.org>
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

