Return-Path: <linux-media+bounces-20625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1779B760D
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 09:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EE68284CF5
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 08:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EAE8154445;
	Thu, 31 Oct 2024 08:08:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063E014F102
	for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 08:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730362123; cv=none; b=aV1jb3p0SSColUltmQEuMUnffGQLOnP74eMHh0MvqCZmFS+8KJDF4mKW2VvAqIZX9NhijJJkbitMnIlfP5maDZTTdngwdMmrbaME0RAwomY9S4rN15lIi9pMFKcx9cA1gcJfif1V0EpnRWFiKZg+aMHU/0UXt+MQCYH9Wjm8p/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730362123; c=relaxed/simple;
	bh=X22i+GjFTlMi31lHexlSDmI43iLGFRnBwWfsxaKKTgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ek+uFiYKtyXk9j1RQLasrhsYqJw99p9W2nJ+NRVJiuHGloBzKRbDzSaWyrZ6lDqW5pWGORDzmhnqPlyzzOELj7xSKuHsOuJJPiUC+u8A/duVdNgOa+u6l/ax6AnB9P37B5GPiOmO/qGDfR54WsexNcaRzzAzGPSIlgjLS51t++k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E23DC4CEC3;
	Thu, 31 Oct 2024 08:08:41 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: nicolas@ndufresne.ca,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC PATCH 2/2] media: vivid: convert queue_setup to queue_info
Date: Thu, 31 Oct 2024 08:59:27 +0100
Message-ID: <9e520ec9de9a8eadd2d0c5b750ac3e81c95cd212.1730361567.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1730361567.git.hverkuil@xs4all.nl>
References: <cover.1730361567.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the new queue_info callback instead of queue_setup.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 .../media/test-drivers/vivid/vivid-meta-cap.c | 17 +++-----
 .../media/test-drivers/vivid/vivid-meta-out.c | 27 +++++--------
 .../media/test-drivers/vivid/vivid-sdr-cap.c  | 16 +++-----
 .../test-drivers/vivid/vivid-touch-cap.c      | 18 +++------
 .../media/test-drivers/vivid/vivid-vbi-cap.c  | 13 +++----
 .../media/test-drivers/vivid/vivid-vbi-out.c  | 13 +++----
 .../media/test-drivers/vivid/vivid-vid-cap.c  | 39 ++++++-------------
 .../media/test-drivers/vivid/vivid-vid-out.c  | 37 +++++-------------
 8 files changed, 56 insertions(+), 124 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-meta-cap.c b/drivers/media/test-drivers/vivid/vivid-meta-cap.c
index c7aaecc0b5a2..90d3f6d74a21 100644
--- a/drivers/media/test-drivers/vivid/vivid-meta-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-meta-cap.c
@@ -13,24 +13,17 @@
 #include "vivid-kthread-cap.h"
 #include "vivid-meta-cap.h"
 
-static int meta_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
-				unsigned int *nplanes, unsigned int sizes[],
-				struct device *alloc_devs[])
+static int meta_cap_queue_info(struct vb2_queue *vq,
+			       unsigned int *nplanes, unsigned int sizes[],
+			       struct device *alloc_devs[])
 {
 	struct vivid_dev *dev = vb2_get_drv_priv(vq);
-	unsigned int size =  sizeof(struct vivid_uvc_meta_buf);
 
 	if (!vivid_is_webcam(dev))
 		return -EINVAL;
 
-	if (*nplanes) {
-		if (sizes[0] < size)
-			return -EINVAL;
-	} else {
-		sizes[0] = size;
-	}
-
 	*nplanes = 1;
+	sizes[0] = sizeof(struct vivid_uvc_meta_buf);
 	return 0;
 }
 
@@ -116,7 +109,7 @@ static void meta_cap_buf_request_complete(struct vb2_buffer *vb)
 }
 
 const struct vb2_ops vivid_meta_cap_qops = {
-	.queue_setup		= meta_cap_queue_setup,
+	.queue_info		= meta_cap_queue_info,
 	.buf_prepare		= meta_cap_buf_prepare,
 	.buf_queue		= meta_cap_buf_queue,
 	.start_streaming	= meta_cap_start_streaming,
diff --git a/drivers/media/test-drivers/vivid/vivid-meta-out.c b/drivers/media/test-drivers/vivid/vivid-meta-out.c
index 55e5e5dec2f2..432b0f6317bc 100644
--- a/drivers/media/test-drivers/vivid/vivid-meta-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-meta-out.c
@@ -13,24 +13,17 @@
 #include "vivid-kthread-out.h"
 #include "vivid-meta-out.h"
 
-static int meta_out_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
-				unsigned int *nplanes, unsigned int sizes[],
-				struct device *alloc_devs[])
+static int meta_out_queue_info(struct vb2_queue *vq,
+			       unsigned int *nplanes, unsigned int sizes[],
+			       struct device *alloc_devs[])
 {
 	struct vivid_dev *dev = vb2_get_drv_priv(vq);
-	unsigned int size =  sizeof(struct vivid_meta_out_buf);
 
 	if (!vivid_is_webcam(dev))
 		return -EINVAL;
 
-	if (*nplanes) {
-		if (sizes[0] < size)
-			return -EINVAL;
-	} else {
-		sizes[0] = size;
-	}
-
 	*nplanes = 1;
+	sizes[0] = sizeof(struct vivid_meta_out_buf);
 	return 0;
 }
 
