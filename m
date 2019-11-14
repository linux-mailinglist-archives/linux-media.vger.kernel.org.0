Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A37B3FBF16
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 06:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbfKNFNp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 00:13:45 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43962 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727069AbfKNFNo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 00:13:44 -0500
Received: from floko.floko.floko (unknown [IPv6:2804:431:c7f0:da1c:a086:2727:e196:fd8a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 901BC290EE6;
        Thu, 14 Nov 2019 05:13:34 +0000 (GMT)
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-rockchip@lists.infradead.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
        jeffy.chen@rock-chips.com, zyc@rock-chips.com,
        linux-kernel@vger.kernel.org, tfiga@chromium.org,
        robh+dt@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        kernel@collabora.com, ezequiel@collabora.com,
        linux-media@vger.kernel.org, jacob-chen@iotwrt.com,
        zhengsq@rock-chips.com, Jacob Chen <jacob2.chen@rock-chips.com>,
        Jacob Chen <cc@rock-chips.com>,
        Allon Huang <allon.huang@rock-chips.com>,
        Helen Koike <helen.koike@collabora.com>
Subject: [PATCH v11 04/11] media: staging: rkisp1: add Rockchip ISP1 subdev driver
Date:   Thu, 14 Nov 2019 02:12:35 -0300
Message-Id: <20191114051242.14651-5-helen.koike@collabora.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191114051242.14651-1-helen.koike@collabora.com>
References: <20191114051242.14651-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacob Chen <jacob2.chen@rock-chips.com>

Add the subdev driver for rockchip isp1.

Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
Signed-off-by: Yichong Zhong <zyc@rock-chips.com>
Signed-off-by: Jacob Chen <cc@rock-chips.com>
Signed-off-by: Eddie Cai <eddie.cai.linux@gmail.com>
Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
Signed-off-by: Allon Huang <allon.huang@rock-chips.com>
Signed-off-by: Tomasz Figa <tfiga@chromium.org>
[fixed unknown entity type / switched to PIXEL_RATE]
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
[refactored for upstream]
Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

Changes in v11:
rkisp1
- Fix compiling warnings
- Fix checkpatch errors

Changes in v10:
- unsquash

Changes in v9:
- remove unnecessary double parenthesis
- remove double call to media_entity_remote_pad(local) in
get_remote_sensor()
- remove ctrl_handler from struct rkisp1_isp_subdev
- replace v4l2_{dgb,info,warn,err} by dev_*
- fix error returned in link_validate
- remove s_power() callback
- add regwrite/regread wrappers
- add macros RKISP1_DEF_SRC_PAD_FMT/RKISP1_DEF_SINK_PAD_FMT
- several minor cleanups
- s/RKISP1_ISP_PAD_SINK([^_])/RKISP1_ISP_PAD_SINK_VIDEO\1/
- merge tables rkisp1_isp_input_formats and rkisp1_isp_output_formats
- in_fmt and out_fmt as pointers
- simply struct rkisp1_isp_subdev to work correctly with try format
- fix crop/fmt propagation
- squash
- migrate to staging

Changes in v8: None
Changes in v7:
- fixed warning because of unknown entity type
- fixed v4l2-compliance errors regarding rkisp1 formats, try formats
and default values
- fix typo riksp1/rkisp1
- redesign: remove mipi/csi subdevice, sensors connect directly to the
isp subdevice in the media topology now. As a consequence, remove the
hack in mipidphy_g_mbus_config() where information from the sensor was
being propagated through the topology.
- From the old dphy:
        * cache get_remote_sensor() in s_stream
        * use V4L2_CID_PIXEL_RATE instead of V4L2_CID_LINK_FREQ
- Replace stream state with a boolean
- code styling and checkpatch fixes
- fix stop_stream (return after calling stop, do not reenable the stream)
- fix rkisp1_isp_sd_get_selection when V4L2_SUBDEV_FORMAT_TRY is set
- fix get format in output (isp_sd->out_fmt.mbus_code was being ignored)
- s/intput/input
- remove #define sd_to_isp_sd(_sd), add a static inline as it will be
reused by the capture

 drivers/staging/media/rkisp1/rkisp1.c | 1243 +++++++++++++++++++++++++
 drivers/staging/media/rkisp1/rkisp1.h |   97 ++
 2 files changed, 1340 insertions(+)
 create mode 100644 drivers/staging/media/rkisp1/rkisp1.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1.h

diff --git a/drivers/staging/media/rkisp1/rkisp1.c b/drivers/staging/media/rkisp1/rkisp1.c
new file mode 100644
index 000000000000..17f410908d52
--- /dev/null
+++ b/drivers/staging/media/rkisp1/rkisp1.c
@@ -0,0 +1,1243 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Rockchip ISP1 Driver - ISP Subdevice
+ *
+ * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
+ */
+
+#include <linux/iopoll.h>
+#include <linux/phy/phy.h>
+#include <linux/phy/phy-mipi-dphy.h>
+#include <linux/pm_runtime.h>
+#include <linux/videodev2.h>
+#include <linux/vmalloc.h>
+#include <media/v4l2-event.h>
+
+#include "common.h"
+#include "regs.h"
+
+#define CIF_ISP_INPUT_W_MAX		4032
+#define CIF_ISP_INPUT_H_MAX		3024
+#define CIF_ISP_INPUT_W_MIN		32
+#define CIF_ISP_INPUT_H_MIN		32
+#define CIF_ISP_OUTPUT_W_MAX		CIF_ISP_INPUT_W_MAX
+#define CIF_ISP_OUTPUT_H_MAX		CIF_ISP_INPUT_H_MAX
+#define CIF_ISP_OUTPUT_W_MIN		CIF_ISP_INPUT_W_MIN
+#define CIF_ISP_OUTPUT_H_MIN		CIF_ISP_INPUT_H_MIN
+
+#define RKISP1_DEF_SINK_PAD_FMT MEDIA_BUS_FMT_SRGGB10_1X10
+#define RKISP1_DEF_SRC_PAD_FMT MEDIA_BUS_FMT_YUYV8_2X8
+
+/*
+ * NOTE: MIPI controller and input MUX are also configured in this file,
+ * because ISP Subdev is not only describe ISP submodule(input size,format,
+ * output size, format), but also a virtual route device.
+ */
+
+/*
+ * There are many variables named with format/frame in below code,
+ * please see here for their meaning.
+ *
+ * Cropping regions of ISP
+ *
+ * +---------------------------------------------------------+
+ * | Sensor image                                            |
+ * | +---------------------------------------------------+   |
+ * | | ISP_ACQ (for black level)                         |   |
+ * | | in_frm                                            |   |
+ * | | +--------------------------------------------+    |   |
+ * | | |    ISP_OUT                                 |    |   |
+ * | | |    in_crop                                 |    |   |
+ * | | |    +---------------------------------+     |    |   |
+ * | | |    |   ISP_IS                        |     |    |   |
+ * | | |    |   rkisp1_isp_subdev: out_crop   |     |    |   |
+ * | | |    +---------------------------------+     |    |   |
+ * | | +--------------------------------------------+    |   |
+ * | +---------------------------------------------------+   |
+ * +---------------------------------------------------------+
+ */
+
+static inline struct rkisp1_device *sd_to_isp_dev(struct v4l2_subdev *sd)
+{
+	return container_of(sd->v4l2_dev, struct rkisp1_device, v4l2_dev);
+}
+
+/* Get sensor by enabled media link */
+static struct v4l2_subdev *get_remote_sensor(struct v4l2_subdev *sd)
+{
+	struct media_pad *local, *remote;
+	struct media_entity *sensor_me;
+
+	local = &sd->entity.pads[RKISP1_ISP_PAD_SINK_VIDEO];
+	remote = media_entity_remote_pad(local);
+	if (!remote) {
+		dev_warn(sd->dev, "No link between isp and sensor\n");
+		return NULL;
+	}
+
+	sensor_me = remote->entity;
+	return media_entity_to_v4l2_subdev(sensor_me);
+}
+
+/****************  register operations ****************/
+
+static inline void regwrite(struct rkisp1_device *dev, u32 val,
+			    unsigned int addr)
+{
+	writel(val, dev->base_addr + addr);
+}
+
+static inline u32 regread(struct rkisp1_device *dev, unsigned int addr)
+{
+	return readl(dev->base_addr + addr);
+}
+
+struct v4l2_mbus_framefmt *
+rkisp1_isp_sd_get_pad_fmt(struct rkisp1_isp_subdev *isp_sd,
+			  struct v4l2_subdev_pad_config *cfg,
+			  unsigned int pad, u32 which)
+{
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return v4l2_subdev_get_try_format(&isp_sd->sd, cfg, pad);
+	else
+		return v4l2_subdev_get_try_format(&isp_sd->sd,
+						  isp_sd->pad_cfg, pad);
+}
+
+struct v4l2_rect *rkisp1_isp_sd_get_pad_crop(struct rkisp1_isp_subdev *isp_sd,
+					     struct v4l2_subdev_pad_config *cfg,
+					     unsigned int pad, u32 which)
+{
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return v4l2_subdev_get_try_crop(&isp_sd->sd, cfg, pad);
+	else
+		return v4l2_subdev_get_try_crop(&isp_sd->sd,
+						isp_sd->pad_cfg, pad);
+}
+
+/*
+ * Image Stabilization.
+ * This should only be called when configuring CIF
+ * or at the frame end interrupt
+ */
+static void rkisp1_config_ism(struct rkisp1_device *dev)
+{
+	struct v4l2_rect *out_crop =
+		rkisp1_isp_sd_get_pad_crop(&dev->isp_sdev, NULL,
+					   RKISP1_ISP_PAD_SOURCE_VIDEO,
+					   V4L2_SUBDEV_FORMAT_ACTIVE);
+	u32 val;
+
+	regwrite(dev, 0, CIF_ISP_IS_RECENTER);
+	regwrite(dev, 0, CIF_ISP_IS_MAX_DX);
+	regwrite(dev, 0, CIF_ISP_IS_MAX_DY);
+	regwrite(dev, 0, CIF_ISP_IS_DISPLACE);
+	regwrite(dev, out_crop->left, CIF_ISP_IS_H_OFFS);
+	regwrite(dev, out_crop->top, CIF_ISP_IS_V_OFFS);
+	regwrite(dev, out_crop->width, CIF_ISP_IS_H_SIZE);
+	regwrite(dev, out_crop->height, CIF_ISP_IS_V_SIZE);
+
+	/* IS(Image Stabilization) is always on, working as output crop */
+	regwrite(dev, 1, CIF_ISP_IS_CTRL);
+	val = regread(dev, CIF_ISP_CTRL);
+	val |= CIF_ISP_CTRL_ISP_CFG_UPD;
+	regwrite(dev, val, CIF_ISP_CTRL);
+}
+
+/*
+ * configure ISP blocks with input format, size......
+ */
+static int rkisp1_config_isp(struct rkisp1_device *dev)
+{
+	u32 isp_ctrl = 0, irq_mask = 0, acq_mult = 0, signal = 0;
+	const struct rkisp1_fmt *out_fmt, *in_fmt;
+	struct v4l2_rect *in_crop;
+	struct sensor_async_subdev *sensor;
+	struct v4l2_mbus_framefmt *in_frm;
+
+	sensor = dev->active_sensor;
+	in_fmt = dev->isp_sdev.in_fmt;
+	out_fmt = dev->isp_sdev.out_fmt;
+	in_frm = rkisp1_isp_sd_get_pad_fmt(&dev->isp_sdev, NULL,
+					   RKISP1_ISP_PAD_SINK_VIDEO,
+					   V4L2_SUBDEV_FORMAT_ACTIVE);
+	in_crop = rkisp1_isp_sd_get_pad_crop(&dev->isp_sdev, NULL,
+					     RKISP1_ISP_PAD_SINK_VIDEO,
+					     V4L2_SUBDEV_FORMAT_ACTIVE);
+
+	if (in_fmt->fmt_type == FMT_BAYER) {
+		acq_mult = 1;
+		if (out_fmt->fmt_type == FMT_BAYER) {
+			if (sensor->mbus.type == V4L2_MBUS_BT656)
+				isp_ctrl =
+					CIF_ISP_CTRL_ISP_MODE_RAW_PICT_ITU656;
+			else
+				isp_ctrl =
+					CIF_ISP_CTRL_ISP_MODE_RAW_PICT;
+		} else {
+			regwrite(dev, CIF_ISP_DEMOSAIC_TH(0xc),
+				 CIF_ISP_DEMOSAIC);
+
+			if (sensor->mbus.type == V4L2_MBUS_BT656)
+				isp_ctrl = CIF_ISP_CTRL_ISP_MODE_BAYER_ITU656;
+			else
+				isp_ctrl = CIF_ISP_CTRL_ISP_MODE_BAYER_ITU601;
+		}
+	} else if (in_fmt->fmt_type == FMT_YUV) {
+		acq_mult = 2;
+		if (sensor->mbus.type == V4L2_MBUS_CSI2_DPHY) {
+			isp_ctrl = CIF_ISP_CTRL_ISP_MODE_ITU601;
+		} else {
+			if (sensor->mbus.type == V4L2_MBUS_BT656)
+				isp_ctrl = CIF_ISP_CTRL_ISP_MODE_ITU656;
+			else
+				isp_ctrl = CIF_ISP_CTRL_ISP_MODE_ITU601;
+		}
+
+		irq_mask |= CIF_ISP_DATA_LOSS;
+	}
+
+	/* Set up input acquisition properties */
+	if (sensor->mbus.type == V4L2_MBUS_BT656 ||
+	    sensor->mbus.type == V4L2_MBUS_PARALLEL) {
+		if (sensor->mbus.flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
+			signal = CIF_ISP_ACQ_PROP_POS_EDGE;
+	}
+
+	if (sensor->mbus.type == V4L2_MBUS_PARALLEL) {
+		if (sensor->mbus.flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
+			signal |= CIF_ISP_ACQ_PROP_VSYNC_LOW;
+
+		if (sensor->mbus.flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
+			signal |= CIF_ISP_ACQ_PROP_HSYNC_LOW;
+	}
+
+	regwrite(dev, isp_ctrl, CIF_ISP_CTRL);
+	regwrite(dev, signal | in_fmt->yuv_seq |
+		 CIF_ISP_ACQ_PROP_BAYER_PAT(in_fmt->bayer_pat) |
+		 CIF_ISP_ACQ_PROP_FIELD_SEL_ALL, CIF_ISP_ACQ_PROP);
+	regwrite(dev, 0, CIF_ISP_ACQ_NR_FRAMES);
+
+	/* Acquisition Size */
+	regwrite(dev, 0, CIF_ISP_ACQ_H_OFFS);
+	regwrite(dev, 0, CIF_ISP_ACQ_V_OFFS);
+	regwrite(dev, acq_mult * in_frm->width, CIF_ISP_ACQ_H_SIZE);
+	regwrite(dev, in_frm->height, CIF_ISP_ACQ_V_SIZE);
+
+	/* ISP Out Area */
+	regwrite(dev, in_crop->left, CIF_ISP_OUT_H_OFFS);
+	regwrite(dev, in_crop->top, CIF_ISP_OUT_V_OFFS);
+	regwrite(dev, in_crop->width, CIF_ISP_OUT_H_SIZE);
+	regwrite(dev, in_crop->height, CIF_ISP_OUT_V_SIZE);
+
+	/* interrupt mask */
+	irq_mask |= CIF_ISP_FRAME | CIF_ISP_V_START | CIF_ISP_PIC_SIZE_ERROR |
+		    CIF_ISP_FRAME_IN;
+	regwrite(dev, irq_mask, CIF_ISP_IMSC);
+
+	if (out_fmt->fmt_type == FMT_BAYER) {
+		rkisp1_params_disable_isp(&dev->params_vdev);
+	} else {
+		struct v4l2_mbus_framefmt *out_frm;
+
+		out_frm = rkisp1_isp_sd_get_pad_fmt(&dev->isp_sdev, NULL,
+						    RKISP1_ISP_PAD_SINK_VIDEO,
+						    V4L2_SUBDEV_FORMAT_ACTIVE);
+		rkisp1_params_configure_isp(&dev->params_vdev, in_fmt,
+					    out_frm->quantization);
+	}
+
+	return 0;
+}
+
+static int rkisp1_config_dvp(struct rkisp1_device *dev)
+{
+	const struct rkisp1_fmt *in_fmt = dev->isp_sdev.in_fmt;
+	u32 val, input_sel;
+
+	switch (in_fmt->bus_width) {
+	case 8:
+		input_sel = CIF_ISP_ACQ_PROP_IN_SEL_8B_ZERO;
+		break;
+	case 10:
+		input_sel = CIF_ISP_ACQ_PROP_IN_SEL_10B_ZERO;
+		break;
+	case 12:
+		input_sel = CIF_ISP_ACQ_PROP_IN_SEL_12B;
+		break;
+	default:
+		dev_err(dev->dev, "Invalid bus width\n");
+		return -EINVAL;
+	}
+
+	val = regread(dev, CIF_ISP_ACQ_PROP);
+	regwrite(dev, val | input_sel, CIF_ISP_ACQ_PROP);
+
+	return 0;
+}
+
+static int rkisp1_config_mipi(struct rkisp1_device *dev)
+{
+	const struct rkisp1_fmt *in_fmt = dev->isp_sdev.in_fmt;
+	unsigned int lanes;
+	u32 mipi_ctrl;
+
+	/*
+	 * dev->active_sensor->mbus is set in isp or d-phy notifier_bound
+	 * function
+	 */
+	switch (dev->active_sensor->mbus.flags & V4L2_MBUS_CSI2_LANES) {
+	case V4L2_MBUS_CSI2_4_LANE:
+		lanes = 4;
+		break;
+	case V4L2_MBUS_CSI2_3_LANE:
+		lanes = 3;
+		break;
+	case V4L2_MBUS_CSI2_2_LANE:
+		lanes = 2;
+		break;
+	case V4L2_MBUS_CSI2_1_LANE:
+		lanes = 1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	mipi_ctrl = CIF_MIPI_CTRL_NUM_LANES(lanes - 1) |
+		    CIF_MIPI_CTRL_SHUTDOWNLANES(0xf) |
+		    CIF_MIPI_CTRL_ERR_SOT_SYNC_HS_SKIP |
+		    CIF_MIPI_CTRL_CLOCKLANE_ENA;
+
+	regwrite(dev, mipi_ctrl, CIF_MIPI_CTRL);
+
+	/* Configure Data Type and Virtual Channel */
+	regwrite(dev, CIF_MIPI_DATA_SEL_DT(in_fmt->mipi_dt) |
+		 CIF_MIPI_DATA_SEL_VC(0),
+		 CIF_MIPI_IMG_DATA_SEL);
+
+	/* Clear MIPI interrupts */
+	regwrite(dev, ~0, CIF_MIPI_ICR);
+	/*
+	 * Disable CIF_MIPI_ERR_DPHY interrupt here temporary for
+	 * isp bus may be dead when switch isp.
+	 */
+	regwrite(dev,
+		 CIF_MIPI_FRAME_END | CIF_MIPI_ERR_CSI | CIF_MIPI_ERR_DPHY |
+		 CIF_MIPI_SYNC_FIFO_OVFLW(0x03) | CIF_MIPI_ADD_DATA_OVFLW,
+		 CIF_MIPI_IMSC);
+
+	dev_dbg(dev->dev, "\n  MIPI_CTRL 0x%08x\n"
+		"  MIPI_IMG_DATA_SEL 0x%08x\n"
+		"  MIPI_STATUS 0x%08x\n"
+		"  MIPI_IMSC 0x%08x\n",
+		regread(dev, CIF_MIPI_CTRL),
+		regread(dev, CIF_MIPI_IMG_DATA_SEL),
+		regread(dev, CIF_MIPI_STATUS),
+		regread(dev, CIF_MIPI_IMSC));
+
+	return 0;
+}
+
+/* Configure MUX */
+static int rkisp1_config_path(struct rkisp1_device *dev)
+{
+	struct sensor_async_subdev *sensor = dev->active_sensor;
+	u32 dpcl = regread(dev, CIF_VI_DPCL);
+	int ret = 0;
+
+	if (sensor->mbus.type == V4L2_MBUS_BT656 ||
+	    sensor->mbus.type == V4L2_MBUS_PARALLEL) {
+		ret = rkisp1_config_dvp(dev);
+		dpcl |= CIF_VI_DPCL_IF_SEL_PARALLEL;
+	} else if (sensor->mbus.type == V4L2_MBUS_CSI2_DPHY) {
+		ret = rkisp1_config_mipi(dev);
+		dpcl |= CIF_VI_DPCL_IF_SEL_MIPI;
+	}
+
+	regwrite(dev, dpcl, CIF_VI_DPCL);
+
+	return ret;
+}
+
+/* Hardware configure Entry */
+static int rkisp1_config_cif(struct rkisp1_device *dev)
+{
+	u32 cif_id;
+	int ret;
+
+	dev_dbg(dev->dev, "SP streaming = %d, MP streaming = %d\n",
+		dev->stream[RKISP1_STREAM_SP].streaming,
+		dev->stream[RKISP1_STREAM_MP].streaming);
+
+	cif_id = regread(dev, CIF_VI_ID);
+	dev_dbg(dev->dev, "CIF_ID 0x%08x\n", cif_id);
+
+	ret = rkisp1_config_isp(dev);
+	if (ret < 0)
+		return ret;
+	ret = rkisp1_config_path(dev);
+	if (ret < 0)
+		return ret;
+	rkisp1_config_ism(dev);
+
+	return 0;
+}
+
+/* Mess register operations to stop ISP */
+static int rkisp1_isp_stop(struct rkisp1_device *dev)
+{
+	u32 val;
+
+	dev_dbg(dev->dev, "SP streaming = %d, MP streaming = %d\n",
+		dev->stream[RKISP1_STREAM_SP].streaming,
+		dev->stream[RKISP1_STREAM_MP].streaming);
+
+	/*
+	 * ISP(mi) stop in mi frame end -> Stop ISP(mipi) ->
+	 * Stop ISP(isp) ->wait for ISP isp off
+	 */
+	/* stop and clear MI, MIPI, and ISP interrupts */
+	regwrite(dev, 0, CIF_MIPI_IMSC);
+	regwrite(dev, ~0, CIF_MIPI_ICR);
+
+	regwrite(dev, 0, CIF_ISP_IMSC);
+	regwrite(dev, ~0, CIF_ISP_ICR);
+
+	regwrite(dev, 0, CIF_MI_IMSC);
+	regwrite(dev, ~0, CIF_MI_ICR);
+	val = regread(dev, CIF_MIPI_CTRL);
+	regwrite(dev, val & (~CIF_MIPI_CTRL_OUTPUT_ENA), CIF_MIPI_CTRL);
+	/* stop ISP */
+	val = regread(dev, CIF_ISP_CTRL);
+	val &= ~(CIF_ISP_CTRL_ISP_INFORM_ENABLE | CIF_ISP_CTRL_ISP_ENABLE);
+	regwrite(dev, val, CIF_ISP_CTRL);
+
+	val = regread(dev, CIF_ISP_CTRL);
+	regwrite(dev, val | CIF_ISP_CTRL_ISP_CFG_UPD, CIF_ISP_CTRL);
+
+	readx_poll_timeout(readl, dev->base_addr + CIF_ISP_RIS,
+			   val, val & CIF_ISP_OFF, 20, 100);
+	dev_dbg(dev->dev,
+		"streaming(MP:%d, SP:%d), MI_CTRL:%x, ISP_CTRL:%x, MIPI_CTRL:%x\n",
+		dev->stream[RKISP1_STREAM_SP].streaming,
+		dev->stream[RKISP1_STREAM_MP].streaming,
+		regread(dev, CIF_MI_CTRL),
+		regread(dev, CIF_ISP_CTRL),
+		regread(dev, CIF_MIPI_CTRL));
+
+	regwrite(dev, CIF_IRCL_MIPI_SW_RST | CIF_IRCL_ISP_SW_RST, CIF_IRCL);
+	regwrite(dev, 0x0, CIF_IRCL);
+
+	return 0;
+}
+
+static void rkisp1_config_clk(struct rkisp1_device *dev)
+{
+	u32 val = CIF_ICCL_ISP_CLK | CIF_ICCL_CP_CLK | CIF_ICCL_MRSZ_CLK |
+		  CIF_ICCL_SRSZ_CLK | CIF_ICCL_JPEG_CLK | CIF_ICCL_MI_CLK |
+		  CIF_ICCL_IE_CLK | CIF_ICCL_MIPI_CLK | CIF_ICCL_DCROP_CLK;
+
+	regwrite(dev, val, CIF_ICCL);
+}
+
+/* Mess register operations to start ISP */
+static int rkisp1_isp_start(struct rkisp1_device *dev)
+{
+	struct sensor_async_subdev *sensor = dev->active_sensor;
+	u32 val;
+
+	dev_dbg(dev->dev, "SP streaming = %d, MP streaming = %d\n",
+		dev->stream[RKISP1_STREAM_SP].streaming,
+		dev->stream[RKISP1_STREAM_MP].streaming);
+
+	rkisp1_config_clk(dev);
+
+	/* Activate MIPI */
+	if (sensor->mbus.type == V4L2_MBUS_CSI2_DPHY) {
+		val = regread(dev, CIF_MIPI_CTRL);
+		regwrite(dev, val | CIF_MIPI_CTRL_OUTPUT_ENA, CIF_MIPI_CTRL);
+	}
+	/* Activate ISP */
+	val = regread(dev, CIF_ISP_CTRL);
+	val |= CIF_ISP_CTRL_ISP_CFG_UPD | CIF_ISP_CTRL_ISP_ENABLE |
+	       CIF_ISP_CTRL_ISP_INFORM_ENABLE;
+	regwrite(dev, val, CIF_ISP_CTRL);
+
+	/* XXX: Is the 1000us too long?
+	 * CIF spec says to wait for sufficient time after enabling
+	 * the MIPI interface and before starting the sensor output.
+	 */
+	usleep_range(1000, 1200);
+
+	dev_dbg(dev->dev,
+		"SP streaming = %d, MP streaming = %d MI_CTRL 0x%08x\n"
+		"  ISP_CTRL 0x%08x MIPI_CTRL 0x%08x\n",
+		dev->stream[RKISP1_STREAM_SP].streaming,
+		dev->stream[RKISP1_STREAM_MP].streaming,
+		regread(dev, CIF_MI_CTRL),
+		regread(dev, CIF_ISP_CTRL),
+		regread(dev, CIF_MIPI_CTRL));
+
+	return 0;
+}
+
+/***************************** ISP sub-devs *******************************/
+
+static const struct rkisp1_fmt rkisp1_isp_formats[] = {
+	{
+		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
+		.fmt_type	= FMT_YUV,
+		.direction	= RKISP1_DIR_OUT,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
+		.fmt_type	= FMT_BAYER,
+		.mipi_dt	= CIF_CSI2_DT_RAW10,
+		.bayer_pat	= RAW_RGGB,
+		.bus_width	= 10,
+		.direction	= RKISP1_DIR_IN_OUT,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
+		.fmt_type	= FMT_BAYER,
+		.mipi_dt	= CIF_CSI2_DT_RAW10,
+		.bayer_pat	= RAW_BGGR,
+		.bus_width	= 10,
+		.direction	= RKISP1_DIR_IN_OUT,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
+		.fmt_type	= FMT_BAYER,
+		.mipi_dt	= CIF_CSI2_DT_RAW10,
+		.bayer_pat	= RAW_GBRG,
+		.bus_width	= 10,
+		.direction	= RKISP1_DIR_IN_OUT,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
+		.fmt_type	= FMT_BAYER,
+		.mipi_dt	= CIF_CSI2_DT_RAW10,
+		.bayer_pat	= RAW_GRBG,
+		.bus_width	= 10,
+		.direction	= RKISP1_DIR_IN_OUT,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
+		.fmt_type	= FMT_BAYER,
+		.mipi_dt	= CIF_CSI2_DT_RAW12,
+		.bayer_pat	= RAW_RGGB,
+		.bus_width	= 12,
+		.direction	= RKISP1_DIR_IN_OUT,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
+		.fmt_type	= FMT_BAYER,
+		.mipi_dt	= CIF_CSI2_DT_RAW12,
+		.bayer_pat	= RAW_BGGR,
+		.bus_width	= 12,
+		.direction	= RKISP1_DIR_IN_OUT,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
+		.fmt_type	= FMT_BAYER,
+		.mipi_dt	= CIF_CSI2_DT_RAW12,
+		.bayer_pat	= RAW_GBRG,
+		.bus_width	= 12,
+		.direction	= RKISP1_DIR_IN_OUT,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
+		.fmt_type	= FMT_BAYER,
+		.mipi_dt	= CIF_CSI2_DT_RAW12,
+		.bayer_pat	= RAW_GRBG,
+		.bus_width	= 12,
+		.direction	= RKISP1_DIR_IN_OUT,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB8_1X8,
+		.fmt_type	= FMT_BAYER,
+		.mipi_dt	= CIF_CSI2_DT_RAW8,
+		.bayer_pat	= RAW_RGGB,
+		.bus_width	= 8,
+		.direction	= RKISP1_DIR_IN_OUT,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
+		.fmt_type	= FMT_BAYER,
+		.mipi_dt	= CIF_CSI2_DT_RAW8,
+		.bayer_pat	= RAW_BGGR,
+		.bus_width	= 8,
+		.direction	= RKISP1_DIR_IN_OUT,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG8_1X8,
+		.fmt_type	= FMT_BAYER,
+		.mipi_dt	= CIF_CSI2_DT_RAW8,
+		.bayer_pat	= RAW_GBRG,
+		.bus_width	= 8,
+		.direction	= RKISP1_DIR_IN_OUT,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG8_1X8,
+		.fmt_type	= FMT_BAYER,
+		.mipi_dt	= CIF_CSI2_DT_RAW8,
+		.bayer_pat	= RAW_GRBG,
+		.bus_width	= 8,
+		.direction	= RKISP1_DIR_IN_OUT,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_YUYV8_1X16,
+		.fmt_type	= FMT_YUV,
+		.mipi_dt	= CIF_CSI2_DT_YUV422_8b,
+		.yuv_seq	= CIF_ISP_ACQ_PROP_YCBYCR,
+		.bus_width	= 16,
+		.direction	= RKISP1_DIR_IN,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_YVYU8_1X16,
+		.fmt_type	= FMT_YUV,
+		.mipi_dt	= CIF_CSI2_DT_YUV422_8b,
+		.yuv_seq	= CIF_ISP_ACQ_PROP_YCRYCB,
+		.bus_width	= 16,
+		.direction	= RKISP1_DIR_IN,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_UYVY8_1X16,
+		.fmt_type	= FMT_YUV,
+		.mipi_dt	= CIF_CSI2_DT_YUV422_8b,
+		.yuv_seq	= CIF_ISP_ACQ_PROP_CBYCRY,
+		.bus_width	= 16,
+		.direction	= RKISP1_DIR_IN,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_VYUY8_1X16,
+		.fmt_type	= FMT_YUV,
+		.mipi_dt	= CIF_CSI2_DT_YUV422_8b,
+		.yuv_seq	= CIF_ISP_ACQ_PROP_CRYCBY,
+		.bus_width	= 16,
+		.direction	= RKISP1_DIR_IN,
+	},
+};
+
+static const struct rkisp1_fmt *find_fmt(u32 mbus_code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rkisp1_isp_formats); i++) {
+		const struct rkisp1_fmt *fmt = &rkisp1_isp_formats[i];
+
+		if (fmt->mbus_code == mbus_code)
+			return fmt;
+	}
+
+	return NULL;
+}
+
+static int rkisp1_isp_sd_enum_mbus_code(struct v4l2_subdev *sd,
+					struct v4l2_subdev_pad_config *cfg,
+					struct v4l2_subdev_mbus_code_enum *code)
+{
+	unsigned int i, dir;
+	int pos = 0;
+
+	if (code->pad == RKISP1_ISP_PAD_SINK_VIDEO) {
+		dir = RKISP1_DIR_IN;
+	} else if (code->pad == RKISP1_ISP_PAD_SOURCE_VIDEO) {
+		dir = RKISP1_DIR_OUT;
+	} else {
+		if (code->index > 0)
+			return -EINVAL;
+		code->code = MEDIA_BUS_FMT_FIXED;
+		return 0;
+	}
+
+	if (code->index >= ARRAY_SIZE(rkisp1_isp_formats))
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(rkisp1_isp_formats); i++) {
+		const struct rkisp1_fmt *fmt = &rkisp1_isp_formats[i];
+
+		if (fmt->direction & dir)
+			pos++;
+
+		if (code->index == pos - 1) {
+			code->code = fmt->mbus_code;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int rkisp1_isp_sd_init_config(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_pad_config *cfg)
+{
+	struct v4l2_rect *mf_in_crop, *mf_out_crop;
+	struct v4l2_mbus_framefmt *mf_in, *mf_out;
+
+	mf_in = v4l2_subdev_get_try_format(sd, cfg, RKISP1_ISP_PAD_SINK_VIDEO);
+	mf_in->width = RKISP1_DEFAULT_WIDTH;
+	mf_in->height = RKISP1_DEFAULT_HEIGHT;
+	mf_in->field = V4L2_FIELD_NONE;
+	mf_in->code = RKISP1_DEF_SINK_PAD_FMT;
+
+	mf_in_crop = v4l2_subdev_get_try_crop(sd, cfg,
+					      RKISP1_ISP_PAD_SINK_VIDEO);
+	mf_in_crop->width = RKISP1_DEFAULT_WIDTH;
+	mf_in_crop->height = RKISP1_DEFAULT_HEIGHT;
+	mf_in_crop->left = 0;
+	mf_in_crop->top = 0;
+
+	mf_out = v4l2_subdev_get_try_format(sd, cfg,
+					    RKISP1_ISP_PAD_SOURCE_VIDEO);
+	*mf_out = *mf_in;
+	mf_out->code = RKISP1_DEF_SRC_PAD_FMT;
+	mf_out->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+
+	mf_out_crop = v4l2_subdev_get_try_crop(sd, cfg,
+					       RKISP1_ISP_PAD_SOURCE_VIDEO);
+	*mf_out_crop = *mf_in_crop;
+
+	mf_in = v4l2_subdev_get_try_format(sd, cfg, RKISP1_ISP_PAD_SINK_PARAMS);
+	mf_out = v4l2_subdev_get_try_format(sd, cfg,
+					    RKISP1_ISP_PAD_SOURCE_STATS);
+	/*
+	 * NOTE: setting a format here doesn't make much sense
+	 * but v4l2-compliance complains
+	 */
+	mf_in->width = RKISP1_DEFAULT_WIDTH;
+	mf_in->height = RKISP1_DEFAULT_HEIGHT;
+	mf_in->field = V4L2_FIELD_NONE;
+	mf_in->code = MEDIA_BUS_FMT_FIXED;
+	*mf_out = *mf_in;
+
+	return 0;
+}
+
+static void rkisp1_isp_sd_set_out_crop(struct rkisp1_isp_subdev *isp_sd,
+				       struct v4l2_subdev_pad_config *cfg,
+				       struct v4l2_rect *r, unsigned int which)
+{
+	const struct v4l2_rect *in_crop;
+	struct v4l2_rect *out_crop;
+
+	out_crop = rkisp1_isp_sd_get_pad_crop(isp_sd, cfg,
+					      RKISP1_ISP_PAD_SOURCE_VIDEO,
+					      which);
+
+	out_crop->left = ALIGN(r->left, 2);
+	out_crop->width = ALIGN(r->width, 2);
+	out_crop->top = r->top;
+	out_crop->height = r->height;
+
+	in_crop = rkisp1_isp_sd_get_pad_crop(isp_sd, cfg,
+					     RKISP1_ISP_PAD_SINK_VIDEO, which);
+
+	out_crop->left = clamp_t(u32, out_crop->left, 0, in_crop->width);
+	out_crop->top = clamp_t(u32, out_crop->top, 0, in_crop->height);
+	out_crop->width = clamp_t(u32, out_crop->width,
+				  CIF_ISP_OUTPUT_W_MIN,
+				  in_crop->width - out_crop->left);
+	out_crop->height = clamp_t(u32, out_crop->height,
+				   CIF_ISP_OUTPUT_H_MIN,
+				   in_crop->height - out_crop->top);
+}
+
+static void rkisp1_isp_sd_set_out_fmt(struct rkisp1_isp_subdev *isp_sd,
+				      struct v4l2_subdev_pad_config *cfg,
+				      struct v4l2_mbus_framefmt *format,
+				      unsigned int which)
+{
+	struct v4l2_mbus_framefmt *out_fmt;
+	const struct rkisp1_fmt *rk_fmt;
+	const struct v4l2_rect *in_crop;
+
+	out_fmt = rkisp1_isp_sd_get_pad_fmt(isp_sd, cfg,
+					    RKISP1_ISP_PAD_SOURCE_VIDEO,
+					    which);
+	in_crop = rkisp1_isp_sd_get_pad_crop(isp_sd, cfg,
+					     RKISP1_ISP_PAD_SINK_VIDEO, which);
+
+	/*
+	 * TODO: check if other fields besides width/height/quantization are
+	 * also configurable. If yes, then accept them from userspace.
+	 */
+	out_fmt->code = format->code;
+	rk_fmt = find_fmt(out_fmt->code);
+	if (!rk_fmt) {
+		out_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
+		rk_fmt = find_fmt(out_fmt->code);
+	}
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		isp_sd->out_fmt = rk_fmt;
+	/* window size is set in s_selection */
+	out_fmt->width  = in_crop->width;
+	out_fmt->height = in_crop->height;
+	/* TODO: validate quantization value */
+	out_fmt->quantization = format->quantization;
+	/* full range by default */
+	if (!out_fmt->quantization)
+		out_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+
+	*format = *out_fmt;
+}
+
+static void rkisp1_isp_sd_set_in_crop(struct rkisp1_isp_subdev *isp_sd,
+				      struct v4l2_subdev_pad_config *cfg,
+				      struct v4l2_rect *r, unsigned int which)
+{
+	struct v4l2_mbus_framefmt *in_fmt, *out_fmt;
+	struct v4l2_rect *in_crop, *out_crop;
+
+	in_crop = rkisp1_isp_sd_get_pad_crop(isp_sd, cfg,
+					     RKISP1_ISP_PAD_SINK_VIDEO,
+					     which);
+
+	in_crop->left = ALIGN(r->left, 2);
+	in_crop->width = ALIGN(r->width, 2);
+	in_crop->top = r->top;
+	in_crop->height = r->height;
+
+	in_fmt = rkisp1_isp_sd_get_pad_fmt(isp_sd, cfg,
+					   RKISP1_ISP_PAD_SINK_VIDEO, which);
+
+	in_crop->left = clamp_t(u32, in_crop->left, 0, in_fmt->width);
+	in_crop->top = clamp_t(u32, in_crop->top, 0, in_fmt->height);
+	in_crop->width = clamp_t(u32, in_crop->width, CIF_ISP_INPUT_W_MIN,
+				 in_fmt->width - in_crop->left);
+	in_crop->height = clamp_t(u32, in_crop->height,
+				  CIF_ISP_INPUT_H_MIN,
+				  in_fmt->height - in_crop->top);
+
+	/* Update source crop and format */
+	out_fmt = rkisp1_isp_sd_get_pad_fmt(isp_sd, cfg,
+					    RKISP1_ISP_PAD_SOURCE_VIDEO, which);
+	rkisp1_isp_sd_set_out_fmt(isp_sd, cfg, out_fmt, which);
+
+	out_crop = rkisp1_isp_sd_get_pad_crop(isp_sd, cfg,
+					      RKISP1_ISP_PAD_SOURCE_VIDEO,
+					      which);
+	rkisp1_isp_sd_set_out_crop(isp_sd, cfg, out_crop, which);
+}
+
+static void rkisp1_isp_sd_set_in_fmt(struct rkisp1_isp_subdev *isp_sd,
+				     struct v4l2_subdev_pad_config *cfg,
+				     struct v4l2_mbus_framefmt *format,
+				     unsigned int which)
+{
+	struct v4l2_mbus_framefmt *in_fmt;
+	const struct rkisp1_fmt *rk_fmt;
+	struct v4l2_rect *in_crop;
+
+	in_fmt = rkisp1_isp_sd_get_pad_fmt(isp_sd, cfg,
+					   RKISP1_ISP_PAD_SINK_VIDEO, which);
+
+	/*
+	 * TODO: check if other fields besides width/height/quantization are
+	 * also configurable. If yes, then accept them from userspace.
+	 */
+	in_fmt->code = format->code;
+	rk_fmt = find_fmt(in_fmt->code);
+	if (!rk_fmt) {
+		in_fmt->code = RKISP1_DEF_SINK_PAD_FMT;
+		rk_fmt = find_fmt(in_fmt->code);
+	}
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		isp_sd->in_fmt = rk_fmt;
+	in_fmt->width = clamp_t(u32, format->width,
+				CIF_ISP_INPUT_W_MIN,
+				CIF_ISP_INPUT_W_MAX);
+	in_fmt->height = clamp_t(u32, format->height,
+				 CIF_ISP_INPUT_H_MIN,
+				 CIF_ISP_INPUT_H_MAX);
+
+	*format = *in_fmt;
+
+	/* Update sink crop */
+	in_crop = rkisp1_isp_sd_get_pad_crop(isp_sd, cfg,
+					     RKISP1_ISP_PAD_SINK_VIDEO, which);
+	rkisp1_isp_sd_set_in_crop(isp_sd, cfg, in_crop, which);
+}
+
+static int rkisp1_isp_sd_get_fmt(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_format *fmt)
+{
+	struct rkisp1_isp_subdev *isp_sd = sd_to_isp_sd(sd);
+
+	fmt->format = *rkisp1_isp_sd_get_pad_fmt(isp_sd, cfg, fmt->pad,
+						 fmt->which);
+	return 0;
+}
+
+static int rkisp1_isp_sd_set_fmt(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_format *fmt)
+{
+	struct rkisp1_isp_subdev *isp_sd = sd_to_isp_sd(sd);
+
+	if (fmt->pad == RKISP1_ISP_PAD_SINK_VIDEO)
+		rkisp1_isp_sd_set_in_fmt(isp_sd, cfg, &fmt->format, fmt->which);
+	else if (fmt->pad == RKISP1_ISP_PAD_SOURCE_VIDEO)
+		rkisp1_isp_sd_set_out_fmt(isp_sd, cfg, &fmt->format,
+					  fmt->which);
+	else
+		fmt->format = *rkisp1_isp_sd_get_pad_fmt(isp_sd, cfg, fmt->pad,
+							 fmt->which);
+
+	return 0;
+}
+
+static int rkisp1_isp_sd_get_selection(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_pad_config *cfg,
+				       struct v4l2_subdev_selection *sel)
+{
+	struct rkisp1_isp_subdev *isp_sd = sd_to_isp_sd(sd);
+
+	if (sel->pad != RKISP1_ISP_PAD_SOURCE_VIDEO &&
+	    sel->pad != RKISP1_ISP_PAD_SINK_VIDEO)
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		if (sel->pad == RKISP1_ISP_PAD_SINK_VIDEO) {
+			struct v4l2_mbus_framefmt *__format;
+
+			__format = rkisp1_isp_sd_get_pad_fmt(isp_sd, cfg,
+							     sel->pad,
+							     sel->which);
+			sel->r.height = __format->height;
+			sel->r.width = __format->width;
+			sel->r.left = 0;
+			sel->r.top = 0;
+		} else {
+			sel->r = *rkisp1_isp_sd_get_pad_crop(isp_sd, cfg,
+						RKISP1_ISP_PAD_SINK_VIDEO,
+						sel->which);
+		}
+		break;
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *rkisp1_isp_sd_get_pad_crop(isp_sd, cfg, sel->pad,
+						     sel->which);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rkisp1_isp_sd_set_selection(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_pad_config *cfg,
+				       struct v4l2_subdev_selection *sel)
+{
+	struct rkisp1_isp_subdev *isp_sd = sd_to_isp_sd(sd);
+	struct rkisp1_device *dev = sd_to_isp_dev(sd);
+
+	if (sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	dev_dbg(dev->dev, "%s: pad: %d sel(%d,%d)/%dx%d\n", __func__, sel->pad,
+		sel->r.left, sel->r.top, sel->r.width, sel->r.height);
+
+	if (sel->pad == RKISP1_ISP_PAD_SINK_VIDEO)
+		rkisp1_isp_sd_set_in_crop(isp_sd, cfg, &sel->r, sel->which);
+	else if (sel->pad == RKISP1_ISP_PAD_SOURCE_VIDEO)
+		rkisp1_isp_sd_set_out_crop(isp_sd, cfg, &sel->r, sel->which);
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int mipi_csi2_s_stream_start(struct rkisp1_isp_subdev *isp_sd,
+				    struct sensor_async_subdev *sensor)
+{
+	union phy_configure_opts opts;
+	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
+	s64 pixel_clock;
+
+	if (!sensor->pixel_rate_ctrl) {
+		dev_warn(sensor->sd->dev, "No pixel rate control in subdev\n");
+		return -EPIPE;
+	}
+
+	pixel_clock = v4l2_ctrl_g_ctrl_int64(sensor->pixel_rate_ctrl);
+	if (!pixel_clock) {
+		dev_err(sensor->sd->dev, "Invalid pixel rate value\n");
+		return -EINVAL;
+	}
+
+	phy_mipi_dphy_get_default_config(pixel_clock, isp_sd->in_fmt->bus_width,
+					 sensor->lanes, cfg);
+	phy_set_mode(sensor->dphy, PHY_MODE_MIPI_DPHY);
+	phy_configure(sensor->dphy, &opts);
+	phy_power_on(sensor->dphy);
+
+	return 0;
+}
+
+static void mipi_csi2_s_stream_stop(struct sensor_async_subdev *sensor)
+{
+	phy_power_off(sensor->dphy);
+}
+
+static int rkisp1_isp_sd_s_stream(struct v4l2_subdev *sd, int on)
+{
+	struct rkisp1_device *isp_dev = sd_to_isp_dev(sd);
+	struct v4l2_subdev *sensor_sd;
+	int ret = 0;
+
+	if (!on) {
+		ret = rkisp1_isp_stop(isp_dev);
+		if (ret < 0)
+			return ret;
+		mipi_csi2_s_stream_stop(isp_dev->active_sensor);
+		return 0;
+	}
+
+	sensor_sd = get_remote_sensor(sd);
+	if (!sensor_sd)
+		return -ENODEV;
+	isp_dev->active_sensor = container_of(sensor_sd->asd,
+					      struct sensor_async_subdev, asd);
+
+	atomic_set(&isp_dev->isp_sdev.frm_sync_seq, 0);
+	ret = rkisp1_config_cif(isp_dev);
+	if (ret < 0)
+		return ret;
+
+	/* TODO: support other interfaces */
+	if (isp_dev->active_sensor->mbus.type != V4L2_MBUS_CSI2_DPHY)
+		return -EINVAL;
+
+	ret = mipi_csi2_s_stream_start(&isp_dev->isp_sdev,
+				       isp_dev->active_sensor);
+	if (ret < 0)
+		return ret;
+
+	ret = rkisp1_isp_start(isp_dev);
+	if (ret)
+		mipi_csi2_s_stream_stop(isp_dev->active_sensor);
+
+	return ret;
+}
+
+static int rkisp1_subdev_link_validate(struct media_link *link)
+{
+	if (link->sink->index == RKISP1_ISP_PAD_SINK_PARAMS)
+		return 0;
+
+	return v4l2_subdev_link_validate(link);
+}
+
+static int rkisp1_subdev_fmt_link_validate(struct v4l2_subdev *sd,
+					struct media_link *link,
+					struct v4l2_subdev_format *source_fmt,
+					struct v4l2_subdev_format *sink_fmt)
+{
+	if (source_fmt->format.code != sink_fmt->format.code)
+		return -EPIPE;
+
+	/* Crop is available */
+	if (source_fmt->format.width < sink_fmt->format.width ||
+	    source_fmt->format.height < sink_fmt->format.height)
+		return -EPIPE;
+
+	return 0;
+}
+
+static void rkisp1_isp_queue_event_sof(struct rkisp1_isp_subdev *isp)
+{
+	struct v4l2_event event = {
+		.type = V4L2_EVENT_FRAME_SYNC,
+		.u.frame_sync.frame_sequence =
+			atomic_inc_return(&isp->frm_sync_seq) - 1,
+	};
+	v4l2_event_queue(isp->sd.devnode, &event);
+}
+
+static int rkisp1_isp_sd_subs_evt(struct v4l2_subdev *sd, struct v4l2_fh *fh,
+				  struct v4l2_event_subscription *sub)
+{
+	if (sub->type != V4L2_EVENT_FRAME_SYNC)
+		return -EINVAL;
+
+	/* V4L2_EVENT_FRAME_SYNC doesn't require an id, so zero should be set */
+	if (sub->id != 0)
+		return -EINVAL;
+
+	return v4l2_event_subscribe(fh, sub, 0, NULL);
+}
+
+static const struct v4l2_subdev_pad_ops rkisp1_isp_sd_pad_ops = {
+	.enum_mbus_code = rkisp1_isp_sd_enum_mbus_code,
+	.get_selection = rkisp1_isp_sd_get_selection,
+	.set_selection = rkisp1_isp_sd_set_selection,
+	.init_cfg = rkisp1_isp_sd_init_config,
+	.get_fmt = rkisp1_isp_sd_get_fmt,
+	.set_fmt = rkisp1_isp_sd_set_fmt,
+	.link_validate = rkisp1_subdev_fmt_link_validate,
+};
+
+static const struct media_entity_operations rkisp1_isp_sd_media_ops = {
+	.link_validate = rkisp1_subdev_link_validate,
+};
+
+static const struct v4l2_subdev_video_ops rkisp1_isp_sd_video_ops = {
+	.s_stream = rkisp1_isp_sd_s_stream,
+};
+
+static const struct v4l2_subdev_core_ops rkisp1_isp_core_ops = {
+	.subscribe_event = rkisp1_isp_sd_subs_evt,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_ops rkisp1_isp_sd_ops = {
+	.core = &rkisp1_isp_core_ops,
+	.video = &rkisp1_isp_sd_video_ops,
+	.pad = &rkisp1_isp_sd_pad_ops,
+};
+
+int rkisp1_register_isp_subdev(struct rkisp1_device *isp_dev,
+			       struct v4l2_device *v4l2_dev)
+{
+	struct media_pad *pads = isp_dev->isp_sdev.pads;
+	struct v4l2_subdev *sd = &isp_dev->isp_sdev.sd;
+	int ret;
+
+	v4l2_subdev_init(sd, &rkisp1_isp_sd_ops);
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
+	sd->entity.ops = &rkisp1_isp_sd_media_ops;
+	strscpy(sd->name, "rkisp1-isp-subdev", sizeof(sd->name));
+
+	pads[RKISP1_ISP_PAD_SINK_VIDEO].flags =
+		MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
+	pads[RKISP1_ISP_PAD_SINK_PARAMS].flags = MEDIA_PAD_FL_SINK;
+	pads[RKISP1_ISP_PAD_SOURCE_VIDEO].flags = MEDIA_PAD_FL_SOURCE;
+	pads[RKISP1_ISP_PAD_SOURCE_STATS].flags = MEDIA_PAD_FL_SOURCE;
+	isp_dev->isp_sdev.in_fmt = find_fmt(RKISP1_DEF_SINK_PAD_FMT);
+	isp_dev->isp_sdev.out_fmt = find_fmt(RKISP1_DEF_SRC_PAD_FMT);
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	ret = media_entity_pads_init(&sd->entity, RKISP1_ISP_PAD_MAX, pads);
+	if (ret < 0)
+		return ret;
+
+	sd->owner = THIS_MODULE;
+	v4l2_set_subdevdata(sd, isp_dev);
+
+	ret = v4l2_device_register_subdev(v4l2_dev, sd);
+	if (ret < 0) {
+		dev_err(sd->dev, "Failed to register isp subdev\n");
+		goto err_cleanup_media_entity;
+	}
+
+	rkisp1_isp_sd_init_config(sd, isp_dev->isp_sdev.pad_cfg);
+	return 0;
+
+err_cleanup_media_entity:
+	media_entity_cleanup(&sd->entity);
+
+	return ret;
+}
+
+void rkisp1_unregister_isp_subdev(struct rkisp1_device *isp_dev)
+{
+	struct v4l2_subdev *sd = &isp_dev->isp_sdev.sd;
+
+	v4l2_device_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+}
+
+/****************  Interrupter Handlers ****************/
+
+void rkisp1_mipi_isr(struct rkisp1_device *dev)
+{
+	u32 val, status;
+
+	status = regread(dev, CIF_MIPI_MIS);
+	if (!status)
+		return;
+
+	regwrite(dev, ~0, CIF_MIPI_ICR);
+
+	/*
+	 * Disable DPHY errctrl interrupt, because this dphy
+	 * erctrl signal is asserted until the next changes
+	 * of line state. This time is may be too long and cpu
+	 * is hold in this interrupt.
+	 */
+	if (status & CIF_MIPI_ERR_CTRL(0x0f)) {
+		val = regread(dev, CIF_MIPI_IMSC);
+		regwrite(dev, val & ~CIF_MIPI_ERR_CTRL(0x0f), CIF_MIPI_IMSC);
+		dev->isp_sdev.dphy_errctrl_disabled = true;
+	}
+
+	/*
+	 * Enable DPHY errctrl interrupt again, if mipi have receive
+	 * the whole frame without any error.
+	 */
+	if (status == CIF_MIPI_FRAME_END) {
+		/*
+		 * Enable DPHY errctrl interrupt again, if mipi have receive
+		 * the whole frame without any error.
+		 */
+		if (dev->isp_sdev.dphy_errctrl_disabled) {
+			val = regread(dev, CIF_MIPI_IMSC);
+			val |= CIF_MIPI_ERR_CTRL(0x0f);
+			regwrite(dev, val, CIF_MIPI_IMSC);
+			dev->isp_sdev.dphy_errctrl_disabled = false;
+		}
+	} else {
+		dev_warn(dev->dev, "MIPI status error: 0x%08x\n", status);
+	}
+}
+
+void rkisp1_isp_isr(struct rkisp1_device *dev)
+{
+	u32 status, status_aux, isp_err;
+
+	status = regread(dev, CIF_ISP_MIS);
+	if (!status)
+		return;
+
+	/* start edge of v_sync */
+	if (status & CIF_ISP_V_START) {
+		rkisp1_isp_queue_event_sof(&dev->isp_sdev);
+
+		regwrite(dev, CIF_ISP_V_START, CIF_ISP_ICR);
+		status_aux = regread(dev, CIF_ISP_MIS);
+		if (status_aux & CIF_ISP_V_START)
+			dev_err(dev->dev, "isp icr v_statr err: 0x%x\n",
+				status_aux);
+	}
+
+	if (status & CIF_ISP_PIC_SIZE_ERROR) {
+		/* Clear pic_size_error */
+		regwrite(dev, CIF_ISP_PIC_SIZE_ERROR, CIF_ISP_ICR);
+		isp_err = regread(dev, CIF_ISP_ERR);
+		dev_err(dev->dev, "CIF_ISP_PIC_SIZE_ERROR (0x%08x)", isp_err);
+		regwrite(dev, isp_err, CIF_ISP_ERR_CLR);
+	} else if (status & CIF_ISP_DATA_LOSS) {
+		/* Clear data_loss */
+		regwrite(dev, CIF_ISP_DATA_LOSS, CIF_ISP_ICR);
+		dev_err(dev->dev, "CIF_ISP_DATA_LOSS\n");
+		regwrite(dev, CIF_ISP_DATA_LOSS, CIF_ISP_ICR);
+	}
+
+	/* sampled input frame is complete */
+	if (status & CIF_ISP_FRAME_IN) {
+		regwrite(dev, CIF_ISP_FRAME_IN, CIF_ISP_ICR);
+		status_aux = regread(dev, CIF_ISP_MIS);
+		if (status_aux & CIF_ISP_FRAME_IN)
+			dev_err(dev->dev, "isp icr frame_in err: 0x%x\n",
+				status_aux);
+	}
+
+	/* frame was completely put out */
+	if (status & CIF_ISP_FRAME) {
+		u32 isp_ris = 0;
+		/* Clear Frame In (ISP) */
+		regwrite(dev, CIF_ISP_FRAME, CIF_ISP_ICR);
+		status_aux = regread(dev, CIF_ISP_MIS);
+		if (status_aux & CIF_ISP_FRAME)
+			dev_err(dev->dev,
+				"isp icr frame end err: 0x%x\n", status_aux);
+
+		isp_ris = regread(dev, CIF_ISP_RIS);
+		if (isp_ris & (CIF_ISP_AWB_DONE | CIF_ISP_AFM_FIN |
+			       CIF_ISP_EXP_END | CIF_ISP_HIST_MEASURE_RDY))
+			rkisp1_stats_isr(&dev->stats_vdev, isp_ris);
+	}
+
+	/*
+	 * Then update changed configs. Some of them involve
+	 * lot of register writes. Do those only one per frame.
+	 * Do the updates in the order of the processing flow.
+	 */
+	rkisp1_params_isr(dev, status);
+}
diff --git a/drivers/staging/media/rkisp1/rkisp1.h b/drivers/staging/media/rkisp1/rkisp1.h
new file mode 100644
index 000000000000..0c37710a365b
--- /dev/null
+++ b/drivers/staging/media/rkisp1/rkisp1.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Rockchip ISP1 Driver - ISP Subdevice header
+ *
+ * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
+ */
+
+#ifndef _RKISP1_H
+#define _RKISP1_H
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-subdev.h>
+
+#include "common.h"
+
+struct rkisp1_stream;
+
+#define RKISP1_DIR_OUT BIT(0)
+#define RKISP1_DIR_IN BIT(1)
+#define RKISP1_DIR_IN_OUT (RKISP1_DIR_IN | RKISP1_DIR_OUT)
+
+/*
+ * struct rkisp1_fmt - ISP pad format
+ *
+ * Translate mbus_code to hardware format values
+ *
+ * @bus_width: used for parallel
+ */
+struct rkisp1_fmt {
+	u32 mbus_code;
+	u8 fmt_type;
+	u32 mipi_dt;
+	u32 yuv_seq;
+	u8 bus_width;
+	enum rkisp1_fmt_raw_pat_type bayer_pat;
+	unsigned int direction;
+};
+
+enum rkisp1_isp_pad {
+	RKISP1_ISP_PAD_SINK_VIDEO,
+	RKISP1_ISP_PAD_SINK_PARAMS,
+	RKISP1_ISP_PAD_SOURCE_VIDEO,
+	RKISP1_ISP_PAD_SOURCE_STATS,
+	RKISP1_ISP_PAD_MAX
+};
+
+/*
+ * struct rkisp1_isp_subdev - ISP sub-device
+ *
+ * See Cropping regions of ISP in rkisp1.c for details
+ * @in_frm: input size, don't have to be equal to sensor size
+ * @in_fmt: input format
+ * @in_crop: crop for sink pad
+ * @out_fmt: output format
+ * @out_crop: output size
+ *
+ * @dphy_errctrl_disabled : if dphy errctrl is disabled (avoid endless interrupt)
+ * @frm_sync_seq: frame sequence, to sync frame_id between video devices.
+ * @quantization: output quantization
+ *
+ * TODO: remember to document all the fields after refactoring
+ */
+struct rkisp1_isp_subdev {
+	struct v4l2_subdev sd;
+	struct media_pad pads[RKISP1_ISP_PAD_MAX];
+	struct v4l2_subdev_pad_config pad_cfg[RKISP1_ISP_PAD_MAX];
+	const struct rkisp1_fmt *in_fmt;
+	const struct rkisp1_fmt *out_fmt;
+	bool dphy_errctrl_disabled;
+	atomic_t frm_sync_seq;
+
+};
+
+struct v4l2_mbus_framefmt *
+rkisp1_isp_sd_get_pad_fmt(struct rkisp1_isp_subdev *isp_sd,
+			  struct v4l2_subdev_pad_config *cfg,
+			  unsigned int pad, u32 which);
+
+struct v4l2_rect *rkisp1_isp_sd_get_pad_crop(struct rkisp1_isp_subdev *isp_sd,
+					     struct v4l2_subdev_pad_config *cfg,
+					     unsigned int pad, u32 which);
+
+int rkisp1_register_isp_subdev(struct rkisp1_device *isp_dev,
+			       struct v4l2_device *v4l2_dev);
+
+void rkisp1_unregister_isp_subdev(struct rkisp1_device *isp_dev);
+
+void rkisp1_mipi_isr(struct rkisp1_device *dev);
+
+void rkisp1_isp_isr(struct rkisp1_device *dev);
+
+static inline struct rkisp1_isp_subdev *sd_to_isp_sd(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct rkisp1_isp_subdev, sd);
+}
+
+#endif /* _RKISP1_H */
-- 
2.22.0

