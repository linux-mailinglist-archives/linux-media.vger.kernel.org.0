Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEDC437323
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 09:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232310AbhJVH4M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 03:56:12 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:17393 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232331AbhJVH4L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 03:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634889234; x=1666425234;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ma+dKAX2pWoOewfmPmJTzXpxvEKF4oMdIqtmrE7Tbn4=;
  b=ZOddMYZDCJ74riY3dyTn10EjYQD9EGe3hVkMhT6BhYtIB4P/leoBqsqD
   WvpwiKsXVfzHOqrhkNrlINyTh/tyxPrsMQ3OnP5AVbGQlO9CUYc6K4rRZ
   uh6itQIJFvJES2MScvIOtEO1hIJPik4xaAywwHFbwYLvB599KDrI90IAS
   KT0b58OXhacWKFDK5FTuV4c87JHCdyw76CXwKiWWsd/aZRYW0SYwPrrDA
   1ut0Lo/hot9WxeJ1M1OgTloGQGE/lB6ehXaGEUNT8V5BFnrYyZ3vwMvLz
   7CMs3rEf04aoOukVj559vRZwJMNQztPc/UtpIgTkEAbd78Zn89MDZvtyw
   Q==;
IronPort-SDR: vAV8ebsp5hN6aY9V5G7CCBK457C6rJ4vBI65rR+DZKHhKis9dn4JFODWS9sVPVpHXyfDFZsabt
 3B0uTGbxCQl6X333zpEMwnZycY8Fd01RPgORwdcy7P2Tj3/1rydw0vetX1CFyTM+agpGIyV8ax
 preQrlIEz/lfO1aahW74FyoAwT3H2Rg9+ySJB8cW2ZzixG4SQQ8Y1TYU+5alWAxS0dI07iX5gc
 F/aTdRI9Te1ii9CsxgwMbFbq9v5FfLmVHtfG8H5pO1Q0+dGWRMQpFzi9PebdWUTJAp4FM9GFsy
 IOxHDZL0qAoRYEjFDFLAciDk
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="136538040"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 00:53:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 00:53:53 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 00:53:49 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <jacopo@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 03/21] media: atmel: introduce microchip csi2dc driver
Date:   Fri, 22 Oct 2021 10:52:29 +0300
Message-ID: <20211022075247.518880-4-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022075247.518880-1-eugen.hristev@microchip.com>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Microchip CSI2DC (CSI2 Demultiplexer Controller) is a misc bridge device
that converts a byte stream in IDI Synopsys format (coming from a CSI2HOST)
to a pixel stream that can be captured by a sensor controller.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in this revision:
- addressed comments by Jacopo and Laurent as in this thread:
https://www.spinics.net/lists/linux-media/msg181044.html

Previous change log :
Changes in v5:
- only in bindings

Changes in v4:
- now using get_mbus_config ops to get data from the subdevice, like the
virtual channel id, and the clock type.
- now having possibility to select any of the RAW10 data modes
- at completion time, select which formats are also available in the subdevice,
and move to the dynamic list accordingly
- changed the pipeline integration, do not advertise subdev ready at probe time.
wait until completion is done, and then start a workqueue that will register
this device as a subdevice for the next element in pipeline.
- moved the s_power code into a different function called now csi2dc_power
that is called with CONFIG_PM functions. This is also called at completion,
to have the device ready in case CONFIG_PM is not selected on the platform.
- merged try_fmt into set_fmt
- driver cleanup, wrapped lines over 80 characters

Changes in v2:
- moved driver to platform/atmel
- fixed minor things as per Sakari's review
- still some things from v2 review are not yet addressed, to be followed up


 drivers/media/platform/atmel/Kconfig          |  15 +
 drivers/media/platform/atmel/Makefile         |   1 +
 .../media/platform/atmel/microchip-csi2dc.c   | 700 ++++++++++++++++++
 3 files changed, 716 insertions(+)
 create mode 100644 drivers/media/platform/atmel/microchip-csi2dc.c

