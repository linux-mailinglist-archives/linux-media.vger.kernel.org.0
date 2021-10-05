Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B93F423081
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 21:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbhJETGj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 15:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbhJETGi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 15:06:38 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 511FEC06174E
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 12:04:47 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id r10so643613wra.12
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 12:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=esMJflEQ2hpAWsi6Dqf8Xrnib2rDgZ+ioNX59NJPPYI=;
        b=pxLVQA/g5U3oGz/fA3ewQJ6QSgQqjekgv8zh0GMtHuwaC1dsQLufio6GILHMXva9G3
         rdTGy+wPnbX/c/a/YBDg8DY25KJ5P/CNfoHwY3MyW2yh3ogEXLlZxNgw20a8MUgFa8gi
         s47k/PlxaZCTSSwbjNW+XzSRhluBzgtivimG1vLuBjvICHu5xaIzyI4QpJr+Jw8rD1rS
         7SJJqnvBx6++XiinYSHkQ+W1OUq5XsK8CbmekeIBbnCSyjRbIt+cYxFyoPv4nZPrbQvi
         wKJb01JYTOCpx3czEQF3q/U7WXOPqF5bt0r7pMVpRSdsUyaCyy94rwZB4ZiTrciFFz6F
         PIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=esMJflEQ2hpAWsi6Dqf8Xrnib2rDgZ+ioNX59NJPPYI=;
        b=B/y3aE7mJql763mtw/9FDAXAeus2MXgFvKaIAHesPkgko7AKsPuhYtPBRuJbv0Oa79
         OMSUOLtrwCXD2CT/YjcpvtKQ5nl3EnDK48DW9LkKhS2U5+RazNXPY0m9U7RJaGrG+/cv
         gJp/+jR5x7mcXqCfewNkcDKKvtWBfOVTVSe+C0zg77G995J6F39OTRltxPPKwXOe+4kx
         soegjP+W6MnwWUTYvthcGVFKD5uUCHni9qsUSyC72lYVsjNPdj1pkQKFfMF3H6GFYxZL
         BqOhEZD66KwTkFcLWHTGsYTZtenjkvqOrwZAFfbLP2IicWu8WMDzQYz6foRBWIdZSW+c
         AsNQ==
X-Gm-Message-State: AOAM53313CZ7TH7IBze8qAI07a5Fw9jBwpEoL+3CFvCLYpFBR7bMnbB0
        h0wWZJiH2V47tX3uz50IIbPLNA==
X-Google-Smtp-Source: ABdhPJw+Y+fHoxHPQnZHS0i5RNMLXakra7ThSdbNr8ud5CRuk/lqHzCdLYEKPpEChcaQxiaqiEM2BQ==
X-Received: by 2002:adf:9787:: with SMTP id s7mr15920889wrb.191.1633460685703;
        Tue, 05 Oct 2021 12:04:45 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id o26sm2829874wmc.17.2021.10.05.12.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 12:04:45 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v6] media: rcar-isp: Add Renesas R-Car Image Signal Processor driver
Date:   Tue,  5 Oct 2021 21:04:27 +0200
Message-Id: <20211005190427.3777971-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a V4L2 driver for Renesas R-Car Image Signal Processor. The driver
supports the R-Car V3U SoC where the ISP IP sits between the R-Car CSI-2
receiver and VIN and filters the CSI-2 data based on VC/DT and directs
the video stream to different VIN IPs.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
* Changes since v5
- Remove unused remote_pad.
- Rename RCAR_ISP_MAX_PAD to RCAR_ISP_NUM_PADS.
- Switch to MEDIA_ENT_F_VID_MUX instead of
  MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER as it closers matches the
  subdevice true function.

* Changes since v4
- Update to the new async function names.
- Do not depend on external s_power, instead control the device power at stream start/stop.
- Do not look at remote upstream subdevice format when starting (or at all).
- Serialise access for format variables in get_fmt and set_fmt.
- Make use of v4l2_subdev_link_validate_default()
- Add mutex_destroy() on error paths and in remove function.
- Propperly disable runtime PM if subdev registration fails.

