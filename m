Return-Path: <linux-media+bounces-35756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E19AAE6246
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0B4A1923E76
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247DE28D8FD;
	Tue, 24 Jun 2025 10:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UGzPrlch"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376762857E6;
	Tue, 24 Jun 2025 10:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760526; cv=none; b=LwMSwpsyIVsCoqMNSfvuda8n2TB6ToP2NPB8n9OD8KLRNucle1XIkxk454LQktX9lqsEK0bOPswi9mkLp408GxhCkIIpTw/kQyvlHLiW1SUPhnHXzhbgxipP9PscdzGxftELeUl6Znx+6tmE42yW2w69hrx4Xr58BBM1vnF772Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760526; c=relaxed/simple;
	bh=10m3tKTs6eH3IV9wLa9J4soSVrJii2kwS6PzA8jB5gE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rj/qFkRUOpYMjgNlN56rP4PXWcgj1qtOaWYm7ssecMJiqaXpG3fQeb98hPyueg1KFn1Kx+cTamoeQ4H56RRYV7FpQGwPNzZWeX8a/a5vjIK68gP22h3g8NSTblEEXqr9ex599vEQRo4nN2jdl8RIFH1I02gL4Kd32/3wO7YRtBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UGzPrlch; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B45FC72;
	Tue, 24 Jun 2025 12:21:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750760484;
	bh=10m3tKTs6eH3IV9wLa9J4soSVrJii2kwS6PzA8jB5gE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UGzPrlchUalbFB3iPPWnC00vCAzEEsf3g83vQYF7vb+2P+HmM6v/LrOobliNZLIZr
	 aW3ZK+Q8rKWPxIoyEQhZvXe0ZsEpeD4hhXdsf8LoEPGFfHQ8bY3rPDZzNq2Lq7ONca
	 8f1Yb2Wt/0Fp3yR95HeUai/vUhlPK18vUY6Ray2w=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 24 Jun 2025 11:21:29 +0100
Subject: [PATCH v10 16/17] media: platform: Add mali-c55 parameters video
 node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-c55-v10-16-54f3d4196990@ideasonboard.com>
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
In-Reply-To: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=50948;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=10m3tKTs6eH3IV9wLa9J4soSVrJii2kwS6PzA8jB5gE=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWnwq7wO5iDys7Yr0XL2HEbyh5eO4HSn4NQ3gE
 V3zNLKUJuuJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFp8KgAKCRDISVd6bEV1
 Mho1D/0SAylCDz01UndZK7Z4qqYVPCuJfGvcoYGnVgelEg5K+jIIxun46ww12HcZpSQf/Jb6RbM
 M5bEv3fd6p9Zet72gnBXuq9mRFbQFlerGr+bP9YP5xufC8LOSIunbMU1MuaZqbXTXMuZPqiiSwz
 XzoNDG0SbLuBd/sOd9QyHzqpgMGBOMxirjOHwlV0+k4nGzBBxpGIzksztfmbOPKNn4KmHCIFPA4
 XTrNkxivLT7/PBmnxL4WmnxcJ2B10KHME1vUpdTvpBRnK+5FK/9rPFUD+nDHDffQ43VWj/NcET8
 Oq+qfmqoVDZ9gGXuCLyZRgKQzpn844umZoRUu1ch7tRpaVfdcJMoSdywH6xXMhI5A4vrglwrW/E
 0JWb61Mthhh7brKtmj1RR79+fBrGtOSQ4EQodB25WjbM4aPjef/0FO3vXtHMHaPDo6V93764OgU
 CuaadiNb5BlYsgvu8wEC5L7jO71x8mpx1G1OwjBAcrYO10b83hr6y2Et6o1MUggWvNEco6SJEuT
 ifWTafRrRG3N2Tx/pZSJx0eI84TQDgYXFRStjgrbItr8wY00WE89SEmDWKJQ1hM2/Nb3LjoEe7D
 ycJyT14TfmGyA1hzTCYhCtic13LHywanHRPidXt4M9kezQ8WuVZkVksXQio3buXetRx5Yw23W6W
 cI5GK/Npw+a6A/g==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add a new code file to the mali-c55 driver that registers an output
video node for userspace to queue buffers of parameters to. Handlers
are included to program the statistics generation plus the white
balance, black level correction and mesh shading correction blocks.

Update the rest of the driver to register and link the new video node

Acked-by: Nayden Kanchev  <nayden.kanchev@arm.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v10:

	- Account for v2 of media jobs framework

Changes in v9:

	- Support memory input mode through the media jobs framework
	- Include this video device in the synchronised start/stop across the
	  pipeline

Changes in v8:

	- None

Changes in v7:

	- Swapped to use a distinct struct as the buffer for vb2 so that we
	  didn't have lots of unused fields.
	- Defined a union for easy handling of the different block types
	- Handled the new @flags field instead of the @enabled field in each
	  handler.
	- Copied the userspace buffer to a scratch buffer in the driver for each
	  buffer to protect against userspace modifying it whilst the driver is
	  processing it
	- Validated the buffer from userspace when the buffer is queued rather
	  than processed.
	- Helper function to return all buffers to userspace
	- Stopped the ISP when stream stop is called.

Changes in v6:

	- Used a union to generalise the block pointer rather than resorting to
	  casting everywhere - fantastic idea Sakari, this made it much cleaner.
	- Reworked the loop in mali_c55_params_write_config() so that we can be
	  sure there's remaining space for the next block header.

Changes in v5:

	- New patch
---
 drivers/media/platform/arm/mali-c55/Makefile       |   1 +
 .../media/platform/arm/mali-c55/mali-c55-common.h  |  28 +
 .../media/platform/arm/mali-c55/mali-c55-core.c    |  32 +
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c |  23 +-
 .../media/platform/arm/mali-c55/mali-c55-params.c  | 918 +++++++++++++++++++++
 .../platform/arm/mali-c55/mali-c55-registers.h     | 128 +++
 6 files changed, 1129 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/arm/mali-c55/Makefile b/drivers/media/platform/arm/mali-c55/Makefile
index b5a22d414479dd1eb6435f474cb95aaa14879aa8..d5718b0b23e0ec1ced76837cb7be08df71fc91a7 100644
--- a/drivers/media/platform/arm/mali-c55/Makefile
+++ b/drivers/media/platform/arm/mali-c55/Makefile
@@ -3,6 +3,7 @@
 mali-c55-y := mali-c55-capture.o \
 	      mali-c55-core.o \
 	      mali-c55-isp.o \
+	      mali-c55-params.o \
 	      mali-c55-resizer.o \
 	      mali-c55-stats.o \
 	      mali-c55-tpg.o
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-common.h b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
index 51291ba8d0031918ba472c34b0720f1d5129089e..691ec8a5f1ffdb4a60d28afbbd7a69167858c95a 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-common.h
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
@@ -47,6 +47,7 @@ struct mali_c55;
 struct mali_c55_cap_dev;
 struct media_job;
 struct media_pipeline;
+struct mali_c55_params_buffer;
 struct platform_device;
 struct resource;
 
@@ -55,6 +56,7 @@ enum mali_c55_isp_pads {
 	MALI_C55_ISP_PAD_SOURCE_VIDEO,
 	MALI_C55_ISP_PAD_SOURCE_BYPASS,
 	MALI_C55_ISP_PAD_SOURCE_STATS,
+	MALI_C55_ISP_PAD_SINK_PARAMS,
 	MALI_C55_ISP_NUM_PADS,
 };
 
@@ -172,6 +174,12 @@ struct mali_c55_stats_buf {
 	bool failed;
 };
 
+struct mali_c55_params_buf {
+	struct vb2_v4l2_buffer vb;
+	struct list_head queue;
+	struct mali_c55_params_buffer *config;
+};
+
 struct mali_c55_stats {
 	struct mali_c55 *mali_c55;
 	struct video_device vdev;
@@ -189,6 +197,22 @@ struct mali_c55_stats {
 	} buffers;
 };
 
