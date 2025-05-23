Return-Path: <linux-media+bounces-33246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE85AC20A6
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 12:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75D2A7BE36D
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 10:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE4D227EB9;
	Fri, 23 May 2025 10:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WsC/5w+J"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055A7226CEF;
	Fri, 23 May 2025 10:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747994879; cv=none; b=nwDbigptmR29I4s1H+8AY8EXtUC2v6bScAAOmtHYfSXsQEbJ/Y5lzAH3xyW6ATF6TkX9/CmaKTw6Zt9fgeeI0mfzSkiEUjvsfs+SfXOtLomgAEH+g3YpVpzFJ+V/qLd3ZfdGvx1arxsgiSg2pZ9LjVy4g6WkJ+w4wdv6QKtxfOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747994879; c=relaxed/simple;
	bh=2/Y1xbcobWL0d7jO2OsWfYtpGcl8fieyGac7/05r3nY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M9z9bM4MSmf38T9DRB3uMkXEYXxuBg0yVngUSlb0SCP81wiS6pUqQCW7hT1+uYDFnqXJoUllO4uuX3NmJ4EBM45z6Py+kSQVrotd95154fgJ0lxKDuIsgQPGWjFu/rbOK0oZGrLGc1Gp4PAu3rdPeeOUcYwJvYxHIGXlUHrJ+Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WsC/5w+J; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:a882:21a2:2327:ac4f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 673DC6B5;
	Fri, 23 May 2025 12:07:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747994853;
	bh=2/Y1xbcobWL0d7jO2OsWfYtpGcl8fieyGac7/05r3nY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WsC/5w+JvK8nUyw0HBzTjRRRNKg+S414OaxCPTPDA5/NpCIAkEJOTO4MK8j4gevdo
	 xiwPjdtZI5eWx8wb3qAuJACDc3I15LQBXWjkTuLLi88pN4Y9DFdR9O4LdZOc3zdnX4
	 e7REo727KJb4y6AQ1y3SoBHiMIgB5utEHY052yrg=
From: Stefan Klug <stefan.klug@ideasonboard.com>
Date: Fri, 23 May 2025 12:07:31 +0200
Subject: [PATCH v2 1/2] media: rkisp1: Add
 RKISP1_CID_SUPPORTED_PARAMS_BLOCKS control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-supported-params-and-wdr-v2-1-5a88dca5f420@ideasonboard.com>
References: <20250523-supported-params-and-wdr-v2-0-5a88dca5f420@ideasonboard.com>
In-Reply-To: <20250523-supported-params-and-wdr-v2-0-5a88dca5f420@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Stefan Klug <stefan.klug@ideasonboard.com>, 
 Paul Elder <paul.elder@ideasonboard.com>
X-Mailer: b4 0.13.0

Add a RKISP1_CID_SUPPORTED_PARAMS_BLOCKS V4L2 control to be able to
query the parameters blocks supported by the current kernel on the
current hardware from user space.

As a drive-by fix handle an (very unlikely) error in
rkisp1_params_init_vb2_queue().

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

---

Changes in v2:
- Added docs improvements from review
- Moved ctrl_config declaration to top
- Moved rkisp1_params_init_vb2_queue() return check into this patch as
  the previous patch got dropped
- Call rkisp1_ctrl_init() after media_entity_pads_init() for easier
  error handling
