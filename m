Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5AE285CFC
	for <lists+linux-media@lfdr.de>; Wed,  7 Oct 2020 12:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbgJGKgR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Oct 2020 06:36:17 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46332 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbgJGKgR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Oct 2020 06:36:17 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 130A329C191
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>, cphealy@gmail.com,
        Benjamin.Bara@skidata.com, l.stach@pengutronix.de,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH v2 6/6] coda: Add a V4L2 user for control error macroblocks count
Date:   Wed,  7 Oct 2020 07:35:44 -0300
Message-Id: <20201007103544.22807-7-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201007103544.22807-1-ezequiel@collabora.com>
References: <20201007103544.22807-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To avoid potentially overflowing the kernel logs in the case
of corrupted streams, this commit replaces an error log with
a per-stream counter to be read through a driver-specific
control.

Applications can read the per-stream accumulated
error macroblocks count.

The error message is moved to the driver-specific debug log,
and rate-limitting is added to make sure it doesn't
spam the log.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 MAINTAINERS                               |  1 +
 drivers/media/platform/coda/coda-bit.c    |  9 +++--
 drivers/media/platform/coda/coda-common.c | 42 +++++++++++++++++++++++
 drivers/media/platform/coda/coda.h        |  4 +++
 include/media/drv-intf/coda.h             | 13 +++++++
 include/uapi/linux/v4l2-controls.h        |  4 +++
 6 files changed, 70 insertions(+), 3 deletions(-)
 create mode 100644 include/media/drv-intf/coda.h

diff --git a/MAINTAINERS b/MAINTAINERS
index ba5eb1dff9c2..4c7a59a4dda3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4334,6 +4334,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/coda.txt
 F:	drivers/media/platform/coda/
+F:	include/media/drv-intf/coda.h
 
 CODE OF CONDUCT
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index 919b36d753ec..dca6d1ee5744 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/log2.h>
 #include <linux/platform_device.h>
+#include <linux/ratelimit.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
@@ -2369,9 +2370,11 @@ static void coda_finish_decode(struct coda_ctx *ctx)
 	}
 
 	err_mb = coda_read(dev, CODA_RET_DEC_PIC_ERR_MB);
