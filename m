Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F95F3C70CC
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 14:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236342AbhGMNB5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jul 2021 09:01:57 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:54710 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236205AbhGMNB5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jul 2021 09:01:57 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 13 Jul 2021 05:59:07 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 13 Jul 2021 05:59:05 -0700
X-QCInternal: smtphost
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 13 Jul 2021 18:28:43 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 47A4222735; Tue, 13 Jul 2021 18:28:42 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, dikshita@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH] venus: vdec: decoded picture buffer handling during reconfig sequence
Date:   Tue, 13 Jul 2021 18:28:36 +0530
Message-Id: <1626181116-2650-1-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In existing implementation, driver is freeing and un-mapping all the
decoded picture buffers(DPB) as part of dynamic resolution change(DRC)
handling. As a result, when firmware try to access the DPB buffer, from
previous sequence, SMMU context fault is seen due to the buffer being
already unmapped.

With this change, driver defines ownership of each DPB buffer. If a buffer
is owned by firmware, driver would skip from un-mapping the same.

Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.h    |  3 +++
 drivers/media/platform/qcom/venus/helpers.c | 37 ++++++++++++++++++++++-------
 drivers/media/platform/qcom/venus/helpers.h | 17 +++++++++++++
 drivers/media/platform/qcom/venus/vdec.c    | 25 ++++++++++++++++++-
 4 files changed, 72 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 8df2d49..7ecbf9e 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -450,6 +450,7 @@ struct venus_inst {
 	bool next_buf_last;
 	bool drain_active;
 	enum venus_inst_modes flags;
+	u32 dpb_out_tag[VB2_MAX_FRAME];
 };
 
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
@@ -484,4 +485,6 @@ venus_caps_by_codec(struct venus_core *core, u32 codec, u32 domain)
 	return NULL;
 }
 
+void dpb_out_tag_init(struct venus_inst *inst);
+
 #endif
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 1fe6d46..ee2e26a 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -21,14 +21,6 @@
 #define NUM_MBS_720P	(((1280 + 15) >> 4) * ((720 + 15) >> 4))
 #define NUM_MBS_4K	(((4096 + 15) >> 4) * ((2304 + 15) >> 4))
 
-struct intbuf {
-	struct list_head list;
-	u32 type;
-	size_t size;
-	void *va;
-	dma_addr_t da;
-	unsigned long attrs;
-};
 
 bool venus_helper_check_codec(struct venus_inst *inst, u32 v4l2_pixfmt)
 {
@@ -95,9 +87,16 @@ int venus_helper_queue_dpb_bufs(struct venus_inst *inst)
 		fdata.device_addr = buf->da;
 		fdata.buffer_type = buf->type;
 
+		if (buf->owned_by == FIRMWARE)
+			continue;
+
+		fdata.clnt_data = buf->dpb_out_tag;
+
 		ret = hfi_session_process_buf(inst, &fdata);
 		if (ret)
 			goto fail;
+
+		buf->owned_by = FIRMWARE;
 	}
 
 fail:
@@ -110,18 +109,36 @@ int venus_helper_free_dpb_bufs(struct venus_inst *inst)
 	struct intbuf *buf, *n;
 
 	list_for_each_entry_safe(buf, n, &inst->dpbbufs, list) {
+		if (buf->owned_by == FIRMWARE)
+			continue;
+
+		inst->dpb_out_tag[buf->dpb_out_tag - VB2_MAX_FRAME] = 0;
+
 		list_del_init(&buf->list);
 		dma_free_attrs(inst->core->dev, buf->size, buf->va, buf->da,
 			       buf->attrs);
 		kfree(buf);
 	}
 
-	INIT_LIST_HEAD(&inst->dpbbufs);
 
 	return 0;
 }
 EXPORT_SYMBOL_GPL(venus_helper_free_dpb_bufs);
 
+int venus_helper_get_free_dpb_tag(struct venus_inst *inst)
+{
+	u32 i;
+
+	for (i = 0; i < VB2_MAX_FRAME; i++) {
+		if (inst->dpb_out_tag[i] == 0) {
+			inst->dpb_out_tag[i] = i + VB2_MAX_FRAME;
+			return inst->dpb_out_tag[i];
+		}
+	}
+
+	return 0;
+}
+
 int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
 {
 	struct venus_core *core = inst->core;
@@ -171,6 +188,8 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
 			ret = -ENOMEM;
 			goto fail;
 		}
+		buf->owned_by = DRIVER;
+		buf->dpb_out_tag = venus_helper_get_free_dpb_tag(inst);
 
 		list_add_tail(&buf->list, &inst->dpbbufs);
 	}
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index e6269b4..e6ff556 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -8,6 +8,22 @@
 
 #include <media/videobuf2-v4l2.h>
 
+enum dpb_buf_owner {
+	DRIVER,
+	FIRMWARE,
+};
+
+struct intbuf {
+	struct list_head list;
+	u32 type;
+	size_t size;
+	void *va;
+	dma_addr_t da;
+	unsigned long attrs;
+	enum dpb_buf_owner owned_by;
+	u32 dpb_out_tag;
+};
+
 struct venus_inst;
 struct venus_core;
 
@@ -66,4 +82,5 @@ int venus_helper_get_profile_level(struct venus_inst *inst, u32 *profile, u32 *l
 int venus_helper_set_profile_level(struct venus_inst *inst, u32 profile, u32 level);
 int venus_helper_set_stride(struct venus_inst *inst, unsigned int aligned_width,
 			    unsigned int aligned_height);
+
 #endif
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 198e47e..ba46085 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1297,6 +1297,7 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 	struct vb2_v4l2_buffer *vbuf;
 	struct vb2_buffer *vb;
 	unsigned int type;
+	struct intbuf *dpb_buf;
 
 	vdec_pm_touch(inst);
 
@@ -1306,8 +1307,18 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 		type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 
 	vbuf = venus_helper_find_buf(inst, type, tag);
-	if (!vbuf)
+	if (!vbuf) {
+		if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+		    buf_type == HFI_BUFFER_OUTPUT) {
+			list_for_each_entry(dpb_buf, &inst->dpbbufs, list) {
+				if (dpb_buf->dpb_out_tag == tag) {
+					dpb_buf->owned_by = DRIVER;
+					break;
+				}
+			}
+		}
 		return;
+	}
 
 	vbuf->flags = flags;
 	vbuf->field = V4L2_FIELD_NONE;
@@ -1542,6 +1553,14 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	return vb2_queue_init(dst_vq);
 }
 
+void dpb_out_tag_init(struct venus_inst *inst)
+{
+	u32 i;
+
+	for (i = 0; i < VB2_MAX_FRAME; i++)
+		inst->dpb_out_tag[i] = 0;
+}
+
 static int vdec_open(struct file *file)
 {
 	struct venus_core *core = video_drvdata(file);
@@ -1580,6 +1599,8 @@ static int vdec_open(struct file *file)
 
 	vdec_inst_init(inst);
 
+	dpb_out_tag_init(inst);
+
 	/*
 	 * create m2m device for every instance, the m2m context scheduling
 	 * is made by firmware side so we do not need to care about.
@@ -1622,6 +1643,8 @@ static int vdec_close(struct file *file)
 
 	vdec_pm_get(inst);
 
+	venus_helper_free_dpb_bufs(inst);
+	INIT_LIST_HEAD(&inst->dpbbufs);
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 	v4l2_m2m_release(inst->m2m_dev);
 	vdec_ctrl_deinit(inst);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

