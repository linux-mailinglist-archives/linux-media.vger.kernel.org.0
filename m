Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9940E21249A
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 15:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729377AbgGBN0X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 09:26:23 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:36672 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729177AbgGBN0W (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 09:26:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1593696382; x=1625232382;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SFxVIt1MQvNq1tNmUbVhPpukbdq5Y6OPSaJRwFwlrsw=;
  b=jFMh9hJRl4UgsCfmfrDuhqDqM5C63Yr3n+ZtbKDqnUEWXpOFB7hu5Lj9
   kmIqXEucyE0gOEpFqmbJzOmPvycDlMFDFhH8wuqTXygH4BL34Y4s+Zf2U
   4b14+h5f/9m8cXMdt+nQgLR+yZgpJP2lm+C3s+IEzjK7RiAFAe4ufCelq
   Ux9yK0igjvG89aJB2YTUdvszNvzgW21ygDdNuFh2gHFJFgkBIkJ9smqHw
   757Fzi57zrJHWZA/kwj5HBBt8LCnWeap9x242NY5F5MPuxYz6vFN0aICB
   6OBhbCHCmepocKQ0hB3oN49l11HNwsK+xE0yq2jEQagGHB95oZjeu8Mnn
   w==;
IronPort-SDR: 4A/vgOt8yMb8cPlsbeoItUVCFCqL0cXUGM+qKGcjy4RnJr6MgF1+viuSeDRMQDbtvGApfNjQdp
 qTpsM99HuM9zWAL9bqpPzjy81BaDCPmg2c0/L4o4mlcfV86IVMCDy4pux+TvCE4Gdjy4h0nrQZ
 ZUgoWgGql5GKEn1eZVWCiPw3eNlKZf4kxLOmy+puNaGDLaBzdMfEc09H0gQutB1levTNZ0mWA8
 jB76N4fro7UMfIQNYNBqVQHQCpodIJ09KVV5mFdL5IoCFx6Q16bwyuZtjLEUBupLiBOfcLNHP5
 K2Y=
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; 
   d="scan'208";a="85998244"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Jul 2020 06:26:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 2 Jul 2020 06:26:01 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 2 Jul 2020 06:26:00 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <mchehab@kernel.org>, <hverkuil@xs4all.nl>, <robh+dt@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 3/4] media: misc: introduce microchip_csi2dc driver
Date:   Thu, 2 Jul 2020 16:23:58 +0300
Message-ID: <20200702132359.122844-4-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702132359.122844-1-eugen.hristev@microchip.com>
References: <20200702132359.122844-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Microchip CSI2DC (CSI2 Demultiplexer Controller) is a misc bridge device
that converts a byte stream in IDI Synopsys format (coming from a CSI2HOST)
to a pixel stream that can be captured by a sensor controller.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/misc/Kconfig            |   9 +
 drivers/media/misc/Makefile           |   1 +
 drivers/media/misc/microchip_csi2dc.c | 705 ++++++++++++++++++++++++++
 3 files changed, 715 insertions(+)
 create mode 100644 drivers/media/misc/microchip_csi2dc.c

diff --git a/drivers/media/misc/Kconfig b/drivers/media/misc/Kconfig
index 206f39f86f46..86e892a41eba 100644
--- a/drivers/media/misc/Kconfig
+++ b/drivers/media/misc/Kconfig
@@ -8,6 +8,15 @@ menu "Miscellaneous helper chips"
 
 comment "Various helper chips"
 
+config VIDEO_MICROCHIP_CSI2DC
+	tristate "Microchip CSI2 Demux Controller"
+	depends on VIDEO_V4L2
+	help
+	  CSI2 Demux Controller driver. CSI2DC is a helper chip
+	  that converts IDI interface byte stream to a parallel pixel stream.
+	  It supports various RAW formats as input.
+	  Performs clock domain crossing between hardware blocks.
+
 endmenu
 
 endif