* Changes since v3
- Fix spelling in header information.
- Add parentheses around macro expansions.
- Add explicit blocks to for-loop body.
- Add documentation for mutex.

* Changes since v2
- Add description of IPS capabilities and that only channel selection is
  currently supported.
- Update signature of v4l2_subdev_pad_ops set_fmt.
- Switch to pm_runtime_resume_and_get().
- Make better use of devm_kzalloc().
---
 MAINTAINERS                       |   1 +
 drivers/media/platform/Kconfig    |  16 +
 drivers/media/platform/Makefile   |   1 +
 drivers/media/platform/rcar-isp.c | 515 ++++++++++++++++++++++++++++++
 4 files changed, 533 insertions(+)
 create mode 100644 drivers/media/platform/rcar-isp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 747a7ac8a148acff..fb2ea5536fbfa1e3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11681,6 +11681,7 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/renesas,csi2.yaml
 F:	Documentation/devicetree/bindings/media/renesas,isp.yaml
 F:	Documentation/devicetree/bindings/media/renesas,vin.yaml
+F:	drivers/media/platform/rcar-isp.c
 F:	drivers/media/platform/rcar-vin/
 
 MEDIA DRIVERS FOR RENESAS - VSP1
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index d9f90084c2f66f5b..499c673fa02a402d 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -200,6 +200,22 @@ config VIDEO_TI_CAL_MC
 
 endif # VIDEO_TI_CAL
 
+config VIDEO_RCAR_ISP
+	tristate "R-Car Image Signal Processor (ISP)"
+	depends on VIDEO_V4L2 && OF
+	depends on ARCH_RENESAS || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select RESET_CONTROLLER
+	select V4L2_FWNODE
+	help
+	  Support for Renesas R-Car Image Signal Processor (ISP).
+	  Enable this to support the Renesas R-Car Image Signal
+	  Processor (ISP).
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called rcar-isp.
+
 endif # V4L_PLATFORM_DRIVERS
 
 menuconfig V4L_MEM2MEM_DRIVERS
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 73ce083c2fc6b51b..a148553babfc0944 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -63,6 +63,7 @@ obj-$(CONFIG_VIDEO_AM437X_VPFE)		+= am437x/
 
 obj-$(CONFIG_VIDEO_XILINX)		+= xilinx/
 
+obj-$(CONFIG_VIDEO_RCAR_ISP)		+= rcar-isp.o
 obj-$(CONFIG_VIDEO_RCAR_VIN)		+= rcar-vin/
 
 obj-$(CONFIG_VIDEO_ATMEL_ISC)		+= atmel/
