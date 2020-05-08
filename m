Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED04F1CA3C7
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 08:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgEHGXC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 02:23:02 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:20314 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725897AbgEHGXC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 02:23:02 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 08 May 2020 11:52:06 +0530
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 08 May 2020 11:51:55 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 670163AD3; Fri,  8 May 2020 11:51:54 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, majja@codeaurora.org, jdas@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [RFC PATCH 2/3] Enable Request API for output buffers 
Date:   Fri,  8 May 2020 11:51:29 +0530
Message-Id: <1588918890-673-3-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588918890-673-1-git-send-email-dikshita@codeaurora.org>
References: <1588918890-673-1-git-send-email-dikshita@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change-Id: Ic09179f503bf7d4bb41522fb70207728405cc7b3
Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/Kconfig                 |  2 +-
 drivers/media/platform/qcom/venus/core.h       |  3 ++
 drivers/media/platform/qcom/venus/helpers.c    | 75 +++++++++++++++++++++++++-
 drivers/media/platform/qcom/venus/venc.c       | 25 ++++++++-
 drivers/media/platform/qcom/venus/venc_ctrls.c | 61 ++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls.c           | 10 ++++
 include/media/v4l2-ctrls.h                     |  1 +
 include/media/venus-ctrls.h                    | 22 ++++++++
 8 files changed, 195 insertions(+), 4 deletions(-)
 create mode 100644 include/media/venus-ctrls.h

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index a51f76e..064b57b 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -481,7 +481,7 @@ config VIDEO_TI_VPE_DEBUG
 
 config VIDEO_QCOM_VENUS
 	tristate "Qualcomm Venus V4L2 encoder/decoder driver"
-	depends on VIDEO_DEV && VIDEO_V4L2 && MEDIA_CONTROLLER
+	depends on VIDEO_DEV && VIDEO_V4L2 && MEDIA_CONTROLLER && MEDIA_CONTROLLER_REQUEST_API
 	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select QCOM_SCM if ARCH_QCOM
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 91ff08d..9535d33 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -11,6 +11,8 @@
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <linux/time.h>
+#include <linux/timer.h>
 
 #include "hfi.h"
 
