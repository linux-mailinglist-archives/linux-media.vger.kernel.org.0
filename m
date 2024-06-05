Return-Path: <linux-media+bounces-12598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C64D8FD33B
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 18:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D084E1F248F4
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 16:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31242193080;
	Wed,  5 Jun 2024 16:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qmsjWk2P"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17D518FDD3
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 16:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717606523; cv=none; b=g3+39Jti7RTaB1yh3XSy0fwFBdwlw8JD/1xZN+TNYHGhOzUHmzbrVED0AXDLant594Gc+55nMhPoHJqeTV7o6rJClu3o+kUIy3LCwdVJAme2Oolf6YmTT1liJ9kJeCS7MXTcTxTbE4JbpXN4+Ql6c1ZEICXpQ81+pPGsUHVWTPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717606523; c=relaxed/simple;
	bh=qPBoCcTqe1iwoQiJLT2/L7KdyVcSdBcZyfE+zy85RiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z1B9ZKN9UzBaoVH3IvrL1vQTbxtsMUhPFM6rj/jEpHFbBXq5e1RMhtEOwKIXS0Z+jtJXW9muihYzLkoYFl6CYYIEaEA2NabGptqrIZO0RQDtiPR5X6K+UxS4S6Gj9HS9JwbNneX6qgxp1p1uZ4JklDKoFUlG66vIREdxA7cJtxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qmsjWk2P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0B787051;
	Wed,  5 Jun 2024 18:54:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717606495;
	bh=qPBoCcTqe1iwoQiJLT2/L7KdyVcSdBcZyfE+zy85RiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qmsjWk2PWNyCA9HIN+rP3adxGkI+RzBivk1XEI9+wJBx9XNuPBAJlC1XT25WG8Fq/
	 T3MYV3C0ePydqC5hOdVOCZ9IJ9rF3BV4Febe7ThKOtFEotoEUALe4CrCOJP+XLxW9C
	 yY49MX9ggqfl73OLU0wUNywUm0KpiCQ6TVF8YYFY=
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
Subject: [PATCH 8/8] media: rkisp1: Copy and validate parameters buffer
Date: Wed,  5 Jun 2024 18:54:27 +0200
Message-ID: <20240605165434.432230-9-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
References: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the introduction of the extensible parameters format support in the
rkisp1-param.c module, the RkISP1 driver now configures the ISP blocks
by parsing the content of a data buffer of variable size provided by
userspace through the V4L2 meta-output interface using the MMAP memory
handling mode.

As the parameters buffer is mapped in the userspace process memory,
applications have access to the buffer content while the driver
parses it.

To prevent potential issues during the parameters buffer parsing and
processing in the driver, implement three vb2_ops to

