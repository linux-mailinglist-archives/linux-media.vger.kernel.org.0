Return-Path: <linux-media+bounces-33165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39338AC0FAE
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E8A8A42D41
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 15:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C06290DBB;
	Thu, 22 May 2025 15:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D7VQZCIK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF0D28FFE5;
	Thu, 22 May 2025 15:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926752; cv=none; b=q7+EKVDGYD1qfJsCQ+wVQWIL9fQoxFCol1bGzW8orDZSlmny/ouK876cXpis2vHYgZWjIGRdZJdrz7xSXlKQDDKcJUiH03U8bcnK0ltH7IhpPM7AQAMDr5UzHkJN+dZtjCnAfP7arszZNjMQrzjB11vtNHfvN/McRy90HgKTok4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926752; c=relaxed/simple;
	bh=e1C002idRxW3Y3Om7Wt4N3dyiahh0aQaCeBmMgp+HiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bWTHMUTK31K6m4YpgNvaAuxx4/xMkKR/Hr7QZRdeqB1S1/XX583xv1aY2mdWUuU2RD1oFhwsk2p8JS0S3Tu6Btc8hi8vsInhdzXpprbal6itpyINOMYbvxTJNaCe6xIEUrgnAtlU4gVPVWCA1MhBn4IdFXPY0K0WcPRot9ZT2bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D7VQZCIK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:30c3:8bbb:632f:b0c9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 459E38FA;
	Thu, 22 May 2025 17:12:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747926727;
	bh=e1C002idRxW3Y3Om7Wt4N3dyiahh0aQaCeBmMgp+HiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D7VQZCIKdcVUSj9rs9bOC82Qa1bzRyjR59cTgJjLoTmIA+7J/eZAPvKWqQmrHszAd
	 Zy8pTU91dIFwnAtNdUBc8cNh04fRzAG2/MupjIf+RKfnsvBHc0M73em6T28uI84HaU
	 BL9rqz5kd6GH58DHvnOLN7eRlZYKwz9Ysr5rORec=
From: Stefan Klug <stefan.klug@ideasonboard.com>
To: linux-media@vger.kernel.org,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: rkisp1: Add RKISP1_CID_SUPPORTED_PARAMS_BLOCKS control
Date: Thu, 22 May 2025 17:08:39 +0200
Message-ID: <20250522150944.400046-4-stefan.klug@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522150944.400046-2-stefan.klug@ideasonboard.com>
References: <20250522150944.400046-2-stefan.klug@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a RKISP1_CID_SUPPORTED_PARAMS_BLOCKS V4L2 control to be able to
query the parameters blocks supported by the current kernel on the
current hardware from user space.

Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  2 +
 .../platform/rockchip/rkisp1/rkisp1-params.c  | 50 ++++++++++++++++++-
 include/uapi/linux/rkisp1-config.h            | 10 ++++
 include/uapi/linux/v4l2-controls.h            |  6 +++
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
index 918eb06c7465..60c9b3c46593 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -2736,6 +2736,45 @@ static int rkisp1_params_init_vb2_queue(struct vb2_queue *q,
 	return vb2_queue_init(q);
 }
 
+static int rkisp1_ctrl_init(struct rkisp1_params *params)
+{
+	int ret;
+
+	v4l2_ctrl_handler_init(&params->ctrls, 1);
+
+	struct v4l2_ctrl_config ctrl_config = {
+		.id = RKISP1_CID_SUPPORTED_PARAMS_BLOCKS,
+		.name = "Supported Params Blocks",
+		.type = V4L2_CTRL_TYPE_BITMASK,
+		.flags = V4L2_CTRL_FLAG_READ_ONLY,
+	};
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
@@ -2776,10 +2815,16 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
 
 	video_set_drvdata(vdev, params);
 
+	ret = rkisp1_ctrl_init(params);
+	if (ret) {
+		dev_err(rkisp1->dev, "Control initialization error %d\n", ret);
+		goto err_mutex;
+	}
+
 	node->pad.flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&vdev->entity, 1, &node->pad);
 	if (ret)
-		goto err_mutex;
+		goto err_ctrl;
 
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
@@ -2792,6 +2837,8 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
 
 err_media:
 	media_entity_cleanup(&vdev->entity);
+err_ctrl:
+	v4l2_ctrl_handler_free(&params->ctrls);
 err_mutex:
 	mutex_destroy(&node->vlock);
 	return ret;
@@ -2808,5 +2855,6 @@ void rkisp1_params_unregister(struct rkisp1_device *rkisp1)
 
 	vb2_video_unregister_device(vdev);
 	media_entity_cleanup(&vdev->entity);
+	v4l2_ctrl_handler_free(&params->ctrls);
 	mutex_destroy(&node->vlock);
 }
diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 2d995f3c1ca3..4fc8f221d0c4 100644
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
@@ -1520,6 +1523,13 @@ enum rksip1_ext_param_buffer_version {
  * V4L2 control. If such control is not available, userspace should assume only
  * RKISP1_EXT_PARAM_BUFFER_V1 is supported by the driver.
  *
+ * The read-only V4L2 control ``RKISP1_CID_SUPPORTED_PARAMS_BLOCKS`` can be used
+ * to query the blocks supported by the current hardware. It contains a bitmask
+ * where each bit represents the availability of the corresponding entry
+ * from the :c:type:`rkisp1_ext_params_block_type` enum. The max value of the
+ * control represents the blocks supported by the current kernel (independent of
+ * the current hardware).
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