@@ -320,6 +322,7 @@ struct venus_ts_metadata {
 struct venus_inst {
 	struct list_head list;
 	struct mutex lock;
+	struct mutex req_lock;
 	struct venus_core *core;
 	struct list_head dpbbufs;
 	struct list_head internalbufs;
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 2c766cd..c966c24 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -27,6 +27,63 @@ struct intbuf {
 	unsigned long attrs;
 };
 
+int venus_ctrl_request_process(struct media_request *req)
+{
+	struct v4l2_ext_control control;
+	struct v4l2_ext_controls controls;
+	int ret = 0;
+	//struct media_device mdev = inst->core->m_dev;
+
+	struct media_request_object *obj;
+	struct v4l2_ctrl_handler *parent_hdl, *hdl;
+	struct venus_inst *inst;
+	struct v4l2_ctrl *ctrl;
+	struct v4l2_ctrl_ref *ref;
+	unsigned int count;
+	list_for_each_entry(obj, &req->objects, list) {
+		struct vb2_buffer *vb;
+
+		if (vb2_request_object_is_buffer(obj)) {
+			vb = container_of(obj, struct vb2_buffer, req_obj);
+			inst = vb2_get_drv_priv(vb->vb2_queue);
+			//struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+			break;
+		}
+	}
+
+	if (!inst) {
+		pr_debug("No buffer was provided with the request\n");
+		return -ENOENT;
+	}
+	struct video_device *vdev = inst->core->vdev_enc;
+	count = vb2_request_buffer_cnt(req);
+	if (!count) {
+		pr_debug("No buffer was provided with the request\n");
+		return -ENOENT;
+	} else if (count > 1) {
+		pr_debug("More than one buffer was provided with the request\n");
+		return -EINVAL;
+	}
+
+	parent_hdl = &inst->ctrl_handler;
+
+	hdl = v4l2_ctrl_request_hdl_find(req, parent_hdl);
+	if (!hdl) {
+		pr_debug( "Missing control handler\n");
+		return -ENOENT;
+	}
+
+	ctrl = v4l2_ctrl_request_hdl_ctrl_find(hdl,
+					       V4L2_CID_MPEG_VIDEO_VENUS_METADATA);
+
+	pr_debug("venus_ctrl_request_process ctrl id %d index %d",ctrl->id,ctrl->p_new.p_metadata->index);
+	return ret;
+}
+
+static int venus_helper_register_entity(struct media_device *mdev,
+	struct venus_media *media, enum venus_helper_entity_type type,
+	struct video_device *vdev, int function);
+
 bool venus_helper_check_codec(struct venus_inst *inst, u32 v4l2_pixfmt)
 {
 	struct venus_core *core = inst->core;
@@ -522,7 +579,10 @@ void venus_helper_get_ts_metadata(struct venus_inst *inst, u64 timestamp_us,
 	unsigned int type = vb->type;
 	struct hfi_frame_data fdata;
 	int ret;
-
+	struct media_request *req;
+	u64 ts,ts_ms;
+	struct timespec tv;
+	req = vb->req_obj.req;
 	memset(&fdata, 0, sizeof(fdata));
 	fdata.alloc_len = buf->size;
 	fdata.device_addr = buf->dma_addr;
@@ -549,7 +609,20 @@ void venus_helper_get_ts_metadata(struct venus_inst *inst, u64 timestamp_us,
 		fdata.filled_len = 0;
 		fdata.offset = 0;
 	}
+	if(req && type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+	{
+		ret = v4l2_ctrl_request_setup(req, &inst->ctrl_handler);
+		if (ret)
+			pr_debug("v4l2_ctrl_request_setup retunred error");
+		ret = venus_ctrl_request_process(req);
+	}
 
+	pr_debug("buf type %d buf index %d",fdata.buffer_type,vbuf->vb2_buf.index);
+	if(type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		getnstimeofday(&tv);
+		ts = (tv.tv_sec * 1000000) + (tv.tv_nsec / 1000);
+		pr_debug("ETB: BUF %d queued at tv sec %ld ts ns %ld ts usec %lld",vbuf->vb2_buf.index,tv.tv_sec,tv.tv_nsec,ts);
+	}
 	ret = hfi_session_process_buf(inst, &fdata);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index f57542f..599cfae 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1031,6 +1031,21 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
 	return ret;
 }
 
+static int venc_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	vbuf->field = V4L2_FIELD_NONE;
+	return 0;
+}
+
+static void venc_buf_request_complete(struct vb2_buffer *vb)
+{
+	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+
+	v4l2_ctrl_request_complete(vb->req_obj.req, &inst->ctrl_handler);
+}
+
 static const struct vb2_ops venc_vb2_ops = {
 	.queue_setup = venc_queue_setup,
 	.buf_init = venus_helper_vb2_buf_init,
@@ -1038,6 +1053,8 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
 	.start_streaming = venc_start_streaming,
 	.stop_streaming = venus_helper_vb2_stop_streaming,
 	.buf_queue = venus_helper_vb2_buf_queue,
+	.buf_out_validate	= venc_buf_out_validate,
+	.buf_request_complete	= venc_buf_request_complete,
 };
 
 static void venc_buf_done(struct venus_inst *inst, unsigned int buf_type,
@@ -1068,7 +1085,8 @@ static void venc_buf_done(struct venus_inst *inst, unsigned int buf_type,
 	} else {
 		vbuf->sequence = inst->sequence_out++;
 	}
-
+	if (buf_type == HFI_BUFFER_INPUT)
+		v4l2_ctrl_request_complete(vbuf->vb2_buf.req_obj.req, &inst->ctrl_handler);
 	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 }
 
@@ -1109,6 +1127,9 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->allow_zero_bytesused = 1;
 	src_vq->min_buffers_needed = 1;
 	src_vq->dev = inst->core->dev;
+	src_vq->supports_requests = 1;
+	src_vq->requires_requests = 1;
+	src_vq->lock = &inst->req_lock;
 	if (inst->core->res->hfi_version == HFI_VERSION_1XX)
 		src_vq->bidirectional = 1;
 	ret = vb2_queue_init(src_vq);
@@ -1125,6 +1146,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->allow_zero_bytesused = 1;
 	dst_vq->min_buffers_needed = 1;
 	dst_vq->dev = inst->core->dev;
+	dst_vq->lock = src_vq->lock;
 	ret = vb2_queue_init(dst_vq);
 	if (ret) {
 		vb2_queue_release(src_vq);
@@ -1163,6 +1185,7 @@ static int venc_open(struct file *file)
 	INIT_LIST_HEAD(&inst->internalbufs);
 	INIT_LIST_HEAD(&inst->list);
 	mutex_init(&inst->lock);
+	mutex_init(&inst->req_lock);
 
 	inst->core = core;
 	inst->session_type = VIDC_SESSION_TYPE_ENC;
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 877c0b3..02921b5 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -199,6 +199,12 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		}
 		mutex_unlock(&inst->lock);
 		break;
+	case V4L2_CID_MPEG_VIDEO_VENUS_METADATA: {
+		unsigned int i;
+		const struct v4l2_ctrl_venus_metadata *metadata = ctrl->p_new.p_metadata;
+		pr_debug("%s: VENUS_METADATA p_new set index %d \n", __func__,metadata->index);
+		break;
+		}
 	default:
 		return -EINVAL;
 	}
@@ -206,15 +212,66 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	return 0;
 }
 
+static int venc_op_try_ctrl(struct v4l2_ctrl *ctrl)
+{
+	switch (ctrl->id) {
+	case V4L2_CID_MPEG_VIDEO_VENUS_METADATA: {
+		break;
+	}
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+static void meta_type_init(const struct v4l2_ctrl *ctrl, u32 idx,
+			   union v4l2_ctrl_ptr ptr)
+{
+}
+
+static bool meta_type_equal(const struct v4l2_ctrl *ctrl, u32 idx,
+			    union v4l2_ctrl_ptr ptr1,
+			    union v4l2_ctrl_ptr ptr2)
+{
+	return true;
+}
+
+static void meta_type_log(const struct v4l2_ctrl *ctrl)
+{
+}
+
+static int meta_type_validate(const struct v4l2_ctrl *ctrl, u32 idx,
+			      union v4l2_ctrl_ptr ptr)
+{
+	return 0;
+}
+
 static const struct v4l2_ctrl_ops venc_ctrl_ops = {
 	.s_ctrl = venc_op_s_ctrl,
+	.try_ctrl = venc_op_try_ctrl,
+};
+
+static const struct v4l2_ctrl_type_ops venus_meta_type_ops = {
+	.equal = meta_type_equal,
+	.init = meta_type_init,
+	.log = meta_type_log,
+	.validate = meta_type_validate,
+};
+
+static const struct v4l2_ctrl_config venus_meta_cfg = {
+	.name = "Venus codec metadata",
+	.type = V4L2_CTRL_TYPE_VENUS_METADATA,
+	.ops = &venc_ctrl_ops,
+	.id = V4L2_CID_MPEG_VIDEO_VENUS_METADATA,
+	.flags = V4L2_CTRL_FLAG_EXECUTE_ON_WRITE,
+	.elem_size = sizeof(struct v4l2_ctrl_venus_metadata),
+	.type_ops = &venus_meta_type_ops,
 };
 
 int venc_ctrl_init(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 30);
+	ret = v4l2_ctrl_handler_init(&inst->ctrl_handler, 30+1);
 	if (ret)
 		return ret;
 
@@ -351,6 +408,8 @@ int venc_ctrl_init(struct venus_inst *inst)
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
 			  V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME, 0, 0, 0, 0);
 
+	v4l2_ctrl_new_custom(&inst->ctrl_handler, &venus_meta_cfg, NULL);
+
 	ret = inst->ctrl_handler.error;
 	if (ret)
 		goto err;
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index cd84dbb..9f7f024 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -892,6 +892,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice Parameters";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-2 Quantization Matrices";
 	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:			return "FWHT Stateless Parameters";
+	case V4L2_CID_MPEG_VIDEO_VENUS_METADATA:		return "Venus codec metadata";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
 	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
 
@@ -1357,6 +1358,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:
 		*type = V4L2_CTRL_TYPE_FWHT_PARAMS;
 		break;
+	case V4L2_CID_MPEG_VIDEO_VENUS_METADATA:
+		*type = V4L2_CTRL_TYPE_VENUS_METADATA;
+		break;
 	case V4L2_CID_MPEG_VIDEO_H264_SPS:
 		*type = V4L2_CTRL_TYPE_H264_SPS;
 		break;
@@ -1820,6 +1824,9 @@ static int std_validate(const struct v4l2_ctrl *ctrl, u32 idx,
 			return -ERANGE;
 		return 0;
 
+	case V4L2_CTRL_TYPE_VENUS_METADATA:
+		return 0;
+		
 	default:
 		return std_validate_compound(ctrl, idx, ptr);
 	}
@@ -2403,6 +2410,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_FWHT_PARAMS:
 		elem_size = sizeof(struct v4l2_ctrl_fwht_params);
 		break;
+	case V4L2_CTRL_TYPE_VENUS_METADATA:
+		elem_size = sizeof(struct v4l2_ctrl_venus_metadata);
+		break;
 	case V4L2_CTRL_TYPE_H264_SPS:
 		elem_size = sizeof(struct v4l2_ctrl_h264_sps);
 		break;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 570ff4b..c66b797 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -12,6 +12,7 @@
 #include <linux/mutex.h>
 #include <linux/videodev2.h>
 #include <media/media-request.h>
+#include <media/venus-ctrls.h>
 
 /*
  * Include the stateless codec compound control definitions.
diff --git a/include/media/venus-ctrls.h b/include/media/venus-ctrls.h
new file mode 100644
index 0000000..9179ef0
--- /dev/null
+++ b/include/media/venus-ctrls.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+Copyright (c) 2020, The Linux Foundation. All rights reserved. */
+/*
+ * These are custom (compound) controls for Venus codec driver.
+ *
+ * It turns out that these structs are not stable yet and will undergo
+ * more changes. So keep them private until they are stable and ready to
+ * become part of the official public API.
+ */
+
+#ifndef _VENUS_CTRLS_H_
+#define _VENUS_CTRLS_H_
+
+#define V4L2_CTRL_TYPE_VENUS_METADATA		0x0107
+#define V4L2_CID_MPEG_VIDEO_VENUS_METADATA	(V4L2_CID_MPEG_BASE + 293)
+
+struct v4l2_ctrl_venus_metadata {
+	unsigned int index;
+//	__u8 rawdata[16];
+};
+
+#endif
\ No newline at end of file
-- 
1.9.1

