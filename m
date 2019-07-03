Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7085EC72
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 21:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727399AbfGCTKe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 15:10:34 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42446 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727392AbfGCTKd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jul 2019 15:10:33 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 7ADE328ABBB
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-rockchip@lists.infradead.org
Cc:     devicetree@vger.kernel.org, eddie.cai.linux@gmail.com,
        mchehab@kernel.org, heiko@sntech.de, jacob2.chen@rock-chips.com,
        jeffy.chen@rock-chips.com, zyc@rock-chips.com,
        linux-kernel@vger.kernel.org, tfiga@chromium.org,
        hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com, kernel@collabora.com,
        ezequiel@collabora.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, zhengsq@rock-chips.com,
        Jacob Chen <cc@rock-chips.com>,
        Allon Huang <allon.huang@rock-chips.com>,
        Helen Koike <helen.koike@collabora.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Ettore Chimenti <ek5.chimenti@gmail.com>,
        Eddie James <eajames@linux.ibm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Todor Tomov <todor.tomov@linaro.org>,
        Yong Deng <yong.deng@magewell.com>, Sean Young <sean@mess.org>
Subject: [PATCH v7 09/14] media: rkisp1: add rockchip isp1 core driver
Date:   Wed,  3 Jul 2019 16:09:05 -0300
Message-Id: <20190703190910.32633-10-helen.koike@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703190910.32633-1-helen.koike@collabora.com>
References: <20190703190910.32633-1-helen.koike@collabora.com>
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
[update for upstream]
Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

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

 drivers/media/platform/Kconfig                |  12 +
 drivers/media/platform/Makefile               |   1 +
 drivers/media/platform/rockchip/isp1/Makefile |   7 +
 drivers/media/platform/rockchip/isp1/common.h | 101 +++
 drivers/media/platform/rockchip/isp1/dev.c    | 675 ++++++++++++++++++
 drivers/media/platform/rockchip/isp1/dev.h    |  97 +++
 6 files changed, 893 insertions(+)
 create mode 100644 drivers/media/platform/rockchip/isp1/Makefile
 create mode 100644 drivers/media/platform/rockchip/isp1/common.h
 create mode 100644 drivers/media/platform/rockchip/isp1/dev.c
 create mode 100644 drivers/media/platform/rockchip/isp1/dev.h

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 8a19654b393a..346ad2a2ee3a 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -106,6 +106,18 @@ config VIDEO_QCOM_CAMSS
 	select VIDEOBUF2_DMA_SG
 	select V4L2_FWNODE
 
+config VIDEO_ROCKCHIP_ISP1
+	tristate "Rockchip Image Signal Processing v1 Unit driver"
+	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_VMALLOC
+	select V4L2_FWNODE
+	select PHY_ROCKCHIP_DPHY
+	default n
+	---help---
+	  Support for ISP1 on the rockchip SoC.
+
 config VIDEO_S3C_CAMIF
 	tristate "Samsung S3C24XX/S3C64XX SoC Camera Interface driver"
 	depends on VIDEO_V4L2 && I2C && VIDEO_V4L2_SUBDEV_API
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 7cbbd925124c..f9fcf8e7c513 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_VIDEO_RENESAS_FDP1)	+= rcar_fdp1.o
 obj-$(CONFIG_VIDEO_RENESAS_JPU)		+= rcar_jpu.o
 obj-$(CONFIG_VIDEO_RENESAS_VSP1)	+= vsp1/
 
+obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1)	+= rockchip/isp1/
 obj-$(CONFIG_VIDEO_ROCKCHIP_RGA)	+= rockchip/rga/
 
 obj-y	+= omap/
