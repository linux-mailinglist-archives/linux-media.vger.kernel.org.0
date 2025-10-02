Return-Path: <linux-media+bounces-43619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E75BB39E6
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 12:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E062E7A3697
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 10:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7959B309EFA;
	Thu,  2 Oct 2025 10:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nyfY8KeH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EE630B531;
	Thu,  2 Oct 2025 10:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759400351; cv=none; b=gQjgs4U2eKIMjvmHVBYbmge98hY3Z6NxolGfe/c3W1MGmmPsvwm5l7rKEPLSXdBVp2vkZaM4G0/lAaG6fnwISGVswgcLhFFQO2nqVokVhVuHE+B50+vjf+sWAU2M5OekaAKzsdLeY0LlfPUnbt3e7+V7ZqGCwADVeFtQd7/NgoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759400351; c=relaxed/simple;
	bh=na80nZaiUlnYOtvHFA8TXAru1AasYYevDcMJekZf2As=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hcrUF/aMrVxMpUG1XtvTO9Wm+hfgbRiHWfprt3wvIOhHLgypVcR3t4qAyuJhrCfAu2JH4orA+9rhJeuADKNQGPeIyNtWrPHr7vyc3Xys//8e9nzVcMyxU5kGHGk+woszqalAh9NOKZtfrJzQNxmt1JnEegVLnSLnV3a0Gsvsd8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nyfY8KeH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCD601E64;
	Thu,  2 Oct 2025 12:17:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759400237;
	bh=na80nZaiUlnYOtvHFA8TXAru1AasYYevDcMJekZf2As=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nyfY8KeHykUfNBF/IAfW85FP3pY3Y4IysNNO/sWXyZB3h1EFfgdFuH2JtyT/OKBmR
	 T9kJD5nhMH1Alt+Jo+fsr9S6a8rofuRwsVaCfCfTLnho0j9P5MMpeYDvdqLDmjppcG
	 NulB1zU9W6fbM9tfqjRvNJB5YuBYPVGkO0AFH3RU=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Thu, 02 Oct 2025 11:18:33 +0100
Subject: [PATCH v12 14/15] media: platform: Add mali-c55 parameters video
 node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-c55-v12-14-3eda2dba9554@ideasonboard.com>
References: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com>
In-Reply-To: <20251002-c55-v12-0-3eda2dba9554@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=49944;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=na80nZaiUlnYOtvHFA8TXAru1AasYYevDcMJekZf2As=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBo3lF7YEC44YXa1hou9s7AHBJ5ATGqkJsYx9Kev
 v05E1h843KJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaN5RewAKCRDISVd6bEV1
 MqmDD/472Bx0y5hyFMrY1p+vx3233A/tffIRK4xc8XeJXBxlrboHFeCO3ik7QZhZelYKXdNmQPQ
 q92EVRyGtF+8XDmc61eUzc2U8PIs4FzmK+lcCRCv975DJS3ASTTwI/5T061xq08O1C1HpBUXM1p
 D/p/o5FHDHyNCtGhdwvDhEOZneUlCgubLWpcOM4JERM70EcAXtMFyknqVEIw6UGmxPoRF6LiRHW
 2My2QnCTi4ndCEC0ruAZa31QJahX/OAR8rsxW6UikV5SMYkCSi7NH/GhIMXvyXD/KvdOFSgxT/G
 JMWpYRjI4M9VjMJkDacF96vuCJ9pbFcejnTTRnCKOqZooelZh8HXcP2RQs6eO/5tbuOiEHDclTV
 CPhGRDRw340LL+oCmnaOJuOcaWjB/ORV5+spS2LyuCddRRBPDDitRoWaQUVWWP+7PTYcdI+FK+y
 DvgxrbjLbz8bdQ8F9P3H0NZS9/epyb1vN0Hc2ZTzku54eV4IQCas8jvvDHwjq15jds1MzVQQqhQ
 F8suwuqvKy1TZMWjzXQjmvZqGIR71wf19ShZ6WJC0cmahfXFSsYAoMfWUfmebPC4kAHSMjPW0K/
 0XJ5gm1OFnorQs3DjPHJ9uOixpYsGoOlgwqORVSMm/yphXInmEvxdM42Zs1s3HmKHgL9tK4pxVi
 /zrssAXCs7UEZaA==
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
Changes in v12:

	- Fix the parameter parsing to remove a hang where the data field
	  was empty
        - Dropped the use of the new media entity .pipeline_started() and
          .pipeline_stopped() operations and the V4L2 / MC helpers for them.