diff --git a/drivers/media/platform/atmel/Kconfig b/drivers/media/platform/atmel/Kconfig
index dda2f27da317..f83bee373d82 100644
--- a/drivers/media/platform/atmel/Kconfig
+++ b/drivers/media/platform/atmel/Kconfig
@@ -40,3 +40,18 @@ config VIDEO_ATMEL_ISI
 	help
 	  This module makes the ATMEL Image Sensor Interface available
 	  as a v4l2 device.
+
+config VIDEO_MICROCHIP_CSI2DC
+	tristate "Microchip CSI2 Demux Controller"
+	depends on VIDEO_V4L2 && COMMON_CLK && OF
+	depends on ARCH_AT91 || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_FWNODE
+	help
+	  CSI2 Demux Controller driver. CSI2DC is a helper chip
+	  that converts IDI interface byte stream to a parallel pixel stream.
+	  It supports various RAW formats as input.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called microchip-csi2dc.
diff --git a/drivers/media/platform/atmel/Makefile b/drivers/media/platform/atmel/Makefile
index 46d264ab7948..39f0a7eba702 100644
--- a/drivers/media/platform/atmel/Makefile
+++ b/drivers/media/platform/atmel/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_VIDEO_ATMEL_ISI) += atmel-isi.o
 obj-$(CONFIG_VIDEO_ATMEL_ISC_BASE) += atmel-isc-base.o
 obj-$(CONFIG_VIDEO_ATMEL_ISC) += atmel-isc.o
 obj-$(CONFIG_VIDEO_ATMEL_XISC) += atmel-xisc.o