+struct mali_c55_params {
+	struct mali_c55 *mali_c55;
+	struct video_device vdev;
+	struct vb2_queue queue;
+	struct media_pad pad;
+	/* Mutex to provide to vb2 */
+	struct mutex lock;
+
+	struct {
+		/* Spinlock to guard buffer queue */
+		spinlock_t lock;
+		struct list_head queue;
+		struct list_head pending;
+	} buffers;
+};
+
 enum mali_c55_config_spaces {
 	MALI_C55_CONFIG_PING,
 	MALI_C55_CONFIG_PONG,
@@ -234,6 +258,7 @@ struct mali_c55 {
 	struct mali_c55_isp isp;
 	struct mali_c55_resizer resizers[MALI_C55_NUM_RSZS];
 	struct mali_c55_cap_dev cap_devs[MALI_C55_NUM_CAP_DEVS];
+	struct mali_c55_params params;
 	struct mali_c55_stats stats;
 
 	struct mali_c55_context context;
@@ -265,6 +290,8 @@ int mali_c55_register_capture_devs(struct mali_c55 *mali_c55);
 void mali_c55_unregister_capture_devs(struct mali_c55 *mali_c55);
 int mali_c55_register_stats(struct mali_c55 *mali_c55);
 void mali_c55_unregister_stats(struct mali_c55 *mali_c55);
+int mali_c55_register_params(struct mali_c55 *mali_c55);
+void mali_c55_unregister_params(struct mali_c55 *mali_c55);
 struct mali_c55_context *mali_c55_get_active_context(struct mali_c55 *mali_c55);
 void mali_c55_set_plane_done(struct mali_c55_cap_dev *cap_dev,
 			     enum mali_c55_planes plane);
@@ -284,5 +311,6 @@ mali_c55_isp_get_mbus_config_by_index(u32 index);
 bool mali_c55_pipeline_ready(struct media_pipeline *pipe);
 void mali_c55_stats_fill_buffer(struct mali_c55 *mali_c55,
 				enum mali_c55_config_spaces cfg_space);
+void mali_c55_params_write_config(struct mali_c55 *mali_c55);
 
 #endif /* _MALI_C55_COMMON_H */
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index e3550cb936a78c3d34d59a9b1882c062d4f2c2f6..a3c26f041d4206d605cc9494cd82d6d52ea1dab8 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -388,6 +388,16 @@ static int mali_c55_create_links(struct mali_c55 *mali_c55)
 		goto err_remove_links;
 	}
 
+	ret = media_create_pad_link(&mali_c55->params.vdev.entity, 0,
+				    &mali_c55->isp.sd.entity,
+				    MALI_C55_ISP_PAD_SINK_PARAMS,
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret) {
+		dev_err(mali_c55->dev,
+			"failed to link ISP and parameters video node\n");
+		goto err_remove_links;
+	}
+
 	return 0;
 
 err_remove_links:
@@ -402,6 +412,7 @@ static void mali_c55_unregister_entities(struct mali_c55 *mali_c55)
 	mali_c55_unregister_isp(mali_c55);
 	mali_c55_unregister_resizers(mali_c55);
 	mali_c55_unregister_capture_devs(mali_c55);
+	mali_c55_unregister_params(mali_c55);
 	mali_c55_unregister_stats(mali_c55);
 }
 
@@ -485,6 +496,10 @@ static int mali_c55_register_entities(struct mali_c55 *mali_c55)
 	if (ret)
 		goto err_unregister_entities;
 
+	ret = mali_c55_register_params(mali_c55);
+	if (ret)
+		goto err_unregister_entities;
+
 	ret = mali_c55_register_stats(mali_c55);
 	if (ret)
 		goto err_unregister_entities;
@@ -576,6 +591,7 @@ static int mali_c55_media_frameworks_init(struct mali_c55 *mali_c55)
 		sizeof(mali_c55->media_dev.model));
 
 	media_device_init(&mali_c55->media_dev);
+
 	ret = media_device_register(&mali_c55->media_dev);
 	if (ret)
 		goto err_cleanup_media_device;
@@ -702,6 +718,14 @@ static void __mali_c55_set_next_buffer(struct mali_c55 *mali_c55)
 		mali_c55_set_next_buffer(&mali_c55->cap_devs[MALI_C55_CAP_DEV_DS]);
 }
 
