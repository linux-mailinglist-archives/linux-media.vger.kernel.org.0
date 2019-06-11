Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2202D3C1AB
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 05:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391043AbfFKDyJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jun 2019 23:54:09 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:46095 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2391040AbfFKDyI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jun 2019 23:54:08 -0400
X-UUID: e5e53673cdb84fd4a6c4c0ac6228d6d2-20190611
X-UUID: e5e53673cdb84fd4a6c4c0ac6228d6d2-20190611
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 593152930; Tue, 11 Jun 2019 11:53:56 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 11 Jun 2019 11:53:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 11 Jun 2019 11:53:54 +0800
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     <tfiga@chromium.org>, <hverkuil@xs4all.nl>,
        <laurent.pinchart@ideasonboard.com>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <ddavenport@chromium.org>, <robh@kernel.org>,
        <sean.cheng@mediatek.com>, <sj.huang@mediatek.com>,
        <frederic.chen@mediatek.com>, <ryan.yu@mediatek.com>,
        <rynn.wu@mediatek.com>, <jungo.lin@mediatek.com>,
        <frankie.chiu@mediatek.com>
Subject: [RFC,v3 5/9] media: platform: Add Mediatek ISP P1 V4L2 control
Date:   Tue, 11 Jun 2019 11:53:40 +0800
Message-ID: <20190611035344.29814-6-jungo.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190611035344.29814-1-jungo.lin@mediatek.com>
References: <jungo.lin@mediatek.com>
 <20190611035344.29814-1-jungo.lin@mediatek.com>
Reply-To: <jungo.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reserved Mediatek ISP P1 V4L2 control number with 16.
Moreover, add two V4L2 controls for ISP P1 user space
usage.

1. V4L2_CID_MTK_GET_BIN_INFO
- Provide the image output width & height in case
camera binning mode is enabled.

2. V4L2_CID_MTK_RAW_PATH
- Export the path control of the main stream to user space.
One is pure raw and the other is processing raw.
The default value is 0 which outputs the pure raw bayer image
from sesnor, without image processing in ISP HW.

Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
---
 drivers/media/platform/mtk-isp/Makefile       |   3 +
 .../media/platform/mtk-isp/isp_50/Makefile    |   5 +
 .../platform/mtk-isp/isp_50/cam/Makefile      |   5 +
 .../mtk-isp/isp_50/cam/mtk_cam-ctrl.c         | 138 ++++++++++++++++++
 .../mtk-isp/isp_50/cam/mtk_cam-ctrl.h         |  38 +++++
 include/uapi/linux/v4l2-controls.h            |   4 +
 6 files changed, 193 insertions(+)
 create mode 100644 drivers/media/platform/mtk-isp/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.h

