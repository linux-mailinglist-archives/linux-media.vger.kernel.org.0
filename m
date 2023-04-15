Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD006E322E
	for <lists+linux-media@lfdr.de>; Sat, 15 Apr 2023 17:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbjDOP4l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Apr 2023 11:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjDOP4k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Apr 2023 11:56:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5493730F3
        for <linux-media@vger.kernel.org>; Sat, 15 Apr 2023 08:56:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 31DCD1F8;
        Sat, 15 Apr 2023 17:56:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681574189;
        bh=fUBKIu48aK2lcU9rgnw6nPArfjfV5szSdiks5BOSwo4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G3xsDuG9OI4zwrQpGvfg+hKrhE3aVyWFCNAuPdBJ9Kjodr7M9oGtJp5l0sA5qVvJA
         H00wLeTKINTK/B20cA8dD6VRvyTV5Y7CHdU/X4fqev8s77pJ4XuefhUa9UddyUtmvs
         2xatshjsskHNOMkDXd5MLJyrXeYFMCxX8Tsv6Kiw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Adam Ford <aford173@gmail.com>
Subject: [PATCH v5 2/5] media: nxp: Add i.MX8 ISI driver
Date:   Sat, 15 Apr 2023 18:56:27 +0300
Message-Id: <20230415155630.7492-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230415155630.7492-1-laurent.pinchart@ideasonboard.com>
References: <20230415155630.7492-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Image Sensing Interface (ISI) combines image processing pipelines
with DMA engines to process and capture frames originating from a
variety of sources. The inputs to the ISI go through Pixel Link
interfaces, and their number and nature is SoC-dependent. They cover
both capture interfaces (MIPI CSI-2 RX, HDMI RX) and memory inputs.

Signed-off-by: Christian Hemp <c.hemp@phytec.de>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
Tested-by: Adam Ford <aford173@gmail.com> #imx8mn-beacon
---
Changes since v2:

- Update to the latest MC internal helpers and V4L2 streams API
- Use the video_device_pipeline_{start,stop}() helpers
- Fix indentation and white space issues
- Document mxc_isi_video.lock with comment
---
 MAINTAINERS                                   |    7 +
 drivers/media/platform/nxp/Kconfig            |    2 +
 drivers/media/platform/nxp/Makefile           |    1 +
 drivers/media/platform/nxp/imx8-isi/Kconfig   |   22 +
 drivers/media/platform/nxp/imx8-isi/Makefile  |    8 +
 .../platform/nxp/imx8-isi/imx8-isi-core.c     |  645 +++++++
 .../platform/nxp/imx8-isi/imx8-isi-core.h     |  395 +++++
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  529 ++++++
 .../platform/nxp/imx8-isi/imx8-isi-debug.c    |  109 ++
 .../media/platform/nxp/imx8-isi/imx8-isi-hw.c |  651 +++++++
 .../platform/nxp/imx8-isi/imx8-isi-m2m.c      |  858 ++++++++++
 .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |  867 ++++++++++
 .../platform/nxp/imx8-isi/imx8-isi-regs.h     |  418 +++++
 .../platform/nxp/imx8-isi/imx8-isi-video.c    | 1512 +++++++++++++++++
 14 files changed, 6024 insertions(+)
 create mode 100644 drivers/media/platform/nxp/imx8-isi/Kconfig
 create mode 100644 drivers/media/platform/nxp/imx8-isi/Makefile
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 90abe83c02f3..af1958ca58de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14959,6 +14959,13 @@ F:	Documentation/devicetree/bindings/clock/imx*
 F:	drivers/clk/imx/
 F:	include/dt-bindings/clock/imx*
 
+NXP i.MX 8M ISI DRIVER
+M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
+F:	drivers/media/platform/nxp/imx8-isi/
+
 NXP i.MX 8MQ DCSS DRIVER
 M:	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
 R:	Lucas Stach <l.stach@pengutronix.de>
diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index 730f39971e1c..a0ca6b297fb8 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -28,6 +28,8 @@ config VIDEO_IMX_MIPI_CSIS
 	  Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
 	  v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.
 
+source "drivers/media/platform/nxp/imx8-isi/Kconfig"
+
 # mem2mem drivers
 
 config VIDEO_IMX_PXP
diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
index 1a129b58d99e..b8e672b75fed 100644
--- a/drivers/media/platform/nxp/Makefile
+++ b/drivers/media/platform/nxp/Makefile
@@ -2,6 +2,7 @@
 
 obj-y += dw100/
 obj-y += imx-jpeg/
+obj-y += imx8-isi/
 
 obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
 obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