Changes in v11:

	- Remove the media jobs / scheduler functionality. We'll add
	  it in a separate series.
	- Update copyright year
	- Use the new v4l2-params functions and objects
	- Use new video_device_pipeline_started() helper

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
 drivers/media/platform/arm/mali-c55/Kconfig        |   1 +
 drivers/media/platform/arm/mali-c55/Makefile       |   1 +
 .../media/platform/arm/mali-c55/mali-c55-common.h  |  28 +
 .../media/platform/arm/mali-c55/mali-c55-core.c    |  26 +
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c |  23 +-
 .../media/platform/arm/mali-c55/mali-c55-params.c  | 829 +++++++++++++++++++++
 .../platform/arm/mali-c55/mali-c55-registers.h     | 128 ++++
 7 files changed, 1035 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/arm/mali-c55/Kconfig b/drivers/media/platform/arm/mali-c55/Kconfig
index 9928039fa522b93396eaed010df14bf1f8723a24..5b084b3c3340779275ce20c62a719ce5b13b78fa 100644
--- a/drivers/media/platform/arm/mali-c55/Kconfig
+++ b/drivers/media/platform/arm/mali-c55/Kconfig
@@ -7,6 +7,7 @@ config VIDEO_MALI_C55
 	select GENERIC_PHY_MIPI_DPHY
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
+	select V4L2_ISP
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_CONTIG
 	select VIDEOBUF2_VMALLOC
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
index 262fb33bc5ff56195c52e3d9f62435e442937492..12892f172f20bf54f46b25db8706bd960ed7c8ac 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-common.h
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
@@ -21,6 +21,7 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-isp.h>
 #include <media/v4l2-subdev.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-v4l2.h>
@@ -44,6 +45,7 @@ struct device;
 struct mali_c55;
 struct mali_c55_cap_dev;
 struct media_pipeline;
+struct mali_c55_params_buffer;
 struct platform_device;
 struct resource;
 
@@ -52,6 +54,7 @@ enum mali_c55_isp_pads {
 	MALI_C55_ISP_PAD_SOURCE_VIDEO,
 	MALI_C55_ISP_PAD_SOURCE_BYPASS,
 	MALI_C55_ISP_PAD_SOURCE_STATS,
+	MALI_C55_ISP_PAD_SINK_PARAMS,
 	MALI_C55_ISP_NUM_PADS,
 };
 
@@ -170,6 +173,12 @@ struct mali_c55_stats_buf {
 	bool failed;
 };
 
