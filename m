Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9F28342415
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 19:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbhCSSHZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 14:07:25 -0400
Received: from mga09.intel.com ([134.134.136.24]:57280 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230028AbhCSSHA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 14:07:00 -0400
IronPort-SDR: T2HQz3YArmexpOXgjLPMFs8CzOVSU0Y3nw/QqzTcy8NQqoj5YQuvJDnGfydr77N7a/H4FQGhDp
 DTENcwVB4EPw==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="190036036"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
   d="scan'208";a="190036036"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 11:06:59 -0700
IronPort-SDR: 17XftZ/KoeSdf/1ks/gh9Gm4ZqWCUhAgzadCU5i5ZatCznxgJ0e/JGFTptbCvzOBMVoSLvOrXH
 W7nOBs24icYQ==
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
   d="scan'208";a="413605763"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.88.55])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 11:06:56 -0700
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH 07/10] media: Keem Bay Camera: Add pipeline support
Date:   Fri, 19 Mar 2021 18:06:29 +0000
Message-Id: <20210319180632.585-8-martinax.krasteva@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
References: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Martina Krasteva <martinax.krasteva@intel.com>

Keem Bay pipeline object is responsible for handling
of all pipeline management operations. It handles
pipeline lifecycle states and configuration.

Co-developed-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
Signed-off-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
---
 .../platform/keembay-camera/keembay-cam-xlink.c    | 133 +++++++++++++++++++
 .../platform/keembay-camera/keembay-cam-xlink.h    |   7 +
 .../platform/keembay-camera/keembay-pipeline.c     | 145 ++++++++++++++++++++-
 3 files changed, 279 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/keembay-camera/keembay-cam-xlink.c b/drivers/media/platform/keembay-camera/keembay-cam-xlink.c
index 49a0937bc9fc..5b403874c4a1 100644
--- a/drivers/media/platform/keembay-camera/keembay-cam-xlink.c
+++ b/drivers/media/platform/keembay-camera/keembay-cam-xlink.c
@@ -192,3 +192,136 @@ int kmb_cam_xlink_read_msg(struct kmb_xlink_cam *xlink_cam, int chan_id,
 
 	return written_size;
 }
