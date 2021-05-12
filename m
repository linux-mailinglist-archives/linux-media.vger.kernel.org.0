Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 387F937B7B3
	for <lists+linux-media@lfdr.de>; Wed, 12 May 2021 10:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbhELIUh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 04:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbhELIUg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 04:20:36 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F9ABC061574
        for <linux-media@vger.kernel.org>; Wed, 12 May 2021 01:19:27 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id b17so26028558ede.0
        for <linux-media@vger.kernel.org>; Wed, 12 May 2021 01:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s24/OapfYuE/nzYJ0w1zLktSoSSop5QHv1ZuYgOEAGw=;
        b=jOkEiaYZSUkai5S6glvxaveK/0/tnSUeEJUNjsSPMAeWxEkvWzzfSxwnqHmpTX29tT
         e/A6OXj/MjgieUzD14o9I+C9n9pAXwDRe4w3kkdpH1jDwKW5p+C1wrUar6igQGWaMdFc
         y0Qxzr4GdUDNRWoA+J13nSSuJIYlXAZ30m0gRBmz/hWnzqj5MJnIcz7ejPP21l9XQz2j
         TR0id6WEoNcZZQKH0Y+KEvcDV8Bohk6M+sa5Rhba/g12S1efJHK41/dDhr2dHYTEs9yR
         nmM3s6Eiysxn5AcsK4B3tNCF1hip/yy/++HDzBV84Odjt7IlywqzUZd8aJQJ6CB+/0Nj
         c5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s24/OapfYuE/nzYJ0w1zLktSoSSop5QHv1ZuYgOEAGw=;
        b=dkosSYZ5+ahJZ8UnX/ho21DBuaMEYicL0kmGKIR9F3yt7LsI47cuZ82/jZ1Z0Cmm8g
         OHYdKyGga6dOdNdsHbwVPx1kCI5km6cUUYulzCiHc0qQtH00Yx06ZzU8QVjlNB6kAjQi
         B94nk6AZVLe1QIE0jzEyKOqDfanu8myBzCXF8zy8KBUL9pt7yX3/L9UV/0EbYCR+hFv2
         vtAzAybEDQG0q6uJKa1FaV4D2FNJStiDQXFOBw0uyGylLP8/YPH4OegxwelJFcLqJxz4
         x6P3fOIA1X57ZPB7DLAcMOtgsgGV714FNLeyfeCJ6qBSJnw3z8uSHFjiZ8K6gWxAWXaM
         afAA==
X-Gm-Message-State: AOAM533TjREmmIa6jn1geTS4SHBeANariyyrc/MY0l+hk7SRBmfE+B6p
        scSazbe8TZbSii7f0rmy1GqjIg==
X-Google-Smtp-Source: ABdhPJyiTHLNVeIQvYuVHmwtcztlTUujoSu8Fm62cFvXGGBBuyUdRLAnoFmFJbbu3idzBTQ5f61Jcg==
X-Received: by 2002:aa7:d8ce:: with SMTP id k14mr42715605eds.248.1620807565933;
        Wed, 12 May 2021 01:19:25 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de. [84.172.85.33])
        by smtp.googlemail.com with ESMTPSA id c7sm16984746ede.37.2021.05.12.01.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 01:19:25 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] media: rcar-isp: Add Renesas R-Car Image Signal Processor driver
Date:   Wed, 12 May 2021 10:19:12 +0200
Message-Id: <20210512081912.3976565-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
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
---
 MAINTAINERS                       |   1 +
 drivers/media/platform/Kconfig    |  16 +
 drivers/media/platform/Makefile   |   1 +
 drivers/media/platform/rcar-isp.c | 500 ++++++++++++++++++++++++++++++
 4 files changed, 518 insertions(+)
 create mode 100644 drivers/media/platform/rcar-isp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c35a9c93da84f4f7..03f3d52e03596f66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11400,6 +11400,7 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/renesas,csi2.yaml
 F:	Documentation/devicetree/bindings/media/renesas,isp.yaml
 F:	Documentation/devicetree/bindings/media/renesas,vin.yaml