@@ -116,12 +109,12 @@ static void meta_out_buf_request_complete(struct vb2_buffer *vb)
 }
 
 const struct vb2_ops vivid_meta_out_qops = {
-	.queue_setup            = meta_out_queue_setup,
-	.buf_prepare            = meta_out_buf_prepare,
-	.buf_queue              = meta_out_buf_queue,
-	.start_streaming        = meta_out_start_streaming,
-	.stop_streaming         = meta_out_stop_streaming,
-	.buf_request_complete   = meta_out_buf_request_complete,
+	.queue_info		= meta_out_queue_info,
+	.buf_prepare		= meta_out_buf_prepare,
+	.buf_queue		= meta_out_buf_queue,
+	.start_streaming	= meta_out_start_streaming,
+	.stop_streaming		= meta_out_stop_streaming,
+	.buf_request_complete	= meta_out_buf_request_complete,
 };
 
 int vidioc_enum_fmt_meta_out(struct file *file, void  *priv,
diff --git a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
index 74a91d28c8be..ee94dcfb62f2 100644
--- a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
@@ -214,18 +214,14 @@ static int vivid_thread_sdr_cap(void *data)
 	return 0;
 }
 
-static int sdr_cap_queue_setup(struct vb2_queue *vq,
-		       unsigned *nbuffers, unsigned *nplanes,
-		       unsigned sizes[], struct device *alloc_devs[])
+static int sdr_cap_queue_info(struct vb2_queue *vq,
+			      unsigned int *nplanes, unsigned int sizes[],
+			      struct device *alloc_devs[])
 {
-	/* 2 = max 16-bit sample returned */
-	u32 size = SDR_CAP_SAMPLES_PER_BUF * 2;
-
-	if (*nplanes)
-		return sizes[0] < size ? -EINVAL : 0;
 
 	*nplanes = 1;
-	sizes[0] = size;
+	/* 2 = max 16-bit sample returned */
+	sizes[0] = SDR_CAP_SAMPLES_PER_BUF * 2;
 	return 0;
 }
 
@@ -331,7 +327,7 @@ static void sdr_cap_buf_request_complete(struct vb2_buffer *vb)
 }
 
 const struct vb2_ops vivid_sdr_cap_qops = {
-	.queue_setup		= sdr_cap_queue_setup,
+	.queue_info		= sdr_cap_queue_info,
 	.buf_prepare		= sdr_cap_buf_prepare,
 	.buf_queue		= sdr_cap_buf_queue,
 	.start_streaming	= sdr_cap_start_streaming,
diff --git a/drivers/media/test-drivers/vivid/vivid-touch-cap.c b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
index 36a781fa17bc..49824674d0e9 100644
--- a/drivers/media/test-drivers/vivid/vivid-touch-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
@@ -8,22 +8,14 @@
 #include "vivid-vid-common.h"
 #include "vivid-touch-cap.h"
 
-static int touch_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
-				 unsigned int *nplanes, unsigned int sizes[],
-				 struct device *alloc_devs[])
+static int touch_cap_queue_info(struct vb2_queue *vq,
+				unsigned int *nplanes, unsigned int sizes[],
+				struct device *alloc_devs[])
 {
 	struct vivid_dev *dev = vb2_get_drv_priv(vq);
-	struct v4l2_pix_format *f = &dev->tch_format;
-	unsigned int size = f->sizeimage;
-
-	if (*nplanes) {
-		if (*nplanes != 1)
-			return -EINVAL;
-		return sizes[0] < size ? -EINVAL : 0;
-	}
 
 	*nplanes = 1;
-	sizes[0] = size;
+	sizes[0] = dev->tch_format.sizeimage;
 	return 0;
 }
 