diff --git a/drivers/media/platform/rcar-isp.c b/drivers/media/platform/rcar-isp.c
new file mode 100644
index 0000000000000000..2ffab30bc01161ba
--- /dev/null
+++ b/drivers/media/platform/rcar-isp.c
@@ -0,0 +1,515 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ *
+ * Driver for Renesas R-Car ISP Channel Selector
+ *
+ * The ISP hardware is capable of more than just channel selection, features
+ * such as demosaicing, white balance control and color space conversion are
+ * also possible. These more advanced features are not supported by the driver
+ * due to lack of documentation.
+ */
+
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#include <media/v4l2-subdev.h>
+
+#define ISPINPUTSEL0_REG				0x0008
+#define ISPINPUTSEL0_SEL_CSI0				BIT(31)
+
+#define ISPSTART_REG					0x0014
+#define ISPSTART_START					0xffff
+#define ISPSTART_STOP					0x0000
+
+#define ISPPROCMODE_DT_REG(n)				(0x1100 + (0x4 * (n)))
+#define ISPPROCMODE_DT_PROC_MODE_VC3(pm)		(((pm) & 0x3f) << 24)
+#define ISPPROCMODE_DT_PROC_MODE_VC2(pm)		(((pm) & 0x3f) << 16)
+#define ISPPROCMODE_DT_PROC_MODE_VC1(pm)		(((pm) & 0x3f) << 8)
+#define ISPPROCMODE_DT_PROC_MODE_VC0(pm)		((pm) & 0x3f)
+
+#define ISPCS_FILTER_ID_CH_REG(n)			(0x3000 + (0x0100 * (n)))
+
+#define ISPCS_DT_CODE03_CH_REG(n)			(0x3008 + (0x100 * (n)))
+#define ISPCS_DT_CODE03_EN3				BIT(31)
+#define ISPCS_DT_CODE03_DT3(dt)				(((dt) & 0x3f) << 24)
+#define ISPCS_DT_CODE03_EN2				BIT(23)
+#define ISPCS_DT_CODE03_DT2(dt)				(((dt) & 0x3f) << 16)
+#define ISPCS_DT_CODE03_EN1				BIT(15)
+#define ISPCS_DT_CODE03_DT1(dt)				(((dt) & 0x3f) << 8)
+#define ISPCS_DT_CODE03_EN0				BIT(7)
+#define ISPCS_DT_CODE03_DT0(dt)				((dt) & 0x3f)
+
+struct rcar_isp_format {
+	u32 code;
+	unsigned int datatype;
+	unsigned int procmode;
+};
+
+static const struct rcar_isp_format rcar_isp_formats[] = {
+	{ .code = MEDIA_BUS_FMT_RGB888_1X24,	.datatype = 0x24, .procmode = 0x15 },
+	{ .code = MEDIA_BUS_FMT_Y10_1X10,	.datatype = 0x2b, .procmode = 0x10 },
+	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .procmode = 0x0c },
+	{ .code = MEDIA_BUS_FMT_YUYV8_1X16,	.datatype = 0x1e, .procmode = 0x0c },
+	{ .code = MEDIA_BUS_FMT_UYVY8_2X8,	.datatype = 0x1e, .procmode = 0x0c },
+	{ .code = MEDIA_BUS_FMT_YUYV10_2X10,	.datatype = 0x1e, .procmode = 0x0c },
+};
+
+static const struct rcar_isp_format *risp_code_to_fmt(unsigned int code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rcar_isp_formats); i++) {
+		if (rcar_isp_formats[i].code == code)
+			return &rcar_isp_formats[i];
+	}
+
+	return NULL;
+}
+
+enum rcar_isp_input {
+	RISP_CSI_INPUT0,
+	RISP_CSI_INPUT1,
+};
+
+enum rcar_isp_pads {
+	RCAR_ISP_SINK,
+	RCAR_ISP_PORT0,
+	RCAR_ISP_PORT1,
+	RCAR_ISP_PORT2,
+	RCAR_ISP_PORT3,
+	RCAR_ISP_PORT4,
+	RCAR_ISP_PORT5,
+	RCAR_ISP_PORT6,
+	RCAR_ISP_PORT7,
+	RCAR_ISP_NUM_PADS,
+};
+
+struct rcar_isp {
+	struct device *dev;
+	void __iomem *base;
+	struct reset_control *rstc;
+
+	enum rcar_isp_input csi_input;
+
+	struct v4l2_subdev subdev;
+	struct media_pad pads[RCAR_ISP_NUM_PADS];
+
+	struct v4l2_async_notifier notifier;
+	struct v4l2_subdev *remote;
+
+	struct mutex lock; /* Protects mf and stream_count. */
+	struct v4l2_mbus_framefmt mf;
+	int stream_count;
+};
+
+static inline struct rcar_isp *sd_to_isp(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct rcar_isp, subdev);
+}
+
+static inline struct rcar_isp *notifier_to_isp(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct rcar_isp, notifier);
+}
+
+static void risp_write(struct rcar_isp *isp, u32 offset, u32 value)
+{
+	iowrite32(value, isp->base + offset);
+}
+
+static u32 risp_read(struct rcar_isp *isp, u32 offset)
+{
+	return ioread32(isp->base + offset);
+}
+
+static int risp_power_on(struct rcar_isp *isp)
+{
+	int ret;
+
+	ret = pm_runtime_resume_and_get(isp->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = reset_control_deassert(isp->rstc);
+	if (ret < 0) {
+		pm_runtime_put(isp->dev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void risp_power_off(struct rcar_isp *isp)
+{
+	reset_control_assert(isp->rstc);
+	pm_runtime_put(isp->dev);
+}
+
+static int risp_start(struct rcar_isp *isp)
+{
+	const struct rcar_isp_format *format;
+	unsigned int vc;
+	u32 sel_csi = 0;
+	int ret;
+
+	format = risp_code_to_fmt(isp->mf.code);
+	if (!format) {
+		dev_err(isp->dev, "Unsupported bus format\n");
+		return -EINVAL;
+	}
+
+	ret = risp_power_on(isp);
+	if (ret) {
+		dev_err(isp->dev, "Failed to power on ISP\n");
+		return ret;
+	}
+
+	/* Select CSI-2 input source. */
+	if (isp->csi_input == RISP_CSI_INPUT1)
+		sel_csi = ISPINPUTSEL0_SEL_CSI0;
+
+	risp_write(isp, ISPINPUTSEL0_REG,
+		   risp_read(isp, ISPINPUTSEL0_REG) | sel_csi);
+
+	/* Configure Channel Selector. */
+	for (vc = 0; vc < 4; vc++) {
+		u8 ch = vc + 4;
+		u8 dt = format->datatype;
+
+		risp_write(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
+		risp_write(isp, ISPCS_DT_CODE03_CH_REG(ch),
+			   ISPCS_DT_CODE03_EN3 | ISPCS_DT_CODE03_DT3(dt) |
+			   ISPCS_DT_CODE03_EN2 | ISPCS_DT_CODE03_DT2(dt) |
+			   ISPCS_DT_CODE03_EN1 | ISPCS_DT_CODE03_DT1(dt) |
+			   ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
+	}
+
+	/* Setup processing method. */
+	risp_write(isp, ISPPROCMODE_DT_REG(format->datatype),
+		   ISPPROCMODE_DT_PROC_MODE_VC3(format->procmode) |
+		   ISPPROCMODE_DT_PROC_MODE_VC2(format->procmode) |
+		   ISPPROCMODE_DT_PROC_MODE_VC1(format->procmode) |
+		   ISPPROCMODE_DT_PROC_MODE_VC0(format->procmode));
+
+	/* Start ISP. */
+	risp_write(isp, ISPSTART_REG, ISPSTART_START);
+
+	ret = v4l2_subdev_call(isp->remote, video, s_stream, 1);
+	if (ret)
+		risp_power_off(isp);
+
+	return ret;
+}
+
+static void risp_stop(struct rcar_isp *isp)
+{
+	v4l2_subdev_call(isp->remote, video, s_stream, 0);
+
+	/* Stop ISP. */
+	risp_write(isp, ISPSTART_REG, ISPSTART_STOP);
+
+	risp_power_off(isp);
+}
+
+static int risp_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct rcar_isp *isp = sd_to_isp(sd);
+	int ret = 0;
+
+	mutex_lock(&isp->lock);
+
+	if (!isp->remote) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	if (enable && isp->stream_count == 0) {
+		ret = risp_start(isp);
+		if (ret)
+			goto out;
+	} else if (!enable && isp->stream_count == 1) {
+		risp_stop(isp);
+	}
+
+	isp->stream_count += enable ? 1 : -1;
+out:
+	mutex_unlock(&isp->lock);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_video_ops risp_video_ops = {
+	.s_stream = risp_s_stream,
+};
+
+static int risp_set_pad_format(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_subdev_format *format)
+{
+	struct rcar_isp *isp = sd_to_isp(sd);
+	struct v4l2_mbus_framefmt *framefmt;
+
+	mutex_lock(&isp->lock);
+
+	if (!risp_code_to_fmt(format->format.code))
+		format->format.code = rcar_isp_formats[0].code;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		isp->mf = format->format;
+	} else {
+		framefmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
+		*framefmt = format->format;
+	}
+
+	mutex_unlock(&isp->lock);
+
+	return 0;
+}
+
+static int risp_get_pad_format(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_subdev_format *format)
+{
+	struct rcar_isp *isp = sd_to_isp(sd);
+
+	mutex_lock(&isp->lock);
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		format->format = isp->mf;
+	else
+		format->format = *v4l2_subdev_get_try_format(sd, sd_state, 0);
+
+	mutex_unlock(&isp->lock);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops risp_pad_ops = {
+	.set_fmt = risp_set_pad_format,
+	.get_fmt = risp_get_pad_format,
+	.link_validate = v4l2_subdev_link_validate_default,
+};
+
+static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {
+	.video	= &risp_video_ops,
+	.pad	= &risp_pad_ops,
+};
+
+/* -----------------------------------------------------------------------------
+ * Async handling and registration of subdevices and links
+ */
+
+static int risp_notify_bound(struct v4l2_async_notifier *notifier,
+			     struct v4l2_subdev *subdev,
+			     struct v4l2_async_subdev *asd)
+{
+	struct rcar_isp *isp = notifier_to_isp(notifier);
+	int pad;
+
+	pad = media_entity_get_fwnode_pad(&subdev->entity, asd->match.fwnode,
+					  MEDIA_PAD_FL_SOURCE);
+	if (pad < 0) {
+		dev_err(isp->dev, "Failed to find pad for %s\n", subdev->name);
+		return pad;
+	}
+
+	isp->remote = subdev;
+
+	dev_dbg(isp->dev, "Bound %s pad: %d\n", subdev->name, pad);
+
+	return media_create_pad_link(&subdev->entity, pad,
+				     &isp->subdev.entity, 0,
+				     MEDIA_LNK_FL_ENABLED |
+				     MEDIA_LNK_FL_IMMUTABLE);
+}
+
+static void risp_notify_unbind(struct v4l2_async_notifier *notifier,
+			       struct v4l2_subdev *subdev,
+			       struct v4l2_async_subdev *asd)
+{
+	struct rcar_isp *isp = notifier_to_isp(notifier);
+
+	isp->remote = NULL;
+
+	dev_dbg(isp->dev, "Unbind %s\n", subdev->name);
+}
+
+static const struct v4l2_async_notifier_operations risp_notify_ops = {
+	.bound = risp_notify_bound,
+	.unbind = risp_notify_unbind,
+};
+
+static int risp_parse_dt(struct rcar_isp *isp)
+{
+	struct v4l2_async_subdev *asd;
+	struct fwnode_handle *fwnode;
+	struct fwnode_handle *ep;
+	unsigned int id;
+	int ret;
+
+	for (id = 0; id < 2; id++) {
+		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(isp->dev),
+						     0, id, 0);
+		if (ep)
+			break;
+	}
+
+	if (!ep) {
+		dev_err(isp->dev, "Not connected to subdevice\n");
+		return -EINVAL;
+	}
+
+	if (id == 1)
+		isp->csi_input = RISP_CSI_INPUT1;
+
+	fwnode = fwnode_graph_get_remote_endpoint(ep);
+	fwnode_handle_put(ep);
+
+	dev_dbg(isp->dev, "Found '%pOF'\n", to_of_node(fwnode));
+
+	v4l2_async_nf_init(&isp->notifier);
+	isp->notifier.ops = &risp_notify_ops;
+
+	asd = v4l2_async_nf_add_fwnode(&isp->notifier, fwnode,
+				       struct v4l2_async_subdev);
+	fwnode_handle_put(fwnode);
+	if (IS_ERR(asd))
+		return PTR_ERR(asd);
+
+	ret = v4l2_async_subdev_nf_register(&isp->subdev, &isp->notifier);
+	if (ret)
+		v4l2_async_nf_cleanup(&isp->notifier);
+
+	return ret;
+}
+
+/* -----------------------------------------------------------------------------
+ * Platform Device Driver
+ */
+
+static const struct media_entity_operations risp_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static int risp_probe_resources(struct rcar_isp *isp,
+				struct platform_device *pdev)
+{
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	isp->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(isp->base))
+		return PTR_ERR(isp->base);
+
+	isp->rstc = devm_reset_control_get(&pdev->dev, NULL);
+
+	return PTR_ERR_OR_ZERO(isp->rstc);
+}
+
+static const struct of_device_id risp_of_id_table[] = {
+	{ .compatible = "renesas,r8a779a0-isp" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, risp_of_id_table);
+
+static int risp_probe(struct platform_device *pdev)
+{
+	struct rcar_isp *isp;
+	unsigned int i;
+	int ret;
+
+	isp = devm_kzalloc(&pdev->dev, sizeof(*isp), GFP_KERNEL);
+	if (!isp)
+		return -ENOMEM;
+
+	isp->dev = &pdev->dev;
+
+	mutex_init(&isp->lock);
+
+	ret = risp_probe_resources(isp, pdev);
+	if (ret) {
+		dev_err(isp->dev, "Failed to get resources\n");
+		goto error_mutex;
+	}
+
+	platform_set_drvdata(pdev, isp);
+
+	pm_runtime_enable(&pdev->dev);
+
+	ret = risp_parse_dt(isp);
+	if (ret)
+		goto error_pm;
+
+	isp->subdev.owner = THIS_MODULE;
+	isp->subdev.dev = &pdev->dev;
+	v4l2_subdev_init(&isp->subdev, &rcar_isp_subdev_ops);
+	v4l2_set_subdevdata(&isp->subdev, &pdev->dev);
+	snprintf(isp->subdev.name, V4L2_SUBDEV_NAME_SIZE, "%s %s",
+		 KBUILD_MODNAME, dev_name(&pdev->dev));
+	isp->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+
+	isp->subdev.entity.function = MEDIA_ENT_F_VID_MUX;
+	isp->subdev.entity.ops = &risp_entity_ops;
+
+	isp->pads[RCAR_ISP_SINK].flags = MEDIA_PAD_FL_SINK;
+	for (i = RCAR_ISP_PORT0; i < RCAR_ISP_NUM_PADS; i++)
+		isp->pads[i].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&isp->subdev.entity, RCAR_ISP_NUM_PADS,
+				     isp->pads);
+	if (ret)
+		goto error_notifier;
+
+	ret = v4l2_async_register_subdev(&isp->subdev);
+	if (ret < 0)
+		goto error_notifier;
+
+	dev_info(isp->dev, "Using CSI-2 input: %u\n", isp->csi_input);
+
+	return 0;
+error_notifier:
+	v4l2_async_nf_unregister(&isp->notifier);
+	v4l2_async_nf_cleanup(&isp->notifier);
+error_pm:
+	pm_runtime_disable(&pdev->dev);
+error_mutex:
+	mutex_destroy(&isp->lock);
+
+	return ret;
+}
+
+static int risp_remove(struct platform_device *pdev)
+{
+	struct rcar_isp *isp = platform_get_drvdata(pdev);
+
+	v4l2_async_nf_unregister(&isp->notifier);
+	v4l2_async_nf_cleanup(&isp->notifier);
+
+	v4l2_async_unregister_subdev(&isp->subdev);
+
+	pm_runtime_disable(&pdev->dev);
+
+	mutex_destroy(&isp->lock);
+
+	return 0;
+}
+
+static struct platform_driver rcar_isp_driver = {
+	.driver = {
+		.name = "rcar-isp",
+		.of_match_table = risp_of_id_table,
+	},
+	.probe = risp_probe,
+	.remove = risp_remove,
+};
+
+module_platform_driver(rcar_isp_driver);
+
+MODULE_AUTHOR("Niklas Söderlund <niklas.soderlund@ragnatech.se>");
+MODULE_DESCRIPTION("Renesas R-Car ISP Channel Selector driver");
+MODULE_LICENSE("GPL");
-- 
2.33.0

