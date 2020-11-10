Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99B392AD9D0
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 16:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732226AbgKJPLv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 10:11:51 -0500
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:16511 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732054AbgKJPLu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 10:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1605021109; x=1636557109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PBdLFJ8da/OiVhcut+BwcMT0L9Yr0fE76EMayY2FIEA=;
  b=OtDcz/RcuCwMU+tZif4fpaeeGGoL3X1MevUJUp0tHUP3rkYp4T2Nvvnl
   EPjQykNfudcxT9yKcMWpOGE2bL/xVw96yIJZMdbBLiXyVtjMXh7qW22Sl
   kRTFKYTHh1d2FR1d3+v7+suWftPbfWjBS+wIAZM6bP1lOiHXYGPulIc23
   k07NdVi82bwbNJ1UsvFesf2SXsuPCos8c4agHOEKEV1CDKMfqdkH8pXVn
   cT9qkGK9IlCZjSt1aQsuKL+vZLpoCRqyHPNlVnR3cwOQT6bZY5wZpdc7t
   Npd/Dzpej3f+cfqVFA5F6javuIPSgtRcneYXLH/E+q6E16LClf/EsbpvD
   w==;
IronPort-SDR: lvFoYavAnBm2xl+ar1IT6OdYaKRdKWyR8UzRW/dxl7y9uanw9/IRsZQpiIcndKshTtY9jvDQCN
 VwRtP6mhoah21hsvonNZEI7BahPBJ+9hnV0mgsnVZRCbGYrBrBREYItqeCl0D+ml4/XDbs4Sz1
 tLj1QVDyrQdtXzf/SgioGY7+B8EAZyXUu0wfVFNTm4qZifDyOYxenBGXdfFn2ShOdqoUTS3CJs
 VyacGoco2JqftQpVck2Y9PjUaN1p3l7j707VdrJoGy1wuf41sj3Ypm3WLCkFPgtr/ztqCW+Mus
 SkU=
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="33085577"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Nov 2020 08:11:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 10 Nov 2020 08:11:48 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 10 Nov 2020 08:11:44 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <robh+dt@kernel.org>,
        <sakari.ailus@iki.fi>, <laurent.pinchart@ideasonboard.com>,
        <jacopo@jmondi.org>
CC:     Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v4 2/3] media: atmel: introduce microchip csi2dc driver
Date:   Tue, 10 Nov 2020 17:11:15 +0200
Message-ID: <20201110151116.161260-2-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110151116.161260-1-eugen.hristev@microchip.com>
References: <20201110151116.161260-1-eugen.hristev@microchip.com>
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
Hello,

There still are some open questions regarding the last reviews on the ML.

Regarding the format list which is not const, I cannot have it const because
I reference elements from this list into a dynamic list which is non-const.

Regarding the presence of the v4l2_dev, without this I cannot add a notifier
for this device to have it async completed , when the underlying subdevice
finishes probing.

Regarding the callbacks for set frame interval, set frame size, etc, I cannot
remove them because losing functionality to the underlying subdevice, as
explained in :
https://lkml.org/lkml/2020/10/12/427

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

 drivers/media/platform/atmel/Kconfig          |  13 +
 drivers/media/platform/atmel/Makefile         |   1 +
 .../media/platform/atmel/microchip-csi2dc.c   | 785 ++++++++++++++++++
 3 files changed, 799 insertions(+)
 create mode 100644 drivers/media/platform/atmel/microchip-csi2dc.c