@@ -104,7 +96,7 @@ static void touch_cap_buf_request_complete(struct vb2_buffer *vb)
 }
 
 const struct vb2_ops vivid_touch_cap_qops = {
-	.queue_setup		= touch_cap_queue_setup,
+	.queue_info		= touch_cap_queue_info,
 	.buf_prepare		= touch_cap_buf_prepare,
 	.buf_queue		= touch_cap_buf_queue,
 	.start_streaming	= touch_cap_start_streaming,
diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
index a09f62c66c33..8d9696d5800a 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
@@ -120,9 +120,9 @@ void vivid_sliced_vbi_cap_process(struct vivid_dev *dev,
 	}
 }
 
-static int vbi_cap_queue_setup(struct vb2_queue *vq,
-		       unsigned *nbuffers, unsigned *nplanes,
-		       unsigned sizes[], struct device *alloc_devs[])
+static int vbi_cap_queue_info(struct vb2_queue *vq,
+			      unsigned int *nplanes, unsigned int sizes[],
+			      struct device *alloc_devs[])
 {
 	struct vivid_dev *dev = vb2_get_drv_priv(vq);
 	bool is_60hz = dev->std_cap[dev->input] & V4L2_STD_525_60;
@@ -133,11 +133,8 @@ static int vbi_cap_queue_setup(struct vb2_queue *vq,
 	if (!vivid_is_sdtv_cap(dev))
 		return -EINVAL;
 
-	if (*nplanes)
-		return sizes[0] < size ? -EINVAL : 0;
-	sizes[0] = size;
-
 	*nplanes = 1;
+	sizes[0] = size;
 	return 0;
 }
 
@@ -224,7 +221,7 @@ static void vbi_cap_buf_request_complete(struct vb2_buffer *vb)
 }
 
 const struct vb2_ops vivid_vbi_cap_qops = {
-	.queue_setup		= vbi_cap_queue_setup,
+	.queue_info		= vbi_cap_queue_info,
 	.buf_prepare		= vbi_cap_buf_prepare,
 	.buf_queue		= vbi_cap_buf_queue,
 	.start_streaming	= vbi_cap_start_streaming,
diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-out.c b/drivers/media/test-drivers/vivid/vivid-vbi-out.c
index b7a09d2f394e..99a5843e210a 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-out.c
@@ -15,9 +15,9 @@
 #include "vivid-vbi-out.h"
 #include "vivid-vbi-cap.h"
 
-static int vbi_out_queue_setup(struct vb2_queue *vq,
-		       unsigned *nbuffers, unsigned *nplanes,
-		       unsigned sizes[], struct device *alloc_devs[])
+static int vbi_out_queue_info(struct vb2_queue *vq,
+			      unsigned int *nplanes, unsigned int sizes[],
+			      struct device *alloc_devs[])
 {
 	struct vivid_dev *dev = vb2_get_drv_priv(vq);
 	bool is_60hz = dev->std_out & V4L2_STD_525_60;
@@ -28,11 +28,8 @@ static int vbi_out_queue_setup(struct vb2_queue *vq,
 	if (!vivid_is_svid_out(dev))
 		return -EINVAL;
 
-	if (*nplanes)
-		return sizes[0] < size ? -EINVAL : 0;
-	sizes[0] = size;
-
 	*nplanes = 1;
+	sizes[0] = size;
 	return 0;
 }
 
@@ -122,7 +119,7 @@ static void vbi_out_buf_request_complete(struct vb2_buffer *vb)
 }
 
 const struct vb2_ops vivid_vbi_out_qops = {
-	.queue_setup		= vbi_out_queue_setup,
+	.queue_info		= vbi_out_queue_info,
 	.buf_prepare		= vbi_out_buf_prepare,
 	.buf_queue		= vbi_out_buf_queue,
 	.start_streaming	= vbi_out_start_streaming,
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index ecff984e521c..5e08d79618f5 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -72,12 +72,12 @@ static inline unsigned int webcam_ival_count(const struct vivid_dev *dev,
 	return ARRAY_SIZE(webcam_intervals);
 }
 
-static int vid_cap_queue_setup(struct vb2_queue *vq,
-		       unsigned *nbuffers, unsigned *nplanes,
-		       unsigned sizes[], struct device *alloc_devs[])
+static int vid_cap_queue_info(struct vb2_queue *vq,
+			      unsigned int *nplanes, unsigned int sizes[],
+			      struct device *alloc_devs[])
 {
 	struct vivid_dev *dev = vb2_get_drv_priv(vq);
-	unsigned buffers = tpg_g_buffers(&dev->tpg);
+	unsigned planes = tpg_g_buffers(&dev->tpg);
 	unsigned h = dev->fmt_cap_rect.height;
 	unsigned p;
 
@@ -98,30 +98,13 @@ static int vid_cap_queue_setup(struct vb2_queue *vq,
 		dev->queue_setup_error = false;
 		return -EINVAL;
 	}
-	if (*nplanes) {
-		/*
-		 * Check if the number of requested planes match
-		 * the number of buffers in the current format. You can't mix that.
-		 */
-		if (*nplanes != buffers)
-			return -EINVAL;
-		for (p = 0; p < buffers; p++) {
-			if (sizes[p] < tpg_g_line_width(&dev->tpg, p) * h /
-					dev->fmt_cap->vdownsampling[p] +
-					dev->fmt_cap->data_offset[p])
-				return -EINVAL;
-		}
-	} else {
-		for (p = 0; p < buffers; p++)
-			sizes[p] = (tpg_g_line_width(&dev->tpg, p) * h) /
-					dev->fmt_cap->vdownsampling[p] +
-					dev->fmt_cap->data_offset[p];
-	}
+	*nplanes = planes;
+	for (p = 0; p < planes; p++)
+		sizes[p] = (tpg_g_line_width(&dev->tpg, p) * h) /
+			dev->fmt_cap->vdownsampling[p] +
+			dev->fmt_cap->data_offset[p];
 
-	*nplanes = buffers;
-
-	dprintk(dev, 1, "%s: count=%d\n", __func__, *nbuffers);
-	for (p = 0; p < buffers; p++)
+	for (p = 0; p < planes; p++)
 		dprintk(dev, 1, "%s: size[%u]=%u\n", __func__, p, sizes[p]);
 
 	return 0;
@@ -250,7 +233,7 @@ static void vid_cap_buf_request_complete(struct vb2_buffer *vb)
 }
 
 const struct vb2_ops vivid_vid_cap_qops = {
-	.queue_setup		= vid_cap_queue_setup,
+	.queue_info		= vid_cap_queue_info,
 	.buf_prepare		= vid_cap_buf_prepare,
 	.buf_finish		= vid_cap_buf_finish,
 	.buf_queue		= vid_cap_buf_queue,
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.c b/drivers/media/test-drivers/vivid/vivid-vid-out.c
index 5ec84db934d6..b183ee1b9048 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-out.c
@@ -20,9 +20,9 @@
 #include "vivid-kthread-out.h"
 #include "vivid-vid-out.h"
 
-static int vid_out_queue_setup(struct vb2_queue *vq,
-		       unsigned *nbuffers, unsigned *nplanes,
-		       unsigned sizes[], struct device *alloc_devs[])
+static int vid_out_queue_info(struct vb2_queue *vq,
+			      unsigned int *nplanes, unsigned int sizes[],
+			      struct device *alloc_devs[])
 {
 	struct vivid_dev *dev = vb2_get_drv_priv(vq);
 	const struct vivid_fmt *vfmt = dev->fmt_out;
@@ -53,31 +53,12 @@ static int vid_out_queue_setup(struct vb2_queue *vq,
 		return -EINVAL;
 	}
 
-	if (*nplanes) {
-		/*
-		 * Check if the number of requested planes match
-		 * the number of planes in the current format. You can't mix that.
-		 */
-		if (*nplanes != planes)
-			return -EINVAL;
-		if (sizes[0] < size)
-			return -EINVAL;
-		for (p = 1; p < planes; p++) {
-			if (sizes[p] < dev->bytesperline_out[p] * h /
-					vfmt->vdownsampling[p] +
-					vfmt->data_offset[p])
-				return -EINVAL;
-		}
-	} else {
-		for (p = 0; p < planes; p++)
-			sizes[p] = p ? dev->bytesperline_out[p] * h /
-					vfmt->vdownsampling[p] +
-					vfmt->data_offset[p] : size;
-	}
-
 	*nplanes = planes;
+	for (p = 0; p < planes; p++)
+		sizes[p] = p ? dev->bytesperline_out[p] * h /
+			vfmt->vdownsampling[p] +
+			vfmt->data_offset[p] : size;
 
-	dprintk(dev, 1, "%s: count=%u\n", __func__, *nbuffers);
 	for (p = 0; p < planes; p++)
 		dprintk(dev, 1, "%s: size[%u]=%u\n", __func__, p, sizes[p]);
 	return 0;
@@ -194,8 +175,8 @@ static void vid_out_buf_request_complete(struct vb2_buffer *vb)
 }
 
 const struct vb2_ops vivid_vid_out_qops = {
-	.queue_setup		= vid_out_queue_setup,
-	.buf_out_validate		= vid_out_buf_out_validate,
+	.queue_info		= vid_out_queue_info,
+	.buf_out_validate	= vid_out_buf_out_validate,
 	.buf_prepare		= vid_out_buf_prepare,
 	.buf_queue		= vid_out_buf_queue,
 	.start_streaming	= vid_out_start_streaming,
-- 
2.45.2


