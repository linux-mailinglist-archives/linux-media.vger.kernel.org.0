Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29F82215E6F
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729738AbgGFShb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729569AbgGFShb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:37:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1427EC061755
        for <linux-media@vger.kernel.org>; Mon,  6 Jul 2020 11:37:31 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5EADD98;
        Mon,  6 Jul 2020 20:37:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060649;
        bh=T42eIdOv6EUh4nP3Vbf19UsJi90aSalIq4t6AWWTVP4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PHVABoGQJ/qtJIpM7lW4JeKG7mokdcOg9cD3/dw5m5Yg6MNSkDdMomyWhPkIbWN6s
         JerbuS1qAFo4GWVq4wdVHaTq0kjjFJJ5TR1EdeCNE5FCLFV2hvsTFV1WU5qgKV6IN4
         U8+X1Nc7QxgyelTYXG9MP1cgtyjRQzkBzOnDv/zE=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 002/108] media: ti-vpe: cal: Avoid function forward declaration
Date:   Mon,  6 Jul 2020 21:35:23 +0300
Message-Id: <20200706183709.12238-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the cal_complete_ctx() function earlier in the file to avoid a
foward declaration. There is no functional change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 111 ++++++++++++++--------------
 1 file changed, 55 insertions(+), 56 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 19425248bd63..88fed930ed50 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1852,7 +1852,61 @@ static const struct video_device cal_videodev = {
  *	Initialization and module stuff
  * ------------------------------------------------------------------
  */
-static int cal_complete_ctx(struct cal_ctx *ctx);
+
+static int cal_complete_ctx(struct cal_ctx *ctx)
+{
+	struct video_device *vfd;
+	struct vb2_queue *q;
+	int ret;
+
+	ctx->timeperframe = tpf_default;
+	ctx->external_rate = 192000000;
+
+	/* initialize locks */
+	spin_lock_init(&ctx->slock);
+	mutex_init(&ctx->mutex);
+
+	/* initialize queue */
+	q = &ctx->vb_vidq;
+	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
+	q->drv_priv = ctx;
+	q->buf_struct_size = sizeof(struct cal_buffer);
+	q->ops = &cal_video_qops;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->lock = &ctx->mutex;
+	q->min_buffers_needed = 3;
+	q->dev = ctx->v4l2_dev.dev;
+
+	ret = vb2_queue_init(q);
+	if (ret)
+		return ret;
+
+	/* init video dma queues */
+	INIT_LIST_HEAD(&ctx->vidq.active);
+
+	vfd = &ctx->vdev;
+	*vfd = cal_videodev;
+	vfd->v4l2_dev = &ctx->v4l2_dev;
+	vfd->queue = q;
+
+	/*
+	 * Provide a mutex to v4l2 core. It will be used to protect
+	 * all fops and v4l2 ioctls.
+	 */
+	vfd->lock = &ctx->mutex;
+	video_set_drvdata(vfd, ctx);
+
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, video_nr);
+	if (ret < 0)
+		return ret;
+
+	v4l2_info(&ctx->v4l2_dev, "V4L2 device registered as %s\n",
+		  video_device_node_name(vfd));
+
+	return 0;
+}
 
 static int cal_async_bound(struct v4l2_async_notifier *notifier,
 			   struct v4l2_subdev *subdev,
@@ -1948,61 +2002,6 @@ static const struct v4l2_async_notifier_operations cal_async_ops = {
 	.complete = cal_async_complete,
 };
 
-static int cal_complete_ctx(struct cal_ctx *ctx)
-{
-	struct video_device *vfd;
-	struct vb2_queue *q;
-	int ret;
-
-	ctx->timeperframe = tpf_default;
-	ctx->external_rate = 192000000;
-
-	/* initialize locks */
-	spin_lock_init(&ctx->slock);
-	mutex_init(&ctx->mutex);
-
-	/* initialize queue */
-	q = &ctx->vb_vidq;
-	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
-	q->drv_priv = ctx;
-	q->buf_struct_size = sizeof(struct cal_buffer);
-	q->ops = &cal_video_qops;
-	q->mem_ops = &vb2_dma_contig_memops;
-	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->lock = &ctx->mutex;
-	q->min_buffers_needed = 3;
-	q->dev = ctx->v4l2_dev.dev;
-
-	ret = vb2_queue_init(q);
-	if (ret)
-		return ret;
-
-	/* init video dma queues */
-	INIT_LIST_HEAD(&ctx->vidq.active);
-
-	vfd = &ctx->vdev;
-	*vfd = cal_videodev;
-	vfd->v4l2_dev = &ctx->v4l2_dev;
-	vfd->queue = q;
-
-	/*
-	 * Provide a mutex to v4l2 core. It will be used to protect
-	 * all fops and v4l2 ioctls.
-	 */
-	vfd->lock = &ctx->mutex;
-	video_set_drvdata(vfd, ctx);
-
-	ret = video_register_device(vfd, VFL_TYPE_VIDEO, video_nr);
-	if (ret < 0)
-		return ret;
-
-	v4l2_info(&ctx->v4l2_dev, "V4L2 device registered as %s\n",
-		  video_device_node_name(vfd));
-
-	return 0;
-}
-
 static struct device_node *
 of_get_next_port(const struct device_node *parent,
 		 struct device_node *prev)
-- 
Regards,

Laurent Pinchart