+static void __mali_c55_params_write_config(struct mali_c55 *mali_c55)
+{
+	if (!mali_c55->inline_mode)
+		return;
+
+	mali_c55_params_write_config(mali_c55);
+}
+
 static irqreturn_t mali_c55_isr(int irq, void *context)
 {
 	struct device *dev = context;
@@ -743,6 +767,14 @@ static irqreturn_t mali_c55_isr(int irq, void *context)
 			curr_config >>= ffs(MALI_C55_REG_PING_PONG_READ_MASK) - 1;
 			mali_c55->next_config = curr_config ^ 1;
 
+			/*
+			 * Write the configuration parameters received from
+			 * userspace into the configuration buffer, which will
+			 * be transferred to the 'next' active config space at
+			 * by mali_c55_swap_next_config().
+			 */
+			__mali_c55_params_write_config(mali_c55);
+
 			if (mali_c55->inline_mode) {
 				mali_c55_stats_fill_buffer(mali_c55,
 					mali_c55->next_config ?
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
index b9b2806a5eb302c62ca7c20539551e422293ff36..e19161bb3ba1437d81efefbde9bc8ca7fb476fa2 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
@@ -151,6 +151,7 @@ static int mali_c55_isp_start(struct mali_c55 *mali_c55,
 				 cfg->bypass ? MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK :
 					     0x00);
 
+	mali_c55_params_write_config(mali_c55);
 	ret = mali_c55_config_write(ctx, MALI_C55_CONFIG_PING, true);
 	if (ret) {
 		dev_err(mali_c55->dev, "failed to write ISP config\n");
@@ -516,12 +517,19 @@ static int mali_c55_isp_init_state(struct v4l2_subdev *sd,
 
 	src_fmt = v4l2_subdev_state_get_format(state,
 					       MALI_C55_ISP_PAD_SOURCE_STATS);
+	sink_fmt = v4l2_subdev_state_get_format(state,
+						MALI_C55_ISP_PAD_SINK_PARAMS);
 
 	src_fmt->width = 0;
 	src_fmt->height = 0;
 	src_fmt->field = V4L2_FIELD_NONE;
 	src_fmt->code = MEDIA_BUS_FMT_METADATA_FIXED;
 
+	sink_fmt->width = 0;
+	sink_fmt->height = 0;
+	sink_fmt->field = V4L2_FIELD_NONE;
+	sink_fmt->code = MEDIA_BUS_FMT_METADATA_FIXED;
+
 	return 0;
 }
 
@@ -529,8 +537,20 @@ static const struct v4l2_subdev_internal_ops mali_c55_isp_internal_ops = {
 	.init_state = mali_c55_isp_init_state,
 };
 
+static int mali_c55_subdev_link_validate(struct media_link *link)
+{
+	/*
+	 * Skip validation for the parameters sink pad, as the source is not
+	 * a subdevice.
+	 */
+	if (link->sink->index == MALI_C55_ISP_PAD_SINK_PARAMS)
+		return 0;
+
+	return v4l2_subdev_link_validate(link);
+}
+
 static const struct media_entity_operations mali_c55_isp_media_ops = {
-	.link_validate		= v4l2_subdev_link_validate,
+	.link_validate		= mali_c55_subdev_link_validate,
 	.pipeline_started	= mali_c55_pipeline_started,
 	.pipeline_stopped	= mali_c55_pipeline_stopped,
 };
@@ -620,6 +640,7 @@ int mali_c55_register_isp(struct mali_c55 *mali_c55)
 	isp->pads[MALI_C55_ISP_PAD_SOURCE_VIDEO].flags = MEDIA_PAD_FL_SOURCE;
 	isp->pads[MALI_C55_ISP_PAD_SOURCE_BYPASS].flags = MEDIA_PAD_FL_SOURCE;
 	isp->pads[MALI_C55_ISP_PAD_SOURCE_STATS].flags = MEDIA_PAD_FL_SOURCE;
+	isp->pads[MALI_C55_ISP_PAD_SINK_PARAMS].flags = MEDIA_PAD_FL_SINK;
 
 	ret = media_entity_pads_init(&sd->entity, MALI_C55_ISP_NUM_PADS,
 				     isp->pads);
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
new file mode 100644
index 0000000000000000000000000000000000000000..60846b438c99bfd1ea1958f56ca3ac813001c97a
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -0,0 +1,918 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ARM Mali-C55 ISP Driver - Configuration parameters output device
+ *
+ * Copyright (C) 2024 Ideas on Board Oy
+ */
+#include <linux/media/arm/mali-c55-config.h>
+#include <linux/pm_runtime.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "mali-c55-common.h"
+#include "mali-c55-registers.h"
+
+/**
+ * union mali_c55_params_block - Generalisation of a parameter block
+ *
+ * This union allows the driver to treat a block as a generic pointer to this
+ * union and safely access the header and block-specific struct without having
+ * to resort to casting. The header member is accessed first, and the type field
+ * checked which allows the driver to determine which of the other members
+ * should be used. The data member at the end allows a pointer to an address
+ * within the data member of :c:type:`mali_c55_params_buffer` to initialise a
+ * union variable.
+ *
+ * @header:		Pointer to the shared header struct embedded as the
+ *			first member of all the possible other members (except
+ *			@data). This member would be accessed first and the type
+ *			field checked to determine which of the other members
+ *			should be accessed.
+ * @sensor_offs:	For header->type == MALI_C55_PARAM_BLOCK_SENSOR_OFFS
+ * @aexp_hist:		For header->type == MALI_C55_PARAM_BLOCK_AEXP_HIST and
+ *			header->type == MALI_C55_PARAM_BLOCK_AEXP_IHIST
+ * @aexp_weights:	For header->type == MALI_C55_PARAM_BLOCK_AEXP_HIST_WEIGHTS
+ *			and header->type =  MALI_C55_PARAM_BLOCK_AEXP_IHIST_WEIGHTS
+ * @digital_gain:	For header->type == MALI_C55_PARAM_BLOCK_DIGITAL_GAIN
+ * @awb_gains:		For header->type == MALI_C55_PARAM_BLOCK_AWB_GAINS and
+ *			header->type = MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP
+ * @awb_config:		For header->type == MALI_C55_PARAM_MESH_SHADING_CONFIG
+ * @shading_config:	For header->type == MALI_C55_PARAM_MESH_SHADING_SELECTION
+ * @shading_selection:	For header->type == MALI_C55_PARAM_BLOCK_SENSOR_OFFS
+ * @data:		Allows easy initialisation of a union variable with a
+ *			pointer into a __u8 array.
+ */
+union mali_c55_params_block {
+	struct mali_c55_params_block_header *header;
+	struct mali_c55_params_sensor_off_preshading *sensor_offs;
+	struct mali_c55_params_aexp_hist *aexp_hist;
+	struct mali_c55_params_aexp_weights *aexp_weights;
+	struct mali_c55_params_digital_gain *digital_gain;
+	struct mali_c55_params_awb_gains *awb_gains;
+	struct mali_c55_params_awb_config *awb_config;
+	struct mali_c55_params_mesh_shading_config *shading_config;
+	struct mali_c55_params_mesh_shading_selection *shading_selection;
+	__u8 *data;
+};
+
+typedef void (*mali_c55_block_handler)(struct mali_c55 *mali_c55,
+				       union mali_c55_params_block block);
+
+struct mali_c55_block_handler {
+	size_t size;
+	mali_c55_block_handler handler;
+};
+
+#define to_mali_c55_params_buf(vbuf) \
+	container_of(vbuf, struct mali_c55_params_buf, vb)
+
+static void mali_c55_params_sensor_offs(struct mali_c55 *mali_c55,
+					union mali_c55_params_block block)
+{
+	struct mali_c55_params_sensor_off_preshading *p = block.sensor_offs;
+	__u32 global_offset;
+
+	if (block.header->flags & MALI_C55_PARAM_BLOCK_FL_DISABLED) {
+		mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BYPASS_3,
+			MALI_C55_REG_BYPASS_3_SENSOR_OFFSET_PRE_SH,
+			MALI_C55_REG_BYPASS_3_SENSOR_OFFSET_PRE_SH);
+		return;
+	}
+
+	if (!(p->chan00 || p->chan01 || p->chan10 || p->chan11))
+		return;
+
+	mali_c55_ctx_write(mali_c55, MALI_C55_REG_SENSOR_OFF_PRE_SHA_00,
+			   p->chan00 & MALI_C55_SENSOR_OFF_PRE_SHA_MASK);
+	mali_c55_ctx_write(mali_c55, MALI_C55_REG_SENSOR_OFF_PRE_SHA_01,
+			   p->chan01 & MALI_C55_SENSOR_OFF_PRE_SHA_MASK);
+	mali_c55_ctx_write(mali_c55, MALI_C55_REG_SENSOR_OFF_PRE_SHA_10,
+			   p->chan10 & MALI_C55_SENSOR_OFF_PRE_SHA_MASK);
+	mali_c55_ctx_write(mali_c55, MALI_C55_REG_SENSOR_OFF_PRE_SHA_11,
+			   p->chan11 & MALI_C55_SENSOR_OFF_PRE_SHA_MASK);
+
+	/*
+	 * The average offset is applied as a global offset for the digital
+	 * gain block
+	 */
+	global_offset = (p->chan00 + p->chan01 + p->chan10 + p->chan11) >> 2;
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_DIGITAL_GAIN_OFFSET,
+				 MALI_C55_DIGITAL_GAIN_OFFSET_MASK,
+				 global_offset);
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BYPASS_3,
+				 MALI_C55_REG_BYPASS_3_SENSOR_OFFSET_PRE_SH,
+				 0x00);
+}
+
+static void mali_c55_params_aexp_hist(struct mali_c55 *mali_c55,
+				      union mali_c55_params_block block)
+{
+	u32 disable_mask;
+	u32 disable_val;
+	u32 base;
+
+	if (block.header->type == MALI_C55_PARAM_BLOCK_AEXP_HIST) {
+		disable_mask = MALI_C55_AEXP_HIST_DISABLE_MASK;
+		disable_val = MALI_C55_AEXP_HIST_DISABLE;
+		base = MALI_C55_REG_AEXP_HIST_BASE;
+	} else {
+		disable_mask = MALI_C55_AEXP_IHIST_DISABLE_MASK;
+		disable_val = MALI_C55_AEXP_IHIST_DISABLE;
+		base = MALI_C55_REG_AEXP_IHIST_BASE;
+	}
+	struct mali_c55_params_aexp_hist *params = block.aexp_hist;
+
+	if (block.header->flags & MALI_C55_PARAM_BLOCK_FL_DISABLED) {
+		mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
+					 disable_mask, disable_val);
+		return;
+	}
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
+				 disable_mask, false);
+
+	mali_c55_ctx_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_SKIP_OFFSET,
+				 MALI_C55_AEXP_HIST_SKIP_X_MASK, params->skip_x);
+	mali_c55_ctx_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_SKIP_OFFSET,
+				 MALI_C55_AEXP_HIST_OFFSET_X_MASK,
+				 MALI_C55_AEXP_HIST_OFFSET_X(params->offset_x));
+	mali_c55_ctx_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_SKIP_OFFSET,
+				 MALI_C55_AEXP_HIST_SKIP_Y_MASK,
+				 MALI_C55_AEXP_HIST_SKIP_Y(params->skip_y));
+	mali_c55_ctx_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_SKIP_OFFSET,
+				 MALI_C55_AEXP_HIST_OFFSET_Y_MASK,
+				 MALI_C55_AEXP_HIST_OFFSET_Y(params->offset_y));
+
+	mali_c55_ctx_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_SCALE_OFFSET,
+				 MALI_C55_AEXP_HIST_SCALE_BOTTOM_MASK,
+				 params->scale_bottom);
+	mali_c55_ctx_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_SCALE_OFFSET,
+				 MALI_C55_AEXP_HIST_SCALE_TOP_MASK,
+				 MALI_C55_AEXP_HIST_SCALE_TOP(params->scale_top));
+
+	mali_c55_ctx_update_bits(mali_c55, base + MALI_C55_AEXP_HIST_PLANE_MODE_OFFSET,
+				 MALI_C55_AEXP_HIST_PLANE_MODE_MASK,
+				 params->plane_mode);
+
+	if (block.header->type == MALI_C55_PARAM_BLOCK_AEXP_HIST)
+		mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
+					 MALI_C55_AEXP_HIST_SWITCH_MASK,
+					 MALI_C55_AEXP_HIST_SWITCH(params->tap_point));
+}
+
+static void
+mali_c55_params_aexp_hist_weights(struct mali_c55 *mali_c55,
+				  union mali_c55_params_block block)
+{
+	struct mali_c55_params_aexp_weights *params = block.aexp_weights;
+	u32 base;
+
+	if (block.header->flags & MALI_C55_PARAM_BLOCK_FL_DISABLED)
+		return;
+
+	base = block.header->type == MALI_C55_PARAM_BLOCK_AEXP_HIST_WEIGHTS ?
+				      MALI_C55_REG_AEXP_HIST_BASE :
+				      MALI_C55_REG_AEXP_IHIST_BASE;
+
+	mali_c55_ctx_update_bits(mali_c55,
+				 base + MALI_C55_AEXP_HIST_NODES_USED_OFFSET,
+				 MALI_C55_AEXP_HIST_NODES_USED_HORIZ_MASK,
+				 params->nodes_used_horiz);
+	mali_c55_ctx_update_bits(mali_c55,
+				 base + MALI_C55_AEXP_HIST_NODES_USED_OFFSET,
+				 MALI_C55_AEXP_HIST_NODES_USED_VERT_MASK,
+				 MALI_C55_AEXP_HIST_NODES_USED_VERT(params->nodes_used_vert));
+
+	/*
+	 * The zone weights array is a 225-element array of u8 values, but that
+	 * is a bit annoying to handle given the ISP expects 32-bit writes. We
+	 * just reinterpret it as a 57-element array of 32-bit values for the
+	 * purposes of this transaction (the 3 bytes of additional space at the
+	 * end of the write is just padding for the array of weights in the ISP
+	 * memory space anyway, so there's no risk of overwriting other
+	 * registers).
+	 */
+	for (unsigned int i = 0; i < 57; i++) {
+		u32 val = ((u32 *)params->zone_weights)[i]
+			    & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK;
+		u32 addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);
+
+		mali_c55_ctx_write(mali_c55, addr, val);
+	}
+}
+
+static void mali_c55_params_digital_gain(struct mali_c55 *mali_c55,
+					 union mali_c55_params_block block)
+{
+	struct mali_c55_params_digital_gain *dgain = block.digital_gain;
+	u32 gain;
+
+	/*
+	 * If the block is flagged as disabled we write a gain of 1.0, which in
+	 * Q5.8 format is 256.
+	 */
+	gain = block.header->flags & MALI_C55_PARAM_BLOCK_FL_DISABLED ?
+	       256 : dgain->gain;
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_DIGITAL_GAIN,
+				 MALI_C55_DIGITAL_GAIN_MASK,
+				 gain);
+}
+
+static void mali_c55_params_awb_gains(struct mali_c55 *mali_c55,
+				      union mali_c55_params_block block)
+{
+	struct mali_c55_params_awb_gains *gains = block.awb_gains;
+	u32 gain00, gain01, gain10, gain11;
+
+	/*
+	 * There are two places AWB gains can be set in the ISP; one affects the
+	 * image output data and the other affects the statistics for the
+	 * AEXP-0 tap point.
+	 */
+	u32 addr1 = block.header->type == MALI_C55_PARAM_BLOCK_AWB_GAINS ?
+					   MALI_C55_REG_AWB_GAINS1 :
+					   MALI_C55_REG_AWB_GAINS1_AEXP;
+	u32 addr2 = block.header->type == MALI_C55_PARAM_BLOCK_AWB_GAINS ?
+					   MALI_C55_REG_AWB_GAINS2 :
+					   MALI_C55_REG_AWB_GAINS2_AEXP;
+
+	/* If the block is flagged disabled, set all of the gains to 1.0 */
+	if (block.header->flags & MALI_C55_PARAM_BLOCK_FL_DISABLED) {
+		gain00 = 256;
+		gain01 = 256;
+		gain10 = 256;
+		gain11 = 256;
+	} else {
+		gain00 = gains->gain00;
+		gain01 = gains->gain01;
+		gain10 = gains->gain10;
+		gain11 = gains->gain11;
+	}
+
+	mali_c55_ctx_update_bits(mali_c55, addr1, MALI_C55_AWB_GAIN00_MASK,
+				 gain00);
+	mali_c55_ctx_update_bits(mali_c55, addr1, MALI_C55_AWB_GAIN01_MASK,
+				 MALI_C55_AWB_GAIN01(gain01));
+	mali_c55_ctx_update_bits(mali_c55, addr2, MALI_C55_AWB_GAIN10_MASK,
+				 gain10);
+	mali_c55_ctx_update_bits(mali_c55, addr2, MALI_C55_AWB_GAIN11_MASK,
+				 MALI_C55_AWB_GAIN11(gain11));
+}
+
+static void mali_c55_params_awb_config(struct mali_c55 *mali_c55,
+				       union mali_c55_params_block block)
+{
+	struct mali_c55_params_awb_config *params = block.awb_config;
+
+	if (block.header->flags & MALI_C55_PARAM_BLOCK_FL_DISABLED) {
+		mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
+					 MALI_C55_AWB_DISABLE_MASK,
+					 MALI_C55_AWB_DISABLE_MASK);
+		return;
+	}
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
+				 MALI_C55_AWB_DISABLE_MASK, false);
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_STATS_MODE,
+				 MALI_C55_AWB_STATS_MODE_MASK, params->stats_mode);
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_WHITE_LEVEL,
+				 MALI_C55_AWB_WHITE_LEVEL_MASK, params->white_level);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_BLACK_LEVEL,
+				 MALI_C55_AWB_BLACK_LEVEL_MASK, params->black_level);
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_CR_MAX,
+				 MALI_C55_AWB_CR_MAX_MASK, params->cr_max);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_CR_MIN,
+				 MALI_C55_AWB_CR_MIN_MASK, params->cr_min);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_CB_MAX,
+				 MALI_C55_AWB_CB_MAX_MASK, params->cb_max);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_CB_MIN,
+				 MALI_C55_AWB_CB_MIN_MASK, params->cb_min);
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_NODES_USED,
+				 MALI_C55_AWB_NODES_USED_HORIZ_MASK,
+				 params->nodes_used_horiz);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_NODES_USED,
+				 MALI_C55_AWB_NODES_USED_VERT_MASK,
+				 MALI_C55_AWB_NODES_USED_VERT(params->nodes_used_vert));
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_CR_HIGH,
+				 MALI_C55_AWB_CR_HIGH_MASK, params->cr_high);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_CR_LOW,
+				 MALI_C55_AWB_CR_LOW_MASK, params->cr_low);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_CB_HIGH,
+				 MALI_C55_AWB_CB_HIGH_MASK, params->cb_high);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_AWB_CB_LOW,
+				 MALI_C55_AWB_CB_LOW_MASK, params->cb_low);
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_METERING_CONFIG,
+				 MALI_C55_AWB_SWITCH_MASK,
+				 MALI_C55_AWB_SWITCH(params->tap_point));
+}
+
+static void mali_c55_params_lsc_config(struct mali_c55 *mali_c55,
+				       union mali_c55_params_block block)
+{
+	struct mali_c55_params_mesh_shading_config *params = block.shading_config;
+	unsigned int i;
+	u32 addr;
+
+	if (block.header->flags & MALI_C55_PARAM_BLOCK_FL_DISABLED) {
+		mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
+					 MALI_C55_MESH_SHADING_ENABLE_MASK,
+					 false);
+		return;
+	}
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
+				 MALI_C55_MESH_SHADING_ENABLE_MASK, true);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
+				 MALI_C55_MESH_SHADING_MESH_SHOW_MASK,
+				 MALI_C55_MESH_SHADING_MESH_SHOW(params->mesh_show));
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
+				 MALI_C55_MESH_SHADING_SCALE_MASK,
+				 MALI_C55_MESH_SHADING_SCALE(params->mesh_scale));
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
+				 MALI_C55_MESH_SHADING_PAGE_R_MASK,
+				 MALI_C55_MESH_SHADING_PAGE_R(params->mesh_page_r));
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
+				 MALI_C55_MESH_SHADING_PAGE_G_MASK,
+				 MALI_C55_MESH_SHADING_PAGE_G(params->mesh_page_g));
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
+				 MALI_C55_MESH_SHADING_PAGE_B_MASK,
+				 MALI_C55_MESH_SHADING_PAGE_B(params->mesh_page_b));
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
+				 MALI_C55_MESH_SHADING_MESH_WIDTH_MASK,
+				 MALI_C55_MESH_SHADING_MESH_WIDTH(params->mesh_width));
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_CONFIG,
+				 MALI_C55_MESH_SHADING_MESH_HEIGHT_MASK,
+				 MALI_C55_MESH_SHADING_MESH_HEIGHT(params->mesh_height));
+
+	for (i = 0; i < MALI_C55_NUM_MESH_SHADING_ELEMENTS; i++) {
+		addr = MALI_C55_REG_MESH_SHADING_TABLES + (i * 4);
+		mali_c55_ctx_write(mali_c55, addr, params->mesh[i]);
+	}
+}
+
+static void mali_c55_params_lsc_selection(struct mali_c55 *mali_c55,
+					  union mali_c55_params_block block)
+{
+	struct mali_c55_params_mesh_shading_selection *params =
+		block.shading_selection;
+
+	if (block.header->flags & MALI_C55_PARAM_BLOCK_FL_DISABLED)
+		return;
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_ALPHA_BANK,
+				 MALI_C55_MESH_SHADING_ALPHA_BANK_R_MASK,
+				 params->mesh_alpha_bank_r);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_ALPHA_BANK,
+				 MALI_C55_MESH_SHADING_ALPHA_BANK_G_MASK,
+				 MALI_C55_MESH_SHADING_ALPHA_BANK_G(params->mesh_alpha_bank_g));
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_ALPHA_BANK,
+				 MALI_C55_MESH_SHADING_ALPHA_BANK_B_MASK,
+				 MALI_C55_MESH_SHADING_ALPHA_BANK_B(params->mesh_alpha_bank_b));
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_ALPHA,
+				 MALI_C55_MESH_SHADING_ALPHA_R_MASK,
+				 params->mesh_alpha_r);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_ALPHA,
+				 MALI_C55_MESH_SHADING_ALPHA_G_MASK,
+				 MALI_C55_MESH_SHADING_ALPHA_G(params->mesh_alpha_g));
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_MESH_SHADING_ALPHA,
+				 MALI_C55_MESH_SHADING_ALPHA_B_MASK,
+				 MALI_C55_MESH_SHADING_ALPHA_B(params->mesh_alpha_b));
+
+	mali_c55_ctx_update_bits(mali_c55,
+				 MALI_C55_REG_MESH_SHADING_MESH_STRENGTH,
+				 MALI_c55_MESH_STRENGTH_MASK,
+				 params->mesh_strength);
+}
+
+static const struct mali_c55_block_handler mali_c55_block_handlers[] = {
+	[MALI_C55_PARAM_BLOCK_SENSOR_OFFS] = {
+		.size = sizeof(struct mali_c55_params_sensor_off_preshading),
+		.handler = &mali_c55_params_sensor_offs,
+	},
+	[MALI_C55_PARAM_BLOCK_AEXP_HIST] = {
+		.size = sizeof(struct mali_c55_params_aexp_hist),
+		.handler = &mali_c55_params_aexp_hist,
+	},
+	[MALI_C55_PARAM_BLOCK_AEXP_IHIST] = {
+		.size = sizeof(struct mali_c55_params_aexp_hist),
+		.handler = &mali_c55_params_aexp_hist,
+	},
+	[MALI_C55_PARAM_BLOCK_AEXP_HIST_WEIGHTS] = {
+		.size = sizeof(struct mali_c55_params_aexp_weights),
+		.handler = &mali_c55_params_aexp_hist_weights,
+	},
+	[MALI_C55_PARAM_BLOCK_AEXP_IHIST_WEIGHTS] = {
+		.size = sizeof(struct mali_c55_params_aexp_weights),
+		.handler = &mali_c55_params_aexp_hist_weights,
+	},
+	[MALI_C55_PARAM_BLOCK_DIGITAL_GAIN] = {
+		.size = sizeof(struct mali_c55_params_digital_gain),
+		.handler = &mali_c55_params_digital_gain,
+	},
+	[MALI_C55_PARAM_BLOCK_AWB_GAINS] = {
+		.size = sizeof(struct mali_c55_params_awb_gains),
+		.handler = &mali_c55_params_awb_gains,
+	},
+	[MALI_C55_PARAM_BLOCK_AWB_CONFIG] = {
+		.size = sizeof(struct mali_c55_params_awb_config),
+		.handler = &mali_c55_params_awb_config,
+	},
+	[MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP] = {
+		.size = sizeof(struct mali_c55_params_awb_gains),
+		.handler = &mali_c55_params_awb_gains,
+	},
+	[MALI_C55_PARAM_MESH_SHADING_CONFIG] = {
+		.size = sizeof(struct mali_c55_params_mesh_shading_config),
+		.handler = &mali_c55_params_lsc_config,
+	},
+	[MALI_C55_PARAM_MESH_SHADING_SELECTION] = {
+		.size = sizeof(struct mali_c55_params_mesh_shading_selection),
+		.handler = &mali_c55_params_lsc_selection,
+	},
+};
+
+static int mali_c55_params_enum_fmt_meta_out(struct file *file, void *fh,
+					     struct v4l2_fmtdesc *f)
+{
+	if (f->index)
+		return -EINVAL;
+
+	if (f->mbus_code && f->mbus_code != MEDIA_BUS_FMT_METADATA_FIXED)
+		return -EINVAL;
+
+	f->pixelformat = V4L2_META_FMT_MALI_C55_PARAMS;
+
+	return 0;
+}
+
+static int mali_c55_params_g_fmt_meta_out(struct file *file, void *fh,
+					  struct v4l2_format *f)
+{
+	static const struct v4l2_meta_format mfmt = {
+		.dataformat = V4L2_META_FMT_MALI_C55_PARAMS,
+		.buffersize = sizeof(struct mali_c55_params_buffer),
+	};
+
+	f->fmt.meta = mfmt;
+
+	return 0;
+}
+
+static int mali_c55_params_querycap(struct file *file,
+				    void *priv, struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, MALI_C55_DRIVER_NAME, sizeof(cap->driver));
+	strscpy(cap->card, "ARM Mali-C55 ISP", sizeof(cap->card));
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops mali_c55_params_v4l2_ioctl_ops = {
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_enum_fmt_meta_out = mali_c55_params_enum_fmt_meta_out,
+	.vidioc_g_fmt_meta_out = mali_c55_params_g_fmt_meta_out,
+	.vidioc_s_fmt_meta_out = mali_c55_params_g_fmt_meta_out,
+	.vidioc_try_fmt_meta_out = mali_c55_params_g_fmt_meta_out,
+	.vidioc_querycap = mali_c55_params_querycap,
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static const struct v4l2_file_operations mali_c55_params_v4l2_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = video_ioctl2,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.poll = vb2_fop_poll,
+	.mmap = vb2_fop_mmap,
+};
+
+static int
+mali_c55_params_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
+			    unsigned int *num_planes, unsigned int sizes[],
+			    struct device *alloc_devs[])
+{
+	if (*num_planes && *num_planes > 1)
+		return -EINVAL;
+
+	if (sizes[0] && sizes[0] < sizeof(struct mali_c55_params_buffer))
+		return -EINVAL;
+
+	*num_planes = 1;
+
+	if (!sizes[0])
+		sizes[0] = sizeof(struct mali_c55_params_buffer);
+
+	return 0;
+}
+
+static int mali_c55_params_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
+
+	buf->config = kvmalloc(sizeof(*buf->config), GFP_KERNEL);
+	if (!buf->config)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void mali_c55_params_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
+
+	kvfree(buf->config);
+	buf->config = NULL;
+}
+
+static void mali_c55_params_buf_queue(struct vb2_buffer *vb)
+{
+	struct mali_c55_params *params = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
+	struct mali_c55 *mali_c55 = params->mali_c55;
+	struct mali_c55_params_buffer *config;
+	struct list_head *queue;
+	size_t block_offset = 0;
+	size_t max_offset;
+
+	/*
+	 * Before accepting the buffer we should check that the data within it
+	 * is valid.
+	 */
+	config = vb2_plane_vaddr(vb, 0);
+
+	if (config->total_size > MALI_C55_PARAMS_MAX_SIZE) {
+		dev_dbg(mali_c55->dev, "Invalid parameters buffer size %u\n",
+			config->total_size);
+		goto err_buffer_done;
+	}
+
+	/* Currently only v1 is supported */
+	if (config->version != MALI_C55_PARAM_BUFFER_V1) {
+		dev_dbg(mali_c55->dev, "Invalid parameters version\n");
+		goto err_buffer_done;
+	}
+
+	max_offset = config->total_size - sizeof(struct mali_c55_params_block_header);
+	while (block_offset < max_offset) {
+		const struct mali_c55_block_handler *block_handler;
+		union mali_c55_params_block block;
+
+		block = (union mali_c55_params_block)
+			 &config->data[block_offset];
+
+		if (block.header->type >= ARRAY_SIZE(mali_c55_block_handlers)) {
+			dev_dbg(mali_c55->dev, "Invalid parameters block type\n");
+			goto err_buffer_done;
+		}
+
+		if (block_offset + block.header->size > config->total_size) {
+			dev_dbg(mali_c55->dev, "Parameters block too large\n");
+			goto err_buffer_done;
+		}
+
+		block_handler = &mali_c55_block_handlers[block.header->type];
+
+		/*
+		 * Userspace can optionally omit all but the header of a block
+		 * if it only intends to disable the block.
+		 */
+		if (block.header->size != block_handler->size &&
+		    block.header->size != sizeof(*block.header)) {
+			dev_dbg(mali_c55->dev, "Invalid parameters block size\n");
+			goto err_buffer_done;
+		}
+
+		block_offset += block.header->size;
+	}
+
+	vb2_set_plane_payload(vb, 0, sizeof(struct mali_c55_params_buffer));
+
+	/*
+	 * Copy the parameters buffer provided by userspace to the internal
+	 * scratch buffer. This protects against the chance of userspace making
+	 * changed to the buffer content whilst the driver processes it.
+	 */
+	memcpy(buf->config, config, sizeof(*config));
+
+	queue = mali_c55->inline_mode ? &params->buffers.queue :
+					&params->buffers.pending;
+
+	spin_lock(&params->buffers.lock);
+	list_add_tail(&buf->queue, queue);
+	spin_unlock(&params->buffers.lock);
+
+	media_jobs_try_queue_job(mali_c55->sched, MEDIA_JOB_TYPE_PIPELINE_PULSE);
+
+	return;
+
+err_buffer_done:
+	vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
+}
+
+static void mali_c55_params_return_buffers(struct mali_c55_params *params,
+					   enum vb2_buffer_state state)
+{
+	struct mali_c55_params_buf *buf, *tmp;
+
+	guard(spinlock)(&params->buffers.lock);
+
+	list_for_each_entry_safe(buf, tmp, &params->buffers.queue, queue) {
+		list_del(&buf->queue);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+
+	list_for_each_entry_safe(buf, tmp, &params->buffers.pending, queue) {
+		list_del(&buf->queue);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+}
+
+static int mali_c55_params_start_streaming(struct vb2_queue *q,
+					   unsigned int count)
+{
+	struct mali_c55_params *params = vb2_get_drv_priv(q);
+	struct mali_c55 *mali_c55 = params->mali_c55;
+	struct media_pipeline *pipe;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(mali_c55->dev);
+	if (ret)
+		goto err_return_buffers;
+
+	ret = video_device_pipeline_alloc_start(&params->vdev);
+	if (ret)
+		goto err_pm_put;
+
+	pipe = video_device_pipeline(&params->vdev);
+	if (mali_c55_pipeline_ready(pipe)) {
+		ret = media_pipeline_started(pipe);
+		if (ret)
+			goto err_stop_pipeline;
+
+		media_jobs_run_jobs(params->mali_c55->sched);
+	}
+
+	return 0;
+
+err_stop_pipeline:
+	video_device_pipeline_stop(&params->vdev);
+err_pm_put:
+	pm_runtime_put(mali_c55->dev);
+err_return_buffers:
+	mali_c55_params_return_buffers(params, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+static void mali_c55_params_stop_streaming(struct vb2_queue *q)
+{
+	struct mali_c55_params *params = vb2_get_drv_priv(q);
+	struct media_pipeline *pipe;
+
+	pipe = video_device_pipeline(&params->vdev);
+	if (mali_c55_pipeline_ready(pipe)) {
+		media_pipeline_stopped(pipe);
+		media_jobs_cancel_jobs(params->mali_c55->sched);
+	}
+
+	video_device_pipeline_stop(&params->vdev);
+	mali_c55_params_return_buffers(params, VB2_BUF_STATE_ERROR);
+}
+
+static const struct vb2_ops mali_c55_params_vb2_ops = {
+	.queue_setup = mali_c55_params_queue_setup,
+	.buf_init = mali_c55_params_buf_init,
+	.buf_cleanup = mali_c55_params_buf_cleanup,
+	.buf_queue = mali_c55_params_buf_queue,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.start_streaming = mali_c55_params_start_streaming,
+	.stop_streaming = mali_c55_params_stop_streaming,
+};
+
+static bool mali_c55_params_job_ready(void *data)
+{
+	struct mali_c55_params *params = data;
+
+	if (IS_ERR_OR_NULL(media_pad_remote_pad_unique(&params->pad)))
+		return true;
+
+	guard(spinlock)(&params->buffers.lock);
+
+	if (list_empty(&params->buffers.pending))
+		return false;
+
+	return true;
+}
+
+static void mali_c55_params_job_queue(void *data)
+{
+	struct mali_c55_params *params = data;
+	struct mali_c55_params_buf *buf;
+
+	if (IS_ERR_OR_NULL(media_pad_remote_pad_unique(&params->pad)))
+		return;
+
+	guard(spinlock)(&params->buffers.lock);
+	buf = list_first_entry(&params->buffers.pending,
+			       struct mali_c55_params_buf, queue);
+	list_move_tail(&buf->queue, &params->buffers.queue);
+}
+
+static void mali_c55_params_job_abort(void *data)
+{
+	struct mali_c55_params *params = data;
+	struct mali_c55_params_buf *buf;
+
+	guard(spinlock)(&params->buffers.lock);
+	buf = list_last_entry(&params->buffers.queue,
+			      struct mali_c55_params_buf, queue);
+
+	if (buf)
+		list_move(&buf->queue, &params->buffers.pending);
+}
+
+static void mali_c55_params_run_step(void *data)
+{
+	struct mali_c55_params *params = data;
+	struct mali_c55 *mali_c55 = params->mali_c55;
+
+	mali_c55_params_write_config(mali_c55);
+}
+
+static int mali_c55_params_job_add_steps(struct media_job *job, void *data)
+{
+	return media_jobs_add_job_step(job, mali_c55_params_run_step, data,
+				       MEDIA_JOBS_FL_STEP_FROM_FRONT, 0);
+}
+
+static struct media_job_contributor_ops mali_c55_params_media_job_ops = {
+	.add_steps	= mali_c55_params_job_add_steps,
+	.ready		= mali_c55_params_job_ready,
+	.queue		= mali_c55_params_job_queue,
+	.abort		= mali_c55_params_job_abort
+};
+
+void mali_c55_params_write_config(struct mali_c55 *mali_c55)
+{
+	struct mali_c55_params *params = &mali_c55->params;
+	struct mali_c55_params_buffer *config;
+	struct mali_c55_params_buf *buf;
+	size_t block_offset = 0;
+	size_t max_offset;
+
+	spin_lock(&params->buffers.lock);
+
+	buf = list_first_entry_or_null(&params->buffers.queue,
+				       struct mali_c55_params_buf, queue);
+	if (buf)
+		list_del(&buf->queue);
+	spin_unlock(&params->buffers.lock);
+
+	if (!buf)
+		return;
+
+	buf->vb.sequence = mali_c55->isp.frame_sequence;
+	config = buf->config;
+
+	max_offset = config->total_size - sizeof(struct mali_c55_params_block_header);
+
+	/*
+	 * Walk the list of parameter blocks and process them. No validation is
+	 * done here, as the contents of the config buffer are already checked
+	 * when the buffer is queued.
+	 */
+	while (block_offset < max_offset) {
+		const struct mali_c55_block_handler *block_handler;
+		union mali_c55_params_block block;
+
+		block = (union mali_c55_params_block)
+			 &config->data[block_offset];
+
+		/* We checked the array index already in .buf_queue() */
+		block_handler = &mali_c55_block_handlers[block.header->type];
+		block_handler->handler(mali_c55, block);
+
+		block_offset += block.header->size;
+	}
+
+	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+}
+
+void mali_c55_unregister_params(struct mali_c55 *mali_c55)
+{
+	struct mali_c55_params *params = &mali_c55->params;
+
+	if (!video_is_registered(&params->vdev))
+		return;
+
+	vb2_video_unregister_device(&params->vdev);
+	media_entity_cleanup(&params->vdev.entity);
+	mutex_destroy(&params->lock);
+}
+
+int mali_c55_register_params(struct mali_c55 *mali_c55)
+{
+	struct mali_c55_params *params = &mali_c55->params;
+	struct video_device *vdev = &params->vdev;
+	struct vb2_queue *vb2q = &params->queue;
+	int ret;
+
+	mutex_init(&params->lock);
+	INIT_LIST_HEAD(&params->buffers.queue);
+	INIT_LIST_HEAD(&params->buffers.pending);
+	spin_lock_init(&params->buffers.lock);
+
+	params->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&params->vdev.entity, 1, &params->pad);
+	if (ret)
+		goto err_destroy_mutex;
+
+	vb2q->type = V4L2_BUF_TYPE_META_OUTPUT;
+	vb2q->io_modes = VB2_MMAP | VB2_DMABUF;
+	vb2q->drv_priv = params;
+	vb2q->mem_ops = &vb2_dma_contig_memops;
+	vb2q->ops = &mali_c55_params_vb2_ops;
+	vb2q->buf_struct_size = sizeof(struct mali_c55_params_buf);
+	vb2q->min_queued_buffers = 1;
+	vb2q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	vb2q->lock = &params->lock;
+	vb2q->dev = mali_c55->dev;
+
+	ret = vb2_queue_init(vb2q);
+	if (ret) {
+		dev_err(mali_c55->dev, "params vb2 queue init failed\n");
+		goto err_cleanup_entity;
+	}
+
+	strscpy(params->vdev.name, "mali-c55 3a params",
+		sizeof(params->vdev.name));
+	vdev->release = video_device_release_empty;
+	vdev->fops = &mali_c55_params_v4l2_fops;
+	vdev->ioctl_ops = &mali_c55_params_v4l2_ioctl_ops;
+	vdev->lock = &params->lock;
+	vdev->v4l2_dev = &mali_c55->v4l2_dev;
+	vdev->queue = &params->queue;
+	vdev->device_caps = V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING |
+			    V4L2_CAP_IO_MC;
+	vdev->vfl_dir = VFL_DIR_TX;
+	video_set_drvdata(vdev, params);
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(mali_c55->dev,
+			"failed to register params video device\n");
+		goto err_release_vb2q;
+	}
+
+	ret = media_jobs_register_job_contributor(mali_c55->sched,
+						  &mali_c55_params_media_job_ops,
+						  params,
+						  MEDIA_JOB_TYPE_PIPELINE_PULSE);
+	if (ret) {
+		dev_err(mali_c55->dev, "Failed to add media job setup func\n");
+		goto err_unregister_video_device;
+	}
+
+	params->mali_c55 = mali_c55;
+
+	return 0;
+
+err_unregister_video_device:
+	video_unregister_device(vdev);
+err_release_vb2q:
+	vb2_queue_release(vb2q);
+err_cleanup_entity:
+	media_entity_cleanup(&params->vdev.entity);
+err_destroy_mutex:
+	mutex_destroy(&params->lock);
+
+	return ret;
+}
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
index 58dd6ce556a096ede4d3a21e472fdb9ed1cf5de3..7bcb23d798ed2c3bdd90c15cf2e2084890449b6f 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
@@ -159,6 +159,23 @@ enum mali_c55_interrupts {
 #define MALI_C55_BAYER_ORDER_GBRG			2
 #define MALI_C55_BAYER_ORDER_BGGR			3
 
+#define MALI_C55_REG_METERING_CONFIG			0x18ed0
+#define MALI_C55_5BIN_HIST_DISABLE_MASK			BIT(0)
+#define MALI_C55_5BIN_HIST_SWITCH_MASK			GENMASK(2, 1)
+#define MALI_C55_5BIN_HIST_SWITCH(x)			((x) << 1)
+#define MALI_C55_AF_DISABLE_MASK			BIT(4)
+#define MALI_C55_AF_SWITCH_MASK				BIT(5)
+#define MALI_C55_AWB_DISABLE_MASK			BIT(8)
+#define MALI_C55_AWB_SWITCH_MASK			BIT(9)
+#define MALI_C55_AWB_SWITCH(x)				((x) << 9)
+#define MALI_C55_AEXP_HIST_DISABLE_MASK			BIT(12)
+#define MALI_C55_AEXP_HIST_DISABLE			(0x01 << 12)
+#define MALI_C55_AEXP_HIST_SWITCH_MASK			GENMASK(14, 13)
+#define MALI_C55_AEXP_HIST_SWITCH(x)			((x) << 13)
+#define MALI_C55_AEXP_IHIST_DISABLE_MASK		BIT(16)
+#define MALI_C55_AEXP_IHIST_DISABLE			(0x01 << 12)
+#define MALI_C55_AEXP_SRC_MASK				BIT(24)
+
 #define MALI_C55_REG_TPG_CH0				0x18ed8
 #define MALI_C55_TEST_PATTERN_ON_OFF			BIT(0)
 #define MALI_C55_TEST_PATTERN_RGB_MASK			BIT(1)
@@ -179,6 +196,11 @@ enum mali_c55_interrupts {
 #define MALI_C55_REG_CONFIG_SPACES_OFFSET		0x0ab6c
 #define MALI_C55_CONFIG_SPACE_SIZE			0x1231c
 
+#define MALI_C55_REG_DIGITAL_GAIN			0x1926c
+#define MALI_C55_DIGITAL_GAIN_MASK			GENMASK(12, 0)
+#define MALI_C55_REG_DIGITAL_GAIN_OFFSET		0x19270
+#define MALI_C55_DIGITAL_GAIN_OFFSET_MASK		GENMASK(19, 0)
+
 #define MALI_C55_REG_SINTER_CONFIG			0x19348
 #define MALI_C55_SINTER_VIEW_FILTER_MASK		GENMASK(1, 0)
 #define MALI_C55_SINTER_SCALE_MODE_MASK			GENMASK(3, 2)
@@ -192,6 +214,59 @@ enum mali_c55_interrupts {
 #define MALI_C55_TEMPER_DMA_WRITE_ON			BIT(0)
 #define MALI_C55_TEMPER_DMA_READ_ON			BIT(1)
 
+/* Black Level Correction Configuration */
+#define MALI_C55_REG_SENSOR_OFF_PRE_SHA_00		0x1abcc
+#define MALI_C55_REG_SENSOR_OFF_PRE_SHA_01		0x1abd0
+#define MALI_C55_REG_SENSOR_OFF_PRE_SHA_10		0x1abd4
+#define MALI_C55_REG_SENSOR_OFF_PRE_SHA_11		0x1abd8
+#define MALI_C55_SENSOR_OFF_PRE_SHA_MASK		0xfffff
+
+/* Lens Mesh Shading Configuration */
+#define MALI_C55_REG_MESH_SHADING_TABLES		0x13074
+#define MALI_C55_REG_MESH_SHADING_CONFIG		0x1abfc
+#define MALI_C55_MESH_SHADING_ENABLE_MASK		BIT(0)
+#define MALI_C55_MESH_SHADING_MESH_SHOW_MASK		BIT(1)
+#define MALI_C55_MESH_SHADING_MESH_SHOW(x)		((x) << 1)
+#define MALI_C55_MESH_SHADING_SCALE_MASK		GENMASK(4, 2)
+#define MALI_C55_MESH_SHADING_SCALE(x)			((x) << 2)
+#define MALI_C55_MESH_SHADING_PAGE_R_MASK		GENMASK(9, 8)
+#define MALI_C55_MESH_SHADING_PAGE_R(x)			((x) << 8)
+#define MALI_C55_MESH_SHADING_PAGE_G_MASK		GENMASK(11, 10)
+#define MALI_C55_MESH_SHADING_PAGE_G(x)			((x) << 10)
+#define MALI_C55_MESH_SHADING_PAGE_B_MASK		GENMASK(13, 12)
+#define MALI_C55_MESH_SHADING_PAGE_B(x)			((x) << 12)
+#define MALI_C55_MESH_SHADING_MESH_WIDTH_MASK		GENMASK(21, 16)
+#define MALI_C55_MESH_SHADING_MESH_WIDTH(x)		((x) << 16)
+#define MALI_C55_MESH_SHADING_MESH_HEIGHT_MASK		GENMASK(29, 24)
+#define MALI_C55_MESH_SHADING_MESH_HEIGHT(x)		((x) << 24)
+
+#define MALI_C55_REG_MESH_SHADING_ALPHA_BANK		0x1ac04
+#define MALI_C55_MESH_SHADING_ALPHA_BANK_R_MASK		GENMASK(2, 0)
+#define MALI_C55_MESH_SHADING_ALPHA_BANK_G_MASK		GENMASK(5, 3)
+#define MALI_C55_MESH_SHADING_ALPHA_BANK_G(x)		((x) << 3)
+#define MALI_C55_MESH_SHADING_ALPHA_BANK_B_MASK		GENMASK(8, 6)
+#define MALI_C55_MESH_SHADING_ALPHA_BANK_B(x)		((x) << 6)
+#define MALI_C55_REG_MESH_SHADING_ALPHA			0x1ac08
+#define MALI_C55_MESH_SHADING_ALPHA_R_MASK		GENMASK(7, 0)
+#define MALI_C55_MESH_SHADING_ALPHA_G_MASK		GENMASK(15, 8)
+#define MALI_C55_MESH_SHADING_ALPHA_G(x)		((x) << 8)
+#define MALI_C55_MESH_SHADING_ALPHA_B_MASK		GENMASK(23, 16)
+#define MALI_C55_MESH_SHADING_ALPHA_B(x)		((x) << 16)
+#define MALI_C55_REG_MESH_SHADING_MESH_STRENGTH		0x1ac0c
+#define MALI_c55_MESH_STRENGTH_MASK			GENMASK(15, 0)
+
+/* AWB Gains Configuration */
+#define MALI_C55_REG_AWB_GAINS1				0x1ac10
+#define MALI_C55_AWB_GAIN00_MASK			GENMASK(11, 0)
+#define MALI_C55_AWB_GAIN01_MASK			GENMASK(27, 16)
+#define MALI_C55_AWB_GAIN01(x)				((x) << 16)
+#define MALI_C55_REG_AWB_GAINS2				0x1ac14
+#define MALI_C55_AWB_GAIN10_MASK			GENMASK(11, 0)
+#define MALI_C55_AWB_GAIN11_MASK			GENMASK(27, 16)
+#define MALI_C55_AWB_GAIN11(x)				((x) << 16)
+#define MALI_C55_REG_AWB_GAINS1_AEXP			0x1ac18
+#define MALI_C55_REG_AWB_GAINS2_AEXP			0x1ac1c
+
 /* Colour Correction Matrix Configuration */
 #define MALI_C55_REG_CCM_ENABLE				0x1b07c
 #define MALI_C55_CCM_ENABLE_MASK			BIT(0)
@@ -214,6 +289,59 @@ enum mali_c55_interrupts {
 #define MALI_C55_REG_CCM_ANTIFOG_OFFSET_B		0x1b0c8
 #define MALI_C55_CCM_ANTIFOG_OFFSET_MASK		GENMASK(11, 0)
 
+/* AWB Statistics Configuration */
+#define MALI_C55_REG_AWB_STATS_MODE			0x1b29c
+#define MALI_C55_AWB_STATS_MODE_MASK			BIT(0)
+#define MALI_C55_REG_AWB_WHITE_LEVEL			0x1b2a0
+#define MALI_C55_AWB_WHITE_LEVEL_MASK			GENMASK(9, 0)
+#define MALI_C55_REG_AWB_BLACK_LEVEL			0x1b2a4
+#define MALI_C55_AWB_BLACK_LEVEL_MASK			GENMASK(9, 0)
+#define MALI_C55_REG_AWB_CR_MAX				0x1b2a8
+#define MALI_C55_AWB_CR_MAX_MASK			GENMASK(11, 0)
+#define MALI_C55_REG_AWB_CR_MIN				0x1b2ac
+#define MALI_C55_AWB_CR_MIN_MASK			GENMASK(11, 0)
+#define MALI_C55_REG_AWB_CB_MAX				0x1b2b0
+#define MALI_C55_AWB_CB_MAX_MASK			GENMASK(11, 0)
+#define MALI_C55_REG_AWB_CB_MIN				0x1b2b4
+#define MALI_C55_AWB_CB_MIN_MASK			GENMASK(11, 0)
+#define MALI_C55_REG_AWB_NODES_USED			0x1b2c4
+#define MALI_C55_AWB_NODES_USED_HORIZ_MASK		GENMASK(7, 0)
+#define MALI_C55_AWB_NODES_USED_VERT_MASK		GENMASK(15, 8)
+#define MALI_C55_AWB_NODES_USED_VERT(x)			((x) << 8)
+#define MALI_C55_REG_AWB_CR_HIGH			0x1b2c8
+#define MALI_C55_AWB_CR_HIGH_MASK			GENMASK(11, 0)
+#define MALI_C55_REG_AWB_CR_LOW				0x1b2cc
+#define MALI_C55_AWB_CR_LOW_MASK			GENMASK(11, 0)
+#define MALI_C55_REG_AWB_CB_HIGH			0x1b2d0
+#define MALI_C55_AWB_CB_HIGH_MASK			GENMASK(11, 0)
+#define MALI_C55_REG_AWB_CB_LOW				0x1b2d4
+#define MALI_C55_AWB_CB_LOW_MASK			GENMASK(11, 0)
+
+/* AEXP Metering Histogram Configuration */
+#define MALI_C55_REG_AEXP_HIST_BASE			0x1b730
+#define MALI_C55_REG_AEXP_IHIST_BASE			0x1bbac
+#define MALI_C55_AEXP_HIST_SKIP_OFFSET			0
+#define MALI_C55_AEXP_HIST_SKIP_X_MASK			GENMASK(2, 0)
+#define MALI_C55_AEXP_HIST_SKIP_X(x)			((x) << 0)
+#define MALI_C55_AEXP_HIST_OFFSET_X_MASK		BIT(3)
+#define MALI_C55_AEXP_HIST_OFFSET_X(x)			((x) << 3)
+#define MALI_C55_AEXP_HIST_SKIP_Y_MASK			GENMASK(6, 4)
+#define MALI_C55_AEXP_HIST_SKIP_Y(x)			((x) << 4)
+#define MALI_C55_AEXP_HIST_OFFSET_Y_MASK		BIT(7)
+#define MALI_C55_AEXP_HIST_OFFSET_Y(x)			((x) << 7)
+#define MALI_C55_AEXP_HIST_SCALE_OFFSET			4
+#define MALI_C55_AEXP_HIST_SCALE_BOTTOM_MASK		GENMASK(3, 0)
+#define MALI_C55_AEXP_HIST_SCALE_TOP_MASK		GENMASK(7, 4)
+#define MALI_C55_AEXP_HIST_SCALE_TOP(x)			((x) << 4)
+#define MALI_C55_AEXP_HIST_PLANE_MODE_OFFSET		16
+#define MALI_C55_AEXP_HIST_PLANE_MODE_MASK		GENMASK(2, 0)
+#define MALI_C55_AEXP_HIST_NODES_USED_OFFSET		52
+#define MALI_C55_AEXP_HIST_NODES_USED_HORIZ_MASK	GENMASK(7, 0)
+#define MALI_C55_AEXP_HIST_NODES_USED_VERT_MASK		GENMASK(15, 8)
+#define MALI_C55_AEXP_HIST_NODES_USED_VERT(x)		((x) << 8)
+#define MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET		56
+#define MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK		0x0f0f0f0f
+
 /*
  * The Mali-C55 ISP has up to two output pipes; known as full resolution and
  * down scaled. The register space for these is laid out identically, but offset

-- 
2.34.1


