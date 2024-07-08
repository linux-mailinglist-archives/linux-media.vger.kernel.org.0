Return-Path: <linux-media+bounces-14700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D244D92A033
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 12:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F7EC1F22807
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 10:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE0D7B3F3;
	Mon,  8 Jul 2024 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rYZl7z2G"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88CC77F2C
	for <linux-media@vger.kernel.org>; Mon,  8 Jul 2024 10:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720434526; cv=none; b=LTJzw79Sf9qKu24sQ/OoRbVA/A63RRPp6bRHiNzp7lufoscviTa46Yk4GS2MXQ9OLG8QBDtl3xyqgOkg2IkfPaY8DIujRcgjSlGJsHU0qeDWhg2tjldugBLbL/39HI/dVbFjzZKLUes5M35p01wAV8saGy/8Ck6rGOiPpozLGYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720434526; c=relaxed/simple;
	bh=WiLUOIr+lRg9on/InwYU2MlLQZC+9/jyPrR9n+CW1JY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Df/nS4CssW71VwfbWj2V9XoUzAqtnDinimNWZiJSkNv2wYMvIyo97QlK9RLW4nHCisPGLppLdmXSg4H6uBjELp8rft9ZycqIS+Ze+DlERTvQoZv5a75UY3+PZLwfHCBke2SXa/PpYy3hlBo4vcu2tzq9Y9SzeiZGEB0zTS7zNQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rYZl7z2G; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-59-142.net.vodafone.it [5.90.59.142])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3CDC1494;
	Mon,  8 Jul 2024 12:28:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720434491;
	bh=WiLUOIr+lRg9on/InwYU2MlLQZC+9/jyPrR9n+CW1JY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rYZl7z2GGdoPp73BjSM/y8lpGddtFBRztfKXqgWzXIa/02EKN49dPGI9rZtJ/lk7E
	 nKliB81dcStADzTAbYvmcHhdlfyFojkts1E/Ch7RI/muk0W9XQJMpbkd5B/nYSgIcH
	 A1EyVGRSKxCruguD0pqVM09NawokbewjkzHPSAbI=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v6 5/7] media: rkisp1: Cache the currently active format
Date: Mon,  8 Jul 2024 12:27:56 +0200
Message-ID: <20240708102759.53297-6-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240708102759.53297-1-jacopo.mondi@ideasonboard.com>
References: <20240708102759.53297-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rkisp1-params driver assumes the data buffer format is the only
currently supported "fixed" one. The usage of the "fixed" format is
assumed when allocating memory for the scratch buffers and when
initializing the vb2 queue.

In order to prepare to support the "extensible" format beside the
existing "fixed" one, add support in the driver for both formats by
caching a pointer to the active one in the driver structure and use it
in the vb2 queue operations and subdev pad operations implementations.

Do not yet allow userspace to select between the two formats as the
support for the "extensible" format parsing will be introduced in a later
patch in the series.

