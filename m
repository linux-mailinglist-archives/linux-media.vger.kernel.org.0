Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA36334240F
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 19:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbhCSSHZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 14:07:25 -0400
Received: from mga09.intel.com ([134.134.136.24]:57280 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230015AbhCSSG5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 14:06:57 -0400
IronPort-SDR: 7H6IG7++OIkR1bWIgAd6OfVEzk46rlTi+rgDTV4BOCcqPCU6UnmVrLXG7PBPlIsMYzu1lN9rSY
 fYW9Wj9wJZPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="190036027"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
   d="scan'208";a="190036027"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 11:06:56 -0700
IronPort-SDR: MPNZj1/5VtKPcxhKvhWQU1tDn0Je9mDtE0uYC3adD5xbv1Exuzidul+LZ90Xl8pn/sGfSYZb4V
 +cZ36EqFAslg==
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
   d="scan'208";a="413605750"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.88.55])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 11:06:53 -0700
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH 06/10] media: Keem Bay Camera: Add ISP sub-device
Date:   Fri, 19 Mar 2021 18:06:28 +0000
Message-Id: <20210319180632.585-7-martinax.krasteva@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
References: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>

ISP sub-device has two sink pads and two source pads.
Sink pads are connected to sensor and metadata params output video node.
Source pads are connected to capture video node and capture metadata.
All links are immutable active and are required for streaming session.
Isp sub-device implements v4l2 event interface, each event
received on VPU ISP channel is also sent as event to userspace.

ISP sub-device is managing ISP configuration buffers, the reason
for that is they are sent through XLink ISP channel.

ISP sub-device is also owner of VPU pipeline. It is responsible
for the pipeline configuration, which is executed on set_fmt pad op
called on sensor source pad.

The source is started/stopped on s_stream video operation.

Build/delete pipeline are executed on video nodes
streaming operations. When all video nodes with active linked
are in stream on state the pipeline is started.

Isp sub-device is using metadata output video nodes for parameters
and filling the statistics to metadata capture video node.
The statistics can be matched with params using buffer sequence number.

V4L2_EVENT_FRAME_SYNC is also support. frame_sequence is matching with
metadata video buffer sequence number.

Signed-off-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
Co-developed-by: Ivan Dimitrov <ivanx.dimitrov@intel.com>
Signed-off-by: Ivan Dimitrov <ivanx.dimitrov@intel.com>
Co-developed-by: Martina Krasteva <martinax.krasteva@intel.com>
Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
---
 drivers/media/platform/keembay-camera/Makefile     |    4 +-
 .../platform/keembay-camera/keembay-cam-xlink.c    |  140 ++
 .../platform/keembay-camera/keembay-cam-xlink.h    |   11 +
 .../media/platform/keembay-camera/keembay-isp.c    | 1348 +++++++++++++++++++-
 .../media/platform/keembay-camera/keembay-isp.h    |   66 +-
 .../platform/keembay-camera/keembay-metadata.c     |   45 +
 .../platform/keembay-camera/keembay-metadata.h     |  150 +++
 .../platform/keembay-camera/keembay-pipeline.c     |   76 ++
 .../platform/keembay-camera/keembay-pipeline.h     |   71 ++
 .../media/platform/keembay-camera/keembay-video.c  |   46 +
 .../media/platform/keembay-camera/keembay-video.h  |   85 ++
 11 files changed, 2029 insertions(+), 13 deletions(-)
 create mode 100644 drivers/media/platform/keembay-camera/keembay-metadata.c
 create mode 100644 drivers/media/platform/keembay-camera/keembay-metadata.h
 create mode 100644 drivers/media/platform/keembay-camera/keembay-pipeline.c
 create mode 100644 drivers/media/platform/keembay-camera/keembay-pipeline.h
 create mode 100644 drivers/media/platform/keembay-camera/keembay-video.c
 create mode 100644 drivers/media/platform/keembay-camera/keembay-video.h

diff --git a/drivers/media/platform/keembay-camera/Makefile b/drivers/media/platform/keembay-camera/Makefile
index ea19b61e6469..8b3ad715c5c4 100644
--- a/drivers/media/platform/keembay-camera/Makefile
+++ b/drivers/media/platform/keembay-camera/Makefile
@@ -1,3 +1,5 @@
-keembay-cam-objs = keembay-camera.o keembay-cam-xlink.o keembay-isp.o
+keembay-cam-objs = keembay-camera.o keembay-pipeline.o \
+		      keembay-cam-xlink.o keembay-isp.o \
+		      keembay-metadata.o keembay-video.o
 
 obj-$(CONFIG_VIDEO_INTEL_KEEMBAY_CAMERA) += keembay-cam.o
diff --git a/drivers/media/platform/keembay-camera/keembay-cam-xlink.c b/drivers/media/platform/keembay-camera/keembay-cam-xlink.c
index e34516de0ff9..49a0937bc9fc 100644
--- a/drivers/media/platform/keembay-camera/keembay-cam-xlink.c
+++ b/drivers/media/platform/keembay-camera/keembay-cam-xlink.c
@@ -6,8 +6,19 @@
  */
 #include <linux/device.h>
 #include <linux/idr.h>
+#include <linux/kernel.h>
+#include <linux/xlink.h>
 
 #include "keembay-cam-xlink.h"
