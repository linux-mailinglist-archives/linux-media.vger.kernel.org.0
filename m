Return-Path: <linux-media+bounces-17805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E4396F85F
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 17:35:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 980921C22A2D
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 15:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBD11D318E;
	Fri,  6 Sep 2024 15:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HhDSnPz3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CBD1D4161;
	Fri,  6 Sep 2024 15:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725636892; cv=none; b=p32OrHz8V6DmnbmDAkZ816Fhoi7ipIsuz8F6qOZLrDnXoM6Dsgqm/3pqtogMma0WmXGZmHRH74WcqhMu/CUwjToHvQM4xk3PySRcbgCFpb9q3ZwWgj+2o9mxqhIgzEzp3Gsj9vrCQzER4GWc/d38Vlt25UaGlwJ0GfYzOOn99K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725636892; c=relaxed/simple;
	bh=H8HUE5t5T300jGONPM3vACVAJkBeFLBDR/xVj562PvI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MgSyW/m5Glqek6UKmejrr0r7X8UfjLBWzHdPXPG7tEDFk9btw35cvVwk3cUIJLwdbBWQByPBLWv/UZSBBsGokrJmSrGrOtJrEPyzI29cTOfCxLbja7iZ0JI47eLsjygvz+ZA3TLDoR4BbRFSdrIfl8QGBI6MfyoYQIgD5E0E0W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HhDSnPz3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B12073D6;
	Fri,  6 Sep 2024 17:33:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725636798;
	bh=H8HUE5t5T300jGONPM3vACVAJkBeFLBDR/xVj562PvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HhDSnPz3xlMtjVljO2iaXC0Et0wBqjR25tqmlU7SaGxPD7W4LCgNyhMDSj7/j3aiJ
	 G4o4nZbHJCtxsy+YI0E5xihtKq9ekw6ptVAmrYxoHnE/1cB3xPiHxqWVnVT+Ow3DjP
	 05sSN2B/3SP37yZ+hP7DHxpinXxaFL/gQjdoqOHk=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com,
	robh+dt@kernel.org,
	mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@iki.fi,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v7 16/17] media: platform: Add mali-c55 parameters video node
Date: Fri,  6 Sep 2024 16:34:05 +0100
Message-Id: <20240906153406.650105-17-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240906153406.650105-1-dan.scally@ideasonboard.com>
References: <20240906153406.650105-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

 drivers/media/platform/arm/mali-c55/Makefile  |   1 +
 .../platform/arm/mali-c55/mali-c55-common.h   |  27 +
 .../platform/arm/mali-c55/mali-c55-core.c     |  23 +
 .../platform/arm/mali-c55/mali-c55-isp.c      |  23 +-
 .../platform/arm/mali-c55/mali-c55-params.c   | 820 ++++++++++++++++++
 .../arm/mali-c55/mali-c55-registers.h         | 128 +++
 6 files changed, 1021 insertions(+), 1 deletion(-)
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-params.c

diff --git a/drivers/media/platform/arm/mali-c55/Makefile b/drivers/media/platform/arm/mali-c55/Makefile
index b5a22d414479..d5718b0b23e0 100644
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
index f34df6b6a924..e98e3da1957c 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-common.h
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
@@ -42,6 +42,7 @@ struct device;
 struct dma_chan;
 struct mali_c55;
 struct mali_c55_cap_dev;
+struct mali_c55_params_buffer;
 struct platform_device;
 struct resource;
 
@@ -50,6 +51,7 @@ enum mali_c55_isp_pads {
 	MALI_C55_ISP_PAD_SOURCE_VIDEO,
 	MALI_C55_ISP_PAD_SOURCE_BYPASS,
 	MALI_C55_ISP_PAD_SOURCE_STATS,
+	MALI_C55_ISP_PAD_SINK_PARAMS,
 	MALI_C55_ISP_NUM_PADS,
 };
 
