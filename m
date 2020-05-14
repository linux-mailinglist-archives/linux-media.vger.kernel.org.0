Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E640D1D35E7
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 18:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbgENQDE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 12:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgENQDD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 12:03:03 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C98BC061A0C;
        Thu, 14 May 2020 09:03:03 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id g11so1336354plp.1;
        Thu, 14 May 2020 09:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+rsYbWWzoE0lVJTAtJ90p8tOUmwZIRJ0zy7fKEnpH4c=;
        b=JJgTIpa177G1g0t2/Mq1+zCRWT3dT37LodLd6/zM4GFuX6pTfFPVPtBDD+yF+0ALE7
         dQxBugaoZ4Yc2Pd70QxPBt0ZRtdT74syniIbcU/7bcE63Uu/nEc/iiYVtLhk82A1ZVGp
         gbcL7TiWO6L0e29O68eJxMzcJx+kSMyXkkB3/PIXs8hSpLVd9HmiCeT6HFB7813rILVY
         uY1/cs8w4t1IOOFKsEAbb2meO7vWxn9PLXnBFWMffGleCfCbXkuskC7cfTYbAGxd6jnF
         tM+jJqrJRBajXFFR/LgaX5ULbCl8tBqUi4h0jMDmMCv1rWxPy0+xelcTsKuDauiFYDxt
         fYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+rsYbWWzoE0lVJTAtJ90p8tOUmwZIRJ0zy7fKEnpH4c=;
        b=knmmsgJwF7MNf1s1OvDAqa0JxJWf88YezkTBCx/sgY8kN1f+rOJfvKepjU0exjNfLn
         ek51rAhLxsMgJk0U3tPCIKbxbyTkP2so7fQTVJiehujgoqnUJjpSbZGbhNnDpwDeh7+k
         obNV+sYPGxSQeppiu1ypwN+sF5jGDnCkFlMxFzYP7F05B2kX38lm80XU2IhGmBlAlnkU
         9qbeCh9hNY6/lvlhrHsB87AevTDrE9BoCbwfzuWZ6nuwGIDZ99txP3ETbktzPFxkXEFk
         ZsXMVanuwt0z1Sw+jAoue8RmSLdVteN8f1zfHeZPTHZeQpLS4NGrlbsYY0zuwuftl7zO
         A5ow==
X-Gm-Message-State: AGi0PuagHjPVNF9SriXhY/A2IWvcuTPppXgDl6bG0S/wGLyi8Cg8rlya
        q8vEB1LndX9xMJTRc0wXmPQ=
X-Google-Smtp-Source: APiQypIdGN05I3fIGd1VSS2ERkqZM4A/HXsk1rzePBoHHvXonMX/GsFAVkm7EYF3JLyGqyplReEB8Q==
X-Received: by 2002:a17:90a:7349:: with SMTP id j9mr42272939pjs.196.1589472182286;
        Thu, 14 May 2020 09:03:02 -0700 (PDT)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id y6sm18178691pjw.15.2020.05.14.09.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 09:03:01 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v6 10/14] videobuf2: add begin/end cpu_access callbacks to dma-contig
Date:   Fri, 15 May 2020 01:01:49 +0900
Message-Id: <20200514160153.3646-11-sergey.senozhatsky@gmail.com>
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