+F:	drivers/media/platform/rcar-isp.c
 F:	drivers/media/platform/rcar-vin/
 
 MEDIA DRIVERS FOR RENESAS - VSP1
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 157c924686e4b61b..a8777d5dd6bc3ec1 100644
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
index eedc14aafb32c2fa..8ae543f6ef764c48 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -63,6 +63,7 @@ obj-$(CONFIG_VIDEO_AM437X_VPFE)		+= am437x/
 
 obj-$(CONFIG_VIDEO_XILINX)		+= xilinx/
 
+obj-$(CONFIG_VIDEO_RCAR_ISP)		+= rcar-isp.o
 obj-$(CONFIG_VIDEO_RCAR_VIN)		+= rcar-vin/
 
 obj-$(CONFIG_VIDEO_ATMEL_ISC)		+= atmel/
diff --git a/drivers/media/platform/rcar-isp.c b/drivers/media/platform/rcar-isp.c
new file mode 100644
index 0000000000000000..bf6a376354ece89d
--- /dev/null
+++ b/drivers/media/platform/rcar-isp.c
@@ -0,0 +1,500 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Renesas R-Car ISP Channel Selector
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
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
+#define ISPPROCMODE_DT_REG(n)				(0x1100 + (0x4 * n))
+#define ISPPROCMODE_DT_PROC_MODE_VC3(pm)		(((pm) & 0x3f) << 24)
+#define ISPPROCMODE_DT_PROC_MODE_VC2(pm)		(((pm) & 0x3f) << 16)
+#define ISPPROCMODE_DT_PROC_MODE_VC1(pm)		(((pm) & 0x3f) << 8)
+#define ISPPROCMODE_DT_PROC_MODE_VC0(pm)		((pm) & 0x3f)
+
+#define ISPCS_FILTER_ID_CH_REG(n)			(0x3000 + (0x0100 * n))
+
+#define ISPCS_DT_CODE03_CH_REG(n)			(0x3008 + (0x100 * n))
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
+	for (i = 0; i < ARRAY_SIZE(rcar_isp_formats); i++)
+		if (rcar_isp_formats[i].code == code)
+			return &rcar_isp_formats[i];
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
+	RCAR_ISP_MAX_PAD,
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
+	struct media_pad pads[RCAR_ISP_MAX_PAD];
+
+	struct v4l2_async_notifier notifier;
+	struct v4l2_subdev *remote;
+	unsigned int remote_pad;
+
+	struct v4l2_mbus_framefmt mf;
+
+	struct mutex lock;
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
+static int risp_s_power(struct v4l2_subdev *sd, int on)
+{
+	struct rcar_isp *isp = sd_to_isp(sd);
+	int ret;
+
+	if (on) {
+		ret = pm_runtime_get_sync(isp->dev);
+		if (ret < 0)
+			return ret;
+
+		ret = reset_control_deassert(isp->rstc);
+		if (ret < 0)
+			return ret;
+	} else {
+		reset_control_assert(isp->rstc);
+		pm_runtime_put(isp->dev);
+	}
+
+	return 0;
+}
+
+static const struct v4l2_subdev_core_ops risp_core_ops = {
+	.s_power = risp_s_power,
+};
+
+static int risp_remote_code(struct rcar_isp *isp)
+{
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+
+	fmt.pad = isp->remote_pad;
+	if (v4l2_subdev_call(isp->remote, pad, get_fmt, NULL, &fmt))
+		return -EPIPE;
+
+	return fmt.format.code;
+}
+
+static int risp_start(struct rcar_isp *isp)
+{
+	const struct rcar_isp_format *format;
+	unsigned int vc;
+	u32 sel_csi = 0;
+
+	format = risp_code_to_fmt(risp_remote_code(isp));
+	if (!format) {
+		dev_err(isp->dev, "Unsupported bus format\n");
+		return -EINVAL;
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
+	return v4l2_subdev_call(isp->remote, video, s_stream, 1);
+}
+
+static void risp_stop(struct rcar_isp *isp)
+{
+	v4l2_subdev_call(isp->remote, video, s_stream, 0);
+
+	/* Stop ISP. */
+	risp_write(isp, ISPSTART_REG, ISPSTART_STOP);
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
+			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_format *format)
+{
+	struct rcar_isp *isp = sd_to_isp(sd);
+	struct v4l2_mbus_framefmt *framefmt;
+
+	if (!risp_code_to_fmt(format->format.code))
+		format->format.code = rcar_isp_formats[0].code;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		isp->mf = format->format;
+	} else {
+		framefmt = v4l2_subdev_get_try_format(sd, cfg, 0);
+		*framefmt = format->format;
+	}
+
+	return 0;
+}
+
+static int risp_get_pad_format(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_format *format)
+{
+	struct rcar_isp *isp = sd_to_isp(sd);
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		format->format = isp->mf;
+	else
+		format->format = *v4l2_subdev_get_try_format(sd, cfg, 0);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops risp_pad_ops = {
+	.set_fmt = risp_set_pad_format,
+	.get_fmt = risp_get_pad_format,
+};
+
+static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {
+	.core	= &risp_core_ops,
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
+	isp->remote_pad = pad;
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
+	v4l2_async_notifier_init(&isp->notifier);
+	isp->notifier.ops = &risp_notify_ops;
+
+	asd = v4l2_async_notifier_add_fwnode_subdev(&isp->notifier, fwnode,
+						    struct v4l2_async_subdev);
+	fwnode_handle_put(fwnode);
+	if (IS_ERR(asd))
+		return PTR_ERR(asd);
+
+	ret = v4l2_async_subdev_notifier_register(&isp->subdev, &isp->notifier);
+	if (ret)
+		v4l2_async_notifier_cleanup(&isp->notifier);
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
+	isp->stream_count = 0;
+
+	ret = risp_probe_resources(isp, pdev);
+	if (ret) {
+		dev_err(isp->dev, "Failed to get resources\n");
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, isp);
+
+	ret = risp_parse_dt(isp);
+	if (ret)
+		return ret;
+
+	isp->subdev.owner = THIS_MODULE;
+	isp->subdev.dev = &pdev->dev;
+	v4l2_subdev_init(&isp->subdev, &rcar_isp_subdev_ops);
+	v4l2_set_subdevdata(&isp->subdev, &pdev->dev);
+	snprintf(isp->subdev.name, V4L2_SUBDEV_NAME_SIZE, "%s %s",
+		 KBUILD_MODNAME, dev_name(&pdev->dev));
+	isp->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+
+	isp->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	isp->subdev.entity.ops = &risp_entity_ops;
+
+	isp->pads[RCAR_ISP_SINK].flags = MEDIA_PAD_FL_SINK;
+	for (i = RCAR_ISP_PORT0; i < RCAR_ISP_MAX_PAD; i++)
+		isp->pads[i].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&isp->subdev.entity, RCAR_ISP_MAX_PAD,
+				     isp->pads);
+	if (ret)
+		goto error;
+
+	pm_runtime_enable(&pdev->dev);
+
+	ret = v4l2_async_register_subdev(&isp->subdev);
+	if (ret < 0)
+		goto error;
+
+	dev_info(isp->dev, "Using CSI-2 input: %u\n", isp->csi_input);
+
+	return 0;
+error:
+	v4l2_async_notifier_unregister(&isp->notifier);
+	v4l2_async_notifier_cleanup(&isp->notifier);
+
+	return ret;
+}
+
+static int risp_remove(struct platform_device *pdev)
+{
+	struct rcar_isp *isp = platform_get_drvdata(pdev);
+
+	v4l2_async_notifier_unregister(&isp->notifier);
+	v4l2_async_notifier_cleanup(&isp->notifier);
+	v4l2_async_unregister_subdev(&isp->subdev);
+
+	pm_runtime_disable(&pdev->dev);
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
2.31.1

