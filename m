Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AABE1C35A9
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728446AbgEDJ0z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:26:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56720 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728440AbgEDJ0y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 05:26:54 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E1D411F9;
        Mon,  4 May 2020 11:26:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588584408;
        bh=3QXUY59gY+oX6owWIq+l7VUGMxvbiSyVbSxU6sug5GY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=moi8DWm4vwd+MgoboKmfvyaokUMLenrGF+lkPPBJ/7esjLfuAPApv68knsJCbyrau
         7ct3+E022WIaBfqbtmlafhOEIKAFHvK2yZpanesY/92ief1xEFG7H79LkgRmkcNWnO
         AKVNrZNhnfHu7rArhBS9ckcYKlHtxQoUzIsqT5I4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: [PATCH v2 32/34] media: videobuf2: Allow exporting of a struct dmabuf
Date:   Mon,  4 May 2020 12:26:09 +0300
Message-Id: <20200504092611.9798-33-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

videobuf2 only allowed exporting a dmabuf as a file descriptor,
but there are instances where having the struct dma_buf is
useful within the kernel.

Split the current implementation into two, one step which
exports a struct dma_buf, and the second which converts that
into an fd.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
---
 .../media/common/videobuf2/videobuf2-core.c   | 21 ++++++++++++++++---
 include/media/videobuf2-core.h                | 15 +++++++++++++
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 44d65f5be845..befdc89983e2 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -2073,12 +2073,12 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long off,
 	return -EINVAL;
 }
 
-int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
-		unsigned int index, unsigned int plane, unsigned int flags)
+int vb2_core_expbuf_dmabuf(struct vb2_queue *q, unsigned int type,
+			   unsigned int index, unsigned int plane,
+			   unsigned int flags, struct dma_buf **dmabuf)
 {
 	struct vb2_buffer *vb = NULL;
 	struct vb2_plane *vb_plane;
-	int ret;
 	struct dma_buf *dbuf;
 
 	if (q->memory != VB2_MEMORY_MMAP) {
@@ -2128,6 +2128,21 @@ int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
 		return -EINVAL;
 	}
 
+	*dmabuf = dbuf;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(vb2_core_expbuf_dmabuf);
+
+int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
+		    unsigned int index, unsigned int plane, unsigned int flags)
+{
+	struct dma_buf *dbuf;
+	int ret;
+
+	ret = vb2_core_expbuf_dmabuf(q, type, index, plane, flags, &dbuf);
+	if (ret)
+		return ret;
+
 	ret = dma_buf_fd(dbuf, flags & ~O_ACCMODE);
 	if (ret < 0) {
 		dprintk(3, "buffer %d, plane %d failed to export (%d)\n",
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index f11b96514cf7..86920d3264ab 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -875,6 +875,21 @@ int vb2_core_streamon(struct vb2_queue *q, unsigned int type);
  */
 int vb2_core_streamoff(struct vb2_queue *q, unsigned int type);
 
+/**
+ * vb2_core_expbuf_dmabuf() - Export a buffer as a dma_buf structure
+ * @q:         videobuf2 queue
+ * @type:      buffer type
+ * @index:     id number of the buffer
+ * @plane:     index of the plane to be exported, 0 for single plane queues
+ * @flags:     flags for newly created file, currently only O_CLOEXEC is
+ *             supported, refer to manual of open syscall for more details
+ * @dmabuf:    Returns the dmabuf pointer
+ *
+ */
+int vb2_core_expbuf_dmabuf(struct vb2_queue *q, unsigned int type,
+			   unsigned int index, unsigned int plane,
+			   unsigned int flags, struct dma_buf **dmabuf);
+
 /**
  * vb2_core_expbuf() - Export a buffer as a file descriptor.
  * @q:		pointer to &struct vb2_queue with videobuf2 queue.
-- 
Regards,

Laurent Pinchart

