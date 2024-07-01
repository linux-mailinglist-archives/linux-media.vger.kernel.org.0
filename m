Return-Path: <linux-media+bounces-14482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 328A491E5EB
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 18:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAD701F26126
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 16:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946AD16EB4C;
	Mon,  1 Jul 2024 16:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RzZnlVMR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE6216E894
	for <linux-media@vger.kernel.org>; Mon,  1 Jul 2024 16:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719852772; cv=none; b=R1+nzkKgjRNVrV+QXNEFaQC03vigX2TG0Q1lFpvnZQ1XfGajZxbLTKpc8vS4GJL2hLvuvidKs5IRbCecYicyt1rpXf3loRWNHcXAIAoV0+QvX9g/TgkwyswtEHgdHZblE6EUcT2Qm6ufQjePKrB+fGMok9yFQK30pRoxmugeQ1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719852772; c=relaxed/simple;
	bh=i6YMvJ98MHB4Rn0UDv1iPBcoshHPgxif23AaHSHi3VQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U6M3oJSNL/4x6Y43oIJ1NmyTuHSDPpXrDzinmamOY6pCB8di0X+Z/43Evvft0VQ/w0Godgju5uDH76sTtzric77CoSD1ay0xf5vAGg6GLJ8u83Rt6HbrR23OYI3ex6ShXAE6k6H2r1KFZAkh0JJxo4mm1U5Y8P3JlbyYEfXf0h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RzZnlVMR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71D95AF3;
	Mon,  1 Jul 2024 18:52:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719852736;
	bh=i6YMvJ98MHB4Rn0UDv1iPBcoshHPgxif23AaHSHi3VQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RzZnlVMR7fIjrK+AGEpVIbOZ4AYfHDJyG/K/mJRfMHlUL7mnzOW9b6V6CK+rOa1HT
	 MB02RtW7WNJ9QAZvbdnL0LTzp1rabQeorIRZPwI2dyK80tDB3sPzIgEL5/7I8pxZor
	 N9G8f2K64KdgC5Gbht938RcanEDHRsZeI9x6pMs4=
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
Subject: [PATCH v3 5/7] media: rkisp1: Cache the currently active format
Date: Mon,  1 Jul 2024 18:52:19 +0200
Message-ID: <20240701165222.205510-6-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701165222.205510-1-jacopo.mondi@ideasonboard.com>
References: <20240701165222.205510-1-jacopo.mondi@ideasonboard.com>
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
---
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  8 ++-
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 58 +++++++++++--------
 2 files changed, 40 insertions(+), 26 deletions(-)

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
index 2d49038f8983..9444790c564f 100644
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
 
@@ -1849,16 +1869,14 @@ static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
 	struct rkisp1_params_cfg *cfg =
 		vb2_plane_vaddr(&params_buf->vb.vb2_buf, 0);
 
-	if (vb2_plane_size(vb, 0) < sizeof(struct rkisp1_params_cfg))
+	if (vb2_get_plane_payload(vb, 0) < sizeof(struct rkisp1_params_cfg))
 		return -EINVAL;
 
-	vb2_set_plane_payload(vb, 0, sizeof(struct rkisp1_params_cfg));
-
 	/*
 	 * Copy the parameters buffer to the internal scratch buffer to avoid
 	 * userspace modifying the buffer content while the driver processes it.
 	 */
-	memcpy(params_buf->cfg, cfg, sizeof(*cfg));
+	memcpy(params_buf->cfg, cfg, vb2_get_plane_payload(vb, 0));
 
 	return 0;
 }
@@ -1921,19 +1939,6 @@ static int rkisp1_params_init_vb2_queue(struct vb2_queue *q,
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
@@ -1962,7 +1967,14 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
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