---
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |  2 +
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 57 ++++++++++++++++++++--
 include/uapi/linux/rkisp1-config.h                 |  9 ++++
 include/uapi/linux/v4l2-controls.h                 |  6 +++
 4 files changed, 70 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index ca952fd0829b..5f187f9efc7b 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -415,6 +415,8 @@ struct rkisp1_params {
 	spinlock_t config_lock; /* locks the buffers list 'params' */
 	struct list_head params;
 
+	struct v4l2_ctrl_handler ctrls;
+
 	const struct v4l2_meta_format *metafmt;
 
 	enum v4l2_quantization quantization;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index b28f4140c8a3..b276926beb3c 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2736,6 +2736,44 @@ static int rkisp1_params_init_vb2_queue(struct vb2_queue *q,
 	return vb2_queue_init(q);
 }
 
+static int rkisp1_ctrl_init(struct rkisp1_params *params)
+{
+	struct v4l2_ctrl_config ctrl_config = {
+		.id = RKISP1_CID_SUPPORTED_PARAMS_BLOCKS,
+		.name = "Supported Params Blocks",
+		.type = V4L2_CTRL_TYPE_BITMASK,
+		.flags = V4L2_CTRL_FLAG_READ_ONLY,
+	};
+	int ret;
+
+	v4l2_ctrl_handler_init(&params->ctrls, 1);
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(rkisp1_ext_params_handlers); i++) {
+		const struct rkisp1_ext_params_handler *block_handler;
+
+		block_handler = &rkisp1_ext_params_handlers[i];
+		ctrl_config.max |= BIT(i);
+
+		if ((params->rkisp1->info->features & block_handler->features) !=
+		    block_handler->features)
+			continue;
+
+		ctrl_config.def |= BIT(i);
+	}
+
+	v4l2_ctrl_new_custom(&params->ctrls, &ctrl_config, NULL);
+
+	params->vnode.vdev.ctrl_handler = &params->ctrls;
+
+	if (params->ctrls.error) {
+		ret = params->ctrls.error;
+		v4l2_ctrl_handler_free(&params->ctrls);
+		return ret;
+	}
+
+	return 0;
+}
+
 int rkisp1_params_register(struct rkisp1_device *rkisp1)
 {
 	struct rkisp1_params *params = &rkisp1->params;
@@ -2763,7 +2801,9 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
 	vdev->queue = &node->buf_queue;
 	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_META_OUTPUT;
 	vdev->vfl_dir = VFL_DIR_TX;
-	rkisp1_params_init_vb2_queue(vdev->queue, params);
+	ret = rkisp1_params_init_vb2_queue(vdev->queue, params);
+	if (ret)
+		goto err_media;
 
 	params->metafmt = &rkisp1_params_formats[RKISP1_PARAMS_FIXED];
 
@@ -2777,18 +2817,26 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
 	node->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
 	if (ret)
-		goto error;
+		goto err_media;
+
+	ret = rkisp1_ctrl_init(params);
+	if (ret) {
+		dev_err(rkisp1->dev, "Control initialization error %d\n", ret);
+		goto err_media;
+	}
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(rkisp1->dev,
 			"failed to register %s, ret=%d\n", vdev->name, ret);
-		goto error;
+		goto err_ctrl;
 	}
 
 	return 0;
 
-error:
+err_ctrl:
+	v4l2_ctrl_handler_free(&params->ctrls);
+err_media:
 	media_entity_cleanup(&vdev->entity);
 	mutex_destroy(&node->vlock);
 	return ret;
@@ -2804,6 +2852,7 @@ void rkisp1_params_unregister(struct rkisp1_device *rkisp1)
 		return;
 
 	vb2_video_unregister_device(vdev);
+	v4l2_ctrl_handler_free(&params->ctrls);
 	media_entity_cleanup(&vdev->entity);
 	mutex_destroy(&node->vlock);
 }
diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 2d995f3c1ca3..85c1b02f3f78 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -1086,6 +1086,9 @@ enum rkisp1_ext_params_block_type {
 #define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
 #define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE	(1U << 1)
 
+/* A bitmask of parameters blocks supported on the current hardware. */
+#define RKISP1_CID_SUPPORTED_PARAMS_BLOCKS	(V4L2_CID_USER_RKISP1_BASE + 0x01)
+
 /**
  * struct rkisp1_ext_params_block_header - RkISP1 extensible parameters block
  *					   header
@@ -1520,6 +1523,12 @@ enum rksip1_ext_param_buffer_version {
  * V4L2 control. If such control is not available, userspace should assume only
  * RKISP1_EXT_PARAM_BUFFER_V1 is supported by the driver.
  *
+ * The read-only V4L2 control ``RKISP1_CID_SUPPORTED_PARAMS_BLOCKS`` can be used
+ * to query the blocks supported by the device. It contains a bitmask where each
+ * bit represents the availability of the corresponding entry from the
+ * :c:type:`rkisp1_ext_params_block_type` enum. The max value of the control
+ * represents the blocks supported by the kernel (independent of the device).
+ *
  * For each ISP block that userspace wants to configure, a block-specific
  * structure is appended to the @data buffer, one after the other without gaps
  * in between nor overlaps. Userspace shall populate the @data_size field with
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 72e32814ea83..f836512e9deb 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -222,6 +222,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_UVC_BASE			(V4L2_CID_USER_BASE + 0x11e0)
 
+/*
+ * The base for Rockchip ISP1 driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_RKISP1_BASE		(V4L2_CID_USER_BASE + 0x1220)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */

-- 
2.43.0