@@ -168,6 +170,12 @@ struct mali_c55_stats_buf {
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
@@ -184,6 +192,21 @@ struct mali_c55_stats {
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
+	} buffers;
+};
+
 enum mali_c55_config_spaces {
 	MALI_C55_CONFIG_PING,
 	MALI_C55_CONFIG_PONG,
@@ -225,6 +248,7 @@ struct mali_c55 {
 	struct mali_c55_isp isp;
 	struct mali_c55_resizer resizers[MALI_C55_NUM_RSZS];
 	struct mali_c55_cap_dev cap_devs[MALI_C55_NUM_CAP_DEVS];
+	struct mali_c55_params params;
 	struct mali_c55_stats stats;
 
 	struct mali_c55_context context;
@@ -256,6 +280,8 @@ int mali_c55_register_capture_devs(struct mali_c55 *mali_c55);
 void mali_c55_unregister_capture_devs(struct mali_c55 *mali_c55);
 int mali_c55_register_stats(struct mali_c55 *mali_c55);
 void mali_c55_unregister_stats(struct mali_c55 *mali_c55);
+int mali_c55_register_params(struct mali_c55 *mali_c55);
+void mali_c55_unregister_params(struct mali_c55 *mali_c55);
 struct mali_c55_context *mali_c55_get_active_context(struct mali_c55 *mali_c55);
 void mali_c55_set_plane_done(struct mali_c55_cap_dev *cap_dev,
 			     enum mali_c55_planes plane);
@@ -275,5 +301,6 @@ mali_c55_isp_get_mbus_config_by_index(u32 index);
 bool mali_c55_pipeline_ready(struct mali_c55 *mali_c55);
 void mali_c55_stats_fill_buffer(struct mali_c55 *mali_c55,
 				enum mali_c55_config_spaces cfg_space);
+void mali_c55_params_write_config(struct mali_c55 *mali_c55);
 
 #endif /* _MALI_C55_COMMON_H */
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index f5cce6e24df5..8dc11cbcc2d9 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -378,6 +378,16 @@ static int mali_c55_create_links(struct mali_c55 *mali_c55)
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
@@ -392,6 +402,7 @@ static void mali_c55_unregister_entities(struct mali_c55 *mali_c55)
 	mali_c55_unregister_isp(mali_c55);
 	mali_c55_unregister_resizers(mali_c55);
 	mali_c55_unregister_capture_devs(mali_c55);
+	mali_c55_unregister_params(mali_c55);
 	mali_c55_unregister_stats(mali_c55);
 }
 
@@ -415,6 +426,10 @@ static int mali_c55_register_entities(struct mali_c55 *mali_c55)
 	if (ret)
 		goto err_unregister_entities;
 
+	ret = mali_c55_register_params(mali_c55);
+	if (ret)
+		goto err_unregister_entities;
+
 	ret = mali_c55_register_stats(mali_c55);
 	if (ret)
 		goto err_unregister_entities;
@@ -674,6 +689,14 @@ static irqreturn_t mali_c55_isr(int irq, void *context)
 			curr_config >>= ffs(MALI_C55_REG_PING_PONG_READ_MASK) - 1;
 			mali_c55->next_config = curr_config ^ 1;
 
+			/*
+			 * Write the configuration parameters received from
+			 * userspace into the configuration buffer, which will
+			 * be transferred to the 'next' active config space at
+			 * by mali_c55_swap_next_config().
+			 */
+			mali_c55_params_write_config(mali_c55);
+
 			mali_c55_stats_fill_buffer(mali_c55,
 				mali_c55->next_config ? MALI_C55_CONFIG_PING :
 				MALI_C55_CONFIG_PONG);
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
index 5303fd42e6e7..5b3795621385 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
@@ -148,6 +148,7 @@ static int mali_c55_isp_start(struct mali_c55 *mali_c55,
 				 cfg->bypass ? MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK :
 					     0x00);
 
+	mali_c55_params_write_config(mali_c55);
 	ret = mali_c55_config_write(ctx, MALI_C55_CONFIG_PING, true);
 	if (ret) {
 		dev_err(mali_c55->dev, "failed to write ISP config\n");
@@ -491,12 +492,19 @@ static int mali_c55_isp_init_state(struct v4l2_subdev *sd,
 
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
 
@@ -504,8 +512,20 @@ static const struct v4l2_subdev_internal_ops mali_c55_isp_internal_ops = {
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
 };
 
 int mali_c55_register_isp(struct mali_c55 *mali_c55)
@@ -528,6 +548,7 @@ int mali_c55_register_isp(struct mali_c55 *mali_c55)
 	isp->pads[MALI_C55_ISP_PAD_SOURCE_VIDEO].flags = MEDIA_PAD_FL_SOURCE;
 	isp->pads[MALI_C55_ISP_PAD_SOURCE_BYPASS].flags = MEDIA_PAD_FL_SOURCE;
 	isp->pads[MALI_C55_ISP_PAD_SOURCE_STATS].flags = MEDIA_PAD_FL_SOURCE;
+	isp->pads[MALI_C55_ISP_PAD_SINK_PARAMS].flags = MEDIA_PAD_FL_SINK;
 
 	ret = media_entity_pads_init(&sd->entity, MALI_C55_ISP_NUM_PADS,
 				     isp->pads);
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
new file mode 100644
index 000000000000..fcc5d216e9d3
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -0,0 +1,820 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ARM Mali-C55 ISP Driver - Configuration parameters output device
+ *
+ * Copyright (C) 2024 Ideas on Board Oy
+ */
+#include <linux/media/arm/mali-c55-config.h>
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
+	       dgain->gain : 256;
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
+	spin_lock(&params->buffers.lock);
+	list_add_tail(&buf->queue, &params->buffers.queue);
+	spin_unlock(&params->buffers.lock);
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
+}
+
+static int mali_c55_params_start_streaming(struct vb2_queue *q,
+					   unsigned int count)
+{
+	struct mali_c55_params *params = vb2_get_drv_priv(q);
+	struct mali_c55 *mali_c55 = params->mali_c55;
+	int ret;
+
+	ret = video_device_pipeline_start(&params->vdev,
+					  &params->mali_c55->pipe);
+	if (ret)
+		return ret;
+
+	if (mali_c55_pipeline_ready(mali_c55)) {
+		ret = v4l2_subdev_enable_streams(&mali_c55->isp.sd,
+						 MALI_C55_ISP_PAD_SOURCE_VIDEO,
+						 BIT(0));
+		if (ret)
+			goto err_stop_pipeline;
+	}
+
+	return 0;
+
+err_stop_pipeline:
+	video_device_pipeline_stop(&params->vdev);
+	mali_c55_params_return_buffers(params, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+static void mali_c55_params_stop_streaming(struct vb2_queue *q)
+{
+	struct mali_c55_params *params = vb2_get_drv_priv(q);
+	struct mali_c55 *mali_c55 = params->mali_c55;
+
+	if (v4l2_subdev_is_streaming(&mali_c55->isp.sd))
+		v4l2_subdev_disable_streams(&mali_c55->isp.sd,
+					MALI_C55_ISP_PAD_SOURCE_VIDEO, BIT(0));
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
+	params->mali_c55 = mali_c55;
+
+	return 0;
+
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
index b0040b06ce5d..6abe5fbe1725 100644
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
@@ -187,6 +209,59 @@ enum mali_c55_interrupts {
 #define MALI_C55_SINTER_INT_SELECT_MASK			BIT(6)
 #define MALI_C55_SINTER_RM_ENABLE_MASK			BIT(7)
 
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
@@ -209,6 +284,59 @@ enum mali_c55_interrupts {
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


