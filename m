Return-Path: <linux-media+bounces-14599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 828DF9265BD
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 18:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC0A8B24C7A
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 16:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ACBF18411C;
	Wed,  3 Jul 2024 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O5C3sMFm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD32180A9C
	for <linux-media@vger.kernel.org>; Wed,  3 Jul 2024 16:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720023079; cv=none; b=E/Tk+h2iHFrg5Bd4133f+g2j8dYyS/kOGCknKzbEop5uV67HH0o6L3mNE+9GH1oR5atbddZurfT9N2rZq4FSEIDG84WnNPhBvK5xCMvfyXtiV+5jmzUOkznQ4YDyR9dRA4SmZ66/QOHC4kYyeDr+9VJaDw/GSzj/Xjaj/rK5nGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720023079; c=relaxed/simple;
	bh=mySJO7FwblOsMvyVITIw8oAXIWA2T8HKHn2IMRW0t5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VA5KHY+baNvhN3Jw1mACCkc3bMolT6H3OrsL6DXD+8qre4vp3EX786cVdqAwybu296FRtC6hbm8KSgq5WaWL28/24D2sZlyDLPWINqlxJh16g8BHvpQbwmGDQr666qZUgF087lU35wOVnXpCt36dKUP2qFiIQ6OcCQZnPvD73SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O5C3sMFm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8868EB53;
	Wed,  3 Jul 2024 18:10:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720023042;
	bh=mySJO7FwblOsMvyVITIw8oAXIWA2T8HKHn2IMRW0t5o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O5C3sMFmizqABYrq4rtxjJe4fLpdFzw4gZDcNScysrYTb0oAPiql1RNF4VA3lMTrA
	 e46KGSQK/CQX2PHAnRaG2Vwt1tjjhsz+ASEFJdO6InKOx39+dY3Xl338ahfD4ferBz
	 Inp9l/M7ff8ll2si0k04EarQwq/kxt8RJlKEjV/c=
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
Subject: [PATCH v5 4/7] media: rkisp1: Copy the parameters buffer
Date: Wed,  3 Jul 2024 18:10:43 +0200
Message-ID: <20240703161048.247124-5-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703161048.247124-1-jacopo.mondi@ideasonboard.com>
References: <20240703161048.247124-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ISP parameters buffers are queued by userspace to the params video
device and appended by the driver to the list of available buffers for
later consumption.

As the parameters buffer is mapped in the userspace process memory,
applications have access to the buffer content after the buffer has
been queued.

To prevent userspace from modifying the contents of the parameters buffer
after it has been queued to the video device, add to 'struct
rkisp1_params_buffer' a scratch buffer where to copy the parameters.

Allocate the scratch buffer in the vb2 buf_init() operation and copy the
buffer content in the buf_prepare() operation. Free the scratch
buffer in the newly introduced buf_cleanup() operation handler.

Modify the ISP configuration function to access the ISP configuration
from the cached copy of the parameters buffer instead of using the
userspace-mapped one.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  8 ++
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 83 ++++++++++++-------
 2 files changed, 60 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index a615bbb0255e..8d520c5c71c3 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -250,12 +250,20 @@ struct rkisp1_buffer {
  *
  * @vb:		vb2 buffer
  * @queue:	entry of the buffer in the queue
+ * @cfg:	scratch buffer used for caching the ISP configuration parameters
  */
 struct rkisp1_params_buffer {
 	struct vb2_v4l2_buffer vb;
 	struct list_head queue;
+	struct rkisp1_params_cfg *cfg;
 };
 
+static inline struct rkisp1_params_buffer *
+to_rkisp1_params_buffer(struct vb2_v4l2_buffer *vbuf)
+{
+	return container_of(vbuf, struct rkisp1_params_buffer, vb);
+}
+
 /*
  * struct rkisp1_dummy_buffer - A buffer to write the next frame to in case
  *				there are no vb2 buffers available.
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 2844e55bc4f2..e333cda21fdd 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
  */
 
+#include <linux/string.h>
+
 #include <media/v4l2-common.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
@@ -1501,20 +1503,6 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
 	}
 }
 
-static bool rkisp1_params_get_buffer(struct rkisp1_params *params,
-				     struct rkisp1_params_buffer **buf,
-				     struct rkisp1_params_cfg **cfg)
-{
-	if (list_empty(&params->params))
-		return false;
-
-	*buf = list_first_entry(&params->params, struct rkisp1_params_buffer,
-				queue);
-	*cfg = vb2_plane_vaddr(&(*buf)->vb.vb2_buf, 0);
-
-	return true;
-}
-
 static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
 					  struct rkisp1_params_buffer *buf,
 					  unsigned int frame_sequence)