diff --git a/drivers/media/misc/Makefile b/drivers/media/misc/Makefile
index f66554cd5c45..86477781b7af 100644
--- a/drivers/media/misc/Makefile
+++ b/drivers/media/misc/Makefile
@@ -1 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_VIDEO_MICROCHIP_CSI2DC) += microchip_csi2dc.o
diff --git a/drivers/media/misc/microchip_csi2dc.c b/drivers/media/misc/microchip_csi2dc.c
new file mode 100644
index 000000000000..494b7c137b17
--- /dev/null
+++ b/drivers/media/misc/microchip_csi2dc.c
@@ -0,0 +1,705 @@
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
+#define csi2dc_writel(st, reg, val)	writel_relaxed((val), (st)->base + (reg))
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
+	u32				inter_line_delay;
+	u32				vc;
+
+	struct v4l2_async_subdev	*asd;
+	struct v4l2_async_notifier	notifier;
+
+	struct v4l2_subdev		*input_sd;
+	bool				completed;
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
+static inline struct csi2dc_device *csi2dc_sd_to_csi2dc_device
+					(struct v4l2_subdev *csi2dc_sd)
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
+static int csi2dc_try_fmt(struct v4l2_subdev *csi2dc_sd,
+			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_format *req_fmt)
+{
+	struct csi2dc_device *csi2dc = csi2dc_sd_to_csi2dc_device(csi2dc_sd);
+	struct csi2dc_format *fmt;
+
+	if (!csi2dc->completed) {
+		dev_dbg((csi2dc)->dev, "subdev not registered yet\n");
+		return 0;
+	}
+
+	for (fmt = csi2dc->formats[0]; fmt; fmt++)
+		if (req_fmt->format.code == fmt->mbus_code)
+			csi2dc->try_fmt = fmt;
+
+	/* in case we could not find the desired format, default to something */
+	if (!csi2dc->try_fmt  ||
+	    req_fmt->format.code != csi2dc->try_fmt->mbus_code) {
+		csi2dc->try_fmt = csi2dc->formats[0];
+		req_fmt->format.code = csi2dc->formats[0]->mbus_code;
+	}
+
+	return v4l2_subdev_call(csi2dc->input_sd, pad, set_fmt, cfg, req_fmt);
+}
+
+static int csi2dc_set_fmt(struct v4l2_subdev *csi2dc_sd,
+			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_format *req_fmt)
+{
+	struct csi2dc_device *csi2dc = csi2dc_sd_to_csi2dc_device(csi2dc_sd);
+	int ret;
+
+	if (!csi2dc->completed) {
+		dev_dbg((csi2dc)->dev, "subdev not registered yet\n");
+		return 0;
+	}
+
+	csi2dc_try_fmt(csi2dc_sd, cfg, req_fmt);
+
+	if (csi2dc->try_fmt->mbus_code != req_fmt->format.code) {
+		dev_dbg(csi2dc->dev, "CSI2DC unsupported format 0x%x\n",
+			req_fmt->format.code);
+		return -EINVAL;
+	}
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
+	int i, j;
+	struct csi2dc_format *fmt = &csi2dc_formats_list[0];
+
+	csi2dc->num_fmts = 1;
+
+	csi2dc->formats = devm_kcalloc(csi2dc->dev, csi2dc->num_fmts,
+				       sizeof(*csi2dc->formats), GFP_KERNEL);
+
+	for (i = 0, j = 0; i < ARRAY_SIZE(csi2dc_formats_list); i++, fmt++)
+		if (fmt->mbus_code == MEDIA_BUS_FMT_SRGGB10_1X10)
+			csi2dc->formats[j++] = fmt;
+	return 0;
+}
+
+static int csi2dc_s_power(struct v4l2_subdev *csi2dc_sd, int on)
+{
+	struct csi2dc_device *csi2dc = csi2dc_sd_to_csi2dc_device(csi2dc_sd);
+	int ret = 0;
+
+	if (!csi2dc->completed) {
+		dev_dbg((csi2dc)->dev, "subdev not registered yet\n");
+		return 0;
+	}
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
+	ret = v4l2_subdev_call(csi2dc->input_sd, core, s_power, on);
+
+	/* if powering down, assert reset line */
+	if (!on)
+		csi2dc_writel(csi2dc, CSI2DC_GCTLR, !CSI2DC_GCTLR_SWRST);
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
+				      struct v4l2_subdev_pad_config *cfg,
+				      struct v4l2_subdev_frame_interval_enum *fie)
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
+static struct v4l2_subdev_core_ops csi2dc_core_ops = {
+	.s_power = csi2dc_s_power,
+};
+
+static struct v4l2_subdev_pad_ops csi2dc_pad_ops = {
+	.enum_mbus_code = csi2dc_enum_mbus_code,
+	.set_fmt = csi2dc_set_fmt,
+	.enum_frame_size = csi2dc_enum_frame_size,
+	.enum_frame_interval = csi2dc_enum_frame_interval,
+};
+
+static struct v4l2_subdev_video_ops csi2dc_video_ops = {
+	.s_stream = csi2dc_s_stream,
+	.g_frame_interval = csi2dc_g_frame_interval,
+	.s_frame_interval = csi2dc_s_frame_interval,
+};
+
+static struct v4l2_subdev_ops csi2dc_subdev_ops = {
+	.core = &csi2dc_core_ops,
+	.pad = &csi2dc_pad_ops,
+	.video = &csi2dc_video_ops,
+};
+
+static int csi2dc_async_bound(struct v4l2_async_notifier *notifier,
+			      struct v4l2_subdev *subdev,
+			      struct v4l2_async_subdev *asd)
+{
+	struct csi2dc_device *csi2dc = container_of(notifier->v4l2_dev,
+					struct csi2dc_device, v4l2_dev);
+	csi2dc->input_sd = subdev;
+
+	return 0;
+}
+
+static int csi2dc_async_complete(struct v4l2_async_notifier *notifier)
+{
+	struct csi2dc_device *csi2dc = container_of(notifier->v4l2_dev,
+					struct csi2dc_device, v4l2_dev);
+	int ret;
+
+	ret = v4l2_device_register_subdev_nodes(&csi2dc->v4l2_dev);
+	if (ret < 0) {
+		v4l2_err(&csi2dc->v4l2_dev, "failed to register subdev nodes\n");
+		return ret;
+	}
+
+	csi2dc_writel(csi2dc, CSI2DC_GCFG,
+		      (CSI2DC_GCFG_HLC(csi2dc->inter_line_delay) &
+		      CSI2DC_GCFG_HLC_MASK) |
+		      (csi2dc->clk_gated ? 0 : CSI2DC_GCFG_MIPIFRN));
+
+	csi2dc_writel(csi2dc, CSI2DC_VPCOL,
+		      CSI2DC_VPCOL_COL(0xFFF) & CSI2DC_VPCOL_COL_MASK);
+	csi2dc_writel(csi2dc, CSI2DC_VPROW,
+		      CSI2DC_VPROW_ROW(0xFFF) & CSI2DC_VPROW_ROW_MASK);
+
+	csi2dc->completed = true;
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
+	struct v4l2_fwnode_endpoint input_endpoint, sink_endpoint;
+	int ret;
+
+	memset(&input_endpoint, 0, sizeof(input_endpoint));
+	memset(&sink_endpoint, 0, sizeof(sink_endpoint));
+
+	input_node = of_graph_get_next_endpoint(of_node, NULL);
+
+	if (!input_node) {
+		dev_err(csi2dc->dev, "missing port node at %s, input node is mandatory.\n",
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
+		dev_err(csi2dc->dev, "could not get input node's parent node.\n");
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
+		dev_info(csi2dc->dev, "missing sink node at %s, data pipe available only.\n",
+			 of_node->full_name);
+	} else {
+		csi2dc->video_pipe = true;
+		csi2dc->vc = sink_endpoint.base.id;
+
+		dev_dbg(csi2dc->dev, "block %s %d.%d->%d.%d video pipe VC %d\n",
+			of_node->full_name, input_endpoint.base.port,
+			input_endpoint.base.id,	sink_endpoint.base.port,
+			sink_endpoint.base.id, csi2dc->vc);
+	}
+
+	csi2dc->clk_gated = of_property_read_bool(of_node,
+						  "microchip,clk-gated");
+
+	dev_dbg(csi2dc->dev, "%s clock\n",
+		(csi2dc->clk_gated ? "Gated" : "Free running"));
+
+	ret = of_property_read_u32(of_node, "microchip,inter-line-delay",
+				   &csi2dc->inter_line_delay);
+
+	if (ret || csi2dc->inter_line_delay > 16) {
+		dev_dbg(csi2dc->dev, "assuming inter line delay = 16 clocks");
+		csi2dc->inter_line_delay = 16;
+		ret = 0;
+	}
+	/* hardware automatically adds 1 */
+	csi2dc->inter_line_delay--;
+
+	/* prepare async notifier for subdevice completion */
+
+	if (sink_node)
+		of_node_put(sink_node);
+	of_node_put(input_node);
+
+	return csi2dc_prepare_notifier(csi2dc, input_parent);
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
+
+	csi2dc->csi2dc_sd.dev = dev;
+	snprintf(csi2dc->csi2dc_sd.name, sizeof(csi2dc->csi2dc_sd.name),
+		 "%s.%d", "CSI2DC", 0);
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
+	ret = csi2dc_of_parse(csi2dc, dev->of_node);
+	if (ret)
+		goto csi2dc_probe_entity_err;
+
+	ret = csi2dc_formats_init(csi2dc);
+	if (ret)
+		goto csi2dc_probe_error;
+
+	ret = v4l2_async_register_subdev(&csi2dc->csi2dc_sd);
+	if (ret) { // ret = -EPROBE_DEFER;
+		goto csi2dc_probe_error;
+	}
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_request_idle(dev);
+
+	pr_info("Microchip CSI2DC version %x\n",
+		csi2dc_readl(csi2dc, CSI2DC_VERSION));
+
+	return 0;
+
+csi2dc_probe_error:
+	v4l2_async_unregister_subdev(&csi2dc->csi2dc_sd);
+	csi2dc_cleanup_notifier(csi2dc);
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
+	return 0;
+}
+
+static int __maybe_unused csi2dc_runtime_resume(struct device *dev)
+{
+	return 0;
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