+#include "keembay-vpu-cmd.h"
+
+/* Do not change: it is negotiated on both sides */
+#define KMB_CAM_XLINK_CTRL_CHAN_ID	27
+#define KMB_CAM_XLINK_CHAN_ID_BASE	28
+
+/* Control channel */
+#define KMB_CAM_XLINK_CH_MAX_DATA_SIZE	1024
+#define KMB_CAM_XLINK_CH_TIMEOUT_MS	1000
 
 /**
  * kmb_cam_xlink_init - Initialize xlink for VPU camera communication
@@ -52,3 +63,132 @@ void kmb_cam_xlink_cleanup(struct kmb_xlink_cam *xlink_cam)
 	xlink_disconnect(&xlink_cam->handle);
 	ida_destroy(&xlink_cam->channel_ids);
 }
+
+/**
+ * kmb_cam_xlink_alloc_channel - Allocate xlink camera channel id
+ * @xlink_cam: Pointer to xlink camera handle
+ *
+ * Each xlink channel (except main control) should have unieque id
+ *
+ * Return: Channel id, negative error otherwise
+ */
+int kmb_cam_xlink_alloc_channel(struct kmb_xlink_cam *xlink_cam)
+{
+	int chan_id;
+
+	chan_id = ida_alloc_range(&xlink_cam->channel_ids,
+				  KMB_CAM_XLINK_CHAN_ID_BASE,
+				  U16_MAX, GFP_KERNEL);
+
+	return chan_id;
+}
+
+/**
+ * kmb_cam_xlink_free_channel - Free xlink camera channel id
+ * @xlink_cam: Pointer to xlink camera handle
+ * @chan_id: XLink channel ID
+ */
+void kmb_cam_xlink_free_channel(struct kmb_xlink_cam *xlink_cam, int chan_id)
+{
+	ida_free(&xlink_cam->channel_ids, chan_id);
+}
+
+/**
+ * kmb_cam_xlink_open_channel - Open xlink channel for communication
+ * @xlink_cam: Pointer to xlink camera handle
+ * @chan_id: Xlink channel id to be opened
+ *
+ * Each xlink channel should be open first, to establish communication channel.
+ *
+ * Return: 0 if successful, error code otherwise
+ */
+int kmb_cam_xlink_open_channel(struct kmb_xlink_cam *xlink_cam, int chan_id)
+{
+	int ret;
+
+	ret = xlink_open_channel(&xlink_cam->handle,
+				 chan_id, RXB_TXB,
+				 KMB_CAM_XLINK_CH_MAX_DATA_SIZE,
+				 KMB_CAM_XLINK_CH_TIMEOUT_MS);
+	if (ret) {
+		dev_err(xlink_cam->dev, "Failed to close xlink channel %d", ret);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+/**
+ * kmb_cam_xlink_close_channel - Close xlink channel
+ * @xlink_cam: Pointer to xlink camera handle
+ * @chan_id: Xlink channel id to be closed
+ *
+ * Return: 0 if successful, error code otherwise
+ */
+int kmb_cam_xlink_close_channel(struct kmb_xlink_cam *xlink_cam, int chan_id)
+{
+	int ret;
+
+	ret = xlink_close_channel(&xlink_cam->handle, chan_id);
+	if (ret) {
+		dev_err(xlink_cam->dev, "Failed to close xlink channel %d", ret);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+/**
+ * kmb_cam_xlink_write_msg - Write xlink message
+ * @xlink_cam: Pointer to xlink camera handle
+ * @chan_id: Xlink channel id where message should be writted
+ * @message: Pointer to message to be written in to xlink channel
+ * @msg_size: Size of the message
+ *
+ * Return: 0 if successful, error code otherwise
+ */
+int kmb_cam_xlink_write_msg(struct kmb_xlink_cam *xlink_cam, int chan_id,
+			    u8 *message, u32 msg_size)
+{
+	int ret;
+
+	if (msg_size > KMB_CAM_XLINK_CH_MAX_DATA_SIZE)
+		return -EINVAL;
+
+	ret = xlink_write_volatile(&xlink_cam->handle, chan_id,
+				   message, msg_size);
+	if (ret) {
+		dev_err(xlink_cam->dev, "Fail to write xlink message %d", ret);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+/**
+ * kmb_cam_xlink_read_msg - Read xlink message
+ * @xlink_cam: Pointer to xlink camera handle
+ * @chan_id: Xlink channel id from where message will be read
+ * @message: Pointer to data where read message will be placed
+ * @msg_size: Mas size of data to be read
+ *
+ * Return: Actual size read, negative error code otherwise
+ */
+int kmb_cam_xlink_read_msg(struct kmb_xlink_cam *xlink_cam, int chan_id,
+			   u8 *message, u32 msg_size)
+{
+	u32 written_size = msg_size;
+	int ret;
+
+	if (msg_size > KMB_CAM_XLINK_CH_MAX_DATA_SIZE)
+		return -EINVAL;
+
+	ret = xlink_read_data_to_buffer(&xlink_cam->handle, chan_id,
+					message, &written_size);
+	if (ret) {
+		dev_err(xlink_cam->dev, "Fail to read xlink message %d", ret);
+		return -ENODEV;
+	}
+
+	return written_size;
+}
diff --git a/drivers/media/platform/keembay-camera/keembay-cam-xlink.h b/drivers/media/platform/keembay-camera/keembay-cam-xlink.h
index d219d4298427..d9a78d847a4b 100644
--- a/drivers/media/platform/keembay-camera/keembay-cam-xlink.h
+++ b/drivers/media/platform/keembay-camera/keembay-cam-xlink.h
@@ -28,4 +28,15 @@ struct kmb_xlink_cam {
 int kmb_cam_xlink_init(struct kmb_xlink_cam *xlink_cam, struct device *dev);
 void kmb_cam_xlink_cleanup(struct kmb_xlink_cam *xlink_cam);
 
+int kmb_cam_xlink_alloc_channel(struct kmb_xlink_cam *xlink_cam);
+void kmb_cam_xlink_free_channel(struct kmb_xlink_cam *xlink_cam, int chan_id);
+
+int kmb_cam_xlink_open_channel(struct kmb_xlink_cam *xlink_cam, int chan_id);
+int kmb_cam_xlink_close_channel(struct kmb_xlink_cam *xlink_cam, int chan_id);
+
+int kmb_cam_xlink_write_msg(struct kmb_xlink_cam *xlink_cam, int chan_id,
+			    u8 *message, u32 msg_size);
+int kmb_cam_xlink_read_msg(struct kmb_xlink_cam *xlink_cam, int chan_id,
+			   u8 *message, u32 msg_size);
+
 #endif /* KEEMBAY_CAM_XLINK_H */
diff --git a/drivers/media/platform/keembay-camera/keembay-isp.c b/drivers/media/platform/keembay-camera/keembay-isp.c
index 79f6212e37d9..54e9c70cd46d 100644
--- a/drivers/media/platform/keembay-camera/keembay-isp.c
+++ b/drivers/media/platform/keembay-camera/keembay-isp.c
@@ -4,7 +4,1146 @@
  *
  * Copyright (C) 2021 Intel Corporation
  */
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/freezer.h>
+#include <linux/keembay-isp-ctl.h>
+#include <linux/kthread.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+
 #include "keembay-isp.h"
+#include "keembay-cam-xlink.h"
+#include "keembay-vpu-cmd.h"
+#include "keembay-vpu-pipe.h"
+#include "keembay-vpu-src.h"
+
+#define KMB_ISP_DRV_NAME "keembay-camera-isp"
+
+/* Xlink channel configuration */
+#define KMB_ISP_CH_DATA_SIZE	1024
+#define KMB_ISP_CH_TIMEOUT_MS	5000
+
+/* Predefined event queue length */
+#define KMB_ISP_EVT_Q_LEN	8
+
+/* Wait timeout for stopping isp source */
+#define KMB_STOP_SOURCE_TIMEOUT_MS	1000
+
+enum kmb_isp_stop_method {
+	KMB_ISP_STOP_SYNC = 0,
+	KMB_ISP_STOP_FORCE = 1,
+};
+
+static const struct kmb_isp_source_format source_fmts[] = {
+	{
+		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.bayer_pattern = KMB_IC_BAYER_FORMAT_RGGB,
+		.bpp = 8,
+		.rx_data_type = IC_IPIPE_RAW_8,
+		.dest_fmts = {
+			MEDIA_BUS_FMT_YUYV8_1_5X8,
+			MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+			MEDIA_BUS_FMT_YUV8_1X24,
+		},
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.bayer_pattern = KMB_IC_BAYER_FORMAT_GRBG,
+		.bpp = 8,
+		.rx_data_type = IC_IPIPE_RAW_8,
+		.dest_fmts = {
+			MEDIA_BUS_FMT_YUYV8_1_5X8,
+			MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+			MEDIA_BUS_FMT_YUV8_1X24,
+		},
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.bayer_pattern = KMB_IC_BAYER_FORMAT_GBRG,
+		.bpp = 8,
+		.rx_data_type = IC_IPIPE_RAW_8,
+		.dest_fmts = {
+			MEDIA_BUS_FMT_YUYV8_1_5X8,
+			MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+			MEDIA_BUS_FMT_YUV8_1X24,
+		},
+	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.bayer_pattern = KMB_IC_BAYER_FORMAT_BGGR,
+		.bpp = 8,
+		.rx_data_type = IC_IPIPE_RAW_8,
+		.dest_fmts = {
+			MEDIA_BUS_FMT_YUYV8_1_5X8,
+			MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+			MEDIA_BUS_FMT_YUV8_1X24,
+		},
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.bayer_pattern = KMB_IC_BAYER_FORMAT_RGGB,
+		.bpp = 10,
+		.rx_data_type = IC_IPIPE_RAW_10,
+		.dest_fmts = {
+			MEDIA_BUS_FMT_YUYV8_1_5X8,
+			MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+			MEDIA_BUS_FMT_YUV8_1X24,
+		},
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.bayer_pattern = KMB_IC_BAYER_FORMAT_GRBG,
+		.bpp = 10,
+		.rx_data_type = IC_IPIPE_RAW_10,
+		.dest_fmts = {
+			MEDIA_BUS_FMT_YUYV8_1_5X8,
+			MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+			MEDIA_BUS_FMT_YUV8_1X24,
+		},
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.bayer_pattern = KMB_IC_BAYER_FORMAT_GBRG,
+		.bpp = 10,
+		.rx_data_type = IC_IPIPE_RAW_10,
+		.dest_fmts = {
+			MEDIA_BUS_FMT_YUYV8_1_5X8,
+			MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+			MEDIA_BUS_FMT_YUV8_1X24,
+		},
+	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.bayer_pattern = KMB_IC_BAYER_FORMAT_BGGR,
+		.bpp = 10,
+		.rx_data_type = IC_IPIPE_RAW_10,
+		.dest_fmts = {
+			MEDIA_BUS_FMT_YUYV8_1_5X8,
+			MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+			MEDIA_BUS_FMT_YUV8_1X24,
+		},
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.bayer_pattern = KMB_IC_BAYER_FORMAT_RGGB,
+		.bpp = 12,
+		.rx_data_type = IC_IPIPE_RAW_12,
+		.dest_fmts = {
+			MEDIA_BUS_FMT_YUYV8_1_5X8,
+			MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+			MEDIA_BUS_FMT_YUV8_1X24,
+		},
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.bayer_pattern = KMB_IC_BAYER_FORMAT_GRBG,
+		.bpp = 12,
+		.rx_data_type = IC_IPIPE_RAW_12,
+		.dest_fmts = {
+			MEDIA_BUS_FMT_YUYV8_1_5X8,
+			MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+			MEDIA_BUS_FMT_YUV8_1X24,
+		},
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.bayer_pattern = KMB_IC_BAYER_FORMAT_GBRG,
+		.bpp = 12,
+		.rx_data_type = IC_IPIPE_RAW_12,
+		.dest_fmts = {
+			MEDIA_BUS_FMT_YUYV8_1_5X8,
+			MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+			MEDIA_BUS_FMT_YUV8_1X24,
+		},
+	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.bayer_pattern = KMB_IC_BAYER_FORMAT_BGGR,
+		.bpp = 12,
+		.rx_data_type = IC_IPIPE_RAW_12,
+		.dest_fmts = {
+			MEDIA_BUS_FMT_YUYV8_1_5X8,
+			MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+			MEDIA_BUS_FMT_YUV8_1X24,
+		},
+	},
+	{
+		.code = MEDIA_BUS_FMT_YUYV8_1_5X8,
+		.bayer_pattern = KMB_IC_BAYER_FORMAT_BGGR,
+		.bpp = 8,
+		.rx_data_type = IC_IPIPE_YUV_420_B8,
+		.dest_fmts = {
+			MEDIA_BUS_FMT_YUYV8_1_5X8,
+			MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+			MEDIA_BUS_FMT_YUV8_1X24,
+		},
+	},
+	{
+		.code = MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+		.bayer_pattern = KMB_IC_BAYER_FORMAT_BGGR,
+		.bpp = 8,
+		.rx_data_type = IC_IPIPE_YUV_420_B8,
+		.dest_fmts = {
+			MEDIA_BUS_FMT_YUYV8_1_5X8,
+			MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+			MEDIA_BUS_FMT_YUV8_1X24,
+		},
+	},
+	{
+		.code = MEDIA_BUS_FMT_YUV8_1X24,
+		.bayer_pattern = KMB_IC_BAYER_FORMAT_BGGR,
+		.bpp = 8,
+		.rx_data_type = IC_IPIPE_YUV_420_B8,
+		.dest_fmts = {
+			MEDIA_BUS_FMT_YUYV8_1_5X8,
+			MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+			MEDIA_BUS_FMT_YUV8_1X24,
+		},
+	},
+	{
+		.code = MEDIA_BUS_FMT_Y8_1X8,
+		.bayer_pattern = KMB_IC_BAYER_FORMAT_BGGR,
+		.bpp = 8,
+		.rx_data_type = IC_IPIPE_RAW_8,
+		.dest_fmts = {
+			MEDIA_BUS_FMT_Y8_1X8,
+			MEDIA_BUS_FMT_Y10_1X10,
+		},
+	},
+	{
+		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.bayer_pattern = KMB_IC_BAYER_FORMAT_BGGR,
+		.bpp = 10,
+		.rx_data_type = IC_IPIPE_RAW_10,
+		.dest_fmts = {
+			MEDIA_BUS_FMT_Y8_1X8,
+			MEDIA_BUS_FMT_Y10_1X10,
+		},
+	},
+};
+
+static inline const struct kmb_isp_source_format *
+kmb_isp_get_src_fmt_by_code(u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(source_fmts); i++) {
+		if (source_fmts[i].code == code)
+			return &source_fmts[i];
+	}
+
+	return NULL;
+}
+
+static inline bool
+kmb_isp_valid_destination_format(struct v4l2_mbus_framefmt *mbus_fmt, u32 code)
+{
+	const struct kmb_isp_source_format *src_fmt =
+		kmb_isp_get_src_fmt_by_code(mbus_fmt->code);
+	unsigned int i;
+
+	if (!src_fmt)
+		return false;
+
+	for (i = 0; i < KMB_ISP_MAX_DEST_FMTS; i++)
+		if (src_fmt->dest_fmts[i] == code)
+			return true;
+
+	return false;
+}
+
+static void kmb_isp_meta_buf_done(struct kmb_isp *kmb_isp,
+				  struct kmb_metadata_buf *meta_buf,
+				  enum vb2_buffer_state state)
+{
+	/* Remove isp config on buf done */
+	mutex_lock(&kmb_isp->meta_q_lock);
+	list_del(&meta_buf->list);
+	mutex_unlock(&kmb_isp->meta_q_lock);
+
+	vb2_buffer_done(&meta_buf->vb.vb2_buf, state);
+	dev_dbg(kmb_isp->dev, "Meta buf done %u state %d",
+		meta_buf->vb.sequence, state);
+}
+
+static struct kmb_metadata_buf *
+kmb_isp_find_params_by_addr(struct kmb_isp *kmb_isp, dma_addr_t addr)
+{
+	struct kmb_metadata_buf *meta_buf;
+	struct list_head *node = NULL;
+
+	mutex_lock(&kmb_isp->meta_q_lock);
+
+	list_for_each(node, &kmb_isp->meta_params_process_q) {
+		meta_buf = list_entry(node, struct kmb_metadata_buf, list);
+		if (meta_buf->params.dma_addr_isp == addr) {
+			mutex_unlock(&kmb_isp->meta_q_lock);
+			return meta_buf;
+		}
+	}
+
+	mutex_unlock(&kmb_isp->meta_q_lock);
+
+	return NULL;
+}
+
+static struct kmb_metadata_buf *
+kmb_isp_find_stats_by_seq(struct kmb_isp *kmb_isp, u32 sequence)
+{
+	struct kmb_metadata_buf *meta_buf;
+	struct list_head *node = NULL;
+
+	mutex_lock(&kmb_isp->meta_q_lock);
+
+	list_for_each(node, &kmb_isp->meta_stats_process_q) {
+		meta_buf = list_entry(node, struct kmb_metadata_buf, list);
+		if (meta_buf->vb.sequence == sequence) {
+			mutex_unlock(&kmb_isp->meta_q_lock);
+			return meta_buf;
+		}
+	}
+
+	mutex_unlock(&kmb_isp->meta_q_lock);
+
+	return NULL;
+}
+
+static void kmb_isp_fill_stats_update_flags(struct kmb_metadata_buf *stats_buf,
+					    struct kmb_metadata_buf *param_buf)
+{
+	struct kmb_isp_stats *user_stats =
+		vb2_plane_vaddr(&stats_buf->vb.vb2_buf, 0);
+
+	user_stats->update.ae_awb =
+		param_buf->params.isp->raw.awb_stats_en;
+	user_stats->update.af =
+		param_buf->params.isp->raw.af_stats_en;
+	user_stats->update.luma_hist =
+		param_buf->params.isp->raw.luma_hist_en;
+	user_stats->update.rgb_hist =
+		param_buf->params.isp->raw.awb_rgb_hist_en;
+	user_stats->update.flicker_rows =
+		param_buf->params.isp->raw.flicker_accum_en;
+	/* Dehaze stats is always enabled */
+	user_stats->update.dehaze = true;
+}
+
+static int kmb_isp_process_config(struct kmb_isp *kmb_isp)
+{
+	struct kmb_metadata_buf *param_buf;
+	struct kmb_metadata_buf *stats_buf;
+	struct kmb_ic_ev cfg_evt;
+	int ret;
+
+	mutex_lock(&kmb_isp->meta_q_lock);
+
+	if (list_empty(&kmb_isp->meta_params_pending_q)) {
+		mutex_unlock(&kmb_isp->meta_q_lock);
+		return -EAGAIN;
+	}
+	param_buf = list_first_entry(&kmb_isp->meta_params_pending_q,
+				     struct kmb_metadata_buf, list);
+
+	if (list_empty(&kmb_isp->meta_stats_pending_q)) {
+		mutex_unlock(&kmb_isp->meta_q_lock);
+		return -EAGAIN;
+	}
+	stats_buf = list_first_entry(&kmb_isp->meta_stats_pending_q,
+				     struct kmb_metadata_buf, list);
+
+	list_del(&stats_buf->list);
+	list_del(&param_buf->list);
+
+	mutex_unlock(&kmb_isp->meta_q_lock);
+
+	param_buf->vb.sequence = kmb_isp->sequence++;
+	stats_buf->vb.sequence = param_buf->vb.sequence;
+
+	/* Update header version, user data key and image width */
+	param_buf->params.isp->header_version = KMB_VPU_ISP_ABI_VERSION;
+	param_buf->params.isp->num_exposures = 1;
+	param_buf->params.isp->user_data_key =
+		param_buf->vb.sequence;
+	param_buf->params.isp->image_data_width =
+		kmb_isp->source_fmt->bpp;
+	param_buf->params.isp->bayer_order =
+		kmb_isp->source_fmt->bayer_pattern;
+
+	/* Set stats addresses */
+	memcpy(param_buf->params.isp->raw.stats, stats_buf->stats.raw,
+	       sizeof(param_buf->params.isp->raw.stats));
+	param_buf->params.isp->dehaze.stats_addr =
+		stats_buf->stats.dehaze_stats_addr;
+
+	memset(&cfg_evt, 0, sizeof(cfg_evt));
+	cfg_evt.ctrl = KMB_IC_EVENT_TYPE_CONFIG_ISP;
+	cfg_evt.ev_info.seq_nr = param_buf->vb.sequence;
+	cfg_evt.ev_info.user_data_base_addr01 = param_buf->params.dma_addr_isp;
+	dev_dbg(kmb_isp->dev, "Process config addr %llx",
+		param_buf->params.dma_addr_isp);
+	ret = kmb_cam_xlink_write_msg(kmb_isp->xlink_cam,
+				      kmb_isp->config_chan_id,
+				      (u8 *)&cfg_evt, sizeof(cfg_evt));
+	if (ret < 0) {
+		dev_err(kmb_isp->dev, "Error on process config %d", ret);
+		vb2_buffer_done(&param_buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		vb2_buffer_done(&stats_buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		return ret;
+	}
+
+	/* Update stats update flags */
+	kmb_isp_fill_stats_update_flags(stats_buf, param_buf);
+
+	/* Add to items to the processing list */
+	mutex_lock(&kmb_isp->meta_q_lock);
+	list_add_tail(&param_buf->list, &kmb_isp->meta_params_process_q);
+	list_add_tail(&stats_buf->list, &kmb_isp->meta_stats_process_q);
+	mutex_unlock(&kmb_isp->meta_q_lock);
+
+	return 0;
+}
+
+static int kmb_isp_worker_thread(void *isp)
+{
+	struct kmb_metadata_buf *meta_params;
+	struct kmb_metadata_buf *meta_stats;
+	struct kmb_isp *kmb_isp = isp;
+	struct v4l2_event v4l2_evt;
+	struct kmb_ic_ev cfg_evt;
+	bool stopped = false;
+	u32 base_addr;
+	int ret;
+
+	memset(&v4l2_evt, 0, sizeof(v4l2_evt));
+
+	set_freezable();
+
+	while (!kthread_should_stop()) {
+		try_to_freeze();
+
+		if (stopped) {
+			set_current_state(TASK_INTERRUPTIBLE);
+			schedule();
+			continue;
+		}
+
+		memset(&cfg_evt, 0x00, sizeof(cfg_evt));
+		cfg_evt.ctrl = KMB_IC_EVENT_MAX;
+		ret = kmb_cam_xlink_read_msg(kmb_isp->xlink_cam,
+					     kmb_isp->config_chan_id,
+					     (u8 *)&cfg_evt, sizeof(cfg_evt));
+		if (ret < 0) {
+			stopped = true;
+			complete_all(&kmb_isp->source_stopped);
+			continue;
+		}
+		base_addr = cfg_evt.ev_info.user_data_base_addr01;
+
+		meta_params = kmb_isp_find_params_by_addr(kmb_isp, base_addr);
+
+		switch (cfg_evt.ctrl) {
+		case KMB_IC_EVENT_TYPE_READOUT_START:
+			if (meta_params) {
+				v4l2_evt.type = V4L2_EVENT_FRAME_SYNC;
+				v4l2_evt.u.frame_sync.frame_sequence =
+					meta_params->vb.sequence;
+				v4l2_subdev_notify_event(&kmb_isp->subdev,
+							 &v4l2_evt);
+			} else {
+				dev_err(kmb_isp->dev, "Ouch readout no buf");
+			}
+			/* Process next isp configuration on readout start */
+			kmb_isp_process_config(kmb_isp);
+			break;
+		case KMB_IC_EVENT_TYPE_ISP_END:
+			if (meta_params)
+				kmb_isp_meta_buf_done(kmb_isp, meta_params,
+						      VB2_BUF_STATE_DONE);
+			else
+				dev_err(kmb_isp->dev, "Ouch no params buf");
+			break;
+		case KMB_IC_EVENT_TYPE_STATS_READY:
+			meta_stats = NULL;
+			if (meta_params)
+				meta_stats =
+					kmb_isp_find_stats_by_seq(kmb_isp,
+								  meta_params->vb.sequence);
+
+			if (meta_stats)
+				kmb_isp_meta_buf_done(kmb_isp, meta_stats,
+						      VB2_BUF_STATE_DONE);
+			else
+				dev_err(kmb_isp->dev, "Ouch no stats buf");
+			break;
+		case KMB_IC_ERROR_SRC_MIPI_CFG_SKIPPED:
+			if (meta_params) {
+				kmb_isp_meta_buf_done(kmb_isp, meta_params,
+						      VB2_BUF_STATE_ERROR);
+				meta_stats =
+					kmb_isp_find_stats_by_seq(kmb_isp,
+								  meta_params->vb.sequence);
+				if (meta_stats)
+					kmb_isp_meta_buf_done(kmb_isp,
+							      meta_stats,
+							      VB2_BUF_STATE_ERROR);
+			}
+			break;
+		case KMB_IC_ERROR_SRC_MIPI_CFG_MISSING:
+			/* Process new configuration when vpu is starving */
+			kmb_isp_process_config(kmb_isp);
+			break;
+		case KMB_IC_EVENT_TYPE_SOURCE_STOPPED:
+			complete_all(&kmb_isp->source_stopped);
+			stopped = true;
+			break;
+		default:
+			dev_dbg(kmb_isp->dev, "Received event %d",
+				cfg_evt.ctrl);
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static int kmb_isp_configure_vpu_source(struct kmb_isp *kmb_isp)
+{
+	struct kmb_ic_source_config *src_cfg;
+	struct v4l2_subdev_format *src_fmt;
+	struct kmb_ic_ev mipi_cfg_evt;
+	struct v4l2_subdev *subdev;
+	struct media_pad *rpd;
+	s64 link_freq;
+	int ret;
+
+	if (WARN_ON(!kmb_isp->source_fmt))
+		return -EINVAL;
+
+	/* Get sensor remote pad we need information for pixel clock */
+	rpd = media_entity_remote_pad(&kmb_isp->pads[KMB_ISP_SINK_PAD_SENSOR]);
+	if (!rpd || !is_media_entity_v4l2_subdev(rpd->entity))
+		return -EINVAL;
+
+	subdev = media_entity_to_v4l2_subdev(rpd->entity);
+	if (!subdev)
+		return -EINVAL;
+
+	src_cfg = kmb_isp->msg_vaddr;
+	memset(src_cfg, 0, sizeof(*src_cfg));
+
+	src_fmt = &kmb_isp->active_pad_fmt[KMB_ISP_SINK_PAD_SENSOR];
+
+	/* Full size isp destination is always set on first src pad */
+	src_cfg->camera_output_size.w = src_fmt->format.width;
+	src_cfg->camera_output_size.h = src_fmt->format.height;
+	src_cfg->no_exposure = 1;
+
+	src_cfg->crop_window.x1 = 0;
+	src_cfg->crop_window.x2 = src_cfg->camera_output_size.w;
+	src_cfg->crop_window.y1 = 0;
+	src_cfg->crop_window.y2 = src_cfg->camera_output_size.h;
+
+	src_cfg->bayer_format = kmb_isp->source_fmt->bayer_pattern;
+	src_cfg->bpp = kmb_isp->source_fmt->bpp;
+
+	src_cfg->mipi_rx_data.no_controller = kmb_isp->csi2_config.rx_id;
+	src_cfg->mipi_rx_data.data_mode = 1;
+	src_cfg->mipi_rx_data.no_lanes = kmb_isp->csi2_config.num_lanes;
+	src_cfg->mipi_rx_data.data_type = kmb_isp->source_fmt->rx_data_type;
+
+	link_freq = v4l2_get_link_freq(subdev->ctrl_handler, src_cfg->bpp,
+				       src_cfg->mipi_rx_data.no_lanes * 2);
+	if (link_freq < 0)
+		return link_freq;
+
+	src_cfg->mipi_rx_data.lane_rate_mbps = link_freq * 2;
+
+	src_cfg->metadata_width = src_fmt->format.width;
+	src_cfg->metadata_height = 0;
+	src_cfg->metadata_data_type = IC_IPIPE_EMBEDDED_8BIT;
+
+	memset(&mipi_cfg_evt, 0, sizeof(mipi_cfg_evt));
+	mipi_cfg_evt.ctrl = KMB_IC_EVENT_TYPE_CONFIG_SOURCE;
+	mipi_cfg_evt.ev_info.user_data_base_addr01 = kmb_isp->msg_phy_addr;
+	ret = kmb_cam_xlink_write_msg(kmb_isp->xlink_cam,
+				      kmb_isp->config_chan_id,
+				      (u8 *)&mipi_cfg_evt,
+				      sizeof(mipi_cfg_evt));
+	if (ret < 0) {
+		dev_err(kmb_isp->dev, "Error config source xlink msg %d", ret);
+		return ret;
+	}
+
+	ret = kmb_cam_xlink_read_msg(kmb_isp->xlink_cam,
+				     kmb_isp->config_chan_id,
+				     (u8 *)&mipi_cfg_evt,
+				     sizeof(mipi_cfg_evt));
+	if (ret < 0) {
+		dev_err(kmb_isp->dev, "Error source xlink msg ack %d", ret);
+		return ret;
+	}
+	if (mipi_cfg_evt.ctrl != KMB_IC_EVENT_TYPE_SOURCE_CONFIGURED) {
+		dev_err(kmb_isp->dev, "Error source configured %d",
+			mipi_cfg_evt.ctrl);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int kmb_isp_start_source(struct kmb_isp *kmb_isp)
+{
+	struct kmb_ic_ev cfg_evt;
+	int ret;
+
+	if (WARN_ON(kmb_isp->source_streaming))
+		return -EINVAL;
+
+	memset(&cfg_evt, 0, sizeof(cfg_evt));
+	cfg_evt.ctrl = KMB_IC_EVENT_TYPE_START_SOURCE;
+	cfg_evt.ev_info.inst_id = 0;
+	ret = kmb_cam_xlink_write_msg(kmb_isp->xlink_cam,
+				      kmb_isp->config_chan_id,
+				      (u8 *)&cfg_evt, sizeof(cfg_evt));
+	if (ret < 0) {
+		dev_err(kmb_isp->dev, "Error start source xlink msg %d", ret);
+		return ret;
+	}
+
+	ret = kmb_cam_xlink_read_msg(kmb_isp->xlink_cam,
+				     kmb_isp->config_chan_id,
+				     (u8 *)&cfg_evt, sizeof(cfg_evt));
+	if (ret < 0) {
+		dev_err(kmb_isp->dev, "Error start source msg ack %d", ret);
+		return ret;
+	}
+	if (cfg_evt.ctrl != KMB_IC_EVENT_TYPE_SOURCE_STARTED) {
+		dev_err(kmb_isp->dev, "Error source started ack %d",
+			cfg_evt.ctrl);
+		return -EINVAL;
+	}
+
+	init_completion(&kmb_isp->source_stopped);
+	kmb_isp->thread = kthread_run(kmb_isp_worker_thread, kmb_isp,
+				      "kmb_isp_thread");
+	if (IS_ERR(kmb_isp->thread)) {
+		ret = PTR_ERR(kmb_isp->thread);
+		kmb_isp->thread = NULL;
+		dev_err(kmb_isp->dev, "Thread run failed %d", ret);
+		return ret;
+	}
+
+	kmb_isp->source_streaming = true;
+
+	return 0;
+}
+
+static int kmb_isp_stop_source(struct kmb_isp *kmb_isp,
+			       enum kmb_isp_stop_method method)
+{
+	struct kmb_ic_ev cfg_evt;
+	unsigned long timeout;
+	int ret;
+
+	if (WARN_ON(!kmb_isp->source_streaming))
+		return -EINVAL;
+
+	switch (method) {
+	case KMB_ISP_STOP_SYNC:
+		memset(&cfg_evt, 0, sizeof(cfg_evt));
+		cfg_evt.ctrl = KMB_IC_EVENT_TYPE_STOP_SOURCE;
+		cfg_evt.ev_info.inst_id = 0;
+
+		ret = kmb_cam_xlink_write_msg(kmb_isp->xlink_cam,
+					      kmb_isp->config_chan_id,
+					      (u8 *)&cfg_evt,
+					      sizeof(cfg_evt));
+		if (ret < 0) {
+			dev_err(kmb_isp->dev,
+				"Error stop source xlink msg %d", ret);
+			return ret;
+		}
+
+		timeout = msecs_to_jiffies(KMB_STOP_SOURCE_TIMEOUT_MS);
+		ret = wait_for_completion_timeout(&kmb_isp->source_stopped,
+						  timeout);
+		if (ret == 0) {
+			dev_err(kmb_isp->dev, "Source stopped timeout");
+			return -ETIMEDOUT;
+		}
+		break;
+	case KMB_ISP_STOP_FORCE:
+		/* Stop ISP without notifying VPU. */
+		break;
+	default:
+		dev_err(kmb_isp->dev, "Invalid stop method %d", method);
+		return -EINVAL;
+	}
+
+	ret = kthread_stop(kmb_isp->thread);
+	if (ret < 0) {
+		dev_err(kmb_isp->dev, "Thread stop failed %d", ret);
+		return ret;
+	}
+	kmb_isp->thread = NULL;
+
+	kmb_isp->source_streaming = false;
+
+	return 0;
+}
+
+static void kmb_isp_discard_all_params(struct kmb_isp *kmb_isp)
+{
+	struct kmb_metadata_buf *meta_buf;
+	struct list_head *next = NULL;
+	struct list_head *pos = NULL;
+
+	mutex_lock(&kmb_isp->meta_q_lock);
+	list_for_each_safe(pos, next, &kmb_isp->meta_params_pending_q) {
+		meta_buf = list_entry(pos, struct kmb_metadata_buf, list);
+		list_del(&meta_buf->list);
+		vb2_buffer_done(&meta_buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
+	list_for_each_safe(pos, next, &kmb_isp->meta_params_process_q) {
+		meta_buf = list_entry(pos, struct kmb_metadata_buf, list);
+		list_del(&meta_buf->list);
+		vb2_buffer_done(&meta_buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
+	mutex_unlock(&kmb_isp->meta_q_lock);
+}
+
+/* Params metadata buffer ops */
+static int kmb_isp_queue_params_buf(void *priv, struct kmb_metadata_buf *meta_buf)
+{
+	struct kmb_isp *kmb_isp = priv;
+
+	if (WARN_ON(!priv || !meta_buf))
+		return -EINVAL;
+
+	INIT_LIST_HEAD(&meta_buf->list);
+
+	mutex_lock(&kmb_isp->meta_q_lock);
+	list_add_tail(&meta_buf->list, &kmb_isp->meta_params_pending_q);
+	mutex_unlock(&kmb_isp->meta_q_lock);
+
+	return 0;
+}
+
+static void kmb_isp_queue_params_flush(void *priv)
+{
+	struct kmb_isp *kmb_isp = priv;
+
+	kmb_isp_discard_all_params(kmb_isp);
+}
+
+/* Statistics metadata buffer ops */
+static const struct kmb_metabuf_queue_ops isp_params_queue_ops = {
+	.queue = kmb_isp_queue_params_buf,
+	.flush = kmb_isp_queue_params_flush,
+};
+
+static void kmb_isp_discard_all_stats(struct kmb_isp *kmb_isp)
+{
+	struct kmb_metadata_buf *meta_buf;
+	struct list_head *next = NULL;
+	struct list_head *pos = NULL;
+
+	mutex_lock(&kmb_isp->meta_q_lock);
+	list_for_each_safe(pos, next, &kmb_isp->meta_stats_pending_q) {
+		meta_buf = list_entry(pos, struct kmb_metadata_buf, list);
+		list_del(&meta_buf->list);
+		vb2_buffer_done(&meta_buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
+	list_for_each_safe(pos, next, &kmb_isp->meta_stats_process_q) {
+		meta_buf = list_entry(pos, struct kmb_metadata_buf, list);
+		list_del(&meta_buf->list);
+		vb2_buffer_done(&meta_buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+	}
+	mutex_unlock(&kmb_isp->meta_q_lock);
+}
+
+static int kmb_isp_queue_stats_buf(void *priv, struct kmb_metadata_buf *meta_buf)
+{
+	struct kmb_isp *kmb_isp = priv;
+
+	if (WARN_ON(!priv || !meta_buf))
+		return -EINVAL;
+
+	INIT_LIST_HEAD(&meta_buf->list);
+
+	mutex_lock(&kmb_isp->meta_q_lock);
+	list_add_tail(&meta_buf->list, &kmb_isp->meta_stats_pending_q);
+	mutex_unlock(&kmb_isp->meta_q_lock);
+
+	return 0;
+}
+
+static void kmb_isp_queue_stats_flush(void *priv)
+{
+	struct kmb_isp *kmb_isp = priv;
+
+	kmb_isp_discard_all_stats(kmb_isp);
+}
+
+static const struct kmb_metabuf_queue_ops isp_stats_queue_ops = {
+	.queue = kmb_isp_queue_stats_buf,
+	.flush = kmb_isp_queue_stats_flush,
+};
+
+static int kmb_isp_subdev_get_fmt(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_format *fmt)
+{
+	struct kmb_isp *kmb_isp = v4l2_get_subdevdata(sd);
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+	} else {
+		mutex_lock(&kmb_isp->lock);
+		fmt->format = kmb_isp->active_pad_fmt[fmt->pad].format;
+		mutex_unlock(&kmb_isp->lock);
+	}
+
+	return 0;
+}
+
+static int kmb_isp_config_pipe_src(struct kmb_isp *kmb_isp,
+				   struct kmb_pipeline *pipe,
+				   struct v4l2_mbus_framefmt *mbus_fmt)
+{
+	const struct kmb_isp_source_format *fmt_info;
+	int ret;
+
+	fmt_info = kmb_isp_get_src_fmt_by_code(mbus_fmt->code);
+	if (!fmt_info) {
+		dev_err(kmb_isp->dev, "Format code not supported %d",
+			mbus_fmt->code);
+		return -EINVAL;
+	}
+
+	/* Clean any previous configurations */
+	memset(&kmb_isp->pipe_cfg, 0x00, sizeof(kmb_isp->pipe_cfg));
+	kmb_isp->pipe_cfg.pipe_type = PIPE_TYPE_ISP_ISP_ULL;
+	kmb_isp->pipe_cfg.src_type = SRC_TYPE_ALLOC_VPU_DATA_MIPI;
+	kmb_isp->pipe_cfg.pipe_trans_hub = PIPE_TRANSFORM_HUB_NONE;
+
+	kmb_isp->pipe_cfg.in_isp_res.w = mbus_fmt->width;
+	kmb_isp->pipe_cfg.in_isp_res.h = mbus_fmt->height;
+
+	kmb_isp->pipe_cfg.in_data_width = fmt_info->bpp;
+	kmb_isp->pipe_cfg.in_data_packed = 1;
+
+	kmb_isp->pipe_cfg.in_isp_stride = (kmb_isp->pipe_cfg.in_isp_res.w *
+				kmb_isp->pipe_cfg.in_isp_res.h *
+				kmb_isp->pipe_cfg.in_data_width) / 8;
+
+	/* Always set to 8 required by the vpu firmware */
+	kmb_isp->pipe_cfg.out_data_width = 8;
+
+	/* Isp does not have scaler */
+	kmb_isp->pipe_cfg.out_isp_res = kmb_isp->pipe_cfg.in_isp_res;
+
+	ret = kmb_pipe_config_src(pipe, &kmb_isp->pipe_cfg);
+	if (ret < 0)
+		return ret;
+
+	kmb_isp->source_fmt = fmt_info;
+
+	return 0;
+}
+
+static int kmb_isp_subdev_set_fmt(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_format *sd_fmt)
+{
+	struct kmb_isp *kmb_isp = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt *mbus_fmt;
+	struct kmb_channel_cfg channel_cfg;
+	struct kmb_pipeline *pipe;
+	int ret;
+
+	mutex_lock(&kmb_isp->lock);
+	if (sd_fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+		pipe = &kmb_isp->try_pipe;
+		mbus_fmt = v4l2_subdev_get_try_format(sd, cfg, sd_fmt->pad);
+	} else {
+		pipe = &kmb_isp->active_pipe;
+		mbus_fmt = &kmb_isp->active_pad_fmt[sd_fmt->pad].format;
+	}
+	mutex_unlock(&kmb_isp->lock);
+
+	switch (sd_fmt->pad) {
+	case KMB_ISP_SINK_PAD_SENSOR:
+		ret = kmb_isp_config_pipe_src(kmb_isp, pipe, &sd_fmt->format);
+		if (ret < 0)
+			return ret;
+
+		/* Configure first isp control channel */
+		channel_cfg.frm_res.w = sd_fmt->format.width;
+		channel_cfg.frm_res.h = sd_fmt->format.height;
+		channel_cfg.id = kmb_isp->config_chan_id;
+		kmb_pipe_config_dest(pipe, PIPE_OUTPUT_ID_ISP_CTRL,
+				     &channel_cfg);
+
+		/* Set default resolution of destination channel */
+		channel_cfg.frm_res.w = sd_fmt->format.width;
+		channel_cfg.frm_res.h = sd_fmt->format.height;
+		channel_cfg.id = kmb_isp->capture_chan_id;
+		kmb_pipe_config_dest(pipe, PIPE_OUTPUT_ID_0, &channel_cfg);
+
+		sd_fmt->format.width = channel_cfg.frm_res.w;
+		sd_fmt->format.height = channel_cfg.frm_res.h;
+		break;
+	case KMB_ISP_SRC_PAD_VID: {
+		struct v4l2_mbus_framefmt *mbus_src_fmt;
+
+		mutex_lock(&kmb_isp->lock);
+		if (sd_fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+			mbus_src_fmt =
+				v4l2_subdev_get_try_format(sd, cfg,
+							   KMB_ISP_SINK_PAD_SENSOR);
+		else
+			mbus_src_fmt =
+				&kmb_isp->active_pad_fmt[KMB_ISP_SINK_PAD_SENSOR].format;
+		mutex_unlock(&kmb_isp->lock);
+
+		if (!kmb_isp_valid_destination_format(mbus_src_fmt,
+						      sd_fmt->format.code))
+			return -EINVAL;
+
+		channel_cfg.frm_res.w = sd_fmt->format.width;
+		channel_cfg.frm_res.h = sd_fmt->format.height;
+		channel_cfg.id = kmb_isp->capture_chan_id;
+		kmb_pipe_config_dest(pipe, PIPE_OUTPUT_ID_0, &channel_cfg);
+
+		sd_fmt->format.width = channel_cfg.frm_res.w;
+		sd_fmt->format.height = channel_cfg.frm_res.h;
+		break;
+	}
+	case KMB_ISP_SINK_PAD_PARAM:
+	case KMB_ISP_SRC_PAD_STATS:
+		/* Isp config metadata sink format can be just fixed */
+		if (sd_fmt->format.code != MEDIA_BUS_FMT_FIXED)
+			return -EINVAL;
+		break;
+	}
+
+	mutex_lock(&kmb_isp->lock);
+	*mbus_fmt = sd_fmt->format;
+	mutex_unlock(&kmb_isp->lock);
+
+	return 0;
+}
+
+static int
+kmb_isp_subdev_enum_mbus_code(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_mbus_code_enum *code)
+{
+	switch (code->pad) {
+	case KMB_ISP_SINK_PAD_SENSOR:
+		if (code->index >= ARRAY_SIZE(source_fmts))
+			return -EINVAL;
+
+		code->code = source_fmts[code->index].code;
+		break;
+	case KMB_ISP_SRC_PAD_VID: {
+		struct kmb_isp *kmb_isp = v4l2_get_subdevdata(sd);
+		const struct kmb_isp_source_format *src_fmt;
+		struct v4l2_mbus_framefmt *mbus_src_fmt;
+
+		mutex_lock(&kmb_isp->lock);
+
+		if (code->which == V4L2_SUBDEV_FORMAT_TRY)
+			mbus_src_fmt =
+				v4l2_subdev_get_try_format(sd, cfg,
+							   KMB_ISP_SINK_PAD_SENSOR);
+		else
+			mbus_src_fmt =
+				&kmb_isp->active_pad_fmt[KMB_ISP_SINK_PAD_SENSOR].format;
+
+		mutex_unlock(&kmb_isp->lock);
+
+		src_fmt = kmb_isp_get_src_fmt_by_code(mbus_src_fmt->code);
+		if (!src_fmt)
+			return -EINVAL;
+
+		if (code->index >= ARRAY_SIZE(src_fmt->dest_fmts))
+			return -EINVAL;
+
+		if (!src_fmt->dest_fmts[code->index])
+			return -EINVAL;
+
+		code->code = src_fmt->dest_fmts[code->index];
+		break;
+	}
+	case KMB_ISP_SINK_PAD_PARAM:
+	case KMB_ISP_SRC_PAD_STATS:
+		if (code->index > 0)
+			return -EINVAL;
+
+		code->code = MEDIA_BUS_FMT_FIXED;
+		break;
+	}
+
+	return 0;
+}
+
+static int kmb_isp_src_s_stream(struct kmb_isp *kmb_isp, int enable)
+{
+	struct v4l2_subdev *subdev;
+	struct media_pad *remote;
+	int ret;
+
+	remote = media_entity_remote_pad(&kmb_isp->pads[KMB_ISP_SINK_PAD_SENSOR]);
+	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
+		return -EINVAL;
+
+	subdev = media_entity_to_v4l2_subdev(remote->entity);
+	if (!subdev)
+		return -EINVAL;
+
+	ret = v4l2_subdev_call(subdev, video, s_stream, enable);
+	if (ret < 0 && ret != -ENOIOCTLCMD)
+		dev_err(kmb_isp->dev, "Cannot set source stream %d", enable);
+
+	return ret != -ENOIOCTLCMD ? ret : 0;
+}
+
+static int kmb_isp_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct kmb_isp *kmb_isp = v4l2_get_subdevdata(sd);
+	int ret;
+
+	mutex_lock(&kmb_isp->lock);
+
+	/* Don't send isp config on stream disable */
+	if (enable) {
+		ret = kmb_cam_xlink_open_channel(kmb_isp->xlink_cam,
+						 kmb_isp->config_chan_id);
+		if (ret < 0) {
+			dev_err(kmb_isp->dev,
+				"Fail to open xlink channel %d", ret);
+			goto error_unlock;
+		}
+
+		ret = kmb_isp_configure_vpu_source(kmb_isp);
+		if (ret)
+			goto error_close_xlink_channel;
+
+		/* Process first configuration on stream enable */
+		ret = kmb_isp_process_config(kmb_isp);
+		if (ret)
+			goto error_close_xlink_channel;
+
+		ret = kmb_isp_start_source(kmb_isp);
+		if (ret)
+			goto error_discard_metadata;
+
+		ret = kmb_isp_src_s_stream(kmb_isp, enable);
+		if (ret)
+			goto error_isp_stop_source;
+
+		kmb_isp->isp_streaming = true;
+	} else {
+		/* Try top to stop the source synchronized */
+		if (kmb_isp->source_streaming)
+			kmb_isp_stop_source(kmb_isp, KMB_ISP_STOP_SYNC);
+
+		kmb_cam_xlink_close_channel(kmb_isp->xlink_cam,
+					    kmb_isp->config_chan_id);
+
+		/* Force stop isp if still streaming after channel is closed */
+		if (kmb_isp->source_streaming)
+			kmb_isp_stop_source(kmb_isp, KMB_ISP_STOP_FORCE);
+
+		/* Discard all unprocessed params and statistics */
+		kmb_isp_discard_all_params(kmb_isp);
+		kmb_isp_discard_all_stats(kmb_isp);
+
+		kmb_isp_src_s_stream(kmb_isp, enable);
+
+		kmb_isp->isp_streaming = false;
+		kmb_isp->sequence = 0;
+	}
+
+	mutex_unlock(&kmb_isp->lock);
+
+	return 0;
+
+error_isp_stop_source:
+	kmb_isp_stop_source(kmb_isp, KMB_ISP_STOP_FORCE);
+error_discard_metadata:
+	kmb_isp_discard_all_params(kmb_isp);
+	kmb_isp_discard_all_stats(kmb_isp);
+error_close_xlink_channel:
+	xlink_close_channel(&kmb_isp->xlink_cam->handle,
+			    kmb_isp->config_chan_id);
+error_unlock:
+	mutex_unlock(&kmb_isp->lock);
+
+	return ret;
+}
+
+static int kmb_isp_subscribe_event(struct v4l2_subdev *sd,
+				   struct v4l2_fh *fh,
+				   struct v4l2_event_subscription *sub)
+{
+	return v4l2_event_subscribe(fh, sub, KMB_ISP_EVT_Q_LEN, NULL);
+}
+
+/* sub-device core operations */
+static struct v4l2_subdev_core_ops kmb_isp_subdev_core_ops = {
+	.subscribe_event = kmb_isp_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+/* sub-device video operations */
+static struct v4l2_subdev_video_ops kmb_isp_subdev_video_ops = {
+	.s_stream = kmb_isp_s_stream,
+};
+
+/* sub-device pad operations */
+static struct v4l2_subdev_pad_ops kmb_isp_subdev_pad_ops = {
+	.set_fmt = kmb_isp_subdev_set_fmt,
+	.get_fmt = kmb_isp_subdev_get_fmt,
+	.enum_mbus_code = kmb_isp_subdev_enum_mbus_code,
+};
+
+/* sub-device operations */
+static const struct v4l2_subdev_ops kmb_isp_subdev_ops = {
+	.core = &kmb_isp_subdev_core_ops,
+	.video = &kmb_isp_subdev_video_ops,
+	.pad = &kmb_isp_subdev_pad_ops,
+};
+
+/* sub-device internal operations */
+static int kmb_isp_open(struct v4l2_subdev *sd,
+			struct v4l2_subdev_fh *fh)
+{
+	struct kmb_isp *kmb_isp = v4l2_get_subdevdata(sd);
+
+	return kmb_pipe_request(&kmb_isp->active_pipe);
+}
+
+static int kmb_isp_close(struct v4l2_subdev *sd,
+			 struct v4l2_subdev_fh *fh)
+{
+	struct kmb_isp *kmb_isp = v4l2_get_subdevdata(sd);
+
+	kmb_pipe_release(&kmb_isp->active_pipe);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops kmb_isp_internal_ops = {
+	.open = kmb_isp_open,
+	.close = kmb_isp_close,
+};
 
 /**
  * kmb_isp_init - Initialize Kmb isp subdevice
@@ -19,7 +1158,90 @@ int kmb_isp_init(struct kmb_isp *kmb_isp, struct device *dev,
 		 struct kmb_isp_csi2_config *csi2_config,
 		 struct kmb_xlink_cam *xlink_cam)
 {
+	int ret;
+
+	v4l2_subdev_init(&kmb_isp->subdev, &kmb_isp_subdev_ops);
+	v4l2_set_subdevdata(&kmb_isp->subdev, kmb_isp);
+
+	ret = kmb_pipe_init(&kmb_isp->active_pipe, dev, xlink_cam);
+	if (ret < 0)
+		return ret;
+
+	ret = kmb_pipe_init(&kmb_isp->try_pipe, dev, xlink_cam);
+	if (ret < 0)
+		goto error_cleanup_active_pipeline;
+
+	INIT_LIST_HEAD(&kmb_isp->meta_params_pending_q);
+	INIT_LIST_HEAD(&kmb_isp->meta_params_process_q);
+	INIT_LIST_HEAD(&kmb_isp->meta_stats_pending_q);
+	INIT_LIST_HEAD(&kmb_isp->meta_stats_process_q);
+
+	kmb_isp->isp_streaming = false;
+
+	kmb_isp->dev = dev;
+	kmb_isp->xlink_cam = xlink_cam;
+
+	ret = kmb_cam_xlink_alloc_channel(kmb_isp->xlink_cam);
+	if (ret < 0)
+		goto error_cleanup_try_pipeline;
+
+	kmb_isp->config_chan_id = ret;
+
+	/* Video nodes are connected only to active pipes */
+	kmb_isp->params.dma_dev = dev;
+	kmb_isp->params.pipe = &kmb_isp->active_pipe;
+	kmb_isp->params.queue_ops = &isp_params_queue_ops;
+	kmb_isp->params.priv = kmb_isp;
+	kmb_isp->params.type = KMB_METADATA_PARAMS;
+	ret = kmb_metadata_init(&kmb_isp->params);
+	if (ret < 0)
+		goto error_free_config_channel_id;
+
+	kmb_isp->stats.dma_dev = dev;
+	kmb_isp->stats.pipe = &kmb_isp->active_pipe;
+	kmb_isp->stats.queue_ops = &isp_stats_queue_ops;
+	kmb_isp->stats.priv = kmb_isp;
+	kmb_isp->stats.type = KMB_METADATA_STATS;
+	ret = kmb_metadata_init(&kmb_isp->stats);
+	if (ret < 0)
+		goto error_metadata_params_cleanup;
+
+	ret = kmb_cam_xlink_alloc_channel(kmb_isp->xlink_cam);
+	if (ret < 0)
+		goto error_metadata_stats_cleanup;
+
+	kmb_isp->capture_chan_id = ret;
+	kmb_isp->capture.dma_dev = dev;
+	kmb_isp->capture.pipe = &kmb_isp->active_pipe;
+	kmb_isp->capture.chan_id = kmb_isp->capture_chan_id;
+	kmb_isp->capture.xlink_cam = kmb_isp->xlink_cam;
+	ret = kmb_video_init(&kmb_isp->capture, "kmb-video-capture");
+	if (ret < 0)
+		goto error_free_capture_channel_id;
+
+	kmb_isp->csi2_config = *csi2_config;
+
+	mutex_init(&kmb_isp->lock);
+	mutex_init(&kmb_isp->meta_q_lock);
+
 	return 0;
+
+error_free_capture_channel_id:
+	kmb_cam_xlink_free_channel(kmb_isp->xlink_cam,
+				   kmb_isp->capture_chan_id);
+error_metadata_stats_cleanup:
+	kmb_metadata_cleanup(&kmb_isp->stats);
+error_metadata_params_cleanup:
+	kmb_metadata_cleanup(&kmb_isp->params);
+error_free_config_channel_id:
+	kmb_cam_xlink_free_channel(kmb_isp->xlink_cam,
+				   kmb_isp->config_chan_id);
+error_cleanup_try_pipeline:
+	kmb_pipe_cleanup(&kmb_isp->try_pipe);
+error_cleanup_active_pipeline:
+	kmb_pipe_cleanup(&kmb_isp->active_pipe);
+
+	return ret;
 }
 
 /**
@@ -27,7 +1249,20 @@ int kmb_isp_init(struct kmb_isp *kmb_isp, struct device *dev,
  * @kmb_isp: Pointer to kmb isp sub-device
  */
 void kmb_isp_cleanup(struct kmb_isp *kmb_isp)
-{ }
+{
+	kmb_video_cleanup(&kmb_isp->capture);
+	kmb_cam_xlink_free_channel(kmb_isp->xlink_cam,
+				   kmb_isp->capture_chan_id);
+
+	kmb_metadata_cleanup(&kmb_isp->stats);
+	kmb_metadata_cleanup(&kmb_isp->params);
+
+	kmb_cam_xlink_free_channel(kmb_isp->xlink_cam,
+				   kmb_isp->config_chan_id);
+
+	mutex_destroy(&kmb_isp->meta_q_lock);
+	mutex_destroy(&kmb_isp->lock);
+}
 
 /**
  * kmb_isp_register_entities - Register entities
@@ -42,7 +1277,107 @@ void kmb_isp_cleanup(struct kmb_isp *kmb_isp)
 int kmb_isp_register_entities(struct kmb_isp *kmb_isp,
 			      struct v4l2_device *v4l2_dev)
 {
+	struct media_pad *pads = kmb_isp->pads;
+	struct device *dev = kmb_isp->dev;
+	int ret;
+
+	/* Memory for xlink messages */
+	kmb_isp->msg_vaddr = NULL;
+	kmb_isp->msg_phy_addr = 0;
+	kmb_isp->msg_vaddr = dma_alloc_coherent(kmb_isp->dev,
+						KMB_ISP_CH_DATA_SIZE,
+						&kmb_isp->msg_phy_addr, 0);
+	if (!kmb_isp->msg_vaddr) {
+		dev_err(dev, "Fail to allocate msg dma memory");
+		return -ENOMEM;
+	}
+
+	kmb_isp->subdev.internal_ops = &kmb_isp_internal_ops;
+	kmb_isp->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+				 V4L2_SUBDEV_FL_HAS_EVENTS;
+	kmb_isp->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
+	strscpy(kmb_isp->subdev.name, KMB_ISP_DRV_NAME,
+		sizeof(kmb_isp->subdev.name));
+
+	pads[KMB_ISP_SINK_PAD_SENSOR].flags = MEDIA_PAD_FL_SINK;
+	pads[KMB_ISP_SINK_PAD_PARAM].flags = MEDIA_PAD_FL_SINK;
+	pads[KMB_ISP_SRC_PAD_STATS].flags = MEDIA_PAD_FL_SOURCE;
+	pads[KMB_ISP_SRC_PAD_VID].flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&kmb_isp->subdev.entity,
+				     KMB_ISP_PADS_NUM, pads);
+	if (ret < 0) {
+		dev_err(dev, "Fail to init media entity");
+		return ret;
+	}
+
+	ret = v4l2_device_register_subdev(v4l2_dev, &kmb_isp->subdev);
+	if (ret < 0) {
+		dev_err(dev, "Fail to register media entity");
+		return ret;
+	}
+
+	/* Register video nodes */
+	ret = kmb_metadata_register(&kmb_isp->params, v4l2_dev);
+	if (ret < 0)
+		goto error_unregister_subdev;
+
+	ret = media_create_pad_link(&kmb_isp->params.video.entity,
+				    0,
+				    &kmb_isp->subdev.entity,
+				    KMB_ISP_SINK_PAD_PARAM,
+				    MEDIA_LNK_FL_IMMUTABLE |
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret < 0) {
+		dev_err(kmb_isp->dev, "Fail to link %s->%s entities",
+			kmb_isp->params.video.entity.name,
+			kmb_isp->subdev.entity.name);
+		goto error_unregister_params;
+	}
+
+	ret = kmb_metadata_register(&kmb_isp->stats, v4l2_dev);
+	if (ret < 0)
+		goto error_unregister_params;
+
+	ret = media_create_pad_link(&kmb_isp->subdev.entity,
+				    KMB_ISP_SRC_PAD_STATS,
+				    &kmb_isp->stats.video.entity, 0,
+				    MEDIA_LNK_FL_IMMUTABLE |
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret < 0) {
+		dev_err(kmb_isp->dev, "Fail to link %s->%s entities",
+			kmb_isp->stats.video.entity.name,
+			kmb_isp->subdev.entity.name);
+		goto error_unregister_stats;
+	}
+
+	ret = kmb_video_register(&kmb_isp->capture, v4l2_dev);
+	if (ret < 0)
+		goto error_unregister_stats;
+
+	ret = media_create_pad_link(&kmb_isp->subdev.entity,
+				    KMB_ISP_SRC_PAD_VID,
+				    &kmb_isp->capture.video->entity, 0,
+				    MEDIA_LNK_FL_IMMUTABLE |
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret < 0) {
+		dev_err(kmb_isp->dev, "Fail to link %s->%s entities",
+			kmb_isp->subdev.entity.name,
+			kmb_isp->capture.video->entity.name);
+		goto error_unregister_video;
+	}
+
 	return 0;
+
+error_unregister_video:
+	kmb_video_unregister(&kmb_isp->capture);
+error_unregister_stats:
+	kmb_metadata_unregister(&kmb_isp->stats);
+error_unregister_params:
+	kmb_metadata_unregister(&kmb_isp->params);
+error_unregister_subdev:
+	v4l2_device_unregister_subdev(&kmb_isp->subdev);
+
+	return ret;
 }
 
 /**
@@ -50,4 +1385,13 @@ int kmb_isp_register_entities(struct kmb_isp *kmb_isp,
  * @kmb_isp: pointer to kmb isp device
  */
 void kmb_isp_unregister_entities(struct kmb_isp *kmb_isp)
-{ }
+{
+	dma_free_coherent(kmb_isp->dev, KMB_ISP_CH_DATA_SIZE,
+			  kmb_isp->msg_vaddr, kmb_isp->msg_phy_addr);
+
+	kmb_video_unregister(&kmb_isp->capture);
+	kmb_metadata_unregister(&kmb_isp->stats);
+	kmb_metadata_unregister(&kmb_isp->params);
+
+	v4l2_device_unregister_subdev(&kmb_isp->subdev);
+}
diff --git a/drivers/media/platform/keembay-camera/keembay-isp.h b/drivers/media/platform/keembay-camera/keembay-isp.h
index 35af6c644676..883eafada164 100644
--- a/drivers/media/platform/keembay-camera/keembay-isp.h
+++ b/drivers/media/platform/keembay-camera/keembay-isp.h
@@ -10,12 +10,17 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-subdev.h>
 
-#define KMB_ISP_DRV_NAME	"keembay-camera-isp"
+#include "keembay-metadata.h"
+#include "keembay-pipeline.h"
+#include "keembay-video.h"
 
 #define KMB_ISP_SINK_PAD_SENSOR	0
-#define KMB_ISP_SINK_PAD_CFG	1
-#define KMB_ISP_SRC_PAD_VID	2
-#define KMB_ISP_PADS_NUM	3
+#define KMB_ISP_SINK_PAD_PARAM	1
+#define KMB_ISP_SRC_PAD_STATS	2
+#define KMB_ISP_SRC_PAD_VID	3
+#define KMB_ISP_PADS_NUM	4
+
+#define KMB_ISP_MAX_DEST_FMTS	5
 
 /**
  * struct kmb_isp_csi2_config - Isp csi2 configuration
@@ -28,25 +33,52 @@ struct kmb_isp_csi2_config {
 };
 
 /**
+ * struct kmb_isp_source_format - Isp source format
+ * @code: V4l2 media bus code for the format
+ * @bayer_pattern: Bayer format
+ * @bpp: Bits per pixel
+ * @rx_data_type: Receiver data type
+ * @dest_fmts: Supported destination formats
+ */
+struct kmb_isp_source_format {
+	u32 code;
+	u32 bayer_pattern;
+	u32 bpp;
+	enum kmb_ic_mipi_rx_data_type rx_data_type;
+	u32 dest_fmts[KMB_ISP_MAX_DEST_FMTS];
+};
+
+/**
  * struct kmb_isp - Keem Bay camera ISP device structure
  * @dev: Pointer to basic device structure
  * @lock: Mutex serilizing access to ISP device
  * @thread: Pointer to worker thread data
- * @xlink_cam: Xlink camera communication handler
+ * @xlink_cam: Pointer to xlink camera communication handler
  * @msg_phy_addr: ISP channel physical CMA address
  * @msg_vaddr: ISP channel virtual CMA address
- * @cfg_q_lock: Mutex to serialize access to isp cfg bufferss queue
- * @isp_cfgs_queue: Isp cfg buffers queue
+ * @meta_q_lock: Mutex to protect metadata buffers queues
+ * @meta_params_pending_q: Metadata params pending queue
+ * @meta_params_process_q: Metadata params processing queue
+ * @meta_stats_pending_q: Metadata statistics pending queue
+ * @meta_stats_process_q: Metadata statistics processing queue
  * @isp_streaming: Flag to indicate ISP state
  * @source_streaming: Flag to indicate source state
  * @source_stopped: Completion to wait until VPU source is stopped
  * @subdev: V4L2 sub-device
  * @pads: Array of supported isp pads
+ * @active_pipe: VPU pipeline instance used for active format and streaming
  * @active_pad_fmt: Array holding active pad formats
+ * @try_pipe: VPU pipeline instance used for try format
  * @try_pad_fmt: Array holding try pad formats
  * @csi2_config: CSI2 configuration
  * @source_fmt: Pointer to isp source format
- * @sequence: frame sequence number
+ * @pipe_cfg: VPU pipeline configuration structure
+ * @config_chan_id: Isp config channel id
+ * @stats: Statistics video node
+ * @params: Params video node
+ * @capture_chan_id: Capture xlink channel id
+ * @capture: Isp capture video node
+ * @sequence: Frame sequence number
  */
 struct kmb_isp {
 	struct device *dev;
@@ -58,8 +90,11 @@ struct kmb_isp {
 	dma_addr_t msg_phy_addr;
 	void *msg_vaddr;
 
-	struct mutex cfg_q_lock;
-	struct list_head isp_cfgs_queue;
+	struct mutex meta_q_lock;
+	struct list_head meta_params_pending_q;
+	struct list_head meta_params_process_q;
+	struct list_head meta_stats_pending_q;
+	struct list_head meta_stats_process_q;
 
 	bool isp_streaming;
 	bool source_streaming;
@@ -68,13 +103,24 @@ struct kmb_isp {
 	struct v4l2_subdev subdev;
 	struct media_pad pads[KMB_ISP_PADS_NUM];
 
+	struct kmb_pipeline active_pipe;
 	struct v4l2_subdev_format active_pad_fmt[KMB_ISP_PADS_NUM];
 
+	struct kmb_pipeline try_pipe;
 	struct v4l2_subdev_format try_pad_fmt[KMB_ISP_PADS_NUM];
 
 	struct kmb_isp_csi2_config csi2_config;
 	const struct kmb_isp_source_format *source_fmt;
 
+	struct kmb_pipe_config_evs pipe_cfg;
+
+	unsigned int config_chan_id;
+	struct kmb_metadata stats;
+	struct kmb_metadata params;
+
+	unsigned int capture_chan_id;
+	struct kmb_video capture;
+
 	u32 sequence;
 };
 
diff --git a/drivers/media/platform/keembay-camera/keembay-metadata.c b/drivers/media/platform/keembay-camera/keembay-metadata.c
new file mode 100644
index 000000000000..a1df746d9582
--- /dev/null
+++ b/drivers/media/platform/keembay-camera/keembay-metadata.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel Keem Bay camera ISP metadata video node.
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+#include "keembay-metadata.h"
+
+/**
+ * kmb_video_init - Initialize entity
+ * @kmb_meta: pointer to kmb isp config device
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+int kmb_metadata_init(struct kmb_metadata *kmb_meta)
+{
+	return 0;
+}
+
+/**
+ * kmb_metadata_cleanup - Free resources associated with entity
+ * @kmb_meta: pointer to kmb isp config device
+ */
+void kmb_metadata_cleanup(struct kmb_metadata *kmb_meta)
+{ }
+
+/**
+ * kmb_metadata_register - Register V4L2 device
+ * @kmb_meta: pointer to kmb isp config device
+ * @v4l2_dev: pointer to V4L2 device drivers
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+int kmb_metadata_register(struct kmb_metadata *kmb_meta,
+			  struct v4l2_device *v4l2_dev)
+{
+	return 0;
+}
+
+/**
+ * kmb_metadata_unregister - Unregister V4L device
+ * @kmb_meta: pointer to kmb isp config device
+ */
+void kmb_metadata_unregister(struct kmb_metadata *kmb_meta)
+{ }
diff --git a/drivers/media/platform/keembay-camera/keembay-metadata.h b/drivers/media/platform/keembay-camera/keembay-metadata.h
new file mode 100644
index 000000000000..88e85d3caba0
--- /dev/null
+++ b/drivers/media/platform/keembay-camera/keembay-metadata.h
@@ -0,0 +1,150 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Intel Keem Bay camera ISP metadata video node.
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+#ifndef KEEMBAY_METADATA_H
+#define KEEMBAY_METADATA_H
+
+#include <media/v4l2-dev.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "keembay-vpu-isp.h"
+
+/**
+ * enum kmb_metadata_table_type - Keembay metadata table type
+ * @KMB_METADATA_TABLE_LSC: Lens shading table
+ * @KMB_METADATA_TABLE_SDEFECT: Static defect pixel table
+ * @KMB_METADATA_TABLE_LCA:  Lateral цhroma аberration table
+ * @KMB_METADATA_TABLE_HDR: HDR table
+ * @KMB_METADATA_TABLE_SHARP: Shartpnes table
+ * @KMB_METADATA_TABLE_COLOR_CUMB: Color combination table
+ * @KMB_METADATA_TABLE_TNF0: Temporal denoise first table
+ * @KMB_METADATA_TABLE_TNF1: Temporal denoise second table
+ * @KMB_METADATA_TABLE_WARP: Warp mesh table
+ */
+enum kmb_metadata_table_type {
+	KMB_METADATA_TABLE_LSC		= 0,
+	KMB_METADATA_TABLE_SDEFECT	= 1,
+	KMB_METADATA_TABLE_LCA		= 2,
+	KMB_METADATA_TABLE_HDR		= 3,
+	KMB_METADATA_TABLE_SHARP	= 4,
+	KMB_METADATA_TABLE_COLOR_CUMB	= 5,
+	KMB_METADATA_TABLE_LUT		= 6,
+	KMB_METADATA_TABLE_TNF0		= 7,
+	KMB_METADATA_TABLE_TNF1		= 8,
+	KMB_METADATA_TABLE_WARP		= 10,
+	KMB_METADATA_TABLE_MAX		= 11,
+};
+
+/**
+ * enum kmb_metadata_type - Keembay metadata type
+ * @KMB_METADATA_PARAMS: Keembay metadata parameters
+ * @KMB_METADATA_STATS: Keembay metadata statistics
+ */
+enum kmb_metadata_type {
+	KMB_METADATA_PARAMS,
+	KMB_METADATA_STATS,
+};
+
+/**
+ * struct kmb_metadata_table - Keembay metadata table
+ * @refcount: Metadata table reference count
+ * @dma_addr: Physical address of the table
+ * @cpu_addr: Virtual address of the table
+ * @pool: Dma pool from where table was allocated
+ */
+struct kmb_metadata_table {
+	struct kref refcount;
+	dma_addr_t dma_addr;
+	void *cpu_addr;
+	struct dma_pool *pool;
+};
+
+/**
+ * struct kmb_metadata_buf - Keembay metadata buffer handle
+ * @vb: Video buffer for v4l2
+ * @type: Metadata type
+ * @stats: Statistics physical addresses
+ *   @raw: VPU raw statistics physical addresses
+ *   @dehaze_stats_addr: VPU dehaze statistics physical address
+ * @params: VPU ISP parameters
+ *   @isp: VPU ISP parameters virtual address
+ *   @dma_addr_isp: VPU ISP parameters physical address
+ *   @tab: Metadata tables
+ * @list: List for buffer queue
+ */
+struct kmb_metadata_buf {
+	struct vb2_v4l2_buffer vb;
+	enum kmb_metadata_type type;
+	union {
+		struct {
+			struct kmb_vpu_raw_stats raw[KMB_VPU_MAX_EXPOSURES];
+			u64 dehaze_stats_addr;
+		} stats;
+		struct {
+			struct kmb_vpu_isp_params *isp;
+			dma_addr_t dma_addr_isp;
+			struct kmb_metadata_table *tab[KMB_METADATA_TABLE_MAX];
+		} params;
+	};
+	struct list_head list;
+};
+
+/**
+ * struct kmb_metabuf_queue_ops - Keembay metadata queue operations
+ * @queue: queue an metadata buffer
+ * @flish: discard all metadata buffers
+ */
+struct kmb_metabuf_queue_ops {
+	int (*queue)(void *priv, struct kmb_metadata_buf *buf);
+	void (*flush)(void *priv);
+};
+
+/**
+ * struct kmb_metadata - Keembay metadata device
+ * @lock: mutex to protect keembay metadata device
+ * @video: pointer to V4L2 video device node
+ * @dma_dev: pointer to dma device
+ * @pad: media pad graph objects
+ * @vb2_q: V4L2 Video buffer queue
+ * @type: Metadata type
+ * @pipe: pointer to KMB pipeline object
+ * @priv: pointer to private data
+ * @queue_ops: Metadata buffer queue operations
+ * @table_pools_refcnt: Table pool reference count
+ * @table_pool: ISP tables dma pool
+ * @last_buf: Pointer to last enqueued buffer
+ * @format: Active format
+ */
+struct kmb_metadata {
+	struct mutex lock;
+	struct video_device video;
+	struct device *dma_dev;
+	struct media_pad pad;
+	struct vb2_queue vb2_q;
+	enum kmb_metadata_type type;
+
+	struct kmb_pipeline *pipe;
+
+	void *priv;
+	const struct kmb_metabuf_queue_ops *queue_ops;
+
+	unsigned int table_pools_refcnt;
+	struct dma_pool *table_pool[KMB_METADATA_TABLE_MAX];
+
+	struct kmb_metadata_buf *last_buf;
+
+	struct v4l2_meta_format format;
+};
+
+int kmb_metadata_init(struct kmb_metadata *kmb_meta);
+void kmb_metadata_cleanup(struct kmb_metadata *kmb_meta);
+
+int kmb_metadata_register(struct kmb_metadata *kmb_meta,
+			  struct v4l2_device *v4l2_dev);
+void kmb_metadata_unregister(struct kmb_metadata *kmb_meta);
+
+#endif /* KEEMBAY_METADATA_H */
diff --git a/drivers/media/platform/keembay-camera/keembay-pipeline.c b/drivers/media/platform/keembay-camera/keembay-pipeline.c
new file mode 100644
index 000000000000..1ebaa900e4dc
--- /dev/null
+++ b/drivers/media/platform/keembay-camera/keembay-pipeline.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel Keem Bay camera pipeline.
+ *
+ * Copyright (C) 2020 Intel Corporation
+ */
+#include <media/v4l2-device.h>
+
+#include "keembay-pipeline.h"
+#include "keembay-vpu-cmd.h"
+
+/**
+ * kmb_pipe_init - Initialize KMB Pipeline
+ * @pipe: pointer to pipeline object
+ * @dev: pointer to device
+ * @xlink_cam: pointer to xlink cam handle
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+int kmb_pipe_init(struct kmb_pipeline *pipe, struct device *dev,
+		  struct kmb_xlink_cam *xlink_cam)
+{
+	return 0;
+}
+
+/**
+ * kmb_pipe_cleanup - Cleanup KMB Pipeline
+ * @pipe: pointer to pipeline object
+ */
+void kmb_pipe_cleanup(struct kmb_pipeline *pipe)
+{ }
+
+/**
+ * kmb_pipe_request - Request a pipeline
+ * @pipe: pointer to pipeline object
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+int kmb_pipe_request(struct kmb_pipeline *pipe)
+{
+	return 0;
+}
+
+/**
+ * kmb_pipe_release - Release a pipeline
+ * @pipe: pointer to pipeline object
+ */
+void kmb_pipe_release(struct kmb_pipeline *pipe)
+{ }
+
+/**
+ * kmb_pipe_config_dest - Configure pipeline destination information
+ * @pipe: pointer to pipeline object
+ * @output_id: destination id
+ * @channel_cfg: pointer to channel configuration
+ */
+void kmb_pipe_config_dest(struct kmb_pipeline *pipe, unsigned int output_id,
+			  struct kmb_channel_cfg *channel_cfg)
+{ }
+
+/**
+ * kmb_pipe_config_src - Configure pipeline source information
+ * @pipe: pointer to pipeline object
+ * @pipe_cfg: pointer to pipeline configuration
+ *
+ * Configure pipeline source information. Sending source configuration and
+ * getting destination restrictions. After this call all destination data is
+ * initialized. Changing state to CONFIGURED.
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+int kmb_pipe_config_src(struct kmb_pipeline *pipe,
+			struct kmb_pipe_config_evs *pipe_cfg)
+{
+	return 0;
+}
diff --git a/drivers/media/platform/keembay-camera/keembay-pipeline.h b/drivers/media/platform/keembay-camera/keembay-pipeline.h
new file mode 100644
index 000000000000..83ff94d11b34
--- /dev/null
+++ b/drivers/media/platform/keembay-camera/keembay-pipeline.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Intel Keem Bay camera pipeline.
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+#ifndef KEEMBAY_PIPELINE_H
+#define KEEMBAY_PIPELINE_H
+
+#include "keembay-vpu-pipe.h"
+
+/**
+ * enum kmb_pipe_state - KMB pipeline state
+ * @KMB_PIPE_STATE_UNCONFIGURED: Pipeline is unconfigured only configure can be
+ *                               called in this state
+ * @KMB_PIPE_STATE_CONFIGURED: Pipeline is configured. Pipeline can be
+ *                             re-configured, build or destroyed
+ * @KMB_PIPE_STATE_BUILT: Pipeline is built and ready for streaming.
+ *                        Pipeline destroy or start stream can be called
+ * @KMB_PIPE_STATE_STREAMING: Pipeline is in streaming state only stop
+ *                            stream can be called.
+ */
+enum kmb_pipe_state {
+	KMB_PIPE_STATE_UNCONFIGURED,
+	KMB_PIPE_STATE_CONFIGURED,
+	KMB_PIPE_STATE_BUILT,
+	KMB_PIPE_STATE_STREAMING,
+};
+
+/**
+ * struct kmb_pipeline - KMB Pipeline
+ * @lock: Mutex to serialize access to kmb pipeline object
+ * @dev: Pointer to device
+ * @media_pipe: Media pipeline
+ * @state: Pipeline state
+ * @pipe_cfg: VPU pipeline configuration
+ * @pipe_cfg_paddr: VPU pipeline configuration physical address
+ * @pending: Number of media graph entities expected on streaming
+ * @streaming: Number of entities in streaming state
+ * @xlink_cam: Pointer to xlink camera communication handler
+ */
+struct kmb_pipeline {
+	struct mutex lock;
+	struct device *dev;
+	struct media_pipeline media_pipe;
+
+	enum kmb_pipe_state state;
+
+	struct kmb_pipe_config_evs *pipe_cfg;
+	dma_addr_t pipe_cfg_paddr;
+
+	unsigned int pending;
+	unsigned int streaming;
+
+	struct kmb_xlink_cam *xlink_cam;
+};
+
+int kmb_pipe_init(struct kmb_pipeline *pipe,
+		  struct device *dev,
+		  struct kmb_xlink_cam *xlink_cam);
+void kmb_pipe_cleanup(struct kmb_pipeline *pipe);
+
+int kmb_pipe_request(struct kmb_pipeline *pipe);
+void kmb_pipe_release(struct kmb_pipeline *pipe);
+
+void kmb_pipe_config_dest(struct kmb_pipeline *pipe, unsigned int output_id,
+			  struct kmb_channel_cfg *channel_cfg);
+int kmb_pipe_config_src(struct kmb_pipeline *pipe,
+			struct kmb_pipe_config_evs *pipe_cfg);
+
+#endif /* KEEMBAY_PIPELINE_H */
diff --git a/drivers/media/platform/keembay-camera/keembay-video.c b/drivers/media/platform/keembay-camera/keembay-video.c
new file mode 100644
index 000000000000..02f4d97e16fb
--- /dev/null
+++ b/drivers/media/platform/keembay-camera/keembay-video.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel Keem Bay camera Video node.
+ *
+ * Copyright (C) 2018-2020 Intel Corporation
+ */
+#include "keembay-video.h"
+
+/**
+ * kmb_video_init - Initialize entity
+ * @kmb_vid: pointer to kmb video device
+ * @name: entity name
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+int kmb_video_init(struct kmb_video *kmb_vid, const char *name)
+{
+	return 0;
+}
+
+/**
+ * kmb_video_cleanup - Free resources associated with entity
+ * @kmb_vid: pointer to kmb video device
+ */
+void kmb_video_cleanup(struct kmb_video *kmb_vid)
+{ }
+
+/**
+ * kmb_video_register - Register V4L2 device
+ * @kmb_vid: pointer to kmb video device
+ * @v4l2_dev: pointer to V4L2 device drivers
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+int kmb_video_register(struct kmb_video *kmb_vid,
+		       struct v4l2_device *v4l2_dev)
+{
+	return 0;
+}
+
+/**
+ * kmb_video_unregister - Unregister V4L device
+ * @kmb_vid: pointer to kmb video device
+ */
+void kmb_video_unregister(struct kmb_video *kmb_vid)
+{ }
diff --git a/drivers/media/platform/keembay-camera/keembay-video.h b/drivers/media/platform/keembay-camera/keembay-video.h
new file mode 100644
index 000000000000..2aebbb37424b
--- /dev/null
+++ b/drivers/media/platform/keembay-camera/keembay-video.h
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Intel Keem Bay camera video node.
+ *
+ * Copyright (C) 2020 Intel Corporation
+ */
+#ifndef KEEMBAY_VIDEO_H
+#define KEEMBAY_VIDEO_H
+
+#include <media/v4l2-dev.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "keembay-cam-xlink.h"
+
+/**
+ * struct kmb_frame_buffer - KMB frame buffer structure
+ * @vb: Video buffer for v4l2
+ * @addr: Array of dma buffer plane address
+ * @list: Frame buffer list
+ */
+struct kmb_frame_buffer {
+	struct vb2_v4l2_buffer vb;
+	dma_addr_t addr[3];
+	struct list_head list;
+};
+
+/**
+ * struct kmb_video - KMB Video device structure
+ * @lock: Mutex serializing kmb video device ops
+ * @video_lock: Mutex serializing video operations
+ * @video: Pointer to V4L2 sub-device
+ * @pad: Media pad graph objects
+ * @dma_dev: Pointer to dma device
+ * @pipe: Pointer to kmb media pipeline
+ * @chan: Pointer to xlink channel
+ */
+struct kmb_video {
+	struct mutex lock; /* Lock protecting kmb video device */
+	struct mutex video_lock; /* Lock serializing video device operations */
+	struct video_device *video;
+	struct media_pad pad;
+	struct device *dma_dev;
+	struct kmb_pipeline *pipe;
+	struct kmb_xlink_cam *xlink_cam;
+	unsigned int chan_id;
+};
+
+/**
+ * struct kmb_video_fh - KMB video file handler
+ * @fh: V4L2 file handler
+ * @kmb_vid: Pointer to KMB video device
+ * @lock: Mutex serializing access to fh
+ * @vb2_lock: Mutex serializing access to vb2 queue
+ * @vb2_q: Video buffer queue
+ * @active_fmt: Active format
+     @pix: Mplane active pixel format
+     @info: Active kmb format info
+ * @contiguous_memory: Flag to enable contiguous memory allocation
+ * @dma_queue: DMA buffers queue
+ * @thread: Pointer to worker thread data
+ */
+struct kmb_video_fh {
+	struct v4l2_fh fh;
+	struct kmb_video *kmb_vid;
+	struct mutex lock; /* Lock protecting fh operations */
+	struct mutex vb2_lock; /* Lock protecting video buffer queue */
+	struct vb2_queue vb2_q;
+	struct {
+		struct v4l2_pix_format_mplane pix;
+		const struct kmb_video_fmt_info *info;
+	} active_fmt;
+	bool contiguous_memory;
+	struct list_head dma_queue;
+	struct task_struct *thread;
+};
+
+int kmb_video_init(struct kmb_video *kmb_vid, const char *name);
+void kmb_video_cleanup(struct kmb_video *kmb_vid);
+
+int kmb_video_register(struct kmb_video *kmb_vid,
+		       struct v4l2_device *v4l2_dev);
+void kmb_video_unregister(struct kmb_video *kmb_vid);
+
+#endif /* KEEMBAY_VIDEO_H */
-- 
2.11.0