@@ -1528,17 +1516,18 @@ static void rkisp1_params_complete_buffer(struct rkisp1_params *params,
 void rkisp1_params_isr(struct rkisp1_device *rkisp1)
 {
 	struct rkisp1_params *params = &rkisp1->params;
-	struct rkisp1_params_cfg *new_params;
 	struct rkisp1_params_buffer *cur_buf;
 
 	spin_lock(&params->config_lock);
 
-	if (!rkisp1_params_get_buffer(params, &cur_buf, &new_params))
+	cur_buf = list_first_entry_or_null(&params->params,
+					   struct rkisp1_params_buffer, queue);
+	if (!cur_buf)
 		goto unlock;
 
-	rkisp1_isp_isr_other_config(params, new_params);
-	rkisp1_isp_isr_lsc_config(params, new_params);
-	rkisp1_isp_isr_meas_config(params, new_params);
+	rkisp1_isp_isr_other_config(params, cur_buf->cfg);
+	rkisp1_isp_isr_lsc_config(params, cur_buf->cfg);
+	rkisp1_isp_isr_meas_config(params, cur_buf->cfg);
 
 	/* update shadow register immediately */
 	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
@@ -1604,7 +1593,6 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
 				 enum v4l2_ycbcr_encoding ycbcr_encoding)
 {
 	struct rkisp1_cif_isp_hst_config hst = rkisp1_hst_params_default_config;
-	struct rkisp1_params_cfg *new_params;
 	struct rkisp1_params_buffer *cur_buf;
 
 	params->quantization = quantization;
@@ -1634,11 +1622,13 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
 
 	/* apply the first buffer if there is one already */
 
-	if (!rkisp1_params_get_buffer(params, &cur_buf, &new_params))
+	cur_buf = list_first_entry_or_null(&params->params,
+					   struct rkisp1_params_buffer, queue);
+	if (!cur_buf)
 		goto unlock;
 
-	rkisp1_isp_isr_other_config(params, new_params);
-	rkisp1_isp_isr_meas_config(params, new_params);
+	rkisp1_isp_isr_other_config(params, cur_buf->cfg);
+	rkisp1_isp_isr_meas_config(params, cur_buf->cfg);
 
 	/* update shadow register immediately */
 	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
@@ -1650,7 +1640,6 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
 
 void rkisp1_params_post_configure(struct rkisp1_params *params)
 {
-	struct rkisp1_params_cfg *new_params;
 	struct rkisp1_params_buffer *cur_buf;
 
 	spin_lock_irq(&params->config_lock);
@@ -1663,11 +1652,12 @@ void rkisp1_params_post_configure(struct rkisp1_params *params)
 	 * ordering doesn't affect other ISP versions negatively, do so
 	 * unconditionally.
 	 */
-
-	if (!rkisp1_params_get_buffer(params, &cur_buf, &new_params))
+	cur_buf = list_first_entry_or_null(&params->params,
+					   struct rkisp1_params_buffer, queue);
+	if (!cur_buf)
 		goto unlock;
 
-	rkisp1_isp_isr_lsc_config(params, new_params);
+	rkisp1_isp_isr_lsc_config(params, cur_buf->cfg);
 
 	/* update shadow register immediately */
 	rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CTRL,
@@ -1819,11 +1809,31 @@ static int rkisp1_params_vb2_queue_setup(struct vb2_queue *vq,
 	return 0;
 }
 
+static int rkisp1_params_vb2_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct rkisp1_params_buffer *params_buf = to_rkisp1_params_buffer(vbuf);
+
+	params_buf->cfg = kvmalloc(sizeof(*params_buf->cfg), GFP_KERNEL);
+	if (!params_buf->cfg)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void rkisp1_params_vb2_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct rkisp1_params_buffer *params_buf = to_rkisp1_params_buffer(vbuf);
+
+	kvfree(params_buf->cfg);
+	params_buf->cfg = NULL;
+}
+
 static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
-	struct rkisp1_params_buffer *params_buf =
-		container_of(vbuf, struct rkisp1_params_buffer, vb);
+	struct rkisp1_params_buffer *params_buf = to_rkisp1_params_buffer(vbuf);
 	struct vb2_queue *vq = vb->vb2_queue;
 	struct rkisp1_params *params = vq->drv_priv;
 
@@ -1834,10 +1844,19 @@ static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
 
 static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
 {
-	if (vb2_plane_size(vb, 0) < sizeof(struct rkisp1_params_cfg))
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct rkisp1_params_buffer *params_buf = to_rkisp1_params_buffer(vbuf);
+	struct rkisp1_params_cfg *cfg =
+		vb2_plane_vaddr(&params_buf->vb.vb2_buf, 0);
+
+	if (vb2_get_plane_payload(vb, 0) != sizeof(*cfg))
 		return -EINVAL;
 
-	vb2_set_plane_payload(vb, 0, sizeof(struct rkisp1_params_cfg));
+	/*
+	 * Copy the parameters buffer to the internal scratch buffer to avoid
+	 * userspace modifying the buffer content while the driver processes it.
+	 */
+	memcpy(params_buf->cfg, cfg, sizeof(*cfg));
 
 	return 0;
 }
@@ -1863,6 +1882,8 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
 
 static const struct vb2_ops rkisp1_params_vb2_ops = {
 	.queue_setup = rkisp1_params_vb2_queue_setup,
+	.buf_init = rkisp1_params_vb2_buf_init,
+	.buf_cleanup = rkisp1_params_vb2_buf_cleanup,
 	.wait_prepare = vb2_ops_wait_prepare,
 	.wait_finish = vb2_ops_wait_finish,
 	.buf_queue = rkisp1_params_vb2_buf_queue,
-- 
2.45.2


