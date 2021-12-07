Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50AAE46AFBD
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 02:24:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357746AbhLGB1m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Dec 2021 20:27:42 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:52147 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1354982AbhLGB1l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Dec 2021 20:27:41 -0500
X-IronPort-AV: E=Sophos;i="5.87,293,1631545200"; 
   d="scan'208";a="103026621"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 07 Dec 2021 10:24:09 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 62FCA4173037;
        Tue,  7 Dec 2021 10:24:06 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 2/3] media: platform: Add CRU driver for RZ/G2L SoC
Date:   Tue,  7 Dec 2021 01:23:50 +0000
Message-Id: <20211207012351.15754-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211207012351.15754-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211207012351.15754-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add v4l driver for Renesas RZ/G2L Camera data Receiving Unit.

The CRU consists of a MIPI CSI-2 block and an Image Processing block.
Image Processing block input can be either CSI-2 or parallel input.

Based on a patch in the BSP by Hien Huynh
<hien.huynh.px@renesas.com>

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/Kconfig                |   1 +
 drivers/media/platform/Makefile               |   2 +
 drivers/media/platform/rzg2l-cru/Kconfig      |  15 +
 drivers/media/platform/rzg2l-cru/Makefile     |   4 +
 drivers/media/platform/rzg2l-cru/rzg2l-core.c | 473 ++++++++++++
 drivers/media/platform/rzg2l-cru/rzg2l-cru.h  | 244 ++++++
 drivers/media/platform/rzg2l-cru/rzg2l-csi2.c | 625 ++++++++++++++++
 drivers/media/platform/rzg2l-cru/rzg2l-dma.c  | 703 ++++++++++++++++++
 drivers/media/platform/rzg2l-cru/rzg2l-v4l2.c | 361 +++++++++
 9 files changed, 2428 insertions(+)
 create mode 100644 drivers/media/platform/rzg2l-cru/Kconfig
 create mode 100644 drivers/media/platform/rzg2l-cru/Makefile
 create mode 100644 drivers/media/platform/rzg2l-cru/rzg2l-core.c
 create mode 100644 drivers/media/platform/rzg2l-cru/rzg2l-cru.h
 create mode 100644 drivers/media/platform/rzg2l-cru/rzg2l-csi2.c
 create mode 100644 drivers/media/platform/rzg2l-cru/rzg2l-dma.c
 create mode 100644 drivers/media/platform/rzg2l-cru/rzg2l-v4l2.c

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index cf4adc64c953..5059f1b0a6ba 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -169,6 +169,7 @@ source "drivers/media/platform/exynos4-is/Kconfig"
 source "drivers/media/platform/am437x/Kconfig"
 source "drivers/media/platform/xilinx/Kconfig"
 source "drivers/media/platform/rcar-vin/Kconfig"
+source "drivers/media/platform/rzg2l-cru/Kconfig"
 source "drivers/media/platform/atmel/Kconfig"
 source "drivers/media/platform/sunxi/Kconfig"
 
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index a148553babfc..51cc0a1a4c94 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -66,6 +66,8 @@ obj-$(CONFIG_VIDEO_XILINX)		+= xilinx/
 obj-$(CONFIG_VIDEO_RCAR_ISP)		+= rcar-isp.o
 obj-$(CONFIG_VIDEO_RCAR_VIN)		+= rcar-vin/
 
+obj-$(CONFIG_VIDEO_RZG2L_CRU)		+= rzg2l-cru/
+
 obj-$(CONFIG_VIDEO_ATMEL_ISC)		+= atmel/
 obj-$(CONFIG_VIDEO_ATMEL_ISI)		+= atmel/
 obj-$(CONFIG_VIDEO_ATMEL_XISC)		+= atmel/
