Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2AB23D94E
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 12:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729397AbgHFKgp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 06:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729363AbgHFKey (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 06:34:54 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7EE1C0617A9
        for <linux-media@vger.kernel.org>; Thu,  6 Aug 2020 03:34:52 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 718172993E3
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v3 5/5] media: staging: rkisp1: improve documentation of rkisp1-common.h
Date:   Thu,  6 Aug 2020 12:34:17 +0200
Message-Id: <20200806103417.18154-6-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806103417.18154-1-dafna.hirschfeld@collabora.com>
References: <20200806103417.18154-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add more detailed documentation of the structs and functions
in rkisp1-common.h

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/staging/media/rkisp1/TODO            |   1 -
 drivers/staging/media/rkisp1/rkisp1-common.h | 233 +++++++++++++++----
 2 files changed, 190 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
index bdb1b8f73556..f0c90d1c86a8 100644
--- a/drivers/staging/media/rkisp1/TODO
+++ b/drivers/staging/media/rkisp1/TODO
@@ -2,7 +2,6 @@
 * Fix checkpatch errors.
 * Review and comment every lock
 * Handle quantization
-* Document rkisp1-common.h
 * streaming paths (mainpath and selfpath) check if the other path is streaming
 in several places of the code, review this, specially that it doesn't seem it
 supports streaming from both paths at the same time.
diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index 44acebcc7881..e6b60244c356 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -22,9 +22,14 @@
 #include "rkisp1-regs.h"
 #include "uapi/rkisp1-config.h"
 
+/*
+ * flags on the 'direction' field in struct 'rkisp1_isp_mbus_info' that indicate
+ * on which pad the media bus format is supported
+ */
 #define RKISP1_ISP_SD_SRC BIT(0)
 #define RKISP1_ISP_SD_SINK BIT(1)
 
+/* min and max values for the widths and heights of the entities */
 #define RKISP1_ISP_MAX_WIDTH		4032
 #define RKISP1_ISP_MAX_HEIGHT		3024
 #define RKISP1_ISP_MIN_WIDTH		32
@@ -37,29 +42,36 @@
 #define RKISP1_RSZ_SRC_MIN_WIDTH		32
 #define RKISP1_RSZ_SRC_MIN_HEIGHT		16
 
+/* the default width and height of all the entities */
 #define RKISP1_DEFAULT_WIDTH		800
 #define RKISP1_DEFAULT_HEIGHT		600
 
 #define RKISP1_DRIVER_NAME	"rkisp1"
 #define RKISP1_BUS_INFO		"platform:" RKISP1_DRIVER_NAME
 
+/* maximum number of clocks */
 #define RKISP1_MAX_BUS_CLK	8
 
+/* a bitmask of the ready stats */
 #define RKISP1_STATS_MEAS_MASK		(RKISP1_CIF_ISP_AWB_DONE |	\
 					 RKISP1_CIF_ISP_AFM_FIN |	\
 					 RKISP1_CIF_ISP_EXP_END |	\
 					 RKISP1_CIF_ISP_HIST_MEASURE_RDY)
+
+/* enum for the resizer pads */
 enum rkisp1_rsz_pad {
 	RKISP1_RSZ_PAD_SINK,
 	RKISP1_RSZ_PAD_SRC,
 	RKISP1_RSZ_PAD_MAX
 };
 
+/* enum for the capture id */
 enum rkisp1_stream_id {
 	RKISP1_MAINPATH,
 	RKISP1_SELFPATH,
 };
 