While at it, document the un-documented ycbcr_encoding field of
struct rkisp1_params_ops.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  8 +--
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 52 ++++++++++++-------
 2 files changed, 38 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 8d520c5c71c3..43cc727a628d 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -255,7 +255,7 @@ struct rkisp1_buffer {
 struct rkisp1_params_buffer {
 	struct vb2_v4l2_buffer vb;
 	struct list_head queue;
-	struct rkisp1_params_cfg *cfg;
+	void *cfg;
 };
 
 static inline struct rkisp1_params_buffer *
@@ -392,8 +392,9 @@ struct rkisp1_params_ops {
  * @ops:		pointer to the variant-specific operations
  * @config_lock:	locks the buffer list 'params'
  * @params:		queue of rkisp1_buffer
- * @vdev_fmt:		v4l2_format of the metadata format
+ * @metafmt		the currently enabled metadata format
  * @quantization:	the quantization configured on the isp's src pad
+ * @ycbcr_encoding	the YCbCr encoding
  * @raw_type:		the bayer pattern on the isp video sink pad
  */
 struct rkisp1_params {
@@ -403,7 +404,8 @@ struct rkisp1_params {
 
 	spinlock_t config_lock; /* locks the buffers list 'params' */
 	struct list_head params;
-	struct v4l2_format vdev_fmt;
+
+	const struct v4l2_meta_format *metafmt;
 
 	enum v4l2_quantization quantization;
 	enum v4l2_ycbcr_encoding ycbcr_encoding;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index e333cda21fdd..45c4b1bcee63 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -35,6 +35,22 @@
 #define RKISP1_ISP_CC_COEFF(n) \
 			(RKISP1_CIF_ISP_CC_COEFF_0 + (n) * 4)
 
+enum rkisp1_params_formats {
+	RKISP1_PARAMS_FIXED,
+	RKISP1_PARAMS_EXTENSIBLE,
+};
+
+static const struct v4l2_meta_format rkisp1_params_formats[] = {
+	[RKISP1_PARAMS_FIXED] = {
+		.dataformat = V4L2_META_FMT_RK_ISP1_PARAMS,
+		.buffersize = sizeof(struct rkisp1_params_cfg),
+	},
+	[RKISP1_PARAMS_EXTENSIBLE] = {
+		.dataformat = V4L2_META_FMT_RK_ISP1_EXT_PARAMS,
+		.buffersize = sizeof(struct rkisp1_ext_params_cfg),
+	},
+};
+
 static inline void
 rkisp1_param_set_bits(struct rkisp1_params *params, u32 reg, u32 bit_mask)
 {
@@ -1738,7 +1754,7 @@ static int rkisp1_params_enum_fmt_meta_out(struct file *file, void *priv,
 	if (f->index > 0 || f->type != video->queue->type)
 		return -EINVAL;
 
-	f->pixelformat = params->vdev_fmt.fmt.meta.dataformat;
+	f->pixelformat = params->metafmt->dataformat;
 
 	return 0;
 }
@@ -1754,8 +1770,8 @@ static int rkisp1_params_g_fmt_meta_out(struct file *file, void *fh,
 		return -EINVAL;
 
 	memset(meta, 0, sizeof(*meta));
-	meta->dataformat = params->vdev_fmt.fmt.meta.dataformat;
-	meta->buffersize = params->vdev_fmt.fmt.meta.buffersize;
+	meta->dataformat = params->metafmt->dataformat;
+	meta->buffersize = params->metafmt->buffersize;
 
 	return 0;
 }
@@ -1798,13 +1814,15 @@ static int rkisp1_params_vb2_queue_setup(struct vb2_queue *vq,
 					 unsigned int sizes[],
 					 struct device *alloc_devs[])
 {
+	struct rkisp1_params *params = vq->drv_priv;
+
 	*num_buffers = clamp_t(u32, *num_buffers,
 			       RKISP1_ISP_PARAMS_REQ_BUFS_MIN,
 			       RKISP1_ISP_PARAMS_REQ_BUFS_MAX);
 
 	*num_planes = 1;
 
-	sizes[0] = sizeof(struct rkisp1_params_cfg);
+	sizes[0] = params->metafmt->buffersize;
 
 	return 0;
 }
@@ -1813,8 +1831,10 @@ static int rkisp1_params_vb2_buf_init(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct rkisp1_params_buffer *params_buf = to_rkisp1_params_buffer(vbuf);
+	struct rkisp1_params *params = vb->vb2_queue->drv_priv;
 
-	params_buf->cfg = kvmalloc(sizeof(*params_buf->cfg), GFP_KERNEL);
+	params_buf->cfg = kvmalloc(params->metafmt->buffersize,
+				   GFP_KERNEL);
 	if (!params_buf->cfg)
 		return -ENOMEM;
 
@@ -1919,19 +1939,6 @@ static int rkisp1_params_init_vb2_queue(struct vb2_queue *q,
 	return vb2_queue_init(q);
 }
 
-static void rkisp1_init_params(struct rkisp1_params *params)
-{
-	params->vdev_fmt.fmt.meta.dataformat =
-		V4L2_META_FMT_RK_ISP1_PARAMS;
-	params->vdev_fmt.fmt.meta.buffersize =
-		sizeof(struct rkisp1_params_cfg);
-
-	if (params->rkisp1->info->isp_ver == RKISP1_V12)
-		params->ops = &rkisp1_v12_params_ops;
-	else
-		params->ops = &rkisp1_v10_params_ops;
-}
-
 int rkisp1_params_register(struct rkisp1_device *rkisp1)
 {
 	struct rkisp1_params *params = &rkisp1->params;
@@ -1960,7 +1967,14 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
 	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_META_OUTPUT;
 	vdev->vfl_dir = VFL_DIR_TX;
 	rkisp1_params_init_vb2_queue(vdev->queue, params);
-	rkisp1_init_params(params);
+
+	params->metafmt = &rkisp1_params_formats[RKISP1_PARAMS_FIXED];
+
+	if (params->rkisp1->info->isp_ver == RKISP1_V12)
+		params->ops = &rkisp1_v12_params_ops;
+	else
+		params->ops = &rkisp1_v10_params_ops;
+
 	video_set_drvdata(vdev, params);
 
 	node->pad.flags = MEDIA_PAD_FL_SOURCE;
-- 
2.45.2