diff --git a/drivers/media/platform/mtk-isp/Makefile b/drivers/media/platform/mtk-isp/Makefile
new file mode 100644
index 000000000000..c17fb3fc3340
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-y += isp_50/
diff --git a/drivers/media/platform/mtk-isp/isp_50/Makefile b/drivers/media/platform/mtk-isp/isp_50/Makefile
new file mode 100644
index 000000000000..8498fe70e418
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+ifeq ($(CONFIG_VIDEO_MEDIATEK_ISP_PASS1),y)
+obj-y += cam/
+endif
diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/Makefile b/drivers/media/platform/mtk-isp/isp_50/cam/Makefile
new file mode 100644
index 000000000000..53fb69d3add6
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+mtk-cam-isp-objs += mtk_cam-ctrl.o
+
+obj-$(CONFIG_VIDEO_MEDIATEK_ISP_PASS1) += mtk-cam-isp.o
\ No newline at end of file
diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.c b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.c
new file mode 100644
index 000000000000..31d801c82495
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2018 MediaTek Inc.
+
+#include <linux/device.h>
+#include <linux/platform_device.h>
+
+#include "mtk_cam-ctrl.h"
+#include "mtk_cam.h"
+
+static int handle_ctrl_get_bin_info(struct v4l2_ctrl *ctrl, int is_width)
+{
+	struct mtk_cam_dev *cam_dev = ctrl->priv;
+	struct v4l2_format *fmt;
+
+	fmt = &cam_dev->vdev_nodes[MTK_CAM_P1_MAIN_STREAM_OUT].vdev_fmt;
+
+	dev_dbg(&cam_dev->pdev->dev, "Get bin info w*h:%d*%d is_width:%d",
+		fmt->fmt.pix_mp.width, fmt->fmt.pix_mp.height, is_width);
+
+	if (is_width)
+		ctrl->val = fmt->fmt.pix_mp.width;
+	else
+		ctrl->val = fmt->fmt.pix_mp.height;
+
+	return 0;
+}
+
+static int handle_ctrl_get_process_raw(struct v4l2_ctrl *ctrl)
+{
+	struct mtk_cam_dev *cam_dev = ctrl->priv;
+	struct isp_p1_device *p1_dev = get_p1_device(&cam_dev->pdev->dev);
+
+	ctrl->val = (p1_dev->isp_ctx.isp_raw_path == ISP_PROCESS_RAW_PATH);
+
+	dev_dbg(&cam_dev->pdev->dev, "Get process raw:%d", ctrl->val);
+
+	return 0;
+}
+
+static int handle_ctrl_set_process_raw(struct v4l2_ctrl *ctrl)
+{
+	struct mtk_cam_dev *cam_dev = ctrl->priv;
+	struct isp_p1_device *p1_dev = get_p1_device(&cam_dev->pdev->dev);
+
+	p1_dev->isp_ctx.isp_raw_path = (ctrl->val) ?
+		ISP_PROCESS_RAW_PATH : ISP_PURE_RAW_PATH;
+	dev_dbg(&cam_dev->pdev->dev, "Set process raw:%d", ctrl->val);
+	return 0;
+}
+
+static int mtk_cam_dev_g_ctrl(struct v4l2_ctrl *ctrl)
+{
+	switch (ctrl->id) {
+	case V4L2_CID_MTK_PROCESSING_RAW:
+		handle_ctrl_get_process_raw(ctrl);
+		break;
+	case V4L2_CID_MTK_GET_BIN_WIDTH:
+		handle_ctrl_get_bin_info(ctrl, 1);
+		break;
+	case V4L2_CID_MTK_GET_BIN_HEIGTH:
+		handle_ctrl_get_bin_info(ctrl, 0);
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
+	case V4L2_CID_MTK_PROCESSING_RAW:
+		return handle_ctrl_set_process_raw(ctrl);
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
+	.id = V4L2_CID_MTK_PROCESSING_RAW,
+	.name = "MTK CAM PROCESSING RAW",
+	.type = V4L2_CTRL_TYPE_BOOLEAN,
+	.min = 0,
+	.max = 1,
+	.step = 1,
+	.def = 1,
+	},
+	{
+	.ops = &mtk_cam_dev_ctrl_ops,
+	.id = V4L2_CID_MTK_GET_BIN_WIDTH,
+	.name = "MTK CAM GET BIN WIDTH",
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.min = IMG_MIN_WIDTH,
+	.max = IMG_MAX_WIDTH,
+	.step = 1,
+	.def = IMG_MAX_WIDTH,
+	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_VOLATILE,
+	},
+	{
+	.ops = &mtk_cam_dev_ctrl_ops,
+	.id = V4L2_CID_MTK_GET_BIN_HEIGTH,
+	.name = "MTK CAM GET BIN HEIGHT",
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.min = IMG_MIN_HEIGHT,
+	.max = IMG_MAX_HEIGHT,
+	.step = 1,
+	.def = IMG_MAX_HEIGHT,
+	.flags = V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_VOLATILE,
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
+
+	return 0;
+}
diff --git a/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.h b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.h
new file mode 100644
index 000000000000..0f9349ae0b07
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/cam/mtk_cam-ctrl.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAM_CTRL_H__
+#define __MTK_CAM_CTRL_H__
+
+#include <media/v4l2-ctrls.h>
+
+#include "mtk_cam-v4l2-util.h"
+
+/* The base for the MTK Camera ISP P1 driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_MTK_CAM_BASE			V4L2_CID_USER_MTK_CAM_BASE
+
+/* Control MTK ISP P1 main stream to process raw image data or not.
+ * The default value is 0 which outputs the pure raw bayer data from sensor,
+ * without image processing in ISP HW.
+ */
+#define V4L2_CID_MTK_PROCESSING_RAW		(V4L2_CID_MTK_CAM_BASE + 1)
+
+/* MTK ISP P1 HW supports frontal binning function.
+ * If this function is enabled, the 3A algo. may get the new image resolution
+ * which is binned by ISP P1. If this function is disabled or no supported,
+ * the image resolution will be equal to configured image format.
+ * For this control, it is read only.
+ */
+#define V4L2_CID_MTK_GET_BIN_WIDTH		(V4L2_CID_MTK_CAM_BASE + 2)
+#define V4L2_CID_MTK_GET_BIN_HEIGTH		(V4L2_CID_MTK_CAM_BASE + 3)
+
+#define V4L2_CID_MTK_CAM_MAX			16
+
+int mtk_cam_ctrl_init(struct mtk_cam_dev *cam_dev,
+		      struct v4l2_ctrl_handler *hdl);
+
+#endif /* __MTK_CAM_CTRL_H__ */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 37807f23231e..2db99716f40d 100644
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

