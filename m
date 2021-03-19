Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC8F342405
	for <lists+linux-media@lfdr.de>; Fri, 19 Mar 2021 19:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhCSSGt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Mar 2021 14:06:49 -0400
Received: from mga09.intel.com ([134.134.136.24]:57280 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230295AbhCSSGp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Mar 2021 14:06:45 -0400
IronPort-SDR: ymxDHgaioXJHa6SVj9LX1YxdCrJm5MlfsXXgqo5cO7u1GLSqbXF5qUgUi9YF/A2oMJOgDyEeck
 nTh9cQ4Cn8YQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="190036008"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
   d="scan'208";a="190036008"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 11:06:45 -0700
IronPort-SDR: yl+nWywZ6m6i2Y5MXcBjBwTNHdRVrnj7CVoYhamMxMSeGMrCSUMu0d42QJiL5mmKLQRvFxC9ed
 qoEoDQX2gczg==
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; 
   d="scan'208";a="413605703"
Received: from mkrastex-mobl.ger.corp.intel.com ([10.104.88.55])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 11:06:42 -0700
From:   Martina Krasteva <martinax.krasteva@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        daniele.alessandrelli@linux.intel.com,
        paul.j.murphy@linux.intel.com,
        gjorgjix.rosikopulos@linux.intel.com,
        martinax.krasteva@linux.intel.com
Subject: [PATCH 02/10] media: Keem Bay Camera: Keem Bay camera driver
Date:   Fri, 19 Mar 2021 18:06:24 +0000
Message-Id: <20210319180632.585-3-martinax.krasteva@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
References: <20210319180632.585-1-martinax.krasteva@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>

Keem Bay camera driver is a v4l2 media device
which implements media controller interface. It has one
sub-device (ISP sub-device) endpoint which can be connected
to a remote CSI2 TX endpoint. The camera supports up to 6 ports,
each of which is separate CSI2-PHY interface.

Camera driver uses Xlink for communication with remote VPU camera.
The Xlink camera protocol uses one control channel for pipeline
management and configuration, one ISP channel for ISP control and
one channel for each endpoint.

Signed-off-by: Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>
Co-developed-by: Martina Krasteva <martinax.krasteva@intel.com>
Signed-off-by: Martina Krasteva <martinax.krasteva@intel.com>
Acked-by: Paul J. Murphy <paul.j.murphy@intel.com>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
---
 MAINTAINERS                                        |   1 +
 drivers/media/platform/Kconfig                     |   1 +
 drivers/media/platform/Makefile                    |   2 +
 drivers/media/platform/keembay-camera/Kconfig      |  11 +
 drivers/media/platform/keembay-camera/Makefile     |   3 +
 .../platform/keembay-camera/keembay-cam-xlink.c    |  54 ++++
 .../platform/keembay-camera/keembay-cam-xlink.h    |  31 +++
 .../media/platform/keembay-camera/keembay-camera.c | 287 +++++++++++++++++++++
 .../media/platform/keembay-camera/keembay-camera.h |  43 +++
 .../media/platform/keembay-camera/keembay-isp.c    |  53 ++++
 .../media/platform/keembay-camera/keembay-isp.h    |  90 +++++++
 11 files changed, 576 insertions(+)
 create mode 100644 drivers/media/platform/keembay-camera/Kconfig
 create mode 100644 drivers/media/platform/keembay-camera/Makefile
 create mode 100644 drivers/media/platform/keembay-camera/keembay-cam-xlink.c
 create mode 100644 drivers/media/platform/keembay-camera/keembay-cam-xlink.h
 create mode 100644 drivers/media/platform/keembay-camera/keembay-camera.c
 create mode 100644 drivers/media/platform/keembay-camera/keembay-camera.h
 create mode 100644 drivers/media/platform/keembay-camera/keembay-isp.c
 create mode 100644 drivers/media/platform/keembay-camera/keembay-isp.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c3f583ef8e46..76082714a76f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1972,6 +1972,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/intel,keembay-camera.yaml
+F:	drivers/media/platform/keembay-camera/
 
 ARM/IP FABRICS DOUBLE ESPRESSO MACHINE SUPPORT
 M:	Lennert Buytenhek <kernel@wantstofly.org>
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 1ddb5d6354cf..6dedbf54d89a 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -171,6 +171,7 @@ source "drivers/media/platform/xilinx/Kconfig"
 source "drivers/media/platform/rcar-vin/Kconfig"
 source "drivers/media/platform/atmel/Kconfig"
 source "drivers/media/platform/sunxi/Kconfig"
+source "drivers/media/platform/keembay-camera/Kconfig"
 
 config VIDEO_TI_CAL
 	tristate "TI CAL (Camera Adaptation Layer) driver"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 9d4d6370908d..f67db3de5864 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -84,3 +84,5 @@ obj-$(CONFIG_VIDEO_QCOM_VENUS)		+= qcom/venus/
 obj-y					+= sunxi/
 
 obj-$(CONFIG_VIDEO_MESON_GE2D)		+= meson/ge2d/
+
+obj-$(CONFIG_VIDEO_INTEL_KEEMBAY_CAMERA)	+= keembay-camera/
diff --git a/drivers/media/platform/keembay-camera/Kconfig b/drivers/media/platform/keembay-camera/Kconfig
new file mode 100644
index 000000000000..691348ed5d4a
--- /dev/null
+++ b/drivers/media/platform/keembay-camera/Kconfig
@@ -0,0 +1,11 @@
+config VIDEO_INTEL_KEEMBAY_CAMERA
+	tristate "Intel Keem Bay camera subsystem"
+	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on XLINK_CORE  && HAS_DMA && OF
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_FWNODE
+	help
+          This is a V4L2 driver for the Intel Keem Bay VPU camera interface.
+
+          To compile this driver as a module, choose M here: the module
+          will be called keembay_cam
diff --git a/drivers/media/platform/keembay-camera/Makefile b/drivers/media/platform/keembay-camera/Makefile
new file mode 100644
index 000000000000..ea19b61e6469
--- /dev/null
+++ b/drivers/media/platform/keembay-camera/Makefile
@@ -0,0 +1,3 @@
+keembay-cam-objs = keembay-camera.o keembay-cam-xlink.o keembay-isp.o
+
+obj-$(CONFIG_VIDEO_INTEL_KEEMBAY_CAMERA) += keembay-cam.o
diff --git a/drivers/media/platform/keembay-camera/keembay-cam-xlink.c b/drivers/media/platform/keembay-camera/keembay-cam-xlink.c
new file mode 100644
index 000000000000..e34516de0ff9
--- /dev/null
+++ b/drivers/media/platform/keembay-camera/keembay-cam-xlink.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel Keem Bay camera xlink
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+#include <linux/device.h>
+#include <linux/idr.h>
+
+#include "keembay-cam-xlink.h"
+
+/**
+ * kmb_cam_xlink_init - Initialize xlink for VPU camera communication
+ * @xlink_cam: Pointer to xlink camera handle
+ * @dev: Client device of the xlink
+ *
+ * Perform initialization and establish connection with xlink VPUIP device
+ *
+ * Return: 0 if successful, error code otherwise
+ */
+int kmb_cam_xlink_init(struct kmb_xlink_cam *xlink_cam, struct device *dev)
+{
+	int ret;
+
+	/* Connect to the device before opening channels */
+	memset(&xlink_cam->handle, 0, sizeof(xlink_cam->handle));
+	xlink_cam->handle.dev_type = VPUIP_DEVICE;
+	ret = xlink_connect(&xlink_cam->handle);
+	if (ret) {
+		dev_err(xlink_cam->dev, "Failed to connect: %d\n", ret);
+		return ret;
+	}
+
+	ida_init(&xlink_cam->channel_ids);
+	xlink_cam->ctrl_chan_refcnt = 0;
+
+	mutex_init(&xlink_cam->lock);
+	xlink_cam->dev = dev;
+
+	return 0;
+}
+
+/**
+ * kmb_cam_xlink_cleanup - Cleanup xlink camera communication
+ * @xlink_cam: Pointer to xlink camera handle
+ *
+ * Return: 0 if successful, error code otherwise
+ */
+void kmb_cam_xlink_cleanup(struct kmb_xlink_cam *xlink_cam)
+{
+	/* Disconnect from the device after closing channels */
+	xlink_disconnect(&xlink_cam->handle);
+	ida_destroy(&xlink_cam->channel_ids);
+}
diff --git a/drivers/media/platform/keembay-camera/keembay-cam-xlink.h b/drivers/media/platform/keembay-camera/keembay-cam-xlink.h
new file mode 100644
index 000000000000..d219d4298427
--- /dev/null
+++ b/drivers/media/platform/keembay-camera/keembay-cam-xlink.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Intel Keem Bay camera xlink
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+#ifndef KEEMBAY_CAM_XLINK_H
+#define KEEMBAY_CAM_XLINK_H
+
+#include <linux/xlink.h>
+
+/**
+ * struct kmb_xlink_cam - KMB Camera xlink communication
+ * @dev: Device client of the xlink
+ * @lock: Mutex to serialize access to kmb xlink communication channels
+ * @handle: Xlink handle
+ * @ctrl_chan_refcnt: Main control channel reference count
+ * @channel_ids: Channel IDs. Each channel should have unique ID
+ */
+struct kmb_xlink_cam {
+	struct device *dev;
+	struct mutex lock;
+	struct xlink_handle handle;
+	unsigned int ctrl_chan_refcnt;
+	struct ida channel_ids;
+};
+
+int kmb_cam_xlink_init(struct kmb_xlink_cam *xlink_cam, struct device *dev);
+void kmb_cam_xlink_cleanup(struct kmb_xlink_cam *xlink_cam);
+
+#endif /* KEEMBAY_CAM_XLINK_H */
diff --git a/drivers/media/platform/keembay-camera/keembay-camera.c b/drivers/media/platform/keembay-camera/keembay-camera.c
new file mode 100644
index 000000000000..bc23df53473e
--- /dev/null
+++ b/drivers/media/platform/keembay-camera/keembay-camera.c
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel Keem Bay camera driver.
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+
+#include <media/v4l2-fwnode.h>
+
+#include "keembay-camera.h"
+
+#define KMB_CAM_NUM_PORTS 6
+
+/* RX-CTRL to data lanes mapping
+ * 2-lanes
+ * RX-CTRL#0 - {1, 2}
+ * RX-CTRL#1 - {4, 5}
+ * RX-CTRL#2 - {7, 8}
+ * RX-CTRL#3 - {10, 11}
+ * RX-CTRL#4 - {13, 14}
+ * RX-CTRL#5 - {16, 17}
+ * 4-lanes
+ * RX-CTRL#0 - {1, 2, 4, 5}
+ * RX-CTRL#2 - {7, 8, 10, 11}
+ * RX-CTRL#4 - {13, 14, 16, 17}
+ */
+static const u8 rx_ctrl[KMB_CAM_NUM_PORTS][2][4] = {
+	{ { 1, 2 }, { 1, 2, 4, 5 } },
+	{ { 4, 5 }, {} },
+	{ { 7, 8 }, { 7, 8, 10, 11 } },
+	{ { 10, 11 }, {} },
+	{ { 13, 14 }, { 13, 14, 16, 17 } },
+	{ { 16, 17 }, {} }
+};
+
+static int get_rx_id(const u8 data_lanes[],
+		     const unsigned short num_data_lanes)
+{
+	unsigned int i, j;
+
+	for (i = 0; i < KMB_CAM_NUM_PORTS; i++) {
+		for (j = 0; j < ARRAY_SIZE(rx_ctrl[i]); j++) {
+			if (!memcmp(data_lanes, rx_ctrl[i][j],
+				    num_data_lanes * sizeof(u8)))
+				return i;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int kmb_cam_bound(struct v4l2_async_notifier *n,
+			 struct v4l2_subdev *sd,
+			 struct v4l2_async_subdev *asd)
+{
+	struct v4l2_device *v4l2_dev = n->v4l2_dev;
+	struct kmb_camera *kmb_cam =
+		container_of(v4l2_dev, struct kmb_camera, v4l2_dev);
+	struct kmb_camera_receiver *receiver =
+		container_of(asd, struct kmb_camera_receiver, asd);
+	int ret;
+
+	ret = kmb_isp_init(&receiver->isp, kmb_cam->dev,
+			   &receiver->csi2_config, &kmb_cam->xlink_cam);
+	if (ret < 0)
+		return ret;
+
+	ret = kmb_isp_register_entities(&receiver->isp, &kmb_cam->v4l2_dev);
+	if (ret < 0)
+		goto error_isp_cleanup;
+
+	ret = media_create_pad_link(&sd->entity, 0,
+				    &receiver->isp.subdev.entity,
+				    KMB_ISP_SINK_PAD_SENSOR,
+				    MEDIA_LNK_FL_IMMUTABLE |
+				    MEDIA_LNK_FL_ENABLED);
+	if (ret < 0) {
+		dev_err(kmb_cam->dev, "Fail to link %s->%s entities",
+			sd->entity.name, receiver->isp.subdev.entity.name);
+		goto error_unregister_entities;
+	}
+
+	return 0;
+
+error_unregister_entities:
+	kmb_isp_unregister_entities(&receiver->isp);
+error_isp_cleanup:
+	kmb_isp_cleanup(&receiver->isp);
+
+	return ret;
+}
+
+static int kmb_cam_complete(struct v4l2_async_notifier *n)
+{
+	return v4l2_device_register_subdev_nodes(n->v4l2_dev);
+}
+
+static void kmb_cam_unbind(struct v4l2_async_notifier *n,
+			   struct v4l2_subdev *sd,
+			   struct v4l2_async_subdev *asd)
+{
+	struct kmb_camera_receiver *receiver =
+		container_of(asd, struct kmb_camera_receiver, asd);
+
+	kmb_isp_unregister_entities(&receiver->isp);
+	kmb_isp_cleanup(&receiver->isp);
+}
+
+static const struct v4l2_async_notifier_operations notifier_ops = {
+	.bound = kmb_cam_bound,
+	.complete = kmb_cam_complete,
+	.unbind = kmb_cam_unbind
+};
+
+static int kmb_cam_parse_nodes(struct kmb_camera *kmb_cam,
+			       struct v4l2_async_notifier *n)
+{
+	struct fwnode_handle *fwnode = NULL;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < KMB_CAM_NUM_PORTS; i++) {
+		struct v4l2_fwnode_endpoint ep_data = {
+			.bus_type = V4L2_MBUS_CSI2_DPHY,
+		};
+		struct kmb_camera_receiver *receiver;
+		int rx_id;
+
+		fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(kmb_cam->dev),
+							 i, 0,
+							 FWNODE_GRAPH_ENDPOINT_NEXT);
+		if (!fwnode)
+			continue;
+
+		ret = v4l2_fwnode_endpoint_parse(fwnode, &ep_data);
+		if (ret < 0) {
+			dev_err(kmb_cam->dev,
+				"No endpoint to parse in this fwnode");
+			goto error_fwnode_handle_put;
+		}
+
+		rx_id = get_rx_id(ep_data.bus.mipi_csi2.data_lanes,
+				  ep_data.bus.mipi_csi2.num_data_lanes);
+		if (rx_id < 0) {
+			dev_err(kmb_cam->dev, "Invalid RX ID");
+			ret = rx_id;
+			goto error_fwnode_handle_put;
+		}
+
+		receiver =
+			v4l2_async_notifier_add_fwnode_remote_subdev(&kmb_cam->v4l2_notifier,
+								     fwnode,
+								     struct kmb_camera_receiver);
+		if (IS_ERR(receiver)) {
+			ret = PTR_ERR(receiver);
+			goto error_fwnode_handle_put;
+		}
+
+		receiver->csi2_config.rx_id = rx_id;
+		receiver->csi2_config.num_lanes =
+			ep_data.bus.mipi_csi2.num_data_lanes;
+
+		fwnode_handle_put(fwnode);
+	}
+
+	return 0;
+
+error_fwnode_handle_put:
+	fwnode_handle_put(fwnode);
+
+	return ret;
+}
+
+static int kmb_cam_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct v4l2_device *v4l2_dev;
+	struct kmb_camera *kmb_cam;
+	int ret;
+
+	kmb_cam = devm_kzalloc(dev, sizeof(*kmb_cam), GFP_KERNEL);
+	if (!kmb_cam)
+		return -ENOMEM;
+
+	kmb_cam->dev = dev;
+
+	platform_set_drvdata(pdev, kmb_cam);
+
+	ret = kmb_cam_xlink_init(&kmb_cam->xlink_cam, dev);
+	if (ret < 0)
+		return ret;
+
+	strscpy(kmb_cam->media_dev.model, "Keem Bay camera",
+		sizeof(kmb_cam->media_dev.model));
+	kmb_cam->media_dev.dev = dev;
+	kmb_cam->media_dev.hw_revision = 0;
+	media_device_init(&kmb_cam->media_dev);
+
+	v4l2_dev = &kmb_cam->v4l2_dev;
+	v4l2_dev->mdev = &kmb_cam->media_dev;
+	strscpy(v4l2_dev->name, "keembay-camera", sizeof(v4l2_dev->name));
+
+	ret = v4l2_device_register(dev, &kmb_cam->v4l2_dev);
+	if (ret < 0) {
+		dev_err(kmb_cam->dev, "Fail to register v4l2_device: %d", ret);
+		goto error_xlink_cleanup;
+	}
+
+	ret = of_reserved_mem_device_init(dev);
+	if (ret)
+		dev_info(dev, "Default CMA memory region will be used!");
+
+	v4l2_async_notifier_init(&kmb_cam->v4l2_notifier);
+	ret = kmb_cam_parse_nodes(kmb_cam, &kmb_cam->v4l2_notifier);
+	if (ret < 0) {
+		dev_err(kmb_cam->dev, "Fail to parse nodes: %d", ret);
+		goto error_async_notifier_cleanup;
+	}
+
+	kmb_cam->v4l2_notifier.ops = &notifier_ops;
+	ret = v4l2_async_notifier_register(&kmb_cam->v4l2_dev,
+					   &kmb_cam->v4l2_notifier);
+	if (ret < 0) {
+		dev_err(kmb_cam->dev, "Could not register notifier! %d", ret);
+		goto error_async_notifier_cleanup;
+	}
+
+	ret = media_device_register(&kmb_cam->media_dev);
+	if (ret < 0) {
+		dev_err(kmb_cam->dev, "Fail to register media device %d", ret);
+		goto error_async_notifier_unregister;
+	}
+
+	return 0;
+
+error_async_notifier_unregister:
+	v4l2_async_notifier_unregister(&kmb_cam->v4l2_notifier);
+error_async_notifier_cleanup:
+	v4l2_async_notifier_cleanup(&kmb_cam->v4l2_notifier);
+	v4l2_device_unregister(&kmb_cam->v4l2_dev);
+error_xlink_cleanup:
+	kmb_cam_xlink_cleanup(&kmb_cam->xlink_cam);
+
+	return ret;
+}
+
+static int kmb_cam_remove(struct platform_device *pdev)
+{
+	struct kmb_camera *kmb_cam = platform_get_drvdata(pdev);
+
+	v4l2_async_notifier_unregister(&kmb_cam->v4l2_notifier);
+	v4l2_async_notifier_cleanup(&kmb_cam->v4l2_notifier);
+
+	media_device_unregister(&kmb_cam->media_dev);
+	media_device_cleanup(&kmb_cam->media_dev);
+	v4l2_device_unregister(&kmb_cam->v4l2_dev);
+
+	kmb_cam_xlink_cleanup(&kmb_cam->xlink_cam);
+
+	return 0;
+}
+
+static const struct of_device_id kmb_cam_dt_match[] = {
+	{.compatible = "intel,keembay-camera"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, kmb_cam_dt_match);
+
+static struct platform_driver keembay_camera_driver = {
+	.probe	= kmb_cam_probe,
+	.remove = kmb_cam_remove,
+	.driver = {
+		.name = "keembay-camera",
+		.owner = THIS_MODULE,
+		.of_match_table = kmb_cam_dt_match,
+	}
+};
+
+module_platform_driver(keembay_camera_driver);
+
+MODULE_DESCRIPTION("Intel Keem Bay camera");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/keembay-camera/keembay-camera.h b/drivers/media/platform/keembay-camera/keembay-camera.h
new file mode 100644
index 000000000000..c108c60fdc73
--- /dev/null
+++ b/drivers/media/platform/keembay-camera/keembay-camera.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Intel Keem Bay camera driver.
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+#ifndef KEEMBAY_CAMERA_H
+#define KEEMBAY_CAMERA_H
+
+#include <media/v4l2-device.h>
+
+#include "keembay-cam-xlink.h"
+#include "keembay-isp.h"
+
+/**
+ * struct kmb_camera_receiver - Keem Bay camera receiver
+ * @asd: V4L2 asynchronous sub-device
+ * @csi2_config: CSI-2 configuration
+ * @isp: ISP device
+ */
+struct kmb_camera_receiver {
+	struct v4l2_async_subdev asd;
+	struct kmb_isp_csi2_config csi2_config;
+	struct kmb_isp isp;
+};
+
+/**
+ * struct kmb_cam - Keem Bay camera media device
+ * @dev: Pointer to basic device structure
+ * @media_dev: Media device
+ * @v4l2_dev: V4L2 device
+ * @v4l2_notifier: V4L2 async notifier
+ * @xlink_cam: Xlink camera communication handler
+ */
+struct kmb_camera {
+	struct device *dev;
+	struct media_device media_dev;
+	struct v4l2_device v4l2_dev;
+	struct v4l2_async_notifier v4l2_notifier;
+	struct kmb_xlink_cam xlink_cam;
+};
+
+#endif /* KEEMBAY_CAMERA_H */
diff --git a/drivers/media/platform/keembay-camera/keembay-isp.c b/drivers/media/platform/keembay-camera/keembay-isp.c
new file mode 100644
index 000000000000..79f6212e37d9
--- /dev/null
+++ b/drivers/media/platform/keembay-camera/keembay-isp.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel Keem Bay camera ISP driver.
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+#include "keembay-isp.h"
+
+/**
+ * kmb_isp_init - Initialize Kmb isp subdevice
+ * @kmb_isp: Pointer to kmb isp device
+ * @dev: Pointer to camera device for which isp will be associated with
+ * @csi2_config: Csi2 configuration
+ * @xlink_cam: Xlink camera communication handle
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+int kmb_isp_init(struct kmb_isp *kmb_isp, struct device *dev,
+		 struct kmb_isp_csi2_config *csi2_config,
+		 struct kmb_xlink_cam *xlink_cam)
+{
+	return 0;
+}
+
+/**
+ * kmb_isp_cleanup - Cleanup kmb isp sub-device resourcess allocated in init
+ * @kmb_isp: Pointer to kmb isp sub-device
+ */
+void kmb_isp_cleanup(struct kmb_isp *kmb_isp)
+{ }
+
+/**
+ * kmb_isp_register_entities - Register entities
+ * @kmb_isp: pointer to kmb isp device
+ * @v4l2_dev: pointer to V4L2 device drivers
+ *
+ * Register all entities in the pipeline and create
+ * links between them.
+ *
+ * Return: 0 if successful, error code otherwise.
+ */
+int kmb_isp_register_entities(struct kmb_isp *kmb_isp,
+			      struct v4l2_device *v4l2_dev)
+{
+	return 0;
+}
+
+/**
+ * kmb_isp_unregister_entities - Unregister this media's entities
+ * @kmb_isp: pointer to kmb isp device
+ */
+void kmb_isp_unregister_entities(struct kmb_isp *kmb_isp)
+{ }
diff --git a/drivers/media/platform/keembay-camera/keembay-isp.h b/drivers/media/platform/keembay-camera/keembay-isp.h
new file mode 100644
index 000000000000..35af6c644676
--- /dev/null
+++ b/drivers/media/platform/keembay-camera/keembay-isp.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Intel Keem Bay camera ISP driver.
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+#ifndef KEEMBAY_ISP_H
+#define KEEMBAY_ISP_H
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-subdev.h>
+
+#define KMB_ISP_DRV_NAME	"keembay-camera-isp"
+
+#define KMB_ISP_SINK_PAD_SENSOR	0
+#define KMB_ISP_SINK_PAD_CFG	1
+#define KMB_ISP_SRC_PAD_VID	2
+#define KMB_ISP_PADS_NUM	3
+
+/**
+ * struct kmb_isp_csi2_config - Isp csi2 configuration
+ * @rx_id: Source port id
+ * @num_lanes: Number of physical lanes
+ */
+struct kmb_isp_csi2_config {
+	u32 rx_id;
+	u32 num_lanes;
+};
+
+/**
+ * struct kmb_isp - Keem Bay camera ISP device structure
+ * @dev: Pointer to basic device structure
+ * @lock: Mutex serilizing access to ISP device
+ * @thread: Pointer to worker thread data
+ * @xlink_cam: Xlink camera communication handler
+ * @msg_phy_addr: ISP channel physical CMA address
+ * @msg_vaddr: ISP channel virtual CMA address
+ * @cfg_q_lock: Mutex to serialize access to isp cfg bufferss queue
+ * @isp_cfgs_queue: Isp cfg buffers queue
+ * @isp_streaming: Flag to indicate ISP state
+ * @source_streaming: Flag to indicate source state
+ * @source_stopped: Completion to wait until VPU source is stopped
+ * @subdev: V4L2 sub-device
+ * @pads: Array of supported isp pads
+ * @active_pad_fmt: Array holding active pad formats
+ * @try_pad_fmt: Array holding try pad formats
+ * @csi2_config: CSI2 configuration
+ * @source_fmt: Pointer to isp source format
+ * @sequence: frame sequence number
+ */
+struct kmb_isp {
+	struct device *dev;
+	struct mutex lock;
+	struct task_struct *thread;
+
+	struct kmb_xlink_cam *xlink_cam;
+
+	dma_addr_t msg_phy_addr;
+	void *msg_vaddr;
+
+	struct mutex cfg_q_lock;
+	struct list_head isp_cfgs_queue;
+
+	bool isp_streaming;
+	bool source_streaming;
+	struct completion source_stopped;
+
+	struct v4l2_subdev subdev;
+	struct media_pad pads[KMB_ISP_PADS_NUM];
+
+	struct v4l2_subdev_format active_pad_fmt[KMB_ISP_PADS_NUM];
+
+	struct v4l2_subdev_format try_pad_fmt[KMB_ISP_PADS_NUM];
+
+	struct kmb_isp_csi2_config csi2_config;
+	const struct kmb_isp_source_format *source_fmt;
+
+	u32 sequence;
+};
+
+int kmb_isp_init(struct kmb_isp *kmb_isp, struct device *dev,
+		 struct kmb_isp_csi2_config *csi2_config,
+		 struct kmb_xlink_cam *xlink_cam);
+void kmb_isp_cleanup(struct kmb_isp *kmb_isp);
+
+int kmb_isp_register_entities(struct kmb_isp *kmb_isp,
+			      struct v4l2_device *v4l2_dev);
+void kmb_isp_unregister_entities(struct kmb_isp *kmb_isp);
+
+#endif /* KEEMBAY_ISP_H */
-- 
2.11.0