diff --git a/drivers/media/platform/rzg2l-cru/Kconfig b/drivers/media/platform/rzg2l-cru/Kconfig
new file mode 100644
index 000000000000..75664be0206d
--- /dev/null
+++ b/drivers/media/platform/rzg2l-cru/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+config VIDEO_RZG2L_CRU
+	tristate "RZ/G2L Camera Receiving Unit (CRU) Driver"
+	depends on VIDEO_V4L2 && OF
+	depends on ARCH_R9A07G044 || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_CONTIG
+	select RESET_CONTROLLER
+	select V4L2_FWNODE
+	help
+	  Support for Renesas RZ/G2L Camera Receiving Unit (CRU) driver.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called rzg2l-cru.
diff --git a/drivers/media/platform/rzg2l-cru/Makefile b/drivers/media/platform/rzg2l-cru/Makefile
new file mode 100644
index 000000000000..624b431b12b0
--- /dev/null
+++ b/drivers/media/platform/rzg2l-cru/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+rzg2l-cru-objs = rzg2l-core.o rzg2l-csi2.o rzg2l-dma.o rzg2l-v4l2.o
+
+obj-$(CONFIG_VIDEO_RZG2L_CRU) += rzg2l-cru.o
diff --git a/drivers/media/platform/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/rzg2l-cru/rzg2l-core.c
new file mode 100644
index 000000000000..11e8f5c03887
--- /dev/null
+++ b/drivers/media/platform/rzg2l-cru/rzg2l-core.c
@@ -0,0 +1,473 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for Renesas RZ/G2L CRU
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ *
+ * Based on Renesas R-Car VIN
+ * Copyright (C) 2016 Renesas Electronics Corp.
+ * Copyright (C) 2011-2013 Renesas Solutions Corp.
+ * Copyright (C) 2013 Cogent Embedded, Inc., <source@cogentembedded.com>
+ * Copyright (C) 2008 Magnus Damm
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/sys_soc.h>
+
+#include <media/v4l2-async.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+
+#include "rzg2l-cru.h"
+
+#define v4l2_dev_to_cru(d)	container_of(d, struct rzg2l_cru_dev, v4l2_dev)
+
+static int rzg2l_cru_csi2_link_notify(struct media_link *link, u32 flags,
+				      unsigned int notification)
+{
+	struct rzg2l_cru_group *group = container_of(link->graph_obj.mdev,
+						struct rzg2l_cru_group, mdev);
+	struct rzg2l_cru_dev *cru = NULL;
+	struct video_device *vdev;
+	struct media_pad *csi_pad;
+	struct media_entity *entity;
+	struct v4l2_subdev *sd;
+	int ret = 0;
+
+	ret = v4l2_pipeline_link_notify(link, flags, notification);
+	if (ret)
+		return ret;
+
+	/* Only care about link enablement for CRU nodes. */
+	if (!(flags & MEDIA_LNK_FL_ENABLED) ||
+	    !is_media_entity_v4l2_video_device(link->sink->entity))
+		return 0;
+
+	/*
+	 * Don't allow link changes if any entity in the graph is
+	 * streaming, modifying the CHSEL register fields can disrupt
+	 * running streams.
+	 */
+	media_device_for_each_entity(entity, &group->mdev)
+		if (entity->stream_count)
+			return -EBUSY;
+
+	mutex_lock(&group->lock);
+	vdev = media_entity_to_video_device(link->sink->entity);
+	cru = container_of(vdev, struct rzg2l_cru_dev, vdev);
+
+	csi_pad = media_entity_remote_pad(&group->cru->vdev.entity.pads[0]);
+	if (csi_pad) {
+		ret = -EMLINK;
+		goto out;
+	}
+
+	sd = media_entity_to_v4l2_subdev(link->source->entity);
+	if (group->csi.subdev == sd) {
+		cru->group->csi.channel = link->source->index - 1;
+		cru->is_csi = true;
+	} else {
+		ret = -ENODEV;
+	}
+
+out:
+	mutex_unlock(&group->lock);
+
+	return ret;
+}
+
+static const struct media_device_ops rzg2l_cru_media_ops = {
+	.link_notify = rzg2l_cru_csi2_link_notify,
+};
+
+static void rzg2l_cru_group_put(struct rzg2l_cru_dev *cru)
+{
+	struct rzg2l_cru_group *group = cru->group;
+
+	mutex_lock(&group->lock);
+	cru->group = NULL;
+	cru->v4l2_dev.mdev = NULL;
+	mutex_unlock(&group->lock);
+}
+
+/* -----------------------------------------------------------------------------
+ * Group async notifier
+ */
+
+static int rzg2l_cru_group_notify_complete(struct v4l2_async_notifier *notifier)
+{
+	struct rzg2l_cru_dev *cru = v4l2_dev_to_cru(notifier->v4l2_dev);
+	struct rzg2l_cru_group *group = cru->group;
+	unsigned int i;
+	int ret;
+
+	ret = media_device_register(&group->mdev);
+	if (ret)
+		return ret;
+
+	ret = v4l2_device_register_subdev_nodes(&cru->v4l2_dev);
+	if (ret) {
+		cru_err(cru, "Failed to register subdev nodes\n");
+		return ret;
+	}
+
+	if (!video_is_registered(&cru->vdev)) {
+		ret = rzg2l_cru_v4l2_register(cru->group->cru);
+		if (ret)
+			return ret;
+	}
+
+	/* Create all media device links between CRU and CSI-2's. */
+	for (i = 1; i <= CSI2_VCHANNEL; i++) {
+		struct media_entity *source, *sink;
+
+		source = &cru->group->csi.subdev->entity;
+		sink = &cru->group->cru->vdev.entity;
+
+		ret = media_create_pad_link(source, i, sink, 0, 0);
+		if (ret) {
+			cru_err(cru, "Error adding link from %s to %s\n",
+				source->name, sink->name);
+			break;
+		}
+	}
+
+	return ret;
+}
+
+static void rzg2l_cru_group_notify_unbind(struct v4l2_async_notifier *notifier,
+					  struct v4l2_subdev *subdev,
+					  struct v4l2_async_subdev *asd)
+{
+	struct rzg2l_cru_dev *cru = v4l2_dev_to_cru(notifier->v4l2_dev);
+
+	if (cru->group->cru)
+		rzg2l_cru_v4l2_unregister(cru->group->cru);
+
+	mutex_lock(&cru->group->lock);
+
+	if (cru->group->csi.asd == asd) {
+		cru->group->csi.subdev = NULL;
+		cru_dbg(cru, "Unbind CSI-2 %s\n", subdev->name);
+	}
+
+	mutex_unlock(&cru->group->lock);
+
+	media_device_unregister(&cru->group->mdev);
+}
+
+static int rzg2l_cru_group_notify_bound(struct v4l2_async_notifier *notifier,
+					struct v4l2_subdev *subdev,
+					struct v4l2_async_subdev *asd)
+{
+	struct rzg2l_cru_dev *cru = v4l2_dev_to_cru(notifier->v4l2_dev);
+	unsigned int i;
+
+	mutex_lock(&cru->group->lock);
+
+	if (cru->group->csi.asd == asd) {
+		cru->group->csi.subdev = subdev;
+		cru_dbg(cru, "Bound CSI-2 %s to slot %u\n", subdev->name, i);
+	}
+
+	mutex_unlock(&cru->group->lock);
+
+	return 0;
+}
+
+static const struct v4l2_async_notifier_operations
+rzg2l_cru_group_notify_ops = {
+	.bound = rzg2l_cru_group_notify_bound,
+	.unbind = rzg2l_cru_group_notify_unbind,
+	.complete = rzg2l_cru_group_notify_complete,
+};
+
+static int rzg2l_cru_parse_of(struct rzg2l_cru_dev *cru, unsigned int id)
+{
+	struct v4l2_fwnode_endpoint vep = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	struct fwnode_handle *ep, *fwnode;
+	struct v4l2_async_subdev *asd;
+	int ret;
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(cru->dev), 3, id, 0);
+	if (!ep)
+		return 0;
+
+	fwnode = fwnode_graph_get_remote_endpoint(ep);
+	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+	fwnode_handle_put(ep);
+	if (ret) {
+		cru_err(cru, "Failed to parse %pOF\n", to_of_node(fwnode));
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (!of_device_is_available(to_of_node(fwnode))) {
+		cru_dbg(cru, "OF device %pOF disabled, ignoring\n",
+			to_of_node(fwnode));
+		ret = -ENOTCONN;
+		goto out;
+	}
+
+	asd = v4l2_async_nf_add_fwnode(&cru->group->notifier, fwnode,
+				       struct v4l2_async_subdev);
+	if (IS_ERR(asd)) {
+		ret = PTR_ERR(asd);
+		goto out;
+	}
+
+	cru->group->csi.asd = asd;
+
+	cru_dbg(cru, "Add group OF device %pOF to slot %u\n",
+		to_of_node(fwnode), vep.base.id);
+out:
+	fwnode_handle_put(fwnode);
+
+	return ret;
+}
+
+static int rzg2l_cru_parse_of_graph(struct rzg2l_cru_dev *cru)
+{
+	int ret;
+
+	cru->group->cru = cru;
+	v4l2_async_nf_init(&cru->group->notifier);
+
+	ret = rzg2l_cru_parse_of(cru, 0);
+	if (ret)
+		return ret;
+
+	cru->group->notifier.ops = &rzg2l_cru_group_notify_ops;
+
+	if (list_empty(&cru->group->notifier.asd_list))
+		return 0;
+
+	ret = v4l2_async_nf_register(&cru->v4l2_dev, &cru->group->notifier);
+	if (ret < 0) {
+		cru_err(cru, "Notifier registration failed\n");
+		v4l2_async_nf_cleanup(&cru->group->notifier);
+		return ret;
+	}
+
+	return ret;
+}
+
+static int rzg2l_cru_csi2_init(struct rzg2l_cru_dev *cru)
+{
+	struct media_device *mdev = NULL;
+	const struct of_device_id *match;
+	struct rzg2l_cru_group *group;
+	int ret;
+
+	cru->pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&cru->vdev.entity, 1, &cru->pad);
+	if (ret)
+		return ret;
+
+	group = kzalloc(sizeof(*group), GFP_KERNEL);
+	if (!group)
+		return -ENOMEM;
+
+	mutex_init(&group->lock);
+	mdev = &group->mdev;
+	mdev->dev = cru->dev;
+	mdev->ops = &rzg2l_cru_media_ops;
+
+	match = of_match_node(cru->dev->driver->of_match_table,
+			      cru->dev->of_node);
+
+	strscpy(mdev->driver_name, KBUILD_MODNAME, sizeof(mdev->driver_name));
+	strscpy(mdev->model, match->compatible, sizeof(mdev->model));
+	snprintf(mdev->bus_info, sizeof(mdev->bus_info), "platform:%s",
+		 dev_name(mdev->dev));
+
+	cru->group = group;
+	cru->v4l2_dev.mdev = &group->mdev;
+
+	media_device_init(mdev);
+
+	ret = rzg2l_cru_parse_of_graph(cru);
+	if (ret)
+		rzg2l_cru_group_put(cru);
+
+	return ret;
+}
+
+static int rzg2l_cru_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct rzg2l_cru_dev *cru = container_of(ctrl->handler,
+						 struct rzg2l_cru_dev,
+						 ctrl_handler);
+	int ret = 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
+		if (cru->state == STOPPED || cru->state == STOPPING)
+			cru->num_buf = ctrl->val;
+		else
+			ret = -EBUSY;
+
+		break;
+	}
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops rzg2l_cru_ctrl_ops = {
+	.s_ctrl = rzg2l_cru_s_ctrl,
+};
+
+static int rzg2l_cru_probe(struct platform_device *pdev)
+{
+	struct rzg2l_cru_dev *cru;
+	struct v4l2_ctrl *ctrl;
+	int irq, ret;
+
+	cru = devm_kzalloc(&pdev->dev, sizeof(*cru), GFP_KERNEL);
+	if (!cru)
+		return -ENOMEM;
+
+	cru->dev = &pdev->dev;
+	cru->info = of_device_get_match_data(&pdev->dev);
+
+	cru->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(cru->base))
+		return PTR_ERR(cru->base);
+
+	irq = platform_get_irq(pdev, 1);
+	if (irq < 0)
+		return irq;
+
+	cru->vclk = clk_get(&pdev->dev, "vclk");
+	if (IS_ERR(cru->vclk))
+		return PTR_ERR(cru->vclk);
+
+	cru->cmn_restb = devm_reset_control_get_by_index(&pdev->dev, 0);
+	if (IS_ERR(cru->cmn_restb)) {
+		dev_err(&pdev->dev, "failed to get cpg cmn_restb\n");
+		return PTR_ERR(cru->cmn_restb);
+	}
+	cru->presetn = devm_reset_control_get_by_index(&pdev->dev, 1);
+	if (IS_ERR(cru->presetn)) {
+		dev_err(&pdev->dev, "failed to get cpg presetn\n");
+		return PTR_ERR(cru->presetn);
+	}
+	cru->aresetn = devm_reset_control_get_by_index(&pdev->dev, 2);
+	if (IS_ERR(cru->aresetn)) {
+		dev_err(&pdev->dev, "failed to get cpg aresetn\n");
+		return PTR_ERR(cru->aresetn);
+	}
+
+	ret = reset_control_deassert(cru->presetn);
+	if (ret) {
+		cru_err(cru, "failed to deassert presetn\n");
+		return ret;
+	}
+
+	ret = rzg2l_cru_dma_register(cru, irq);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, cru);
+
+	ret = rzg2l_cru_csi2_init(cru);
+	if (ret)
+		goto error_dma_unregister;
+
+	ret = rzg2l_csi2_register(cru);
+	if (ret)
+		return ret;
+
+	v4l2_ctrl_handler_init(&cru->ctrl_handler, 1);
+	ctrl = v4l2_ctrl_new_std(&cru->ctrl_handler, &rzg2l_cru_ctrl_ops,
+				 V4L2_CID_MIN_BUFFERS_FOR_CAPTURE,
+				 1, HW_BUFFER_MAX, 1, HW_BUFFER_DEFAULT);
+	if (cru->ctrl_handler.error) {
+		dev_err(&pdev->dev, "%s: control initialization error %d\n",
+			__func__, cru->ctrl_handler.error);
+		ret = cru->ctrl_handler.error;
+		goto free_ctrl;
+	}
+
+	ctrl->flags &= ~V4L2_CTRL_FLAG_READ_ONLY;
+	cru->v4l2_dev.ctrl_handler = &cru->ctrl_handler;
+
+	cru->num_buf = HW_BUFFER_DEFAULT;
+
+	pm_suspend_ignore_children(&pdev->dev, true);
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
+
+free_ctrl:
+	v4l2_ctrl_handler_free(&cru->ctrl_handler);
+error_dma_unregister:
+	rzg2l_cru_dma_unregister(cru);
+
+	return ret;
+}
+
+static const struct rzg2l_cru_info rzg2l_cru_info_generic = {
+	.max_width = 2800,
+	.max_height = 4096,
+};
+
+static const struct of_device_id rzg2l_cru_of_id_table[] = {
+	{
+		.compatible = "renesas,rzg2l-cru",
+		.data = &rzg2l_cru_info_generic,
+	},
+	{ /* Sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, rzg2l_cru_of_id_table);
+
+static int rzg2l_cru_remove(struct platform_device *pdev)
+{
+	struct rzg2l_cru_dev *cru = platform_get_drvdata(pdev);
+	struct rzg2l_cru_group *group = cru->group;
+
+	pm_runtime_disable(&pdev->dev);
+
+	rzg2l_cru_v4l2_unregister(cru);
+
+	v4l2_async_nf_unregister(&group->notifier);
+	v4l2_async_nf_cleanup(&group->notifier);
+
+	media_device_cleanup(&group->mdev);
+	mutex_destroy(&group->lock);
+	cru->group->cru = NULL;
+	cru->group = NULL;
+	cru->v4l2_dev.mdev = NULL;
+	kfree(group);
+
+	v4l2_ctrl_handler_free(&cru->ctrl_handler);
+	cru->vdev.ctrl_handler = NULL;
+
+	rzg2l_csi2_unregister(cru);
+	rzg2l_cru_dma_unregister(cru);
+	reset_control_assert(cru->presetn);
+
+	return 0;
+}
+
+static struct platform_driver rzg2l_cru_driver = {
+	.driver = {
+		.name = "rzg2l-cru",
+		.of_match_table = rzg2l_cru_of_id_table,
+	},
+	.probe = rzg2l_cru_probe,
+	.remove = rzg2l_cru_remove,
+};
+
+module_platform_driver(rzg2l_cru_driver);
+
+MODULE_DESCRIPTION("Renesas RZ/G2L CRU driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/rzg2l-cru/rzg2l-cru.h
new file mode 100644
index 000000000000..6ec19d5338b4
--- /dev/null
+++ b/drivers/media/platform/rzg2l-cru/rzg2l-cru.h
@@ -0,0 +1,244 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * rzg2l-cru.h
+ *
+ * Renesas RZ/G2L CRU
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+#ifndef __RZG2L_CRU__
+#define __RZG2L_CRU__
+
+#include <media/v4l2-async.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-device.h>
+#include <media/videobuf2-v4l2.h>
+#include <linux/reset.h>
+#include <linux/clk.h>
+
+/* Number of HW buffers */
+#define HW_BUFFER_MAX		8
+#define HW_BUFFER_DEFAULT	3
+
+/* Address alignment mask for HW buffers */
+#define HW_BUFFER_MASK		0x1ff
+
+/* Maximum number of CSI2 virtual channels */
+#define CSI2_VCHANNEL		4
+
+/**
+ * enum rzg2l_cru_dma_state - DMA states
+ * @STOPPED:   No operation in progress
+ * @STARTING:  Capture starting up
+ * @RUNNING:   Operation in progress have buffers
+ * @STOPPING:  Stopping operation
+ */
+enum rzg2l_cru_dma_state {
+	STOPPED = 0,
+	STARTING,
+	RUNNING,
+	STOPPING,
+};
+
+/**
+ * struct rzg2l_cru_video_format - Data format stored in memory
+ * @fourcc: Pixelformat
+ * @bpp: Bytes per pixel
+ */
+struct rzg2l_cru_video_format {
+	u32 fourcc;
+	u8 bpp;
+};
+
+/**
+ * struct rzg2l_cru_info - Information about the particular CRU implementation
+ * @max_width:	max input width the CRU supports
+ * @max_height:	max input height the CRU supports
+ */
+struct rzg2l_cru_info {
+	unsigned int max_width;
+	unsigned int max_height;
+};
+
+enum rzg2l_csi2_pads {
+	RZG2L_CSI2_SINK = 0,
+	RZG2L_CSI2_SOURCE_VC0,
+	RZG2L_CSI2_SOURCE_VC1,
+	RZG2L_CSI2_SOURCE_VC2,
+	RZG2L_CSI2_SOURCE_VC3,
+	NR_OF_RZG2L_CSI2_PAD,
+};
+
+struct rzg2l_csi2 {
+	struct device *dev;
+
+	struct v4l2_subdev subdev;
+	struct media_pad pads[NR_OF_RZG2L_CSI2_PAD];
+
+	struct v4l2_async_notifier notifier;
+	struct v4l2_async_subdev asd;
+	struct v4l2_subdev *remote;
+
+	struct v4l2_mbus_framefmt mf;
+
+	struct mutex lock;
+	int stream_count;
+
+	unsigned short lanes;
+	unsigned long hsfreq;
+};
+
+/**
+ * struct rzg2l_cru_dev - Renesas CRU device structure
+ * @dev:		(OF) device
+ * @base:		device I/O register space remapped to virtual memory
+ * @info:		info about CRU instance
+ *
+ * @vclk:		CRU main clock
+ * @cmn_restb:		CRU_CMN_RSTB reset line
+ * @presetn:		CRU_PRESETN reset line
+ * @aresetn:		CRU_ARESETN reset line
+ *
+ * @vdev:		V4L2 video device associated with CRU
+ * @v4l2_dev:		V4L2 device
+ * @ctrl_handler:	V4L2 control handler
+ * @num_buf:		Holds the current number of buffers enabled
+ * @notifier:		V4L2 asynchronous subdevs notifier
+ *
+ * @group:		CSI group
+ * @pad:		media pad for the video device entity
+ *
+ * @lock:		protects @queue
+ * @queue:		vb2 buffers queue
+ * @scratch:		cpu address for scratch buffer
+ * @scratch_phys:	physical address of the scratch buffer
+ *
+ * @qlock:		protects @queue_buf, @buf_list, @sequence
+ *			@state
+ * @queue_buf:		Keeps track of buffers given to HW slot
+ * @buf_list:		list of queued buffers
+ * @sequence:		V4L2 buffers sequence number
+ * @state:		keeps track of operation state
+ *
+ * @is_csi:		flag to mark the CRU as using a CSI-2 subdevice
+ * @csi2:		pointer to CSI2 structure
+ *
+ * @input_is_yuv:	flag to mark the input format of CRU
+ * @output_is_yuv:	flag to mark the output format of CRU
+ *
+ * @mbus_code:		media bus format code
+ * @format:		active V4L2 pixel format
+ *
+ * @compose:		active composing
+ * @source:		active size of the video source
+ * @std:		active video standard of the video source
+ */
+struct rzg2l_cru_dev {
+	struct device *dev;
+	void __iomem *base;
+	const struct rzg2l_cru_info *info;
+
+	struct clk *vclk;
+
+	struct reset_control *cmn_restb;
+	struct reset_control *presetn;
+	struct reset_control *aresetn;
+
+	struct video_device vdev;
+	struct v4l2_device v4l2_dev;
+	struct v4l2_ctrl_handler ctrl_handler;
+	u8 num_buf;
+	struct v4l2_async_notifier notifier;
+
+	struct rzg2l_cru_group *group;
+	struct media_pad pad;
+
+	struct mutex lock;
+	struct vb2_queue queue;
+	void *scratch;
+	dma_addr_t scratch_phys;
+
+	spinlock_t qlock;
+	struct vb2_v4l2_buffer *queue_buf[HW_BUFFER_MAX];
+	struct list_head buf_list;
+	unsigned int sequence;
+	enum rzg2l_cru_dma_state state;
+
+	struct rzg2l_csi2 *csi2;
+	bool is_csi;
+
+	bool input_is_yuv;
+	bool output_is_yuv;
+
+	u32 mbus_code;
+	struct v4l2_pix_format format;
+
+	struct v4l2_rect compose;
+};
+
+/* Debug */
+#define cru_dbg(d, fmt, arg...)		dev_dbg((d)->dev, fmt, ##arg)
+#define cru_info(d, fmt, arg...)	dev_info((d)->dev, fmt, ##arg)
+#define cru_warn(d, fmt, arg...)	dev_warn((d)->dev, fmt, ##arg)
+#define cru_err(d, fmt, arg...)		dev_err((d)->dev, fmt, ##arg)
+
+/**
+ * struct rzg2l_cru_group - CRU CSI2 group information
+ * @mdev: media device which represents the group
+ *
+ * @lock: protects the count, notifier, vin and csi members
+ *
+ * @notifier: group notifier for CSI-2 async subdevices
+ * @cru: CRU instances which are part of the group
+ * @csi: array of pairs of fwnode and subdev pointers
+ *       to all CSI-2 subdevices.
+ */
+struct rzg2l_cru_group {
+	struct media_device mdev;
+
+	struct mutex lock;
+	struct v4l2_async_notifier notifier;
+	struct rzg2l_cru_dev *cru;
+
+	struct {
+		struct v4l2_async_subdev *asd;
+		struct v4l2_subdev *subdev;
+		u32 channel;
+	} csi;
+};
+
+static void rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
+{
+	iowrite32(value, cru->base + offset);
+}
+
+static u32 rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
+{
+	return ioread32(cru->base + offset);
+}
+
+static __maybe_unused void rzg2l_cru_set(struct rzg2l_cru_dev *cru, unsigned int reg, u32 set)
+{
+	rzg2l_cru_write(cru, reg, rzg2l_cru_read(cru, reg) | set);
+}
+
+static __maybe_unused void rzg2l_cru_clr(struct rzg2l_cru_dev *cru, unsigned int reg, u32 clr)
+{
+	rzg2l_cru_write(cru, reg, rzg2l_cru_read(cru, reg) & ~clr);
+}
+
+int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru, int irq);
+void rzg2l_cru_dma_unregister(struct rzg2l_cru_dev *cru);
+
+int rzg2l_cru_v4l2_register(struct rzg2l_cru_dev *cru);
+void rzg2l_cru_v4l2_unregister(struct rzg2l_cru_dev *cru);
+
+int rzg2l_csi2_register(struct rzg2l_cru_dev *cru);
+void rzg2l_csi2_unregister(struct rzg2l_cru_dev *cru);
+
+const struct rzg2l_cru_video_format
+*rzg2l_cru_format_from_pixel(u32 pixelformat);
+
+#endif
diff --git a/drivers/media/platform/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/rzg2l-cru/rzg2l-csi2.c
new file mode 100644
index 000000000000..719f3aebf77b
--- /dev/null
+++ b/drivers/media/platform/rzg2l-cru/rzg2l-csi2.c
@@ -0,0 +1,625 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Renesas RZ/G2L MIPI CSI-2 Receiver
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+#include <linux/sys_soc.h>
+#include <linux/units.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+#include "rzg2l-cru.h"
+
+/* CSI-2 LINK registers */
+#define CSI2nMCG			0x400
+#define CSI2nMCG_SDLN			GENMASK(11, 8)
+
+#define CSI2nMCT0			0x410
+#define CSI2nMCT0_VDLN(x)		((x) << 0)
+
+#define CSI2nMCT2			0x418
+#define CSI2nMCT2_FRRSKW(x)		((x) << 16)
+#define CSI2nMCT2_FRRCLK(x)		((x) << 0)
+
+#define CSI2nMCT3			0x41c
+#define CSI2nMCT3_RXEN			BIT(0)
+
+#define CSI2nRTCT			0x428
+#define CSI2nRTCT_VSRST			BIT(0)
+
+#define CSI2nRTST			0x42c
+#define CSI2nRTST_VSRSTS		BIT(0)
+
+#define CSI2nDTEL			0x460
+
+#define CSI2nDTEH			0x464
+
+/* CSI-2 D-PHY registers */
+#define CSIDPHYCTRL0			0x800
+#define CSIDPHYCTRL0_EN_LDO1200		BIT(1)
+#define CSIDPHYCTRL0_EN_BGR		BIT(0)
+
+#define CSIDPHYTIM0			0x804
+#define CSIDPHYTIM0_TCLK_MISS(x)	((x) << 24)
+#define CSIDPHYTIM0_T_INIT(x)		((x) << 0)
+
+#define CSIDPHYTIM1			0x808
+#define CSIDPHYTIM1_THS_PREPARE(x)	((x) << 24)
+#define CSIDPHYTIM1_TCLK_PREPARE(x)	((x) << 16)
+#define CSIDPHYTIM1_THS_SETTLE(x)	((x) << 8)
+
+#define VSRSTS_TIMEOUT_MS		100
+#define VSRSTS_RETRIES			20
+
+struct timings {
+	u32 t_init;
+	u32 tclk_miss;
+	u32 tclk_settle;
+	u32 ths_settle;
+	u32 tclk_prepare;
+	u32 ths_prepare;
+};
+
+enum dphy_timings {
+	TRANSMISSION_RATE_80_MBPS = 0,
+	TRANSMISSION_RATE_125_MBPS,
+	TRANSMISSION_RATE_250_MBPS,
+	TRANSMISSION_RATE_360_MBPS,
+	TRANSMISSION_RATE_360_PLUS_MBPS,
+};
+
+static const struct timings global_timings[] = {
+	[TRANSMISSION_RATE_80_MBPS] = {
+		.t_init = 79801,
+		.tclk_miss = 4,
+		.tclk_settle = 23,
+		.ths_settle = 31,
+		.tclk_prepare = 10,
+		.ths_prepare = 19,
+	},
+	[TRANSMISSION_RATE_125_MBPS] = {
+		.t_init = 79801,
+		.tclk_miss = 4,
+		.tclk_settle = 23,
+		.ths_settle = 28,
+		.tclk_prepare = 10,
+		.ths_prepare = 19,
+	},
+	[TRANSMISSION_RATE_250_MBPS] = {
+		.t_init = 79801,
+		.tclk_miss = 4,
+		.tclk_settle = 23,
+		.ths_settle = 22,
+		.tclk_prepare = 10,
+		.ths_prepare = 16,
+	},
+	[TRANSMISSION_RATE_360_MBPS] = {
+		.t_init = 79801,
+		.tclk_miss = 4,
+		.tclk_settle = 18,
+		.ths_settle = 19,
+		.tclk_prepare = 10,
+		.ths_prepare = 10,
+	},
+	[TRANSMISSION_RATE_360_PLUS_MBPS] = {
+		.t_init = 79801,
+		.tclk_miss = 4,
+		.tclk_settle = 18,
+		.ths_settle = 18,
+		.tclk_prepare = 10,
+		.ths_prepare = 10,
+	},
+};
+
+struct rzg2l_csi2_format {
+	u32 code;
+	unsigned int bpp;
+};
+
+static const struct rzg2l_csi2_format rzg2l_csi2_formats[] = {
+	{ .code = MEDIA_BUS_FMT_UYVY8_2X8,	.bpp = 16 },
+};
+
+static const struct rzg2l_csi2_format *rzg2l_csi2_code_to_fmt(unsigned int code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rzg2l_csi2_formats); i++)
+		if (rzg2l_csi2_formats[i].code == code)
+			return &rzg2l_csi2_formats[i];
+
+	return NULL;
+}
+
+static inline struct rzg2l_csi2 *sd_to_csi2(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct rzg2l_csi2, subdev);
+}
+
+static inline struct rzg2l_csi2 *notifier_to_csi2(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct rzg2l_csi2, notifier);
+}
+
+/* -----------------------------------------------------------------------------
+ * DPHY setting
+ */
+
+static int rzg2l_csi2_dphy_setting(struct rzg2l_cru_dev *cru, bool on)
+{
+	struct rzg2l_csi2 *csi2 = cru->csi2;
+	int ret = 0;
+
+	if (on) {
+		struct timings dphy_timing;
+		u32 dphytim0, dphytim1;
+
+		/* Release reset state */
+		ret = reset_control_deassert(cru->cmn_restb);
+		if (ret)
+			return ret;
+
+		/* Wait until the power stabilizes */
+		mdelay(1);
+
+		/* Set DPHY timing parameters */
+		if (csi2->hsfreq <= 80)
+			dphy_timing = global_timings[TRANSMISSION_RATE_80_MBPS];
+		else if (csi2->hsfreq > 80 && csi2->hsfreq <= 125)
+			dphy_timing = global_timings[TRANSMISSION_RATE_125_MBPS];
+		else if (csi2->hsfreq > 125 && csi2->hsfreq <= 250)
+			dphy_timing = global_timings[TRANSMISSION_RATE_250_MBPS];
+		else if (csi2->hsfreq > 250 && csi2->hsfreq <= 360)
+			dphy_timing = global_timings[TRANSMISSION_RATE_360_MBPS];
+		else if (csi2->hsfreq > 360 && csi2->hsfreq <= 1500)
+			dphy_timing = global_timings[TRANSMISSION_RATE_360_PLUS_MBPS];
+		else
+			return -EINVAL;
+
+		dphytim0 = CSIDPHYTIM0_TCLK_MISS(dphy_timing.tclk_miss) |
+			   CSIDPHYTIM0_T_INIT(dphy_timing.t_init);
+		dphytim1 = CSIDPHYTIM1_THS_PREPARE(dphy_timing.ths_prepare) |
+			   CSIDPHYTIM1_TCLK_PREPARE(dphy_timing.tclk_prepare) |
+			   CSIDPHYTIM1_THS_SETTLE(dphy_timing.ths_settle) |
+			   CSIDPHYTIM1_THS_SETTLE(dphy_timing.tclk_settle);
+
+		rzg2l_cru_write(cru, CSIDPHYTIM0, dphytim0);
+		rzg2l_cru_write(cru, CSIDPHYTIM1, dphytim1);
+
+		/* Set the EN_BGR bit */
+		rzg2l_cru_set(cru, CSIDPHYCTRL0, CSIDPHYCTRL0_EN_BGR);
+
+		/* Delay 20us to be stable */
+		usleep_range(20, 40);
+
+		/* Set the EN_LDO1200 bit */
+		rzg2l_cru_set(cru, CSIDPHYCTRL0, CSIDPHYCTRL0_EN_LDO1200);
+
+		/* Delay 10us to be stable */
+		usleep_range(10, 20);
+	} else {
+		/* Cancel the EN_LDO1200 register setting */
+		rzg2l_cru_clr(cru, CSIDPHYCTRL0, CSIDPHYCTRL0_EN_LDO1200);
+
+		/* Cancel the EN_BGR register setting */
+		rzg2l_cru_clr(cru, CSIDPHYCTRL0, CSIDPHYCTRL0_EN_BGR);
+
+		/* Set reset state */
+		reset_control_assert(cru->cmn_restb);
+	}
+
+	return ret;
+}
+
+static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2, unsigned int bpp)
+{
+	struct v4l2_subdev *source;
+	struct v4l2_ctrl *ctrl;
+	u64 mbps;
+
+	if (!csi2->remote)
+		return -ENODEV;
+
+	source = csi2->remote;
+
+	/* Read the pixel rate control from remote. */
+	ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
+	if (!ctrl) {
+		dev_err(csi2->dev, "no pixel rate control in subdev %s\n",
+			source->name);
+		return -EINVAL;
+	}
+
+	/*
+	 * Calculate hsfreq in Mbps
+	 * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
+	 */
+	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
+	do_div(mbps, csi2->lanes * 1000000);
+
+	return mbps;
+}
+
+static void rzg2l_csi2_stop(struct rzg2l_cru_dev *cru)
+{
+	unsigned int timeout = VSRSTS_RETRIES;
+	struct rzg2l_csi2 *csi2 = cru->csi2;
+
+	/* Stop DPHY reception */
+	rzg2l_csi2_dphy_setting(cru, 0);
+
+	/* Stop LINK reception */
+	rzg2l_cru_clr(cru, CSI2nMCT3, CSI2nMCT3_RXEN);
+
+	/* Request a software reset of the LINK Video Pixel Interface */
+	rzg2l_cru_write(cru, CSI2nRTCT, CSI2nRTCT_VSRST);
+
+	while (timeout--) {
+		/* Make sure that the execution status is not during a reset */
+		if (!(rzg2l_cru_read(cru, CSI2nRTST) & CSI2nRTST_VSRSTS))
+			break;
+		msleep(VSRSTS_TIMEOUT_MS);
+	};
+	if (!timeout)
+		dev_err(csi2->dev, "CSI2nRTCT_VSRST bit is not cleared\n");
+}
+
+static int rzg2l_csi2_start(struct rzg2l_cru_dev *cru)
+{
+	unsigned long vclk_rate = clk_get_rate(cru->vclk);
+	const struct rzg2l_csi2_format *format;
+	struct rzg2l_csi2 *csi2 = cru->csi2;
+	int lanes, mbps, ret;
+	u32 frrskw, frrclk;
+
+	dev_dbg(cru->dev, "Input size (%ux%u%c)\n",
+		csi2->mf.width, csi2->mf.height,
+		csi2->mf.field == V4L2_FIELD_NONE ? 'p' : 'i');
+
+	/* Code is validated in set_fmt. */
+	format = rzg2l_csi2_code_to_fmt(csi2->mf.code);
+
+	/* Checking the maximum lanes support for CSI2 module */
+	lanes = (rzg2l_cru_read(cru, CSI2nMCG) & CSI2nMCG_SDLN) >> 8;
+	if (lanes < csi2->lanes) {
+		dev_err(csi2->dev,
+			"Failed to support %d data lanes\n", csi2->lanes);
+		return -EINVAL;
+	}
+
+	mbps = rzg2l_csi2_calc_mbps(csi2, format->bpp);
+	if (mbps < 0)
+		return mbps;
+
+	csi2->hsfreq = mbps;
+
+	/* Initialize DPHY */
+	ret = rzg2l_csi2_dphy_setting(cru, 1);
+	if (ret) {
+		rzg2l_csi2_dphy_setting(cru, 0);
+		return ret;
+	}
+
+	rzg2l_cru_write(cru, CSI2nMCT0, CSI2nMCT0_VDLN(csi2->lanes));
+
+	vclk_rate = vclk_rate / HZ_PER_MHZ;
+	frrskw = (3 * vclk_rate * 8) / csi2->hsfreq;
+	frrclk = frrskw / 2;
+	rzg2l_cru_write(cru, CSI2nMCT2,
+			CSI2nMCT2_FRRSKW(frrskw + 1) | CSI2nMCT2_FRRCLK(frrclk + 1));
+
+	/* Select data type. */
+	rzg2l_cru_write(cru, CSI2nDTEL, 0xf778ff0f);
+	rzg2l_cru_write(cru, CSI2nDTEH, 0x00ffff1f);
+
+	/* Enable LINK reception */
+	rzg2l_cru_set(cru, CSI2nMCT3, CSI2nMCT3_RXEN);
+
+	return 0;
+}
+
+static int rzg2l_csi2_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct rzg2l_cru_dev *cru = v4l2_get_subdevdata(sd);
+	struct rzg2l_csi2 *csi2 = cru->csi2;
+	int ret = 0;
+
+	mutex_lock(&csi2->lock);
+
+	if (!csi2->remote) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	if (enable && csi2->stream_count == 0) {
+		ret = rzg2l_csi2_start(cru);
+		if (ret)
+			goto out;
+
+		ret = v4l2_subdev_call(csi2->remote, video, s_stream, 1);
+		if (ret) {
+			rzg2l_csi2_stop(cru);
+			goto out;
+		}
+	} else if (!enable && csi2->stream_count == 1) {
+		v4l2_subdev_call(csi2->remote, video, s_stream, 0);
+		rzg2l_csi2_stop(cru);
+	}
+
+	csi2->stream_count += enable ? 1 : -1;
+out:
+	mutex_unlock(&csi2->lock);
+
+	return ret;
+}
+
+static int rzg2l_cru_set_pad_format(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_format *format)
+{
+	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
+	struct v4l2_mbus_framefmt *framefmt;
+
+	mutex_lock(&csi2->lock);
+
+	if (!rzg2l_csi2_code_to_fmt(format->format.code))
+		format->format.code = rzg2l_csi2_formats[0].code;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		csi2->mf = format->format;
+	} else {
+		framefmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
+		*framefmt = format->format;
+	}
+
+	mutex_unlock(&csi2->lock);
+
+	return 0;
+}
+
+static int rzg2l_csi2_get_pad_format(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state,
+				     struct v4l2_subdev_format *format)
+{
+	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
+
+	mutex_lock(&csi2->lock);
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		format->format = csi2->mf;
+	else
+		format->format = *v4l2_subdev_get_try_format(sd, sd_state, 0);
+	mutex_unlock(&csi2->lock);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops rzg2l_csi2_video_ops = {
+	.s_stream = rzg2l_csi2_s_stream,
+};
+
+static const struct v4l2_subdev_pad_ops rzg2l_csi2_pad_ops = {
+	.set_fmt = rzg2l_cru_set_pad_format,
+	.get_fmt = rzg2l_csi2_get_pad_format,
+};
+
+static const struct v4l2_subdev_ops rzg2l_csi2_subdev_ops = {
+	.video	= &rzg2l_csi2_video_ops,
+	.pad	= &rzg2l_csi2_pad_ops,
+};
+
+/* -----------------------------------------------------------------------------
+ * Async handling and registration of subdevices and links.
+ */
+
+static int rzg2l_csi2_notify_bound(struct v4l2_async_notifier *notifier,
+				   struct v4l2_subdev *subdev,
+				   struct v4l2_async_subdev *asd)
+{
+	struct rzg2l_csi2 *csi2 = notifier_to_csi2(notifier);
+	int pad;
+
+	pad = media_entity_get_fwnode_pad(&subdev->entity, asd->match.fwnode,
+					  MEDIA_PAD_FL_SOURCE);
+	if (pad < 0) {
+		dev_err(csi2->dev, "Failed to find pad for %s\n", subdev->name);
+		return pad;
+	}
+
+	csi2->remote = subdev;
+
+	dev_dbg(csi2->dev, "Bound %s pad: %d\n", subdev->name, pad);
+
+	return media_create_pad_link(&subdev->entity, pad,
+				     &csi2->subdev.entity, 0,
+				     MEDIA_LNK_FL_ENABLED |
+				     MEDIA_LNK_FL_IMMUTABLE);
+}
+
+static void rzg2l_csi2_notify_unbind(struct v4l2_async_notifier *notifier,
+				     struct v4l2_subdev *subdev,
+				     struct v4l2_async_subdev *asd)
+{
+	struct rzg2l_csi2 *csi2 = notifier_to_csi2(notifier);
+
+	csi2->remote = NULL;
+
+	dev_dbg(csi2->dev, "Unbind %s\n", subdev->name);
+}
+
+static const struct v4l2_async_notifier_operations rzg2l_csi2_notify_ops = {
+	.bound = rzg2l_csi2_notify_bound,
+	.unbind = rzg2l_csi2_notify_unbind,
+};
+
+static int rzg2l_csi2_parse_v4l2(struct rzg2l_cru_dev *cru,
+				 struct rzg2l_csi2 *csi2,
+				 struct v4l2_fwnode_endpoint *vep)
+{
+	/* Only port 1 endpoint 0 is valid. */
+	if (vep->base.port != 1 || vep->base.id)
+		return -ENOTCONN;
+
+	if (vep->bus_type != V4L2_MBUS_CSI2_DPHY) {
+		dev_err(cru->dev, "Unsupported bus: %u\n", vep->bus_type);
+		return -EINVAL;
+	}
+
+	csi2->lanes = vep->bus.mipi_csi2.num_data_lanes;
+	if (csi2->lanes != 1 && csi2->lanes != 2 && csi2->lanes != 4) {
+		dev_err(cru->dev, "Unsupported number of data-lanes: %u\n",
+			csi2->lanes);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rzg2l_csi2_parse_dt(struct rzg2l_cru_dev *cru,
+			       struct rzg2l_csi2 *csi2)
+{
+	struct v4l2_fwnode_endpoint v4l2_ep = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
+	struct v4l2_async_subdev *asd;
+	struct fwnode_handle *fwnode;
+	struct fwnode_handle *ep;
+	int ret;
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(cru->dev), 1, 0, 0);
+	if (!ep) {
+		dev_err(cru->dev, "Not connected to subdevice\n");
+		return -EINVAL;
+	}
+
+	ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
+	if (ret) {
+		dev_err(cru->dev, "Could not parse v4l2 endpoint\n");
+		fwnode_handle_put(ep);
+		return -EINVAL;
+	}
+
+	ret = rzg2l_csi2_parse_v4l2(cru, csi2, &v4l2_ep);
+	if (ret) {
+		fwnode_handle_put(ep);
+		return ret;
+	}
+
+	fwnode = fwnode_graph_get_remote_endpoint(ep);
+	fwnode_handle_put(ep);
+
+	dev_dbg(cru->dev, "Found '%pOF'\n", to_of_node(fwnode));
+
+	v4l2_async_nf_init(&csi2->notifier);
+	csi2->notifier.ops = &rzg2l_csi2_notify_ops;
+
+	asd = v4l2_async_nf_add_fwnode(&csi2->notifier, fwnode,
+				       struct v4l2_async_subdev);
+	fwnode_handle_put(fwnode);
+	if (IS_ERR(asd))
+		return PTR_ERR(asd);
+
+	ret = v4l2_async_subdev_nf_register(&csi2->subdev, &csi2->notifier);
+	if (ret)
+		v4l2_async_nf_cleanup(&csi2->notifier);
+
+	return ret;
+}
+
+/* -----------------------------------------------------------------------------
+ * Platform Device Driver.
+ */
+
+static const struct media_entity_operations rzg2l_csi2_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+int rzg2l_csi2_register(struct rzg2l_cru_dev *cru)
+{
+	struct device *dev = cru->dev;
+	struct rzg2l_csi2 *csi2;
+	unsigned int i;
+	int ret;
+
+	csi2 = devm_kzalloc(dev, sizeof(*csi2), GFP_KERNEL);
+	if (!csi2)
+		return -ENOMEM;
+
+	csi2->dev = dev;
+	cru->csi2 = csi2;
+
+	mutex_init(&csi2->lock);
+	csi2->stream_count = 0;
+
+	ret = rzg2l_csi2_parse_dt(cru, csi2);
+	if (ret)
+		goto error_mutex;
+
+	csi2->subdev.owner = THIS_MODULE;
+	csi2->subdev.dev = dev;
+	v4l2_subdev_init(&csi2->subdev, &rzg2l_csi2_subdev_ops);
+	v4l2_set_subdevdata(&csi2->subdev, cru);
+	snprintf(csi2->subdev.name, V4L2_SUBDEV_NAME_SIZE, "%s %s",
+		 KBUILD_MODNAME, dev_name(dev));
+	csi2->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+
+	csi2->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	csi2->subdev.entity.ops = &rzg2l_csi2_entity_ops;
+
+	csi2->pads[RZG2L_CSI2_SINK].flags = MEDIA_PAD_FL_SINK;
+	for (i = RZG2L_CSI2_SOURCE_VC0; i < NR_OF_RZG2L_CSI2_PAD; i++)
+		csi2->pads[i].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&csi2->subdev.entity, NR_OF_RZG2L_CSI2_PAD,
+				     csi2->pads);
+	if (ret)
+		goto error_async;
+
+	ret = v4l2_async_register_subdev(&csi2->subdev);
+	if (ret < 0)
+		goto error_async;
+
+	dev_info(dev, "%d lanes found\n", csi2->lanes);
+
+	return 0;
+
+error_async:
+	v4l2_async_nf_unregister(&csi2->notifier);
+	v4l2_async_nf_cleanup(&csi2->notifier);
+error_mutex:
+	mutex_destroy(&csi2->lock);
+
+	return ret;
+}
+
+void rzg2l_csi2_unregister(struct rzg2l_cru_dev *cru)
+{
+	struct rzg2l_csi2 *csi2;
+
+	if (!cru->csi2)
+		return;
+
+	csi2 = cru->csi2;
+
+	v4l2_async_nf_unregister(&csi2->notifier);
+	v4l2_async_nf_cleanup(&csi2->notifier);
+	v4l2_async_unregister_subdev(&csi2->subdev);
+
+	mutex_destroy(&csi2->lock);
+}
diff --git a/drivers/media/platform/rzg2l-cru/rzg2l-dma.c b/drivers/media/platform/rzg2l-cru/rzg2l-dma.c
new file mode 100644
index 000000000000..c99b8bbc4d1f
--- /dev/null
+++ b/drivers/media/platform/rzg2l-cru/rzg2l-dma.c
@@ -0,0 +1,703 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for Renesas RZ/G2L CRU
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ *
+ * Based on Renesas R-Car VIN
+ * Copyright (C) 2016 Renesas Electronics Corp.
+ * Copyright (C) 2011-2013 Renesas Solutions Corp.
+ * Copyright (C) 2013 Cogent Embedded, Inc., <source@cogentembedded.com>
+ * Copyright (C) 2008 Magnus Damm
+ */
+
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+
+#include <media/videobuf2-dma-contig.h>
+
+#include "rzg2l-cru.h"
+
+/* HW CRU Registers Definition */
+/* CRU Control Register */
+#define CRUnCTRL			0x0
+#define CRUnCTRL_VINSEL(x)		((x) << 0)
+
+/* CRU Interrupt Enable Register */
+#define CRUnIE				0x4
+#define CRUnIE_SFE			BIT(16)
+#define CRUnIE_EFE			BIT(17)
+
+/* CRU Interrupt Status Register */
+#define CRUnINTS			0x8
+#define CRUnINTS_SFS			BIT(16)
+
+/* CRU Reset Register */
+#define CRUnRST				0xc
+#define CRUnRST_VRESETN			BIT(0)
+
+/* Memory Bank Base Address (Lower) Register for CRU Image Data */
+#define AMnMBxADDRL(x)			(0x100 + ((x) * 8))
+
+/* Memory Bank Base Address (Higher) Register for CRU Image Data */
+#define AMnMBxADDRH(x)			(0x104 + ((x) * 8))
+
+/* Memory Bank Enable Register for CRU Image Data */
+#define AMnMBVALID			0x148
+#define AMnMBVALID_MBVALID(x)		GENMASK(x, 0)
+
+/* Memory Bank Status Register for CRU Image Data */
+#define AMnMBS				0x14c
+#define AMnMBS_MBSTS			0x7
+
+/* AXI Master FIFO Pointer Register for CRU Image Data */
+#define AMnFIFOPNTR			0x168
+#define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
+#define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
+
+/* AXI Master Transfer Stop Register for CRU Image Data */
+#define AMnAXISTP			0x174
+#define AMnAXISTP_AXI_STOP		BIT(0)
+
+/* AXI Master Transfer Stop Status Register for CRU Image Data */
+#define AMnAXISTPACK			0x178
+#define AMnAXISTPACK_AXI_STOP_ACK	BIT(0)
+
+/* CRU Image Processing Enable Register */
+#define ICnEN				0x200
+#define ICnEN_ICEN			BIT(0)
+
+/* CRU Image Processing Main Control Register */
+#define ICnMC				0x208
+#define ICnMC_CSCTHR			BIT(5)
+#define ICnMC_INF_YUV8_422		(0x1E << 16)
+#define ICnMC_INF_USER			(0x30 << 16)
+#define ICnMC_VCSEL(x)			((x) << 22)
+#define ICnMC_INF_MASK			GENMASK(21, 16)
+
+/* CRU Module Status Register */
+#define ICnMS				0x254
+#define ICnMS_IA			BIT(2)
+
+/* CRU Data Output Mode Register */
+#define ICnDMR				0x26c
+#define ICnDMR_YCMODE_UYVY		(1 << 4)
+
+#define RZG2L_TIMEOUT_MS		100
+#define RZG2L_RETRIES			10
+
+struct rzg2l_cru_buffer {
+	struct vb2_v4l2_buffer vb;
+	struct list_head list;
+};
+
+#define to_buf_list(vb2_buffer) (&container_of(vb2_buffer, \
+						struct rzg2l_cru_buffer, \
+						vb)->list)
+
+/* Need to hold qlock before calling */
+static void return_unused_buffers(struct rzg2l_cru_dev *cru,
+				  enum vb2_buffer_state state)
+{
+	struct rzg2l_cru_buffer *buf, *node;
+	unsigned long flags;
+	unsigned int i;
+
+	spin_lock_irqsave(&cru->qlock, flags);
+	for (i = 0; i < cru->num_buf; i++) {
+		if (cru->queue_buf[i]) {
+			vb2_buffer_done(&cru->queue_buf[i]->vb2_buf,
+					state);
+			cru->queue_buf[i] = NULL;
+		}
+	}
+
+	list_for_each_entry_safe(buf, node, &cru->buf_list, list) {
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+		list_del(&buf->list);
+	}
+	spin_unlock_irqrestore(&cru->qlock, flags);
+}
+
+static int rzg2l_cru_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
+				 unsigned int *nplanes, unsigned int sizes[],
+				 struct device *alloc_devs[])
+{
+	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
+
+	/* Make sure the image size is large enough. */
+	if (*nplanes)
+		return sizes[0] < cru->format.sizeimage ? -EINVAL : 0;
+
+	*nplanes = 1;
+	sizes[0] = cru->format.sizeimage;
+
+	return 0;
+};
+
+static int rzg2l_cru_buffer_prepare(struct vb2_buffer *vb)
+{
+	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vb->vb2_queue);
+	unsigned long size = cru->format.sizeimage;
+
+	if (vb2_plane_size(vb, 0) < size) {
+		cru_err(cru, "buffer too small (%lu < %lu)\n",
+			vb2_plane_size(vb, 0), size);
+		return -EINVAL;
+	}
+
+	vb2_set_plane_payload(vb, 0, size);
+
+	return 0;
+}
+
+static void rzg2l_cru_buffer_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vb->vb2_queue);
+	unsigned long flags;
+
+	spin_lock_irqsave(&cru->qlock, flags);
+
+	list_add_tail(to_buf_list(vbuf), &cru->buf_list);
+
+	spin_unlock_irqrestore(&cru->qlock, flags);
+}
+
+static int rzg2l_cru_mc_validate_format(struct rzg2l_cru_dev *cru,
+					struct v4l2_subdev *sd,
+					struct media_pad *pad)
+{
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+
+	fmt.pad = pad->index;
+	if (v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt))
+		return -EPIPE;
+
+	if (cru->is_csi) {
+		switch (fmt.format.code) {
+		case MEDIA_BUS_FMT_UYVY8_2X8:
+			break;
+		default:
+			return -EPIPE;
+		}
+	}
+	cru->mbus_code = fmt.format.code;
+
+	switch (fmt.format.field) {
+	case V4L2_FIELD_TOP:
+	case V4L2_FIELD_BOTTOM:
+	case V4L2_FIELD_NONE:
+	case V4L2_FIELD_INTERLACED_TB:
+	case V4L2_FIELD_INTERLACED_BT:
+	case V4L2_FIELD_INTERLACED:
+	case V4L2_FIELD_SEQ_TB:
+	case V4L2_FIELD_SEQ_BT:
+		break;
+	default:
+		return -EPIPE;
+	}
+
+	if (fmt.format.width != cru->format.width ||
+	    fmt.format.height != cru->format.height ||
+	    fmt.format.code != cru->mbus_code)
+		return -EPIPE;
+
+	return 0;
+}
+
+static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
+				    int slot, dma_addr_t addr)
+{
+	const struct rzg2l_cru_video_format *fmt;
+	int offsetx, offsety;
+	dma_addr_t offset;
+
+	fmt = rzg2l_cru_format_from_pixel(cru->format.pixelformat);
+
+	/*
+	 * There is no HW support for composition do the best we can
+	 * by modifying the buffer offset
+	 */
+	offsetx = cru->compose.left * fmt->bpp;
+	offsety = cru->compose.top * cru->format.bytesperline;
+	offset = addr + offsetx + offsety;
+
+	/*
+	 * The address needs to be 512 bytes aligned. Driver should never accept
+	 * settings that do not satisfy this in the first place...
+	 */
+	if (WARN_ON((offsetx | offsety | offset) & HW_BUFFER_MASK))
+		return;
+
+	/* Currently, we just use the buffer in 32 bits address */
+	rzg2l_cru_write(cru, AMnMBxADDRL(slot), offset);
+	rzg2l_cru_write(cru, AMnMBxADDRH(slot), 0);
+}
+
+/*
+ * Moves a buffer from the queue to the HW slot. If no buffer is
+ * available use the scratch buffer. The scratch buffer is never
+ * returned to userspace, its only function is to enable the capture
+ * loop to keep running.
+ */
+static void rzg2l_cru_fill_hw_slot(struct rzg2l_cru_dev *cru, int slot)
+{
+	struct vb2_v4l2_buffer *vbuf;
+	struct rzg2l_cru_buffer *buf;
+	dma_addr_t phys_addr;
+
+	/* A already populated slot shall never be overwritten. */
+	if (WARN_ON(cru->queue_buf[slot]))
+		return;
+
+	cru_dbg(cru, "Filling HW slot: %d\n", slot);
+
+	if (list_empty(&cru->buf_list)) {
+		cru->queue_buf[slot] = NULL;
+		phys_addr = cru->scratch_phys;
+	} else {
+		/* Keep track of buffer we give to HW */
+		buf = list_entry(cru->buf_list.next,
+				 struct rzg2l_cru_buffer, list);
+		vbuf = &buf->vb;
+		list_del_init(to_buf_list(vbuf));
+		cru->queue_buf[slot] = vbuf;
+
+		/* Setup DMA */
+		phys_addr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
+	}
+
+	rzg2l_cru_set_slot_addr(cru, slot, phys_addr);
+}
+
+static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
+{
+	unsigned int slot;
+
+	/*
+	 * Set image data memory banks.
+	 * Currently, we will use maximum address.
+	 */
+	rzg2l_cru_write(cru, AMnMBVALID, AMnMBVALID_MBVALID(cru->num_buf - 1));
+
+	for (slot = 0; slot < cru->num_buf; slot++)
+		rzg2l_cru_fill_hw_slot(cru, slot);
+}
+
+static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru)
+{
+	u32 icnmc;
+
+	switch (cru->mbus_code) {
+	case MEDIA_BUS_FMT_UYVY8_2X8:
+		icnmc = ICnMC_INF_YUV8_422;
+		cru->input_is_yuv = true;
+		break;
+	default:
+		cru->input_is_yuv = false;
+		icnmc = ICnMC_INF_USER;
+		break;
+	}
+
+	icnmc |= (rzg2l_cru_read(cru, ICnMC) & ~ICnMC_INF_MASK);
+
+	/* Set virtual channel CSI2 */
+	icnmc |= ICnMC_VCSEL(cru->group->csi.channel);
+
+	rzg2l_cru_write(cru, ICnMC, icnmc);
+}
+
+static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru)
+{
+	u32 icndmr;
+
+	if (cru->is_csi)
+		rzg2l_cru_csi2_setup(cru);
+
+	/* Output format */
+	switch (cru->format.pixelformat) {
+	case V4L2_PIX_FMT_UYVY:
+		icndmr = ICnDMR_YCMODE_UYVY;
+		cru->output_is_yuv = true;
+		break;
+	default:
+		cru_err(cru, "Invalid pixelformat (0x%x)\n",
+			cru->format.pixelformat);
+		return -EINVAL;
+	}
+
+	/* If input and output use same colorspace, do bypass mode */
+	if (cru->output_is_yuv == cru->input_is_yuv)
+		rzg2l_cru_write(cru, ICnMC,
+				rzg2l_cru_read(cru, ICnMC) | ICnMC_CSCTHR);
+	else
+		rzg2l_cru_write(cru, ICnMC,
+				rzg2l_cru_read(cru, ICnMC) & (~ICnMC_CSCTHR));
+
+	/* Set output data format */
+	rzg2l_cru_write(cru, ICnDMR, icndmr);
+
+	return 0;
+}
+
+static int rzg2l_cru_set_stream(struct rzg2l_cru_dev *cru, int on)
+{
+	struct media_pipeline *pipe;
+	struct v4l2_subdev *sd;
+	struct media_pad *pad;
+	unsigned long flags;
+	int ret;
+
+	pad = media_entity_remote_pad(&cru->pad);
+	if (!pad)
+		return -EPIPE;
+
+	sd = media_entity_to_v4l2_subdev(pad->entity);
+
+	if (!on) {
+		media_pipeline_stop(&cru->vdev.entity);
+		return v4l2_subdev_call(sd, video, s_stream, 0);
+	}
+
+	ret = rzg2l_cru_mc_validate_format(cru, sd, pad);
+	if (ret)
+		return ret;
+
+	spin_lock_irqsave(&cru->qlock, flags);
+
+	/* Select a video input */
+	if (cru->is_csi)
+		rzg2l_cru_write(cru, CRUnCTRL, CRUnCTRL_VINSEL(0));
+
+	/* Cancel the software reset for image processing block */
+	rzg2l_cru_write(cru, CRUnRST, CRUnRST_VRESETN);
+
+	/* Disable and clear the interrupt before using */
+	rzg2l_cru_write(cru, CRUnIE, 0);
+	rzg2l_cru_write(cru, CRUnINTS, 0x001f000f);
+
+	/* Initialize the AXI master */
+	rzg2l_cru_initialize_axi(cru);
+
+	/* Initialize image convert */
+	ret = rzg2l_cru_initialize_image_conv(cru);
+	if (ret) {
+		spin_unlock_irqrestore(&cru->qlock, flags);
+		return ret;
+	}
+
+	/* Enable interrupt */
+	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
+
+	/* Enable image processing reception */
+	rzg2l_cru_write(cru, ICnEN, ICnEN_ICEN);
+
+	spin_unlock_irqrestore(&cru->qlock, flags);
+
+	pipe = sd->entity.pipe ? sd->entity.pipe : &cru->vdev.pipe;
+	ret = media_pipeline_start(&cru->vdev.entity, pipe);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_call(sd, video, s_stream, 1);
+	if (ret == -ENOIOCTLCMD)
+		ret = 0;
+	if (ret)
+		media_pipeline_stop(&cru->vdev.entity);
+
+	return ret;
+}
+
+static void rzg2l_cru_stop_streaming(struct rzg2l_cru_dev *cru)
+{
+	u32 amnfifopntr, amnfifopntr_w, amnfifopntr_r_y;
+	unsigned int retries = 0;
+	unsigned long flags;
+	u32 icnms;
+
+	cru->state = STOPPING;
+
+	rzg2l_cru_set_stream(cru, 0);
+
+	spin_lock_irqsave(&cru->qlock, flags);
+
+	/* Enable IRQ to detect frame start reception */
+	rzg2l_cru_write(cru, CRUnINTS,
+			(~rzg2l_cru_read(cru, CRUnINTS)) | CRUnINTS_SFS);
+	rzg2l_cru_write(cru, CRUnIE, CRUnIE_SFE);
+
+	/* Wait for streaming to stop */
+	while (retries++ < RZG2L_RETRIES) {
+		spin_unlock_irqrestore(&cru->qlock, flags);
+		msleep(RZG2L_TIMEOUT_MS);
+		spin_lock_irqsave(&cru->qlock, flags);
+	}
+
+	icnms = rzg2l_cru_read(cru, ICnMS) & ICnMS_IA;
+	if (icnms)
+		cru_err(cru, "Failed stop HW, something is seriously broken\n");
+
+	cru->state = STOPPED;
+
+	/* Stop the operation of image conversion */
+	rzg2l_cru_write(cru, ICnEN, 0);
+
+	/* Disable and clear the interrupt */
+	rzg2l_cru_write(cru, CRUnIE, 0);
+	rzg2l_cru_write(cru, CRUnINTS, 0x001F0F0F);
+
+	/* Wait until the FIFO becomes empty */
+	for (retries = 5; retries > 0; retries--) {
+		amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
+
+		amnfifopntr_w = amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
+		amnfifopntr_r_y =
+			(amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
+		if (amnfifopntr_w == amnfifopntr_r_y)
+			break;
+
+		usleep_range(10, 20);
+	}
+
+	/* Notify that FIFO is not empty here */
+	if (!retries)
+		cru_err(cru, "Failed to empty FIFO\n");
+
+	/* Stop AXI bus */
+	rzg2l_cru_write(cru, AMnAXISTP, AMnAXISTP_AXI_STOP);
+
+	/* Wait until the AXI bus stop */
+	for (retries = 5; retries > 0; retries--) {
+		if (rzg2l_cru_read(cru, AMnAXISTPACK) &
+			AMnAXISTPACK_AXI_STOP_ACK)
+			break;
+
+		usleep_range(10, 20);
+	};
+
+	/* Notify that AXI bus can not stop here */
+	if (!retries)
+		cru_err(cru, "Failed to stop AXI bus\n");
+
+	/* Cancel the AXI bus stop request */
+	rzg2l_cru_write(cru, AMnAXISTP, 0);
+
+	/* Resets the image processing module */
+	rzg2l_cru_write(cru, CRUnRST, 0);
+
+	spin_unlock_irqrestore(&cru->qlock, flags);
+
+	/* Set reset state */
+	reset_control_assert(cru->aresetn);
+}
+
+static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count)
+{
+	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
+	int ret;
+
+	/* Release reset state */
+	ret = reset_control_deassert(cru->aresetn);
+	if (ret) {
+		cru_err(cru, "failed to deassert aresetn\n");
+		return ret;
+	}
+
+	/* Allocate scratch buffer. */
+	cru->scratch = dma_alloc_coherent(cru->dev, cru->format.sizeimage,
+					  &cru->scratch_phys, GFP_KERNEL);
+	if (!cru->scratch) {
+		return_unused_buffers(cru, VB2_BUF_STATE_QUEUED);
+		cru_err(cru, "Failed to allocate scratch buffer\n");
+		return -ENOMEM;
+	}
+
+	cru->sequence = 0;
+
+	ret = rzg2l_cru_set_stream(cru, 1);
+	if (ret) {
+		return_unused_buffers(cru, VB2_BUF_STATE_QUEUED);
+		goto out;
+	}
+
+	cru->state = STARTING;
+
+out:
+	if (ret)
+		dma_free_coherent(cru->dev, cru->format.sizeimage, cru->scratch,
+				  cru->scratch_phys);
+
+	return ret;
+}
+
+static void rzg2l_cru_stop_streaming_vq(struct vb2_queue *vq)
+{
+	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
+
+	rzg2l_cru_stop_streaming(cru);
+
+	/* Free scratch buffer */
+	dma_free_coherent(cru->dev, cru->format.sizeimage, cru->scratch,
+			  cru->scratch_phys);
+
+	return_unused_buffers(cru, VB2_BUF_STATE_ERROR);
+}
+
+static const struct vb2_ops rzg2l_cru_qops = {
+	.queue_setup		= rzg2l_cru_queue_setup,
+	.buf_prepare		= rzg2l_cru_buffer_prepare,
+	.buf_queue		= rzg2l_cru_buffer_queue,
+	.start_streaming	= rzg2l_cru_start_streaming_vq,
+	.stop_streaming		= rzg2l_cru_stop_streaming_vq,
+	.wait_prepare		= vb2_ops_wait_prepare,
+	.wait_finish		= vb2_ops_wait_finish,
+};
+
+static irqreturn_t rzg2l_cru_irq(int irq, void *data)
+{
+	struct rzg2l_cru_dev *cru = data;
+	unsigned int handled = 0;
+	unsigned long flags;
+	u32 irq_status;
+	u32 amnmbs;
+	int slot;
+
+	spin_lock_irqsave(&cru->qlock, flags);
+
+	irq_status = rzg2l_cru_read(cru, CRUnINTS);
+	if (!irq_status)
+		goto done;
+
+	handled = 1;
+
+	rzg2l_cru_write(cru, CRUnINTS, rzg2l_cru_read(cru, CRUnINTS));
+
+	/* Nothing to do if capture status is 'STOPPED' */
+	if (cru->state == STOPPED) {
+		cru_dbg(cru, "IRQ while state stopped\n");
+		goto done;
+	}
+
+	/* Increase stop retries if capture status is 'STOPPING' */
+	if (cru->state == STOPPING) {
+		if (irq_status & CRUnINTS_SFS)
+			cru_dbg(cru, "IRQ while state stopping\n");
+		goto done;
+	}
+
+	/* Prepare for capture and update state */
+	amnmbs = rzg2l_cru_read(cru, AMnMBS);
+	slot = amnmbs & AMnMBS_MBSTS;
+
+	/*
+	 * AMnMBS.MBSTS indicates the destination of Memory Bank (MB).
+	 * Recalculate to get the current transfer complete MB.
+	 */
+	if (slot == 0)
+		slot = cru->num_buf - 1;
+	else
+		slot--;
+
+	/*
+	 * To hand buffers back in a known order to userspace start
+	 * to capture first from slot 0.
+	 */
+	if (cru->state == STARTING) {
+		if (slot != 0) {
+			cru_dbg(cru, "Starting sync slot: %d\n", slot);
+			goto done;
+		}
+
+		cru_dbg(cru, "Capture start synced!\n");
+		cru->state = RUNNING;
+	}
+
+	/* Capture frame */
+	if (cru->queue_buf[slot]) {
+		cru->queue_buf[slot]->field = cru->format.field;
+		cru->queue_buf[slot]->sequence = cru->sequence;
+		cru->queue_buf[slot]->vb2_buf.timestamp = ktime_get_ns();
+		vb2_buffer_done(&cru->queue_buf[slot]->vb2_buf,
+				VB2_BUF_STATE_DONE);
+		cru->queue_buf[slot] = NULL;
+	} else {
+		/* Scratch buffer was used, dropping frame. */
+		cru_dbg(cru, "Dropping frame %u\n", cru->sequence);
+	}
+
+	cru->sequence++;
+
+	/* Prepare for next frame */
+	rzg2l_cru_fill_hw_slot(cru, slot);
+
+done:
+	spin_unlock_irqrestore(&cru->qlock, flags);
+
+	return IRQ_RETVAL(handled);
+}
+
+void rzg2l_cru_dma_unregister(struct rzg2l_cru_dev *cru)
+{
+	mutex_destroy(&cru->lock);
+
+	v4l2_device_unregister(&cru->v4l2_dev);
+}
+
+int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru, int irq)
+{
+	struct vb2_queue *q = &cru->queue;
+	unsigned int i;
+	int ret;
+
+	/* Initialize the top-level structure */
+	ret = v4l2_device_register(cru->dev, &cru->v4l2_dev);
+	if (ret)
+		return ret;
+
+	mutex_init(&cru->lock);
+	INIT_LIST_HEAD(&cru->buf_list);
+
+	spin_lock_init(&cru->qlock);
+
+	cru->state = STOPPED;
+
+	for (i = 0; i < HW_BUFFER_MAX; i++)
+		cru->queue_buf[i] = NULL;
+
+	/* buffer queue */
+	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	q->io_modes = VB2_MMAP | VB2_READ | VB2_DMABUF;
+	q->lock = &cru->lock;
+	q->drv_priv = cru;
+	q->buf_struct_size = sizeof(struct rzg2l_cru_buffer);
+	q->ops = &rzg2l_cru_qops;
+	q->mem_ops = &vb2_dma_contig_memops;
+	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	q->min_buffers_needed = 4;
+	q->dev = cru->dev;
+
+	ret = vb2_queue_init(q);
+	if (ret < 0) {
+		cru_err(cru, "failed to initialize VB2 queue\n");
+		goto error;
+	}
+
+	/* IRQ */
+	ret = devm_request_irq(cru->dev, irq, rzg2l_cru_irq, IRQF_SHARED,
+			       KBUILD_MODNAME, cru);
+	if (ret) {
+		cru_err(cru, "failed to request irq\n");
+		goto error;
+	}
+
+	return 0;
+
+error:
+	rzg2l_cru_dma_unregister(cru);
+	return ret;
+}
diff --git a/drivers/media/platform/rzg2l-cru/rzg2l-v4l2.c b/drivers/media/platform/rzg2l-cru/rzg2l-v4l2.c
new file mode 100644
index 000000000000..e47f050abba8
--- /dev/null
+++ b/drivers/media/platform/rzg2l-cru/rzg2l-v4l2.c
@@ -0,0 +1,361 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Driver for Renesas RZ/G2L CRU
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ *
+ * Based on Renesas R-Car VIN
+ * Copyright (C) 2016 Renesas Electronics Corp.
+ * Copyright (C) 2011-2013 Renesas Solutions Corp.
+ * Copyright (C) 2013 Cogent Embedded, Inc., <source@cogentembedded.com>
+ * Copyright (C) 2008 Magnus Damm
+ */
+
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-rect.h>
+
+#include "rzg2l-cru.h"
+
+#define RZG2L_CRU_DEFAULT_FORMAT	V4L2_PIX_FMT_UYVY
+#define RZG2L_CRU_DEFAULT_WIDTH		800
+#define RZG2L_CRU_DEFAULT_HEIGHT	600
+#define RZG2L_CRU_DEFAULT_FIELD		V4L2_FIELD_NONE
+#define RZG2L_CRU_DEFAULT_COLORSPACE	V4L2_COLORSPACE_SRGB
+
+/* -----------------------------------------------------------------------------
+ * Format Conversions
+ */
+
+static const struct rzg2l_cru_video_format rzg2l_cru_formats[] = {
+	{
+		.fourcc			= V4L2_PIX_FMT_UYVY,
+		.bpp			= 2,
+	},
+};
+
+const struct rzg2l_cru_video_format
+*rzg2l_cru_format_from_pixel(u32 pixelformat)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rzg2l_cru_formats); i++)
+		if (rzg2l_cru_formats[i].fourcc == pixelformat)
+			return rzg2l_cru_formats + i;
+
+	return NULL;
+}
+
+static u32 rzg2l_cru_format_bytesperline(struct v4l2_pix_format *pix)
+{
+	const struct rzg2l_cru_video_format *fmt;
+
+	fmt = rzg2l_cru_format_from_pixel(pix->pixelformat);
+
+	if (WARN_ON(!fmt))
+		return -EINVAL;
+
+	return pix->width * fmt->bpp;
+}
+
+static u32 rzg2l_cru_format_sizeimage(struct v4l2_pix_format *pix)
+{
+	return pix->bytesperline * pix->height;
+}
+
+static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
+				   struct v4l2_pix_format *pix)
+{
+	if (!rzg2l_cru_format_from_pixel(pix->pixelformat))
+		pix->pixelformat = RZG2L_CRU_DEFAULT_FORMAT;
+
+	switch (pix->field) {
+	case V4L2_FIELD_TOP:
+	case V4L2_FIELD_BOTTOM:
+	case V4L2_FIELD_NONE:
+	case V4L2_FIELD_INTERLACED_TB:
+	case V4L2_FIELD_INTERLACED_BT:
+	case V4L2_FIELD_INTERLACED:
+		break;
+	default:
+		pix->field = RZG2L_CRU_DEFAULT_FIELD;
+		break;
+	}
+
+	/* Limit to CRU capabilities */
+	v4l_bound_align_image(&pix->width, 320, cru->info->max_width, 1,
+			      &pix->height, 240, cru->info->max_height, 2, 0);
+
+	pix->bytesperline = rzg2l_cru_format_bytesperline(pix);
+	pix->sizeimage = rzg2l_cru_format_sizeimage(pix);
+
+	cru_dbg(cru, "Format %ux%u bpl: %u size: %u\n",
+		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
+}
+
+static void rzg2l_cru_mc_try_format(struct rzg2l_cru_dev *cru,
+				    struct v4l2_pix_format *pix)
+{
+	/*
+	 * The V4L2 specification clearly documents the colorspace fields
+	 * as being set by drivers for capture devices. Using the values
+	 * supplied by userspace thus wouldn't comply with the API. Until
+	 * the API is updated force fixed values.
+	 */
+	pix->colorspace = RZG2L_CRU_DEFAULT_COLORSPACE;
+	pix->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(pix->colorspace);
+	pix->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(pix->colorspace);
+	pix->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true, pix->colorspace,
+							  pix->ycbcr_enc);
+
+	rzg2l_cru_format_align(cru, pix);
+}
+
+static int rzg2l_cru_querycap(struct file *file, void *priv,
+			      struct v4l2_capability *cap)
+{
+	struct rzg2l_cru_dev *cru = video_drvdata(file);
+
+	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
+	strscpy(cap->card, "RZG2L_CRU", sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
+		 dev_name(cru->dev));
+	return 0;
+}
+
+static int rzg2l_cru_mc_try_fmt_vid_cap(struct file *file, void *priv,
+					struct v4l2_format *f)
+{
+	struct rzg2l_cru_dev *cru = video_drvdata(file);
+
+	rzg2l_cru_mc_try_format(cru, &f->fmt.pix);
+
+	return 0;
+}
+
+static int rzg2l_cru_mc_s_fmt_vid_cap(struct file *file, void *priv,
+				      struct v4l2_format *f)
+{
+	struct rzg2l_cru_dev *cru = video_drvdata(file);
+
+	if (vb2_is_busy(&cru->queue))
+		return -EBUSY;
+
+	rzg2l_cru_mc_try_format(cru, &f->fmt.pix);
+
+	cru->format = f->fmt.pix;
+
+	cru->compose.top = 0;
+	cru->compose.left = 0;
+	cru->compose.width = cru->format.width;
+	cru->compose.height = cru->format.height;
+
+	return 0;
+}
+
+static int rzg2l_cru_g_fmt_vid_cap(struct file *file, void *priv,
+				   struct v4l2_format *f)
+{
+	struct rzg2l_cru_dev *cru = video_drvdata(file);
+
+	f->fmt.pix = cru->format;
+
+	return 0;
+}
+
+static int rzg2l_cru_enum_fmt_vid_cap(struct file *file, void *priv,
+				      struct v4l2_fmtdesc *f)
+{
+	if (f->index >= ARRAY_SIZE(rzg2l_cru_formats))
+		return -EINVAL;
+
+	f->pixelformat = rzg2l_cru_formats[f->index].fourcc;
+
+	return 0;
+}
+
+static int rzg2l_cru_subscribe_event(struct v4l2_fh *fh,
+				     const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_SOURCE_CHANGE:
+		return v4l2_event_subscribe(fh, sub, 4, NULL);
+	}
+	return v4l2_ctrl_subscribe_event(fh, sub);
+}
+
+static const struct v4l2_ioctl_ops rzg2l_cru_mc_ioctl_ops = {
+	.vidioc_querycap		= rzg2l_cru_querycap,
+	.vidioc_try_fmt_vid_cap		= rzg2l_cru_mc_try_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap		= rzg2l_cru_g_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap		= rzg2l_cru_mc_s_fmt_vid_cap,
+	.vidioc_enum_fmt_vid_cap	= rzg2l_cru_enum_fmt_vid_cap,
+
+	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
+	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
+	.vidioc_querybuf		= vb2_ioctl_querybuf,
+	.vidioc_qbuf			= vb2_ioctl_qbuf,
+	.vidioc_dqbuf			= vb2_ioctl_dqbuf,
+	.vidioc_expbuf			= vb2_ioctl_expbuf,
+	.vidioc_prepare_buf		= vb2_ioctl_prepare_buf,
+	.vidioc_streamon		= vb2_ioctl_streamon,
+	.vidioc_streamoff		= vb2_ioctl_streamoff,
+
+	.vidioc_log_status		= v4l2_ctrl_log_status,
+	.vidioc_subscribe_event		= rzg2l_cru_subscribe_event,
+	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
+};
+
+/* -----------------------------------------------------------------------------
+ * Media controller file operations
+ */
+
+static int rzg2l_cru_open(struct file *file)
+{
+	struct rzg2l_cru_dev *cru = video_drvdata(file);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(cru->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = mutex_lock_interruptible(&cru->lock);
+	if (ret)
+		goto err_pm;
+
+	file->private_data = cru;
+	ret = v4l2_fh_open(file);
+	if (ret)
+		goto err_unlock;
+
+	ret = v4l2_pipeline_pm_get(&cru->vdev.entity);
+	if (ret < 0)
+		goto err_open;
+
+	ret = v4l2_ctrl_handler_setup(&cru->ctrl_handler);
+	if (ret)
+		goto err_power;
+
+	mutex_unlock(&cru->lock);
+
+	return 0;
+err_power:
+	v4l2_pipeline_pm_put(&cru->vdev.entity);
+err_open:
+	v4l2_fh_release(file);
+err_unlock:
+	mutex_unlock(&cru->lock);
+err_pm:
+	pm_runtime_put(cru->dev);
+
+	return ret;
+}
+
+static int rzg2l_cru_release(struct file *file)
+{
+	struct rzg2l_cru_dev *cru = video_drvdata(file);
+	int ret;
+
+	mutex_lock(&cru->lock);
+
+	/* the release helper will cleanup any on-going streaming. */
+	ret = _vb2_fop_release(file, NULL);
+
+	v4l2_pipeline_pm_put(&cru->vdev.entity);
+	pm_runtime_put(cru->dev);
+
+	mutex_unlock(&cru->lock);
+
+	return ret;
+}
+
+static const struct v4l2_file_operations rzg2l_cru_mc_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= video_ioctl2,
+	.open		= rzg2l_cru_open,
+	.release	= rzg2l_cru_release,
+	.poll		= vb2_fop_poll,
+	.mmap		= vb2_fop_mmap,
+	.read		= vb2_fop_read,
+};
+
+void rzg2l_cru_v4l2_unregister(struct rzg2l_cru_dev *cru)
+{
+	if (!video_is_registered(&cru->vdev))
+		return;
+
+	v4l2_info(&cru->v4l2_dev, "Removed %s\n",
+		  video_device_node_name(&cru->vdev));
+
+	/* Checks internally if vdev have been init or not */
+	video_unregister_device(&cru->vdev);
+}
+
+static void rzg2l_cru_notify(struct v4l2_subdev *sd,
+			     unsigned int notification, void *arg)
+{
+	struct rzg2l_cru_dev *cru =
+		container_of(sd->v4l2_dev, struct rzg2l_cru_dev, v4l2_dev);
+	struct v4l2_subdev *remote;
+	struct media_pad *pad;
+
+	pad = media_entity_remote_pad(&cru->pad);
+	if (!pad)
+		return;
+
+	remote = media_entity_to_v4l2_subdev(pad->entity);
+	if (remote != sd)
+		return;
+
+	switch (notification) {
+	case V4L2_DEVICE_NOTIFY_EVENT:
+		v4l2_event_queue(&cru->vdev, arg);
+		break;
+	}
+}
+
+int rzg2l_cru_v4l2_register(struct rzg2l_cru_dev *cru)
+{
+	struct video_device *vdev = &cru->vdev;
+	int ret;
+
+	cru->v4l2_dev.notify = rzg2l_cru_notify;
+
+	/* video node */
+	vdev->v4l2_dev = &cru->v4l2_dev;
+	vdev->queue = &cru->queue;
+	snprintf(vdev->name, sizeof(vdev->name), "CRU output");
+	vdev->release = video_device_release_empty;
+	vdev->lock = &cru->lock;
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+			    V4L2_CAP_READWRITE;
+
+	/* Set a default format */
+	cru->format.pixelformat	= RZG2L_CRU_DEFAULT_FORMAT;
+	cru->format.width = RZG2L_CRU_DEFAULT_WIDTH;
+	cru->format.height = RZG2L_CRU_DEFAULT_HEIGHT;
+	cru->format.field = RZG2L_CRU_DEFAULT_FIELD;
+	cru->format.colorspace = RZG2L_CRU_DEFAULT_COLORSPACE;
+
+	vdev->device_caps |= V4L2_CAP_IO_MC;
+	vdev->fops = &rzg2l_cru_mc_fops;
+	vdev->ioctl_ops = &rzg2l_cru_mc_ioctl_ops;
+
+	rzg2l_cru_format_align(cru, &cru->format);
+
+	ret = video_register_device(&cru->vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		cru_err(cru, "Failed to register video device\n");
+		return ret;
+	}
+
+	video_set_drvdata(&cru->vdev, cru);
+
+	v4l2_info(&cru->v4l2_dev, "Device registered as %s\n",
+		  video_device_node_name(&cru->vdev));
+
+	return ret;
+}
-- 
2.17.1