+struct mali_c55_params_buf {
+	struct vb2_v4l2_buffer vb;
+	struct list_head queue;
+	struct v4l2_params_buffer *config;
+};
+
 struct mali_c55_stats {
 	struct mali_c55 *mali_c55;
 	struct video_device vdev;
@@ -185,6 +194,21 @@ struct mali_c55_stats {
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
 	MALI_C55_CONFIG_PONG,
 	MALI_C55_CONFIG_PING,
@@ -228,6 +252,7 @@ struct mali_c55 {
 	struct mali_c55_isp isp;
 	struct mali_c55_resizer resizers[MALI_C55_NUM_RSZS];
 	struct mali_c55_cap_dev cap_devs[MALI_C55_NUM_CAP_DEVS];
+	struct mali_c55_params params;
 	struct mali_c55_stats stats;
 
 	struct mali_c55_context context;
@@ -259,6 +284,8 @@ int mali_c55_register_capture_devs(struct mali_c55 *mali_c55);
 void mali_c55_unregister_capture_devs(struct mali_c55 *mali_c55);
 int mali_c55_register_stats(struct mali_c55 *mali_c55);
 void mali_c55_unregister_stats(struct mali_c55 *mali_c55);
+int mali_c55_register_params(struct mali_c55 *mali_c55);
+void mali_c55_unregister_params(struct mali_c55 *mali_c55);
 struct mali_c55_context *mali_c55_get_active_context(struct mali_c55 *mali_c55);
 void mali_c55_set_plane_done(struct mali_c55_cap_dev *cap_dev,
 			     enum mali_c55_planes plane);
@@ -278,5 +305,6 @@ mali_c55_isp_get_mbus_config_by_index(u32 index);
 bool mali_c55_pipeline_ready(struct mali_c55 *mali_c55);
 void mali_c55_stats_fill_buffer(struct mali_c55 *mali_c55,
 				enum mali_c55_config_spaces cfg_space);
+void mali_c55_params_write_config(struct mali_c55 *mali_c55);
 
 #endif /* _MALI_C55_COMMON_H */
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index a9c0653162faaffec7336754a1bf985f4fd4dd89..2eb6b03c22284c2daec5003863f30c29ef13d414 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -294,6 +294,16 @@ static int mali_c55_create_links(struct mali_c55 *mali_c55)
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
@@ -308,6 +318,7 @@ static void mali_c55_unregister_entities(struct mali_c55 *mali_c55)
 	mali_c55_unregister_isp(mali_c55);
 	mali_c55_unregister_resizers(mali_c55);
 	mali_c55_unregister_capture_devs(mali_c55);
+	mali_c55_unregister_params(mali_c55);
 	mali_c55_unregister_stats(mali_c55);
 }
 
@@ -344,6 +355,10 @@ static int mali_c55_register_entities(struct mali_c55 *mali_c55)
 	if (ret)
 		goto err_unregister_entities;
 
+	ret = mali_c55_register_params(mali_c55);
+	if (ret)
+		goto err_unregister_entities;
+
 	ret = mali_c55_register_stats(mali_c55);
 	if (ret)
 		goto err_unregister_entities;
@@ -433,6 +448,7 @@ static int mali_c55_media_frameworks_init(struct mali_c55 *mali_c55)
 		sizeof(mali_c55->media_dev.model));
 
 	media_device_init(&mali_c55->media_dev);
+
 	ret = media_device_register(&mali_c55->media_dev);
 	if (ret)
 		goto err_cleanup_media_device;
@@ -492,11 +508,13 @@ bool mali_c55_pipeline_ready(struct mali_c55 *mali_c55)
 {
 	struct mali_c55_cap_dev *fr = &mali_c55->cap_devs[MALI_C55_CAP_DEV_FR];
 	struct mali_c55_cap_dev *ds = &mali_c55->cap_devs[MALI_C55_CAP_DEV_DS];
+	struct mali_c55_params *params = &mali_c55->params;
 	struct mali_c55_stats *stats = &mali_c55->stats;
 
 	return vb2_start_streaming_called(&fr->queue) &&
 	       (!(mali_c55->capabilities & MALI_C55_GPS_DS_PIPE_FITTED) ||
 		vb2_start_streaming_called(&ds->queue)) &&
+	       vb2_start_streaming_called(&params->queue) &&
 	       vb2_start_streaming_called(&stats->queue);
 }
 
@@ -574,6 +592,14 @@ static irqreturn_t mali_c55_isr(int irq, void *context)
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
 				mali_c55->next_config ^ 1);
 
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
index c5183d7092a908b343ac7fd5eb1e0e557e291a6f..497f25fbdd13b0eb0e3e1b3da924dbbcd291176c 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
@@ -151,6 +151,7 @@ static int mali_c55_isp_start(struct mali_c55 *mali_c55,
 				 cfg->bypass ? MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK :
 					     0x00);
 