-	if (err_mb > 0)
-		v4l2_err(&dev->v4l2_dev,
-			 "errors in %d macroblocks\n", err_mb);
+	if (err_mb > 0) {
+		if (__ratelimit(&dev->err_mb_rs))
+			coda_dbg(1, ctx, "errors in %d macroblocks\n", err_mb);
+		ctx->err_mb += err_mb;
+	}
 
 	if (dev->devtype->product == CODA_HX4 ||
 	    dev->devtype->product == CODA_7541) {
diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 487dd653b24a..498563bc9a66 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -26,8 +26,10 @@
 #include <linux/videodev2.h>
 #include <linux/of.h>
 #include <linux/platform_data/media/coda.h>
+#include <linux/ratelimit.h>
 #include <linux/reset.h>
 
+#include <media/drv-intf/coda.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -2062,6 +2064,7 @@ static int coda_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (q_data_dst->fourcc == V4L2_PIX_FMT_JPEG)
 		ctx->params.gop_size = 1;
 	ctx->gopcounter = ctx->params.gop_size - 1;
+	ctx->err_mb = 0;
 
 	ret = ctx->ops->start_streaming(ctx);
 	if (ctx->inst_type == CODA_INST_DECODER) {
@@ -2162,6 +2165,22 @@ static const struct vb2_ops coda_qops = {
 	.wait_finish		= vb2_ops_wait_finish,
 };
 
+static int coda_g_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct coda_ctx *ctx =
+			container_of(ctrl->handler, struct coda_ctx, ctrls);
+	switch (ctrl->id) {
+	case V4L2_CID_CODA_ERR_MB:
+		ctrl->val = ctx->err_mb;
+		break;
+	default:
+		coda_dbg(1, ctx, "Invalid control, id=%d, val=%d\n",
+			 ctrl->id, ctrl->val);
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static int coda_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	const char * const *val_names = v4l2_ctrl_get_menu(ctrl->id);
@@ -2291,6 +2310,10 @@ static int coda_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
+static const struct v4l2_ctrl_ops coda_err_mb_ctrl_ops = {
+	.g_volatile_ctrl = coda_g_ctrl,
+};
+
 static const struct v4l2_ctrl_ops coda_ctrl_ops = {
 	.s_ctrl = coda_s_ctrl,
 };
@@ -2462,6 +2485,16 @@ static void coda_decode_ctrls(struct coda_ctx *ctx)
 		ctx->mpeg4_level_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 }
 
+static const struct v4l2_ctrl_config coda_err_mb_ctrl_config = {
+	.ops	= &coda_err_mb_ctrl_ops,
+	.id	= V4L2_CID_CODA_ERR_MB,
+	.name	= "Error macroblocks count",
+	.type	= V4L2_CTRL_TYPE_INTEGER,
+	.min	= 0,
+	.max	= 0xffffffff,
+	.step	= 1,
+};
+
 static int coda_ctrls_setup(struct coda_ctx *ctx)
 {
 	v4l2_ctrl_handler_init(&ctx->ctrls, 2);
@@ -2484,6 +2517,14 @@ static int coda_ctrls_setup(struct coda_ctx *ctx)
 				  1, 1, 1, 1);
 		if (ctx->cvd->src_formats[0] == V4L2_PIX_FMT_H264)
 			coda_decode_ctrls(ctx);
+
+		ctx->err_mb_ctrl = v4l2_ctrl_new_custom(&ctx->ctrls,
+						&coda_err_mb_ctrl_config,
+						NULL);
+		if (ctx->err_mb_ctrl)
+			ctx->err_mb_ctrl->flags |=
+				V4L2_CTRL_FLAG_READ_ONLY |
+				V4L2_CTRL_FLAG_VOLATILE;
 	}
 
 	if (ctx->ctrls.error) {
@@ -3202,6 +3243,7 @@ static int coda_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ratelimit_default_init(&dev->err_mb_rs);
 	mutex_init(&dev->dev_mutex);
 	mutex_init(&dev->coda_mutex);
 	ida_init(&dev->ida);
diff --git a/drivers/media/platform/coda/coda.h b/drivers/media/platform/coda/coda.h
index e53f7a65d532..517c47e6e1b3 100644
--- a/drivers/media/platform/coda/coda.h
+++ b/drivers/media/platform/coda/coda.h
@@ -17,6 +17,7 @@
 #include <linux/mutex.h>
 #include <linux/kfifo.h>
 #include <linux/videodev2.h>
+#include <linux/ratelimit.h>
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -92,6 +93,7 @@ struct coda_dev {
 	struct v4l2_m2m_dev	*m2m_dev;
 	struct ida		ida;
 	struct dentry		*debugfs_root;
+	struct ratelimit_state	err_mb_rs;
 };
 
 struct coda_codec {
@@ -242,6 +244,7 @@ struct coda_ctx {
 	struct v4l2_ctrl		*mpeg2_level_ctrl;
 	struct v4l2_ctrl		*mpeg4_profile_ctrl;
 	struct v4l2_ctrl		*mpeg4_level_ctrl;
+	struct v4l2_ctrl		*err_mb_ctrl;
 	struct v4l2_fh			fh;
 	int				gopcounter;
 	int				runcounter;
@@ -274,6 +277,7 @@ struct coda_ctx {
 	struct dentry			*debugfs_entry;
 	bool				use_bit;
 	bool				use_vdoa;
+	unsigned int			err_mb;
 	struct vdoa_ctx			*vdoa;
 	/*
 	 * wakeup mutex used to serialize encoder stop command and finish_run,
diff --git a/include/media/drv-intf/coda.h b/include/media/drv-intf/coda.h
new file mode 100644
index 000000000000..1d767bec4c4a
--- /dev/null
+++ b/include/media/drv-intf/coda.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef VIDEO_CODA_INTF_H
+#define VIDEO_CODA_INTF_H
+
+#include <linux/types.h>
+#include <linux/videodev2.h>
+
+enum coda_ctrl_id {
+	V4L2_CID_CODA_ERR_MB = (V4L2_CID_USER_CODA_BASE + 0),
+};
+
+#endif /* VIDEO_CODA_INTF_H */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index a184c4939438..b4481d9579e7 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -198,6 +198,10 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_ATMEL_ISC_BASE		(V4L2_CID_USER_BASE + 0x10c0)
 
+/* The base for the CODA driver controls.
+ * We reserve 16 controls for this driver. */
+#define V4L2_CID_USER_CODA_BASE			(V4L2_CID_USER_BASE + 0x10e0)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.27.0