1) allocate a scratch buffer in the driver private buffer structure
2) validate the buffer content at VIDIOC_QBUF time
3) copy the content of the user provided configuration parameters
   in the driver-private scratch buffer

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 154 ++++++++++++++----
 1 file changed, 124 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index 4adaf084ce6e..003239e14511 100644
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
@@ -1943,17 +1945,14 @@ static const struct rkisp1_ext_params_handler {
 };
 
 static int __rkisp1_ext_params_config(struct rkisp1_params *params,
-				      struct rkisp1_ext_params_cfg *cfg,
+				      struct rkisp1_params_buffer *buffer,
 				      u32 block_group_mask)
 {
+	struct rkisp1_ext_params_cfg *cfg = buffer->cfg;
 	size_t block_offset = 0;
 
-	if (cfg->total_size > RKISP1_EXT_PARAMS_MAX_SIZE) {
-		dev_dbg(params->rkisp1->dev,
-			"Invalid parameters buffer size %llu\n",
-			cfg->total_size);
-		return -EINVAL;
-	}
+	if (WARN_ON(!cfg))
+		return -ENOMEM;
 
 	/* Walk the list of parameter blocks and process them. */
 	while (block_offset < cfg->total_size) {
@@ -1965,25 +1964,13 @@ static int __rkisp1_ext_params_config(struct rkisp1_params *params,
 		block_offset += block->size;
 
 		/*
-		 * Validate the block id and make sure the block group is in
-		 * the list of groups to configure.
+		 * Make sure the block group is in  the list of groups to
+		 * configure.
 		 */
-		if (block->type >= RKISP1_EXT_PARAMS_BLOCK_TYPE_SENTINEL) {
-			dev_dbg(params->rkisp1->dev,
-				"Invalid parameters block type\n");
-			return -EINVAL;
-		}
-
 		block_handler = &rkisp1_ext_params_handlers[block->type];
 		if (!(block_handler->group & block_group_mask))
 			continue;
 
-		if (block->size != block_handler->size) {
-			dev_dbg(params->rkisp1->dev,
-				"Invalid parameters block size\n");
-			return -EINVAL;
-		}
-
 		block_handler->handler(params, block);
 	}
 
@@ -1991,9 +1978,9 @@ static int __rkisp1_ext_params_config(struct rkisp1_params *params,
 }
 
 static int rkisp1_ext_params_config(struct rkisp1_params *params,
-				    struct rkisp1_ext_params_cfg *cfg)
+				    struct rkisp1_params_buffer *buffer)
 {
-	return __rkisp1_ext_params_config(params, cfg,
+	return __rkisp1_ext_params_config(params, buffer,
 					  RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
 					  RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC |
 					  RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS);
@@ -2001,17 +1988,17 @@ static int rkisp1_ext_params_config(struct rkisp1_params *params,
 
 static int
 rkisp1_ext_params_other_meas_config(struct rkisp1_params *params,
-				    struct rkisp1_ext_params_cfg *cfg)
+				    struct rkisp1_params_buffer *buffer)
 {
-	return __rkisp1_ext_params_config(params, cfg,
+	return __rkisp1_ext_params_config(params, buffer,
 					  RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS |
 					  RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS);
 }
 
 static int rkisp1_ext_params_lsc_config(struct rkisp1_params *params,
-					struct rkisp1_ext_params_cfg *cfg)
+					struct rkisp1_params_buffer *buffer)
 {
-	return __rkisp1_ext_params_config(params, cfg,
+	return __rkisp1_ext_params_config(params, buffer,
 					  RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC);
 }
 
@@ -2057,7 +2044,7 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
 		rkisp1_isp_isr_lsc_config(params, cfg);
 		rkisp1_isp_isr_meas_config(params, cfg);
 	} else {
-		ret = rkisp1_ext_params_config(params, cfg);
+		ret = rkisp1_ext_params_config(params, buf);
 	}
 
 	if (ret)
@@ -2168,7 +2155,7 @@ int rkisp1_params_pre_configure(struct rkisp1_params *params,
 		rkisp1_isp_isr_other_config(params, cfg);
 		rkisp1_isp_isr_meas_config(params, cfg);
 	} else {
-		ret = rkisp1_ext_params_other_meas_config(params, cfg);
+		ret = rkisp1_ext_params_other_meas_config(params, buf);
 	}
 
 	if (ret) {
@@ -2215,7 +2202,7 @@ int rkisp1_params_post_configure(struct rkisp1_params *params)
 	if (params->metafmt.dataformat == V4L2_META_FMT_RK_ISP1_PARAMS)
 		rkisp1_isp_isr_lsc_config(params, cfg);
 	else
-		ret = rkisp1_ext_params_lsc_config(params, cfg);
+		ret = rkisp1_ext_params_lsc_config(params, buf);
 
 	if (ret)
 		goto complete_and_unlock;
@@ -2407,6 +2394,110 @@ static int rkisp1_params_vb2_queue_setup(struct vb2_queue *vq,
 	return 0;
 }
 
+static int rkisp1_params_vb2_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct rkisp1_params_buffer *params_buf =
+		container_of(vbuf, struct rkisp1_params_buffer, vb);
+	struct rkisp1_params *params = vb->vb2_queue->drv_priv;
+	size_t buf_size = params->metafmt.buffersize;
+
+	if (params->metafmt.dataformat == V4L2_META_FMT_RK_ISP1_PARAMS) {
+		params_buf->cfg = NULL;
+		return 0;
+	}
+
+	params_buf->cfg = kvmalloc(buf_size, GFP_KERNEL);
+	if (IS_ERR_OR_NULL(params_buf->cfg))
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void rkisp1_params_vb2_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct rkisp1_params_buffer *params_buf =
+		container_of(vbuf, struct rkisp1_params_buffer, vb);
+
+	kvfree(params_buf->cfg);
+}
+
+static int rkisp1_params_validate_ext_params(struct rkisp1_params *params,
+					     struct rkisp1_ext_params_cfg *cfg)
+{
+	size_t block_offset = 0;
+
+	if (cfg->total_size > RKISP1_EXT_PARAMS_MAX_SIZE) {
+		dev_dbg(params->rkisp1->dev,
+			"Invalid parameters buffer size %llu\n",
+			cfg->total_size);
+		return -EINVAL;
+	}
+
+	/* Walk the list of parameter blocks and validate them. */
+	while (block_offset < cfg->total_size) {
+		const struct rkisp1_ext_params_handler *hdlr;
+		struct rkisp1_ext_params_block_header *block;
+
+		block = (struct rkisp1_ext_params_block_header *)
+			&cfg->data[block_offset];
+		block_offset += block->size;
+
+		if (block->type >= RKISP1_EXT_PARAMS_BLOCK_TYPE_SENTINEL) {
+			dev_dbg(params->rkisp1->dev,
+				"Invalid parameters block type\n");
+			return -EINVAL;
+		}
+
+		hdlr = &rkisp1_ext_params_handlers[block->type];
+		if (hdlr->group != RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS &&
+		    hdlr->group != RKISP1_EXT_PARAMS_BLOCK_GROUP_LSC &&
+		    hdlr->group != RKISP1_EXT_PARAMS_BLOCK_GROUP_MEAS) {
+			dev_dbg(params->rkisp1->dev,
+				"Invalid parameters block group\n");
+			return -EINVAL;
+		}
+
+		if (block->size != hdlr->size) {
+			dev_dbg(params->rkisp1->dev,
+				"Invalid parameters block size\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int rkisp1_params_vb2_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct rkisp1_params_buffer *params_buf =
+		container_of(vbuf, struct rkisp1_params_buffer, vb);
+	struct vb2_queue *vq = vb->vb2_queue;
+	struct rkisp1_params *params = vq->drv_priv;
+	struct rkisp1_ext_params_cfg *cfg =
+		vb2_plane_vaddr(&params_buf->vb.vb2_buf, 0);
+	int ret;
+
+	/* Fixed parameters format doesn't require validation. */
+	if (params->metafmt.dataformat == V4L2_META_FMT_RK_ISP1_PARAMS)
+		return 0;
+
+	ret = rkisp1_params_validate_ext_params(params, cfg);
+	if (ret)
+		return ret;
+
+	/*
+	 * If the parameters buffer is valid, copy it to the internal scratch
+	 * buffer to avoid userspace modifying the buffer content while
+	 * the driver processes it.
+	 */
+	memcpy(params_buf->cfg, cfg, sizeof(*cfg));
+
+	return 0;
+}
+
 static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
@@ -2455,6 +2546,9 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
 
 static const struct vb2_ops rkisp1_params_vb2_ops = {
 	.queue_setup = rkisp1_params_vb2_queue_setup,
+	.buf_init = rkisp1_params_vb2_buf_init,
+	.buf_cleanup = rkisp1_params_vb2_buf_cleanup,
+	.buf_out_validate = rkisp1_params_vb2_buf_out_validate,
 	.wait_prepare = vb2_ops_wait_prepare,
 	.wait_finish = vb2_ops_wait_finish,
 	.buf_queue = rkisp1_params_vb2_buf_queue,
-- 
2.45.1