diff --git a/drivers/media/platform/nxp/imx8-isi/Kconfig b/drivers/media/platform/nxp/imx8-isi/Kconfig
new file mode 100644
index 000000000000..fcff33fc2630
--- /dev/null
+++ b/drivers/media/platform/nxp/imx8-isi/Kconfig
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config VIDEO_IMX8_ISI
+	tristate "i.MX8 Image Sensor Interface (ISI) driver"
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on HAS_DMA && PM
+	depends on VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select V4L2_MEM2MEM_DEV if VIDEO_IMX8_ISI_M2M
+	select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_CONTIG
+	help
+	  V4L2 driver for the Image Sensor Interface (ISI) found in various
+	  i.MX8 SoCs.
+
+config VIDEO_IMX8_ISI_M2M
+	bool "i.MX8 Image Sensor Interface (ISI) memory-to-memory support"
+	depends on VIDEO_IMX8_ISI
+	help
+	  Select 'yes' here to enable support for memory-to-memory processing
+	  in the ISI driver.
diff --git a/drivers/media/platform/nxp/imx8-isi/Makefile b/drivers/media/platform/nxp/imx8-isi/Makefile
new file mode 100644
index 000000000000..9bff9297686d
--- /dev/null
+++ b/drivers/media/platform/nxp/imx8-isi/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+imx8-isi-y := imx8-isi-core.o imx8-isi-crossbar.o imx8-isi-hw.o \
+	imx8-isi-pipe.o imx8-isi-video.o
+imx8-isi-$(CONFIG_DEBUG_FS) += imx8-isi-debug.o
+imx8-isi-$(CONFIG_VIDEO_IMX8_ISI_M2M) += imx8-isi-m2m.o
+
+obj-$(CONFIG_VIDEO_IMX8_ISI) += imx8-isi.o
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
new file mode 100644
index 000000000000..629ccdd98a62
--- /dev/null
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -0,0 +1,645 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2019-2020 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/sys_soc.h>
+#include <linux/types.h>
+
+#include <media/media-device.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mc.h>
+
+#include "imx8-isi-core.h"
+
+/* -----------------------------------------------------------------------------
+ * V4L2 async subdevs
+ */
+
+struct mxc_isi_async_subdev {
+	struct v4l2_async_subdev asd;
+	unsigned int port;
+};
+
+static inline struct mxc_isi_async_subdev *
+asd_to_mxc_isi_async_subdev(struct v4l2_async_subdev *asd)
+{
+	return container_of(asd, struct mxc_isi_async_subdev, asd);
+};
+
+static inline struct mxc_isi_dev *
+notifier_to_mxc_isi_dev(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct mxc_isi_dev, notifier);
+};
+
+static int mxc_isi_async_notifier_bound(struct v4l2_async_notifier *notifier,
+					struct v4l2_subdev *sd,
+					struct v4l2_async_subdev *asd)
+{
+	const unsigned int link_flags = MEDIA_LNK_FL_IMMUTABLE
+				      | MEDIA_LNK_FL_ENABLED;
+	struct mxc_isi_dev *isi = notifier_to_mxc_isi_dev(notifier);
+	struct mxc_isi_async_subdev *masd = asd_to_mxc_isi_async_subdev(asd);
+	struct media_pad *pad = &isi->crossbar.pads[masd->port];
+	struct device_link *link;
+
+	dev_dbg(isi->dev, "Bound subdev %s to crossbar input %u\n", sd->name,
+		masd->port);
+
+	/*
+	 * Enforce suspend/resume ordering between the source (supplier) and
+	 * the ISI (consumer). The source will be suspended before and resume
+	 * after the ISI.
+	 */
+	link = device_link_add(isi->dev, sd->dev, DL_FLAG_STATELESS);
+	if (!link) {
+		dev_err(isi->dev,
+			"Failed to create device link to source %s\n", sd->name);
+		return -EINVAL;
+	}
+
+	return v4l2_create_fwnode_links_to_pad(sd, pad, link_flags);
+}
+
+static int mxc_isi_async_notifier_complete(struct v4l2_async_notifier *notifier)
+{
+	struct mxc_isi_dev *isi = notifier_to_mxc_isi_dev(notifier);
+	int ret;
+
+	dev_dbg(isi->dev, "All subdevs bound\n");
+
+	ret = v4l2_device_register_subdev_nodes(&isi->v4l2_dev);
+	if (ret < 0) {
+		dev_err(isi->dev,
+			"Failed to register subdev nodes: %d\n", ret);
+		return ret;
+	}
+
+	return media_device_register(&isi->media_dev);
+}
+
+static const struct v4l2_async_notifier_operations mxc_isi_async_notifier_ops = {
+	.bound = mxc_isi_async_notifier_bound,
+	.complete = mxc_isi_async_notifier_complete,
+};
+
+static int mxc_isi_pipe_register(struct mxc_isi_pipe *pipe)
+{
+	int ret;
+
+	ret = v4l2_device_register_subdev(&pipe->isi->v4l2_dev, &pipe->sd);
+	if (ret < 0)
+		return ret;
+
+	return mxc_isi_video_register(pipe, &pipe->isi->v4l2_dev);
+}
+
+static void mxc_isi_pipe_unregister(struct mxc_isi_pipe *pipe)
+{
+	mxc_isi_video_unregister(pipe);
+}
+
+static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
+{
+	struct fwnode_handle *node = dev_fwnode(isi->dev);
+	struct media_device *media_dev = &isi->media_dev;
+	struct v4l2_device *v4l2_dev = &isi->v4l2_dev;
+	unsigned int i;
+	int ret;
+
+	/* Initialize the media device. */
+	strscpy(media_dev->model, "FSL Capture Media Device",
+		sizeof(media_dev->model));
+	media_dev->dev = isi->dev;
+
+	media_device_init(media_dev);
+
+	/* Initialize and register the V4L2 device. */
+	v4l2_dev->mdev = media_dev;
+	strscpy(v4l2_dev->name, "mx8-img-md", sizeof(v4l2_dev->name));
+
+	ret = v4l2_device_register(isi->dev, v4l2_dev);
+	if (ret < 0) {
+		dev_err(isi->dev,
+			"Failed to register V4L2 device: %d\n", ret);
+		goto err_media;
+	}
+
+	/* Register the crossbar switch subdev. */
+	ret = mxc_isi_crossbar_register(&isi->crossbar);
+	if (ret < 0) {
+		dev_err(isi->dev, "Failed to register crossbar: %d\n", ret);
+		goto err_v4l2;
+	}
+
+	/* Register the pipeline subdevs and link them to the crossbar switch. */
+	for (i = 0; i < isi->pdata->num_channels; ++i) {
+		struct mxc_isi_pipe *pipe = &isi->pipes[i];
+
+		ret = mxc_isi_pipe_register(pipe);
+		if (ret < 0) {
+			dev_err(isi->dev, "Failed to register pipe%u: %d\n", i,
+				ret);
+			goto err_v4l2;
+		}
+
+		ret = media_create_pad_link(&isi->crossbar.sd.entity,
+					    isi->crossbar.num_sinks + i,
+					    &pipe->sd.entity,
+					    MXC_ISI_PIPE_PAD_SINK,
+					    MEDIA_LNK_FL_IMMUTABLE |
+					    MEDIA_LNK_FL_ENABLED);
+		if (ret < 0)
+			goto err_v4l2;
+	}
+
+	/* Register the M2M device. */
+	ret = mxc_isi_m2m_register(isi, v4l2_dev);
+	if (ret < 0) {
+		dev_err(isi->dev, "Failed to register M2M device: %d\n", ret);
+		goto err_v4l2;
+	}
+
+	/* Initialize, fill and register the async notifier. */
+	v4l2_async_nf_init(&isi->notifier);
+	isi->notifier.ops = &mxc_isi_async_notifier_ops;
+
+	for (i = 0; i < isi->pdata->num_ports; ++i) {
+		struct mxc_isi_async_subdev *masd;
+		struct fwnode_handle *ep;
+
+		ep = fwnode_graph_get_endpoint_by_id(node, i, 0,
+						     FWNODE_GRAPH_ENDPOINT_NEXT);
+
+		if (!ep)
+			continue;
+
+		masd = v4l2_async_nf_add_fwnode_remote(&isi->notifier, ep,
+						       struct mxc_isi_async_subdev);
+		fwnode_handle_put(ep);
+
+		if (IS_ERR(masd)) {
+			ret = PTR_ERR(masd);
+			goto err_m2m;
+		}
+
+		masd->port = i;
+	}
+
+	ret = v4l2_async_nf_register(v4l2_dev, &isi->notifier);
+	if (ret < 0) {
+		dev_err(isi->dev,
+			"Failed to register async notifier: %d\n", ret);
+		goto err_m2m;
+	}
+
+	return 0;
+
+err_m2m:
+	mxc_isi_m2m_unregister(isi);
+	v4l2_async_nf_cleanup(&isi->notifier);
+err_v4l2:
+	v4l2_device_unregister(v4l2_dev);
+err_media:
+	media_device_cleanup(media_dev);
+	return ret;
+}
+
+static void mxc_isi_v4l2_cleanup(struct mxc_isi_dev *isi)
+{
+	unsigned int i;
+
+	v4l2_async_nf_unregister(&isi->notifier);
+	v4l2_async_nf_cleanup(&isi->notifier);
+
+	v4l2_device_unregister(&isi->v4l2_dev);
+	media_device_unregister(&isi->media_dev);
+
+	mxc_isi_m2m_unregister(isi);
+
+	for (i = 0; i < isi->pdata->num_channels; ++i)
+		mxc_isi_pipe_unregister(&isi->pipes[i]);
+
+	mxc_isi_crossbar_unregister(&isi->crossbar);
+
+	media_device_cleanup(&isi->media_dev);
+}
+
+/* -----------------------------------------------------------------------------
+ * Device information
+ */
+
+/* For i.MX8QM/QXP B0 ISI IER version */
+static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v0 = {
+	.oflw_y_buf_en = { .offset = 16, .mask = 0x10000  },
+	.oflw_u_buf_en = { .offset = 19, .mask = 0x80000  },
+	.oflw_v_buf_en = { .offset = 22, .mask = 0x400000 },
+
+	.excs_oflw_y_buf_en = { .offset = 17, .mask = 0x20000  },
+	.excs_oflw_u_buf_en = { .offset = 20, .mask = 0x100000 },
+	.excs_oflw_v_buf_en = { .offset = 23, .mask = 0x800000 },
+
+	.panic_y_buf_en = {.offset = 18, .mask = 0x40000   },
+	.panic_u_buf_en = {.offset = 21, .mask = 0x200000  },
+	.panic_v_buf_en = {.offset = 24, .mask = 0x1000000 },
+};
+
+/* Panic will assert when the buffers are 50% full */
+static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v0 = {
+	.panic_set_thd_y = { .mask = 0x03, .offset = 0, .threshold = 0x2 },
+	.panic_set_thd_u = { .mask = 0x18, .offset = 3, .threshold = 0x2 },
+	.panic_set_thd_v = { .mask = 0xc0, .offset = 6, .threshold = 0x2 },
+};
+
+/* For i.MX8QXP C0 and i.MX8MN ISI IER version */
+static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v1 = {
+	.oflw_y_buf_en = { .offset = 19, .mask = 0x80000  },
+	.oflw_u_buf_en = { .offset = 21, .mask = 0x200000 },
+	.oflw_v_buf_en = { .offset = 23, .mask = 0x800000 },
+
+	.panic_y_buf_en = {.offset = 20, .mask = 0x100000  },
+	.panic_u_buf_en = {.offset = 22, .mask = 0x400000  },
+	.panic_v_buf_en = {.offset = 24, .mask = 0x1000000 },
+};
+
+/* For i.MX8MP ISI IER version */
+static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v2 = {
+	.oflw_y_buf_en = { .offset = 18, .mask = 0x40000  },
+	.oflw_u_buf_en = { .offset = 20, .mask = 0x100000 },
+	.oflw_v_buf_en = { .offset = 22, .mask = 0x400000 },
+
+	.panic_y_buf_en = {.offset = 19, .mask = 0x80000  },
+	.panic_u_buf_en = {.offset = 21, .mask = 0x200000 },
+	.panic_v_buf_en = {.offset = 23, .mask = 0x800000 },
+};
+
+/* Panic will assert when the buffers are 50% full */
+static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
+	.panic_set_thd_y = { .mask = 0x0000f, .offset = 0,  .threshold = 0x7 },
+	.panic_set_thd_u = { .mask = 0x00f00, .offset = 8,  .threshold = 0x7 },
+	.panic_set_thd_v = { .mask = 0xf0000, .offset = 16, .threshold = 0x7 },
+};
+
+static const struct clk_bulk_data mxc_imx8_clks[] = {
+	{ .id = NULL },
+};
+
+/* Chip C0 */
+static const struct mxc_isi_plat_data mxc_imx8_data_v0 = {
+	.model			= MXC_ISI_IMX8,
+	.num_ports		= 5,
+	.num_channels		= 8,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v0,
+	.set_thd		= &mxc_imx8_isi_thd_v0,
+	.clks			= mxc_imx8_clks,
+	.num_clks		= ARRAY_SIZE(mxc_imx8_clks),
+	.buf_active_reverse	= false,
+	.has_gasket		= false,
+	.has_36bit_dma		= false,
+};
+
+static const struct mxc_isi_plat_data mxc_imx8_data_v1 = {
+	.model			= MXC_ISI_IMX8,
+	.num_ports		= 5,
+	.num_channels		= 8,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v1,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.clks			= mxc_imx8_clks,
+	.num_clks		= ARRAY_SIZE(mxc_imx8_clks),
+	.buf_active_reverse	= true,
+	.has_gasket		= false,
+	.has_36bit_dma		= false,
+};
+
+static const struct clk_bulk_data mxc_imx8mn_clks[] = {
+	{ .id = "axi" },
+	{ .id = "apb" },
+};
+
+static const struct mxc_isi_plat_data mxc_imx8mn_data = {
+	.model			= MXC_ISI_IMX8MN,
+	.num_ports		= 1,
+	.num_channels		= 1,
+	.reg_offset		= 0,
+	.ier_reg		= &mxc_imx8_isi_ier_v1,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.clks			= mxc_imx8mn_clks,
+	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
+	.buf_active_reverse	= false,
+	.has_gasket		= true,
+	.has_36bit_dma		= false,
+};
+
+static const struct mxc_isi_plat_data mxc_imx8mp_data = {
+	.model			= MXC_ISI_IMX8MP,
+	.num_ports		= 2,
+	.num_channels		= 2,
+	.reg_offset		= 0x2000,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.clks			= mxc_imx8mn_clks,
+	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
+	.buf_active_reverse	= true,
+	.has_gasket		= true,
+	.has_36bit_dma		= true,
+};
+
+static const struct soc_device_attribute imx8_soc[] = {
+	{
+		.soc_id   = "i.MX8QXP",
+		.revision = "1.0",
+		.data     = &mxc_imx8_data_v0,
+	}, {
+		.soc_id   = "i.MX8QXP",
+		.revision = "1.1",
+		.data     = &mxc_imx8_data_v0,
+	}, {
+		.soc_id   = "i.MX8QXP",
+		.revision = "1.2",
+	}, {
+		.soc_id   = "i.MX8QM",
+		.revision = "1.0",
+		.data     = &mxc_imx8_data_v0,
+	}, {
+		.soc_id   = "i.MX8QM",
+		.revision = "1.1",
+		.data     = &mxc_imx8_data_v0,
+	}, {
+		.soc_id   = "i.MX8MN",
+		.revision = "1.0",
+	}, {
+		.soc_id   = "i.MX8MP",
+	}, {
+		/* sentinel */
+	}
+};
+
+static int mxc_isi_get_platform_data(struct mxc_isi_dev *isi)
+
+{
+	const struct soc_device_attribute *match;
+
+	isi->pdata = of_device_get_match_data(isi->dev);
+
+	match = soc_device_match(imx8_soc);
+	if (!match)
+		return -EINVAL;
+
+	if (match->data)
+		isi->pdata = match->data;
+
+	return 0;
+}
+
+/* -----------------------------------------------------------------------------
+ * Power management
+ */
+
+static int mxc_isi_pm_suspend(struct device *dev)
+{
+	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
+	unsigned int i;
+
+	for (i = 0; i < isi->pdata->num_channels; ++i) {
+		struct mxc_isi_pipe *pipe = &isi->pipes[i];
+
+		mxc_isi_video_suspend(pipe);
+	}
+
+	return pm_runtime_force_suspend(dev);
+}
+
+static int mxc_isi_pm_resume(struct device *dev)
+{
+	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
+	unsigned int i;
+	int err = 0;
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < isi->pdata->num_channels; ++i) {
+		struct mxc_isi_pipe *pipe = &isi->pipes[i];
+
+		ret = mxc_isi_video_resume(pipe);
+		if (ret) {
+			dev_err(dev, "Failed to resume pipeline %u (%d)\n", i,
+				ret);
+			/*
+			 * Record the last error as it's as meaningful as any,
+			 * and continue resuming the other pipelines.
+			 */
+			err = ret;
+		}
+	}
+
+	return err;
+}
+
+static int mxc_isi_runtime_suspend(struct device *dev)
+{
+	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(isi->pdata->num_clks, isi->clks);
+
+	return 0;
+}
+
+static int mxc_isi_runtime_resume(struct device *dev)
+{
+	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(isi->pdata->num_clks, isi->clks);
+	if (ret) {
+		dev_err(dev, "Failed to enable clocks (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops mxc_isi_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(mxc_isi_pm_suspend, mxc_isi_pm_resume)
+	SET_RUNTIME_PM_OPS(mxc_isi_runtime_suspend, mxc_isi_runtime_resume, NULL)
+};
+
+/* -----------------------------------------------------------------------------
+ * Probe, remove & driver
+ */
+
+static int mxc_isi_clk_get(struct mxc_isi_dev *isi)
+{
+	unsigned int size = isi->pdata->num_clks
+			  * sizeof(*isi->clks);
+	int ret;
+
+	isi->clks = devm_kmalloc(isi->dev, size, GFP_KERNEL);
+	if (!isi->clks)
+		return -ENOMEM;
+
+	memcpy(isi->clks, isi->pdata->clks, size);
+
+	ret = devm_clk_bulk_get(isi->dev, isi->pdata->num_clks,
+				isi->clks);
+	if (ret < 0) {
+		dev_err(isi->dev, "Failed to acquire clocks: %d\n",
+			ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mxc_isi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mxc_isi_dev *isi;
+	unsigned int dma_size;
+	unsigned int i;
+	int ret = 0;
+
+	isi = devm_kzalloc(dev, sizeof(*isi), GFP_KERNEL);
+	if (!isi)
+		return -ENOMEM;
+
+	isi->dev = dev;
+	platform_set_drvdata(pdev, isi);
+
+	ret = mxc_isi_get_platform_data(isi);
+	if (ret < 0) {
+		dev_err(dev, "Can't get platform device data\n");
+		return ret;
+	}
+
+	isi->pipes = kcalloc(isi->pdata->num_channels, sizeof(isi->pipes[0]),
+			     GFP_KERNEL);
+	if (!isi->pipes)
+		return -ENOMEM;
+
+	ret = mxc_isi_clk_get(isi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to get clocks\n");
+		return ret;
+	}
+
+	isi->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(isi->regs)) {
+		dev_err(dev, "Failed to get ISI register map\n");
+		return PTR_ERR(isi->regs);
+	}
+
+	if (isi->pdata->has_gasket) {
+		isi->gasket = syscon_regmap_lookup_by_phandle(dev->of_node,
+							      "fsl,blk-ctrl");
+		if (IS_ERR(isi->gasket)) {
+			ret = PTR_ERR(isi->gasket);
+			dev_err(dev, "failed to get gasket: %d\n", ret);
+			return ret;
+		}
+	}
+
+	dma_size = isi->pdata->has_36bit_dma ? 36 : 32;
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_size));
+	if (ret) {
+		dev_err(dev, "failed to set DMA mask\n");
+		return ret;
+	}
+
+	pm_runtime_enable(dev);
+
+	ret = mxc_isi_crossbar_init(isi);
+	if (ret) {
+		dev_err(dev, "Failed to initialize crossbar: %d\n", ret);
+		goto err_pm;
+	}
+
+	for (i = 0; i < isi->pdata->num_channels; ++i) {
+		ret = mxc_isi_pipe_init(isi, i);
+		if (ret < 0) {
+			dev_err(dev, "Failed to initialize pipe%u: %d\n", i,
+				ret);
+			goto err_xbar;
+		}
+	}
+
+	ret = mxc_isi_v4l2_init(isi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize V4L2: %d\n", ret);
+		goto err_xbar;
+	}
+
+	mxc_isi_debug_init(isi);
+
+	return 0;
+
+err_xbar:
+	mxc_isi_crossbar_cleanup(&isi->crossbar);
+err_pm:
+	pm_runtime_disable(isi->dev);
+	return ret;
+}
+
+static int mxc_isi_remove(struct platform_device *pdev)
+{
+	struct mxc_isi_dev *isi = platform_get_drvdata(pdev);
+	unsigned int i;
+
+	mxc_isi_debug_cleanup(isi);
+
+	for (i = 0; i < isi->pdata->num_channels; ++i) {
+		struct mxc_isi_pipe *pipe = &isi->pipes[i];
+
+		mxc_isi_pipe_cleanup(pipe);
+	}
+
+	mxc_isi_crossbar_cleanup(&isi->crossbar);
+	mxc_isi_v4l2_cleanup(isi);
+
+	pm_runtime_disable(isi->dev);
+
+	return 0;
+}
+
+static const struct of_device_id mxc_isi_of_match[] = {
+	{ .compatible = "fsl,imx8-isi", .data = &mxc_imx8_data_v1 },
+	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
+	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
+
+static struct platform_driver mxc_isi_driver = {
+	.probe		= mxc_isi_probe,
+	.remove		= mxc_isi_remove,
+	.driver = {
+		.of_match_table = mxc_isi_of_match,
+		.name		= MXC_ISI_DRIVER_NAME,
+		.pm		= &mxc_isi_pm_ops,
+	}
+};
+module_platform_driver(mxc_isi_driver);
+
+MODULE_ALIAS("ISI");
+MODULE_AUTHOR("Freescale Semiconductor, Inc.");
+MODULE_DESCRIPTION("IMX8 Image Sensing Interface driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
new file mode 100644
index 000000000000..a6b1ce5bd106
--- /dev/null
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -0,0 +1,395 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * V4L2 Capture ISI subdev for i.MX8QXP/QM platform
+ *
+ * ISI is a Image Sensor Interface of i.MX8QXP/QM platform, which
+ * used to process image from camera sensor to memory or DC
+ * Copyright 2019-2020 NXP
+ */
+
+#ifndef __MXC_ISI_CORE_H__
+#define __MXC_ISI_CORE_H__
+
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+#include <linux/videodev2.h>
+
+#include <media/media-device.h>
+#include <media/media-entity.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-v4l2.h>
+
+struct clk_bulk_data;
+struct dentry;
+struct device;
+struct media_intf_devnode;
+struct regmap;
+struct v4l2_m2m_dev;
+
+/* Pipeline pads */
+#define MXC_ISI_PIPE_PAD_SINK		0
+#define MXC_ISI_PIPE_PAD_SOURCE		1
+#define MXC_ISI_PIPE_PADS_NUM		2
+
+#define MXC_ISI_MIN_WIDTH		1U
+#define MXC_ISI_MIN_HEIGHT		1U
+#define MXC_ISI_MAX_WIDTH_UNCHAINED	2048U
+#define MXC_ISI_MAX_WIDTH_CHAINED	4096U
+#define MXC_ISI_MAX_HEIGHT		8191U
+
+#define MXC_ISI_DEF_WIDTH		1920U
+#define MXC_ISI_DEF_HEIGHT		1080U
+#define MXC_ISI_DEF_MBUS_CODE_SINK	MEDIA_BUS_FMT_UYVY8_1X16
+#define MXC_ISI_DEF_MBUS_CODE_SOURCE	MEDIA_BUS_FMT_YUV8_1X24
+#define MXC_ISI_DEF_PIXEL_FORMAT	V4L2_PIX_FMT_YUYV
+#define MXC_ISI_DEF_COLOR_SPACE		V4L2_COLORSPACE_SRGB
+#define MXC_ISI_DEF_YCBCR_ENC		V4L2_YCBCR_ENC_601
+#define MXC_ISI_DEF_QUANTIZATION	V4L2_QUANTIZATION_LIM_RANGE
+#define MXC_ISI_DEF_XFER_FUNC		V4L2_XFER_FUNC_SRGB
+
+#define MXC_ISI_DRIVER_NAME		"mxc-isi"
+#define MXC_ISI_CAPTURE			"mxc-isi-cap"
+#define MXC_ISI_M2M			"mxc-isi-m2m"
+#define MXC_MAX_PLANES			3
+
+struct mxc_isi_dev;
+struct mxc_isi_m2m_ctx;
+
+enum mxc_isi_buf_id {
+	MXC_ISI_BUF1 = 0x0,
+	MXC_ISI_BUF2,
+};
+
+enum mxc_isi_encoding {
+	MXC_ISI_ENC_RAW,
+	MXC_ISI_ENC_RGB,
+	MXC_ISI_ENC_YUV,
+};
+
+enum mxc_isi_input_id {
+	/* Inputs from the crossbar switch range from 0 to 15 */
+	MXC_ISI_INPUT_MEM = 16,
+};
+
+enum mxc_isi_video_type {
+	MXC_ISI_VIDEO_CAP = BIT(0),
+	MXC_ISI_VIDEO_M2M_OUT = BIT(1),
+	MXC_ISI_VIDEO_M2M_CAP = BIT(2),
+};
+
+struct mxc_isi_format_info {
+	u32	mbus_code;
+	u32	fourcc;
+	enum mxc_isi_video_type type;
+	u32	isi_in_format;
+	u32	isi_out_format;
+	u8	mem_planes;
+	u8	color_planes;
+	u8	depth[MXC_MAX_PLANES];
+	u8	hsub;
+	u8	vsub;
+	enum mxc_isi_encoding encoding;
+};
+
+struct mxc_isi_bus_format_info {
+	u32	mbus_code;
+	u32	output;
+	u32	pads;
+	enum mxc_isi_encoding encoding;
+};
+
+struct mxc_isi_buffer {
+	struct vb2_v4l2_buffer  v4l2_buf;
+	struct list_head	list;
+	dma_addr_t		dma_addrs[3];
+	enum mxc_isi_buf_id	id;
+	bool discard;
+};
+
+struct mxc_isi_reg {
+	u32 offset;
+	u32 mask;
+};
+
+struct mxc_isi_ier_reg {
+	/* Overflow Y/U/V trigger enable*/
+	struct mxc_isi_reg oflw_y_buf_en;
+	struct mxc_isi_reg oflw_u_buf_en;
+	struct mxc_isi_reg oflw_v_buf_en;
+
+	/* Excess overflow Y/U/V trigger enable*/
+	struct mxc_isi_reg excs_oflw_y_buf_en;
+	struct mxc_isi_reg excs_oflw_u_buf_en;
+	struct mxc_isi_reg excs_oflw_v_buf_en;
+
+	/* Panic Y/U/V trigger enable*/
+	struct mxc_isi_reg panic_y_buf_en;
+	struct mxc_isi_reg panic_v_buf_en;
+	struct mxc_isi_reg panic_u_buf_en;
+};
+
+struct mxc_isi_panic_thd {
+	u32 mask;
+	u32 offset;
+	u32 threshold;
+};
+
+struct mxc_isi_set_thd {
+	struct mxc_isi_panic_thd panic_set_thd_y;
+	struct mxc_isi_panic_thd panic_set_thd_u;
+	struct mxc_isi_panic_thd panic_set_thd_v;
+};
+
+enum model {
+	MXC_ISI_IMX8,
+	MXC_ISI_IMX8MN,
+	MXC_ISI_IMX8MP,
+};
+
+struct mxc_isi_plat_data {
+	enum model model;
+	unsigned int num_ports;
+	unsigned int num_channels;
+	unsigned int reg_offset;
+	const struct mxc_isi_ier_reg  *ier_reg;
+	const struct mxc_isi_set_thd *set_thd;
+	const struct clk_bulk_data *clks;
+	unsigned int num_clks;
+	bool buf_active_reverse;
+	bool has_gasket;
+	bool has_36bit_dma;
+};
+
+struct mxc_isi_dma_buffer {
+	size_t				size;
+	void				*addr;
+	dma_addr_t			dma;
+};
+
+struct mxc_isi_input {
+	unsigned int			enable_count;
+};
+
+struct mxc_isi_crossbar {
+	struct mxc_isi_dev		*isi;
+
+	unsigned int			num_sinks;
+	unsigned int			num_sources;
+	struct mxc_isi_input		*inputs;
+
+	struct v4l2_subdev		sd;
+	struct media_pad		*pads;
+};
+
+struct mxc_isi_video {
+	struct mxc_isi_pipe		*pipe;
+
+	struct video_device		vdev;
+	struct media_pad		pad;
+
+	/* Protects is_streaming, and the vdev and vb2_q operations */
+	struct mutex			lock;
+	bool				is_streaming;
+
+	struct v4l2_pix_format_mplane	pix;
+	const struct mxc_isi_format_info *fmtinfo;
+
+	struct {
+		struct v4l2_ctrl_handler handler;
+		unsigned int		alpha;
+		bool			hflip;
+		bool			vflip;
+	} ctrls;
+
+	struct vb2_queue		vb2_q;
+	struct mxc_isi_buffer		buf_discard[3];
+	struct list_head		out_pending;
+	struct list_head		out_active;
+	struct list_head		out_discard;
+	u32				frame_count;
+	/* Protects out_pending, out_active, out_discard and frame_count */
+	spinlock_t			buf_lock;
+
+	struct mxc_isi_dma_buffer	discard_buffer[MXC_MAX_PLANES];
+};
+
+typedef void(*mxc_isi_pipe_irq_t)(struct mxc_isi_pipe *, u32);
+
+struct mxc_isi_pipe {
+	struct mxc_isi_dev		*isi;
+	u32				id;
+	void __iomem			*regs;
+
+	struct media_pipeline		pipe;
+
+	struct v4l2_subdev		sd;
+	struct media_pad		pads[MXC_ISI_PIPE_PADS_NUM];
+
+	struct mxc_isi_video		video;
+
+	/*
+	 * Protects use_count, irq_handler, res_available, res_acquired,
+	 * chained_res, and the CHNL_CTRL register.
+	 */
+	struct mutex			lock;
+	unsigned int			use_count;
+	mxc_isi_pipe_irq_t		irq_handler;
+
+#define MXC_ISI_CHANNEL_RES_LINE_BUF	BIT(0)
+#define MXC_ISI_CHANNEL_RES_OUTPUT_BUF	BIT(1)
+	u8				available_res;
+	u8				acquired_res;
+	u8				chained_res;
+	bool				chained;
+};
+
+struct mxc_isi_m2m {
+	struct mxc_isi_dev		*isi;
+	struct mxc_isi_pipe		*pipe;
+
+	struct media_pad		pad;
+	struct video_device		vdev;
+	struct media_intf_devnode	*intf;
+	struct v4l2_m2m_dev		*m2m_dev;
+
+	/* Protects last_ctx, usage_count and chained_count */
+	struct mutex			lock;
+
+	struct mxc_isi_m2m_ctx		*last_ctx;
+	int				usage_count;
+	int				chained_count;
+};
+
+struct mxc_isi_dev {
+	struct device			*dev;
+
+	const struct mxc_isi_plat_data	*pdata;
+
+	void __iomem			*regs;
+	struct clk_bulk_data		*clks;
+	struct regmap			*gasket;
+
+	struct mxc_isi_crossbar		crossbar;
+	struct mxc_isi_pipe		*pipes;
+	struct mxc_isi_m2m		m2m;
+
+	struct media_device		media_dev;
+	struct v4l2_device		v4l2_dev;
+	struct v4l2_async_notifier	notifier;
+
+	struct dentry			*debugfs_root;
+};
+
+int mxc_isi_crossbar_init(struct mxc_isi_dev *isi);
+void mxc_isi_crossbar_cleanup(struct mxc_isi_crossbar *xbar);
+int mxc_isi_crossbar_register(struct mxc_isi_crossbar *xbar);
+void mxc_isi_crossbar_unregister(struct mxc_isi_crossbar *xbar);
+
+const struct mxc_isi_bus_format_info *
+mxc_isi_bus_format_by_code(u32 code, unsigned int pad);
+const struct mxc_isi_bus_format_info *
+mxc_isi_bus_format_by_index(unsigned int index, unsigned int pad);
+const struct mxc_isi_format_info *
+mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type);
+const struct mxc_isi_format_info *
+mxc_isi_format_enum(unsigned int index, enum mxc_isi_video_type type);
+const struct mxc_isi_format_info *
+mxc_isi_format_try(struct mxc_isi_pipe *pipe, struct v4l2_pix_format_mplane *pix,
+		   enum mxc_isi_video_type type);
+
+int mxc_isi_pipe_init(struct mxc_isi_dev *isi, unsigned int id);
+void mxc_isi_pipe_cleanup(struct mxc_isi_pipe *pipe);
+int mxc_isi_pipe_acquire(struct mxc_isi_pipe *pipe,
+			 mxc_isi_pipe_irq_t irq_handler);
+void mxc_isi_pipe_release(struct mxc_isi_pipe *pipe);
+int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe);
+void mxc_isi_pipe_disable(struct mxc_isi_pipe *pipe);
+
+int mxc_isi_video_register(struct mxc_isi_pipe *pipe,
+			   struct v4l2_device *v4l2_dev);
+void mxc_isi_video_unregister(struct mxc_isi_pipe *pipe);
+void mxc_isi_video_suspend(struct mxc_isi_pipe *pipe);
+int mxc_isi_video_resume(struct mxc_isi_pipe *pipe);
+int mxc_isi_video_queue_setup(const struct v4l2_pix_format_mplane *format,
+			      const struct mxc_isi_format_info *info,
+			      unsigned int *num_buffers,
+			      unsigned int *num_planes, unsigned int sizes[]);
+void mxc_isi_video_buffer_init(struct vb2_buffer *vb2, dma_addr_t dma_addrs[3],
+			       const struct mxc_isi_format_info *info,
+			       const struct v4l2_pix_format_mplane *pix);
+int mxc_isi_video_buffer_prepare(struct mxc_isi_dev *isi, struct vb2_buffer *vb2,
+				 const struct mxc_isi_format_info *info,
+				 const struct v4l2_pix_format_mplane *pix);
+
+#ifdef CONFIG_VIDEO_IMX8_ISI_M2M
+int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struct v4l2_device *v4l2_dev);
+int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi);
+#else
+static inline int mxc_isi_m2m_register(struct mxc_isi_dev *isi,
+				       struct v4l2_device *v4l2_dev)
+{
+	return 0;
+}
+static inline int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi)
+{
+	return 0;
+}
+#endif
+
+int mxc_isi_channel_acquire(struct mxc_isi_pipe *pipe,
+			    mxc_isi_pipe_irq_t irq_handler, bool bypass);
+void mxc_isi_channel_release(struct mxc_isi_pipe *pipe);
+void mxc_isi_channel_get(struct mxc_isi_pipe *pipe);
+void mxc_isi_channel_put(struct mxc_isi_pipe *pipe);
+void mxc_isi_channel_enable(struct mxc_isi_pipe *pipe);
+void mxc_isi_channel_disable(struct mxc_isi_pipe *pipe);
+int mxc_isi_channel_chain(struct mxc_isi_pipe *pipe, bool bypass);
+void mxc_isi_channel_unchain(struct mxc_isi_pipe *pipe);
+
+void mxc_isi_channel_config(struct mxc_isi_pipe *pipe,
+			    enum mxc_isi_input_id input,
+			    const struct v4l2_area *in_size,
+			    const struct v4l2_area *scale,
+			    const struct v4l2_rect *crop,
+			    enum mxc_isi_encoding in_encoding,
+			    enum mxc_isi_encoding out_encoding);
+
+void mxc_isi_channel_set_input_format(struct mxc_isi_pipe *pipe,
+				      const struct mxc_isi_format_info *info,
+				      const struct v4l2_pix_format_mplane *format);
+void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
+				       const struct mxc_isi_format_info *info,
+				       struct v4l2_pix_format_mplane *format);
+void mxc_isi_channel_m2m_start(struct mxc_isi_pipe *pipe);
+
+void mxc_isi_channel_set_alpha(struct mxc_isi_pipe *pipe, u8 alpha);
+void mxc_isi_channel_set_flip(struct mxc_isi_pipe *pipe, bool hflip, bool vflip);
+
+void mxc_isi_channel_set_inbuf(struct mxc_isi_pipe *pipe, dma_addr_t dma_addr);
+void mxc_isi_channel_set_outbuf(struct mxc_isi_pipe *pipe,
+				const dma_addr_t dma_addrs[3],
+				enum mxc_isi_buf_id buf_id);
+
+u32 mxc_isi_channel_irq_status(struct mxc_isi_pipe *pipe, bool clear);
+void mxc_isi_channel_irq_clear(struct mxc_isi_pipe *pipe);
+
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+void mxc_isi_debug_init(struct mxc_isi_dev *isi);
+void mxc_isi_debug_cleanup(struct mxc_isi_dev *isi);
+#else
+static inline void mxc_isi_debug_init(struct mxc_isi_dev *isi)
+{
+}
+static inline void mxc_isi_debug_cleanup(struct mxc_isi_dev *isi)
+{
+}
+#endif
+
+#endif /* __MXC_ISI_CORE_H__ */
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
new file mode 100644
index 000000000000..b5ffde46f31b
--- /dev/null
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -0,0 +1,529 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * i.MX8 ISI - Input crossbar switch
+ *
+ * Copyright (c) 2022 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/minmax.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#include <media/media-entity.h>
+#include <media/mipi-csi2.h>
+#include <media/v4l2-subdev.h>
+
+#include "imx8-isi-core.h"
+
+static inline struct mxc_isi_crossbar *to_isi_crossbar(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct mxc_isi_crossbar, sd);
+}
+
+/* -----------------------------------------------------------------------------
+ * Media block control (i.MX8MN and i.MX8MP only)
+ */
+#define GASKET_BASE(n)				(0x0060 + (n) * 0x30)
+
+#define GASKET_CTRL				0x0000
+#define GASKET_CTRL_DATA_TYPE(dt)		((dt) << 8)
+#define GASKET_CTRL_DATA_TYPE_MASK		(0x3f << 8)
+#define GASKET_CTRL_DUAL_COMP_ENABLE		BIT(1)
+#define GASKET_CTRL_ENABLE			BIT(0)
+
+#define GASKET_HSIZE				0x0004
+#define GASKET_VSIZE				0x0008
+
+static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
+					  struct v4l2_subdev_state *state,
+					  struct v4l2_subdev *remote_sd,
+					  u32 remote_pad, unsigned int port)
+{
+	struct mxc_isi_dev *isi = xbar->isi;
+	const struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_mbus_frame_desc fd;
+	u32 val;
+	int ret;
+
+	if (!isi->pdata->has_gasket)
+		return 0;
+
+	/*
+	 * Configure and enable the gasket with the frame size and CSI-2 data
+	 * type. For YUV422 8-bit, enable dual component mode unconditionally,
+	 * to match the configuration of the CSIS.
+	 */
+
+	ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc, remote_pad, &fd);
+	if (ret) {
+		dev_err(isi->dev,
+			"failed to get frame descriptor from '%s':%u: %d\n",
+			remote_sd->name, remote_pad, ret);
+		return ret;
+	}
+
+	if (fd.num_entries != 1) {
+		dev_err(isi->dev, "invalid frame descriptor for '%s':%u\n",
+			remote_sd->name, remote_pad);
+		return -EINVAL;
+	}
+
+	fmt = v4l2_subdev_state_get_stream_format(state, port, 0);
+	if (!fmt)
+		return -EINVAL;
+
+	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_HSIZE, fmt->width);
+	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_VSIZE, fmt->height);
+
+	val = GASKET_CTRL_DATA_TYPE(fd.entry[0].bus.csi2.dt)
+	    | GASKET_CTRL_ENABLE;
+
+	if (fd.entry[0].bus.csi2.dt == MIPI_CSI2_DT_YUV422_8B)
+		val |= GASKET_CTRL_DUAL_COMP_ENABLE;
+
+	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, val);
+
+	return 0;
+}
+
+static void mxc_isi_crossbar_gasket_disable(struct mxc_isi_crossbar *xbar,
+					    unsigned int port)
+{
+	struct mxc_isi_dev *isi = xbar->isi;
+
+	if (!isi->pdata->has_gasket)
+		return;
+
+	regmap_write(isi->gasket, GASKET_BASE(port) + GASKET_CTRL, 0);
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 subdev operations
+ */
+
+static const struct v4l2_mbus_framefmt mxc_isi_crossbar_default_format = {
+	.code = MXC_ISI_DEF_MBUS_CODE_SINK,
+	.width = MXC_ISI_DEF_WIDTH,
+	.height = MXC_ISI_DEF_HEIGHT,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = MXC_ISI_DEF_COLOR_SPACE,
+	.ycbcr_enc = MXC_ISI_DEF_YCBCR_ENC,
+	.quantization = MXC_ISI_DEF_QUANTIZATION,
+	.xfer_func = MXC_ISI_DEF_XFER_FUNC,
+};
+
+static int __mxc_isi_crossbar_set_routing(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *state,
+					  struct v4l2_subdev_krouting *routing)
+{
+	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
+	struct v4l2_subdev_route *route;
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_NO_N_TO_1);
+	if (ret)
+		return ret;
+
+	/* The memory input can be routed to the first pipeline only. */
+	for_each_active_route(&state->routing, route) {
+		if (route->sink_pad == xbar->num_sinks - 1 &&
+		    route->source_pad != xbar->num_sinks) {
+			dev_dbg(xbar->isi->dev,
+				"invalid route from memory input (%u) to pipe %u\n",
+				route->sink_pad,
+				route->source_pad - xbar->num_sinks);
+			return -EINVAL;
+		}
+	}
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, routing,
+						&mxc_isi_crossbar_default_format);
+}
+
+static struct v4l2_subdev *
+mxc_isi_crossbar_xlate_streams(struct mxc_isi_crossbar *xbar,
+			       struct v4l2_subdev_state *state,
+			       u32 source_pad, u64 source_streams,
+			       u32 *__sink_pad, u64 *__sink_streams,
+			       u32 *remote_pad)
+{
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev *sd;
+	struct media_pad *pad;
+	u64 sink_streams = 0;
+	int sink_pad = -1;
+
+	/*
+	 * Translate the source pad and streams to the sink side. The routing
+	 * validation forbids stream merging, so all matching entries in the
+	 * routing table are guaranteed to have the same sink pad.
+	 *
+	 * TODO: This is likely worth a helper function, it could perhaps be
+	 * supported by v4l2_subdev_state_xlate_streams() with pad1 set to -1.
+	 */
+	for_each_active_route(&state->routing, route) {
+		if (route->source_pad != source_pad ||
+		    !(source_streams & BIT(route->source_stream)))
+			continue;
+
+		sink_streams |= BIT(route->sink_stream);
+		sink_pad = route->sink_pad;
+	}
+
+	if (sink_pad < 0) {
+		dev_dbg(xbar->isi->dev,
+			"no stream connected to pipeline %u\n",
+			source_pad - xbar->num_sinks);
+		return ERR_PTR(-EPIPE);
+	}
+
+	pad = media_pad_remote_pad_first(&xbar->pads[sink_pad]);
+	sd = media_entity_to_v4l2_subdev(pad->entity);
+
+	if (!sd) {
+		dev_dbg(xbar->isi->dev,
+			"no entity connected to crossbar input %u\n",
+			sink_pad);
+		return ERR_PTR(-EPIPE);
+	}
+
+	*__sink_pad = sink_pad;
+	*__sink_streams = sink_streams;
+	*remote_pad = pad->index;
+
+	return sd;
+}
+
+static int mxc_isi_crossbar_init_cfg(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state)
+{
+	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
+	struct v4l2_subdev_krouting routing = { };
+	struct v4l2_subdev_route *routes;
+	unsigned int i;
+	int ret;
+
+	/*
+	 * Create a 1:1 mapping between pixel link inputs and outputs to
+	 * pipelines by default.
+	 */
+	routes = kcalloc(xbar->num_sources, sizeof(*routes), GFP_KERNEL);
+	if (!routes)
+		return -ENOMEM;
+
+	for (i = 0; i < xbar->num_sources; ++i) {
+		struct v4l2_subdev_route *route = &routes[i];
+
+		route->sink_pad = i;
+		route->source_pad = i + xbar->num_sinks;
+		route->flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
+	};
+
+	routing.num_routes = xbar->num_sources;
+	routing.routes = routes;
+
+	ret = __mxc_isi_crossbar_set_routing(sd, state, &routing);
+
+	kfree(routes);
+
+	return ret;
+}
+
+static int mxc_isi_crossbar_enum_mbus_code(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_state *state,
+					   struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
+	const struct mxc_isi_bus_format_info *info;
+
+	if (code->pad >= xbar->num_sinks) {
+		const struct v4l2_mbus_framefmt *format;
+
+		/*
+		 * The media bus code on source pads is identical to the
+		 * connected sink pad.
+		 */
+		if (code->index > 0)
+			return -EINVAL;
+
+		format = v4l2_subdev_state_get_opposite_stream_format(state,
+								      code->pad,
+								      code->stream);
+		if (!format)
+			return -EINVAL;
+
+		code->code = format->code;
+
+		return 0;
+	}
+
+	info = mxc_isi_bus_format_by_index(code->index, MXC_ISI_PIPE_PAD_SINK);
+	if (!info)
+		return -EINVAL;
+
+	code->code = info->mbus_code;
+
+	return 0;
+}
+
+static int mxc_isi_crossbar_set_fmt(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_format *fmt)
+{
+	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_subdev_route *route;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    media_pad_is_streaming(&xbar->pads[fmt->pad]))
+		return -EBUSY;
+
+	/*
+	 * The source pad format is always identical to the sink pad format and
+	 * can't be modified.
+	 */
+	if (fmt->pad >= xbar->num_sinks)
+		return v4l2_subdev_get_fmt(sd, state, fmt);
+
+	/* Validate the requested format. */
+	if (!mxc_isi_bus_format_by_code(fmt->format.code, MXC_ISI_PIPE_PAD_SINK))
+		fmt->format.code = MXC_ISI_DEF_MBUS_CODE_SINK;
+
+	fmt->format.width = clamp_t(unsigned int, fmt->format.width,
+				    MXC_ISI_MIN_WIDTH, MXC_ISI_MAX_WIDTH_CHAINED);
+	fmt->format.height = clamp_t(unsigned int, fmt->format.height,
+				     MXC_ISI_MIN_HEIGHT, MXC_ISI_MAX_HEIGHT);
+	fmt->format.field = V4L2_FIELD_NONE;
+
+	/*
+	 * Set the format on the sink stream and propagate it to the source
+	 * streams.
+	 */
+	sink_fmt = v4l2_subdev_state_get_stream_format(state, fmt->pad,
+						       fmt->stream);
+	if (!sink_fmt)
+		return -EINVAL;
+
+	*sink_fmt = fmt->format;
+
+	/* TODO: A format propagation helper would be useful. */
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_framefmt *source_fmt;
+
+		if (route->sink_pad != fmt->pad ||
+		    route->sink_stream != fmt->stream)
+			continue;
+
+		source_fmt = v4l2_subdev_state_get_stream_format(state, route->source_pad,
+								 route->source_stream);
+		if (!source_fmt)
+			return -EINVAL;
+
+		*source_fmt = fmt->format;
+	}
+
+	return 0;
+}
+
+static int mxc_isi_crossbar_set_routing(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					enum v4l2_subdev_format_whence which,
+					struct v4l2_subdev_krouting *routing)
+{
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    media_entity_is_streaming(&sd->entity))
+		return -EBUSY;
+
+	return __mxc_isi_crossbar_set_routing(sd, state, routing);
+}
+
+static int mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_state *state,
+					   u32 pad, u64 streams_mask)
+{
+	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
+	struct v4l2_subdev *remote_sd;
+	struct mxc_isi_input *input;
+	u64 sink_streams;
+	u32 sink_pad;
+	u32 remote_pad;
+	int ret;
+
+	remote_sd = mxc_isi_crossbar_xlate_streams(xbar, state, pad, streams_mask,
+						   &sink_pad, &sink_streams,
+						   &remote_pad);
+	if (IS_ERR(remote_sd))
+		return PTR_ERR(remote_sd);
+
+	input = &xbar->inputs[sink_pad];
+
+	/*
+	 * TODO: Track per-stream enable counts to support multiplexed
+	 * streams.
+	 */
+	if (!input->enable_count) {
+		ret = mxc_isi_crossbar_gasket_enable(xbar, state, remote_sd,
+						     remote_pad, sink_pad);
+		if (ret)
+			return ret;
+
+		ret = v4l2_subdev_enable_streams(remote_sd, remote_pad,
+						 sink_streams);
+		if (ret) {
+			dev_err(xbar->isi->dev,
+				"failed to %s streams 0x%llx on '%s':%u: %d\n",
+				"enable", sink_streams, remote_sd->name,
+				remote_pad, ret);
+			mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
+			return ret;
+		}
+	}
+
+	input->enable_count++;
+
+	return 0;
+}
+
+static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
+					    struct v4l2_subdev_state *state,
+					    u32 pad, u64 streams_mask)
+{
+	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
+	struct v4l2_subdev *remote_sd;
+	struct mxc_isi_input *input;
+	u64 sink_streams;
+	u32 sink_pad;
+	u32 remote_pad;
+	int ret = 0;
+
+	remote_sd = mxc_isi_crossbar_xlate_streams(xbar, state, pad, streams_mask,
+						   &sink_pad, &sink_streams,
+						   &remote_pad);
+	if (IS_ERR(remote_sd))
+		return PTR_ERR(remote_sd);
+
+	input = &xbar->inputs[sink_pad];
+
+	input->enable_count--;
+
+	if (!input->enable_count) {
+		ret = v4l2_subdev_disable_streams(remote_sd, remote_pad,
+						  sink_streams);
+		if (ret)
+			dev_err(xbar->isi->dev,
+				"failed to %s streams 0x%llx on '%s':%u: %d\n",
+				"disable", sink_streams, remote_sd->name,
+				remote_pad, ret);
+
+		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
+	}
+
+	return ret;
+}
+
+static const struct v4l2_subdev_pad_ops mxc_isi_crossbar_subdev_pad_ops = {
+	.init_cfg = mxc_isi_crossbar_init_cfg,
+	.enum_mbus_code = mxc_isi_crossbar_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = mxc_isi_crossbar_set_fmt,
+	.set_routing = mxc_isi_crossbar_set_routing,
+	.enable_streams = mxc_isi_crossbar_enable_streams,
+	.disable_streams = mxc_isi_crossbar_disable_streams,
+};
+
+static const struct v4l2_subdev_ops mxc_isi_crossbar_subdev_ops = {
+	.pad = &mxc_isi_crossbar_subdev_pad_ops,
+};
+
+static const struct media_entity_operations mxc_isi_cross_entity_ops = {
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
+	.link_validate	= v4l2_subdev_link_validate,
+	.has_pad_interdep = v4l2_subdev_has_pad_interdep,
+};
+
+/* -----------------------------------------------------------------------------
+ * Init & cleanup
+ */
+
+int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
+{
+	struct mxc_isi_crossbar *xbar = &isi->crossbar;
+	struct v4l2_subdev *sd = &xbar->sd;
+	unsigned int num_pads;
+	unsigned int i;
+	int ret;
+
+	xbar->isi = isi;
+
+	v4l2_subdev_init(sd, &mxc_isi_crossbar_subdev_ops);
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
+	strscpy(sd->name, "crossbar", sizeof(sd->name));
+	sd->dev = isi->dev;
+
+	sd->entity.function = MEDIA_ENT_F_VID_MUX;
+	sd->entity.ops = &mxc_isi_cross_entity_ops;
+
+	/*
+	 * The subdev has one sink and one source per port, plus one sink for
+	 * the memory input.
+	 */
+	xbar->num_sinks = isi->pdata->num_ports + 1;
+	xbar->num_sources = isi->pdata->num_ports;
+	num_pads = xbar->num_sinks + xbar->num_sources;
+
+	xbar->pads = kcalloc(num_pads, sizeof(*xbar->pads), GFP_KERNEL);
+	if (!xbar->pads)
+		return -ENOMEM;
+
+	xbar->inputs = kcalloc(xbar->num_sinks, sizeof(*xbar->inputs),
+			       GFP_KERNEL);
+	if (!xbar->pads) {
+		ret = -ENOMEM;
+		goto err_free;
+	}
+
+	for (i = 0; i < xbar->num_sinks; ++i)
+		xbar->pads[i].flags = MEDIA_PAD_FL_SINK;
+	for (i = 0; i < xbar->num_sources; ++i)
+		xbar->pads[i + xbar->num_sinks].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&sd->entity, num_pads, xbar->pads);
+	if (ret)
+		goto err_free;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret < 0)
+		goto err_entity;
+
+	return 0;
+
+err_entity:
+	media_entity_cleanup(&sd->entity);
+err_free:
+	kfree(xbar->pads);
+	kfree(xbar->inputs);
+
+	return ret;
+}
+
+void mxc_isi_crossbar_cleanup(struct mxc_isi_crossbar *xbar)
+{
+	media_entity_cleanup(&xbar->sd.entity);
+	kfree(xbar->pads);
+	kfree(xbar->inputs);
+}
+
+int mxc_isi_crossbar_register(struct mxc_isi_crossbar *xbar)
+{
+	return v4l2_device_register_subdev(&xbar->isi->v4l2_dev, &xbar->sd);
+}
+
+void mxc_isi_crossbar_unregister(struct mxc_isi_crossbar *xbar)
+{
+}
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
new file mode 100644
index 000000000000..6709ab7ea1f3
--- /dev/null
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-debug.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2019-2020 NXP
+ */
+
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/pm_runtime.h>
+#include <linux/seq_file.h>
+#include <linux/types.h>
+
+#include "imx8-isi-core.h"
+#include "imx8-isi-regs.h"
+
+static inline u32 mxc_isi_read(struct mxc_isi_pipe *pipe, u32 reg)
+{
+	return readl(pipe->regs + reg);
+}
+
+static int mxc_isi_debug_dump_regs_show(struct seq_file *m, void *p)
+{
+#define MXC_ISI_DEBUG_REG(name)		{ name, #name }
+	static const struct {
+		u32 offset;
+		const char * const name;
+	} registers[] = {
+		MXC_ISI_DEBUG_REG(CHNL_CTRL),
+		MXC_ISI_DEBUG_REG(CHNL_IMG_CTRL),
+		MXC_ISI_DEBUG_REG(CHNL_OUT_BUF_CTRL),
+		MXC_ISI_DEBUG_REG(CHNL_IMG_CFG),
+		MXC_ISI_DEBUG_REG(CHNL_IER),
+		MXC_ISI_DEBUG_REG(CHNL_STS),
+		MXC_ISI_DEBUG_REG(CHNL_SCALE_FACTOR),
+		MXC_ISI_DEBUG_REG(CHNL_SCALE_OFFSET),
+		MXC_ISI_DEBUG_REG(CHNL_CROP_ULC),
+		MXC_ISI_DEBUG_REG(CHNL_CROP_LRC),
+		MXC_ISI_DEBUG_REG(CHNL_CSC_COEFF0),
+		MXC_ISI_DEBUG_REG(CHNL_CSC_COEFF1),
+		MXC_ISI_DEBUG_REG(CHNL_CSC_COEFF2),
+		MXC_ISI_DEBUG_REG(CHNL_CSC_COEFF3),
+		MXC_ISI_DEBUG_REG(CHNL_CSC_COEFF4),
+		MXC_ISI_DEBUG_REG(CHNL_CSC_COEFF5),
+		MXC_ISI_DEBUG_REG(CHNL_ROI_0_ALPHA),
+		MXC_ISI_DEBUG_REG(CHNL_ROI_0_ULC),
+		MXC_ISI_DEBUG_REG(CHNL_ROI_0_LRC),
+		MXC_ISI_DEBUG_REG(CHNL_ROI_1_ALPHA),
+		MXC_ISI_DEBUG_REG(CHNL_ROI_1_ULC),
+		MXC_ISI_DEBUG_REG(CHNL_ROI_1_LRC),
+		MXC_ISI_DEBUG_REG(CHNL_ROI_2_ALPHA),
+		MXC_ISI_DEBUG_REG(CHNL_ROI_2_ULC),
+		MXC_ISI_DEBUG_REG(CHNL_ROI_2_LRC),
+		MXC_ISI_DEBUG_REG(CHNL_ROI_3_ALPHA),
+		MXC_ISI_DEBUG_REG(CHNL_ROI_3_ULC),
+		MXC_ISI_DEBUG_REG(CHNL_ROI_3_LRC),
+		MXC_ISI_DEBUG_REG(CHNL_OUT_BUF1_ADDR_Y),
+		MXC_ISI_DEBUG_REG(CHNL_OUT_BUF1_ADDR_U),
+		MXC_ISI_DEBUG_REG(CHNL_OUT_BUF1_ADDR_V),
+		MXC_ISI_DEBUG_REG(CHNL_OUT_BUF_PITCH),
+		MXC_ISI_DEBUG_REG(CHNL_IN_BUF_ADDR),
+		MXC_ISI_DEBUG_REG(CHNL_IN_BUF_PITCH),
+		MXC_ISI_DEBUG_REG(CHNL_MEM_RD_CTRL),
+		MXC_ISI_DEBUG_REG(CHNL_OUT_BUF2_ADDR_Y),
+		MXC_ISI_DEBUG_REG(CHNL_OUT_BUF2_ADDR_U),
+		MXC_ISI_DEBUG_REG(CHNL_OUT_BUF2_ADDR_V),
+		MXC_ISI_DEBUG_REG(CHNL_SCL_IMG_CFG),
+		MXC_ISI_DEBUG_REG(CHNL_FLOW_CTRL),
+	};
+
+	struct mxc_isi_pipe *pipe = m->private;
+	unsigned int i;
+
+	if (!pm_runtime_get_if_in_use(pipe->isi->dev))
+		return 0;
+
+	seq_printf(m, "--- ISI pipe %u registers ---\n", pipe->id);
+
+	for (i = 0; i < ARRAY_SIZE(registers); ++i)
+		seq_printf(m, "%20s[0x%02x]: 0x%08x\n",
+			   registers[i].name, registers[i].offset,
+			   mxc_isi_read(pipe, registers[i].offset));
+
+	pm_runtime_put(pipe->isi->dev);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(mxc_isi_debug_dump_regs);
+
+void mxc_isi_debug_init(struct mxc_isi_dev *isi)
+{
+	unsigned int i;
+
+	isi->debugfs_root = debugfs_create_dir(dev_name(isi->dev), NULL);
+
+	for (i = 0; i < isi->pdata->num_channels; ++i) {
+		struct mxc_isi_pipe *pipe = &isi->pipes[i];
+		char name[8];
+
+		sprintf(name, "pipe%u", pipe->id);
+		debugfs_create_file(name, 0444, isi->debugfs_root, pipe,
+				    &mxc_isi_debug_dump_regs_fops);
+	}
+}
+
+void mxc_isi_debug_cleanup(struct mxc_isi_dev *isi)
+{
+	debugfs_remove_recursive(isi->debugfs_root);
+}
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
new file mode 100644
index 000000000000..eddc7fc36337
--- /dev/null
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -0,0 +1,651 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2019-2020 NXP
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/types.h>
+
+#include "imx8-isi-core.h"
+#include "imx8-isi-regs.h"
+
+#define	ISI_DOWNSCALE_THRESHOLD		0x4000
+
+static inline u32 mxc_isi_read(struct mxc_isi_pipe *pipe, u32 reg)
+{
+	return readl(pipe->regs + reg);
+}
+
+static inline void mxc_isi_write(struct mxc_isi_pipe *pipe, u32 reg, u32 val)
+{
+	writel(val, pipe->regs + reg);
+}
+
+/* -----------------------------------------------------------------------------
+ * Buffers & M2M operation
+ */
+
+void mxc_isi_channel_set_inbuf(struct mxc_isi_pipe *pipe, dma_addr_t dma_addr)
+{
+	mxc_isi_write(pipe, CHNL_IN_BUF_ADDR, dma_addr);
+#if CONFIG_ARCH_DMA_ADDR_T_64BIT
+	if (pipe->isi->pdata->has_36bit_dma)
+		mxc_isi_write(pipe, CHNL_IN_BUF_XTND_ADDR, dma_addr >> 32);
+#endif
+}
+
+void mxc_isi_channel_set_outbuf(struct mxc_isi_pipe *pipe,
+				const dma_addr_t dma_addrs[3],
+				enum mxc_isi_buf_id buf_id)
+{
+	int val;
+
+	val = mxc_isi_read(pipe, CHNL_OUT_BUF_CTRL);
+
+	if (buf_id == MXC_ISI_BUF1) {
+		mxc_isi_write(pipe, CHNL_OUT_BUF1_ADDR_Y, dma_addrs[0]);
+		mxc_isi_write(pipe, CHNL_OUT_BUF1_ADDR_U, dma_addrs[1]);
+		mxc_isi_write(pipe, CHNL_OUT_BUF1_ADDR_V, dma_addrs[2]);
+#if CONFIG_ARCH_DMA_ADDR_T_64BIT
+		if (pipe->isi->pdata->has_36bit_dma) {
+			mxc_isi_write(pipe, CHNL_Y_BUF1_XTND_ADDR,
+				      dma_addrs[0] >> 32);
+			mxc_isi_write(pipe, CHNL_U_BUF1_XTND_ADDR,
+				      dma_addrs[1] >> 32);
+			mxc_isi_write(pipe, CHNL_V_BUF1_XTND_ADDR,
+				      dma_addrs[2] >> 32);
+		}
+#endif
+		val ^= CHNL_OUT_BUF_CTRL_LOAD_BUF1_ADDR;
+	} else  {
+		mxc_isi_write(pipe, CHNL_OUT_BUF2_ADDR_Y, dma_addrs[0]);
+		mxc_isi_write(pipe, CHNL_OUT_BUF2_ADDR_U, dma_addrs[1]);
+		mxc_isi_write(pipe, CHNL_OUT_BUF2_ADDR_V, dma_addrs[2]);
+#if CONFIG_ARCH_DMA_ADDR_T_64BIT
+		if (pipe->isi->pdata->has_36bit_dma) {
+			mxc_isi_write(pipe, CHNL_Y_BUF2_XTND_ADDR,
+				      dma_addrs[0] >> 32);
+			mxc_isi_write(pipe, CHNL_U_BUF2_XTND_ADDR,
+				      dma_addrs[1] >> 32);
+			mxc_isi_write(pipe, CHNL_V_BUF2_XTND_ADDR,
+				      dma_addrs[2] >> 32);
+		}
+#endif
+		val ^= CHNL_OUT_BUF_CTRL_LOAD_BUF2_ADDR;
+	}
+
+	mxc_isi_write(pipe, CHNL_OUT_BUF_CTRL, val);
+}
+
+void mxc_isi_channel_m2m_start(struct mxc_isi_pipe *pipe)
+{
+	u32 val;
+
+	val = mxc_isi_read(pipe, CHNL_MEM_RD_CTRL);
+	val &= ~CHNL_MEM_RD_CTRL_READ_MEM;
+	mxc_isi_write(pipe, CHNL_MEM_RD_CTRL, val);
+	udelay(300);
+
+	val |= CHNL_MEM_RD_CTRL_READ_MEM;
+	mxc_isi_write(pipe, CHNL_MEM_RD_CTRL, val);
+}
+
+/* -----------------------------------------------------------------------------
+ * Pipeline configuration
+ */
+
+static u32 mxc_isi_channel_scaling_ratio(unsigned int from, unsigned int to,
+					 u32 *dec)
+{
+	unsigned int ratio = from / to;
+
+	if (ratio < 2)
+		*dec = 1;
+	else if (ratio < 4)
+		*dec = 2;
+	else if (ratio < 8)
+		*dec = 4;
+	else
+		*dec = 8;
+
+	return min_t(u32, from * 0x1000 / (to * *dec), ISI_DOWNSCALE_THRESHOLD);
+}
+
+static void mxc_isi_channel_set_scaling(struct mxc_isi_pipe *pipe,
+					enum mxc_isi_encoding encoding,
+					const struct v4l2_area *in_size,
+					const struct v4l2_area *out_size,
+					bool *bypass)
+{
+	u32 xscale, yscale;
+	u32 decx, decy;
+	u32 val;
+
+	dev_dbg(pipe->isi->dev, "input %ux%u, output %ux%u\n",
+		in_size->width, in_size->height,
+		out_size->width, out_size->height);
+
+	xscale = mxc_isi_channel_scaling_ratio(in_size->width, out_size->width,
+					       &decx);
+	yscale = mxc_isi_channel_scaling_ratio(in_size->height, out_size->height,
+					       &decy);
+
+	val = mxc_isi_read(pipe, CHNL_IMG_CTRL);
+	val &= ~(CHNL_IMG_CTRL_DEC_X_MASK | CHNL_IMG_CTRL_DEC_Y_MASK |
+		 CHNL_IMG_CTRL_YCBCR_MODE);
+
+	val |= CHNL_IMG_CTRL_DEC_X(ilog2(decx))
+	    |  CHNL_IMG_CTRL_DEC_Y(ilog2(decy));
+
+	/*
+	 * Contrary to what the documentation states, YCBCR_MODE does not
+	 * control conversion between YCbCr and RGB, but whether the scaler
+	 * operates in YUV mode or in RGB mode. It must be set when the scaler
+	 * input is YUV.
+	 */
+	if (encoding == MXC_ISI_ENC_YUV)
+		val |= CHNL_IMG_CTRL_YCBCR_MODE;
+
+	mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
+
+	mxc_isi_write(pipe, CHNL_SCALE_FACTOR,
+		      CHNL_SCALE_FACTOR_Y_SCALE(yscale) |
+		      CHNL_SCALE_FACTOR_X_SCALE(xscale));
+
+	mxc_isi_write(pipe, CHNL_SCALE_OFFSET, 0);
+
+	mxc_isi_write(pipe, CHNL_SCL_IMG_CFG,
+		      CHNL_SCL_IMG_CFG_HEIGHT(out_size->height) |
+		      CHNL_SCL_IMG_CFG_WIDTH(out_size->width));
+
+	*bypass = in_size->height == out_size->height &&
+		  in_size->width == out_size->width;
+}
+
+static void mxc_isi_channel_set_crop(struct mxc_isi_pipe *pipe,
+				     const struct v4l2_area *src,
+				     const struct v4l2_rect *dst)
+{
+	u32 val, val0, val1;
+
+	val = mxc_isi_read(pipe, CHNL_IMG_CTRL);
+	val &= ~CHNL_IMG_CTRL_CROP_EN;
+
+	if (src->height == dst->height && src->width == dst->width) {
+		mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
+		return;
+	}
+
+	val |= CHNL_IMG_CTRL_CROP_EN;
+	val0 = CHNL_CROP_ULC_X(dst->left) | CHNL_CROP_ULC_Y(dst->top);
+	val1 = CHNL_CROP_LRC_X(dst->width) | CHNL_CROP_LRC_Y(dst->height);
+
+	mxc_isi_write(pipe, CHNL_CROP_ULC, val0);
+	mxc_isi_write(pipe, CHNL_CROP_LRC, val1 + val0);
+	mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
+}
+
+/*
+ * A2,A1,      B1, A3,     B3, B2,
+ * C2, C1,     D1, C3,     D3, D2
+ */
+static const u32 mxc_isi_yuv2rgb_coeffs[6] = {
+	/* YUV -> RGB */
+	0x0000012a, 0x012a0198, 0x0730079c,
+	0x0204012a, 0x01f00000, 0x01800180
+};
+
+static const u32 mxc_isi_rgb2yuv_coeffs[6] = {
+	/* RGB->YUV */
+	0x00810041, 0x07db0019, 0x007007b6,
+	0x07a20070, 0x001007ee, 0x00800080
+};
+
+static void mxc_isi_channel_set_csc(struct mxc_isi_pipe *pipe,
+				    enum mxc_isi_encoding in_encoding,
+				    enum mxc_isi_encoding out_encoding,
+				    bool *bypass)
+{
+	static const char * const encodings[] = {
+		[MXC_ISI_ENC_RAW] = "RAW",
+		[MXC_ISI_ENC_RGB] = "RGB",
+		[MXC_ISI_ENC_YUV] = "YUV",
+	};
+	const u32 *coeffs;
+	bool cscen = true;
+	u32 val;
+
+	val = mxc_isi_read(pipe, CHNL_IMG_CTRL);
+	val &= ~(CHNL_IMG_CTRL_CSC_BYPASS | CHNL_IMG_CTRL_CSC_MODE_MASK);
+
+	if (in_encoding == MXC_ISI_ENC_YUV &&
+	    out_encoding == MXC_ISI_ENC_RGB) {
+		/* YUV2RGB */
+		coeffs = mxc_isi_yuv2rgb_coeffs;
+		/* YCbCr enable???  */
+		val |= CHNL_IMG_CTRL_CSC_MODE(CHNL_IMG_CTRL_CSC_MODE_YCBCR2RGB);
+	} else if (in_encoding == MXC_ISI_ENC_RGB &&
+		   out_encoding == MXC_ISI_ENC_YUV) {
+		/* RGB2YUV */
+		coeffs = mxc_isi_rgb2yuv_coeffs;
+		val |= CHNL_IMG_CTRL_CSC_MODE(CHNL_IMG_CTRL_CSC_MODE_RGB2YCBCR);
+	} else {
+		/* Bypass CSC */
+		cscen = false;
+		val |= CHNL_IMG_CTRL_CSC_BYPASS;
+	}
+
+	dev_dbg(pipe->isi->dev, "CSC: %s -> %s\n",
+		encodings[in_encoding], encodings[out_encoding]);
+
+	if (cscen) {
+		mxc_isi_write(pipe, CHNL_CSC_COEFF0, coeffs[0]);
+		mxc_isi_write(pipe, CHNL_CSC_COEFF1, coeffs[1]);
+		mxc_isi_write(pipe, CHNL_CSC_COEFF2, coeffs[2]);
+		mxc_isi_write(pipe, CHNL_CSC_COEFF3, coeffs[3]);
+		mxc_isi_write(pipe, CHNL_CSC_COEFF4, coeffs[4]);
+		mxc_isi_write(pipe, CHNL_CSC_COEFF5, coeffs[5]);
+	}
+
+	mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
+
+	*bypass = !cscen;
+}
+
+void mxc_isi_channel_set_alpha(struct mxc_isi_pipe *pipe, u8 alpha)
+{
+	u32 val;
+
+	val = mxc_isi_read(pipe, CHNL_IMG_CTRL);
+	val &= ~CHNL_IMG_CTRL_GBL_ALPHA_VAL_MASK;
+	val |= CHNL_IMG_CTRL_GBL_ALPHA_VAL(alpha) |
+	       CHNL_IMG_CTRL_GBL_ALPHA_EN;
+	mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
+}
+
+void mxc_isi_channel_set_flip(struct mxc_isi_pipe *pipe, bool hflip, bool vflip)
+{
+	u32 val;
+
+	val = mxc_isi_read(pipe, CHNL_IMG_CTRL);
+	val &= ~(CHNL_IMG_CTRL_VFLIP_EN | CHNL_IMG_CTRL_HFLIP_EN);
+
+	if (vflip)
+		val |= CHNL_IMG_CTRL_VFLIP_EN;
+	if (hflip)
+		val |= CHNL_IMG_CTRL_HFLIP_EN;
+
+	mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
+}
+
+static void mxc_isi_channel_set_panic_threshold(struct mxc_isi_pipe *pipe)
+{
+	const struct mxc_isi_set_thd *set_thd = pipe->isi->pdata->set_thd;
+	u32 val;
+
+	val = mxc_isi_read(pipe, CHNL_OUT_BUF_CTRL);
+
+	val &= ~(set_thd->panic_set_thd_y.mask);
+	val |= set_thd->panic_set_thd_y.threshold << set_thd->panic_set_thd_y.offset;
+
+	val &= ~(set_thd->panic_set_thd_u.mask);
+	val |= set_thd->panic_set_thd_u.threshold << set_thd->panic_set_thd_u.offset;
+
+	val &= ~(set_thd->panic_set_thd_v.mask);
+	val |= set_thd->panic_set_thd_v.threshold << set_thd->panic_set_thd_v.offset;
+
+	mxc_isi_write(pipe, CHNL_OUT_BUF_CTRL, val);
+}
+
+static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
+					enum mxc_isi_input_id input,
+					bool bypass)
+{
+	u32 val;
+
+	mutex_lock(&pipe->lock);
+
+	val = mxc_isi_read(pipe, CHNL_CTRL);
+	val &= ~(CHNL_CTRL_CHNL_BYPASS | CHNL_CTRL_CHAIN_BUF_MASK |
+		 CHNL_CTRL_BLANK_PXL_MASK | CHNL_CTRL_SRC_TYPE_MASK |
+		 CHNL_CTRL_MIPI_VC_ID_MASK | CHNL_CTRL_SRC_INPUT_MASK);
+
+	/*
+	 * If no scaling or color space conversion is needed, bypass the
+	 * channel.
+	 */
+	if (bypass)
+		val |= CHNL_CTRL_CHNL_BYPASS;
+
+	/* Chain line buffers if needed. */
+	if (pipe->chained)
+		val |= CHNL_CTRL_CHAIN_BUF(CHNL_CTRL_CHAIN_BUF_2_CHAIN);
+
+	val |= CHNL_CTRL_BLANK_PXL(0xff);
+
+	/* Input source (including VC configuration for CSI-2) */
+	if (input == MXC_ISI_INPUT_MEM) {
+		/*
+		 * The memory input is connected to the last port of the
+		 * crossbar switch, after all pixel link inputs. The SRC_INPUT
+		 * field controls the input selection and must be set
+		 * accordingly, despite being documented as ignored when using
+		 * the memory input in the i.MX8MP reference manual, and
+		 * reserved in the i.MX8MN reference manual.
+		 */
+		val |= CHNL_CTRL_SRC_TYPE(CHNL_CTRL_SRC_TYPE_MEMORY);
+		val |= CHNL_CTRL_SRC_INPUT(pipe->isi->pdata->num_ports);
+	} else {
+		val |= CHNL_CTRL_SRC_TYPE(CHNL_CTRL_SRC_TYPE_DEVICE);
+		val |= CHNL_CTRL_SRC_INPUT(input);
+		val |= CHNL_CTRL_MIPI_VC_ID(0); /* FIXME: For CSI-2 only */
+	}
+
+	mxc_isi_write(pipe, CHNL_CTRL, val);
+
+	mutex_unlock(&pipe->lock);
+}
+
+void mxc_isi_channel_config(struct mxc_isi_pipe *pipe,
+			    enum mxc_isi_input_id input,
+			    const struct v4l2_area *in_size,
+			    const struct v4l2_area *scale,
+			    const struct v4l2_rect *crop,
+			    enum mxc_isi_encoding in_encoding,
+			    enum mxc_isi_encoding out_encoding)
+{
+	bool csc_bypass;
+	bool scaler_bypass;
+
+	/* Input frame size */
+	mxc_isi_write(pipe, CHNL_IMG_CFG,
+		      CHNL_IMG_CFG_HEIGHT(in_size->height) |
+		      CHNL_IMG_CFG_WIDTH(in_size->width));
+
+	/* Scaling */
+	mxc_isi_channel_set_scaling(pipe, in_encoding, in_size, scale,
+				    &scaler_bypass);
+	mxc_isi_channel_set_crop(pipe, scale, crop);
+
+	/* CSC */
+	mxc_isi_channel_set_csc(pipe, in_encoding, out_encoding, &csc_bypass);
+
+	/* Output buffer management */
+	mxc_isi_channel_set_panic_threshold(pipe);
+
+	/* Channel control */
+	mxc_isi_channel_set_control(pipe, input, csc_bypass && scaler_bypass);
+}
+
+void mxc_isi_channel_set_input_format(struct mxc_isi_pipe *pipe,
+				      const struct mxc_isi_format_info *info,
+				      const struct v4l2_pix_format_mplane *format)
+{
+	unsigned int bpl = format->plane_fmt[0].bytesperline;
+
+	mxc_isi_write(pipe, CHNL_MEM_RD_CTRL,
+		      CHNL_MEM_RD_CTRL_IMG_TYPE(info->isi_in_format));
+	mxc_isi_write(pipe, CHNL_IN_BUF_PITCH,
+		      CHNL_IN_BUF_PITCH_LINE_PITCH(bpl));
+}
+
+void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
+				       const struct mxc_isi_format_info *info,
+				       struct v4l2_pix_format_mplane *format)
+{
+	u32 val;
+
+	/* set outbuf format */
+	dev_dbg(pipe->isi->dev, "output format %p4cc", &format->pixelformat);
+
+	val = mxc_isi_read(pipe, CHNL_IMG_CTRL);
+	val &= ~CHNL_IMG_CTRL_FORMAT_MASK;
+	val |= CHNL_IMG_CTRL_FORMAT(info->isi_out_format);
+	mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
+
+	/* line pitch */
+	mxc_isi_write(pipe, CHNL_OUT_BUF_PITCH,
+		      format->plane_fmt[0].bytesperline);
+}
+
+/* -----------------------------------------------------------------------------
+ * IRQ
+ */
+
+u32 mxc_isi_channel_irq_status(struct mxc_isi_pipe *pipe, bool clear)
+{
+	u32 status;
+
+	status = mxc_isi_read(pipe, CHNL_STS);
+	if (clear)
+		mxc_isi_write(pipe, CHNL_STS, status);
+
+	return status;
+}
+
+void mxc_isi_channel_irq_clear(struct mxc_isi_pipe *pipe)
+{
+	mxc_isi_write(pipe, CHNL_STS, 0xffffffff);
+}
+
+static void mxc_isi_channel_irq_enable(struct mxc_isi_pipe *pipe)
+{
+	const struct mxc_isi_ier_reg *ier_reg = pipe->isi->pdata->ier_reg;
+	u32 val;
+
+	val = CHNL_IER_FRM_RCVD_EN |
+		CHNL_IER_AXI_WR_ERR_U_EN |
+		CHNL_IER_AXI_WR_ERR_V_EN |
+		CHNL_IER_AXI_WR_ERR_Y_EN;
+
+	/* Y/U/V overflow enable */
+	val |= ier_reg->oflw_y_buf_en.mask |
+	       ier_reg->oflw_u_buf_en.mask |
+	       ier_reg->oflw_v_buf_en.mask;
+
+	/* Y/U/V excess overflow enable */
+	val |= ier_reg->excs_oflw_y_buf_en.mask |
+	       ier_reg->excs_oflw_u_buf_en.mask |
+	       ier_reg->excs_oflw_v_buf_en.mask;
+
+	/* Y/U/V panic enable */
+	val |= ier_reg->panic_y_buf_en.mask |
+	       ier_reg->panic_u_buf_en.mask |
+	       ier_reg->panic_v_buf_en.mask;
+
+	mxc_isi_channel_irq_clear(pipe);
+	mxc_isi_write(pipe, CHNL_IER, val);
+}
+
+static void mxc_isi_channel_irq_disable(struct mxc_isi_pipe *pipe)
+{
+	mxc_isi_write(pipe, CHNL_IER, 0);
+}
+
+/* -----------------------------------------------------------------------------
+ * Init, deinit, enable, disable
+ */
+
+static void mxc_isi_channel_sw_reset(struct mxc_isi_pipe *pipe, bool enable_clk)
+{
+	mxc_isi_write(pipe, CHNL_CTRL, CHNL_CTRL_SW_RST);
+	mdelay(5);
+	mxc_isi_write(pipe, CHNL_CTRL, enable_clk ? CHNL_CTRL_CLK_EN : 0);
+}
+
+static void __mxc_isi_channel_get(struct mxc_isi_pipe *pipe)
+{
+	if (!pipe->use_count++)
+		mxc_isi_channel_sw_reset(pipe, true);
+}
+
+void mxc_isi_channel_get(struct mxc_isi_pipe *pipe)
+{
+	mutex_lock(&pipe->lock);
+	__mxc_isi_channel_get(pipe);
+	mutex_unlock(&pipe->lock);
+}
+
+static void __mxc_isi_channel_put(struct mxc_isi_pipe *pipe)
+{
+	if (!--pipe->use_count)
+		mxc_isi_channel_sw_reset(pipe, false);
+}
+
+void mxc_isi_channel_put(struct mxc_isi_pipe *pipe)
+{
+	mutex_lock(&pipe->lock);
+	__mxc_isi_channel_put(pipe);
+	mutex_unlock(&pipe->lock);
+}
+
+void mxc_isi_channel_enable(struct mxc_isi_pipe *pipe)
+{
+	u32 val;
+
+	mxc_isi_channel_irq_enable(pipe);
+
+	mutex_lock(&pipe->lock);
+
+	val = mxc_isi_read(pipe, CHNL_CTRL);
+	val |= CHNL_CTRL_CHNL_EN;
+	mxc_isi_write(pipe, CHNL_CTRL, val);
+
+	mutex_unlock(&pipe->lock);
+
+	msleep(300);
+}
+
+void mxc_isi_channel_disable(struct mxc_isi_pipe *pipe)
+{
+	u32 val;
+
+	mxc_isi_channel_irq_disable(pipe);
+
+	mutex_lock(&pipe->lock);
+
+	val = mxc_isi_read(pipe, CHNL_CTRL);
+	val &= ~CHNL_CTRL_CHNL_EN;
+	mxc_isi_write(pipe, CHNL_CTRL, val);
+
+	mutex_unlock(&pipe->lock);
+}
+
+/* -----------------------------------------------------------------------------
+ * Resource management & chaining
+ */
+int mxc_isi_channel_acquire(struct mxc_isi_pipe *pipe,
+			    mxc_isi_pipe_irq_t irq_handler, bool bypass)
+{
+	u8 resources;
+	int ret = 0;
+
+	mutex_lock(&pipe->lock);
+
+	if (pipe->irq_handler) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	/*
+	 * Make sure the resources we need are available. The output buffer is
+	 * always needed to operate the channel, the line buffer is needed only
+	 * when the channel isn't in bypass mode.
+	 */
+	resources = MXC_ISI_CHANNEL_RES_OUTPUT_BUF
+		  | (!bypass ? MXC_ISI_CHANNEL_RES_LINE_BUF : 0);
+	if ((pipe->available_res & resources) != resources) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	/* Acquire the channel resources. */
+	pipe->acquired_res = resources;
+	pipe->available_res &= ~resources;
+	pipe->irq_handler = irq_handler;
+
+unlock:
+	mutex_unlock(&pipe->lock);
+
+	return ret;
+}
+
+void mxc_isi_channel_release(struct mxc_isi_pipe *pipe)
+{
+	mutex_lock(&pipe->lock);
+
+	pipe->irq_handler = NULL;
+	pipe->available_res |= pipe->acquired_res;
+	pipe->acquired_res = 0;
+
+	mutex_unlock(&pipe->lock);
+}
+
+/*
+ * We currently support line buffer chaining only, for handling images with a
+ * width larger than 2048 pixels.
+ *
+ * TODO: Support secondary line buffer for downscaling YUV420 images.
+ */
+int mxc_isi_channel_chain(struct mxc_isi_pipe *pipe, bool bypass)
+{
+	/* Channel chaining requires both line and output buffer. */
+	const u8 resources = MXC_ISI_CHANNEL_RES_OUTPUT_BUF
+			   | MXC_ISI_CHANNEL_RES_LINE_BUF;
+	struct mxc_isi_pipe *chained_pipe = pipe + 1;
+	int ret = 0;
+
+	/*
+	 * If buffer chaining is required, make sure this channel is not the
+	 * last one, otherwise there's no 'next' channel to chain with. This
+	 * should be prevented by checks in the set format handlers, but let's
+	 * be defensive.
+	 */
+	if (WARN_ON(pipe->id == pipe->isi->pdata->num_channels - 1))
+		return -EINVAL;
+
+	mutex_lock(&chained_pipe->lock);
+
+	/* Safety checks. */
+	if (WARN_ON(pipe->chained || chained_pipe->chained_res)) {
+		ret = -EINVAL;
+		goto unlock;
+	}
+
+	if ((chained_pipe->available_res & resources) != resources) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	pipe->chained = true;
+	chained_pipe->chained_res |= resources;
+	chained_pipe->available_res &= ~resources;
+
+	__mxc_isi_channel_get(chained_pipe);
+
+unlock:
+	mutex_unlock(&chained_pipe->lock);
+
+	return ret;
+}
+
+void mxc_isi_channel_unchain(struct mxc_isi_pipe *pipe)
+{
+	struct mxc_isi_pipe *chained_pipe = pipe + 1;
+
+	if (!pipe->chained)
+		return;
+
+	pipe->chained = false;
+
+	mutex_lock(&chained_pipe->lock);
+
+	chained_pipe->available_res |= chained_pipe->chained_res;
+	chained_pipe->chained_res = 0;
+
+	__mxc_isi_channel_put(chained_pipe);
+
+	mutex_unlock(&chained_pipe->lock);
+}
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
new file mode 100644
index 000000000000..9745d6219a16
--- /dev/null
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -0,0 +1,858 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ISI V4L2 memory to memory driver for i.MX8QXP/QM platform
+ *
+ * ISI is a Image Sensor Interface of i.MX8QXP/QM platform, which
+ * used to process image from camera sensor or memory to memory or DC
+ *
+ * Copyright (c) 2019 NXP Semiconductor
+ */
+
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/limits.h>
+#include <linux/minmax.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/videodev2.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "imx8-isi-core.h"
+
+struct mxc_isi_m2m_buffer {
+	struct v4l2_m2m_buffer buf;
+	dma_addr_t dma_addrs[3];
+};
+
+struct mxc_isi_m2m_ctx_queue_data {
+	struct v4l2_pix_format_mplane format;
+	const struct mxc_isi_format_info *info;
+	u32 sequence;
+};
+
+struct mxc_isi_m2m_ctx {
+	struct v4l2_fh fh;
+	struct mxc_isi_m2m *m2m;
+
+	/* Protects the m2m vb2 queues */
+	struct mutex vb2_lock;
+
+	struct {
+		struct mxc_isi_m2m_ctx_queue_data out;
+		struct mxc_isi_m2m_ctx_queue_data cap;
+	} queues;
+
+	struct {
+		struct v4l2_ctrl_handler handler;
+		unsigned int alpha;
+		bool hflip;
+		bool vflip;
+	} ctrls;
+
+	bool chained;
+};
+
+static inline struct mxc_isi_m2m_buffer *
+to_isi_m2m_buffer(struct vb2_v4l2_buffer *buf)
+{
+	return container_of(buf, struct mxc_isi_m2m_buffer, buf.vb);
+}
+
+static inline struct mxc_isi_m2m_ctx *to_isi_m2m_ctx(struct v4l2_fh *fh)
+{
+	return container_of(fh, struct mxc_isi_m2m_ctx, fh);
+}
+
+static inline struct mxc_isi_m2m_ctx_queue_data *
+mxc_isi_m2m_ctx_qdata(struct mxc_isi_m2m_ctx *ctx, enum v4l2_buf_type type)
+{
+	if (V4L2_TYPE_IS_OUTPUT(type))
+		return &ctx->queues.out;
+	else
+		return &ctx->queues.cap;
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 M2M device operations
+ */
+
+static void mxc_isi_m2m_frame_write_done(struct mxc_isi_pipe *pipe, u32 status)
+{
+	struct mxc_isi_m2m *m2m = &pipe->isi->m2m;
+	struct vb2_v4l2_buffer *src_vbuf, *dst_vbuf;
+	struct mxc_isi_m2m_ctx *ctx;
+
+	ctx = v4l2_m2m_get_curr_priv(m2m->m2m_dev);
+	if (!ctx) {
+		dev_err(m2m->isi->dev,
+			"Instance released before the end of transaction\n");
+		return;
+	}
+
+	src_vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	dst_vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+
+	v4l2_m2m_buf_copy_metadata(src_vbuf, dst_vbuf, false);
+
+	src_vbuf->sequence = ctx->queues.out.sequence++;
+	dst_vbuf->sequence = ctx->queues.cap.sequence++;
+
+	v4l2_m2m_buf_done(src_vbuf, VB2_BUF_STATE_DONE);
+	v4l2_m2m_buf_done(dst_vbuf, VB2_BUF_STATE_DONE);
+
+	v4l2_m2m_job_finish(m2m->m2m_dev, ctx->fh.m2m_ctx);
+}
+
+static void mxc_isi_m2m_device_run(void *priv)
+{
+	struct mxc_isi_m2m_ctx *ctx = priv;
+	struct mxc_isi_m2m *m2m = ctx->m2m;
+	struct vb2_v4l2_buffer *src_vbuf, *dst_vbuf;
+	struct mxc_isi_m2m_buffer *src_buf, *dst_buf;
+
+	mxc_isi_channel_disable(m2m->pipe);
+
+	mutex_lock(&m2m->lock);
+
+	/* If the context has changed, reconfigure the channel. */
+	if (m2m->last_ctx != ctx) {
+		const struct v4l2_area in_size = {
+			.width = ctx->queues.out.format.width,
+			.height = ctx->queues.out.format.height,
+		};
+		const struct v4l2_area scale = {
+			.width = ctx->queues.cap.format.width,
+			.height = ctx->queues.cap.format.height,
+		};
+		const struct v4l2_rect crop = {
+			.width = ctx->queues.cap.format.width,
+			.height = ctx->queues.cap.format.height,
+		};
+
+		mxc_isi_channel_config(m2m->pipe, MXC_ISI_INPUT_MEM,
+				       &in_size, &scale, &crop,
+				       ctx->queues.out.info->encoding,
+				       ctx->queues.cap.info->encoding);
+		mxc_isi_channel_set_input_format(m2m->pipe,
+						 ctx->queues.out.info,
+						 &ctx->queues.out.format);
+		mxc_isi_channel_set_output_format(m2m->pipe,
+						  ctx->queues.cap.info,
+						  &ctx->queues.cap.format);
+
+		m2m->last_ctx = ctx;
+	}
+
+	mutex_unlock(&m2m->lock);
+
+	mutex_lock(ctx->ctrls.handler.lock);
+	mxc_isi_channel_set_alpha(m2m->pipe, ctx->ctrls.alpha);
+	mxc_isi_channel_set_flip(m2m->pipe, ctx->ctrls.hflip, ctx->ctrls.vflip);
+	mutex_unlock(ctx->ctrls.handler.lock);
+
+	src_vbuf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	dst_vbuf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+
+	src_buf = to_isi_m2m_buffer(src_vbuf);
+	dst_buf = to_isi_m2m_buffer(dst_vbuf);
+
+	mxc_isi_channel_set_inbuf(m2m->pipe, src_buf->dma_addrs[0]);
+	mxc_isi_channel_set_outbuf(m2m->pipe, dst_buf->dma_addrs, MXC_ISI_BUF1);
+	mxc_isi_channel_set_outbuf(m2m->pipe, dst_buf->dma_addrs, MXC_ISI_BUF2);
+
+	mxc_isi_channel_enable(m2m->pipe);
+
+	mxc_isi_channel_m2m_start(m2m->pipe);
+}
+
+static const struct v4l2_m2m_ops mxc_isi_m2m_ops = {
+	.device_run = mxc_isi_m2m_device_run,
+};
+
+/* -----------------------------------------------------------------------------
+ * videobuf2 queue operations
+ */
+
+static int mxc_isi_m2m_vb2_queue_setup(struct vb2_queue *q,
+				       unsigned int *num_buffers,
+				       unsigned int *num_planes,
+				       unsigned int sizes[],
+				       struct device *alloc_devs[])
+{
+	struct mxc_isi_m2m_ctx *ctx = vb2_get_drv_priv(q);
+	const struct mxc_isi_m2m_ctx_queue_data *qdata =
+		mxc_isi_m2m_ctx_qdata(ctx, q->type);
+
+	return mxc_isi_video_queue_setup(&qdata->format, qdata->info,
+					 num_buffers, num_planes, sizes);
+}
+
+static int mxc_isi_m2m_vb2_buffer_init(struct vb2_buffer *vb2)
+{
+	struct vb2_queue *vq = vb2->vb2_queue;
+	struct mxc_isi_m2m_buffer *buf = to_isi_m2m_buffer(to_vb2_v4l2_buffer(vb2));
+	struct mxc_isi_m2m_ctx *ctx = vb2_get_drv_priv(vb2->vb2_queue);
+	const struct mxc_isi_m2m_ctx_queue_data *qdata =
+		mxc_isi_m2m_ctx_qdata(ctx, vq->type);
+
+	mxc_isi_video_buffer_init(vb2, buf->dma_addrs, qdata->info,
+				  &qdata->format);
+
+	return 0;
+}
+
+static int mxc_isi_m2m_vb2_buffer_prepare(struct vb2_buffer *vb2)
+{
+	struct vb2_queue *vq = vb2->vb2_queue;
+	struct mxc_isi_m2m_ctx *ctx = vb2_get_drv_priv(vq);
+	const struct mxc_isi_m2m_ctx_queue_data *qdata =
+		mxc_isi_m2m_ctx_qdata(ctx, vq->type);
+
+	return mxc_isi_video_buffer_prepare(ctx->m2m->isi, vb2, qdata->info,
+					    &qdata->format);
+}
+
+static void mxc_isi_m2m_vb2_buffer_queue(struct vb2_buffer *vb2)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb2);
+	struct mxc_isi_m2m_ctx *ctx = vb2_get_drv_priv(vb2->vb2_queue);
+
+	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
+}
+
+static int mxc_isi_m2m_vb2_start_streaming(struct vb2_queue *q,
+					   unsigned int count)
+{
+	struct mxc_isi_m2m_ctx *ctx = vb2_get_drv_priv(q);
+	struct mxc_isi_m2m_ctx_queue_data *qdata =
+		mxc_isi_m2m_ctx_qdata(ctx, q->type);
+
+	qdata->sequence = 0;
+
+	return 0;
+}
+
+static void mxc_isi_m2m_vb2_stop_streaming(struct vb2_queue *q)
+{
+	struct mxc_isi_m2m_ctx *ctx = vb2_get_drv_priv(q);
+	struct vb2_v4l2_buffer *vbuf;
+
+	for (;;) {
+		if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+			vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+		else
+			vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+		if (!vbuf)
+			break;
+
+		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+	}
+}
+
+static const struct vb2_ops mxc_isi_m2m_vb2_qops = {
+	.queue_setup		= mxc_isi_m2m_vb2_queue_setup,
+	.buf_init		= mxc_isi_m2m_vb2_buffer_init,
+	.buf_prepare		= mxc_isi_m2m_vb2_buffer_prepare,
+	.buf_queue		= mxc_isi_m2m_vb2_buffer_queue,
+	.wait_prepare		= vb2_ops_wait_prepare,
+	.wait_finish		= vb2_ops_wait_finish,
+	.start_streaming	= mxc_isi_m2m_vb2_start_streaming,
+	.stop_streaming		= mxc_isi_m2m_vb2_stop_streaming,
+};
+
+static int mxc_isi_m2m_queue_init(void *priv, struct vb2_queue *src_vq,
+				  struct vb2_queue *dst_vq)
+{
+	struct mxc_isi_m2m_ctx *ctx = priv;
+	struct mxc_isi_m2m *m2m = ctx->m2m;
+	int ret;
+
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->drv_priv = ctx;
+	src_vq->buf_struct_size = sizeof(struct mxc_isi_m2m_buffer);
+	src_vq->ops = &mxc_isi_m2m_vb2_qops;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->lock = &ctx->vb2_lock;
+	src_vq->dev = m2m->isi->dev;
+
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	dst_vq->drv_priv = ctx;
+	dst_vq->buf_struct_size = sizeof(struct mxc_isi_m2m_buffer);
+	dst_vq->ops = &mxc_isi_m2m_vb2_qops;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->lock = &ctx->vb2_lock;
+	dst_vq->dev = m2m->isi->dev;
+
+	return vb2_queue_init(dst_vq);
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 controls
+ */
+
+static inline struct mxc_isi_m2m_ctx *
+ctrl_to_mxc_isi_m2m_ctx(struct v4l2_ctrl *ctrl)
+{
+	return container_of(ctrl->handler, struct mxc_isi_m2m_ctx, ctrls.handler);
+}
+
+static int mxc_isi_m2m_ctx_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct mxc_isi_m2m_ctx *ctx = ctrl_to_mxc_isi_m2m_ctx(ctrl);
+
+	switch (ctrl->id) {
+	case V4L2_CID_HFLIP:
+		ctx->ctrls.hflip = ctrl->val;
+		break;
+
+	case V4L2_CID_VFLIP:
+		ctx->ctrls.vflip = ctrl->val;
+		break;
+
+	case V4L2_CID_ALPHA_COMPONENT:
+		ctx->ctrls.alpha = ctrl->val;
+		break;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops mxc_isi_m2m_ctx_ctrl_ops = {
+	.s_ctrl = mxc_isi_m2m_ctx_s_ctrl,
+};
+
+static int mxc_isi_m2m_ctx_ctrls_create(struct mxc_isi_m2m_ctx *ctx)
+{
+	struct v4l2_ctrl_handler *handler = &ctx->ctrls.handler;
+	int ret;
+
+	v4l2_ctrl_handler_init(handler, 3);
+
+	v4l2_ctrl_new_std(handler, &mxc_isi_m2m_ctx_ctrl_ops,
+			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 0);
+	v4l2_ctrl_new_std(handler, &mxc_isi_m2m_ctx_ctrl_ops,
+			  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	v4l2_ctrl_new_std(handler, &mxc_isi_m2m_ctx_ctrl_ops,
+			  V4L2_CID_VFLIP, 0, 1, 1, 0);
+
+	if (handler->error) {
+		ret = handler->error;
+		v4l2_ctrl_handler_free(handler);
+		return ret;
+	}
+
+	ctx->fh.ctrl_handler = handler;
+
+	return 0;
+}
+
+static void mxc_isi_m2m_ctx_ctrls_delete(struct mxc_isi_m2m_ctx *ctx)
+{
+	v4l2_ctrl_handler_free(&ctx->ctrls.handler);
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 ioctls
+ */
+
+static int mxc_isi_m2m_querycap(struct file *file, void *fh,
+				struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, MXC_ISI_DRIVER_NAME, sizeof(cap->driver));
+	strscpy(cap->card, MXC_ISI_M2M, sizeof(cap->card));
+	cap->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
+	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
+
+	return 0;
+}
+
+static int mxc_isi_m2m_enum_fmt_vid(struct file *file, void *fh,
+				    struct v4l2_fmtdesc *f)
+{
+	const enum mxc_isi_video_type type =
+		f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ?
+		MXC_ISI_VIDEO_M2M_OUT : MXC_ISI_VIDEO_M2M_CAP;
+	const struct mxc_isi_format_info *info;
+
+	info = mxc_isi_format_enum(f->index, type);
+	if (!info)
+		return -EINVAL;
+
+	f->pixelformat = info->fourcc;
+	f->flags |= V4L2_FMT_FLAG_CSC_COLORSPACE | V4L2_FMT_FLAG_CSC_YCBCR_ENC
+		 |  V4L2_FMT_FLAG_CSC_QUANTIZATION | V4L2_FMT_FLAG_CSC_XFER_FUNC;
+
+	return 0;
+}
+
+static const struct mxc_isi_format_info *
+__mxc_isi_m2m_try_fmt_vid(struct mxc_isi_m2m_ctx *ctx,
+			  struct v4l2_pix_format_mplane *pix,
+			  const enum mxc_isi_video_type type)
+{
+	if (type == MXC_ISI_VIDEO_M2M_CAP) {
+		/* Downscaling only  */
+		pix->width = min(pix->width, ctx->queues.out.format.width);
+		pix->height = min(pix->height, ctx->queues.out.format.height);
+	}
+
+	return mxc_isi_format_try(ctx->m2m->pipe, pix, type);
+}
+
+static int mxc_isi_m2m_try_fmt_vid(struct file *file, void *fh,
+				   struct v4l2_format *f)
+{
+	const enum mxc_isi_video_type type =
+		f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ?
+		MXC_ISI_VIDEO_M2M_OUT : MXC_ISI_VIDEO_M2M_CAP;
+	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+
+	__mxc_isi_m2m_try_fmt_vid(ctx, &f->fmt.pix_mp, type);
+
+	return 0;
+}
+
+static int mxc_isi_m2m_g_fmt_vid(struct file *file, void *fh,
+				 struct v4l2_format *f)
+{
+	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	const struct mxc_isi_m2m_ctx_queue_data *qdata =
+		mxc_isi_m2m_ctx_qdata(ctx, f->type);
+
+	f->fmt.pix_mp = qdata->format;
+
+	return 0;
+}
+
+static int mxc_isi_m2m_s_fmt_vid(struct file *file, void *fh,
+				 struct v4l2_format *f)
+{
+	const enum mxc_isi_video_type type =
+		f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ?
+		MXC_ISI_VIDEO_M2M_OUT : MXC_ISI_VIDEO_M2M_CAP;
+	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
+	const struct mxc_isi_format_info *info;
+	struct vb2_queue *vq;
+
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
+	if (!vq)
+		return -EINVAL;
+
+	if (vb2_is_busy(vq))
+		return -EBUSY;
+
+	info = __mxc_isi_m2m_try_fmt_vid(ctx, pix, type);
+
+	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		ctx->queues.out.format = *pix;
+		ctx->queues.out.info = info;
+	}
+
+	/*
+	 * Always set the format on the capture side, due to either format
+	 * propagation or direct setting.
+	 */
+	ctx->queues.cap.format = *pix;
+	ctx->queues.cap.info = info;
+
+	return 0;
+}
+
+static int mxc_isi_m2m_streamon(struct file *file, void *fh,
+				enum v4l2_buf_type type)
+{
+	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	const struct v4l2_pix_format_mplane *out_pix = &ctx->queues.out.format;
+	const struct v4l2_pix_format_mplane *cap_pix = &ctx->queues.cap.format;
+	const struct mxc_isi_format_info *cap_info = ctx->queues.cap.info;
+	const struct mxc_isi_format_info *out_info = ctx->queues.out.info;
+	struct mxc_isi_m2m *m2m = ctx->m2m;
+	bool bypass;
+
+	int ret;
+
+	mutex_lock(&m2m->lock);
+
+	if (m2m->usage_count == INT_MAX) {
+		ret = -EOVERFLOW;
+		goto unlock;
+	}
+
+	bypass = cap_pix->width == out_pix->width &&
+		 cap_pix->height == out_pix->height &&
+		 cap_info->encoding == out_info->encoding;
+
+	/*
+	 * Acquire the pipe and initialize the channel with the first user of
+	 * the M2M device.
+	 */
+	if (m2m->usage_count == 0) {
+		ret = mxc_isi_channel_acquire(m2m->pipe,
+					      &mxc_isi_m2m_frame_write_done,
+					      bypass);
+		if (ret)
+			goto unlock;
+
+		mxc_isi_channel_get(m2m->pipe);
+	}
+
+	m2m->usage_count++;
+
+	/*
+	 * Allocate resources for the channel, counting how many users require
+	 * buffer chaining.
+	 */
+	if (!ctx->chained && out_pix->width > MXC_ISI_MAX_WIDTH_UNCHAINED) {
+		ret = mxc_isi_channel_chain(m2m->pipe, bypass);
+		if (ret)
+			goto deinit;
+
+		m2m->chained_count++;
+		ctx->chained = true;
+	}
+
+	/*
+	 * Drop the lock to start the stream, as the .device_run() operation
+	 * needs to acquire it.
+	 */
+	mutex_unlock(&m2m->lock);
+	ret = v4l2_m2m_ioctl_streamon(file, fh, type);
+	if (ret) {
+		/* Reacquire the lock for the cleanup path. */
+		mutex_lock(&m2m->lock);
+		goto unchain;
+	}
+
+	return 0;
+
+unchain:
+	if (ctx->chained && --m2m->chained_count == 0)
+		mxc_isi_channel_unchain(m2m->pipe);
+	ctx->chained = false;
+
+deinit:
+	if (--m2m->usage_count == 0) {
+		mxc_isi_channel_put(m2m->pipe);
+		mxc_isi_channel_release(m2m->pipe);
+	}
+
+unlock:
+	mutex_unlock(&m2m->lock);
+	return ret;
+}
+
+static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
+				 enum v4l2_buf_type type)
+{
+	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
+	struct mxc_isi_m2m *m2m = ctx->m2m;
+
+	v4l2_m2m_ioctl_streamoff(file, fh, type);
+
+	mutex_lock(&m2m->lock);
+
+	/*
+	 * If the last context is this one, reset it to make sure the device
+	 * will be reconfigured when streaming is restarted.
+	 */
+	if (m2m->last_ctx == ctx)
+		m2m->last_ctx = NULL;
+
+	/* Free the channel resources if this is the last chained context. */
+	if (ctx->chained && --m2m->chained_count == 0)
+		mxc_isi_channel_unchain(m2m->pipe);
+	ctx->chained = false;
+
+	/* Turn off the light with the last user. */
+	if (--m2m->usage_count == 0) {
+		mxc_isi_channel_disable(m2m->pipe);
+		mxc_isi_channel_put(m2m->pipe);
+		mxc_isi_channel_release(m2m->pipe);
+	}
+
+	WARN_ON(m2m->usage_count < 0);
+
+	mutex_unlock(&m2m->lock);
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops mxc_isi_m2m_ioctl_ops = {
+	.vidioc_querycap		= mxc_isi_m2m_querycap,
+
+	.vidioc_enum_fmt_vid_cap	= mxc_isi_m2m_enum_fmt_vid,
+	.vidioc_enum_fmt_vid_out	= mxc_isi_m2m_enum_fmt_vid,
+	.vidioc_g_fmt_vid_cap_mplane	= mxc_isi_m2m_g_fmt_vid,
+	.vidioc_g_fmt_vid_out_mplane	= mxc_isi_m2m_g_fmt_vid,
+	.vidioc_s_fmt_vid_cap_mplane	= mxc_isi_m2m_s_fmt_vid,
+	.vidioc_s_fmt_vid_out_mplane	= mxc_isi_m2m_s_fmt_vid,
+	.vidioc_try_fmt_vid_cap_mplane	= mxc_isi_m2m_try_fmt_vid,
+	.vidioc_try_fmt_vid_out_mplane	= mxc_isi_m2m_try_fmt_vid,
+
+	.vidioc_reqbufs			= v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf		= v4l2_m2m_ioctl_querybuf,
+	.vidioc_qbuf			= v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf			= v4l2_m2m_ioctl_dqbuf,
+	.vidioc_expbuf			= v4l2_m2m_ioctl_expbuf,
+	.vidioc_prepare_buf		= v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_create_bufs		= v4l2_m2m_ioctl_create_bufs,
+
+	.vidioc_streamon		= mxc_isi_m2m_streamon,
+	.vidioc_streamoff		= mxc_isi_m2m_streamoff,
+
+	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+};
+
+/* -----------------------------------------------------------------------------
+ * Video device file operations
+ */
+
+static void mxc_isi_m2m_init_format(struct mxc_isi_m2m_ctx *ctx,
+				    struct mxc_isi_m2m_ctx_queue_data *qdata,
+				    enum mxc_isi_video_type type)
+{
+	qdata->format.width = MXC_ISI_DEF_WIDTH;
+	qdata->format.height = MXC_ISI_DEF_HEIGHT;
+	qdata->format.pixelformat = MXC_ISI_DEF_PIXEL_FORMAT;
+
+	qdata->info = mxc_isi_format_try(ctx->m2m->pipe, &qdata->format, type);
+}
+
+static int mxc_isi_m2m_open(struct file *file)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct mxc_isi_m2m *m2m = video_drvdata(file);
+	struct mxc_isi_m2m_ctx *ctx;
+	int ret;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->m2m = m2m;
+	mutex_init(&ctx->vb2_lock);
+
+	v4l2_fh_init(&ctx->fh, vdev);
+	file->private_data = &ctx->fh;
+
+	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(m2m->m2m_dev, ctx,
+					    &mxc_isi_m2m_queue_init);
+	if (IS_ERR(ctx->fh.m2m_ctx)) {
+		ret = PTR_ERR(ctx->fh.m2m_ctx);
+		ctx->fh.m2m_ctx = NULL;
+		goto err_fh;
+	}
+
+	mxc_isi_m2m_init_format(ctx, &ctx->queues.out, MXC_ISI_VIDEO_M2M_OUT);
+	mxc_isi_m2m_init_format(ctx, &ctx->queues.cap, MXC_ISI_VIDEO_M2M_CAP);
+
+	ret = mxc_isi_m2m_ctx_ctrls_create(ctx);
+	if (ret)
+		goto err_ctx;
+
+	ret = pm_runtime_resume_and_get(m2m->isi->dev);
+	if (ret)
+		goto err_ctrls;
+
+	v4l2_fh_add(&ctx->fh);
+
+	return 0;
+
+err_ctrls:
+	mxc_isi_m2m_ctx_ctrls_delete(ctx);
+err_ctx:
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+err_fh:
+	v4l2_fh_exit(&ctx->fh);
+	mutex_destroy(&ctx->vb2_lock);
+	kfree(ctx);
+	return ret;
+}
+
+static int mxc_isi_m2m_release(struct file *file)
+{
+	struct mxc_isi_m2m *m2m = video_drvdata(file);
+	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(file->private_data);
+
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+	mxc_isi_m2m_ctx_ctrls_delete(ctx);
+
+	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_exit(&ctx->fh);
+
+	mutex_destroy(&ctx->vb2_lock);
+	kfree(ctx);
+
+	pm_runtime_put(m2m->isi->dev);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations mxc_isi_m2m_fops = {
+	.owner		= THIS_MODULE,
+	.open		= mxc_isi_m2m_open,
+	.release	= mxc_isi_m2m_release,
+	.poll		= v4l2_m2m_fop_poll,
+	.unlocked_ioctl	= video_ioctl2,
+	.mmap		= v4l2_m2m_fop_mmap,
+};
+
+/* -----------------------------------------------------------------------------
+ * Registration
+ */
+
+int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struct v4l2_device *v4l2_dev)
+{
+	struct mxc_isi_m2m *m2m = &isi->m2m;
+	struct video_device *vdev = &m2m->vdev;
+	struct media_link *link;
+	int ret;
+
+	m2m->isi = isi;
+	m2m->pipe = &isi->pipes[0];
+
+	mutex_init(&m2m->lock);
+
+	/* Initialize the video device and create controls. */
+	snprintf(vdev->name, sizeof(vdev->name), "mxc_isi.m2m");
+
+	vdev->fops	= &mxc_isi_m2m_fops;
+	vdev->ioctl_ops	= &mxc_isi_m2m_ioctl_ops;
+	vdev->v4l2_dev	= v4l2_dev;
+	vdev->minor	= -1;
+	vdev->release	= video_device_release_empty;
+	vdev->vfl_dir	= VFL_DIR_M2M;
+
+	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
+	video_set_drvdata(vdev, m2m);
+
+	/* Create the M2M device. */
+	m2m->m2m_dev = v4l2_m2m_init(&mxc_isi_m2m_ops);
+	if (IS_ERR(m2m->m2m_dev)) {
+		dev_err(isi->dev, "failed to initialize m2m device\n");
+		ret = PTR_ERR(m2m->m2m_dev);
+		goto err_mutex;
+	}
+
+	/* Register the video device. */
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret < 0) {
+		dev_err(isi->dev, "failed to register m2m device\n");
+		goto err_m2m;
+	}
+
+	/*
+	 * Populate the media graph. We can't use the mem2mem helper
+	 * v4l2_m2m_register_media_controller() as the M2M interface needs to
+	 * be connected to the existing entities in the graph, so we have to
+	 * wire things up manually:
+	 *
+	 * - The entity in the video_device, which isn't touched by the V4L2
+	 *   core for M2M devices, is used as the source I/O entity in the
+	 *   graph, connected to the crossbar switch.
+	 *
+	 * - The video device at the end of the pipeline provides the sink
+	 *   entity, and is already wired up in the graph.
+	 *
+	 * - A new interface is created, pointing at both entities. The sink
+	 *   entity will thus have two interfaces pointing to it.
+	 */
+	m2m->pad.flags = MEDIA_PAD_FL_SOURCE;
+	vdev->entity.name = "mxc_isi.output";
+	vdev->entity.function = MEDIA_ENT_F_IO_V4L;
+	ret = media_entity_pads_init(&vdev->entity, 1, &m2m->pad);
+	if (ret)
+		goto err_video;
+
+	ret = media_device_register_entity(v4l2_dev->mdev, &vdev->entity);
+	if (ret)
+		goto err_entity_cleanup;
+
+	ret = media_create_pad_link(&vdev->entity, 0,
+				    &m2m->isi->crossbar.sd.entity,
+				    m2m->isi->crossbar.num_sinks - 1,
+				    MEDIA_LNK_FL_IMMUTABLE |
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret)
+		goto err_entity_unreg;
+
+	m2m->intf = media_devnode_create(v4l2_dev->mdev, MEDIA_INTF_T_V4L_VIDEO,
+					 0, VIDEO_MAJOR, vdev->minor);
+	if (!m2m->intf) {
+		ret = -ENOMEM;
+		goto err_entity_unreg;
+	}
+
+	link = media_create_intf_link(&vdev->entity, &m2m->intf->intf,
+				      MEDIA_LNK_FL_IMMUTABLE |
+				      MEDIA_LNK_FL_ENABLED);
+	if (!link) {
+		ret = -ENOMEM;
+		goto err_devnode;
+	}
+
+	link = media_create_intf_link(&m2m->pipe->video.vdev.entity,
+				      &m2m->intf->intf,
+				      MEDIA_LNK_FL_IMMUTABLE |
+				      MEDIA_LNK_FL_ENABLED);
+	if (!link) {
+		ret = -ENOMEM;
+		goto err_devnode;
+	}
+
+	return 0;
+
+err_devnode:
+	media_devnode_remove(m2m->intf);
+err_entity_unreg:
+	media_device_unregister_entity(&vdev->entity);
+err_entity_cleanup:
+	media_entity_cleanup(&vdev->entity);
+err_video:
+	video_unregister_device(vdev);
+err_m2m:
+	v4l2_m2m_release(m2m->m2m_dev);
+err_mutex:
+	mutex_destroy(&m2m->lock);
+	return ret;
+}
+
+int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi)
+{
+	struct mxc_isi_m2m *m2m = &isi->m2m;
+	struct video_device *vdev = &m2m->vdev;
+
+	video_unregister_device(vdev);
+
+	v4l2_m2m_release(m2m->m2m_dev);
+	media_devnode_remove(m2m->intf);
+	media_entity_cleanup(&vdev->entity);
+	mutex_destroy(&m2m->lock);
+
+	return 0;
+}
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
new file mode 100644
index 000000000000..c4454aa1cb34
--- /dev/null
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -0,0 +1,867 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * V4L2 Capture ISI subdev driver for i.MX8QXP/QM platform
+ *
+ * ISI is a Image Sensor Interface of i.MX8QXP/QM platform, which
+ * used to process image from camera sensor to memory or DC
+ *
+ * Copyright (c) 2019 NXP Semiconductor
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/minmax.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+#include <linux/videodev2.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "imx8-isi-core.h"
+#include "imx8-isi-regs.h"
+
+/*
+ * While the ISI receives data from the gasket on a 3x12-bit bus, the pipeline
+ * subdev conceptually includes the gasket in order to avoid exposing an extra
+ * subdev between the CSIS and the ISI. We thus need to expose media bus codes
+ * corresponding to the CSIS output, which is narrower.
+ */
+static const struct mxc_isi_bus_format_info mxc_isi_bus_formats[] = {
+	/* YUV formats */
+	{
+		.mbus_code	= MEDIA_BUS_FMT_UYVY8_1X16,
+		.output		= MEDIA_BUS_FMT_YUV8_1X24,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK),
+		.encoding	= MXC_ISI_ENC_YUV,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_YUV8_1X24,
+		.output		= MEDIA_BUS_FMT_YUV8_1X24,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_YUV,
+	},
+	/* RGB formats */
+	{
+		.mbus_code	= MEDIA_BUS_FMT_RGB565_1X16,
+		.output		= MEDIA_BUS_FMT_RGB888_1X24,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK),
+		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.output		= MEDIA_BUS_FMT_RGB888_1X24,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RGB,
+	},
+	/* RAW formats */
+	{
+		.mbus_code	= MEDIA_BUS_FMT_Y8_1X8,
+		.output		= MEDIA_BUS_FMT_Y8_1X8,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
+		.output		= MEDIA_BUS_FMT_Y10_1X10,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_Y12_1X12,
+		.output		= MEDIA_BUS_FMT_Y12_1X12,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_Y14_1X14,
+		.output		= MEDIA_BUS_FMT_Y14_1X14,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
+		.output		= MEDIA_BUS_FMT_SBGGR8_1X8,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG8_1X8,
+		.output		= MEDIA_BUS_FMT_SGBRG8_1X8,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG8_1X8,
+		.output		= MEDIA_BUS_FMT_SGRBG8_1X8,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB8_1X8,
+		.output		= MEDIA_BUS_FMT_SRGGB8_1X8,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
+		.output		= MEDIA_BUS_FMT_SBGGR10_1X10,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
+		.output		= MEDIA_BUS_FMT_SGBRG10_1X10,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
+		.output		= MEDIA_BUS_FMT_SGRBG10_1X10,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
+		.output		= MEDIA_BUS_FMT_SRGGB10_1X10,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
+		.output		= MEDIA_BUS_FMT_SBGGR12_1X12,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
+		.output		= MEDIA_BUS_FMT_SGBRG12_1X12,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
+		.output		= MEDIA_BUS_FMT_SGRBG12_1X12,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
+		.output		= MEDIA_BUS_FMT_SRGGB12_1X12,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR14_1X14,
+		.output		= MEDIA_BUS_FMT_SBGGR14_1X14,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG14_1X14,
+		.output		= MEDIA_BUS_FMT_SGBRG14_1X14,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG14_1X14,
+		.output		= MEDIA_BUS_FMT_SGRBG14_1X14,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB14_1X14,
+		.output		= MEDIA_BUS_FMT_SRGGB14_1X14,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	},
+	/* JPEG */
+	{
+		.mbus_code	= MEDIA_BUS_FMT_JPEG_1X8,
+		.output		= MEDIA_BUS_FMT_JPEG_1X8,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}
+};
+
+const struct mxc_isi_bus_format_info *
+mxc_isi_bus_format_by_code(u32 code, unsigned int pad)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mxc_isi_bus_formats); i++) {
+		const struct mxc_isi_bus_format_info *info =
+			&mxc_isi_bus_formats[i];
+
+		if (info->mbus_code == code && info->pads & BIT(pad))
+			return info;
+	}
+
+	return NULL;
+}
+
+const struct mxc_isi_bus_format_info *
+mxc_isi_bus_format_by_index(unsigned int index, unsigned int pad)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mxc_isi_bus_formats); i++) {
+		const struct mxc_isi_bus_format_info *info =
+			&mxc_isi_bus_formats[i];
+
+		if (!(info->pads & BIT(pad)))
+			continue;
+
+		if (!index)
+			return info;
+
+		index--;
+	}
+
+	return NULL;
+}
+
+static inline struct mxc_isi_pipe *to_isi_pipe(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct mxc_isi_pipe, sd);
+}
+
+int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
+{
+	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
+	const struct mxc_isi_bus_format_info *sink_info;
+	const struct mxc_isi_bus_format_info *src_info;
+	const struct v4l2_mbus_framefmt *sink_fmt;
+	const struct v4l2_mbus_framefmt *src_fmt;
+	const struct v4l2_rect *compose;
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev *sd = &pipe->sd;
+	struct v4l2_area in_size, scale;
+	struct v4l2_rect crop;
+	u32 input;
+	int ret;
+
+	/*
+	 * Find the connected input by inspecting the crossbar switch routing
+	 * table.
+	 */
+	state = v4l2_subdev_lock_and_get_active_state(&xbar->sd);
+	ret = v4l2_subdev_routing_find_opposite_end(&state->routing,
+						    xbar->num_sinks + pipe->id,
+						    0, &input, NULL);
+	v4l2_subdev_unlock_state(state);
+
+	if (ret)
+		return -EPIPE;
+
+	/* Configure the pipeline. */
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	sink_fmt = v4l2_subdev_get_try_format(sd, state, MXC_ISI_PIPE_PAD_SINK);
+	src_fmt = v4l2_subdev_get_try_format(sd, state, MXC_ISI_PIPE_PAD_SOURCE);
+	compose = v4l2_subdev_get_try_compose(sd, state, MXC_ISI_PIPE_PAD_SINK);
+	crop = *v4l2_subdev_get_try_crop(sd, state, MXC_ISI_PIPE_PAD_SOURCE);
+
+	sink_info = mxc_isi_bus_format_by_code(sink_fmt->code,
+					       MXC_ISI_PIPE_PAD_SINK);
+	src_info = mxc_isi_bus_format_by_code(src_fmt->code,
+					      MXC_ISI_PIPE_PAD_SOURCE);
+
+	in_size.width = sink_fmt->width;
+	in_size.height = sink_fmt->height;
+	scale.width = compose->width;
+	scale.height = compose->height;
+
+	v4l2_subdev_unlock_state(state);
+
+	/* Configure the ISI channel. */
+	mxc_isi_channel_config(pipe, input, &in_size, &scale, &crop,
+			       sink_info->encoding, src_info->encoding);
+
+	mxc_isi_channel_enable(pipe);
+
+	/* Enable streams on the crossbar switch. */
+	ret = v4l2_subdev_enable_streams(&xbar->sd, xbar->num_sinks + pipe->id,
+					 BIT(0));
+	if (ret) {
+		mxc_isi_channel_disable(pipe);
+		dev_err(pipe->isi->dev, "Failed to enable pipe %u\n",
+			pipe->id);
+		return ret;
+	}
+
+	return 0;
+}
+
+void mxc_isi_pipe_disable(struct mxc_isi_pipe *pipe)
+{
+	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
+	int ret;
+
+	ret = v4l2_subdev_disable_streams(&xbar->sd, xbar->num_sinks + pipe->id,
+					  BIT(0));
+	if (ret)
+		dev_err(pipe->isi->dev, "Failed to disable pipe %u\n",
+			pipe->id);
+
+	mxc_isi_channel_disable(pipe);
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 subdev operations
+ */
+
+static struct v4l2_mbus_framefmt *
+mxc_isi_pipe_get_pad_format(struct mxc_isi_pipe *pipe,
+			    struct v4l2_subdev_state *state,
+			    unsigned int pad)
+{
+	return v4l2_subdev_get_try_format(&pipe->sd, state, pad);
+}
+
+static struct v4l2_rect *
+mxc_isi_pipe_get_pad_crop(struct mxc_isi_pipe *pipe,
+			  struct v4l2_subdev_state *state,
+			  unsigned int pad)
+{
+	return v4l2_subdev_get_try_crop(&pipe->sd, state, pad);
+}
+
+static struct v4l2_rect *
+mxc_isi_pipe_get_pad_compose(struct mxc_isi_pipe *pipe,
+			     struct v4l2_subdev_state *state,
+			     unsigned int pad)
+{
+	return v4l2_subdev_get_try_compose(&pipe->sd, state, pad);
+}
+
+static int mxc_isi_pipe_init_cfg(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state)
+{
+	struct mxc_isi_pipe *pipe = to_isi_pipe(sd);
+	struct v4l2_mbus_framefmt *fmt_source;
+	struct v4l2_mbus_framefmt *fmt_sink;
+	struct v4l2_rect *compose;
+	struct v4l2_rect *crop;
+
+	fmt_sink = mxc_isi_pipe_get_pad_format(pipe, state,
+					       MXC_ISI_PIPE_PAD_SINK);
+	fmt_source = mxc_isi_pipe_get_pad_format(pipe, state,
+						 MXC_ISI_PIPE_PAD_SOURCE);
+
+	fmt_sink->width = MXC_ISI_DEF_WIDTH;
+	fmt_sink->height = MXC_ISI_DEF_HEIGHT;
+	fmt_sink->code = MXC_ISI_DEF_MBUS_CODE_SINK;
+	fmt_sink->field = V4L2_FIELD_NONE;
+	fmt_sink->colorspace = V4L2_COLORSPACE_JPEG;
+	fmt_sink->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt_sink->colorspace);
+	fmt_sink->quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(false, fmt_sink->colorspace,
+					      fmt_sink->ycbcr_enc);
+	fmt_sink->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt_sink->colorspace);
+
+	*fmt_source = *fmt_sink;
+	fmt_source->code = MXC_ISI_DEF_MBUS_CODE_SOURCE;
+
+	compose = mxc_isi_pipe_get_pad_compose(pipe, state,
+					       MXC_ISI_PIPE_PAD_SINK);
+	crop = mxc_isi_pipe_get_pad_crop(pipe, state, MXC_ISI_PIPE_PAD_SOURCE);
+
+	compose->left = 0;
+	compose->top = 0;
+	compose->width = MXC_ISI_DEF_WIDTH;
+	compose->height = MXC_ISI_DEF_HEIGHT;
+
+	*crop = *compose;
+
+	return 0;
+}
+
+static int mxc_isi_pipe_enum_mbus_code(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state,
+				       struct v4l2_subdev_mbus_code_enum *code)
+{
+	static const u32 output_codes[] = {
+		MEDIA_BUS_FMT_YUV8_1X24,
+		MEDIA_BUS_FMT_RGB888_1X24,
+	};
+	struct mxc_isi_pipe *pipe = to_isi_pipe(sd);
+	const struct mxc_isi_bus_format_info *info;
+	unsigned int index;
+	unsigned int i;
+
+	if (code->pad == MXC_ISI_PIPE_PAD_SOURCE) {
+		const struct v4l2_mbus_framefmt *format;
+
+		format = mxc_isi_pipe_get_pad_format(pipe, state,
+						     MXC_ISI_PIPE_PAD_SINK);
+		info = mxc_isi_bus_format_by_code(format->code,
+						  MXC_ISI_PIPE_PAD_SINK);
+
+		if (info->encoding == MXC_ISI_ENC_RAW) {
+			/*
+			 * For RAW formats, the sink and source media bus codes
+			 * must match.
+			 */
+			if (code->index)
+				return -EINVAL;
+
+			code->code = info->output;
+		} else {
+			/*
+			 * For RGB or YUV formats, the ISI supports format
+			 * conversion. Either of the two output formats can be
+			 * used regardless of the input.
+			 */
+			if (code->index > 1)
+				return -EINVAL;
+
+			code->code = output_codes[code->index];
+		}
+
+		return 0;
+	}
+
+	index = code->index;
+
+	for (i = 0; i < ARRAY_SIZE(mxc_isi_bus_formats); ++i) {
+		info = &mxc_isi_bus_formats[i];
+
+		if (!(info->pads & BIT(MXC_ISI_PIPE_PAD_SINK)))
+			continue;
+
+		if (index == 0) {
+			code->code = info->mbus_code;
+			return 0;
+		}
+
+		index--;
+	}
+
+	return -EINVAL;
+}
+
+static int mxc_isi_pipe_set_fmt(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_format *fmt)
+{
+	struct mxc_isi_pipe *pipe = to_isi_pipe(sd);
+	struct v4l2_mbus_framefmt *mf = &fmt->format;
+	const struct mxc_isi_bus_format_info *info;
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *rect;
+
+	if (vb2_is_busy(&pipe->video.vb2_q))
+		return -EBUSY;
+
+	if (fmt->pad == MXC_ISI_PIPE_PAD_SINK) {
+		unsigned int max_width;
+
+		info = mxc_isi_bus_format_by_code(mf->code,
+						  MXC_ISI_PIPE_PAD_SINK);
+		if (!info)
+			info = mxc_isi_bus_format_by_code(MXC_ISI_DEF_MBUS_CODE_SINK,
+							  MXC_ISI_PIPE_PAD_SINK);
+
+		/*
+		 * Limit the max line length if there's no adjacent pipe to
+		 * chain with.
+		 */
+		max_width = pipe->id == pipe->isi->pdata->num_channels - 1
+			  ? MXC_ISI_MAX_WIDTH_UNCHAINED
+			  : MXC_ISI_MAX_WIDTH_CHAINED;
+
+		mf->code = info->mbus_code;
+		mf->width = clamp(mf->width, MXC_ISI_MIN_WIDTH, max_width);
+		mf->height = clamp(mf->height, MXC_ISI_MIN_HEIGHT,
+				   MXC_ISI_MAX_HEIGHT);
+
+		/* Propagate the format to the source pad. */
+		rect = mxc_isi_pipe_get_pad_compose(pipe, state,
+						    MXC_ISI_PIPE_PAD_SINK);
+		rect->width = mf->width;
+		rect->height = mf->height;
+
+		rect = mxc_isi_pipe_get_pad_crop(pipe, state,
+						 MXC_ISI_PIPE_PAD_SOURCE);
+		rect->left = 0;
+		rect->top = 0;
+		rect->width = mf->width;
+		rect->height = mf->height;
+
+		format = mxc_isi_pipe_get_pad_format(pipe, state,
+						     MXC_ISI_PIPE_PAD_SOURCE);
+		format->code = info->output;
+		format->width = mf->width;
+		format->height = mf->height;
+	} else {
+		/*
+		 * For RGB or YUV formats, the ISI supports RGB <-> YUV format
+		 * conversion. For RAW formats, the sink and source media bus
+		 * codes must match.
+		 */
+		format = mxc_isi_pipe_get_pad_format(pipe, state,
+						     MXC_ISI_PIPE_PAD_SINK);
+		info = mxc_isi_bus_format_by_code(format->code,
+						  MXC_ISI_PIPE_PAD_SINK);
+
+		if (info->encoding != MXC_ISI_ENC_RAW) {
+			if (mf->code != MEDIA_BUS_FMT_YUV8_1X24 &&
+			    mf->code != MEDIA_BUS_FMT_RGB888_1X24)
+				mf->code = info->output;
+
+			info = mxc_isi_bus_format_by_code(mf->code,
+							  MXC_ISI_PIPE_PAD_SOURCE);
+		}
+
+		mf->code = info->output;
+
+		/*
+		 * The width and height on the source can't be changed, they
+		 * must match the crop rectangle size.
+		 */
+		rect = mxc_isi_pipe_get_pad_crop(pipe, state,
+						 MXC_ISI_PIPE_PAD_SOURCE);
+
+		mf->width = rect->width;
+		mf->height = rect->height;
+	}
+
+	format = mxc_isi_pipe_get_pad_format(pipe, state, fmt->pad);
+	*format = *mf;
+
+	dev_dbg(pipe->isi->dev, "pad%u: code: 0x%04x, %ux%u",
+		fmt->pad, mf->code, mf->width, mf->height);
+
+	return 0;
+}
+
+static int mxc_isi_pipe_get_selection(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      struct v4l2_subdev_selection *sel)
+{
+	struct mxc_isi_pipe *pipe = to_isi_pipe(sd);
+	const struct v4l2_mbus_framefmt *format;
+	const struct v4l2_rect *rect;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+		if (sel->pad != MXC_ISI_PIPE_PAD_SINK)
+			/* No compose rectangle on source pad. */
+			return -EINVAL;
+
+		/* The sink compose is bound by the sink format. */
+		format = mxc_isi_pipe_get_pad_format(pipe, state,
+						     MXC_ISI_PIPE_PAD_SINK);
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = format->width;
+		sel->r.height = format->height;
+		break;
+
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		if (sel->pad != MXC_ISI_PIPE_PAD_SOURCE)
+			/* No crop rectangle on sink pad. */
+			return -EINVAL;
+
+		/* The source crop is bound by the sink compose. */
+		rect = mxc_isi_pipe_get_pad_compose(pipe, state,
+						    MXC_ISI_PIPE_PAD_SINK);
+		sel->r = *rect;
+		break;
+
+	case V4L2_SEL_TGT_CROP:
+		if (sel->pad != MXC_ISI_PIPE_PAD_SOURCE)
+			/* No crop rectangle on sink pad. */
+			return -EINVAL;
+
+		rect = mxc_isi_pipe_get_pad_crop(pipe, state, sel->pad);
+		sel->r = *rect;
+		break;
+
+	case V4L2_SEL_TGT_COMPOSE:
+		if (sel->pad != MXC_ISI_PIPE_PAD_SINK)
+			/* No compose rectangle on source pad. */
+			return -EINVAL;
+
+		rect = mxc_isi_pipe_get_pad_compose(pipe, state, sel->pad);
+		sel->r = *rect;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mxc_isi_pipe_set_selection(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      struct v4l2_subdev_selection *sel)
+{
+	struct mxc_isi_pipe *pipe = to_isi_pipe(sd);
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *rect;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		if (sel->pad != MXC_ISI_PIPE_PAD_SOURCE)
+			/* The pipeline support cropping on the source only. */
+			return -EINVAL;
+
+		/* The source crop is bound by the sink compose. */
+		rect = mxc_isi_pipe_get_pad_compose(pipe, state,
+						    MXC_ISI_PIPE_PAD_SINK);
+		sel->r.left = clamp_t(s32, sel->r.left, 0, rect->width - 1);
+		sel->r.top = clamp_t(s32, sel->r.top, 0, rect->height - 1);
+		sel->r.width = clamp(sel->r.width, MXC_ISI_MIN_WIDTH,
+				     rect->width - sel->r.left);
+		sel->r.height = clamp(sel->r.height, MXC_ISI_MIN_HEIGHT,
+				      rect->height - sel->r.top);
+
+		rect = mxc_isi_pipe_get_pad_crop(pipe, state,
+						 MXC_ISI_PIPE_PAD_SOURCE);
+		*rect = sel->r;
+
+		/* Propagate the crop rectangle to the source pad. */
+		format = mxc_isi_pipe_get_pad_format(pipe, state,
+						     MXC_ISI_PIPE_PAD_SOURCE);
+		format->width = sel->r.width;
+		format->height = sel->r.height;
+		break;
+
+	case V4L2_SEL_TGT_COMPOSE:
+		if (sel->pad != MXC_ISI_PIPE_PAD_SINK)
+			/* Composing is supported on the sink only. */
+			return -EINVAL;
+
+		/* The sink crop is bound by the sink format downscaling only). */
+		format = mxc_isi_pipe_get_pad_format(pipe, state,
+						     MXC_ISI_PIPE_PAD_SINK);
+
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = clamp(sel->r.width, MXC_ISI_MIN_WIDTH,
+				     format->width);
+		sel->r.height = clamp(sel->r.height, MXC_ISI_MIN_HEIGHT,
+				      format->height);
+
+		rect = mxc_isi_pipe_get_pad_compose(pipe, state,
+						    MXC_ISI_PIPE_PAD_SINK);
+		*rect = sel->r;
+
+		/* Propagate the compose rectangle to the source pad. */
+		rect = mxc_isi_pipe_get_pad_crop(pipe, state,
+						 MXC_ISI_PIPE_PAD_SOURCE);
+		rect->left = 0;
+		rect->top = 0;
+		rect->width = sel->r.width;
+		rect->height = sel->r.height;
+
+		format = mxc_isi_pipe_get_pad_format(pipe, state,
+						     MXC_ISI_PIPE_PAD_SOURCE);
+		format->width = sel->r.width;
+		format->height = sel->r.height;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	dev_dbg(pipe->isi->dev, "%s, target %#x: (%d,%d)/%dx%d", __func__,
+		sel->target, sel->r.left, sel->r.top, sel->r.width,
+		sel->r.height);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops mxc_isi_pipe_subdev_pad_ops = {
+	.init_cfg = mxc_isi_pipe_init_cfg,
+	.enum_mbus_code = mxc_isi_pipe_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = mxc_isi_pipe_set_fmt,
+	.get_selection = mxc_isi_pipe_get_selection,
+	.set_selection = mxc_isi_pipe_set_selection,
+};
+
+static const struct v4l2_subdev_ops mxc_isi_pipe_subdev_ops = {
+	.pad = &mxc_isi_pipe_subdev_pad_ops,
+};
+
+/* -----------------------------------------------------------------------------
+ * IRQ handling
+ */
+
+static irqreturn_t mxc_isi_pipe_irq_handler(int irq, void *priv)
+{
+	struct mxc_isi_pipe *pipe = priv;
+	const struct mxc_isi_ier_reg *ier_reg = pipe->isi->pdata->ier_reg;
+	u32 status;
+
+	status = mxc_isi_channel_irq_status(pipe, true);
+
+	if (status & CHNL_STS_FRM_STRD) {
+		if (!WARN_ON(!pipe->irq_handler))
+			pipe->irq_handler(pipe, status);
+	}
+
+	if (status & (CHNL_STS_AXI_WR_ERR_Y |
+		      CHNL_STS_AXI_WR_ERR_U |
+		      CHNL_STS_AXI_WR_ERR_V))
+		dev_dbg(pipe->isi->dev, "%s: IRQ AXI Error stat=0x%X\n",
+			__func__, status);
+
+	if (status & (ier_reg->panic_y_buf_en.mask |
+		      ier_reg->panic_u_buf_en.mask |
+		      ier_reg->panic_v_buf_en.mask))
+		dev_dbg(pipe->isi->dev, "%s: IRQ Panic OFLW Error stat=0x%X\n",
+			__func__, status);
+
+	if (status & (ier_reg->oflw_y_buf_en.mask |
+		      ier_reg->oflw_u_buf_en.mask |
+		      ier_reg->oflw_v_buf_en.mask))
+		dev_dbg(pipe->isi->dev, "%s: IRQ OFLW Error stat=0x%X\n",
+			__func__, status);
+
+	if (status & (ier_reg->excs_oflw_y_buf_en.mask |
+		      ier_reg->excs_oflw_u_buf_en.mask |
+		      ier_reg->excs_oflw_v_buf_en.mask))
+		dev_dbg(pipe->isi->dev, "%s: IRQ EXCS OFLW Error stat=0x%X\n",
+			__func__, status);
+
+	return IRQ_HANDLED;
+}
+
+/* -----------------------------------------------------------------------------
+ * Init & cleanup
+ */
+
+static const struct media_entity_operations mxc_isi_pipe_entity_ops = {
+	.link_validate	= v4l2_subdev_link_validate,
+};
+
+int mxc_isi_pipe_init(struct mxc_isi_dev *isi, unsigned int id)
+{
+	struct mxc_isi_pipe *pipe = &isi->pipes[id];
+	struct v4l2_subdev *sd;
+	int irq;
+	int ret;
+
+	pipe->id = id;
+	pipe->isi = isi;
+	pipe->regs = isi->regs + id * isi->pdata->reg_offset;
+
+	mutex_init(&pipe->lock);
+
+	pipe->available_res = MXC_ISI_CHANNEL_RES_LINE_BUF
+			    | MXC_ISI_CHANNEL_RES_OUTPUT_BUF;
+	pipe->acquired_res = 0;
+	pipe->chained_res = 0;
+	pipe->chained = false;
+
+	sd = &pipe->sd;
+	v4l2_subdev_init(sd, &mxc_isi_pipe_subdev_ops);
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	snprintf(sd->name, sizeof(sd->name), "mxc_isi.%d", pipe->id);
+	sd->dev = isi->dev;
+
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	sd->entity.ops = &mxc_isi_pipe_entity_ops;
+
+	pipe->pads[MXC_ISI_PIPE_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	pipe->pads[MXC_ISI_PIPE_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&sd->entity, MXC_ISI_PIPE_PADS_NUM,
+				     pipe->pads);
+	if (ret)
+		goto error;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret < 0)
+		goto error;
+
+	/* Register IRQ handler. */
+	mxc_isi_channel_irq_clear(pipe);
+
+	irq = platform_get_irq(to_platform_device(isi->dev), id);
+	if (irq < 0) {
+		dev_err(pipe->isi->dev, "Failed to get IRQ (%d)\n", irq);
+		ret = irq;
+		goto error;
+	}
+
+	ret = devm_request_irq(isi->dev, irq, mxc_isi_pipe_irq_handler,
+			       0, dev_name(isi->dev), pipe);
+	if (ret < 0) {
+		dev_err(isi->dev, "failed to request IRQ (%d)\n", ret);
+		goto error;
+	}
+
+	return 0;
+
+error:
+	media_entity_cleanup(&sd->entity);
+	mutex_destroy(&pipe->lock);
+
+	return ret;
+}
+
+void mxc_isi_pipe_cleanup(struct mxc_isi_pipe *pipe)
+{
+	struct v4l2_subdev *sd = &pipe->sd;
+
+	media_entity_cleanup(&sd->entity);
+	mutex_destroy(&pipe->lock);
+}
+
+int mxc_isi_pipe_acquire(struct mxc_isi_pipe *pipe,
+			 mxc_isi_pipe_irq_t irq_handler)
+{
+	const struct mxc_isi_bus_format_info *sink_info;
+	const struct mxc_isi_bus_format_info *src_info;
+	struct v4l2_mbus_framefmt *sink_fmt;
+	const struct v4l2_mbus_framefmt *src_fmt;
+	struct v4l2_subdev *sd = &pipe->sd;
+	struct v4l2_subdev_state *state;
+	bool bypass;
+	int ret;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	sink_fmt = v4l2_subdev_get_try_format(sd, state, MXC_ISI_PIPE_PAD_SINK);
+	src_fmt = v4l2_subdev_get_try_format(sd, state, MXC_ISI_PIPE_PAD_SOURCE);
+	v4l2_subdev_unlock_state(state);
+
+	sink_info = mxc_isi_bus_format_by_code(sink_fmt->code,
+					       MXC_ISI_PIPE_PAD_SINK);
+	src_info = mxc_isi_bus_format_by_code(src_fmt->code,
+					      MXC_ISI_PIPE_PAD_SOURCE);
+
+	bypass = sink_fmt->width == src_fmt->width &&
+		 sink_fmt->height == src_fmt->height &&
+		 sink_info->encoding == src_info->encoding;
+
+	ret = mxc_isi_channel_acquire(pipe, irq_handler, bypass);
+	if (ret)
+		return ret;
+
+	/* Chain the channel if needed for wide resolutions. */
+	if (sink_fmt->width > MXC_ISI_MAX_WIDTH_UNCHAINED) {
+		ret = mxc_isi_channel_chain(pipe, bypass);
+		if (ret)
+			mxc_isi_channel_release(pipe);
+	}
+
+	return ret;
+}
+
+void mxc_isi_pipe_release(struct mxc_isi_pipe *pipe)
+{
+	mxc_isi_channel_release(pipe);
+	mxc_isi_channel_unchain(pipe);
+}
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
new file mode 100644
index 000000000000..1b65eccdf0da
--- /dev/null
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -0,0 +1,418 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2019-2020 NXP
+ */
+
+#ifndef __IMX8_ISI_REGS_H__
+#define __IMX8_ISI_REGS_H__
+
+#include <linux/bits.h>
+
+/* ISI Registers Define  */
+/* Channel Control Register */
+#define CHNL_CTRL						0x0000
+#define CHNL_CTRL_CHNL_EN					BIT(31)
+#define CHNL_CTRL_CLK_EN					BIT(30)
+#define CHNL_CTRL_CHNL_BYPASS					BIT(29)
+#define CHNL_CTRL_CHAIN_BUF(n)					((n) << 25)
+#define CHNL_CTRL_CHAIN_BUF_MASK				GENMASK(26, 25)
+#define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
+#define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
+#define CHNL_CTRL_SW_RST					BIT(24)
+#define CHNL_CTRL_BLANK_PXL(n)					((n) << 16)
+#define CHNL_CTRL_BLANK_PXL_MASK				GENMASK(23, 16)
+#define CHNL_CTRL_MIPI_VC_ID(n)					((n) << 6)
+#define CHNL_CTRL_MIPI_VC_ID_MASK				GENMASK(7, 6)
+#define CHNL_CTRL_SRC_TYPE(n)					((n) << 4)
+#define CHNL_CTRL_SRC_TYPE_MASK					BIT(4)
+#define CHNL_CTRL_SRC_TYPE_DEVICE				0
+#define CHNL_CTRL_SRC_TYPE_MEMORY				1
+#define CHNL_CTRL_SRC_INPUT(n)					((n) << 0)
+#define CHNL_CTRL_SRC_INPUT_MASK				GENMASK(2, 0)
+
+/* Channel Image Control Register */
+#define CHNL_IMG_CTRL						0x0004
+#define CHNL_IMG_CTRL_FORMAT(n)					((n) << 24)
+#define CHNL_IMG_CTRL_FORMAT_MASK				GENMASK(29, 24)
+#define CHNL_IMG_CTRL_FORMAT_RGBA8888				0x00
+#define CHNL_IMG_CTRL_FORMAT_ABGR8888				0x01
+#define CHNL_IMG_CTRL_FORMAT_ARGB8888				0x02
+#define CHNL_IMG_CTRL_FORMAT_RGBX888				0x03
+#define CHNL_IMG_CTRL_FORMAT_XBGR888				0x04
+#define CHNL_IMG_CTRL_FORMAT_XRGB888				0x05
+#define CHNL_IMG_CTRL_FORMAT_RGB888P				0x06
+#define CHNL_IMG_CTRL_FORMAT_BGR888P				0x07
+#define CHNL_IMG_CTRL_FORMAT_A2BGR10				0x08
+#define CHNL_IMG_CTRL_FORMAT_A2RGB10				0x09
+#define CHNL_IMG_CTRL_FORMAT_RGB565				0x0a
+#define CHNL_IMG_CTRL_FORMAT_RAW8				0x0b
+#define CHNL_IMG_CTRL_FORMAT_RAW10				0x0c
+#define CHNL_IMG_CTRL_FORMAT_RAW10P				0x0d
+#define CHNL_IMG_CTRL_FORMAT_RAW12				0x0e
+#define CHNL_IMG_CTRL_FORMAT_RAW16				0x0f
+#define CHNL_IMG_CTRL_FORMAT_YUV444_1P8P			0x10
+#define CHNL_IMG_CTRL_FORMAT_YUV444_2P8P			0x11
+#define CHNL_IMG_CTRL_FORMAT_YUV444_3P8P			0x12
+#define CHNL_IMG_CTRL_FORMAT_YUV444_1P8				0x13
+#define CHNL_IMG_CTRL_FORMAT_YUV444_1P10			0x14
+#define CHNL_IMG_CTRL_FORMAT_YUV444_2P10			0x15
+#define CHNL_IMG_CTRL_FORMAT_YUV444_3P10			0x16
+#define CHNL_IMG_CTRL_FORMAT_YUV444_1P10P			0x18
+#define CHNL_IMG_CTRL_FORMAT_YUV444_2P10P			0x19
+#define CHNL_IMG_CTRL_FORMAT_YUV444_3P10P			0x1a
+#define CHNL_IMG_CTRL_FORMAT_YUV444_1P12			0x1c
+#define CHNL_IMG_CTRL_FORMAT_YUV444_2P12			0x1d
+#define CHNL_IMG_CTRL_FORMAT_YUV444_3P12			0x1e
+#define CHNL_IMG_CTRL_FORMAT_YUV422_1P8P			0x20
+#define CHNL_IMG_CTRL_FORMAT_YUV422_2P8P			0x21
+#define CHNL_IMG_CTRL_FORMAT_YUV422_3P8P			0x22
+#define CHNL_IMG_CTRL_FORMAT_YUV422_1P10			0x24
+#define CHNL_IMG_CTRL_FORMAT_YUV422_2P10			0x25
+#define CHNL_IMG_CTRL_FORMAT_YUV422_3P10			0x26
+#define CHNL_IMG_CTRL_FORMAT_YUV422_1P10P			0x28
+#define CHNL_IMG_CTRL_FORMAT_YUV422_2P10P			0x29
+#define CHNL_IMG_CTRL_FORMAT_YUV422_3P10P			0x2a
+#define CHNL_IMG_CTRL_FORMAT_YUV422_1P12			0x2c
+#define CHNL_IMG_CTRL_FORMAT_YUV422_2P12			0x2d
+#define CHNL_IMG_CTRL_FORMAT_YUV422_3P12			0x2e
+#define CHNL_IMG_CTRL_FORMAT_YUV420_2P8P			0x31
+#define CHNL_IMG_CTRL_FORMAT_YUV420_3P8P			0x32
+#define CHNL_IMG_CTRL_FORMAT_YUV420_2P10			0x35
+#define CHNL_IMG_CTRL_FORMAT_YUV420_3P10			0x36
+#define CHNL_IMG_CTRL_FORMAT_YUV420_2P10P			0x39
+#define CHNL_IMG_CTRL_FORMAT_YUV420_3P10P			0x3a
+#define CHNL_IMG_CTRL_FORMAT_YUV420_2P12			0x3d
+#define CHNL_IMG_CTRL_FORMAT_YUV420_3P12			0x3e
+#define CHNL_IMG_CTRL_GBL_ALPHA_VAL(n)				((n) << 16)
+#define CHNL_IMG_CTRL_GBL_ALPHA_VAL_MASK			GENMASK(23, 16)
+#define CHNL_IMG_CTRL_GBL_ALPHA_EN				BIT(15)
+#define CHNL_IMG_CTRL_DEINT(n)					((n) << 12)
+#define CHNL_IMG_CTRL_DEINT_MASK				GENMASK(14, 12)
+#define CHNL_IMG_CTRL_DEINT_WEAVE_ODD_EVEN			2
+#define CHNL_IMG_CTRL_DEINT_WEAVE_EVEN_ODD			3
+#define CHNL_IMG_CTRL_DEINT_BLEND_ODD_EVEN			4
+#define CHNL_IMG_CTRL_DEINT_BLEND_EVEN_ODD			5
+#define CHNL_IMG_CTRL_DEINT_LDOUBLE_ODD_EVEN			6
+#define CHNL_IMG_CTRL_DEINT_LDOUBLE_EVEN_ODD			7
+#define CHNL_IMG_CTRL_DEC_X(n)					((n) << 10)
+#define CHNL_IMG_CTRL_DEC_X_MASK				GENMASK(11, 10)
+#define CHNL_IMG_CTRL_DEC_Y(n)					((n) << 8)
+#define CHNL_IMG_CTRL_DEC_Y_MASK				GENMASK(9, 8)
+#define CHNL_IMG_CTRL_CROP_EN					BIT(7)
+#define CHNL_IMG_CTRL_VFLIP_EN					BIT(6)
+#define CHNL_IMG_CTRL_HFLIP_EN					BIT(5)
+#define CHNL_IMG_CTRL_YCBCR_MODE				BIT(3)
+#define CHNL_IMG_CTRL_CSC_MODE(n)				((n) << 1)
+#define CHNL_IMG_CTRL_CSC_MODE_MASK				GENMASK(2, 1)
+#define CHNL_IMG_CTRL_CSC_MODE_YUV2RGB				0
+#define CHNL_IMG_CTRL_CSC_MODE_YCBCR2RGB			1
+#define CHNL_IMG_CTRL_CSC_MODE_RGB2YUV				2
+#define CHNL_IMG_CTRL_CSC_MODE_RGB2YCBCR			3
+#define CHNL_IMG_CTRL_CSC_BYPASS				BIT(0)
+
+/* Channel Output Buffer Control Register */
+#define CHNL_OUT_BUF_CTRL					0x0008
+#define CHNL_OUT_BUF_CTRL_LOAD_BUF2_ADDR			BIT(15)
+#define CHNL_OUT_BUF_CTRL_LOAD_BUF1_ADDR			BIT(14)
+#define CHNL_OUT_BUF_CTRL_OFLW_PANIC_SET_THD_V(n)		((n) << 6)
+#define CHNL_OUT_BUF_CTRL_OFLW_PANIC_SET_THD_V_MASK		GENMASK(7, 6)
+#define CHNL_OUT_BUF_CTRL_OFLW_PANIC_SET_THD_V_NO_PANIC		0
+#define CHNL_OUT_BUF_CTRL_OFLW_PANIC_SET_THD_V_PANIC_25		1
+#define CHNL_OUT_BUF_CTRL_OFLW_PANIC_SET_THD_V_PANIC_50		2
+#define CHNL_OUT_BUF_CTRL_OFLW_PANIC_SET_THD_V_PANIC_75		3
+#define CHNL_OUT_BUF_CTRL_OFLW_PANIC_SET_THD_U(n)		((n) << 3)
+#define CHNL_OUT_BUF_CTRL_OFLW_PANIC_SET_THD_U_MASK		GENMASK(4, 3)
+#define CHNL_OUT_BUF_CTRL_OFLW_PANIC_SET_THD_U_NO_PANIC		0
+#define CHNL_OUT_BUF_CTRL_OFLW_PANIC_SET_THD_U_PANIC_25		1
+#define CHNL_OUT_BUF_CTRL_OFLW_PANIC_SET_THD_U_PANIC_50		2
+#define CHNL_OUT_BUF_CTRL_OFLW_PANIC_SET_THD_U_PANIC_75		3
+#define CHNL_OUT_BUF_CTRL_OFLW_PANIC_SET_THD_Y(n)		((n) << 0)
+#define CHNL_OUT_BUF_CTRL_OFLW_PANIC_SET_THD_Y_MASK		GENMASK(1, 0)
+#define CHNL_OUT_BUF_CTRL_OFLW_PANIC_SET_THD_Y_NO_PANIC		0
+#define CHNL_OUT_BUF_CTRL_OFLW_PANIC_SET_THD_Y_PANIC_25		1
+#define CHNL_OUT_BUF_CTRL_OFLW_PANIC_SET_THD_Y_PANIC_50		2
+#define CHNL_OUT_BUF_CTRL_OFLW_PANIC_SET_THD_Y_PANIC_75		3
+
+/* Channel Image Configuration */
+#define CHNL_IMG_CFG						0x000c
+#define CHNL_IMG_CFG_HEIGHT(n)					((n) << 16)
+#define CHNL_IMG_CFG_HEIGHT_MASK				GENMASK(28, 16)
+#define CHNL_IMG_CFG_WIDTH(n)					((n) << 0)
+#define CHNL_IMG_CFG_WIDTH_MASK					GENMASK(12, 0)
+
+/* Channel Interrupt Enable Register */
+#define CHNL_IER						0x0010
+#define CHNL_IER_MEM_RD_DONE_EN					BIT(31)
+#define CHNL_IER_LINE_RCVD_EN					BIT(30)
+#define CHNL_IER_FRM_RCVD_EN					BIT(29)
+#define CHNL_IER_AXI_WR_ERR_V_EN				BIT(28)
+#define CHNL_IER_AXI_WR_ERR_U_EN				BIT(27)
+#define CHNL_IER_AXI_WR_ERR_Y_EN				BIT(26)
+#define CHNL_IER_AXI_RD_ERR_EN					BIT(25)
+
+/* Channel Status Register */
+#define CHNL_STS						0x0014
+#define CHNL_STS_MEM_RD_DONE					BIT(31)
+#define CHNL_STS_LINE_STRD					BIT(30)
+#define CHNL_STS_FRM_STRD					BIT(29)
+#define CHNL_STS_AXI_WR_ERR_V					BIT(28)
+#define CHNL_STS_AXI_WR_ERR_U					BIT(27)
+#define CHNL_STS_AXI_WR_ERR_Y					BIT(26)
+#define CHNL_STS_AXI_RD_ERR					BIT(25)
+#define CHNL_STS_OFLW_PANIC_V_BUF				BIT(24)
+#define CHNL_STS_EXCS_OFLW_V_BUF				BIT(23)
+#define CHNL_STS_OFLW_V_BUF					BIT(22)
+#define CHNL_STS_OFLW_PANIC_U_BUF				BIT(21)
+#define CHNL_STS_EXCS_OFLW_U_BUF				BIT(20)
+#define CHNL_STS_OFLW_U_BUF					BIT(19)
+#define CHNL_STS_OFLW_PANIC_Y_BUF				BIT(18)
+#define CHNL_STS_EXCS_OFLW_Y_BUF				BIT(17)
+#define CHNL_STS_OFLW_Y_BUF					BIT(16)
+#define CHNL_STS_EARLY_VSYNC_ERR				BIT(15)
+#define CHNL_STS_LATE_VSYNC_ERR					BIT(14)
+#define CHNL_STS_MEM_RD_OFLOW					BIT(10)
+#define CHNL_STS_BUF2_ACTIVE					BIT(9)
+#define CHNL_STS_BUF1_ACTIVE					BIT(8)
+#define CHNL_STS_OFLW_BYTES(n)					((n) << 0)
+#define CHNL_STS_OFLW_BYTES_MASK				GENMASK(7, 0)
+
+/* Channel Scale Factor Register */
+#define CHNL_SCALE_FACTOR					0x0018
+#define CHNL_SCALE_FACTOR_Y_SCALE(n)				((n) << 16)
+#define CHNL_SCALE_FACTOR_Y_SCALE_MASK				GENMASK(29, 16)
+#define CHNL_SCALE_FACTOR_X_SCALE(n)				((n) << 0)
+#define CHNL_SCALE_FACTOR_X_SCALE_MASK				GENMASK(13, 0)
+
+/* Channel Scale Offset Register */
+#define CHNL_SCALE_OFFSET					0x001c
+#define CHNL_SCALE_OFFSET_Y_SCALE(n)				((n) << 16)
+#define CHNL_SCALE_OFFSET_Y_SCALE_MASK				GENMASK(27, 16)
+#define CHNL_SCALE_OFFSET_X_SCALE(n)				((n) << 0)
+#define CHNL_SCALE_OFFSET_X_SCALE_MASK				GENMASK(11, 0)
+
+/* Channel Crop Upper Left Corner Coordinate Register */
+#define CHNL_CROP_ULC						0x0020
+#define CHNL_CROP_ULC_X(n)					((n) << 16)
+#define CHNL_CROP_ULC_X_MASK					GENMASK(27, 16)
+#define CHNL_CROP_ULC_Y(n)					((n) << 0)
+#define CHNL_CROP_ULC_Y_MASK					GENMASK(11, 0)
+
+/* Channel Crop Lower Right Corner Coordinate Register */
+#define CHNL_CROP_LRC						0x0024
+#define CHNL_CROP_LRC_X(n)					((n) << 16)
+#define CHNL_CROP_LRC_X_MASK					GENMASK(27, 16)
+#define CHNL_CROP_LRC_Y(n)					((n) << 0)
+#define CHNL_CROP_LRC_Y_MASK					GENMASK(11, 0)
+
+/* Channel Color Space Conversion Coefficient Register 0 */
+#define CHNL_CSC_COEFF0						0x0028
+#define CHNL_CSC_COEFF0_A2(n)					((n) << 16)
+#define CHNL_CSC_COEFF0_A2_MASK					GENMASK(26, 16)
+#define CHNL_CSC_COEFF0_A1(n)					((n) << 0)
+#define CHNL_CSC_COEFF0_A1_MASK					GENMASK(10, 0)
+
+/* Channel Color Space Conversion Coefficient Register 1 */
+#define CHNL_CSC_COEFF1						0x002c
+#define CHNL_CSC_COEFF1_B1(n)					((n) << 16)
+#define CHNL_CSC_COEFF1_B1_MASK					GENMASK(26, 16)
+#define CHNL_CSC_COEFF1_A3(n)					((n) << 0)
+#define CHNL_CSC_COEFF1_A3_MASK					GENMASK(10, 0)
+
+/* Channel Color Space Conversion Coefficient Register 2 */
+#define CHNL_CSC_COEFF2						0x0030
+#define CHNL_CSC_COEFF2_B3(n)					((n) << 16)
+#define CHNL_CSC_COEFF2_B3_MASK					GENMASK(26, 16)
+#define CHNL_CSC_COEFF2_B2(n)					((n) << 0)
+#define CHNL_CSC_COEFF2_B2_MASK					GENMASK(10, 0)
+
+/* Channel Color Space Conversion Coefficient Register 3 */
+#define CHNL_CSC_COEFF3						0x0034
+#define CHNL_CSC_COEFF3_C2(n)					((n) << 16)
+#define CHNL_CSC_COEFF3_C2_MASK					GENMASK(26, 16)
+#define CHNL_CSC_COEFF3_C1(n)					((n) << 0)
+#define CHNL_CSC_COEFF3_C1_MASK					GENMASK(10, 0)
+
+/* Channel Color Space Conversion Coefficient Register 4 */
+#define CHNL_CSC_COEFF4						0x0038
+#define CHNL_CSC_COEFF4_D1(n)					((n) << 16)
+#define CHNL_CSC_COEFF4_D1_MASK					GENMASK(24, 16)
+#define CHNL_CSC_COEFF4_C3(n)					((n) << 0)
+#define CHNL_CSC_COEFF4_C3_MASK					GENMASK(10, 0)
+
+/* Channel Color Space Conversion Coefficient Register 5 */
+#define CHNL_CSC_COEFF5						0x003c
+#define CHNL_CSC_COEFF5_D3(n)					((n) << 16)
+#define CHNL_CSC_COEFF5_D3_MASK					GENMASK(24, 16)
+#define CHNL_CSC_COEFF5_D2(n)					((n) << 0)
+#define CHNL_CSC_COEFF5_D2_MASK					GENMASK(8, 0)
+
+/* Channel Alpha Value Register for ROI 0 */
+#define CHNL_ROI_0_ALPHA					0x0040
+#define CHNL_ROI_0_ALPHA_VAL(n)					((n) << 24)
+#define CHNL_ROI_0_ALPHA_MASK					GENMASK(31, 24)
+#define CHNL_ROI_0_ALPHA_EN					BIT(16)
+
+/* Channel Upper Left Coordinate Register for ROI 0 */
+#define CHNL_ROI_0_ULC						0x0044
+#define CHNL_ROI_0_ULC_X(n)					((n) << 16)
+#define CHNL_ROI_0_ULC_X_MASK					GENMASK(27, 16)
+#define CHNL_ROI_0_ULC_Y(n)					((n) << 0)
+#define CHNL_ROI_0_ULC_Y_MASK					GENMASK(11, 0)
+
+/* Channel Lower Right Coordinate Register for ROI 0 */
+#define CHNL_ROI_0_LRC						0x0048
+#define CHNL_ROI_0_LRC_X(n)					((n) << 16)
+#define CHNL_ROI_0_LRC_X_MASK					GENMASK(27, 16)
+#define CHNL_ROI_0_LRC_Y(n)					((n) << 0)
+#define CHNL_ROI_0_LRC_Y_MASK					GENMASK(11, 0)
+
+/* Channel Alpha Value Register for ROI 1 */
+#define CHNL_ROI_1_ALPHA					0x004c
+#define CHNL_ROI_1_ALPHA_VAL(n)					((n) << 24)
+#define CHNL_ROI_1_ALPHA_MASK					GENMASK(31, 24)
+#define CHNL_ROI_1_ALPHA_EN					BIT(16)
+
+/* Channel Upper Left Coordinate Register for ROI 1 */
+#define CHNL_ROI_1_ULC						0x0050
+#define CHNL_ROI_1_ULC_X(n)					((n) << 16)
+#define CHNL_ROI_1_ULC_X_MASK					GENMASK(27, 16)
+#define CHNL_ROI_1_ULC_Y(n)					((n) << 0)
+#define CHNL_ROI_1_ULC_Y_MASK					GENMASK(11, 0)
+
+/* Channel Lower Right Coordinate Register for ROI 1 */
+#define CHNL_ROI_1_LRC						0x0054
+#define CHNL_ROI_1_LRC_X(n)					((n) << 16)
+#define CHNL_ROI_1_LRC_X_MASK					GENMASK(27, 16)
+#define CHNL_ROI_1_LRC_Y(n)					((n) << 0)
+#define CHNL_ROI_1_LRC_Y_MASK					GENMASK(11, 0)
+
+/* Channel Alpha Value Register for ROI 2 */
+#define CHNL_ROI_2_ALPHA					0x0058
+#define CHNL_ROI_2_ALPHA_VAL(n)					((n) << 24)
+#define CHNL_ROI_2_ALPHA_MASK					GENMASK(31, 24)
+#define CHNL_ROI_2_ALPHA_EN					BIT(16)
+
+/* Channel Upper Left Coordinate Register for ROI 2 */
+#define CHNL_ROI_2_ULC						0x005c
+#define CHNL_ROI_2_ULC_X(n)					((n) << 16)
+#define CHNL_ROI_2_ULC_X_MASK					GENMASK(27, 16)
+#define CHNL_ROI_2_ULC_Y(n)					((n) << 0)
+#define CHNL_ROI_2_ULC_Y_MASK					GENMASK(11, 0)
+
+/* Channel Lower Right Coordinate Register for ROI 2 */
+#define CHNL_ROI_2_LRC						0x0060
+#define CHNL_ROI_2_LRC_X(n)					((n) << 16)
+#define CHNL_ROI_2_LRC_X_MASK					GENMASK(27, 16)
+#define CHNL_ROI_2_LRC_Y(n)					((n) << 0)
+#define CHNL_ROI_2_LRC_Y_MASK					GENMASK(11, 0)
+
+/* Channel Alpha Value Register for ROI 3 */
+#define CHNL_ROI_3_ALPHA					0x0064
+#define CHNL_ROI_3_ALPHA_VAL(n)					((n) << 24)
+#define CHNL_ROI_3_ALPHA_MASK					GENMASK(31, 24)
+#define CHNL_ROI_3_ALPHA_EN					BIT(16)
+
+/* Channel Upper Left Coordinate Register for ROI 3 */
+#define CHNL_ROI_3_ULC						0x0068
+#define CHNL_ROI_3_ULC_X(n)					((n) << 16)
+#define CHNL_ROI_3_ULC_X_MASK					GENMASK(27, 16)
+#define CHNL_ROI_3_ULC_Y(n)					((n) << 0)
+#define CHNL_ROI_3_ULC_Y_MASK					GENMASK(11, 0)
+
+/* Channel Lower Right Coordinate Register for ROI 3 */
+#define CHNL_ROI_3_LRC						0x006c
+#define CHNL_ROI_3_LRC_X(n)					((n) << 16)
+#define CHNL_ROI_3_LRC_X_MASK					GENMASK(27, 16)
+#define CHNL_ROI_3_LRC_Y(n)					((n) << 0)
+#define CHNL_ROI_3_LRC_Y_MASK					GENMASK(11, 0)
+/* Channel RGB or Luma (Y) Output Buffer 1 Address */
+#define CHNL_OUT_BUF1_ADDR_Y					0x0070
+
+/* Channel Chroma (U/Cb/UV/CbCr) Output Buffer 1 Address */
+#define CHNL_OUT_BUF1_ADDR_U					0x0074
+
+/* Channel Chroma (V/Cr) Output Buffer 1 Address */
+#define CHNL_OUT_BUF1_ADDR_V					0x0078
+
+/* Channel Output Buffer Pitch */
+#define CHNL_OUT_BUF_PITCH					0x007c
+#define CHNL_OUT_BUF_PITCH_LINE_PITCH(n)			((n) << 0)
+#define CHNL_OUT_BUF_PITCH_LINE_PITCH_MASK			GENMASK(15, 0)
+
+/* Channel Input Buffer Address */
+#define CHNL_IN_BUF_ADDR					0x0080
+
+/* Channel Input Buffer Pitch */
+#define CHNL_IN_BUF_PITCH					0x0084
+#define CHNL_IN_BUF_PITCH_FRM_PITCH(n)				((n) << 16)
+#define CHNL_IN_BUF_PITCH_FRM_PITCH_MASK			GENMASK(31, 16)
+#define CHNL_IN_BUF_PITCH_LINE_PITCH(n)				((n) << 0)
+#define CHNL_IN_BUF_PITCH_LINE_PITCH_MASK			GENMASK(15, 0)
+
+/* Channel Memory Read Control */
+#define CHNL_MEM_RD_CTRL					0x0088
+#define CHNL_MEM_RD_CTRL_IMG_TYPE(n)				((n) << 28)
+#define CHNL_MEM_RD_CTRL_IMG_TYPE_MASK				GENMASK(31, 28)
+#define CHNL_MEM_RD_CTRL_IMG_TYPE_BGR8P				0x00
+#define CHNL_MEM_RD_CTRL_IMG_TYPE_RGB8P				0x01
+#define CHNL_MEM_RD_CTRL_IMG_TYPE_XRGB8				0x02
+#define CHNL_MEM_RD_CTRL_IMG_TYPE_RGBX8				0x03
+#define CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8				0x04
+#define CHNL_MEM_RD_CTRL_IMG_TYPE_RGB565			0x05
+#define CHNL_MEM_RD_CTRL_IMG_TYPE_A2BGR10			0x06
+#define CHNL_MEM_RD_CTRL_IMG_TYPE_A2RGB10			0x07
+#define CHNL_MEM_RD_CTRL_IMG_TYPE_YUV444_1P8P			0x08
+#define CHNL_MEM_RD_CTRL_IMG_TYPE_YUV444_1P10			0x09
+#define CHNL_MEM_RD_CTRL_IMG_TYPE_YUV444_1P10P			0x0a
+#define CHNL_MEM_RD_CTRL_IMG_TYPE_YUV444_1P12			0x0b
+#define CHNL_MEM_RD_CTRL_IMG_TYPE_YUV444_1P8			0x0c
+#define CHNL_MEM_RD_CTRL_IMG_TYPE_YUV422_1P8P			0x0d
+#define CHNL_MEM_RD_CTRL_IMG_TYPE_YUV422_1P10			0x0e
+#define CHNL_MEM_RD_CTRL_IMG_TYPE_YUV422_1P12			0x0f
+#define CHNL_MEM_RD_CTRL_READ_MEM				BIT(0)
+
+/* Channel RGB or Luma (Y) Output Buffer 2 Address */
+#define CHNL_OUT_BUF2_ADDR_Y					0x008c
+
+/* Channel Chroma (U/Cb/UV/CbCr) Output Buffer 2 Address  */
+#define CHNL_OUT_BUF2_ADDR_U					0x0090
+
+/* Channel Chroma (V/Cr) Output Buffer 2 Address   */
+#define CHNL_OUT_BUF2_ADDR_V					0x0094
+
+/* Channel scale image config */
+#define CHNL_SCL_IMG_CFG					0x0098
+#define CHNL_SCL_IMG_CFG_HEIGHT(n)				((n) << 16)
+#define CHNL_SCL_IMG_CFG_HEIGHT_MASK				GENMASK(28, 16)
+#define CHNL_SCL_IMG_CFG_WIDTH(n)				((n) << 0)
+#define CHNL_SCL_IMG_CFG_WIDTH_MASK				GENMASK(12, 0)
+
+/* Channel Flow Control Register */
+#define CHNL_FLOW_CTRL						0x009c
+#define CHNL_FLOW_CTRL_FC_DENOM_MASK				GENMASK(7, 0)
+#define CHNL_FLOW_CTRL_FC_DENOM(n)				((n) << 0)
+#define CHNL_FLOW_CTRL_FC_NUMER_MASK				GENMASK(23, 16)
+#define CHNL_FLOW_CTRL_FC_NUMER(n)				((n) << 0)
+
+/* Channel Output Y-Buffer 1 Extended Address Bits */
+#define CHNL_Y_BUF1_XTND_ADDR					0x00a0
+
+/* Channel Output U-Buffer 1 Extended Address Bits */
+#define CHNL_U_BUF1_XTND_ADDR					0x00a4
+
+/* Channel Output V-Buffer 1 Extended Address Bits */
+#define CHNL_V_BUF1_XTND_ADDR					0x00a8
+
+/* Channel Output Y-Buffer 2 Extended Address Bits */
+#define CHNL_Y_BUF2_XTND_ADDR					0x00ac
+
+/* Channel Output U-Buffer 2 Extended Address Bits */
+#define CHNL_U_BUF2_XTND_ADDR					0x00b0
+
+/* Channel Output V-Buffer 2 Extended Address Bits */
+#define CHNL_V_BUF2_XTND_ADDR					0x00b4
+
+/* Channel Input Buffer Extended Address Bits */
+#define CHNL_IN_BUF_XTND_ADDR					0x00b8
+
+#endif /* __IMX8_ISI_REGS_H__ */
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
new file mode 100644
index 000000000000..10840c9a0912
--- /dev/null
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -0,0 +1,1512 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * V4L2 Capture ISI subdev driver for i.MX8QXP/QM platform
+ *
+ * ISI is a Image Sensor Interface of i.MX8QXP/QM platform, which
+ * used to process image from camera sensor to memory or DC
+ *
+ * Copyright (c) 2019 NXP Semiconductor
+ */
+
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/media-bus-format.h>
+#include <linux/minmax.h>
+#include <linux/pm_runtime.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/videodev2.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-dma-contig.h>
+#include <media/videobuf2-v4l2.h>
+
+#include "imx8-isi-core.h"
+#include "imx8-isi-regs.h"
+
+/* Keep the first entry matching MXC_ISI_DEF_PIXEL_FORMAT */
+static const struct mxc_isi_format_info mxc_isi_formats[] = {
+	/* YUV formats */
+	{
+		.mbus_code	= MEDIA_BUS_FMT_YUV8_1X24,
+		.fourcc		= V4L2_PIX_FMT_YUYV,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_YUV422_1P8P,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_YUV422_1P8P,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_YUV,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_YUV8_1X24,
+		.fourcc		= V4L2_PIX_FMT_YUVA32,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_YUV444_1P8,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_YUV,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_YUV8_1X24,
+		.fourcc		= V4L2_PIX_FMT_NV12,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_YUV420_2P8P,
+		.color_planes	= 2,
+		.mem_planes	= 1,
+		.depth		= { 8, 16 },
+		.hsub		= 2,
+		.vsub		= 2,
+		.encoding	= MXC_ISI_ENC_YUV,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_YUV8_1X24,
+		.fourcc		= V4L2_PIX_FMT_NV12M,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_YUV420_2P8P,
+		.mem_planes	= 2,
+		.color_planes	= 2,
+		.depth		= { 8, 16 },
+		.hsub		= 2,
+		.vsub		= 2,
+		.encoding	= MXC_ISI_ENC_YUV,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_YUV8_1X24,
+		.fourcc		= V4L2_PIX_FMT_NV16,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_YUV422_2P8P,
+		.color_planes	= 2,
+		.mem_planes	= 1,
+		.depth		= { 8, 16 },
+		.hsub		= 2,
+		.vsub		= 1,
+		.encoding	= MXC_ISI_ENC_YUV,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_YUV8_1X24,
+		.fourcc		= V4L2_PIX_FMT_NV16M,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_YUV422_2P8P,
+		.mem_planes	= 2,
+		.color_planes	= 2,
+		.depth		= { 8, 16 },
+		.hsub		= 2,
+		.vsub		= 1,
+		.encoding	= MXC_ISI_ENC_YUV,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_YUV8_1X24,
+		.fourcc		= V4L2_PIX_FMT_YUV444M,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_YUV444_3P8P,
+		.mem_planes	= 3,
+		.color_planes	= 3,
+		.depth		= { 8, 8, 8 },
+		.hsub		= 1,
+		.vsub		= 1,
+		.encoding	= MXC_ISI_ENC_YUV,
+	},
+	/* RGB formats */
+	{
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_RGB565,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_RGB565,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RGB565,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_RGB24,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_BGR8P,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_BGR888P,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 24 },
+		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_BGR24,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_RGB8P,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RGB888P,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 24 },
+		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_XBGR32,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_XRGB888,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_ABGR32,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_ARGB8888,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_RGB,
+	},
+	/*
+	 * RAW formats
+	 *
+	 * The ISI shifts the 10-bit and 12-bit formats left by 6 and 4 bits
+	 * when using CHNL_IMG_CTRL_FORMAT_RAW10 or MXC_ISI_OUT_FMT_RAW12
+	 * respectively, to align the bits to the left and pad with zeros in
+	 * the LSBs. The corresponding V4L2 formats are however right-aligned,
+	 * we have to use CHNL_IMG_CTRL_FORMAT_RAW16 to avoid the left shift.
+	 */
+	{
+		.mbus_code	= MEDIA_BUS_FMT_Y8_1X8,
+		.fourcc		= V4L2_PIX_FMT_GREY,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW8,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 8 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
+		.fourcc		= V4L2_PIX_FMT_Y10,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_Y12_1X12,
+		.fourcc		= V4L2_PIX_FMT_Y12,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_Y14_1X14,
+		.fourcc		= V4L2_PIX_FMT_Y14,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
+		.fourcc		= V4L2_PIX_FMT_SBGGR8,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW8,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 8 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG8_1X8,
+		.fourcc		= V4L2_PIX_FMT_SGBRG8,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW8,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 8 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG8_1X8,
+		.fourcc		= V4L2_PIX_FMT_SGRBG8,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW8,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 8 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB8_1X8,
+		.fourcc		= V4L2_PIX_FMT_SRGGB8,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW8,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 8 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
+		.fourcc		= V4L2_PIX_FMT_SBGGR10,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
+		.fourcc		= V4L2_PIX_FMT_SGBRG10,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
+		.fourcc		= V4L2_PIX_FMT_SGRBG10,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
+		.fourcc		= V4L2_PIX_FMT_SRGGB10,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
+		.fourcc		= V4L2_PIX_FMT_SBGGR12,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
+		.fourcc		= V4L2_PIX_FMT_SGBRG12,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
+		.fourcc		= V4L2_PIX_FMT_SGRBG12,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
+		.fourcc		= V4L2_PIX_FMT_SRGGB12,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR14_1X14,
+		.fourcc		= V4L2_PIX_FMT_SBGGR14,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG14_1X14,
+		.fourcc		= V4L2_PIX_FMT_SGBRG14,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG14_1X14,
+		.fourcc		= V4L2_PIX_FMT_SGRBG14,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB14_1X14,
+		.fourcc		= V4L2_PIX_FMT_SRGGB14,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	},
+	/* JPEG */
+	{
+		.mbus_code	= MEDIA_BUS_FMT_JPEG_1X8,
+		.fourcc		= V4L2_PIX_FMT_MJPEG,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW8,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 8 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}
+};
+
+const struct mxc_isi_format_info *
+mxc_isi_format_by_fourcc(u32 fourcc, enum mxc_isi_video_type type)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mxc_isi_formats); i++) {
+		const struct mxc_isi_format_info *fmt = &mxc_isi_formats[i];
+
+		if (fmt->fourcc == fourcc && fmt->type & type)
+			return fmt;
+	}
+
+	return NULL;
+}
+
+const struct mxc_isi_format_info *
+mxc_isi_format_enum(unsigned int index, enum mxc_isi_video_type type)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mxc_isi_formats); i++) {
+		const struct mxc_isi_format_info *fmt = &mxc_isi_formats[i];
+
+		if (!(fmt->type & type))
+			continue;
+
+		if (!index)
+			return fmt;
+
+		index--;
+	}
+
+	return NULL;
+}
+
+const struct mxc_isi_format_info *
+mxc_isi_format_try(struct mxc_isi_pipe *pipe, struct v4l2_pix_format_mplane *pix,
+		   enum mxc_isi_video_type type)
+{
+	const struct mxc_isi_format_info *fmt;
+	unsigned int max_width;
+	unsigned int i;
+
+	max_width = pipe->id == pipe->isi->pdata->num_channels - 1
+		  ? MXC_ISI_MAX_WIDTH_UNCHAINED
+		  : MXC_ISI_MAX_WIDTH_CHAINED;
+
+	fmt = mxc_isi_format_by_fourcc(pix->pixelformat, type);
+	if (!fmt)
+		fmt = &mxc_isi_formats[0];
+
+	pix->width = clamp(pix->width, MXC_ISI_MIN_WIDTH, max_width);
+	pix->height = clamp(pix->height, MXC_ISI_MIN_HEIGHT, MXC_ISI_MAX_HEIGHT);
+	pix->pixelformat = fmt->fourcc;
+	pix->field = V4L2_FIELD_NONE;
+
+	if (pix->colorspace == V4L2_COLORSPACE_DEFAULT) {
+		pix->colorspace = MXC_ISI_DEF_COLOR_SPACE;
+		pix->ycbcr_enc = MXC_ISI_DEF_YCBCR_ENC;
+		pix->quantization = MXC_ISI_DEF_QUANTIZATION;
+		pix->xfer_func = MXC_ISI_DEF_XFER_FUNC;
+	}
+
+	if (pix->ycbcr_enc == V4L2_YCBCR_ENC_DEFAULT)
+		pix->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(pix->colorspace);
+	if (pix->quantization == V4L2_QUANTIZATION_DEFAULT) {
+		bool is_rgb = fmt->encoding == MXC_ISI_ENC_RGB;
+
+		pix->quantization =
+			V4L2_MAP_QUANTIZATION_DEFAULT(is_rgb, pix->colorspace,
+						      pix->ycbcr_enc);
+	}
+	if (pix->xfer_func == V4L2_XFER_FUNC_DEFAULT)
+		pix->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(pix->colorspace);
+
+	pix->num_planes = fmt->mem_planes;
+
+	for (i = 0; i < fmt->color_planes; ++i) {
+		struct v4l2_plane_pix_format *plane = &pix->plane_fmt[i];
+		unsigned int bpl;
+
+		/* The pitch must be identical for all planes. */
+		if (i == 0)
+			bpl = clamp(plane->bytesperline,
+				    pix->width * fmt->depth[0] / 8,
+				    65535U);
+		else
+			bpl = pix->plane_fmt[0].bytesperline;
+
+		plane->bytesperline = bpl;
+
+		plane->sizeimage = plane->bytesperline * pix->height;
+		if (i >= 1)
+			plane->sizeimage /= fmt->vsub;
+	}
+
+	/*
+	 * For single-planar pixel formats with multiple color planes,
+	 * concatenate the size of all planes and clear all planes but the
+	 * first one.
+	 */
+	if (fmt->color_planes != fmt->mem_planes) {
+		for (i = 1; i < fmt->color_planes; ++i) {
+			struct v4l2_plane_pix_format *plane = &pix->plane_fmt[i];
+
+			pix->plane_fmt[0].sizeimage += plane->sizeimage;
+			plane->bytesperline = 0;
+			plane->sizeimage = 0;
+		}
+	}
+
+	return fmt;
+}
+
+/* -----------------------------------------------------------------------------
+ * videobuf2 queue operations
+ */
+
+static void mxc_isi_video_frame_write_done(struct mxc_isi_pipe *pipe,
+					   u32 status)
+{
+	struct mxc_isi_video *video = &pipe->video;
+	struct device *dev = pipe->isi->dev;
+	struct mxc_isi_buffer *next_buf;
+	struct mxc_isi_buffer *buf;
+	enum mxc_isi_buf_id buf_id;
+
+	spin_lock(&video->buf_lock);
+
+	/*
+	 * The ISI hardware handles buffers using a ping-pong mechanism with
+	 * two sets of destination addresses (with shadow registers to allow
+	 * programming addresses for all planes atomically) named BUF1 and
+	 * BUF2. Addresses can be loaded and copied to shadow registers at any
+	 * at any time.
+	 *
+	 * The hardware keeps track of which buffer is being written to and
+	 * automatically switches to the other buffer at frame end, copying the
+	 * corresponding address to another set of shadow registers that track
+	 * the address being written to. The active buffer tracking bits are
+	 * accessible through the CHNL_STS register.
+	 *
+	 *  BUF1        BUF2  |   Event   | Action
+	 *                    |           |
+	 *                    |           | Program initial buffers
+	 *                    |           | B0 in BUF1, B1 in BUF2
+	 *                    | Start ISI |
+	 * +----+             |           |
+	 * | B0 |             |           |
+	 * +----+             |           |
+	 *             +----+ | FRM IRQ 0 | B0 complete, BUF2 now active
+	 *             | B1 | |           | Program B2 in BUF1
+	 *             +----+ |           |
+	 * +----+             | FRM IRQ 1 | B1 complete, BUF1 now active
+	 * | B2 |             |           | Program B3 in BUF2
+	 * +----+             |           |
+	 *             +----+ | FRM IRQ 2 | B2 complete, BUF2 now active
+	 *             | B3 | |           | Program B4 in BUF1
+	 *             +----+ |           |
+	 * +----+             | FRM IRQ 3 | B3 complete, BUF1 now active
+	 * | B4 |             |           | Program B5 in BUF2
+	 * +----+             |           |
+	 *        ...         |           |
+	 *
+	 * Races between address programming and buffer switching can be
+	 * detected by checking if a frame end interrupt occurred after
+	 * programming the addresses.
+	 *
+	 * As none of the shadow registers are accessible, races can occur
+	 * between address programming and buffer switching. It is possible to
+	 * detect the race condition by checking if a frame end interrupt
+	 * occurred after programming the addresses, but impossible to
+	 * determine if the race has been won or lost.
+	 *
+	 * In addition to this, we need to use discard buffers if no pending
+	 * buffers are available. To simplify handling of discard buffer, we
+	 * need to allocate three of them, as two can be active concurrently
+	 * and we need to still be able to get hold of a next buffer. The logic
+	 * could be improved to use two buffers only, but as all discard
+	 * buffers share the same memory, an additional buffer is cheap.
+	 */
+
+	/* Check which buffer has just completed. */
+	buf_id = pipe->isi->pdata->buf_active_reverse
+	       ? (status & CHNL_STS_BUF1_ACTIVE ? MXC_ISI_BUF2 : MXC_ISI_BUF1)
+	       : (status & CHNL_STS_BUF1_ACTIVE ? MXC_ISI_BUF1 : MXC_ISI_BUF2);
+
+	buf = list_first_entry_or_null(&video->out_active,
+				       struct mxc_isi_buffer, list);
+
+	/* Safety check, this should really never happen. */
+	if (!buf) {
+		dev_warn(dev, "trying to access empty active list\n");
+		goto done;
+	}
+
+	/*
+	 * If the buffer that has completed doesn't match the buffer on the
+	 * front of the active list, it means we have lost one frame end
+	 * interrupt (or possibly a large odd number of interrupts, although
+	 * quite unlikely).
+	 *
+	 * For instance, if IRQ1 is lost and we handle IRQ2, both B1 and B2
+	 * have been completed, but B3 hasn't been programmed, BUF2 still
+	 * addresses B1 and the ISI is now writing in B1 instead of B3. We
+	 * can't complete B2 as that would result in out-of-order completion.
+	 *
+	 * The only option is to ignore this interrupt and try again. When IRQ3
+	 * will be handled, we will complete B1 and be in sync again.
+	 */
+	if (buf->id != buf_id) {
+		dev_dbg(dev, "buffer ID mismatch (expected %u, got %u), skipping\n",
+			buf->id, buf_id);
+
+		/*
+		 * Increment the frame count by two to account for the missed
+		 * and the ignored interrupts.
+		 */
+		video->frame_count += 2;
+		goto done;
+	}
+
+	/* Pick the next buffer and queue it to the hardware. */
+	next_buf = list_first_entry_or_null(&video->out_pending,
+					    struct mxc_isi_buffer, list);
+	if (!next_buf) {
+		next_buf = list_first_entry_or_null(&video->out_discard,
+						    struct mxc_isi_buffer, list);
+
+		/* Safety check, this should never happen. */
+		if (!next_buf) {
+			dev_warn(dev, "trying to access empty discard list\n");
+			goto done;
+		}
+	}
+
+	mxc_isi_channel_set_outbuf(pipe, next_buf->dma_addrs, buf_id);
+	next_buf->id = buf_id;
+
+	/*
+	 * Check if we have raced with the end of frame interrupt. If so, we
+	 * can't tell if the ISI has recorded the new address, or is still
+	 * using the previous buffer. We must assume the latter as that is the
+	 * worst case.
+	 *
+	 * For instance, if we are handling IRQ1 and now detect the FRM
+	 * interrupt, assume B2 has completed and the ISI has switched to BUF2
+	 * using B1 just before we programmed B3. Unlike in the previous race
+	 * condition, B3 has been programmed and will be written to the next
+	 * time the ISI switches to BUF2. We can however handle this exactly as
+	 * the first race condition, as we'll program B3 (still at the head of
+	 * the pending list) when handling IRQ3.
+	 */
+	status = mxc_isi_channel_irq_status(pipe, false);
+	if (status & CHNL_STS_FRM_STRD) {
+		dev_dbg(dev, "raced with frame end interrupt\n");
+		video->frame_count += 2;
+		goto done;
+	}
+
+	/*
+	 * The next buffer has been queued successfully, move it to the active
+	 * list, and complete the current buffer.
+	 */
+	list_move_tail(&next_buf->list, &video->out_active);
+
+	if (!buf->discard) {
+		list_del_init(&buf->list);
+		buf->v4l2_buf.sequence = video->frame_count;
+		buf->v4l2_buf.vb2_buf.timestamp = ktime_get_ns();
+		vb2_buffer_done(&buf->v4l2_buf.vb2_buf, VB2_BUF_STATE_DONE);
+	} else {
+		list_move_tail(&buf->list, &video->out_discard);
+	}
+
+	video->frame_count++;
+
+done:
+	spin_unlock(&video->buf_lock);
+}
+
+static void mxc_isi_video_free_discard_buffers(struct mxc_isi_video *video)
+{
+	unsigned int i;
+
+	for (i = 0; i < video->pix.num_planes; i++) {
+		struct mxc_isi_dma_buffer *buf = &video->discard_buffer[i];
+
+		if (!buf->addr)
+			continue;
+
+		dma_free_coherent(video->pipe->isi->dev, buf->size, buf->addr,
+				  buf->dma);
+		buf->addr = NULL;
+	}
+}
+
+static int mxc_isi_video_alloc_discard_buffers(struct mxc_isi_video *video)
+{
+	unsigned int i, j;
+
+	/* Allocate memory for each plane. */
+	for (i = 0; i < video->pix.num_planes; i++) {
+		struct mxc_isi_dma_buffer *buf = &video->discard_buffer[i];
+
+		buf->size = PAGE_ALIGN(video->pix.plane_fmt[i].sizeimage);
+		buf->addr = dma_alloc_coherent(video->pipe->isi->dev, buf->size,
+					       &buf->dma, GFP_DMA | GFP_KERNEL);
+		if (!buf->addr) {
+			mxc_isi_video_free_discard_buffers(video);
+			return -ENOMEM;
+		}
+
+		dev_dbg(video->pipe->isi->dev,
+			"discard buffer plane %u: %zu bytes @%pad (CPU address %p)\n",
+			i, buf->size, &buf->dma, buf->addr);
+	}
+
+	/* Fill the DMA addresses in the discard buffers. */
+	for (i = 0; i < ARRAY_SIZE(video->buf_discard); ++i) {
+		struct mxc_isi_buffer *buf = &video->buf_discard[i];
+
+		buf->discard = true;
+
+		for (j = 0; j < video->pix.num_planes; ++j)
+			buf->dma_addrs[j] = video->discard_buffer[j].dma;
+	}
+
+	return 0;
+}
+
+static int mxc_isi_video_validate_format(struct mxc_isi_video *video)
+{
+	const struct v4l2_mbus_framefmt *format;
+	const struct mxc_isi_format_info *info;
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev *sd = &video->pipe->sd;
+	int ret = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	info = mxc_isi_format_by_fourcc(video->pix.pixelformat,
+					MXC_ISI_VIDEO_CAP);
+	format = v4l2_subdev_get_try_format(sd, state, MXC_ISI_PIPE_PAD_SOURCE);
+
+	if (format->code != info->mbus_code ||
+	    format->width != video->pix.width ||
+	    format->height != video->pix.height) {
+		dev_dbg(video->pipe->isi->dev,
+			"%s: configuration mismatch, 0x%04x/%ux%u != 0x%04x/%ux%u\n",
+			__func__, format->code, format->width, format->height,
+			info->mbus_code, video->pix.width, video->pix.height);
+		ret = -EINVAL;
+	}
+
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
+static void mxc_isi_video_return_buffers(struct mxc_isi_video *video,
+					 enum vb2_buffer_state state)
+{
+	struct mxc_isi_buffer *buf;
+
+	spin_lock_irq(&video->buf_lock);
+
+	while (!list_empty(&video->out_active)) {
+		buf = list_first_entry(&video->out_active,
+				       struct mxc_isi_buffer, list);
+		list_del_init(&buf->list);
+		if (buf->discard)
+			continue;
+
+		vb2_buffer_done(&buf->v4l2_buf.vb2_buf, state);
+	}
+
+	while (!list_empty(&video->out_pending)) {
+		buf = list_first_entry(&video->out_pending,
+				       struct mxc_isi_buffer, list);
+		list_del_init(&buf->list);
+		vb2_buffer_done(&buf->v4l2_buf.vb2_buf, state);
+	}
+
+	while (!list_empty(&video->out_discard)) {
+		buf = list_first_entry(&video->out_discard,
+				       struct mxc_isi_buffer, list);
+		list_del_init(&buf->list);
+	}
+
+	INIT_LIST_HEAD(&video->out_active);
+	INIT_LIST_HEAD(&video->out_pending);
+	INIT_LIST_HEAD(&video->out_discard);
+
+	spin_unlock_irq(&video->buf_lock);
+}
+
+static void mxc_isi_video_queue_first_buffers(struct mxc_isi_video *video)
+{
+	unsigned int discard;
+	unsigned int i;
+
+	lockdep_assert_held(&video->buf_lock);
+
+	/*
+	 * Queue two ISI channel output buffers. We are not guaranteed to have
+	 * any buffer in the pending list when this function is called from the
+	 * system resume handler. Use pending buffers as much as possible, and
+	 * use discard buffers to fill the remaining slots.
+	 */
+
+	/* How many discard buffers do we need to queue first ? */
+	discard = list_empty(&video->out_pending) ? 2
+		: list_is_singular(&video->out_pending) ? 1
+		: 0;
+
+	for (i = 0; i < 2; ++i) {
+		enum mxc_isi_buf_id buf_id = i == 0 ? MXC_ISI_BUF1
+					   : MXC_ISI_BUF2;
+		struct mxc_isi_buffer *buf;
+		struct list_head *list;
+
+		list = i < discard ? &video->out_discard : &video->out_pending;
+		buf = list_first_entry(list, struct mxc_isi_buffer, list);
+
+		mxc_isi_channel_set_outbuf(video->pipe, buf->dma_addrs, buf_id);
+		buf->id = buf_id;
+		list_move_tail(&buf->list, &video->out_active);
+	}
+}
+
+static inline struct mxc_isi_buffer *to_isi_buffer(struct vb2_v4l2_buffer *v4l2_buf)
+{
+	return container_of(v4l2_buf, struct mxc_isi_buffer, v4l2_buf);
+}
+
+int mxc_isi_video_queue_setup(const struct v4l2_pix_format_mplane *format,
+			      const struct mxc_isi_format_info *info,
+			      unsigned int *num_buffers,
+			      unsigned int *num_planes, unsigned int sizes[])
+{
+	unsigned int i;
+
+	if (*num_planes) {
+		if (*num_planes != info->mem_planes)
+			return -EINVAL;
+
+		for (i = 0; i < info->mem_planes; ++i) {
+			if (sizes[i] < format->plane_fmt[i].sizeimage)
+				return -EINVAL;
+		}
+
+		return 0;
+	}
+
+	*num_planes = info->mem_planes;
+
+	for (i = 0; i < info->mem_planes; ++i)
+		sizes[i] = format->plane_fmt[i].sizeimage;
+
+	return 0;
+}
+
+void mxc_isi_video_buffer_init(struct vb2_buffer *vb2, dma_addr_t dma_addrs[3],
+			       const struct mxc_isi_format_info *info,
+			       const struct v4l2_pix_format_mplane *pix)
+{
+	unsigned int i;
+
+	for (i = 0; i < info->mem_planes; ++i)
+		dma_addrs[i] = vb2_dma_contig_plane_dma_addr(vb2, i);
+
+	/*
+	 * For single-planar pixel formats with multiple color planes, split
+	 * the buffer into color planes.
+	 */
+	if (info->color_planes != info->mem_planes) {
+		unsigned int size = pix->plane_fmt[0].bytesperline * pix->height;
+
+		for (i = 1; i < info->color_planes; ++i) {
+			unsigned int vsub = i > 1 ? info->vsub : 1;
+
+			dma_addrs[i] = dma_addrs[i - 1] + size / vsub;
+		}
+	}
+}
+
+int mxc_isi_video_buffer_prepare(struct mxc_isi_dev *isi, struct vb2_buffer *vb2,
+				 const struct mxc_isi_format_info *info,
+				 const struct v4l2_pix_format_mplane *pix)
+{
+	unsigned int i;
+
+	for (i = 0; i < info->mem_planes; i++) {
+		unsigned long size = pix->plane_fmt[i].sizeimage;
+
+		if (vb2_plane_size(vb2, i) < size) {
+			dev_err(isi->dev, "User buffer too small (%ld < %ld)\n",
+				vb2_plane_size(vb2, i), size);
+			return -EINVAL;
+		}
+
+		vb2_set_plane_payload(vb2, i, size);
+	}
+
+	return 0;
+}
+
+static int mxc_isi_vb2_queue_setup(struct vb2_queue *q,
+				   unsigned int *num_buffers,
+				   unsigned int *num_planes,
+				   unsigned int sizes[],
+				   struct device *alloc_devs[])
+{
+	struct mxc_isi_video *video = vb2_get_drv_priv(q);
+
+	return mxc_isi_video_queue_setup(&video->pix, video->fmtinfo,
+					 num_buffers, num_planes, sizes);
+}
+
+static int mxc_isi_vb2_buffer_init(struct vb2_buffer *vb2)
+{
+	struct mxc_isi_buffer *buf = to_isi_buffer(to_vb2_v4l2_buffer(vb2));
+	struct mxc_isi_video *video = vb2_get_drv_priv(vb2->vb2_queue);
+
+	mxc_isi_video_buffer_init(vb2, buf->dma_addrs, video->fmtinfo,
+				  &video->pix);
+
+	return 0;
+}
+
+static int mxc_isi_vb2_buffer_prepare(struct vb2_buffer *vb2)
+{
+	struct mxc_isi_video *video = vb2_get_drv_priv(vb2->vb2_queue);
+
+	return mxc_isi_video_buffer_prepare(video->pipe->isi, vb2,
+					    video->fmtinfo, &video->pix);
+}
+
+static void mxc_isi_vb2_buffer_queue(struct vb2_buffer *vb2)
+{
+	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb2);
+	struct mxc_isi_buffer *buf = to_isi_buffer(v4l2_buf);
+	struct mxc_isi_video *video = vb2_get_drv_priv(vb2->vb2_queue);
+
+	spin_lock_irq(&video->buf_lock);
+	list_add_tail(&buf->list, &video->out_pending);
+	spin_unlock_irq(&video->buf_lock);
+}
+
+static void mxc_isi_video_init_channel(struct mxc_isi_video *video)
+{
+	struct mxc_isi_pipe *pipe = video->pipe;
+
+	mxc_isi_channel_get(pipe);
+
+	mutex_lock(video->ctrls.handler.lock);
+	mxc_isi_channel_set_alpha(pipe, video->ctrls.alpha);
+	mxc_isi_channel_set_flip(pipe, video->ctrls.hflip, video->ctrls.vflip);
+	mutex_unlock(video->ctrls.handler.lock);
+
+	mxc_isi_channel_set_output_format(pipe, video->fmtinfo, &video->pix);
+}
+
+static int mxc_isi_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct mxc_isi_video *video = vb2_get_drv_priv(q);
+	unsigned int i;
+	int ret;
+
+	/* Initialize the ISI channel. */
+	mxc_isi_video_init_channel(video);
+
+	spin_lock_irq(&video->buf_lock);
+
+	/* Add the discard buffers to the out_discard list. */
+	for (i = 0; i < ARRAY_SIZE(video->buf_discard); ++i) {
+		struct mxc_isi_buffer *buf = &video->buf_discard[i];
+
+		list_add_tail(&buf->list, &video->out_discard);
+	}
+
+	/* Queue the first buffers. */
+	mxc_isi_video_queue_first_buffers(video);
+
+	/* Clear frame count */
+	video->frame_count = 0;
+
+	spin_unlock_irq(&video->buf_lock);
+
+	ret = mxc_isi_pipe_enable(video->pipe);
+	if (ret)
+		goto error;
+
+	return 0;
+
+error:
+	mxc_isi_channel_put(video->pipe);
+	mxc_isi_video_return_buffers(video, VB2_BUF_STATE_QUEUED);
+	return ret;
+}
+
+static void mxc_isi_vb2_stop_streaming(struct vb2_queue *q)
+{
+	struct mxc_isi_video *video = vb2_get_drv_priv(q);
+
+	mxc_isi_pipe_disable(video->pipe);
+	mxc_isi_channel_put(video->pipe);
+
+	mxc_isi_video_return_buffers(video, VB2_BUF_STATE_ERROR);
+}
+
+static const struct vb2_ops mxc_isi_vb2_qops = {
+	.queue_setup		= mxc_isi_vb2_queue_setup,
+	.buf_init		= mxc_isi_vb2_buffer_init,
+	.buf_prepare		= mxc_isi_vb2_buffer_prepare,
+	.buf_queue		= mxc_isi_vb2_buffer_queue,
+	.wait_prepare		= vb2_ops_wait_prepare,
+	.wait_finish		= vb2_ops_wait_finish,
+	.start_streaming	= mxc_isi_vb2_start_streaming,
+	.stop_streaming		= mxc_isi_vb2_stop_streaming,
+};
+
+/* -----------------------------------------------------------------------------
+ * V4L2 controls
+ */
+
+static inline struct mxc_isi_video *ctrl_to_isi_video(struct v4l2_ctrl *ctrl)
+{
+	return container_of(ctrl->handler, struct mxc_isi_video, ctrls.handler);
+}
+
+static int mxc_isi_video_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct mxc_isi_video *video = ctrl_to_isi_video(ctrl);
+
+	switch (ctrl->id) {
+	case V4L2_CID_ALPHA_COMPONENT:
+		video->ctrls.alpha = ctrl->val;
+		break;
+	case V4L2_CID_VFLIP:
+		video->ctrls.vflip = ctrl->val;
+		break;
+	case V4L2_CID_HFLIP:
+		video->ctrls.hflip = ctrl->val;
+		break;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops mxc_isi_video_ctrl_ops = {
+	.s_ctrl = mxc_isi_video_s_ctrl,
+};
+
+static int mxc_isi_video_ctrls_create(struct mxc_isi_video *video)
+{
+	struct v4l2_ctrl_handler *handler = &video->ctrls.handler;
+	int ret;
+
+	v4l2_ctrl_handler_init(handler, 3);
+
+	v4l2_ctrl_new_std(handler, &mxc_isi_video_ctrl_ops,
+			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 0);
+
+	v4l2_ctrl_new_std(handler, &mxc_isi_video_ctrl_ops,
+			  V4L2_CID_VFLIP, 0, 1, 1, 0);
+
+	v4l2_ctrl_new_std(handler, &mxc_isi_video_ctrl_ops,
+			  V4L2_CID_HFLIP, 0, 1, 1, 0);
+
+	if (handler->error) {
+		ret = handler->error;
+		v4l2_ctrl_handler_free(handler);
+		return ret;
+	}
+
+	video->vdev.ctrl_handler = handler;
+
+	return 0;
+}
+
+static void mxc_isi_video_ctrls_delete(struct mxc_isi_video *video)
+{
+	v4l2_ctrl_handler_free(&video->ctrls.handler);
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 ioctls
+ */
+
+static int mxc_isi_video_querycap(struct file *file, void *priv,
+				  struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, MXC_ISI_DRIVER_NAME, sizeof(cap->driver));
+	strscpy(cap->card, MXC_ISI_CAPTURE, sizeof(cap->card));
+
+	return 0;
+}
+
+static int mxc_isi_video_enum_fmt(struct file *file, void *priv,
+				  struct v4l2_fmtdesc *f)
+{
+	const struct mxc_isi_format_info *fmt;
+	unsigned int index = f->index;
+	unsigned int i;
+
+	if (f->mbus_code) {
+		/*
+		 * If a media bus code is specified, only enumerate formats
+		 * compatible with it.
+		 */
+		for (i = 0; i < ARRAY_SIZE(mxc_isi_formats); i++) {
+			fmt = &mxc_isi_formats[i];
+			if (fmt->mbus_code != f->mbus_code)
+				continue;
+
+			if (index == 0)
+				break;
+
+			index--;
+		}
+
+		if (i == ARRAY_SIZE(mxc_isi_formats))
+			return -EINVAL;
+	} else {
+		/* Otherwise, enumerate all formatS. */
+		if (f->index >= ARRAY_SIZE(mxc_isi_formats))
+			return -EINVAL;
+
+		fmt = &mxc_isi_formats[f->index];
+	}
+
+	f->pixelformat = fmt->fourcc;
+	f->flags |= V4L2_FMT_FLAG_CSC_COLORSPACE | V4L2_FMT_FLAG_CSC_YCBCR_ENC
+		 |  V4L2_FMT_FLAG_CSC_QUANTIZATION | V4L2_FMT_FLAG_CSC_XFER_FUNC;
+
+	return 0;
+}
+
+static int mxc_isi_video_g_fmt(struct file *file, void *fh,
+			       struct v4l2_format *f)
+{
+	struct mxc_isi_video *video = video_drvdata(file);
+
+	f->fmt.pix_mp = video->pix;
+
+	return 0;
+}
+
+static int mxc_isi_video_try_fmt(struct file *file, void *fh,
+				 struct v4l2_format *f)
+{
+	struct mxc_isi_video *video = video_drvdata(file);
+
+	mxc_isi_format_try(video->pipe, &f->fmt.pix_mp, MXC_ISI_VIDEO_CAP);
+	return 0;
+}
+
+static int mxc_isi_video_s_fmt(struct file *file, void *priv,
+			       struct v4l2_format *f)
+{
+	struct mxc_isi_video *video = video_drvdata(file);
+	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
+
+	if (vb2_is_busy(&video->vb2_q))
+		return -EBUSY;
+
+	video->fmtinfo = mxc_isi_format_try(video->pipe, pix, MXC_ISI_VIDEO_CAP);
+	video->pix = *pix;
+
+	return 0;
+}
+
+static int mxc_isi_video_streamon(struct file *file, void *priv,
+				  enum v4l2_buf_type type)
+{
+	struct mxc_isi_video *video = video_drvdata(file);
+	struct media_device *mdev = &video->pipe->isi->media_dev;
+	struct media_pipeline *pipe;
+	int ret;
+
+	if (vb2_queue_is_busy(&video->vb2_q, file))
+		return -EBUSY;
+
+	/*
+	 * Get a pipeline for the video node and start it. This must be done
+	 * here and not in the queue .start_streaming() handler, so that
+	 * pipeline start errors can be reported from VIDIOC_STREAMON and not
+	 * delayed until subsequent VIDIOC_QBUF calls.
+	 */
+	mutex_lock(&mdev->graph_mutex);
+
+	ret = mxc_isi_pipe_acquire(video->pipe, &mxc_isi_video_frame_write_done);
+	if (ret) {
+		mutex_unlock(&mdev->graph_mutex);
+		return ret;
+	}
+
+	pipe = media_entity_pipeline(&video->vdev.entity) ? : &video->pipe->pipe;
+
+	ret = __video_device_pipeline_start(&video->vdev, pipe);
+	if (ret) {
+		mutex_unlock(&mdev->graph_mutex);
+		goto err_release;
+	}
+
+	mutex_unlock(&mdev->graph_mutex);
+
+	/* Verify that the video format matches the output of the subdev. */
+	ret = mxc_isi_video_validate_format(video);
+	if (ret)
+		goto err_stop;
+
+	/* Allocate buffers for discard operation. */
+	ret = mxc_isi_video_alloc_discard_buffers(video);
+	if (ret)
+		goto err_stop;
+
+	ret = vb2_streamon(&video->vb2_q, type);
+	if (ret)
+		goto err_free;
+
+	video->is_streaming = true;
+
+	return 0;
+
+err_free:
+	mxc_isi_video_free_discard_buffers(video);
+err_stop:
+	video_device_pipeline_stop(&video->vdev);
+err_release:
+	mxc_isi_pipe_release(video->pipe);
+	return ret;
+}
+
+static void mxc_isi_video_cleanup_streaming(struct mxc_isi_video *video)
+{
+	lockdep_assert_held(&video->lock);
+
+	if (!video->is_streaming)
+		return;
+
+	mxc_isi_video_free_discard_buffers(video);
+	video_device_pipeline_stop(&video->vdev);
+	mxc_isi_pipe_release(video->pipe);
+
+	video->is_streaming = false;
+}
+
+static int mxc_isi_video_streamoff(struct file *file, void *priv,
+				   enum v4l2_buf_type type)
+{
+	struct mxc_isi_video *video = video_drvdata(file);
+	int ret;
+
+	ret = vb2_ioctl_streamoff(file, priv, type);
+	if (ret)
+		return ret;
+
+	mxc_isi_video_cleanup_streaming(video);
+
+	return 0;
+}
+
+static int mxc_isi_video_enum_framesizes(struct file *file, void *priv,
+					 struct v4l2_frmsizeenum *fsize)
+{
+	struct mxc_isi_video *video = video_drvdata(file);
+	const struct mxc_isi_format_info *info;
+	unsigned int max_width;
+	unsigned int h_align;
+	unsigned int v_align;
+
+	if (fsize->index)
+		return -EINVAL;
+
+	info = mxc_isi_format_by_fourcc(fsize->pixel_format, MXC_ISI_VIDEO_CAP);
+	if (!info)
+		return -EINVAL;
+
+	h_align = max_t(unsigned int, info->hsub, 1);
+	v_align = max_t(unsigned int, info->vsub, 1);
+
+	max_width = video->pipe->id == video->pipe->isi->pdata->num_channels - 1
+		  ? MXC_ISI_MAX_WIDTH_UNCHAINED
+		  : MXC_ISI_MAX_WIDTH_CHAINED;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = ALIGN(MXC_ISI_MIN_WIDTH, h_align);
+	fsize->stepwise.min_height = ALIGN(MXC_ISI_MIN_HEIGHT, v_align);
+	fsize->stepwise.max_width = ALIGN_DOWN(max_width, h_align);
+	fsize->stepwise.max_height = ALIGN_DOWN(MXC_ISI_MAX_HEIGHT, v_align);
+	fsize->stepwise.step_width = h_align;
+	fsize->stepwise.step_height = v_align;
+
+	/*
+	 * The width can be further restricted due to line buffer sharing
+	 * between pipelines when scaling, but we have no way to know here if
+	 * the scaler will be used.
+	 */
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops mxc_isi_video_ioctl_ops = {
+	.vidioc_querycap		= mxc_isi_video_querycap,
+
+	.vidioc_enum_fmt_vid_cap	= mxc_isi_video_enum_fmt,
+	.vidioc_try_fmt_vid_cap_mplane	= mxc_isi_video_try_fmt,
+	.vidioc_s_fmt_vid_cap_mplane	= mxc_isi_video_s_fmt,
+	.vidioc_g_fmt_vid_cap_mplane	= mxc_isi_video_g_fmt,
+
+	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
+	.vidioc_querybuf		= vb2_ioctl_querybuf,
+	.vidioc_qbuf			= vb2_ioctl_qbuf,
+	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_expbuf			= vb2_ioctl_expbuf,
+	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
+	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+
+	.vidioc_streamon		= mxc_isi_video_streamon,
+	.vidioc_streamoff		= mxc_isi_video_streamoff,
+
+	.vidioc_enum_framesizes		= mxc_isi_video_enum_framesizes,
+
+	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+};
+
+/* -----------------------------------------------------------------------------
+ * Video device file operations
+ */
+
+static int mxc_isi_video_open(struct file *file)
+{
+	struct mxc_isi_video *video = video_drvdata(file);
+	int ret;
+
+	ret = v4l2_fh_open(file);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(video->pipe->isi->dev);
+	if (ret) {
+		v4l2_fh_release(file);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mxc_isi_video_release(struct file *file)
+{
+	struct mxc_isi_video *video = video_drvdata(file);
+	int ret;
+
+	ret = vb2_fop_release(file);
+	if (ret)
+		dev_err(video->pipe->isi->dev, "%s fail\n", __func__);
+
+	mutex_lock(&video->lock);
+	mxc_isi_video_cleanup_streaming(video);
+	mutex_unlock(&video->lock);
+
+	pm_runtime_put(video->pipe->isi->dev);
+	return ret;
+}
+
+static const struct v4l2_file_operations mxc_isi_video_fops = {
+	.owner		= THIS_MODULE,
+	.open		= mxc_isi_video_open,
+	.release	= mxc_isi_video_release,
+	.poll		= vb2_fop_poll,
+	.unlocked_ioctl	= video_ioctl2,
+	.mmap		= vb2_fop_mmap,
+};
+
+/* -----------------------------------------------------------------------------
+ * Suspend & resume
+ */
+
+void mxc_isi_video_suspend(struct mxc_isi_pipe *pipe)
+{
+	struct mxc_isi_video *video = &pipe->video;
+
+	if (!video->is_streaming)
+		return;
+
+	mxc_isi_pipe_disable(pipe);
+	mxc_isi_channel_put(pipe);
+
+	spin_lock_irq(&video->buf_lock);
+
+	/*
+	 * Move the active buffers back to the pending or discard list. We must
+	 * iterate the active list backward and move the buffers to the head of
+	 * the pending list to preserve the buffer queueing order.
+	 */
+	while (!list_empty(&video->out_active)) {
+		struct mxc_isi_buffer *buf =
+			list_last_entry(&video->out_active,
+					struct mxc_isi_buffer, list);
+
+		if (buf->discard)
+			list_move(&buf->list, &video->out_discard);
+		else
+			list_move(&buf->list, &video->out_pending);
+	}
+
+	spin_unlock_irq(&video->buf_lock);
+}
+
+int mxc_isi_video_resume(struct mxc_isi_pipe *pipe)
+{
+	struct mxc_isi_video *video = &pipe->video;
+
+	if (!video->is_streaming)
+		return 0;
+
+	mxc_isi_video_init_channel(video);
+
+	spin_lock_irq(&video->buf_lock);
+	mxc_isi_video_queue_first_buffers(video);
+	spin_unlock_irq(&video->buf_lock);
+
+	return mxc_isi_pipe_enable(pipe);
+}
+
+/* -----------------------------------------------------------------------------
+ * Registration
+ */
+
+int mxc_isi_video_register(struct mxc_isi_pipe *pipe,
+			   struct v4l2_device *v4l2_dev)
+{
+	struct mxc_isi_video *video = &pipe->video;
+	struct v4l2_pix_format_mplane *pix = &video->pix;
+	struct video_device *vdev = &video->vdev;
+	struct vb2_queue *q = &video->vb2_q;
+	int ret = -ENOMEM;
+
+	video->pipe = pipe;
+
+	mutex_init(&video->lock);
+	spin_lock_init(&video->buf_lock);
+
+	pix->width = MXC_ISI_DEF_WIDTH;
+	pix->height = MXC_ISI_DEF_HEIGHT;
+	pix->pixelformat = MXC_ISI_DEF_PIXEL_FORMAT;
+	pix->colorspace = MXC_ISI_DEF_COLOR_SPACE;
+	pix->ycbcr_enc = MXC_ISI_DEF_YCBCR_ENC;
+	pix->quantization = MXC_ISI_DEF_QUANTIZATION;
+	pix->xfer_func = MXC_ISI_DEF_XFER_FUNC;
+	video->fmtinfo = mxc_isi_format_try(video->pipe, pix, MXC_ISI_VIDEO_CAP);
+
+	memset(vdev, 0, sizeof(*vdev));
+	snprintf(vdev->name, sizeof(vdev->name), "mxc_isi.%d.capture", pipe->id);
+
+	vdev->fops	= &mxc_isi_video_fops;
+	vdev->ioctl_ops	= &mxc_isi_video_ioctl_ops;
+	vdev->v4l2_dev	= v4l2_dev;
+	vdev->minor	= -1;
+	vdev->release	= video_device_release_empty;
+	vdev->queue	= q;
+	vdev->lock	= &video->lock;
+
+	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE_MPLANE
+			  | V4L2_CAP_IO_MC;
+	video_set_drvdata(vdev, video);
+
+	INIT_LIST_HEAD(&video->out_pending);
+	INIT_LIST_HEAD(&video->out_active);
+	INIT_LIST_HEAD(&video->out_discard);
+
+	memset(q, 0, sizeof(*q));
+	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	q->io_modes = VB2_MMAP | VB2_DMABUF;
+	q->drv_priv = video;
+	q->ops = &mxc_isi_vb2_qops;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->buf_struct_size = sizeof(struct mxc_isi_buffer);
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->min_buffers_needed = 2;
+	q->lock = &video->lock;
+	q->dev = pipe->isi->dev;
+
+	ret = vb2_queue_init(q);
+	if (ret)
+		goto err_free_ctx;
+
+	video->pad.flags = MEDIA_PAD_FL_SINK;
+	vdev->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
+	ret = media_entity_pads_init(&vdev->entity, 1, &video->pad);
+	if (ret)
+		goto err_free_ctx;
+
+	ret = mxc_isi_video_ctrls_create(video);
+	if (ret)
+		goto err_me_cleanup;
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret)
+		goto err_ctrl_free;
+
+	ret = media_create_pad_link(&pipe->sd.entity,
+				    MXC_ISI_PIPE_PAD_SOURCE,
+				    &vdev->entity, 0,
+				    MEDIA_LNK_FL_IMMUTABLE |
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret)
+		goto err_video_unreg;
+
+	return 0;
+
+err_video_unreg:
+	video_unregister_device(vdev);
+err_ctrl_free:
+	mxc_isi_video_ctrls_delete(video);
+err_me_cleanup:
+	media_entity_cleanup(&vdev->entity);
+err_free_ctx:
+	return ret;
+}
+
+void mxc_isi_video_unregister(struct mxc_isi_pipe *pipe)
+{
+	struct mxc_isi_video *video = &pipe->video;
+	struct video_device *vdev = &video->vdev;
+
+	mutex_lock(&video->lock);
+
+	if (video_is_registered(vdev)) {
+		video_unregister_device(vdev);
+		mxc_isi_video_ctrls_delete(video);
+		media_entity_cleanup(&vdev->entity);
+	}
+
+	mutex_unlock(&video->lock);
+}
-- 
Regards,

Laurent Pinchart