+/* bayer patterns */
 enum rkisp1_fmt_raw_pat_type {
 	RKISP1_RAW_RGGB = 0,
 	RKISP1_RAW_GRBG,
@@ -67,6 +79,7 @@ enum rkisp1_fmt_raw_pat_type {
 	RKISP1_RAW_BGGR,
 };
 
+/* enum for the isp pads */
 enum rkisp1_isp_pad {
 	RKISP1_ISP_PAD_SINK_VIDEO,
 	RKISP1_ISP_PAD_SINK_PARAMS,
@@ -76,8 +89,16 @@ enum rkisp1_isp_pad {
 };
 
 /*
- * struct rkisp1_sensor_async - Sensor information
- * @mbus: media bus configuration
+ * struct rkisp1_sensor_async - A container for the v4l2_async_subdev to add to the notifier
+ *				of the v4l2-async API
+ *
+ * @asd:		async_subdev variable for the sensor
+ * @lanes:		number of lanes
+ * @mbus_type:		type of bus (currently only CSI2 is supported)
+ * @mbus_flags:		media bus (V4L2_MBUS_*) flags
+ * @sd:			a pointer to v4l2_subdev struct of the sensor
+ * @pixel_rate_ctrl:	pixel rate of the sensor, used to initialize the phy
+ * @dphy:		a pointer to the phy
  */
 struct rkisp1_sensor_async {
 	struct v4l2_async_subdev asd;
@@ -90,19 +111,17 @@ struct rkisp1_sensor_async {
 };
 
 /*
- * struct rkisp1_isp - ISP sub-device
- *
- * See Cropping regions of ISP in rkisp1.c for details
- * @sink_frm: input size, don't have to be equal to sensor size
- * @sink_fmt: input format
- * @sink_crop: crop for sink pad
- * @src_fmt: output format
- * @src_crop: output size
- * @ops_lock: ops serialization
+ * struct rkisp1_isp - ISP subdev entity
  *
- * @is_dphy_errctrl_disabled : if dphy errctrl is disabled (avoid endless interrupt)
- * @frame_sequence: used to synchronize frame_id between video devices.
- * @quantization: output quantization
+ * @sd:				v4l2_subdev variable
+ * @rkisp1:			pointer to rkisp1_device
+ * @pads:			media pads
+ * @pad_cfg:			pads configurations
+ * @sink_fmt:			input format
+ * @src_fmt:			output format
+ * @ops_lock:			ops serialization
+ * @is_dphy_errctrl_disabled:	if dphy errctrl is disabled (avoid endless interrupt)
+ * @frame_sequence:		used to synchronize frame_id between video devices.
  */
 struct rkisp1_isp {
 	struct v4l2_subdev sd;
@@ -110,11 +129,19 @@ struct rkisp1_isp {
 	struct v4l2_subdev_pad_config pad_cfg[RKISP1_ISP_PAD_MAX];
 	const struct rkisp1_isp_mbus_info *sink_fmt;
 	const struct rkisp1_isp_mbus_info *src_fmt;
-	struct mutex ops_lock;
+	struct mutex ops_lock; /* serialize the subdevice ops */
 	bool is_dphy_errctrl_disabled;
 	atomic_t frame_sequence;
 };
 
+/*
+ * struct rkisp1_vdev_node - Container for the video nodes: params, stats, mainpath, selfpath
+ *
+ * @buf_queue:	queue of buffers
+ * @vlock:	lock of the video node
+ * @vdev:	video node
+ * @pad:	media pad
+ */
 struct rkisp1_vdev_node {
 	struct vb2_queue buf_queue;
 	struct mutex vlock; /* ioctl serialization mutex */
@@ -122,6 +149,15 @@ struct rkisp1_vdev_node {
 	struct media_pad pad;
 };
 
+/*
+ * struct rkisp1_buffer - A container for the vb2 buffers used by the video devices:
+ *			  params, stats, mainpath, selfpath
+ *
+ * @vb:		vb2 buffer
+ * @queue:	entry of the buffer in the queue
+ * @buff_addr:	dma addresses of each plane, used only by the capture devices: selfpath, mainpath
+ * @vaddr:	virtual address for buffers used by params and stats devices
+ */
 struct rkisp1_buffer {
 	struct vb2_v4l2_buffer vb;
 	struct list_head queue;
@@ -131,6 +167,14 @@ struct rkisp1_buffer {
 	};
 };
 
+/*
+ * struct rkisp1_dummy_buffer - A buffer to write the next frame to in case
+ *				there are no vb2 buffers available.
+ *
+ * @vaddr:	return value of call to dma_alloc_attrs.
+ * @dma_addr:	dma address of the buffer.
+ * @size:	size of the buffer.
+ */
 struct rkisp1_dummy_buffer {
 	void *vaddr;
 	dma_addr_t dma_addr;
@@ -142,17 +186,29 @@ struct rkisp1_device;
 /*
  * struct rkisp1_capture - ISP capture video device
  *
- * @pix.fmt: buffer format
- * @pix.info: pixel information
- * @pix.cfg: pixel configuration
- *
- * @buf.lock: lock to protect buf_queue
- * @buf.queue: queued buffer list
- * @buf.dummy: dummy space to store dropped data
+ * @vnode:	  video node
+ * @rkisp1:	  pointer to rkisp1_device
+ * @id:		  id of the capture, one of RKISP1_SELFPATH, RKISP1_MAINPATH
+ * @ops:	  list of callbacks to configure the capture device.
+ * @config:	  a pointer to the list of registers to configure the capture format.
+ * @is_streaming: device is streaming
+ * @is_stopping:  stop_streaming callback was called and the device is in the process of
+ *		  stopping the streaming.
+ * @done:	  when stop_streaming callback is called, the device waits for the next irq
+ *		  handler to stop the streaming by waiting on the 'done' wait queue.
+ *		  If the irq handler is not called, the stream is stopped by the callback
+ *		  after timeout.
+ * @sp_y_stride:  the selfpath allows to configure a y stride that is longer than the image width.
+ * @buf.lock:	  lock to protect buf.queue
+ * @buf.queue:	  queued buffer list
+ * @buf.dummy:	  dummy space to store dropped data
  *
- * rkisp1 use shadowsock registers, so it need two buffer at a time
- * @buf.curr: the buffer used for current frame
- * @buf.next: the buffer used for next frame
+ * rkisp1 uses shadow registers, so it needs two buffers at a time
+ * @buf.curr:	  the buffer used for current frame
+ * @buf.next:	  the buffer used for next frame
+ * @pix.cfg:	  pixel configuration
+ * @pix.info:	  a pointer to the v4l2_format_info of the pixel format
+ * @pix.fmt:	  buffer format
  */
 struct rkisp1_capture {
 	struct rkisp1_vdev_node vnode;
@@ -182,14 +238,18 @@ struct rkisp1_capture {
 /*
  * struct rkisp1_stats - ISP Statistics device
  *
- * @lock: locks the buffer list 'stat' and 'is_streaming'
- * @stat: stats buffer list
+ * @vnode:	  video node
+ * @rkisp1:	  pointer to the rkisp1 device
+ * @lock:	  locks the buffer list 'stat' and 'is_streaming'
+ * @stat:	  queue of rkisp1_buffer
+ * @vdev_fmt:	  v4l2_format of the metadata format
+ * @is_streaming: device is streaming
  */
 struct rkisp1_stats {
 	struct rkisp1_vdev_node vnode;
 	struct rkisp1_device *rkisp1;
 
-	spinlock_t lock; /* locks 'is_streaming', and 'stats' */
+	spinlock_t lock; /* locks the buffers list 'stats' and 'is_streaming' */
 	struct list_head stat;
 	struct v4l2_format vdev_fmt;
 	bool is_streaming;
@@ -198,14 +258,22 @@ struct rkisp1_stats {
 /*
  * struct rkisp1_params - ISP input parameters device
  *
- * @cur_params: Current ISP parameters
- * @is_first_params: the first params should take effect immediately
+ * @vnode:		video node
+ * @rkisp1:		pointer to the rkisp1 device
+ * @config_lock:	locks the buffer list 'params' and 'is_streaming'
+ * @params:		queue of rkisp1_buffer
+ * @cur_params:		the first params values from userspace
+ * @vdev_fmt:		v4l2_format of the metadata format
+ * @is_streaming:	device is streaming
+ * @is_first_params:	the first params should take effect immediately
+ * @quantization:	the quantization configured on the isp's src pad
+ * @raw_type:		the bayer pattern on the isp video sink pad
  */
 struct rkisp1_params {
 	struct rkisp1_vdev_node vnode;
 	struct rkisp1_device *rkisp1;
 
-	spinlock_t config_lock;
+	spinlock_t config_lock; /* locks the buffers list 'params' and 'is_streaming' */
 	struct list_head params;
 	struct rkisp1_params_cfg cur_params;
 	struct v4l2_format vdev_fmt;
@@ -216,6 +284,18 @@ struct rkisp1_params {
 	enum rkisp1_fmt_raw_pat_type raw_type;
 };
 
+/*
+ * struct rkisp1_resizer - Resizer subdev
+ *
+ * @sd:	       v4l2_subdev variable
+ * @id:	       id of the resizer, one of RKISP1_SELFPATH, RKISP1_MAINPATH
+ * @rkisp1:    pointer to the rkisp1 device
+ * @pads:      media pads
+ * @pad_cfg:   configurations for the pads
+ * @config:    the set of registers to configure the resizer
+ * @pixel_enc: pixel encoding of the resizer
+ * @ops_lock:  a lock for the subdev ops
+ */
 struct rkisp1_resizer {
 	struct v4l2_subdev sd;
 	enum rkisp1_stream_id id;
@@ -224,9 +304,26 @@ struct rkisp1_resizer {
 	struct v4l2_subdev_pad_config pad_cfg[RKISP1_RSZ_PAD_MAX];
 	const struct rkisp1_rsz_config *config;
 	enum v4l2_pixel_encoding pixel_enc;
-	struct mutex ops_lock;
+	struct mutex ops_lock; /* serialize the subdevice ops */
 };
 
+/*
+ * struct rkisp1_debug - Values to be exposed on debugfs.
+ *			 The parameters are counters of the number of times the
+ *			 event occurred since the driver was loaded.
+ *
+ * @data_loss:			  loss of data occurred within a line, processing failure
+ * @outform_size_error:		  size error is generated in outmux submodule
+ * @img_stabilization_size_error: size error is generated in image stabilization submodule
+ * @inform_size_err:		  size error is generated in inform submodule
+ * @mipi_error:			  mipi error occurred
+ * @stats_error:		  writing to the 'Interrupt clear register' did not clear
+ *				  it in the register 'Masked interrupt status'
+ * @stop_timeout:		  upon stream stop, the capture waits 1 second for the isr to stop
+ *				  the stream. This param is incremented in case of timeout.
+ * @frame_drop:			  a frame was ready but the buffer queue was empty so the frame
+ *				  was not sent to userspace
+ */
 struct rkisp1_debug {
 	struct dentry *debugfs_dir;
 	unsigned long data_loss;
@@ -241,13 +338,24 @@ struct rkisp1_debug {
 
 /*
  * struct rkisp1_device - ISP platform device
- * @base_addr: base register address
+ *
+ * @base_addr:	   base register address
+ * @irq:	   the irq number
+ * @dev:	   a pointer to the struct device
+ * @clk_size:	   number of clocks
+ * @clks:	   array of clocks
+ * @v4l2_dev:	   v4l2_device variable
+ * @media_dev:	   media_device variable
+ * @notifier:	   a notifier to register on the v4l2-async API to be notified on the sensor
  * @active_sensor: sensor in-use, set when streaming on
- * @isp: ISP sub-device
- * @rkisp1_capture: capture video device
- * @stats: ISP statistics output device
- * @params: ISP input parameters device
- * @stream_lock: lock to serialize start/stop streaming in capture devices.
+ * @isp:	   ISP sub-device
+ * @resizer_devs:  resizer sub-devices
+ * @capture_devs:  capture devices
+ * @stats:	   ISP statistics metadata capture device
+ * @params:	   ISP parameters metadata output device
+ * @pipe:	   media pipeline
+ * @stream_lock:   serializes {start/stop}_streaming callbacks between the capture devices.
+ * @debug:	   debug params to be exposed on debugfs
  */
 struct rkisp1_device {
 	void __iomem *base_addr;
@@ -265,16 +373,21 @@ struct rkisp1_device {
 	struct rkisp1_stats stats;
 	struct rkisp1_params params;
 	struct media_pipeline pipe;
-	struct mutex stream_lock;
+	struct mutex stream_lock; /* serialize {start/stop}_streaming cb between capture devices */
 	struct rkisp1_debug debug;
 };
 
 /*
- * struct rkisp1_isp_mbus_info - ISP pad format info
+ * struct rkisp1_isp_mbus_info - ISP media bus info, Translates media bus code to hardware
+ *				 format values
  *
- * Translate mbus_code to hardware format values
- *
- * @bus_width: used for parallel
+ * @mbus_code: media bus code
+ * @pixel_enc: pixel encoding
+ * @mipi_dt:   mipi data type
+ * @yuv_seq:   the order of the Y, Cb, Cr values
+ * @bus_width: bus width
+ * @bayer_pat: bayer pattern
+ * @direction: a bitmask of the flags indicating on which pad the format is supported on
  */
 struct rkisp1_isp_mbus_info {
 	u32 mbus_code;
@@ -297,25 +410,59 @@ static inline u32 rkisp1_read(struct rkisp1_device *rkisp1, unsigned int addr)
 	return readl(rkisp1->base_addr + addr);
 }
 
+/*
+ * rkisp1_sd_adjust_crop_rect - adjust a rectangle to fit into another rectangle.
+ *
+ * @crop:   rectangle to adjust.
+ * @bounds: rectangle used as bounds.
+ */
 void rkisp1_sd_adjust_crop_rect(struct v4l2_rect *crop,
 				const struct v4l2_rect *bounds);
 
+/*
+ * rkisp1_sd_adjust_crop - adjust a rectangle to fit into media bus format
+ *
+ * @crop:   rectangle to adjust.
+ * @bounds: media bus format used as bounds.
+ */
 void rkisp1_sd_adjust_crop(struct v4l2_rect *crop,
 			   const struct v4l2_mbus_framefmt *bounds);
 
+/*
+ * rkisp1_isp_mbus_info - get the isp info of the media bus code
+ *
+ * @mbus_code: the media bus code
+ */
 const struct rkisp1_isp_mbus_info *rkisp1_isp_mbus_info_get(u32 mbus_code);
 
+/* rkisp1_params_configure - configure the params when stream starts.
+ *			     This function is called by the isp entity upon stream starts.
+ *			     The function applies the initial configuration of the parameters.
+ *
+ * @params:	  pointer to rkisp1_params.
+ * @bayer_pat:	  the bayer pattern on the isp video sink pad
+ * @quantization: the quantization configured on the isp's src pad
+ */
 void rkisp1_params_configure(struct rkisp1_params *params,
 			     enum rkisp1_fmt_raw_pat_type bayer_pat,
 			     enum v4l2_quantization quantization);
+
+/* rkisp1_params_disable - disable all parameters.
+ *			   This function is called by the isp entity upon stream start
+ *			   when capturing bayer format.
+ *
+ * @params: pointer to rkisp1_params.
+ */
 void rkisp1_params_disable(struct rkisp1_params *params);
 
+/* irq handlers */
 void rkisp1_isp_isr(struct rkisp1_device *rkisp1);
 void rkisp1_mipi_isr(struct rkisp1_device *rkisp1);
 void rkisp1_capture_isr(struct rkisp1_device *rkisp1);
 void rkisp1_stats_isr(struct rkisp1_stats *stats, u32 isp_ris);
 void rkisp1_params_isr(struct rkisp1_device *rkisp1, u32 isp_mis);
 
+/* register/unregisters functions of the entities */
 int rkisp1_capture_devs_register(struct rkisp1_device *rkisp1);
 void rkisp1_capture_devs_unregister(struct rkisp1_device *rkisp1);
 
-- 
2.17.1

