Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99BA71967C
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 04:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbfEJCDT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 22:03:19 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:59035 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726806AbfEJCDS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 May 2019 22:03:18 -0400
X-UUID: 0169df1d21024fc7a7cc4b05e47b707b-20190510
X-UUID: 0169df1d21024fc7a7cc4b05e47b707b-20190510
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw02.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1596703898; Fri, 10 May 2019 10:03:03 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs03n1.mediatek.inc (172.21.101.181) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 10 May 2019 10:03:02 +0800
Received: from mtkslt306.mediatek.inc (10.21.14.136) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 10 May 2019 10:03:02 +0800
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     <tfiga@chromium.org>, <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>
CC:     <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <frederic.chen@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <frankie.chiu@mediatek.com>, <seraph.huang@mediatek.com>,
        <ryan.yu@mediatek.com>, <Rynn.Wu@mediatek.com>,
        <yuzhao@chromium.org>, <zwisler@chromium.org>, <shik@chromium.org>,
        <suleiman@chromium.org>, Jungo Lin <jungo.lin@mediatek.com>
Subject: [RFC,V2,07/11] media: platform: Add Mediatek ISP P1 private control
Date:   Fri, 10 May 2019 09:58:00 +0800
Message-ID: <20190510015755.51495-8-jungo.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <Jungo Lin <jungo.lin@mediatek.com>
References: <Jungo Lin <jungo.lin@mediatek.com>
Reply-To: Jungo Lin <jungo.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reserved Mediatek ISP P1 private control number with 16.
Moreover, add two private controls for ISP P1 user space
usage.

1. V4L2_CID_PRIVATE_GET_BIN_INFO
- Provide the image output width & height in case
camera binning mode is enabled.

2. V4L2_CID_PRIVATE_RAW_PATH
- Export the path control of the main stream to user space.
One is pure raw and the other is processing raw.
The default image path is pure raw.

Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
---
 .../mtk-isp/isp_50/cam/mtk_cam-ctrl.c         | 133 ++++++++++++++++++
 .../mtk-isp/isp_50/cam/mtk_cam-ctrl.h         |  32 +++++
 include/uapi/linux/v4l2-controls.h            |   4 +
 3 files changed, 169 insertions(+)
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.h

diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.c b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.c
new file mode 100644
index 000000000000..520adbe367ed
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ * Author: Ryan Yu <ryan.yu@mediatek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include "mtk_cam-dev.h"
+#include "mtk_cam-ctrl.h"
+#include "mtk_cam.h"
+
+static int handle_ctrl_get_bin_info(struct v4l2_ctrl *ctrl)
+{
+	struct mtk_cam_dev *cam_dev = ctrl->priv;
+	const unsigned int idx = MTK_CAM_P1_MAIN_STREAM_OUT;
+	struct v4l2_format *imgo_fmt = &cam_dev->mem2mem2_nodes[idx].vdev_fmt;
+	unsigned int width, height;
+
+	width = imgo_fmt->fmt.pix_mp.width;
+	height = imgo_fmt->fmt.pix_mp.height;
+
+	dev_dbg(&cam_dev->pdev->dev, "Get bin info w*h:%d*%d",
+		width, height);
+
+	ctrl->val = (width << 16) | height;
+
+	return 0;
+}
+
+static int handle_ctrl_get_raw_path(struct v4l2_ctrl *ctrl)
+{
+	struct mtk_cam_dev *cam_dev = ctrl->priv;
+	struct isp_p1_device *p1_dev = get_p1_device(&cam_dev->pdev->dev);
+
+	ctrl->val = p1_dev->isp_ctx.isp_raw_path;
+
+	dev_dbg(&cam_dev->pdev->dev, "Get raw path:%d", ctrl->val);
+
+	return 0;
+}
+
+static int handle_ctrl_set_raw_path(struct v4l2_ctrl *ctrl)
+{
+	struct mtk_cam_dev *cam_dev = ctrl->priv;
+	struct isp_p1_device *p1_dev = get_p1_device(&cam_dev->pdev->dev);
+
+	p1_dev->isp_ctx.isp_raw_path = ctrl->val;
+	dev_dbg(&cam_dev->pdev->dev, "Set raw path:%d", ctrl->val);
+	return 0;
+}
+
+static int mtk_cam_dev_g_ctrl(struct v4l2_ctrl *ctrl)
+{
+	switch (ctrl->id) {
+	case V4L2_CID_PRIVATE_GET_BIN_INFO:
+		handle_ctrl_get_bin_info(ctrl);
+		break;
+	case V4L2_CID_PRIVATE_RAW_PATH:
+		handle_ctrl_get_raw_path(ctrl);
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int mtk_cam_dev_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	switch (ctrl->id) {
+	case V4L2_CID_PRIVATE_RAW_PATH:
+		return handle_ctrl_set_raw_path(ctrl);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct v4l2_ctrl_ops mtk_cam_dev_ctrl_ops = {
+	.g_volatile_ctrl = mtk_cam_dev_g_ctrl,
+	.s_ctrl = mtk_cam_dev_s_ctrl,
+};
+
+struct v4l2_ctrl_config mtk_cam_controls[] = {
+	{
+	.ops = &mtk_cam_dev_ctrl_ops,
+	.id = V4L2_CID_PRIVATE_GET_BIN_INFO,
+	.name = "MTK CAM GET BIN INFO",
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.min = (IMG_MIN_WIDTH << 16) | IMG_MIN_HEIGHT,
+	.max = (IMG_MAX_WIDTH << 16) | IMG_MAX_HEIGHT,
+	.step = 1,
+	.def = (IMG_MAX_WIDTH << 16) | IMG_MAX_HEIGHT,
+	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_VOLATILE,
+	},
+	{
+	.ops = &mtk_cam_dev_ctrl_ops,
+	.id = V4L2_CID_PRIVATE_RAW_PATH,
+	.name = "MTK CAM RAW PATH",
+	.type = V4L2_CTRL_TYPE_BOOLEAN,
+	.min = 0,
+	.max = 1,
+	.step = 1,
+	.def = 1,
+	},
+};
+
+int mtk_cam_ctrl_init(struct mtk_cam_dev *cam_dev,
+		      struct v4l2_ctrl_handler *hdl)
+{
+	unsigned int i;
+
+	/* Initialized HW controls, allow V4L2_CID_MTK_CAM_MAX ctrls */
+	v4l2_ctrl_handler_init(hdl, V4L2_CID_MTK_CAM_MAX);
+	if (hdl->error) {
+		v4l2_ctrl_handler_free(hdl);
+		return hdl->error;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(mtk_cam_controls); i++)
+		v4l2_ctrl_new_custom(hdl, &mtk_cam_controls[i], cam_dev);
+
+	dev_dbg(&cam_dev->pdev->dev, "%s done", __func__);
+	return 0;
+}
diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.h b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.h
new file mode 100644
index 000000000000..74a6538c81ac
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ * Author: Ryan Yu <ryan.yu@mediatek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef __MTK_CAM_CTRL_H__
+#define __MTK_CAM_CTRL_H__
+
+#include <media/v4l2-ctrls.h>
+
+#define V4L2_CID_MTK_CAM_PRIVATE_CAM  V4L2_CID_USER_MTK_CAM_BASE
+#define V4L2_CID_PRIVATE_GET_BIN_INFO \
+	(V4L2_CID_MTK_CAM_PRIVATE_CAM + 1)
+#define V4L2_CID_PRIVATE_RAW_PATH \
+	(V4L2_CID_MTK_CAM_PRIVATE_CAM + 2)
+
+#define V4L2_CID_MTK_CAM_MAX	16
+
+int mtk_cam_ctrl_init(struct mtk_cam_dev *cam_dev,
+		      struct v4l2_ctrl_handler *hdl);
+
+#endif /* __MTK_CAM_CTRL_H__ */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 06479f2fb3ae..cbe8f5f7782b 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -192,6 +192,10 @@ enum v4l2_colorfx {
  * We reserve 16 controls for this driver. */
 #define V4L2_CID_USER_IMX_BASE			(V4L2_CID_USER_BASE + 0x10b0)
 
+/* The base for the mediatek ISP Pass 1 driver controls */
+/* We reserve 16 controls for this driver. */
+#define V4L2_CID_USER_MTK_CAM_BASE		(V4L2_CID_USER_BASE + 0x10c0)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.18.0