+
+/**
+ * kmb_cam_xlink_open_ctrl_channel - Open xlink control channel for communication
+ * @xlink_cam: Pointer to xlink camera handle
+ *
+ * There is only one control channel for xlink camera communication.
+ * NOTE: The channel is serialized and reference counted.
+ *
+ * Return: 0 if successful, error code otherwise
+ */
+int kmb_cam_xlink_open_ctrl_channel(struct kmb_xlink_cam *xlink_cam)
+{
+	int ret;
+
+	mutex_lock(&xlink_cam->lock);
+
+	if (xlink_cam->ctrl_chan_refcnt) {
+		xlink_cam->ctrl_chan_refcnt++;
+		mutex_unlock(&xlink_cam->lock);
+		return 0;
+	}
+
+	ret = xlink_open_channel(&xlink_cam->handle,
+				 KMB_CAM_XLINK_CTRL_CHAN_ID, RXB_TXB,
+				 KMB_CAM_XLINK_CH_MAX_DATA_SIZE,
+				 KMB_CAM_XLINK_CH_TIMEOUT_MS);
+	if (ret) {
+		dev_err(xlink_cam->dev, "Failed to open xlink control channel %d", ret);
+		mutex_unlock(&xlink_cam->lock);
+		return -ENODEV;
+	}
+
+	xlink_cam->ctrl_chan_refcnt++;
+
+	mutex_unlock(&xlink_cam->lock);
+
+	return 0;
+}
+
+/**
+ * kmb_cam_xlink_close_ctrl_channel - Close xlink control channel
+ * @xlink_cam: Pointer to xlink camera handle
+ *
+ * There is only one control channel for xlink camera communication.
+ * NOTE: The channel is serialized and reference counted.
+ *
+ * Return: 0 if successful, error code otherwise
+ */
+void kmb_cam_xlink_close_ctrl_channel(struct kmb_xlink_cam *xlink_cam)
+{
+	int ret;
+
+	mutex_lock(&xlink_cam->lock);
+
+	if (WARN_ON(!xlink_cam->ctrl_chan_refcnt)) {
+		mutex_unlock(&xlink_cam->lock);
+		return;
+	}
+
+	if (--xlink_cam->ctrl_chan_refcnt) {
+		mutex_unlock(&xlink_cam->lock);
+		return;
+	}
+
+	ret = xlink_close_channel(&xlink_cam->handle, KMB_CAM_XLINK_CTRL_CHAN_ID);
+	if (ret)
+		dev_err(xlink_cam->dev, "Failed to close xlink channel %d", ret);
+
+	mutex_unlock(&xlink_cam->lock);
+}
+
+/**
+ * kmb_cam_xlink_write_ctrl_msg - Write xlink control message
+ * @xlink_cam: Pointer to xlink camera handle
+ * @ctrl_paddr: Physical address of the control message
+ * @ctrl_type: Control message type
+ * @expected_result: Control message expected result
+ *
+ * For each control message there is ack from the VPU camera.
+ * This function check the error against expected result.
+ * NOTE: Because there is only one control channel, the msg/ack
+ *       is sequence serliazed.
+ *
+ * Return: 0 if successful, error code otherwise
+ */
+int kmb_cam_xlink_write_ctrl_msg(struct kmb_xlink_cam *xlink_cam,
+				 dma_addr_t ctrl_paddr, u32 ctrl_type,
+				 u32 expected_result)
+{
+	size_t init_evt_size = sizeof(struct kmb_ic_ev);
+	struct kmb_ic_ev init_evt;
+	int ret;
+
+	mutex_lock(&xlink_cam->lock);
+
+	memset(&init_evt, 0, sizeof(init_evt));
+	init_evt.ctrl = ctrl_type;
+	init_evt.ev_info.user_data_base_addr01 = ctrl_paddr;
+	ret = xlink_write_volatile(&xlink_cam->handle,
+				   KMB_CAM_XLINK_CTRL_CHAN_ID,
+				   (u8 *)&init_evt,
+				   init_evt_size);
+	if (ret) {
+		dev_err(xlink_cam->dev, "Error ret %d ctrl type %d",
+			ret, ctrl_type);
+		ret = -ENODEV;
+		goto error_unlock;
+	}
+
+	ret = xlink_read_data_to_buffer(&xlink_cam->handle,
+					KMB_CAM_XLINK_CTRL_CHAN_ID,
+					(u8 *)&init_evt,
+					(u32 *)&init_evt_size);
+	if (ret) {
+		dev_err(xlink_cam->dev, "Error read ack ret %d", ret);
+		ret = -ENODEV;
+		goto error_unlock;
+	}
+	if (init_evt.ctrl != expected_result) {
+		dev_err(xlink_cam->dev, "Error ctrl type %d evt ctrl %d",
+			ctrl_type, init_evt.ctrl);
+		ret = -EINVAL;
+		goto error_unlock;
+	}
+
+	mutex_unlock(&xlink_cam->lock);
+
+	return 0;
+
+error_unlock:
+	mutex_unlock(&xlink_cam->lock);
+	return ret;
+}
diff --git a/drivers/media/platform/keembay-camera/keembay-cam-xlink.h b/drivers/media/platform/keembay-camera/keembay-cam-xlink.h
index d9a78d847a4b..45e2c003cd33 100644
--- a/drivers/media/platform/keembay-camera/keembay-cam-xlink.h
+++ b/drivers/media/platform/keembay-camera/keembay-cam-xlink.h
@@ -39,4 +39,11 @@ int kmb_cam_xlink_write_msg(struct kmb_xlink_cam *xlink_cam, int chan_id,
 int kmb_cam_xlink_read_msg(struct kmb_xlink_cam *xlink_cam, int chan_id,
 			   u8 *message, u32 msg_size);
 
+int kmb_cam_xlink_open_ctrl_channel(struct kmb_xlink_cam *xlink_cam);
+void kmb_cam_xlink_close_ctrl_channel(struct kmb_xlink_cam *xlink_cam);
+
+int kmb_cam_xlink_write_ctrl_msg(struct kmb_xlink_cam *xlink_cam,
+				 dma_addr_t ctrl_paddr, u32 ctrl_type,
+				 u32 expected_result);
+
 #endif /* KEEMBAY_CAM_XLINK_H */
diff --git a/drivers/media/platform/keembay-camera/keembay-pipeline.c b/drivers/media/platform/keembay-camera/keembay-pipeline.c
index 1ebaa900e4dc..78b2fffa42ee 100644
--- a/drivers/media/platform/keembay-camera/keembay-pipeline.c
+++ b/drivers/media/platform/keembay-camera/keembay-pipeline.c
@@ -2,13 +2,64 @@
 /*
  * Intel Keem Bay camera pipeline.
  *
- * Copyright (C) 2020 Intel Corporation
+ * Copyright (C) 2021 Intel Corporation
  */
+#include <linux/dma-mapping.h>
+#include <linux/idr.h>
+#include <linux/kernel.h>
+#include <linux/xlink.h>
+
 #include <media/v4l2-device.h>
 
+#include "keembay-cam-xlink.h"
 #include "keembay-pipeline.h"
 #include "keembay-vpu-cmd.h"
 
+static void kmb_pipe_print_config(struct kmb_pipeline *pipe)
+{
+	struct kmb_pipe_config_evs *cfg = pipe->pipe_cfg;
+	struct device *dev = pipe->dev;
+	unsigned int i;
+
+	dev_dbg(dev, "\tpipe_id %u\n", cfg->pipe_id);
+	dev_dbg(dev, "\tpipe_type %u\n", cfg->pipe_type);
+	dev_dbg(dev, "\tsrc_type %u\n", cfg->src_type);
+	dev_dbg(dev, "\tpipe_trans_hub %u\n", cfg->pipe_trans_hub);
+	dev_dbg(dev, "\tin_isp_res %ux%u\n",
+		cfg->in_isp_res.w, cfg->in_isp_res.h);
+	dev_dbg(dev, "\tout_isp_res %ux%u\n",
+		cfg->out_isp_res.w, cfg->out_isp_res.h);
+	dev_dbg(dev, "\tin_isp_stride %u\n", cfg->in_isp_stride);
+	dev_dbg(dev, "\tin_exp_offsets[0] %u\n\tin_exp_offsets[1] %u\n"
+		"\tin_exp_offsets[2] %u\n",
+		cfg->in_exp_offsets[0], cfg->in_exp_offsets[1],
+		cfg->in_exp_offsets[2]);
+
+	for (i = 0; i < PIPE_OUTPUT_ID_MAX; i++) {
+		dev_dbg(dev, "\tOUTPUT ID: %d\n", i);
+		dev_dbg(dev, "\t\tout_min_res %ux%u\n",
+			cfg->out_min_res[i].w, cfg->out_min_res[i].h);
+		dev_dbg(dev, "\t\tout_max_res %ux%u\n",
+			cfg->out_max_res[i].w, cfg->out_max_res[i].h);
+	}
+
+	for (i = 0; i < PIPE_OUTPUT_ID_MAX; i++) {
+		dev_dbg(dev, "\tpipe_xlink_chann: %d\n", i);
+		dev_dbg(dev, "\t\tid: %u %ux%u\n",
+			cfg->pipe_xlink_chann[i].id,
+			cfg->pipe_xlink_chann[i].frm_res.w,
+			cfg->pipe_xlink_chann[i].frm_res.h);
+	}
+
+	dev_dbg(dev, "\tkeep_aspect_ratio %u\n", cfg->keep_aspect_ratio);
+	dev_dbg(dev, "\tin_data_width %u\n", cfg->in_data_width);
+	dev_dbg(dev, "\tin_data_packed %u\n", cfg->in_data_packed);
+	dev_dbg(dev, "\tout_data_width %u\n", cfg->out_data_width);
+	dev_dbg(dev, "\tinternal_memory_addr 0x%llx\n",
+		cfg->internal_memory_addr);
+	dev_dbg(dev, "\tinternal_memory_size %u\n", cfg->internal_memory_size);
+}
+
 /**
  * kmb_pipe_init - Initialize KMB Pipeline
  * @pipe: pointer to pipeline object
@@ -20,6 +71,20 @@
 int kmb_pipe_init(struct kmb_pipeline *pipe, struct device *dev,
 		  struct kmb_xlink_cam *xlink_cam)
 {
+	pipe->pipe_cfg = dma_alloc_coherent(dev,
+					    sizeof(*pipe->pipe_cfg),
+					    &pipe->pipe_cfg_paddr, 0);
+	if (!pipe->pipe_cfg)
+		return -ENOMEM;
+
+	mutex_init(&pipe->lock);
+	pipe->pending = 0;
+	pipe->streaming = 0;
+	pipe->state = KMB_PIPE_STATE_UNCONFIGURED;
+
+	pipe->dev = dev;
+	pipe->xlink_cam = xlink_cam;
+
 	return 0;
 }
 
@@ -28,7 +93,10 @@ int kmb_pipe_init(struct kmb_pipeline *pipe, struct device *dev,
  * @pipe: pointer to pipeline object
  */
 void kmb_pipe_cleanup(struct kmb_pipeline *pipe)
-{ }
+{
+	dma_free_coherent(pipe->dev, sizeof(struct kmb_pipe_config_evs),
+			  pipe->pipe_cfg, pipe->pipe_cfg_paddr);
+}
 
 /**
  * kmb_pipe_request - Request a pipeline
@@ -38,7 +106,13 @@ void kmb_pipe_cleanup(struct kmb_pipeline *pipe)
  */
 int kmb_pipe_request(struct kmb_pipeline *pipe)
 {
-	return 0;
+	int ret;
+
+	ret = kmb_cam_xlink_open_ctrl_channel(pipe->xlink_cam);
+	if (ret < 0)
+		dev_err(pipe->dev, "Failed to request control channel");
+
+	return ret;
 }
 
 /**
@@ -46,7 +120,9 @@ int kmb_pipe_request(struct kmb_pipeline *pipe)
  * @pipe: pointer to pipeline object
  */
 void kmb_pipe_release(struct kmb_pipeline *pipe)
-{ }
+{
+	kmb_cam_xlink_close_ctrl_channel(pipe->xlink_cam);
+}
 
 /**
  * kmb_pipe_config_dest - Configure pipeline destination information
@@ -56,7 +132,23 @@ void kmb_pipe_release(struct kmb_pipeline *pipe)
  */
 void kmb_pipe_config_dest(struct kmb_pipeline *pipe, unsigned int output_id,
 			  struct kmb_channel_cfg *channel_cfg)
-{ }
+{
+	mutex_lock(&pipe->lock);
+
+	channel_cfg->frm_res.w =
+		clamp_val(channel_cfg->frm_res.w,
+			  pipe->pipe_cfg->out_min_res[output_id].w,
+			  pipe->pipe_cfg->out_max_res[output_id].w);
+
+	channel_cfg->frm_res.h =
+		clamp_val(channel_cfg->frm_res.h,
+			  pipe->pipe_cfg->out_min_res[output_id].h,
+			  pipe->pipe_cfg->out_max_res[output_id].h);
+
+	pipe->pipe_cfg->pipe_xlink_chann[output_id] = *channel_cfg;
+
+	mutex_unlock(&pipe->lock);
+}
 
 /**
  * kmb_pipe_config_src - Configure pipeline source information
@@ -72,5 +164,46 @@ void kmb_pipe_config_dest(struct kmb_pipeline *pipe, unsigned int output_id,
 int kmb_pipe_config_src(struct kmb_pipeline *pipe,
 			struct kmb_pipe_config_evs *pipe_cfg)
 {
-	return 0;
+	int ret = 0;
+
+	mutex_lock(&pipe->lock);
+
+	switch (pipe->state) {
+	case KMB_PIPE_STATE_CONFIGURED:
+	case KMB_PIPE_STATE_UNCONFIGURED:
+		/* Initialize pipeline configuration and counters */
+		pipe->pending = 0;
+		pipe->streaming = 0;
+
+		/* Store pipeline configuration */
+		*pipe->pipe_cfg = *pipe_cfg;
+
+		/*
+		 * For some reason vpu firmware is returning config pipe as
+		 * result for config pipe control.
+		 */
+		ret = kmb_cam_xlink_write_ctrl_msg(pipe->xlink_cam,
+						   pipe->pipe_cfg_paddr,
+						   KMB_IC_EVENT_TYPE_CONFIG_ISP_PIPE,
+						   KMB_IC_EVENT_TYPE_CONFIG_ISP_PIPE);
+		if (ret < 0) {
+			dev_err(pipe->dev, "Failed to reconfigure pipeline!");
+			break;
+		}
+		kmb_pipe_print_config(pipe);
+
+		pipe->state = KMB_PIPE_STATE_CONFIGURED;
+		break;
+	case KMB_PIPE_STATE_BUILT:
+		dev_err(pipe->dev, "Invalid state transition, already built");
+		break;
+	default:
+		dev_err(pipe->dev,
+			"Config pipe in invalid state %d", pipe->state);
+		ret = -EINVAL;
+		break;
+	}
+
+	mutex_unlock(&pipe->lock);
+	return ret;
 }
-- 
2.11.0