+obj-$(CONFIG_VIDEO_MICROCHIP_CSI2DC) += microchip-csi2dc.o
diff --git a/drivers/media/platform/atmel/microchip-csi2dc.c b/drivers/media/platform/atmel/microchip-csi2dc.c
new file mode 100644
index 000000000000..277b86988eee
--- /dev/null
+++ b/drivers/media/platform/atmel/microchip-csi2dc.c
@@ -0,0 +1,700 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Microchip CSI2 Demux Controller (CSI2DC) driver
+ *
+ * Copyright (C) 2018 Microchip Technology, Inc.
+ *
+ * Author: Eugen Hristev <eugen.hristev@microchip.com>
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/videodev2.h>
+
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-dma-contig.h>
+
+/* Global configuration register */
+#define CSI2DC_GCFG			0x0
+
+/* MIPI sensor pixel clock is free running */
+#define CSI2DC_GCFG_MIPIFRN		BIT(0)
+/* Output waveform inter-line minimum delay */
+#define CSI2DC_GCFG_HLC(v)		((v) << 4)
+#define CSI2DC_GCFG_HLC_MASK		GENMASK(7, 4)
+/* SAMA7G5 requires a HLC delay of 15 */
+#define SAMA7G5_HLC			(15)
+
+/* Global control register */
+#define CSI2DC_GCTLR			0x04
+#define CSI2DC_GCTLR_SWRST		BIT(0)
+
+/* Global status register */
+#define CSI2DC_GS			0x08
+
+/* SSP interrupt status register */
+#define CSI2DC_SSPIS			0x28
+/* Pipe update register */
+#define CSI2DC_PU			0xC0
+/* Video pipe attributes update */
+#define CSI2DC_PU_VP			BIT(0)
+
+/* Pipe update status register */
+#define CSI2DC_PUS			0xC4
+
+/* Video pipeline enable register */
+#define CSI2DC_VPE			0xF8
+#define CSI2DC_VPE_ENABLE		BIT(0)
+
+/* Video pipeline configuration register */
+#define CSI2DC_VPCFG			0xFC
+/* Data type */
+#define CSI2DC_VPCFG_DT(v)		((v) << 0)
+#define CSI2DC_VPCFG_DT_MASK		GENMASK(5, 0)
+/* Virtual channel identifier */
+#define CSI2DC_VPCFG_VC(v)		((v) << 6)
+#define CSI2DC_VPCFG_VC_MASK		GENMASK(7, 6)
+/* Decompression enable */
+#define CSI2DC_VPCFG_DE			BIT(8)
+/* Decoder mode */
+#define CSI2DC_VPCFG_DM(v)		((v) << 9)
+#define CSI2DC_VPCFG_DM_DECODER8TO12	0
+/* Decoder predictor 2 selection */
+#define CSI2DC_VPCFG_DP2		BIT(12)
+/* Recommended memory storage */
+#define CSI2DC_VPCFG_RMS		BIT(13)
+/* Post adjustment */
+#define CSI2DC_VPCFG_PA			BIT(14)
+
+/* Video pipeline column register */
+#define CSI2DC_VPCOL			0x100
+/* Column number */
+#define CSI2DC_VPCOL_COL(v)		((v) << 0)
+#define CSI2DC_VPCOL_COL_MASK		GENMASK(15, 0)
+
+/* Video pipeline row register */
+#define CSI2DC_VPROW			0x104
+/* Row number */
+#define CSI2DC_VPROW_ROW(v)		((v) << 0)
+#define CSI2DC_VPROW_ROW_MASK		GENMASK(15, 0)
+
+/* Version register */
+#define CSI2DC_VERSION			0x1FC
+
+/* register read/write helpers */
+#define csi2dc_readl(st, reg)		readl_relaxed((st)->base + (reg))
+#define csi2dc_writel(st, reg, val)	writel_relaxed((val), \
+					(st)->base + (reg))
+
+/* supported RAW data types */
+#define CSI2DC_DT_RAW6			0x28
+#define CSI2DC_DT_RAW7			0x29
+#define CSI2DC_DT_RAW8			0x2A
+#define CSI2DC_DT_RAW10			0x2B
+#define CSI2DC_DT_RAW12			0x2C
+#define CSI2DC_DT_RAW14			0x2D
+
+/*
+ * struct csi2dc_format - CSI2DC format type struct
+ * @mbus_code:		Media bus code for the format
+ * @dt:			Data type constant for this format
+ */
+struct csi2dc_format {
+	u32				mbus_code;
+	u32				dt;
+};
+
+static const struct csi2dc_format csi2dc_formats[] = {
+	{
+		.mbus_code =		MEDIA_BUS_FMT_SRGGB10_1X10,
+		.dt =			CSI2DC_DT_RAW10,
+	}, {
+		.mbus_code =		MEDIA_BUS_FMT_SBGGR10_1X10,
+		.dt =			CSI2DC_DT_RAW10,
+	}, {
+		.mbus_code =		MEDIA_BUS_FMT_SGRBG10_1X10,
+		.dt =			CSI2DC_DT_RAW10,
+	}, {
+		.mbus_code =		MEDIA_BUS_FMT_SGBRG10_1X10,
+		.dt =			CSI2DC_DT_RAW10,
+	},
+};
+
+enum mipi_csi_pads {
+	CSI2DC_PAD_SINK			= 0,
+	CSI2DC_PAD_SOURCE		= 1,
+	CSI2DC_PADS_NUM			= 2,
+};
+
+/*
+ * struct csi2dc_device - CSI2DC device driver data/config struct
+ * @base:		Register map base address
+ * @csi2dc_sd:		v4l2 subdevice for the csi2dc device
+ *			This is the subdevice that the csi2dc device itself
+ *			registers in v4l2 subsystem
+ * @dev:		struct device for this csi2dc device
+ * @pclk:		Peripheral clock reference
+ *			Input clock that clocks the hardware block internal
+ *			logic
+ * @scck:		Sensor Controller clock reference
+ *			Input clock that is used to generate the pixel clock
+ * @format:		Current saved format used in g/s fmt
+ * @cur_fmt:		Current state format
+ * @try_fmt:		Try format that is being tried
+ * @pads:		Media entity pads for the csi2dc subdevice
+ * @clk_gated:		Whether the clock is gated or free running
+ * @video_pipe:		Whether video pipeline is configured
+ * @vc:			Current set virtual channel
+ * @asd:		Async subdevice for async bound of the underlying subdev
+ * @notifier:		Async notifier that is used to bound the underlying
+ *			subdevice to the csi2dc subdevice
+ * @input_sd:		Reference to the underlying subdevice bound to the
+ *			csi2dc subdevice
+ * @remote_pad:		Pad number of the underlying subdevice that is linked
+ *			to the csi2dc subdevice sink pad.
+ */
+struct csi2dc_device {
+	void __iomem			*base;
+	struct v4l2_subdev		csi2dc_sd;
+	struct device			*dev;
+	struct clk			*pclk;
+	struct clk			*scck;
+
+	struct v4l2_mbus_framefmt	 format;
+
+	const struct csi2dc_format	*cur_fmt;
+	const struct csi2dc_format	*try_fmt;
+
+	struct media_pad		pads[CSI2DC_PADS_NUM];
+
+	bool				clk_gated;
+	bool				video_pipe;
+	u32				vc;
+
+	struct v4l2_async_subdev	*asd;
+	struct v4l2_async_notifier	notifier;
+
+	struct v4l2_subdev		*input_sd;
+
+	u32				remote_pad;
+};
+
+static void csi2dc_vp_update(struct csi2dc_device *csi2dc)
+{
+	u32 vp;
+
+	if (!csi2dc->cur_fmt) {
+		dev_err(csi2dc->dev, "format must be configured first\n");
+		return;
+	}
+
+	if (!csi2dc->video_pipe) {
+		dev_err(csi2dc->dev, "video pipeline unavailable\n");
+		return;
+	}
+
+	vp = CSI2DC_VPCFG_DT(csi2dc->cur_fmt->dt) & CSI2DC_VPCFG_DT_MASK;
+	vp |= CSI2DC_VPCFG_VC(csi2dc->vc) & CSI2DC_VPCFG_VC_MASK;
+	vp &= ~CSI2DC_VPCFG_DE;
+	vp |= CSI2DC_VPCFG_DM(CSI2DC_VPCFG_DM_DECODER8TO12);
+	vp &= ~CSI2DC_VPCFG_DP2;
+	vp &= ~CSI2DC_VPCFG_RMS;
+	vp |= CSI2DC_VPCFG_PA;
+
+	csi2dc_writel(csi2dc, CSI2DC_VPCFG, vp);
+	csi2dc_writel(csi2dc, CSI2DC_VPE, CSI2DC_VPE_ENABLE);
+	csi2dc_writel(csi2dc, CSI2DC_PU, CSI2DC_PU_VP);
+}
+
+static inline struct csi2dc_device *
+csi2dc_sd_to_csi2dc_device(struct v4l2_subdev *csi2dc_sd)
+{
+	return container_of(csi2dc_sd, struct csi2dc_device, csi2dc_sd);
+}
+
+static int csi2dc_enum_mbus_code(struct v4l2_subdev *csi2dc_sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index >= ARRAY_SIZE(csi2dc_formats))
+		return -EINVAL;
+
+	code->code = csi2dc_formats[code->index].mbus_code;
+
+	return 0;
+}
+
+static int csi2dc_get_fmt(struct v4l2_subdev *csi2dc_sd,
+			  struct v4l2_subdev_state *sd_state,
+			  struct v4l2_subdev_format *format)
+{
+	struct csi2dc_device *csi2dc = csi2dc_sd_to_csi2dc_device(csi2dc_sd);
+
+	format->format = csi2dc->format;
+
+	return 0;
+}
+
+static int csi2dc_set_fmt(struct v4l2_subdev *csi2dc_sd,
+			  struct v4l2_subdev_state *sd_state,
+			  struct v4l2_subdev_format *req_fmt)
+{
+	struct csi2dc_device *csi2dc = csi2dc_sd_to_csi2dc_device(csi2dc_sd);
+	const struct csi2dc_format *fmt;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(csi2dc_formats);  i++) {
+		fmt = &csi2dc_formats[i];
+		if (req_fmt->format.code == fmt->mbus_code)
+			csi2dc->try_fmt = fmt;
+		fmt++;
+	}
+
+	/* in case we could not find the desired format, default to something */
+	if (!csi2dc->try_fmt  ||
+	    req_fmt->format.code != csi2dc->try_fmt->mbus_code) {
+		csi2dc->try_fmt = &csi2dc_formats[0];
+
+		dev_dbg(csi2dc->dev,
+			"CSI2DC unsupported format 0x%x, defaulting to 0x%x\n",
+			req_fmt->format.code, csi2dc_formats[0].mbus_code);
+
+		req_fmt->format.code = csi2dc_formats[0].mbus_code;
+	}
+
+	req_fmt->format.colorspace = V4L2_COLORSPACE_SRGB;
+	req_fmt->format.field = V4L2_FIELD_NONE;
+
+	/* save the format for later requests */
+	csi2dc->format = req_fmt->format;
+
+	/* if we are just trying, we are done */
+	if (req_fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+		return 0;
+
+	csi2dc->cur_fmt = csi2dc->try_fmt;
+
+	dev_dbg(csi2dc->dev, "new format set: 0x%x\n", req_fmt->format.code);
+
+	return 0;
+}
+
+static int csi2dc_power(struct csi2dc_device *csi2dc, int on)
+{
+	int ret = 0;
+
+	if (on) {
+		ret = clk_prepare_enable(csi2dc->pclk);
+		if (ret) {
+			dev_err(csi2dc->dev, "failed to enable pclk: %d\n", ret);
+			return ret;
+		}
+
+		ret = clk_prepare_enable(csi2dc->scck);
+		if (ret)
+			dev_err(csi2dc->dev,
+				"failed to enable scck: %d\n", ret);
+
+		/* if powering up, deassert reset line */
+		csi2dc_writel(csi2dc, CSI2DC_GCTLR, CSI2DC_GCTLR_SWRST);
+	} else {
+		clk_disable_unprepare(csi2dc->scck);
+
+		/* if powering down, assert reset line */
+		csi2dc_writel(csi2dc, CSI2DC_GCTLR, !CSI2DC_GCTLR_SWRST);
+
+		clk_disable_unprepare(csi2dc->pclk);
+	}
+
+	return ret;
+}
+
+static int csi2dc_s_stream(struct v4l2_subdev *csi2dc_sd, int enable)
+{
+	struct csi2dc_device *csi2dc = csi2dc_sd_to_csi2dc_device(csi2dc_sd);
+	int ret;
+
+	if (enable) {
+		ret = pm_runtime_resume_and_get(csi2dc->dev);
+		if (ret < 0)
+			return ret;
+		csi2dc_vp_update(csi2dc);
+	} else {
+		pm_runtime_put_sync(csi2dc->dev);
+	}
+
+	return v4l2_subdev_call(csi2dc->input_sd, video, s_stream, enable);
+}
+
+static const struct v4l2_subdev_pad_ops csi2dc_pad_ops = {
+	.enum_mbus_code = csi2dc_enum_mbus_code,
+	.set_fmt = csi2dc_set_fmt,
+	.get_fmt = csi2dc_get_fmt,
+};
+
+static const struct v4l2_subdev_video_ops csi2dc_video_ops = {
+	.s_stream = csi2dc_s_stream,
+};
+
+static const struct v4l2_subdev_ops csi2dc_subdev_ops = {
+	.pad = &csi2dc_pad_ops,
+	.video = &csi2dc_video_ops,
+};
+
+static int csi2dc_get_mbus_config(struct csi2dc_device *csi2dc)
+{
+	struct v4l2_mbus_config mbus_config = { 0 };
+	int ret;
+
+	ret = v4l2_subdev_call(csi2dc->input_sd, pad, get_mbus_config,
+			       csi2dc->remote_pad, &mbus_config);
+	if (ret == -ENOIOCTLCMD) {
+		dev_dbg(csi2dc->dev,
+			"no remote mbus configuration available\n");
+		goto csi2dc_get_mbus_config_defaults;
+	}
+
+	if (ret) {
+		dev_err(csi2dc->dev,
+			"failed to get remote mbus configuration\n");
+		goto csi2dc_get_mbus_config_defaults;
+	}
+
+	if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_0)
+		csi2dc->vc = 0;
+	else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_1)
+		csi2dc->vc = 1;
+	else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_2)
+		csi2dc->vc = 2;
+	else if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_3)
+		csi2dc->vc = 3;
+
+	dev_dbg(csi2dc->dev, "subdev sending on channel %d\n", csi2dc->vc);
+
+	csi2dc->clk_gated = mbus_config.flags &
+				V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
+
+	dev_dbg(csi2dc->dev, "%s clock\n",
+		csi2dc->clk_gated ? "gated" : "free running");
+
+	return 0;
+
+csi2dc_get_mbus_config_defaults:
+	csi2dc->vc = 0; /* Virtual ID 0 by default */
+	csi2dc->clk_gated = false; /* Free running clock by default */
+
+	return 0;
+}
+
+static int csi2dc_async_bound(struct v4l2_async_notifier *notifier,
+			      struct v4l2_subdev *subdev,
+			      struct v4l2_async_subdev *asd)
+{
+	struct csi2dc_device *csi2dc = container_of(notifier,
+						struct csi2dc_device, notifier);
+	int pad;
+	int ret;
+
+	csi2dc->input_sd = subdev;
+
+	pad = media_entity_get_fwnode_pad(&subdev->entity,
+					  asd->match.fwnode,
+					  MEDIA_PAD_FL_SOURCE);
+	if (pad < 0) {
+		dev_err(csi2dc->dev, "Failed to find pad for %s\n",
+			subdev->name);
+		return pad;
+	}
+
+	csi2dc->remote_pad = pad;
+
+	csi2dc_get_mbus_config(csi2dc);
+
+	ret = media_create_pad_link(&csi2dc->input_sd->entity,
+				    csi2dc->remote_pad,
+				    &csi2dc->csi2dc_sd.entity, 0,
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret < 0) {
+		dev_err(csi2dc->dev,
+			"Failed to create pad link: %s to %s\n",
+			csi2dc->input_sd->entity.name,
+			csi2dc->csi2dc_sd.entity.name);
+		return ret;
+	}
+
+	dev_dbg(csi2dc->dev, "link with %s pad: %d\n",
+		csi2dc->input_sd->name, csi2dc->remote_pad);
+
+	ret = pm_runtime_resume_and_get(csi2dc->dev);
+	if (ret < 0)
+		return ret;
+
+	csi2dc_writel(csi2dc, CSI2DC_GCFG,
+		      (SAMA7G5_HLC & CSI2DC_GCFG_HLC_MASK) |
+		      (csi2dc->clk_gated ? 0 : CSI2DC_GCFG_MIPIFRN));
+
+	csi2dc_writel(csi2dc, CSI2DC_VPCOL,
+		      CSI2DC_VPCOL_COL(0xFFF) & CSI2DC_VPCOL_COL_MASK);
+	csi2dc_writel(csi2dc, CSI2DC_VPROW,
+		      CSI2DC_VPROW_ROW(0xFFF) & CSI2DC_VPROW_ROW_MASK);
+
+	pm_runtime_put_sync(csi2dc->dev);
+
+	return ret;
+}
+
+static const struct v4l2_async_notifier_operations csi2dc_async_ops = {
+	.bound = csi2dc_async_bound,
+};
+
+static void csi2dc_cleanup_notifier(struct csi2dc_device *csi2dc)
+{
+	v4l2_async_notifier_unregister(&csi2dc->notifier);
+	v4l2_async_notifier_cleanup(&csi2dc->notifier);
+}
+
+static int csi2dc_prepare_notifier(struct csi2dc_device *csi2dc,
+				   struct device_node *input_node)
+{
+	int ret = 0;
+
+	v4l2_async_notifier_init(&csi2dc->notifier);
+
+	csi2dc->asd = v4l2_async_notifier_add_fwnode_remote_subdev
+			(&csi2dc->notifier, of_fwnode_handle(input_node),
+			struct v4l2_async_subdev);
+
+	of_node_put(input_node);
+
+	if (IS_ERR(csi2dc->asd)) {
+		ret = PTR_ERR(csi2dc->asd);
+		dev_err(csi2dc->dev,
+			"failed to add async notifier for node %pOF: %d\n",
+			input_node, ret);
+		v4l2_async_notifier_cleanup(&csi2dc->notifier);
+		return ret;
+	}
+
+	csi2dc->notifier.ops = &csi2dc_async_ops;
+
+	ret = v4l2_async_subdev_notifier_register(&csi2dc->csi2dc_sd,
+						  &csi2dc->notifier);
+
+	if (ret) {
+		dev_err(csi2dc->dev, "fail to register async notifier: %d\n",
+			ret);
+		v4l2_async_notifier_cleanup(&csi2dc->notifier);
+	}
+
+	return ret;
+}
+
+static int csi2dc_of_parse(struct csi2dc_device *csi2dc,
+			   struct device_node *of_node)
+{
+	struct device_node *input_node, *output_node;
+	struct v4l2_fwnode_endpoint input_endpoint = { 0 },
+				    output_endpoint = { 0 };
+	int ret;
+
+	output_endpoint.bus_type = V4L2_MBUS_PARALLEL;
+
+	input_node = of_graph_get_next_endpoint(of_node, NULL);
+
+	if (!input_node) {
+		dev_err(csi2dc->dev,
+			"missing port node at %pOF, input node is mandatory.\n",
+			of_node);
+		return -EINVAL;
+	}
+
+	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(input_node),
+					 &input_endpoint);
+
+	if (ret) {
+		dev_err(csi2dc->dev, "endpoint not defined at %pOF\n", of_node);
+		return ret;
+	}
+
+	output_node = of_graph_get_next_endpoint(of_node, input_node);
+
+	if (output_node)
+		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(output_node),
+						 &output_endpoint);
+
+	if (!output_node || ret) {
+		dev_info(csi2dc->dev,
+			 "missing output node at %pOF, data pipe available only.\n",
+			 of_node);
+	} else {
+		csi2dc->video_pipe = true;
+
+		dev_dbg(csi2dc->dev, "block %pOF %d.%d->%d.%d video pipeline\n",
+			of_node, input_endpoint.base.port,
+			input_endpoint.base.id, output_endpoint.base.port,
+			output_endpoint.base.id);
+	}
+
+	of_node_put(output_node);
+	of_node_put(input_node);
+
+	/* prepare async notifier for subdevice completion */
+	return csi2dc_prepare_notifier(csi2dc, input_node);
+}
+
+static int csi2dc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct csi2dc_device *csi2dc;
+	struct resource *res = NULL;
+	int ret = 0;
+	u32 ver;
+
+	csi2dc = devm_kzalloc(dev, sizeof(*csi2dc), GFP_KERNEL);
+	if (!csi2dc)
+		return -ENOMEM;
+
+	csi2dc->dev = dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	csi2dc->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(csi2dc->base)) {
+		dev_err(dev, "base address not set\n");
+		return PTR_ERR(csi2dc->base);
+	}
+
+	csi2dc->pclk = devm_clk_get(dev, "pclk");
+	if (IS_ERR(csi2dc->pclk)) {
+		ret = PTR_ERR(csi2dc->pclk);
+		dev_err(dev, "failed to get pclk: %d\n", ret);
+		return ret;
+	}
+
+	csi2dc->scck = devm_clk_get(dev, "scck");
+	if (IS_ERR(csi2dc->scck)) {
+		ret = PTR_ERR(csi2dc->scck);
+		dev_err(dev, "failed to get scck: %d\n", ret);
+		return ret;
+	}
+
+	v4l2_subdev_init(&csi2dc->csi2dc_sd, &csi2dc_subdev_ops);
+
+	csi2dc->csi2dc_sd.owner = THIS_MODULE;
+	csi2dc->csi2dc_sd.dev = dev;
+	snprintf(csi2dc->csi2dc_sd.name, sizeof(csi2dc->csi2dc_sd.name),
+		 "csi2dc");
+
+	csi2dc->csi2dc_sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	csi2dc->csi2dc_sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	v4l2_set_subdevdata(&csi2dc->csi2dc_sd, pdev);
+
+	platform_set_drvdata(pdev, csi2dc);
+
+	ret = csi2dc_of_parse(csi2dc, dev->of_node);
+	if (ret)
+		goto csi2dc_probe_cleanup_entity;
+
+	csi2dc->pads[CSI2DC_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	if (csi2dc->video_pipe)
+		csi2dc->pads[CSI2DC_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&csi2dc->csi2dc_sd.entity,
+				     csi2dc->video_pipe ? CSI2DC_PADS_NUM : 1,
+				     csi2dc->pads);
+	if (ret < 0) {
+		dev_err(dev, "media entity init failed\n");
+		goto csi2dc_probe_cleanup_entity;
+	}
+
+	/* turn power on to validate capabilities */
+	ret = csi2dc_power(csi2dc, true);
+	if (ret < 0)
+		goto csi2dc_probe_cleanup_entity;
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	ver = csi2dc_readl(csi2dc, CSI2DC_VERSION);
+	pm_request_idle(dev);
+
+	/*
+	 * we must register the subdev after PM runtime has been requested,
+	 * otherwise we might bound immediately and request pm_runtime_resume
+	 * before runtime_enable.
+	 */
+	ret = v4l2_async_register_subdev(&csi2dc->csi2dc_sd);
+	if (ret) {
+		dev_err(csi2dc->dev, "failed to register the subdevice\n");
+		goto csi2dc_probe_cleanup_entity;
+	}
+
+	dev_info(dev, "Microchip CSI2DC version %x\n", ver);
+
+	return 0;
+
+csi2dc_probe_cleanup_entity:
+	media_entity_cleanup(&csi2dc->csi2dc_sd.entity);
+
+	return ret;
+}
+
+static int csi2dc_remove(struct platform_device *pdev)
+{
+	struct csi2dc_device *csi2dc = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(&pdev->dev);
+
+	v4l2_async_unregister_subdev(&csi2dc->csi2dc_sd);
+	csi2dc_cleanup_notifier(csi2dc);
+	media_entity_cleanup(&csi2dc->csi2dc_sd.entity);
+
+	return 0;
+}
+
+static int __maybe_unused csi2dc_runtime_suspend(struct device *dev)
+{
+	struct csi2dc_device *csi2dc = dev_get_drvdata(dev);
+
+	return csi2dc_power(csi2dc, false);
+}
+
+static int __maybe_unused csi2dc_runtime_resume(struct device *dev)
+{
+	struct csi2dc_device *csi2dc = dev_get_drvdata(dev);
+
+	return csi2dc_power(csi2dc, true);
+}
+
+static const struct dev_pm_ops csi2dc_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(csi2dc_runtime_suspend, csi2dc_runtime_resume, NULL)
+};
+
+static const struct of_device_id csi2dc_of_match[] = {
+	{ .compatible = "microchip,sama7g5-csi2dc" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, csi2dc_of_match);
+
+static struct platform_driver csi2dc_driver = {
+	.probe	= csi2dc_probe,
+	.remove = csi2dc_remove,
+	.driver = {
+		.name =			"microchip-csi2dc",
+		.pm =			&csi2dc_dev_pm_ops,
+		.of_match_table =	of_match_ptr(csi2dc_of_match),
+	},
+};
+
+module_platform_driver(csi2dc_driver);
+
+MODULE_AUTHOR("Eugen Hristev <eugen.hristev@microchip.com>");
+MODULE_DESCRIPTION("Microchip CSI2 Demux Controller driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