diff --git a/drivers/media/platform/atmel/Kconfig b/drivers/media/platform/atmel/Kconfig
index 99b51213f871..147e1c14129b 100644
--- a/drivers/media/platform/atmel/Kconfig
+++ b/drivers/media/platform/atmel/Kconfig
@@ -32,3 +32,16 @@ config VIDEO_ATMEL_ISI
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
+	  Performs clock domain crossing between hardware blocks.
diff --git a/drivers/media/platform/atmel/Makefile b/drivers/media/platform/atmel/Makefile
index c5c01556c653..8e80af500bf5 100644
--- a/drivers/media/platform/atmel/Makefile
+++ b/drivers/media/platform/atmel/Makefile
@@ -5,3 +5,4 @@ atmel-xisc-objs = atmel-sama7g5-isc.o atmel-isc-base.o
 obj-$(CONFIG_VIDEO_ATMEL_ISI) += atmel-isi.o
 obj-$(CONFIG_VIDEO_ATMEL_ISC) += atmel-isc.o
 obj-$(CONFIG_VIDEO_ATMEL_XISC) += atmel-xisc.o
+obj-$(CONFIG_VIDEO_MICROCHIP_CSI2DC) += microchip-csi2dc.o
diff --git a/drivers/media/platform/atmel/microchip-csi2dc.c b/drivers/media/platform/atmel/microchip-csi2dc.c
new file mode 100644
index 000000000000..fda1d5882dbb
--- /dev/null
+++ b/drivers/media/platform/atmel/microchip-csi2dc.c
@@ -0,0 +1,785 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Microchip CSI2 Demux Controller (CSI2DC) driver
+ *
+ * Copyright (C) 2018-2020 Microchip Technology, Inc.
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
+struct csi2dc_format {
+	u32				mbus_code;
+	u32				dt;
+};
+
+static struct csi2dc_format csi2dc_formats_list[] = {
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
+struct csi2dc_device {
+	void __iomem			*base;
+	struct v4l2_subdev		csi2dc_sd;
+	struct device			*dev;
+	struct v4l2_device		v4l2_dev;
+	struct clk			*pclk;
+	struct clk			*scck;
+
+	bool				video_pipe;
+
+	u32				num_fmts;
+	struct csi2dc_format		**formats;
+
+	struct csi2dc_format		*cur_fmt;
+	struct csi2dc_format		*try_fmt;
+
+	struct media_pad		pads[CSI2DC_PADS_NUM];
+
+	bool				clk_gated;
+	u32				vc;
+
+	struct v4l2_async_subdev	*asd;
+	struct v4l2_async_notifier	notifier;
+
+	struct v4l2_subdev		*input_sd;
+
+	u32				remote_pad;
+
+	bool				completed;
+	bool				powered_on;
+
+	struct work_struct		workq;
+};
+
+static void csi2dc_vp_update(struct csi2dc_device *csi2dc)
+{
+	u32 vp;
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
+				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct csi2dc_device *csi2dc = csi2dc_sd_to_csi2dc_device(csi2dc_sd);
+
+	if (code->index >= csi2dc->num_fmts)
+		return -EINVAL;
+
+	code->code = csi2dc->formats[code->index]->mbus_code;
+	return 0;
+}
+
+static int csi2dc_set_fmt(struct v4l2_subdev *csi2dc_sd,
+			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_format *req_fmt)
+{
+	struct csi2dc_device *csi2dc = csi2dc_sd_to_csi2dc_device(csi2dc_sd);
+	struct csi2dc_format *fmt;
+	int ret, i;
+
+	if (!csi2dc->completed) {
+		dev_dbg((csi2dc)->dev, "subdev not registered yet\n");
+		return 0;
+	}
+
+	for (fmt = csi2dc->formats[0], i = 0; i < csi2dc->num_fmts; fmt++, i++)
+		if (req_fmt->format.code == fmt->mbus_code)
+			csi2dc->try_fmt = fmt;
+
+	/* in case we could not find the desired format, default to something */
+	if (!csi2dc->try_fmt  ||
+	    req_fmt->format.code != csi2dc->try_fmt->mbus_code) {
+		csi2dc->try_fmt = csi2dc->formats[0];
+
+		dev_dbg(csi2dc->dev,
+			"CSI2DC unsupported format 0x%x, defaulting to 0x%x\n",
+			req_fmt->format.code, csi2dc->formats[0]->mbus_code);
+
+		req_fmt->format.code = csi2dc->formats[0]->mbus_code;
+	}
+
+	/* if we are just trying, we are done */
+	if (req_fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+		return 0;
+
+	ret = v4l2_subdev_call(csi2dc->input_sd, pad, set_fmt, cfg, req_fmt);
+	if (ret) {
+		dev_err(csi2dc->dev, "input subdev failed %d\n", ret);
+		return ret;
+	}
+
+	csi2dc->cur_fmt = csi2dc->try_fmt;
+	/* update video pipe */
+	csi2dc_vp_update(csi2dc);
+
+	dev_dbg(csi2dc->dev, "CSI2DC new format: 0x%x\n", req_fmt->format.code);
+	return 0;
+}
+
+static int csi2dc_formats_init(struct csi2dc_device *csi2dc)
+{
+	struct csi2dc_format *fmt;
+	struct v4l2_subdev *subdev = csi2dc->input_sd;
+	unsigned int num_fmts, i;
+
+	struct v4l2_subdev_mbus_code_enum mbus_code = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.index = 0,
+	};
+
+	num_fmts = 0;
+
+	csi2dc->formats = devm_kcalloc(csi2dc->dev,
+				       ARRAY_SIZE(csi2dc_formats_list),
+				       sizeof(*csi2dc->formats), GFP_KERNEL);
+	if (!csi2dc->formats)
+		return -ENOMEM;
+
+	while (!v4l2_subdev_call(subdev, pad, enum_mbus_code, NULL,
+	       &mbus_code)) {
+		mbus_code.index++;
+		for (fmt = &csi2dc_formats_list[0], i = 0;
+		     i < ARRAY_SIZE(csi2dc_formats_list); i++, fmt++)
+			if (fmt->mbus_code == mbus_code.code) {
+				csi2dc->formats[num_fmts] = fmt;
+				num_fmts++;
+			}
+	}
+
+	if (!num_fmts)
+		return -ENXIO;
+
+	csi2dc->num_fmts = num_fmts;
+
+	return 0;
+}
+
+static int csi2dc_power(struct csi2dc_device *csi2dc, int on)
+{
+	int ret = 0;
+
+	if (!csi2dc->completed) {
+		dev_dbg((csi2dc)->dev, "subdev not registered yet\n");
+		return 0;
+	}
+
+	if (csi2dc->powered_on == on)
+		return 0;
+
+	if (on)
+		ret = clk_prepare_enable(csi2dc->scck);
+	else
+		clk_disable_unprepare(csi2dc->scck);
+	if (ret)
+		dev_err(csi2dc->dev, "failed to enable scck: %d\n", ret);
+
+	/* if powering up, deassert reset line */
+	if (on)
+		csi2dc_writel(csi2dc, CSI2DC_GCTLR, CSI2DC_GCTLR_SWRST);
+
+	/* if powering down, assert reset line */
+	if (!on)
+		csi2dc_writel(csi2dc, CSI2DC_GCTLR, !CSI2DC_GCTLR_SWRST);
+	if (!ret)
+		csi2dc->powered_on = on;
+
+	return ret;
+}
+
+static int csi2dc_s_stream(struct v4l2_subdev *csi2dc_sd, int enable)
+{
+	struct csi2dc_device *csi2dc = csi2dc_sd_to_csi2dc_device(csi2dc_sd);
+
+	if (!csi2dc->completed) {
+		dev_dbg((csi2dc)->dev, "subdev not registered yet\n");
+		return 0;
+	}
+
+	return v4l2_subdev_call(csi2dc->input_sd, video, s_stream, enable);
+}
+
+static int csi2dc_g_frame_interval(struct v4l2_subdev *csi2dc_sd,
+				   struct v4l2_subdev_frame_interval *interval)
+{
+	struct csi2dc_device *csi2dc = csi2dc_sd_to_csi2dc_device(csi2dc_sd);
+
+	if (!csi2dc->completed) {
+		dev_dbg((csi2dc)->dev, "subdev not registered yet\n");
+		return 0;
+	}
+
+	return v4l2_subdev_call(csi2dc->input_sd, video, g_frame_interval,
+				interval);
+}
+
+static int csi2dc_s_frame_interval(struct v4l2_subdev *csi2dc_sd,
+				   struct v4l2_subdev_frame_interval *interval)
+{
+	struct csi2dc_device *csi2dc = csi2dc_sd_to_csi2dc_device(csi2dc_sd);
+
+	if (!csi2dc->completed) {
+		dev_dbg((csi2dc)->dev, "subdev not registered yet\n");
+		return 0;
+	}
+
+	return v4l2_subdev_call(csi2dc->input_sd, video, s_frame_interval,
+				interval);
+}
+
+static int csi2dc_enum_frame_size(struct v4l2_subdev *csi2dc_sd,
+				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct csi2dc_device *csi2dc = csi2dc_sd_to_csi2dc_device(csi2dc_sd);
+
+	if (!csi2dc->completed) {
+		dev_dbg((csi2dc)->dev, "subdev not registered yet\n");
+		return 0;
+	}
+
+	return v4l2_subdev_call(csi2dc->input_sd, pad, enum_frame_size, cfg,
+				fse);
+}
+
+static int csi2dc_enum_frame_interval(struct v4l2_subdev *csi2dc_sd,
+			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_frame_interval_enum *fie)
+{
+	struct csi2dc_device *csi2dc = csi2dc_sd_to_csi2dc_device(csi2dc_sd);
+
+	if (!csi2dc->completed) {
+		dev_dbg((csi2dc)->dev, "subdev not registered yet\n");
+		return 0;
+	}
+
+	return v4l2_subdev_call(csi2dc->input_sd, pad, enum_frame_interval, cfg,
+				fie);
+}
+
+static const struct v4l2_subdev_pad_ops csi2dc_pad_ops = {
+	.enum_mbus_code = csi2dc_enum_mbus_code,
+	.set_fmt = csi2dc_set_fmt,
+	.enum_frame_size = csi2dc_enum_frame_size,
+	.enum_frame_interval = csi2dc_enum_frame_interval,
+};
+
+static const struct v4l2_subdev_video_ops csi2dc_video_ops = {
+	.s_stream = csi2dc_s_stream,
+	.g_frame_interval = csi2dc_g_frame_interval,
+	.s_frame_interval = csi2dc_s_frame_interval,
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
+			    V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
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
+	struct csi2dc_device *csi2dc = container_of(notifier->v4l2_dev,
+					struct csi2dc_device, v4l2_dev);
+	int pad;
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
+	return 0;
+}
+
+static int csi2dc_async_complete(struct v4l2_async_notifier *notifier)
+{
+	struct csi2dc_device *csi2dc =
+		container_of(notifier->v4l2_dev, struct csi2dc_device,
+			     v4l2_dev);
+	int ret;
+
+	ret = csi2dc_formats_init(csi2dc);
+	if (ret)
+		return ret;
+
+	ret = v4l2_device_register_subdev_nodes(&csi2dc->v4l2_dev);
+	if (ret < 0) {
+		v4l2_err(&csi2dc->v4l2_dev,
+			 "failed to register subdev nodes\n");
+		return ret;
+	}
+
+	csi2dc->completed = true;
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
+	/* once we are completed, we can register ourselves in the pipeline */
+	schedule_work(&csi2dc->workq);
+
+	return ret;
+}
+
+static const struct v4l2_async_notifier_operations csi2dc_async_ops = {
+	.bound = csi2dc_async_bound,
+	.complete = csi2dc_async_complete,
+};
+
+static void csi2dc_cleanup_notifier(struct csi2dc_device *csi2dc)
+{
+	v4l2_async_notifier_unregister(&csi2dc->notifier);
+	v4l2_async_notifier_cleanup(&csi2dc->notifier);
+}
+
+static int csi2dc_prepare_notifier(struct csi2dc_device *csi2dc,
+				   struct device_node *input_parent)
+{
+	int ret;
+
+	v4l2_async_notifier_init(&csi2dc->notifier);
+
+	csi2dc->asd = kzalloc(sizeof(*csi2dc->asd), GFP_KERNEL);
+	if (!csi2dc->asd)
+		return -ENOMEM;
+
+	csi2dc->asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
+	csi2dc->asd->match.fwnode = of_fwnode_handle(input_parent);
+
+	ret = v4l2_async_notifier_add_subdev(&csi2dc->notifier, csi2dc->asd);
+	if (ret) {
+		dev_err(csi2dc->dev, "failed to add async notifier.\n");
+		v4l2_async_notifier_cleanup(&csi2dc->notifier);
+		goto csi2dc_prepare_notifier_err;
+	}
+
+	csi2dc->notifier.ops = &csi2dc_async_ops;
+
+	ret = v4l2_async_notifier_register(&csi2dc->v4l2_dev,
+					   &csi2dc->notifier);
+
+	if (ret) {
+		dev_err(csi2dc->dev, "fail to register async notifier.\n");
+		goto csi2dc_prepare_notifier_err;
+	}
+
+csi2dc_prepare_notifier_err:
+	of_node_put(input_parent);
+
+	return ret;
+}
+
+static int csi2dc_of_parse(struct csi2dc_device *csi2dc,
+			   struct device_node *of_node)
+{
+	struct device_node *input_node, *sink_node, *input_parent;
+	struct v4l2_fwnode_endpoint input_endpoint = { 0 },
+				    sink_endpoint = { 0 };
+	int ret;
+
+	input_node = of_graph_get_next_endpoint(of_node, NULL);
+
+	if (!input_node) {
+		dev_err(csi2dc->dev,
+			"missing port node at %s, input node is mandatory.\n",
+			of_node->full_name);
+		return -EINVAL;
+	}
+
+	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(input_node),
+					 &input_endpoint);
+
+	if (ret) {
+		dev_err(csi2dc->dev, "endpoint not defined at %s\n",
+			of_node->full_name);
+		return ret;
+	}
+
+	input_parent = of_graph_get_remote_port_parent(input_node);
+	if (!input_parent) {
+		dev_err(csi2dc->dev,
+			"could not get input node's parent node.\n");
+		return -EINVAL;
+	}
+
+	sink_node = of_graph_get_next_endpoint(of_node, input_node);
+
+	if (sink_node)
+		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(sink_node),
+						 &sink_endpoint);
+
+	if (!sink_node || ret) {
+		dev_info(csi2dc->dev,
+			 "missing sink node at %s, data pipe available only.\n",
+			 of_node->full_name);
+	} else {
+		csi2dc->video_pipe = true;
+
+		dev_dbg(csi2dc->dev, "block %s %d.%d->%d.%d video pipeline\n",
+			of_node->full_name, input_endpoint.base.port,
+			input_endpoint.base.id,	sink_endpoint.base.port,
+			sink_endpoint.base.id);
+	}
+
+	of_node_put(sink_node);
+	of_node_put(input_node);
+
+	/* prepare async notifier for subdevice completion */
+	return csi2dc_prepare_notifier(csi2dc, input_parent);
+}
+
+static void csi2dc_workq_handler(struct work_struct *workq)
+{
+	struct csi2dc_device *csi2dc = container_of(workq,
+					struct csi2dc_device, workq);
+	int ret;
+
+	if (v4l2_async_register_subdev(&csi2dc->csi2dc_sd))
+		dev_dbg(csi2dc->dev, "failed to register the subdevice\n");
+
+	ret = csi2dc_power(csi2dc, true);
+	if (ret < 0)
+		v4l2_err(&csi2dc->v4l2_dev, "failed to power on\n");
+}
+
+static int csi2dc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct csi2dc_device *csi2dc;
+	struct resource *res = NULL;
+	int ret = 0;
+
+	csi2dc = devm_kzalloc(dev, sizeof(*csi2dc), GFP_KERNEL);
+	if (!csi2dc)
+		return -ENOMEM;
+
+	csi2dc->dev = dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
+	csi2dc->base = devm_ioremap_resource(dev, res);
+
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
+	ret = clk_prepare_enable(csi2dc->pclk);
+	if (ret) {
+		dev_err(dev, "failed to enable pclk: %d\n", ret);
+		return ret;
+	}
+
+	csi2dc->scck = devm_clk_get(dev, "scck");
+	if (IS_ERR(csi2dc->scck)) {
+		ret = PTR_ERR(csi2dc->scck);
+		dev_err(dev, "failed to get scck: %d\n", ret);
+		goto csi2dc_clk_fail;
+	}
+
+	ret = v4l2_device_register(dev, &csi2dc->v4l2_dev);
+	if (ret) {
+		dev_err(dev, "unable to register v4l2 device.\n");
+		goto csi2dc_clk_fail;
+	}
+
+	v4l2_subdev_init(&csi2dc->csi2dc_sd, &csi2dc_subdev_ops);
+
+	csi2dc->csi2dc_sd.owner = THIS_MODULE;
+	csi2dc->csi2dc_sd.dev = dev;
+	snprintf(csi2dc->csi2dc_sd.name, sizeof(csi2dc->csi2dc_sd.name),
+		 "CSI2DC.0");
+
+	csi2dc->csi2dc_sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	csi2dc->csi2dc_sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	csi2dc->pads[CSI2DC_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	csi2dc->pads[CSI2DC_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&csi2dc->csi2dc_sd.entity, CSI2DC_PADS_NUM,
+				     csi2dc->pads);
+	if (ret < 0) {
+		dev_err(dev, "media entity init failed\n");
+		goto csi2dc_probe_entity_err;
+	}
+
+	v4l2_set_subdevdata(&csi2dc->csi2dc_sd, pdev);
+
+	platform_set_drvdata(pdev, &csi2dc->csi2dc_sd);
+
+	INIT_WORK(&csi2dc->workq, csi2dc_workq_handler);
+
+	ret = csi2dc_of_parse(csi2dc, dev->of_node);
+	if (ret)
+		goto csi2dc_probe_entity_err;
+
+	dev_info(dev, "Microchip CSI2DC version %x\n",
+		 csi2dc_readl(csi2dc, CSI2DC_VERSION));
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_request_idle(dev);
+
+	return 0;
+
+csi2dc_probe_entity_err:
+	media_entity_cleanup(&csi2dc->csi2dc_sd.entity);
+	v4l2_device_unregister(&csi2dc->v4l2_dev);
+csi2dc_clk_fail:
+	clk_disable_unprepare(csi2dc->pclk);
+	return ret;
+}
+
+static int csi2dc_remove(struct platform_device *pdev)
+{
+	struct v4l2_subdev *csi2dc_sd = platform_get_drvdata(pdev);
+	struct csi2dc_device *csi2dc = csi2dc_sd_to_csi2dc_device(csi2dc_sd);
+
+	pm_runtime_disable(&pdev->dev);
+
+	v4l2_async_unregister_subdev(&csi2dc->csi2dc_sd);
+	csi2dc_cleanup_notifier(csi2dc);
+	media_entity_cleanup(&csi2dc->csi2dc_sd.entity);
+	v4l2_device_unregister(&csi2dc->v4l2_dev);
+	clk_disable_unprepare(csi2dc->pclk);
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
+	.remove	= csi2dc_remove,
+	.driver	= {
+		.name		= "microchip-csi2dc",
+		.pm		= &csi2dc_dev_pm_ops,
+		.of_match_table = of_match_ptr(csi2dc_of_match),
+	},
+};
+
+module_platform_driver(csi2dc_driver);
+
+MODULE_AUTHOR("Eugen Hristev <eugen.hristev@microchip.com>");
+MODULE_DESCRIPTION("Microchip CSI2 Demux Controller driver");
+MODULE_LICENSE("GPL v2");
+MODULE_SUPPORTED_DEVICE("video");
-- 
2.25.1

