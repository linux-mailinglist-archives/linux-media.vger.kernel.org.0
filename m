Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DBDC1C3595
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728383AbgEDJ0i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:26:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56720 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728374AbgEDJ0h (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 05:26:37 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB316121D;
        Mon,  4 May 2020 11:26:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588584392;
        bh=GB/QVnQ+X3MsXZLCXgD+8w80zFPAIP95tWKCTKSwSE0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NyRVDVcOJyMcty8xut1QQUqjk2+VtVrTvTc9zDEd9DMt/2FnlIQn9IofKIZX2bhwH
         8yRFUXt9/TWvYEJjF7hUKqbGZINAh0FwPrfC8OkjGL30P5w6D5ilJJ+FSEqpj+VXwe
         mEKt4doVAjUOCp321t7vIC2yXiDfaTlxi647U27s=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: [PATCH v2 11/34] staging: mmal-vchiq: Make a mmal_buf struct for passing parameters
Date:   Mon,  4 May 2020 12:25:48 +0300
Message-Id: <20200504092611.9798-12-laurent.pinchart@ideasonboard.com>
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

The callback from vchi_mmal to the client was growing lots of extra
parameters. Consolidate them into a single struct instead of
growing the list further.
The struct is associated with the client buffer, therefore there
are various changes to setup various containers for the struct,
and pass the appropriate members.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../bcm2835-camera/bcm2835-camera.c           | 62 ++++++++++++-------
 .../vc04_services/vchiq-mmal/mmal-common.h    |  5 ++
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 29 ++++++---
 .../vc04_services/vchiq-mmal/mmal-vchiq.h     |  3 +-
 4 files changed, 64 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 597acef35d0b..68a2260d88f5 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -75,6 +75,12 @@ static const struct v4l2_fract
 	tpf_max     = {.numerator = 1,	        .denominator = FPS_MIN},
 	tpf_default = {.numerator = 1000,	.denominator = 30000};
 
+/* Container for MMAL and VB2 buffers*/
+struct vb2_mmal_buffer {
+	struct vb2_v4l2_buffer	vb;
+	struct mmal_buffer	mmal;
+};
+
 /* video formats */
 static struct mmal_fmt formats[] = {
 	{
@@ -261,14 +267,15 @@ static int buffer_init(struct vb2_buffer *vb)
 {
 	struct bm2835_mmal_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vb2 = to_vb2_v4l2_buffer(vb);
-	struct mmal_buffer *buf = container_of(vb2, struct mmal_buffer, vb);
+	struct vb2_mmal_buffer *buf =
+				container_of(vb2, struct vb2_mmal_buffer, vb);
 
 	v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev, "%s: dev:%p, vb %p\n",
 		 __func__, dev, vb);
-	buf->buffer = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
-	buf->buffer_size = vb2_plane_size(&buf->vb.vb2_buf, 0);
+	buf->mmal.buffer = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
+	buf->mmal.buffer_size = vb2_plane_size(&buf->vb.vb2_buf, 0);
 
-	return mmal_vchi_buffer_init(dev->instance, buf);
+	return mmal_vchi_buffer_init(dev->instance, &buf->mmal);
 }
 
 static int buffer_prepare(struct vb2_buffer *vb)
@@ -297,11 +304,13 @@ static void buffer_cleanup(struct vb2_buffer *vb)
 {
 	struct bm2835_mmal_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vb2 = to_vb2_v4l2_buffer(vb);
-	struct mmal_buffer *buf = container_of(vb2, struct mmal_buffer, vb);
+	struct vb2_mmal_buffer *buf =
+				container_of(vb2, struct vb2_mmal_buffer, vb);
 
 	v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev, "%s: dev:%p, vb %p\n",
 		 __func__, dev, vb);
-	mmal_vchi_buffer_cleanup(buf);
+
+	mmal_vchi_buffer_cleanup(&buf->mmal);
 }
 
 static inline bool is_capturing(struct bm2835_mmal_dev *dev)
@@ -313,14 +322,16 @@ static inline bool is_capturing(struct bm2835_mmal_dev *dev)
 static void buffer_cb(struct vchiq_mmal_instance *instance,
 		      struct vchiq_mmal_port *port,
 		      int status,
-		      struct mmal_buffer *buf,
-		      unsigned long length, u32 mmal_flags, s64 dts, s64 pts)
+		      struct mmal_buffer *mmal_buf)
 {
 	struct bm2835_mmal_dev *dev = port->cb_ctx;
+	struct vb2_mmal_buffer *buf =
+			container_of(mmal_buf, struct vb2_mmal_buffer, mmal);
 
 	v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
 		 "%s: status:%d, buf:%p, length:%lu, flags %u, pts %lld\n",
-		 __func__, status, buf, length, mmal_flags, pts);
+		 __func__, status, buf, mmal_buf->length, mmal_buf->mmal_flags,
+		 mmal_buf->pts);
 
 	if (status) {
 		/* error in transfer */
@@ -331,7 +342,7 @@ static void buffer_cb(struct vchiq_mmal_instance *instance,
 		return;
 	}
 
-	if (length == 0) {
+	if (mmal_buf->length == 0) {
 		/* stream ended */
 		if (dev->capture.frame_count) {
 			/* empty buffer whilst capturing - expected to be an
@@ -347,7 +358,8 @@ static void buffer_cb(struct vchiq_mmal_instance *instance,
 					&dev->capture.frame_count,
 					sizeof(dev->capture.frame_count));
 			}
-			if (vchiq_mmal_submit_buffer(instance, port, buf))
+			if (vchiq_mmal_submit_buffer(instance, port,
+						     &buf->mmal))
 				v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
 					 "Failed to return EOS buffer");
 		} else {
@@ -367,16 +379,16 @@ static void buffer_cb(struct vchiq_mmal_instance *instance,
 		return;
 	}
 
-	if (dev->capture.vc_start_timestamp != -1 && pts) {
+	if (dev->capture.vc_start_timestamp != -1 && mmal_buf->pts) {
 		ktime_t timestamp;
-		s64 runtime_us = pts -
+		s64 runtime_us = mmal_buf->pts -
 		    dev->capture.vc_start_timestamp;
 		timestamp = ktime_add_us(dev->capture.kernel_start_ts,
 					 runtime_us);
 		v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
 			 "Convert start time %llu and %llu with offset %llu to %llu\n",
 			 ktime_to_ns(dev->capture.kernel_start_ts),
-			 dev->capture.vc_start_timestamp, pts,
+			 dev->capture.vc_start_timestamp, mmal_buf->pts,
 			 ktime_to_ns(timestamp));
 		buf->vb.vb2_buf.timestamp = ktime_to_ns(timestamp);
 	} else {
@@ -385,13 +397,13 @@ static void buffer_cb(struct vchiq_mmal_instance *instance,
 	buf->vb.sequence = dev->capture.sequence++;
 	buf->vb.field = V4L2_FIELD_NONE;
 
-	vb2_set_plane_payload(&buf->vb.vb2_buf, 0, length);
-	if (mmal_flags & MMAL_BUFFER_HEADER_FLAG_KEYFRAME)
+	vb2_set_plane_payload(&buf->vb.vb2_buf, 0, mmal_buf->length);
+	if (mmal_buf->mmal_flags & MMAL_BUFFER_HEADER_FLAG_KEYFRAME)
 		buf->vb.flags |= V4L2_BUF_FLAG_KEYFRAME;
 
 	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 
-	if (mmal_flags & MMAL_BUFFER_HEADER_FLAG_EOS &&
+	if (mmal_buf->mmal_flags & MMAL_BUFFER_HEADER_FLAG_EOS &&
 	    is_capturing(dev)) {
 		v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
 			 "Grab another frame as buffer has EOS");
@@ -475,14 +487,16 @@ static void buffer_queue(struct vb2_buffer *vb)
 {
 	struct bm2835_mmal_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vb2 = to_vb2_v4l2_buffer(vb);
-	struct mmal_buffer *buf = container_of(vb2, struct mmal_buffer, vb);
+	struct vb2_mmal_buffer *buf =
+				container_of(vb2, struct vb2_mmal_buffer, vb);
 	int ret;
 
 	v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
 		 "%s: dev:%p buf:%p, idx %u\n",
 		 __func__, dev, buf, vb2->vb2_buf.index);
 
-	ret = vchiq_mmal_submit_buffer(dev->instance, dev->capture.port, buf);
+	ret = vchiq_mmal_submit_buffer(dev->instance, dev->capture.port,
+				       &buf->mmal);
 	if (ret < 0)
 		v4l2_err(&dev->v4l2_dev, "%s: error submitting buffer\n",
 			 __func__);
@@ -595,7 +609,7 @@ static void stop_streaming(struct vb2_queue *vq)
 	dev->capture.frame_count = 0;
 
 	/* ensure a format has actually been set */
-	if (!dev->capture.port) {
+	if (!port) {
 		v4l2_err(&dev->v4l2_dev,
 			 "no capture port - stream not started?\n");
 		return;
@@ -615,11 +629,11 @@ static void stop_streaming(struct vb2_queue *vq)
 
 	/* disable the connection from camera to encoder */
 	ret = vchiq_mmal_port_disable(dev->instance, dev->capture.camera_port);
-	if (!ret && dev->capture.camera_port != dev->capture.port) {
+	if (!ret && dev->capture.camera_port != port) {
 		v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
 			 "disabling port\n");
-		ret = vchiq_mmal_port_disable(dev->instance, dev->capture.port);
-	} else if (dev->capture.camera_port != dev->capture.port) {
+		ret = vchiq_mmal_port_disable(dev->instance, port);
+	} else if (dev->capture.camera_port != port) {
 		v4l2_err(&dev->v4l2_dev, "port_disable failed, error %d\n",
 			 ret);
 	}
@@ -1921,7 +1935,7 @@ static int bcm2835_mmal_probe(struct platform_device *pdev)
 		q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 		q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
 		q->drv_priv = dev;
-		q->buf_struct_size = sizeof(struct mmal_buffer);
+		q->buf_struct_size = sizeof(struct vb2_mmal_buffer);
 		q->ops = &bm2835_mmal_video_qops;
 		q->mem_ops = &vb2_vmalloc_memops;
 		q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-common.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-common.h
index ff5398737b4a..a635389208fc 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-common.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-common.h
@@ -49,6 +49,11 @@ struct mmal_buffer {
 	unsigned long buffer_size; /* size of allocated buffer */
 
 	struct mmal_msg_context *msg_context;
+
+	unsigned long length;
+	u32 mmal_flags;
+	s64 dts;
+	s64 pts;
 };
 
 /* */
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 12c2f86b02ad..9af964422e42 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -253,17 +253,25 @@ static void buffer_work_cb(struct work_struct *work)
 {
 	struct mmal_msg_context *msg_context =
 		container_of(work, struct mmal_msg_context, u.bulk.work);
+	struct mmal_buffer *buffer = msg_context->u.bulk.buffer;
+
+	if (!buffer) {
+		pr_err("%s: ctx: %p, No mmal buffer to pass details\n",
+		       __func__, msg_context);
+		return;
+	}
+
+	buffer->length = msg_context->u.bulk.buffer_used;
+	buffer->mmal_flags = msg_context->u.bulk.mmal_flags;
+	buffer->dts = msg_context->u.bulk.dts;
+	buffer->pts = msg_context->u.bulk.pts;
 
 	atomic_dec(&msg_context->u.bulk.port->buffers_with_vpu);
 
 	msg_context->u.bulk.port->buffer_cb(msg_context->u.bulk.instance,
 					    msg_context->u.bulk.port,
 					    msg_context->u.bulk.status,
-					    msg_context->u.bulk.buffer,
-					    msg_context->u.bulk.buffer_used,
-					    msg_context->u.bulk.mmal_flags,
-					    msg_context->u.bulk.dts,
-					    msg_context->u.bulk.pts);
+					    msg_context->u.bulk.buffer);
 }
 
 /* workqueue scheduled callback to handle receiving buffers
@@ -1321,11 +1329,14 @@ static int port_disable(struct vchiq_mmal_instance *instance,
 			mmalbuf = list_entry(buf_head, struct mmal_buffer,
 					     list);
 			list_del(buf_head);
-			if (port->buffer_cb)
+			if (port->buffer_cb) {
+				mmalbuf->length = 0;
+				mmalbuf->mmal_flags = 0;
+				mmalbuf->dts = MMAL_TIME_UNKNOWN;
+				mmalbuf->pts = MMAL_TIME_UNKNOWN;
 				port->buffer_cb(instance,
-						port, 0, mmalbuf, 0, 0,
-						MMAL_TIME_UNKNOWN,
-						MMAL_TIME_UNKNOWN);
+						port, 0, mmalbuf);
+			}
 		}
 
 		spin_unlock_irqrestore(&port->slock, flags);
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
index 4e34728d87e5..cca7289761c2 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
@@ -44,8 +44,7 @@ struct vchiq_mmal_port;
 typedef void (*vchiq_mmal_buffer_cb)(
 		struct vchiq_mmal_instance  *instance,
 		struct vchiq_mmal_port *port,
-		int status, struct mmal_buffer *buffer,
-		unsigned long length, u32 mmal_flags, s64 dts, s64 pts);
+		int status, struct mmal_buffer *buffer);
 
 struct vchiq_mmal_port {
 	u32 enabled:1;
-- 
Regards,

Laurent Pinchart

