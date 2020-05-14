Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 451FE1D35EA
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 18:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728163AbgENQDM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 12:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgENQDM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 12:03:12 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43AE6C061A0C;
        Thu, 14 May 2020 09:03:12 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id k19so1320118pll.9;
        Thu, 14 May 2020 09:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PKtrJsIKIcsIj8dnmTqgxVou7+4jAhZAHReCNI0jtao=;
        b=gwQOAWBjWWnG2AqH5DTjNJpsC6zUy3MFzX7R/HV+gqZ9Mw6EKB0u6NVJpejG2oE4Jl
         AJ4JPtAdTbIpeXZweRWqujYuIzYPVuqgwyQQxpqg3LNZZ171mZ8MF6Gx2SxPW+QPP2YS
         dd/g3geG39A1JSj7LvHDyNzdY2/d2pOIa0GqCbnYAJk2/ueKmllM1gNUDr0fkIkpYq5A
         RKqRoXX4XxWMjXCZ4FX/mTpNMdm+FmxO+Qz4gbQC+WlQqh+Nd0TGgS9WYVXXbWAePP85
         /nJt3ACtsBic2NPoodwQK8m7WhzOf3RAls4vUtEumomGpjt3xJjmHQSuxfhR0UNEZGD5
         T5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PKtrJsIKIcsIj8dnmTqgxVou7+4jAhZAHReCNI0jtao=;
        b=A1CdOF4v1PayP/Vis+ROAVKv9BrXy+zV1Tb+ZBlen2p/7Y7tCcmNAToLZRNit0noTl
         fOzK6C8wd83ffuDVF8rIfDnACozOOTHyjcmkgBjyLisXjOqT0xpUFGZzSmeE5kQIHmbf
         h6Yvk3udgLP2a2NlB2KQqEp+fqX8J1lXA7uS9wyfE30bKFn0sUhX3oeA7QG4R92zmXrc
         bDtZ0HsZkE1nMoY4c1bPoOHoka4NrUbFK4TlWsm3G/y346dslbx3HgnElcluZeejGn/P
         YGeRtPHodLpTk/DndLdviAO4/JYGAOv0cZ2MlA/aayFKZhnTgzoUcsDvdsBL5SnJat4U
         BT3A==
X-Gm-Message-State: AGi0PuaEpembtH+OfrM4E/WfCdToKynHkBRj32Pw+wdr7A7T4Zc0xc6y
        MmMmjBkTCQV3MVIQMT0qUWs=
X-Google-Smtp-Source: APiQypKtjDTYx4RCQAAj+mPgWBCzKNKzVXPOLmvMs9pUol75XZj27dlRosSZjo7iYkZI2ClGqel5bg==
X-Received: by 2002:a17:90b:234e:: with SMTP id ms14mr41042651pjb.212.1589472191667;
        Thu, 14 May 2020 09:03:11 -0700 (PDT)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id y6sm18178691pjw.15.2020.05.14.09.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 09:03:11 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v6 12/14] videobuf2: don't test db_attach in dma-contig prepare and finish
Date:   Fri, 15 May 2020 01:01:51 +0900
Message-Id: <20200514160153.3646-13-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
References: <20200514160153.3646-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sergey Senozhatsky <senozhatsky@chromium.org>

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
index 6787e2cb905e..5a3e1c3b556f 100644
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
index 595137e358e7..0a40e00f0d7e 100644
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
2.26.2

