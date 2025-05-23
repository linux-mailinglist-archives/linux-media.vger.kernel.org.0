Return-Path: <linux-media+bounces-33275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A662AC2621
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 17:15:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E7D07B3AE4
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 15:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A0B297126;
	Fri, 23 May 2025 15:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="q6IIMDGv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749B5296FD9;
	Fri, 23 May 2025 15:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748013282; cv=none; b=E3RXErlFOP7WSF+vkHyOll/Z/xn+lKAwC+9qVhGG/Jad1ZVQHehqoesrQ8FZ0fSksQFkfjOxUwPQNN/y6oS2C8w+o6bnddZx/NEg7xvd4IZvBLkVxAPRqqSrZlDUDs1WYabYPM2ElzDo0T1chJfcvgB7LeR6TzW2qhB7ARmW9ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748013282; c=relaxed/simple;
	bh=DmuApbSuTnNskmemCfpPj5qX6BIIZGxJXJxgJ4QzT1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iiEtZ7eTEAM6LNeW486kPxGeyWvBHdszPNJrKI/fWBjdGQ0MgxXqVtC1sHaNvYP3rUpzRw86U055bEQLReAKxgvl8LoVivrf4nBOkg8OyDnCbVA5sWZInbPBL1dWHP4XZCApbcpdt2G/Bb9EEoES47wJ14A9agCd4xIzaYiRihw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=q6IIMDGv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:a882:21a2:2327:ac4f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24EC86B5;
	Fri, 23 May 2025 17:14:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748013256;
	bh=DmuApbSuTnNskmemCfpPj5qX6BIIZGxJXJxgJ4QzT1s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=q6IIMDGvz7smcQ2J46gbCAl6EM+JGx1ZwDBpwEfK+7EDsaDSGEBYuBupCKuoWEsj9
	 QxQNUnj5VW4/LPEbuHyuE6FSvh/IMWbnP3k2xM++R2Q9S8zPYoMfha38FS0zzMjZaB
	 272Yc5YTCrVAU4hH9aXDxV3KeL/GPpaf2cjJylVA=
From: Stefan Klug <stefan.klug@ideasonboard.com>
Date: Fri, 23 May 2025 17:14:31 +0200
Subject: [PATCH v3 2/3] media: rkisp1: Add
 RKISP1_CID_SUPPORTED_PARAMS_BLOCKS control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-supported-params-and-wdr-v3-2-7283b8536694@ideasonboard.com>
References: <20250523-supported-params-and-wdr-v3-0-7283b8536694@ideasonboard.com>
In-Reply-To: <20250523-supported-params-and-wdr-v3-0-7283b8536694@ideasonboard.com>
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

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

---
Changes in v3:
- Moved the rkisp1_params_init_vb2_queue() return check back into
  separate patch
- Renamed rkisp1_ctrl_init to rkisp1_params_ctrl_init
- Applied missed review comment in docs

Changes in v2:
- Added docs improvements from review
- Moved ctrl_config declaration to top
- Moved rkisp1_params_init_vb2_queue() return check into this patch as
  the previous patch got dropped
- Call rkisp1_ctrl_init() after media_entity_pads_init() for easier
  error handling
---
 .../media/platform/rockchip/rkisp1/rkisp1-common.h |  2 +
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 49 +++++++++++++++++++++-
 include/uapi/linux/rkisp1-config.h                 | 11 +++++
 include/uapi/linux/v4l2-controls.h                 |  6 +++
 4 files changed, 67 insertions(+), 1 deletion(-)

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
index 24a8de697f2b..4db0ca8d86db 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2736,6 +2736,44 @@ static int rkisp1_params_init_vb2_queue(struct vb2_queue *q,
 	return vb2_queue_init(q);
 }
 
+static int rkisp1_params_ctrl_init(struct rkisp1_params *params)
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
@@ -2781,15 +2819,23 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
 	if (ret)
 		goto err_media;
 
+	ret = rkisp1_params_ctrl_init(params);
+	if (ret) {
+		dev_err(rkisp1->dev, "Control initialization error %d\n", ret);
+		goto err_media;
+	}
+
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(rkisp1->dev,
 			"failed to register %s, ret=%d\n", vdev->name, ret);
-		goto err_media;
+		goto err_ctrl;
 	}
 
 	return 0;
 
+err_ctrl:
+	v4l2_ctrl_handler_free(&params->ctrls);
 err_media:
 	media_entity_cleanup(&vdev->entity);
 	mutex_destroy(&node->vlock);
@@ -2806,6 +2852,7 @@ void rkisp1_params_unregister(struct rkisp1_device *rkisp1)
 		return;
 
 	vb2_video_unregister_device(vdev);
+	v4l2_ctrl_handler_free(&params->ctrls);
 	media_entity_cleanup(&vdev->entity);
 	mutex_destroy(&node->vlock);
 }
diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 2d995f3c1ca3..5ca4d5961c5b 100644
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
@@ -1520,6 +1523,14 @@ enum rksip1_ext_param_buffer_version {
  * V4L2 control. If such control is not available, userspace should assume only
  * RKISP1_EXT_PARAM_BUFFER_V1 is supported by the driver.
  *
+ * The read-only V4L2 control ``RKISP1_CID_SUPPORTED_PARAMS_BLOCKS`` can be used
+ * to query the blocks supported by the device. It contains a bitmask where each
+ * bit represents the availability of the corresponding entry from the
+ * :c:type:`rkisp1_ext_params_block_type` enum. The current and default values
+ * of the control represents the blocks supported by the device instance, while
+ * the maximum value represents the blocks supported by the kernel driver,
+ * independently of the device instance.
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