+	mali_c55_params_write_config(mali_c55);
 	ret = mali_c55_config_write(ctx, MALI_C55_CONFIG_PING, true);
 	if (ret) {
 		dev_err(mali_c55->dev, "failed to write ISP config\n");
@@ -494,12 +495,19 @@ static int mali_c55_isp_init_state(struct v4l2_subdev *sd,
 
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
 
@@ -507,8 +515,20 @@ static const struct v4l2_subdev_internal_ops mali_c55_isp_internal_ops = {
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
 
 static int mali_c55_isp_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -597,6 +617,7 @@ int mali_c55_register_isp(struct mali_c55 *mali_c55)
 	isp->pads[MALI_C55_ISP_PAD_SOURCE_VIDEO].flags = MEDIA_PAD_FL_SOURCE;
 	isp->pads[MALI_C55_ISP_PAD_SOURCE_BYPASS].flags = MEDIA_PAD_FL_SOURCE;
 	isp->pads[MALI_C55_ISP_PAD_SOURCE_STATS].flags = MEDIA_PAD_FL_SOURCE;
+	isp->pads[MALI_C55_ISP_PAD_SINK_PARAMS].flags = MEDIA_PAD_FL_SINK;
 
 	ret = media_entity_pads_init(&sd->entity, MALI_C55_ISP_NUM_PADS,
 				     isp->pads);
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
new file mode 100644
index 0000000000000000000000000000000000000000..9eaca71f68e324cd4f132b1bcb8e1411ef03fc85
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -0,0 +1,829 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ARM Mali-C55 ISP Driver - Configuration parameters output device
+ *
+ * Copyright (C) 2025 Ideas on Board Oy
+ */
+#include <linux/media/arm/mali-c55-config.h>
+#include <linux/pm_runtime.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-isp.h>
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
+	const struct v4l2_params_block_header *header;
+	const struct mali_c55_params_sensor_off_preshading *sensor_offs;
+	const struct mali_c55_params_aexp_hist *aexp_hist;
+	const struct mali_c55_params_aexp_weights *aexp_weights;
+	const struct mali_c55_params_digital_gain *digital_gain;
+	const struct mali_c55_params_awb_gains *awb_gains;
+	const struct mali_c55_params_awb_config *awb_config;
+	const struct mali_c55_params_mesh_shading_config *shading_config;
+	const struct mali_c55_params_mesh_shading_selection *shading_selection;
+	const __u8 *data;
+};
+
+#define to_mali_c55_params_buf(vbuf) \
+	container_of(vbuf, struct mali_c55_params_buf, vb)
+
+static void mali_c55_params_sensor_offs(void *arg, const struct v4l2_params_block_header *header)
+{
+	const struct mali_c55_params_sensor_off_preshading *p;
+	union mali_c55_params_block block;
+	struct mali_c55 *mali_c55 = arg;
+	__u32 global_offset;
+
+	block.header = header;
+	p = block.sensor_offs;
+
+	if (block.header->flags & V4L2_PARAMS_FL_BLOCK_DISABLE) {
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
+static void mali_c55_params_aexp_hist(void *arg, const struct v4l2_params_block_header *header)
+{
+	const struct mali_c55_params_aexp_hist *params;
+	union mali_c55_params_block block;
+	struct mali_c55 *mali_c55 = arg;
+	u32 disable_mask;
+	u32 disable_val;
+	u32 base;
+
+	block.header = header;
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
+
+	params = block.aexp_hist;
+
+	if (block.header->flags & V4L2_PARAMS_FL_BLOCK_DISABLE) {
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
+mali_c55_params_aexp_hist_weights(void *arg, const struct v4l2_params_block_header *header)
+{
+	const struct mali_c55_params_aexp_weights *params;
+	union mali_c55_params_block block;
+	struct mali_c55 *mali_c55 = arg;
+	u32 base, val, addr;
+
+	block.header = header;
+	params = block.aexp_weights;
+
+	if (block.header->flags & V4L2_PARAMS_FL_BLOCK_DISABLE)
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
+	 * just reinterpret it as 56-element array of 32-bit values for the
+	 * purposes of this transaction. The last register is handled separately
+	 * to stop static analysers worrying about buffer overflow. The 3 bytes
+	 * of additional space at the end of the write is just padding for the
+	 * array of weights in the ISP memory space anyway, so there's no risk
+	 * of overwriting other registers.
+	 */
+	for (unsigned int i = 0; i < 56; i++) {
+		val = ((u32 *)params->zone_weights)[i]
+			    & MALI_C55_AEXP_HIST_ZONE_WEIGHT_MASK;
+		addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * i);
+
+		mali_c55_ctx_write(mali_c55, addr, val);
+	}
+
+	val = params->zone_weights[MALI_C55_MAX_ZONES - 1];
+	addr = base + MALI_C55_AEXP_HIST_ZONE_WEIGHTS_OFFSET + (4 * 56);
+}
+
+static void mali_c55_params_digital_gain(void *arg, const struct v4l2_params_block_header *header)
+{
+	const struct mali_c55_params_digital_gain *dgain;
+	union mali_c55_params_block block;
+	struct mali_c55 *mali_c55 = arg;
+	u32 gain;
+
+	block.header = header;
+	dgain = block.digital_gain;
+
+	/*
+	 * If the block is flagged as disabled we write a gain of 1.0, which in
+	 * Q5.8 format is 256.
+	 */
+	gain = block.header->flags & V4L2_PARAMS_FL_BLOCK_DISABLE ?
+	       256 : dgain->gain;
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_DIGITAL_GAIN,
+				 MALI_C55_DIGITAL_GAIN_MASK,
+				 gain);
+}
+
+static void mali_c55_params_awb_gains(void *arg, const struct v4l2_params_block_header *header)
+{
+	const struct mali_c55_params_awb_gains *gains;
+	u32 gain00, gain01, gain10, gain11;
+	union mali_c55_params_block block;
+	struct mali_c55 *mali_c55 = arg;
+
+	block.header = header;
+	gains = block.awb_gains;
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
+	if (block.header->flags & V4L2_PARAMS_FL_BLOCK_DISABLE) {
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
+static void mali_c55_params_awb_config(void *arg, const struct v4l2_params_block_header *header)
+{
+	const struct mali_c55_params_awb_config *params;
+	union mali_c55_params_block block;
+	struct mali_c55 *mali_c55 = arg;
+
+	block.header = header;
+	params = block.awb_config;
+
+	if (block.header->flags & V4L2_PARAMS_FL_BLOCK_DISABLE) {
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
+static void mali_c55_params_lsc_config(void *arg, const struct v4l2_params_block_header *header)
+{
+	const struct mali_c55_params_mesh_shading_config *params;
+	union mali_c55_params_block block;
+	struct mali_c55 *mali_c55 = arg;
+	unsigned int i;
+	u32 addr;
+
+	block.header = header;
+	params = block.shading_config;
+
+	if (block.header->flags & V4L2_PARAMS_FL_BLOCK_DISABLE) {
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
+static void mali_c55_params_lsc_selection(void *arg, const struct v4l2_params_block_header *header)
+{
+	const struct mali_c55_params_mesh_shading_selection *params;
+	union mali_c55_params_block block;
+	struct mali_c55 *mali_c55 = arg;
+
+	block.header = header;
+	params = block.shading_selection;
+
+	if (block.header->flags & V4L2_PARAMS_FL_BLOCK_DISABLE)
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
+static const struct v4l2_params_handler mali_c55_block_handlers[] = {
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
+		.buffersize = v4l2_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
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
+	if (sizes[0] && sizes[0] < v4l2_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE))
+		return -EINVAL;
+
+	*num_planes = 1;
+
+	if (!sizes[0])
+		sizes[0] = v4l2_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE);
+
+	return 0;
+}
+
+static int mali_c55_params_buf_init(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
+
+	buf->config = kvmalloc(v4l2_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
+			       GFP_KERNEL);
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
+static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
+{
+	struct mali_c55_params *params = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
+	struct v4l2_params_buffer *config = vb2_plane_vaddr(vb, 0);
+	struct mali_c55 *mali_c55 = params->mali_c55;
+	int ret;
+
+	if (config->version != MALI_C55_PARAM_BUFFER_V1) {
+		dev_dbg(mali_c55->dev,
+			"Unsupported extensible format version: %u\n",
+			config->version);
+		return -EINVAL;
+	}
+
+	ret = v4l2_params_buffer_validate(mali_c55->dev, vb,
+			v4l2_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
+	if (ret)
+		return ret;
+
+	/*
+	 * Copy the parameters buffer provided by userspace to the internal
+	 * scratch buffer. This protects against the chance of userspace making
+	 * changed to the buffer content whilst the driver processes it.
+	 */
+
+	memcpy(buf->config, config, v4l2_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
+
+	return v4l2_params_blocks_validate(mali_c55->dev, buf->config,
+					   mali_c55_block_handlers,
+					   ARRAY_SIZE(mali_c55_block_handlers));
+}
+
+static void mali_c55_params_buf_queue(struct vb2_buffer *vb)
+{
+	struct mali_c55_params *params = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
+
+	spin_lock(&params->buffers.lock);
+	list_add_tail(&buf->queue, &params->buffers.queue);
+	spin_unlock(&params->buffers.lock);
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
+	ret = pm_runtime_resume_and_get(mali_c55->dev);
+	if (ret)
+		goto err_return_buffers;
+
+	ret = video_device_pipeline_alloc_start(&params->vdev);
+	if (ret)
+		goto err_pm_put;
+
+	if (mali_c55_pipeline_ready(mali_c55)) {
+		ret = v4l2_subdev_enable_streams(&mali_c55->isp.sd,
+						 MALI_C55_ISP_PAD_SOURCE_VIDEO,
+						 BIT(0));
+		if (ret < 0)
+			goto err_stop_pipeline;
+	}
+
+	return 0;
+
+err_stop_pipeline:
+	video_device_pipeline_stop(&params->vdev);
+err_pm_put:
+	pm_runtime_put_autosuspend(mali_c55->dev);
+err_return_buffers:
+	mali_c55_params_return_buffers(params, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+static void mali_c55_params_stop_streaming(struct vb2_queue *q)
+{
+	struct mali_c55_params *params = vb2_get_drv_priv(q);
+	struct mali_c55 *mali_c55 = params->mali_c55;
+	struct mali_c55_isp *isp = &mali_c55->isp;
+
+	if (mali_c55_pipeline_ready(mali_c55)) {
+		if (v4l2_subdev_is_streaming(&isp->sd))
+			v4l2_subdev_disable_streams(
+				&isp->sd, MALI_C55_ISP_PAD_SOURCE_VIDEO,
+				BIT(0));
+	}
+
+
+	video_device_pipeline_stop(&params->vdev);
+	mali_c55_params_return_buffers(params, VB2_BUF_STATE_ERROR);
+	pm_runtime_put_autosuspend(params->mali_c55->dev);
+}
+
+static const struct vb2_ops mali_c55_params_vb2_ops = {
+	.queue_setup = mali_c55_params_queue_setup,
+	.buf_init = mali_c55_params_buf_init,
+	.buf_cleanup = mali_c55_params_buf_cleanup,
+	.buf_queue = mali_c55_params_buf_queue,
+	.buf_prepare = mali_c55_params_buf_prepare,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+	.start_streaming = mali_c55_params_start_streaming,
+	.stop_streaming = mali_c55_params_stop_streaming,
+};
+
+void mali_c55_params_write_config(struct mali_c55 *mali_c55)
+{
+	struct mali_c55_params *params = &mali_c55->params;
+	struct v4l2_params_buffer *config;
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
+	max_offset = config->data_size;
+
+	/*
+	 * Walk the list of parameter blocks and process them. No validation is
+	 * done here, as the contents of the config buffer are already checked
+	 * when the buffer is queued.
+	 */
+	while (max_offset && block_offset < max_offset) {
+		const struct v4l2_params_handler *block_handler;
+		union mali_c55_params_block block;
+
+		block.data = &config->data[block_offset];
+
+		/* We checked the array index already in .buf_queue() */
+		block_handler = &mali_c55_block_handlers[block.header->type];
+		block_handler->handler(mali_c55, block.header);
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
index 8b04aff1990a962ddb7671d2f66f70c0638737a7..f5a148add1c811f8dc49170db67d151bd54a4307 100644
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
2.43.0


