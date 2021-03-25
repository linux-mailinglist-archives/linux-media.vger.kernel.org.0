Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2223485CA
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 01:19:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239193AbhCYASw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 20:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239163AbhCYASf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 20:18:35 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C029CC06174A;
        Wed, 24 Mar 2021 17:18:34 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 93A621F45EF9
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, kernel@collabora.com,
        linux-kernel@vger.kernel.org, jc@kynesim.co.uk,
        laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.org,
        tfiga@chromium.org, Helen Koike <helen.koike@collabora.com>
Subject: [PATCH 2/2] media: videobuf2: cleanup size argument from attach_dmabuf()
Date:   Wed, 24 Mar 2021 21:17:12 -0300
Message-Id: <20210325001712.197837-2-helen.koike@collabora.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210325001712.197837-1-helen.koike@collabora.com>
References: <20210325001712.197837-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since we always use the size of the underlying buffer for dmabuf, remove
the size parameter from the attach_dmabuf() callback.

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/media/common/videobuf2/videobuf2-core.c       | 2 +-
 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 7 ++-----
 drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 7 ++-----
 drivers/media/common/videobuf2/videobuf2-vmalloc.c    | 7 ++-----
 include/media/videobuf2-core.h                        | 1 -
 5 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 2cbde14af051..86af4f3c72eb 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1266,7 +1266,7 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 		/* Acquire each plane's memory */
 		mem_priv = call_ptr_memop(vb, attach_dmabuf,
 				q->alloc_devs[plane] ? : q->dev,
-				dbuf, planes[plane].length, q->dma_dir);
+				dbuf, q->dma_dir);
 		if (IS_ERR(mem_priv)) {
 			dprintk(q, 1, "failed to attach dmabuf\n");
 			ret = PTR_ERR(mem_priv);
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index a7f61ba85440..a26aa52f954b 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -661,14 +661,11 @@ static void vb2_dc_detach_dmabuf(void *mem_priv)
 }
 
 static void *vb2_dc_attach_dmabuf(struct device *dev, struct dma_buf *dbuf,
-	unsigned long size, enum dma_data_direction dma_dir)
+				  enum dma_data_direction dma_dir)
 {
 	struct vb2_dc_buf *buf;
 	struct dma_buf_attachment *dba;
 
-	if (dbuf->size < size)
-		return ERR_PTR(-EFAULT);
-
 	if (WARN_ON(!dev))
 		return ERR_PTR(-EINVAL);
 
@@ -686,7 +683,7 @@ static void *vb2_dc_attach_dmabuf(struct device *dev, struct dma_buf *dbuf,
 	}
 
 	buf->dma_dir = dma_dir;
-	buf->size = size;
+	buf->size = dbuf->size;
 	buf->db_attach = dba;
 
 	return buf;
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index c5b06a509566..8c006f79bed4 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -606,7 +606,7 @@ static void vb2_dma_sg_detach_dmabuf(void *mem_priv)
 }
 
 static void *vb2_dma_sg_attach_dmabuf(struct device *dev, struct dma_buf *dbuf,
-	unsigned long size, enum dma_data_direction dma_dir)
+				      enum dma_data_direction dma_dir)
 {
 	struct vb2_dma_sg_buf *buf;
 	struct dma_buf_attachment *dba;
@@ -614,9 +614,6 @@ static void *vb2_dma_sg_attach_dmabuf(struct device *dev, struct dma_buf *dbuf,
 	if (WARN_ON(!dev))
 		return ERR_PTR(-EINVAL);
 
-	if (dbuf->size < size)
-		return ERR_PTR(-EFAULT);
-
 	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
 	if (!buf)
 		return ERR_PTR(-ENOMEM);
@@ -631,7 +628,7 @@ static void *vb2_dma_sg_attach_dmabuf(struct device *dev, struct dma_buf *dbuf,
 	}
 
 	buf->dma_dir = dma_dir;
-	buf->size = size;
+	buf->size = dmabuf->size;
 	buf->db_attach = dba;
 
 	return buf;
diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
index 83f95258ec8c..c2d41b375c10 100644
--- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
+++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
@@ -404,20 +404,17 @@ static void vb2_vmalloc_detach_dmabuf(void *mem_priv)
 }
 
 static void *vb2_vmalloc_attach_dmabuf(struct device *dev, struct dma_buf *dbuf,
-	unsigned long size, enum dma_data_direction dma_dir)
+				       enum dma_data_direction dma_dir)
 {
 	struct vb2_vmalloc_buf *buf;
 
-	if (dbuf->size < size)
-		return ERR_PTR(-EFAULT);
-
 	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
 	if (!buf)
 		return ERR_PTR(-ENOMEM);
 
 	buf->dbuf = dbuf;
 	buf->dma_dir = dma_dir;
-	buf->size = size;
+	buf->size = dbuf->size;
 
 	return buf;
 }
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 12955cb460d2..db07001cada8 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -134,7 +134,6 @@ struct vb2_mem_ops {
 
 	void		*(*attach_dmabuf)(struct device *dev,
 					  struct dma_buf *dbuf,
-					  unsigned long size,
 					  enum dma_data_direction dma_dir);
 	void		(*detach_dmabuf)(void *buf_priv);
 	int		(*map_dmabuf)(void *buf_priv);
-- 
2.30.1

