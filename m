Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB2DFFBF26
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 06:14:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbfKNFOS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 00:14:18 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44072 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfKNFOS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 00:14:18 -0500
Received: from floko.floko.floko (unknown [IPv6:2804:431:c7f0:da1c:a086:2727:e196:fd8a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8032D290CD6;
        Thu, 14 Nov 2019 05:14:06 +0000 (GMT)
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
Subject: [PATCH v11 08/11] media: staging: rkisp1: add rockchip isp1 core driver
Date:   Thu, 14 Nov 2019 02:12:39 -0300
Message-Id: <20191114051242.14651-9-helen.koike@collabora.com>
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

Add the core driver for rockchip isp1.

Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
Signed-off-by: Yichong Zhong <zyc@rock-chips.com>
Signed-off-by: Jacob Chen <cc@rock-chips.com>
Signed-off-by: Eddie Cai <eddie.cai.linux@gmail.com>
Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
Signed-off-by: Allon Huang <allon.huang@rock-chips.com>
Signed-off-by: Tomasz Figa <tfiga@chromium.org>
[fixed compilation and run time errors regarding new v4l2 async API]
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
[Add missing module device table]
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
[refactored for upstream]
Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

Changes in v11:
dev
- fix checkpatch erros

Changes in v10:
- unsquash
- update TODO

Changes in v9:
- remove ctrl_handler from struct rkisp1_isp_subdev
- replace v4l2_{dgb,info,warn,err} by dev_*
- s/pr_info/dev_dbg
- s/int size/unsigned int size
- remove module param rkisp1_debug
- coding style fixes
- fix error in subdev_notifier_bound, check dphy before assigning to sensor->dphy
- remove subdevs fixed size array from rkisp1_pipeline
- remove sensors list, as it can be identified from the media topology
- Kconfig: add COMPILE_TEST in the dependency
- use v4l2_pipeline_pm_use and remove _isp_pipeline_s_power() and _subdev_set_power()
- remove struct rkisp1_pipeline and retrieve pipeline information from the media framework
- remove remaining rk3288 code
- cache pixel rate control in sctruct sensor_async_subdev
- remove enum rkisp1_sd_type
- squash
- move to staging

Changes in v8: None
Changes in v7:
- VIDEO_ROCKCHIP_ISP1 selects VIDEOBUF2_VMALLOC
- add PHY_ROCKCHIP_DPHY as a dependency for VIDEO_ROCKCHIP_ISP1
- Fix compilation and runtime errors due to bitrotting
The code has bit-rotten since March 2018, fix compilation errors.
The new V4L2 async notifier API requires notifiers to be initialized by
a call to v4l2_async_notifier_init() before being used, do so.
- Add missing module device table
- use clk_bulk framework
- add missing notifiers cleanups
- s/strlcpy/strscpy
- normalize bus_info name
- fix s_stream error path, stream_cnt wans't being decremented properly
- use devm_platform_ioremap_resource() helper
- s/deice/device
- redesign: remove mipi/csi subdevice, sensors connect directly to the
isp subdevice in the media topology now.
- remove "saved_state" member from rkisp1_stream struct
- Reverse the order of MIs
- Simplify MI interrupt handling
Rather than adding unnecessary indirection, just use stream index to
handle MI interrupt enable/disable/clear, since the stream index matches
the order of bits now, thanks to previous patch. While at it, remove
some dead code.
- code styling and checkpatch fixes

 drivers/staging/media/Kconfig         |   2 +
 drivers/staging/media/Makefile        |   1 +
 drivers/staging/media/rkisp1/Kconfig  |  13 +
 drivers/staging/media/rkisp1/Makefile |   7 +
 drivers/staging/media/rkisp1/TODO     |  23 ++
 drivers/staging/media/rkisp1/common.h |  98 ++++++
 drivers/staging/media/rkisp1/dev.c    | 439 ++++++++++++++++++++++++++
 drivers/staging/media/rkisp1/dev.h    |  67 ++++
 8 files changed, 650 insertions(+)
 create mode 100644 drivers/staging/media/rkisp1/Kconfig
 create mode 100644 drivers/staging/media/rkisp1/Makefile
 create mode 100644 drivers/staging/media/rkisp1/TODO
 create mode 100644 drivers/staging/media/rkisp1/common.h
 create mode 100644 drivers/staging/media/rkisp1/dev.c
 create mode 100644 drivers/staging/media/rkisp1/dev.h

diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index a47484473883..db467c5c2fd2 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -40,4 +40,6 @@ source "drivers/staging/media/soc_camera/Kconfig"
 
 source "drivers/staging/media/phy-rockchip-dphy/Kconfig"
 
+source "drivers/staging/media/rkisp1/Kconfig"
+
 endif
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index b0eae3906208..1beb9a6374b0 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_VIDEO_HANTRO)	+= hantro/
 obj-$(CONFIG_VIDEO_IPU3_IMGU)	+= ipu3/
 obj-$(CONFIG_SOC_CAMERA)	+= soc_camera/
 obj-$(CONFIG_PHY_ROCKCHIP_DPHY)		+= phy-rockchip-dphy/
+obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1)	+= rkisp1/
diff --git a/drivers/staging/media/rkisp1/Kconfig b/drivers/staging/media/rkisp1/Kconfig
new file mode 100644
index 000000000000..7fa7b402ae0d
--- /dev/null
+++ b/drivers/staging/media/rkisp1/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config VIDEO_ROCKCHIP_ISP1
+	tristate "Rockchip Image Signal Processing v1 Unit driver"
+	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_VMALLOC
+	select V4L2_FWNODE
+	select PHY_ROCKCHIP_DPHY
+	default n
+	help
+	  Support for ISP1 on the rockchip SoC.
diff --git a/drivers/staging/media/rkisp1/Makefile b/drivers/staging/media/rkisp1/Makefile
new file mode 100644
index 000000000000..72706e80fc8b
--- /dev/null
+++ b/drivers/staging/media/rkisp1/Makefile
@@ -0,0 +1,7 @@
+obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1) += 	rockchip-isp1.o
+rockchip-isp1-objs 	   += 	rkisp1.o \
+				dev.o \
+				regs.o \
+				isp_stats.o \
+				isp_params.o \
+				capture.o
diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
new file mode 100644
index 000000000000..1ac982e51f63
--- /dev/null
+++ b/drivers/staging/media/rkisp1/TODO
@@ -0,0 +1,23 @@
+* Implement resizer subdevice.
+* Fix serialization on subdev ops.
+* Reject out of range hsfreq in rockchip_dphy_configure().
+* Don't use v4l2_async_notifier_parse_fwnode_endpoints_by_port().
+e.g. isp_parse_of_endpoints in drivers/media/platform/omap3isp/isp.c
+cio2_parse_firmware in drivers/media/pci/intel/ipu3/ipu3-cio2.c.
+* Fix race conditions when interrupt get delayed.
+* Fix pad format size for statistics and parameters entities.
+* Cleanup link_validate to use v4l2_subdev_link_validate_default().
+* Documentation for uapi.
+* Use threaded interrupt for rkisp1_stats_isr().
+* Fix reloading the module.
+* Fix checkpatch errors.
+* Make sure uapi structs have the same size and layout in 32 and 62 bits,
+and that there are no holes in the structures (pahole is a utility that
+can be used to test this).
+
+NOTES:
+* All v4l2-compliance test must pass.
+* Stats and params can be tested with libcamera and ChromiumOS stack.
+
+Please CC patches to Linux Media <linux-media@vger.kernel.org> and
+Helen Koike <helen.koike@collabora.com>.
diff --git a/drivers/staging/media/rkisp1/common.h b/drivers/staging/media/rkisp1/common.h
new file mode 100644
index 000000000000..a6aa627b0456
--- /dev/null
+++ b/drivers/staging/media/rkisp1/common.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Rockchip ISP1 Driver - Common definitions
+ *
+ * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
+ */
+
+#ifndef _RKISP1_COMMON_H
+#define _RKISP1_COMMON_H
+
+#include <linux/mutex.h>
+#include <media/media-device.h>
+#include <media/media-entity.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/videobuf2-v4l2.h>
+
+/* TODO: FIXME: changing the default resolution to higher values causes the
+ * stream to stall.
+ * The capture node gets the crop bounds from the isp source pad crop size, but
+ * if the user updates isp source pad crop size and start streaming, the capture
+ * doesn't detect the new crop bounds, and if the isp source pad crop size is
+ * smaller then the capture crop size, the stream doesn't work.
+ */
+#define RKISP1_DEFAULT_WIDTH		800
+#define RKISP1_DEFAULT_HEIGHT		600
+
+#define RKISP1_MAX_STREAM		2
+#define RKISP1_STREAM_MP		0
+#define RKISP1_STREAM_SP		1
+
+#define RKISP1_PLANE_Y			0
+#define RKISP1_PLANE_CB			1
+#define RKISP1_PLANE_CR			2
+
+/* One structure per video node */
+struct rkisp1_vdev_node {
+	struct vb2_queue buf_queue;
+	/* vfd lock */
+	struct mutex vlock;
+	struct video_device vdev;
+	struct media_pad pad;
+};
+
+enum rkisp1_fmt_pix_type {
+	FMT_YUV,
+	FMT_RGB,
+	FMT_BAYER,
+	FMT_JPEG,
+	FMT_MAX
+};
+
+enum rkisp1_fmt_raw_pat_type {
+	RAW_RGGB = 0,
+	RAW_GRBG,
+	RAW_GBRG,
+	RAW_BGGR,
+};
+
+struct rkisp1_buffer {
+	struct vb2_v4l2_buffer vb;
+	struct list_head queue;
+	union {
+		u32 buff_addr[VIDEO_MAX_PLANES];
+		void *vaddr[VIDEO_MAX_PLANES];
+	};
+};
+
+struct rkisp1_dummy_buffer {
+	void *vaddr;
+	dma_addr_t dma_addr;
+	u32 size;
+};
+
+static inline
+struct rkisp1_vdev_node *vdev_to_node(struct video_device *vdev)
+{
+	return container_of(vdev, struct rkisp1_vdev_node, vdev);
+}
+
+static inline struct rkisp1_vdev_node *queue_to_node(struct vb2_queue *q)
+{
+	return container_of(q, struct rkisp1_vdev_node, buf_queue);
+}
+
+static inline struct rkisp1_buffer *to_rkisp1_buffer(struct vb2_v4l2_buffer *vb)
+{
+	return container_of(vb, struct rkisp1_buffer, vb);
+}
+
+static inline struct vb2_queue *to_vb2_queue(struct file *file)
+{
+	struct rkisp1_vdev_node *vnode = video_drvdata(file);
+
+	return &vnode->buf_queue;
+}
+
+#endif /* _RKISP1_COMMON_H */
diff --git a/drivers/staging/media/rkisp1/dev.c b/drivers/staging/media/rkisp1/dev.c
new file mode 100644
index 000000000000..87e6a3c4706b
--- /dev/null
+++ b/drivers/staging/media/rkisp1/dev.c
@@ -0,0 +1,439 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Rockchip ISP1 Driver - Base driver
+ *
+ * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
+ */
+
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/of_platform.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/phy/phy.h>
+#include <linux/phy/phy-mipi-dphy.h>
+#include <media/v4l2-fwnode.h>
+
+#include "common.h"
+#include "regs.h"
+
+struct isp_match_data {
+	const char * const *clks;
+	unsigned int size;
+};
+
+/***************************** media controller *******************************/
+/* See http://opensource.rock-chips.com/wiki_Rockchip-isp1 for Topology */
+
+static int rkisp1_create_links(struct rkisp1_device *dev)
+{
+	struct media_entity *source, *sink;
+	unsigned int flags, source_pad;
+	struct v4l2_subdev *sd;
+	int ret;
+
+	/* sensor links */
+	flags = MEDIA_LNK_FL_ENABLED;
+	list_for_each_entry(sd, &dev->v4l2_dev.subdevs, list) {
+		if (sd == &dev->isp_sdev.sd)
+			continue;
+
+		ret = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
+						  MEDIA_PAD_FL_SOURCE);
+		if (ret < 0) {
+			dev_err(sd->dev, "failed to find src pad for %s\n",
+				sd->name);
+			return ret;
+		}
+		source_pad = ret;
+
+		ret = media_create_pad_link(&sd->entity, source_pad,
+					    &dev->isp_sdev.sd.entity,
+					    RKISP1_ISP_PAD_SINK_VIDEO,
+					    flags);
+		if (ret < 0)
+			return ret;
+
+		flags = 0;
+	}
+
+	/* params links */
+	source = &dev->params_vdev.vnode.vdev.entity;
+	sink = &dev->isp_sdev.sd.entity;
+	flags = MEDIA_LNK_FL_ENABLED;
+	ret = media_create_pad_link(source, 0, sink,
+				    RKISP1_ISP_PAD_SINK_PARAMS, flags);
+	if (ret < 0)
+		return ret;
+
+	/* create ISP internal links */
+	/* SP links */
+	source = &dev->isp_sdev.sd.entity;
+	sink = &dev->stream[RKISP1_STREAM_SP].vnode.vdev.entity;
+	ret = media_create_pad_link(source, RKISP1_ISP_PAD_SOURCE_VIDEO,
+				    sink, 0, flags);
+	if (ret < 0)
+		return ret;
+
+	/* MP links */
+	source = &dev->isp_sdev.sd.entity;
+	sink = &dev->stream[RKISP1_STREAM_MP].vnode.vdev.entity;
+	ret = media_create_pad_link(source, RKISP1_ISP_PAD_SOURCE_VIDEO,
+				    sink, 0, flags);
+	if (ret < 0)
+		return ret;
+
+	/* 3A stats links */
+	source = &dev->isp_sdev.sd.entity;
+	sink = &dev->stats_vdev.vnode.vdev.entity;
+	return media_create_pad_link(source, RKISP1_ISP_PAD_SOURCE_STATS,
+				     sink, 0, flags);
+}
+
+static int subdev_notifier_bound(struct v4l2_async_notifier *notifier,
+				 struct v4l2_subdev *sd,
+				 struct v4l2_async_subdev *asd)
+{
+	struct rkisp1_device *isp_dev = container_of(notifier,
+						     struct rkisp1_device,
+						     notifier);
+	struct sensor_async_subdev *s_asd = container_of(asd,
+					struct sensor_async_subdev, asd);
+
+	s_asd->pixel_rate_ctrl = v4l2_ctrl_find(sd->ctrl_handler,
+						V4L2_CID_PIXEL_RATE);
+	s_asd->sd = sd;
+	s_asd->dphy = devm_phy_get(isp_dev->dev, "dphy");
+	if (IS_ERR(s_asd->dphy)) {
+		if (PTR_ERR(s_asd->dphy) != -EPROBE_DEFER)
+			dev_err(isp_dev->dev, "Couldn't get the MIPI D-PHY\n");
+		return PTR_ERR(s_asd->dphy);
+	}
+
+	phy_init(s_asd->dphy);
+
+	return 0;
+}
+
+static void subdev_notifier_unbind(struct v4l2_async_notifier *notifier,
+				   struct v4l2_subdev *sd,
+				   struct v4l2_async_subdev *asd)
+{
+	struct sensor_async_subdev *s_asd = container_of(asd,
+					struct sensor_async_subdev, asd);
+
+	phy_exit(s_asd->dphy);
+}
+
+static int subdev_notifier_complete(struct v4l2_async_notifier *notifier)
+{
+	struct rkisp1_device *dev = container_of(notifier, struct rkisp1_device,
+						 notifier);
+	int ret;
+
+	mutex_lock(&dev->media_dev.graph_mutex);
+	ret = rkisp1_create_links(dev);
+	if (ret < 0)
+		goto unlock;
+	ret = v4l2_device_register_subdev_nodes(&dev->v4l2_dev);
+	if (ret < 0)
+		goto unlock;
+
+	dev_info(dev->dev, "Async subdev notifier completed\n");
+
+unlock:
+	mutex_unlock(&dev->media_dev.graph_mutex);
+	return ret;
+}
+
+static int rkisp1_fwnode_parse(struct device *dev,
+			       struct v4l2_fwnode_endpoint *vep,
+			       struct v4l2_async_subdev *asd)
+{
+	struct sensor_async_subdev *s_asd =
+			container_of(asd, struct sensor_async_subdev, asd);
+
+	if (vep->bus_type != V4L2_MBUS_CSI2_DPHY) {
+		dev_err(dev, "Only CSI2 bus type is currently supported\n");
+		return -EINVAL;
+	}
+
+	if (vep->base.port != 0) {
+		dev_err(dev, "The ISP has only port 0\n");
+		return -EINVAL;
+	}
+
+	s_asd->mbus.type = vep->bus_type;
+	s_asd->mbus.flags = vep->bus.mipi_csi2.flags;
+	s_asd->lanes = vep->bus.mipi_csi2.num_data_lanes;
+
+	switch (vep->bus.mipi_csi2.num_data_lanes) {
+	case 1:
+		s_asd->mbus.flags |= V4L2_MBUS_CSI2_1_LANE;
+		break;
+	case 2:
+		s_asd->mbus.flags |= V4L2_MBUS_CSI2_2_LANE;
+		break;
+	case 3:
+		s_asd->mbus.flags |= V4L2_MBUS_CSI2_3_LANE;
+		break;
+	case 4:
+		s_asd->mbus.flags |= V4L2_MBUS_CSI2_4_LANE;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_async_notifier_operations subdev_notifier_ops = {
+	.bound = subdev_notifier_bound,
+	.unbind = subdev_notifier_unbind,
+	.complete = subdev_notifier_complete,
+};
+
+static int isp_subdev_notifier(struct rkisp1_device *isp_dev)
+{
+	struct v4l2_async_notifier *ntf = &isp_dev->notifier;
+	struct device *dev = isp_dev->dev;
+	int ret;
+
+	v4l2_async_notifier_init(ntf);
+
+	ret = v4l2_async_notifier_parse_fwnode_endpoints_by_port(dev, ntf,
+					sizeof(struct sensor_async_subdev),
+					0, rkisp1_fwnode_parse);
+	if (ret < 0)
+		return ret;
+
+	if (list_empty(&ntf->asd_list))
+		return -ENODEV;	/* no endpoint */
+
+	ntf->ops = &subdev_notifier_ops;
+
+	return v4l2_async_notifier_register(&isp_dev->v4l2_dev, ntf);
+}
+
+/***************************** platform device *******************************/
+
+static int rkisp1_register_platform_subdevs(struct rkisp1_device *dev)
+{
+	int ret;
+
+	ret = rkisp1_register_isp_subdev(dev, &dev->v4l2_dev);
+	if (ret < 0)
+		return ret;
+
+	rkisp1_stream_init(dev, RKISP1_STREAM_SP);
+	rkisp1_stream_init(dev, RKISP1_STREAM_MP);
+
+	ret = rkisp1_register_stream_vdevs(dev);
+	if (ret < 0)
+		goto err_unreg_isp_subdev;
+
+	ret = rkisp1_register_stats_vdev(&dev->stats_vdev, &dev->v4l2_dev, dev);
+	if (ret < 0)
+		goto err_unreg_stream_vdev;
+
+	ret = rkisp1_register_params_vdev(&dev->params_vdev, &dev->v4l2_dev,
+					  dev);
+	if (ret < 0)
+		goto err_unreg_stats_vdev;
+
+	ret = isp_subdev_notifier(dev);
+	if (ret < 0) {
+		dev_err(dev->dev,
+			"Failed to register subdev notifier(%d)\n", ret);
+		goto err_unreg_params_vdev;
+	}
+
+	return 0;
+err_unreg_params_vdev:
+	rkisp1_unregister_params_vdev(&dev->params_vdev);
+err_unreg_stats_vdev:
+	rkisp1_unregister_stats_vdev(&dev->stats_vdev);
+err_unreg_stream_vdev:
+	rkisp1_unregister_stream_vdevs(dev);
+err_unreg_isp_subdev:
+	rkisp1_unregister_isp_subdev(dev);
+	return ret;
+}
+
+static const char * const rk3399_isp_clks[] = {
+	"clk_isp",
+	"aclk_isp",
+	"hclk_isp",
+	"aclk_isp_wrap",
+	"hclk_isp_wrap",
+};
+
+static const struct isp_match_data rk3399_isp_clk_data = {
+	.clks = rk3399_isp_clks,
+	.size = ARRAY_SIZE(rk3399_isp_clks),
+};
+
+static const struct of_device_id rkisp1_plat_of_match[] = {
+	{
+		.compatible = "rockchip,rk3399-cif-isp",
+		.data = &rk3399_isp_clk_data,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, rkisp1_plat_of_match);
+
+static irqreturn_t rkisp1_irq_handler(int irq, void *ctx)
+{
+	struct device *dev = ctx;
+	struct rkisp1_device *rkisp1_dev = dev_get_drvdata(dev);
+
+	rkisp1_isp_isr(rkisp1_dev);
+	rkisp1_mipi_isr(rkisp1_dev);
+	rkisp1_mi_isr(rkisp1_dev);
+
+	return IRQ_HANDLED;
+}
+
+static int rkisp1_plat_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	const struct isp_match_data *clk_data;
+	const struct of_device_id *match;
+	struct device *dev = &pdev->dev;
+	struct rkisp1_device *isp_dev;
+	struct v4l2_device *v4l2_dev;
+	unsigned int i;
+	int ret, irq;
+
+	match = of_match_node(rkisp1_plat_of_match, node);
+	isp_dev = devm_kzalloc(dev, sizeof(*isp_dev), GFP_KERNEL);
+	if (!isp_dev)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, isp_dev);
+	isp_dev->dev = dev;
+
+	isp_dev->base_addr = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(isp_dev->base_addr))
+		return PTR_ERR(isp_dev->base_addr);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_irq(dev, irq, rkisp1_irq_handler, IRQF_SHARED,
+			       dev_driver_string(dev), dev);
+	if (ret < 0) {
+		dev_err(dev, "request irq failed: %d\n", ret);
+		return ret;
+	}
+
+	isp_dev->irq = irq;
+	clk_data = match->data;
+
+	for (i = 0; i < clk_data->size; i++)
+		isp_dev->clks[i].id = clk_data->clks[i];
+	ret = devm_clk_bulk_get(dev, clk_data->size, isp_dev->clks);
+	if (ret)
+		return ret;
+	isp_dev->clk_size = clk_data->size;
+
+	strscpy(isp_dev->media_dev.model, "rkisp1",
+		sizeof(isp_dev->media_dev.model));
+	isp_dev->media_dev.dev = &pdev->dev;
+	strscpy(isp_dev->media_dev.bus_info,
+		"platform: " DRIVER_NAME, sizeof(isp_dev->media_dev.bus_info));
+	media_device_init(&isp_dev->media_dev);
+
+	v4l2_dev = &isp_dev->v4l2_dev;
+	v4l2_dev->mdev = &isp_dev->media_dev;
+	strscpy(v4l2_dev->name, "rkisp1", sizeof(v4l2_dev->name));
+
+	ret = v4l2_device_register(isp_dev->dev, &isp_dev->v4l2_dev);
+	if (ret < 0)
+		return ret;
+
+	ret = media_device_register(&isp_dev->media_dev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to register media device: %d\n", ret);
+		goto err_unreg_v4l2_dev;
+	}
+
+	/* create & register platform subdev (from of_node) */
+	ret = rkisp1_register_platform_subdevs(isp_dev);
+	if (ret < 0)
+		goto err_unreg_media_dev;
+
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
+
+err_unreg_media_dev:
+	media_device_unregister(&isp_dev->media_dev);
+err_unreg_v4l2_dev:
+	v4l2_device_unregister(&isp_dev->v4l2_dev);
+	return ret;
+}
+
+static int rkisp1_plat_remove(struct platform_device *pdev)
+{
+	struct rkisp1_device *isp_dev = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(&pdev->dev);
+	media_device_unregister(&isp_dev->media_dev);
+	v4l2_async_notifier_unregister(&isp_dev->notifier);
+	v4l2_async_notifier_cleanup(&isp_dev->notifier);
+	v4l2_device_unregister(&isp_dev->v4l2_dev);
+	rkisp1_unregister_params_vdev(&isp_dev->params_vdev);
+	rkisp1_unregister_stats_vdev(&isp_dev->stats_vdev);
+	rkisp1_unregister_stream_vdevs(isp_dev);
+	rkisp1_unregister_isp_subdev(isp_dev);
+
+	return 0;
+}
+
+static int __maybe_unused rkisp1_runtime_suspend(struct device *dev)
+{
+	struct rkisp1_device *isp_dev = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(isp_dev->clk_size, isp_dev->clks);
+	return pinctrl_pm_select_sleep_state(dev);
+}
+
+static int __maybe_unused rkisp1_runtime_resume(struct device *dev)
+{
+	struct rkisp1_device *isp_dev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pinctrl_pm_select_default_state(dev);
+	if (ret < 0)
+		return ret;
+	ret = clk_bulk_prepare_enable(isp_dev->clk_size, isp_dev->clks);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static const struct dev_pm_ops rkisp1_plat_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(rkisp1_runtime_suspend, rkisp1_runtime_resume, NULL)
+};
+
+static struct platform_driver rkisp1_plat_drv = {
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table = of_match_ptr(rkisp1_plat_of_match),
+		.pm = &rkisp1_plat_pm_ops,
+	},
+	.probe = rkisp1_plat_probe,
+	.remove = rkisp1_plat_remove,
+};
+
+module_platform_driver(rkisp1_plat_drv);
+MODULE_AUTHOR("Rockchip Camera/ISP team");
+MODULE_DESCRIPTION("Rockchip ISP1 platform driver");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/staging/media/rkisp1/dev.h b/drivers/staging/media/rkisp1/dev.h
new file mode 100644
index 000000000000..fc59da8902fb
--- /dev/null
+++ b/drivers/staging/media/rkisp1/dev.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Rockchip ISP1 Driver - Base driver
+ *
+ * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
+ */
+
+#ifndef _RKISP1_DEV_H
+#define _RKISP1_DEV_H
+
+#include <linux/clk.h>
+
+#include "capture.h"
+#include "rkisp1.h"
+#include "isp_params.h"
+#include "isp_stats.h"
+
+#define DRIVER_NAME "rkisp1"
+#define ISP_VDEV_NAME DRIVER_NAME  "_ispdev"
+#define SP_VDEV_NAME DRIVER_NAME   "_selfpath"
+#define MP_VDEV_NAME DRIVER_NAME   "_mainpath"
+#define DMA_VDEV_NAME DRIVER_NAME  "_dmapath"
+
+#define RKISP1_MAX_BUS_CLK	8
+
+/*
+ * struct sensor_async_subdev - Sensor information
+ * @mbus: media bus configuration
+ */
+struct sensor_async_subdev {
+	struct v4l2_async_subdev asd;
+	struct v4l2_mbus_config mbus;
+	unsigned int lanes;
+	struct v4l2_subdev *sd;
+	struct v4l2_ctrl *pixel_rate_ctrl;
+	struct phy *dphy;
+};
+
+/*
+ * struct rkisp1_device - ISP platform device
+ * @base_addr: base register address
+ * @active_sensor: sensor in-use, set when streaming on
+ * @isp_sdev: ISP sub-device
+ * @rkisp1_stream: capture video device
+ * @stats_vdev: ISP statistics output device
+ * @params_vdev: ISP input parameters device
+ */
+struct rkisp1_device {
+	void __iomem *base_addr;
+	int irq;
+	struct device *dev;
+	unsigned int clk_size;
+	struct clk_bulk_data clks[RKISP1_MAX_BUS_CLK];
+	struct v4l2_device v4l2_dev;
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct media_device media_dev;
+	struct v4l2_async_notifier notifier;
+	struct sensor_async_subdev *active_sensor;
+	struct rkisp1_isp_subdev isp_sdev;
+	struct rkisp1_stream stream[RKISP1_MAX_STREAM];
+	struct rkisp1_isp_stats_vdev stats_vdev;
+	struct rkisp1_isp_params_vdev params_vdev;
+	struct media_pipeline pipe;
+	struct vb2_alloc_ctx *alloc_ctx;
+};
+
+#endif
-- 
2.22.0