diff --git a/drivers/media/platform/rockchip/isp1/Makefile b/drivers/media/platform/rockchip/isp1/Makefile
new file mode 100644
index 000000000000..72706e80fc8b
--- /dev/null
+++ b/drivers/media/platform/rockchip/isp1/Makefile
@@ -0,0 +1,7 @@
+obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1) += 	rockchip-isp1.o
+rockchip-isp1-objs 	   += 	rkisp1.o \
+				dev.o \
+				regs.o \
+				isp_stats.o \
+				isp_params.o \
+				capture.o
diff --git a/drivers/media/platform/rockchip/isp1/common.h b/drivers/media/platform/rockchip/isp1/common.h
new file mode 100644
index 000000000000..606ce2793546
--- /dev/null
+++ b/drivers/media/platform/rockchip/isp1/common.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Rockchip isp1 driver
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
+enum rkisp1_sd_type {
+	RKISP1_SD_SENSOR,
+	RKISP1_SD_PHY_CSI,
+	RKISP1_SD_VCM,
+	RKISP1_SD_FLASH,
+	RKISP1_SD_MAX,
+};
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
+extern int rkisp1_debug;
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
diff --git a/drivers/media/platform/rockchip/isp1/dev.c b/drivers/media/platform/rockchip/isp1/dev.c
new file mode 100644
index 000000000000..2b4a67e1a3b5
--- /dev/null
+++ b/drivers/media/platform/rockchip/isp1/dev.c
@@ -0,0 +1,675 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Rockchip isp1 driver
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
+#include <linux/pm_runtime.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/phy/phy.h>
+#include <linux/phy/phy-mipi-dphy.h>
+
+#include "common.h"
+#include "regs.h"
+
+struct isp_match_data {
+	const char * const *clks;
+	int size;
+};
+
+struct sensor_async_subdev {
+	struct v4l2_async_subdev asd;
+	struct v4l2_mbus_config mbus;
+	unsigned int lanes;
+};
+
+int rkisp1_debug;
+module_param_named(debug, rkisp1_debug, int, 0644);
+MODULE_PARM_DESC(debug, "Debug level (0-1)");
+
+/**************************** pipeline operations******************************/
+
+static int __isp_pipeline_prepare(struct rkisp1_pipeline *p,
+				  struct media_entity *me)
+{
+	struct rkisp1_device *dev = container_of(p, struct rkisp1_device, pipe);
+	struct v4l2_subdev *sd;
+	unsigned int i;
+
+	p->num_subdevs = 0;
+	memset(p->subdevs, 0, sizeof(p->subdevs));
+
+	while (1) {
+		struct media_pad *pad = NULL;
+
+		/* Find remote source pad */
+		for (i = 0; i < me->num_pads; i++) {
+			struct media_pad *spad = &me->pads[i];
+
+			if (!(spad->flags & MEDIA_PAD_FL_SINK))
+				continue;
+			pad = media_entity_remote_pad(spad);
+			if (pad)
+				break;
+		}
+
+		if (!pad)
+			break;
+
+		sd = media_entity_to_v4l2_subdev(pad->entity);
+		if (sd != &dev->isp_sdev.sd)
+			p->subdevs[p->num_subdevs++] = sd;
+
+		me = &sd->entity;
+		if (me->num_pads == 1)
+			break;
+	}
+	return 0;
+}
+
+static int __subdev_set_power(struct v4l2_subdev *sd, int on)
+{
+	int ret;
+
+	if (!sd)
+		return -ENXIO;
+
+	ret = v4l2_subdev_call(sd, core, s_power, on);
+
+	return ret != -ENOIOCTLCMD ? ret : 0;
+}
+
+static int __isp_pipeline_s_power(struct rkisp1_pipeline *p, bool on)
+{
+	struct rkisp1_device *dev = container_of(p, struct rkisp1_device, pipe);
+	int i, ret;
+
+	if (on) {
+		__subdev_set_power(&dev->isp_sdev.sd, true);
+
+		for (i = p->num_subdevs - 1; i >= 0; --i) {
+			ret = __subdev_set_power(p->subdevs[i], true);
+			if (ret < 0 && ret != -ENXIO)
+				goto err_power_off;
+		}
+	} else {
+		for (i = 0; i < p->num_subdevs; ++i)
+			__subdev_set_power(p->subdevs[i], false);
+
+		__subdev_set_power(&dev->isp_sdev.sd, false);
+	}
+
+	return 0;
+
+err_power_off:
+	for (++i; i < p->num_subdevs; ++i)
+		__subdev_set_power(p->subdevs[i], false);
+	__subdev_set_power(&dev->isp_sdev.sd, true);
+	return ret;
+}
+
+static int rkisp1_pipeline_open(struct rkisp1_pipeline *p,
+				struct media_entity *me,
+				bool prepare)
+{
+	int ret;
+
+	if (WARN_ON(!p || !me))
+		return -EINVAL;
+	if (atomic_inc_return(&p->power_cnt) > 1)
+		return 0;
+
+	/* go through media graphic and get subdevs */
+	if (prepare)
+		__isp_pipeline_prepare(p, me);
+
+	if (!p->num_subdevs)
+		return -EINVAL;
+
+	ret = __isp_pipeline_s_power(p, 1);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int rkisp1_pipeline_close(struct rkisp1_pipeline *p)
+{
+	int ret;
+
+	if (atomic_dec_return(&p->power_cnt) > 0)
+		return 0;
+	ret = __isp_pipeline_s_power(p, 0);
+
+	return ret == -ENXIO ? 0 : ret;
+}
+
+/*
+ * stream-on order: isp_subdev, mipi dphy, sensor
+ * stream-off order: mipi dphy, sensor, isp_subdev
+ */
+static int rkisp1_pipeline_set_stream(struct rkisp1_pipeline *p, bool on)
+{
+	struct rkisp1_device *dev = container_of(p, struct rkisp1_device, pipe);
+	int i, ret;
+
+	if ((on && atomic_inc_return(&p->stream_cnt) > 1) ||
+	    (!on && atomic_dec_return(&p->stream_cnt) > 0))
+		return 0;
+
+	if (on) {
+		ret = v4l2_subdev_call(&dev->isp_sdev.sd, video, s_stream,
+				       true);
+		if (ret && ret != -ENOIOCTLCMD && ret != -ENODEV) {
+			v4l2_err(&dev->v4l2_dev,
+				 "s_stream failed on subdevice %s (%d)\n",
+				 dev->isp_sdev.sd.name,
+				 ret);
+			atomic_dec(&p->stream_cnt);
+			return ret;
+		}
+	}
+
+	/* phy -> sensor */
+	for (i = 0; i < p->num_subdevs; ++i) {
+		ret = v4l2_subdev_call(p->subdevs[i], video, s_stream, on);
+		if (on && ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV)
+			goto err_stream_off;
+	}
+
+	if (!on)
+		v4l2_subdev_call(&dev->isp_sdev.sd, video, s_stream, false);
+
+	return 0;
+
+err_stream_off:
+	for (--i; i >= 0; --i)
+		v4l2_subdev_call(p->subdevs[i], video, s_stream, false);
+	v4l2_subdev_call(&dev->isp_sdev.sd, video, s_stream, false);
+	atomic_dec(&p->stream_cnt);
+	return ret;
+}
+
+/***************************** media controller *******************************/
+/* See http://opensource.rock-chips.com/wiki_Rockchip-isp1 for Topology */
+
+static int rkisp1_create_links(struct rkisp1_device *dev)
+{
+	struct media_entity *source, *sink;
+	struct rkisp1_sensor *sensor;
+	unsigned int flags, pad;
+	int ret;
+
+	/* sensor links(or mipi-phy) */
+	list_for_each_entry(sensor, &dev->sensors, list) {
+		for (pad = 0; pad < sensor->sd->entity.num_pads; pad++)
+			if (sensor->sd->entity.pads[pad].flags &
+				MEDIA_PAD_FL_SOURCE)
+				break;
+
+		if (pad == sensor->sd->entity.num_pads) {
+			dev_err(dev->dev,
+				"failed to find src pad for %s\n",
+				sensor->sd->name);
+
+			return -ENXIO;
+		}
+
+		ret = media_create_pad_link(
+				&sensor->sd->entity, pad,
+				&dev->isp_sdev.sd.entity,
+				RKISP1_ISP_PAD_SINK,
+				list_is_first(&sensor->list, &dev->sensors) ?
+				MEDIA_LNK_FL_ENABLED : 0);
+		if (ret) {
+			dev_err(dev->dev,
+				"failed to create link for %s\n",
+				sensor->sd->name);
+			return ret;
+		}
+	}
+
+	/* params links */
+	source = &dev->params_vdev.vnode.vdev.entity;
+	sink = &dev->isp_sdev.sd.entity;
+	flags = MEDIA_LNK_FL_ENABLED;
+	ret = media_create_pad_link(source, 0, sink,
+				       RKISP1_ISP_PAD_SINK_PARAMS, flags);
+	if (ret < 0)
+		return ret;
+
+	/* create isp internal links */
+	/* SP links */
+	source = &dev->isp_sdev.sd.entity;
+	sink = &dev->stream[RKISP1_STREAM_SP].vnode.vdev.entity;
+	ret = media_create_pad_link(source, RKISP1_ISP_PAD_SOURCE_PATH,
+				       sink, 0, flags);
+	if (ret < 0)
+		return ret;
+
+	/* MP links */
+	source = &dev->isp_sdev.sd.entity;
+	sink = &dev->stream[RKISP1_STREAM_MP].vnode.vdev.entity;
+	ret = media_create_pad_link(source, RKISP1_ISP_PAD_SOURCE_PATH,
+				       sink, 0, flags);
+	if (ret < 0)
+		return ret;
+
+	/* 3A stats links */
+	source = &dev->isp_sdev.sd.entity;
+	sink = &dev->stats_vdev.vnode.vdev.entity;
+	return media_create_pad_link(source, RKISP1_ISP_PAD_SOURCE_STATS,
+					sink, 0, flags);
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
+	struct rkisp1_sensor *sensor;
+
+	sensor = devm_kzalloc(isp_dev->dev, sizeof(*sensor), GFP_KERNEL);
+	if (!sensor)
+		return -ENOMEM;
+
+	sensor->lanes = s_asd->lanes;
+	sensor->mbus = s_asd->mbus;
+	sensor->sd = sd;
+	sensor->dphy = devm_phy_get(isp_dev->dev, "dphy");
+	if (IS_ERR(sensor->dphy)) {
+		if (PTR_ERR(sensor->dphy) != -EPROBE_DEFER)
+			dev_err(isp_dev->dev, "Couldn't get the MIPI D-PHY\n");
+		return PTR_ERR(sensor->dphy);
+	}
+	phy_init(sensor->dphy);
+
+	list_add(&sensor->list, &isp_dev->sensors);
+
+	return 0;
+}
+
+static struct rkisp1_sensor *sd_to_sensor(struct rkisp1_device *dev,
+					  struct v4l2_subdev *sd)
+{
+	struct rkisp1_sensor *sensor;
+
+	list_for_each_entry(sensor, &dev->sensors, list)
+		if (sensor->sd == sd)
+			return sensor;
+
+	return NULL;
+}
+
+static void subdev_notifier_unbind(struct v4l2_async_notifier *notifier,
+				   struct v4l2_subdev *sd,
+				   struct v4l2_async_subdev *asd)
+{
+	struct rkisp1_device *isp_dev = container_of(notifier,
+						     struct rkisp1_device,
+						     notifier);
+	struct rkisp1_sensor *sensor = sd_to_sensor(isp_dev, sd);
+
+	/* TODO: check if a lock is required here */
+	list_del(&sensor->list);
+
+	phy_exit(sensor->dphy);
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
+	v4l2_info(&dev->v4l2_dev, "Async subdev notifier completed\n");
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
+	ret = v4l2_async_notifier_parse_fwnode_endpoints_by_port(
+		dev, ntf, sizeof(struct sensor_async_subdev), 0,
+		rkisp1_fwnode_parse);
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
+		v4l2_err(&dev->v4l2_dev,
+			 "Failed to register subdev notifier(%d)\n", ret);
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
+static const char * const rk3288_isp_clks[] = {
+	"clk_isp",
+	"aclk_isp",
+	"hclk_isp",
+	"pclk_isp_in",
+	"sclk_isp_jpe",
+};
+
+static const struct isp_match_data rk3288_isp_clk_data = {
+	.clks = rk3288_isp_clks,
+	.size = ARRAY_SIZE(rk3288_isp_clks),
+};
+
+static const struct isp_match_data rk3399_isp_clk_data = {
+	.clks = rk3399_isp_clks,
+	.size = ARRAY_SIZE(rk3399_isp_clks),
+};
+
+static const struct of_device_id rkisp1_plat_of_match[] = {
+	{
+		.compatible = "rockchip,rk3288-cif-isp",
+		.data = &rk3288_isp_clk_data,
+	}, {
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
+	unsigned int mis_val;
+
+	mis_val = readl(rkisp1_dev->base_addr + CIF_ISP_MIS);
+	if (mis_val)
+		rkisp1_isp_isr(mis_val, rkisp1_dev);
+
+	mis_val = readl(rkisp1_dev->base_addr + CIF_MIPI_MIS);
+	if (mis_val)
+		rkisp1_mipi_isr(mis_val, rkisp1_dev);
+
+	mis_val = readl(rkisp1_dev->base_addr + CIF_MI_MIS);
+	if (mis_val)
+		rkisp1_mi_isr(mis_val, rkisp1_dev);
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
+	INIT_LIST_HEAD(&isp_dev->sensors);
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
+	atomic_set(&isp_dev->pipe.power_cnt, 0);
+	atomic_set(&isp_dev->pipe.stream_cnt, 0);
+	isp_dev->pipe.open = rkisp1_pipeline_open;
+	isp_dev->pipe.close = rkisp1_pipeline_close;
+	isp_dev->pipe.set_stream = rkisp1_pipeline_set_stream;
+
+	rkisp1_stream_init(isp_dev, RKISP1_STREAM_SP);
+	rkisp1_stream_init(isp_dev, RKISP1_STREAM_MP);
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
+	v4l2_ctrl_handler_init(&isp_dev->ctrl_handler, 5);
+	v4l2_dev->ctrl_handler = &isp_dev->ctrl_handler;
+
+	ret = v4l2_device_register(isp_dev->dev, &isp_dev->v4l2_dev);
+	if (ret < 0)
+		return ret;
+
+	ret = media_device_register(&isp_dev->media_dev);
+	if (ret < 0) {
+		v4l2_err(v4l2_dev, "Failed to register media device: %d\n",
+			 ret);
+		goto err_unreg_v4l2_dev;
+	}
+
+	/* create & register platefom subdev (from of_node) */
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
diff --git a/drivers/media/platform/rockchip/isp1/dev.h b/drivers/media/platform/rockchip/isp1/dev.h
new file mode 100644
index 000000000000..f7cbee316523
--- /dev/null
+++ b/drivers/media/platform/rockchip/isp1/dev.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Rockchip isp1 driver
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
+#define GRP_ID_SENSOR			BIT(0)
+#define GRP_ID_MIPIPHY			BIT(1)
+#define GRP_ID_ISP			BIT(2)
+#define GRP_ID_ISP_MP			BIT(3)
+#define GRP_ID_ISP_SP			BIT(4)
+
+#define RKISP1_MAX_BUS_CLK	8
+#define RKISP1_MAX_SENSOR	2
+#define RKISP1_MAX_PIPELINE	4
+
+/*
+ * struct rkisp1_pipeline - An ISP hardware pipeline
+ *
+ * Capture device call other devices via pipeline
+ *
+ * @num_subdevs: number of linked subdevs
+ * @power_cnt: pipeline power count
+ * @stream_cnt: stream power count
+ */
+struct rkisp1_pipeline {
+	struct media_pipeline pipe;
+	int num_subdevs;
+	atomic_t power_cnt;
+	atomic_t stream_cnt;
+	struct v4l2_subdev *subdevs[RKISP1_MAX_PIPELINE];
+	int (*open)(struct rkisp1_pipeline *p,
+		    struct media_entity *me, bool prepare);
+	int (*close)(struct rkisp1_pipeline *p);
+	int (*set_stream)(struct rkisp1_pipeline *p, bool on);
+};
+
+/*
+ * struct rkisp1_sensor - Sensor information
+ * @mbus: media bus configuration
+ */
+struct rkisp1_sensor {
+	struct v4l2_subdev *sd;
+	struct v4l2_mbus_config mbus;
+	unsigned int lanes;
+	struct phy *dphy;
+	struct list_head list;
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
+	struct v4l2_subdev *subdevs[RKISP1_SD_MAX];
+	struct rkisp1_sensor *active_sensor;
+	struct list_head sensors;
+	struct rkisp1_isp_subdev isp_sdev;
+	struct rkisp1_stream stream[RKISP1_MAX_STREAM];
+	struct rkisp1_isp_stats_vdev stats_vdev;
+	struct rkisp1_isp_params_vdev params_vdev;
+	struct rkisp1_pipeline pipe;
+	struct vb2_alloc_ctx *alloc_ctx;
+};
+
+#endif
-- 
2.20.1

