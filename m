Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBF315146A
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2020 03:57:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbgBDC5g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 21:57:36 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33574 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727399AbgBDC5d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Feb 2020 21:57:33 -0500
Received: by mail-pf1-f194.google.com with SMTP id n7so8691097pfn.0
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2020 18:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T/+Rlp1jPgPXZXDmW6x1Q8uODIAHg+YuyNKI1rs3+AQ=;
        b=EmXtHEzCTNUp3JHhN5KhU5HPB15eaWUPG0ltTwgDk3DdzSA1PfYHzVTn+DARhxhgo3
         nLvjBLEeGYMn+Hort7T3uc1tofVXrSkMNya6eRirfPIj/Xws052UlgRc+wOaGRCpqAJT
         9DM7TnFZsdY71blpcWhOSwZx/fpuJxEyQEWeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T/+Rlp1jPgPXZXDmW6x1Q8uODIAHg+YuyNKI1rs3+AQ=;
        b=OZLlO1raJinDjz4+pgkgEAOAuYgfzyCFf2bFQChp45XGo22eeeS17tk2Nd4sQ3JhRX
         ju3EhGQKgJIbOg9XNBQBLGAxGEaimSgiqC44x7UiY1vZyJf/ycKoccu9euQgS36nwYlt
         OuuOS/5h1SDkFz0iwf30F1DOa/HDjdy8b+Unrkc+Yb+Txrn10OVvW/wouW4wWoglIVbt
         dRECfiEcu6mcZ8lOjrOV6pXRPBGv/52KjMJZqbmBhVov5mwK+zQfZo1UbBsvFe1x/mmX
         0QP+743En2tELga1CiIrI3J52AGMwrayZ4eyoEMZ/BcA1BZK/i2t/O8D/J4m5uaY4may
         +kDQ==
X-Gm-Message-State: APjAAAVIrzNbPwzzvUf5OEm5JbHxlXcXgBxukKV2kRKCi1JUlmLOKPvO
        OW6YXUtccm0qlP8a3BvHc8LaHA==
X-Google-Smtp-Source: APXvYqzwUzAu92hNw9mJr15XxdwgDVAgES5XWUbnXAprF2iwJ17UqkCKPZnhqvly83TDtJ8RTtz32w==
X-Received: by 2002:a62:7a8a:: with SMTP id v132mr29363613pfc.111.1580785051956;
        Mon, 03 Feb 2020 18:57:31 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:5bbb:c872:f2b1:f53b])
        by smtp.gmail.com with ESMTPSA id e1sm22491971pfl.98.2020.02.03.18.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 18:57:31 -0800 (PST)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [RFC][PATCHv2 12/12] videobuf2: don't test db_attach in dma-contig prepare and finish
Date:   Tue,  4 Feb 2020 11:56:41 +0900
Message-Id: <20200204025641.218376-13-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200204025641.218376-1-senozhatsky@chromium.org>
References: <20200204025641.218376-1-senozhatsky@chromium.org>
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

Change-Id: I8f6c0b246ccb63f775dcf7881dd5f848c38e7604
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
index bfc99a0cb7b9..1fd25eda0bf2 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -198,10 +198,6 @@ static void vb2_dma_sg_prepare(void *buf_priv)
 	struct vb2_dma_sg_buf *buf = buf_priv;
 	struct sg_table *sgt = buf->dma_sgt;
 
-	/* DMABUF exporter will flush the cache for us */
-	if (buf->db_attach)
-		return;
-
 	dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->orig_nents,
 			       buf->dma_dir);
 }
@@ -211,10 +207,6 @@ static void vb2_dma_sg_finish(void *buf_priv)
 	struct vb2_dma_sg_buf *buf = buf_priv;
 	struct sg_table *sgt = buf->dma_sgt;
 
-	/* DMABUF exporter will flush the cache for us */
-	if (buf->db_attach)
-		return;
-
 	dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->orig_nents, buf->dma_dir);
 }
 
-- 
2.25.0.341.g760bfbb309-goog

