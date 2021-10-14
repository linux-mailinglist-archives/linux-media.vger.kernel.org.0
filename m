Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF1142D166
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 06:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbhJNEQk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 00:16:40 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:55360 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbhJNEQj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 00:16:39 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 13 Oct 2021 21:14:35 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 13 Oct 2021 21:14:34 -0700
X-QCInternal: smtphost
Received: from c-mansur-linux.qualcomm.com ([10.204.83.180])
  by ironmsg01-blr.qualcomm.com with ESMTP; 14 Oct 2021 09:44:23 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id B6F6A224F7; Thu, 14 Oct 2021 09:44:22 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, dikshita@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [V4] venus: vdec: decoded picture buffer handling during reconfig sequence
Date:   Thu, 14 Oct 2021 09:44:20 +0530
Message-Id: <20211014041420.26451-1-mansur@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

changes in V4:
- As per comments moved static global variable to venus_inst structure
- Addressed other review comments
Changes in V3:
- Migrated id allocation using kernel API ida_alloc_min()

Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.h    |  1 +
 drivers/media/platform/qcom/venus/helpers.c | 51 ++++++++++++++++++++-
 drivers/media/platform/qcom/venus/helpers.h |  3 ++
 drivers/media/platform/qcom/venus/vdec.c    |  8 +++-
 4 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index a3f077f64be0..34cbd3ef0cd9 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -454,6 +454,7 @@ struct venus_inst {
 	bool next_buf_last;
 	bool drain_active;
 	enum venus_inst_modes flags;
+	struct ida dpb_ids;
 };
 
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 7f2f5b91caaa..464bc7693987 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2012-2016, The Linux Foundation. All rights reserved.
  * Copyright (C) 2017 Linaro Ltd.
  */
+#include <linux/idr.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
@@ -21,6 +22,11 @@
 #define NUM_MBS_720P	(((ALIGN(1280, 16)) >> 4) * ((ALIGN(736, 16)) >> 4))
 #define NUM_MBS_4K	(((ALIGN(4096, 16)) >> 4) * ((ALIGN(2304, 16)) >> 4))
 
+enum dpb_buf_owner {
+	DRIVER,
+	FIRMWARE,
+};
+
 struct intbuf {
 	struct list_head list;
 	u32 type;
@@ -28,6 +34,8 @@ struct intbuf {
 	void *va;
 	dma_addr_t da;
 	unsigned long attrs;
+	enum dpb_buf_owner owned_by;
+	u32 dpb_out_tag;
 };
 
 bool venus_helper_check_codec(struct venus_inst *inst, u32 v4l2_pixfmt)
@@ -95,9 +103,16 @@ int venus_helper_queue_dpb_bufs(struct venus_inst *inst)
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
@@ -110,13 +125,19 @@ int venus_helper_free_dpb_bufs(struct venus_inst *inst)
 	struct intbuf *buf, *n;
 
 	list_for_each_entry_safe(buf, n, &inst->dpbbufs, list) {
+		if (buf->owned_by == FIRMWARE)
+			continue;
+
+		ida_free(&inst->dpb_ids, buf->dpb_out_tag);
+
 		list_del_init(&buf->list);
 		dma_free_attrs(inst->core->dev, buf->size, buf->va, buf->da,
 			       buf->attrs);
 		kfree(buf);
 	}
 
-	INIT_LIST_HEAD(&inst->dpbbufs);
+	if (list_empty(&inst->dpbbufs))
+		INIT_LIST_HEAD(&inst->dpbbufs);
 
 	return 0;
 }
@@ -134,6 +155,7 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
 	unsigned int i;
 	u32 count;
 	int ret;
+	int id;
 
 	/* no need to allocate dpb buffers */
 	if (!inst->dpb_fmt)
@@ -171,6 +193,15 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
 			ret = -ENOMEM;
 			goto fail;
 		}
+		buf->owned_by = DRIVER;
+
+		id = ida_alloc_min(&inst->dpb_ids, VB2_MAX_FRAME, GFP_KERNEL);
+		if (id < 0) {
+			ret = id;
+			goto fail;
+		}
+
+		buf->dpb_out_tag = id;
 
 		list_add_tail(&buf->list, &inst->dpbbufs);
 	}
@@ -1371,6 +1402,24 @@ venus_helper_find_buf(struct venus_inst *inst, unsigned int type, u32 idx)
 }
 EXPORT_SYMBOL_GPL(venus_helper_find_buf);
 
+void venus_helper_change_dpb_owner(struct venus_inst *inst,
+				   struct vb2_v4l2_buffer *vbuf, unsigned int type,
+				   unsigned int buf_type, u32 tag)
+{
+	struct intbuf *dpb_buf;
+
+	if (!V4L2_TYPE_IS_CAPTURE(type) ||
+	    buf_type != inst->dpb_buftype)
+		return;
+
+	list_for_each_entry(dpb_buf, &inst->dpbbufs, list)
+		if (dpb_buf->dpb_out_tag == tag) {
+			dpb_buf->owned_by = DRIVER;
+			break;
+		}
+}
+EXPORT_SYMBOL_GPL(venus_helper_change_dpb_owner);
+
 int venus_helper_vb2_buf_init(struct vb2_buffer *vb)
 {
 	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index e6269b4be3af..ff8889795b43 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -14,6 +14,9 @@ struct venus_core;
 bool venus_helper_check_codec(struct venus_inst *inst, u32 v4l2_pixfmt);
 struct vb2_v4l2_buffer *venus_helper_find_buf(struct venus_inst *inst,
 					      unsigned int type, u32 idx);
+void venus_helper_change_dpb_owner(struct venus_inst *inst,
+				   struct vb2_v4l2_buffer *vbuf, unsigned int type,
+				   unsigned int buf_type, u32 idx);
 void venus_helper_buffers_done(struct venus_inst *inst, unsigned int type,
 			       enum vb2_buffer_state state);
 int venus_helper_vb2_buf_init(struct vb2_buffer *vb);
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 41c5a353fcae..c2f24e454b28 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1317,6 +1317,7 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 	struct vb2_v4l2_buffer *vbuf;
 	struct vb2_buffer *vb;
 	unsigned int type;
+	struct intbuf *dpb_buf;
 
 	vdec_pm_touch(inst);
 
@@ -1326,8 +1327,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 		type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 
 	vbuf = venus_helper_find_buf(inst, type, tag);
-	if (!vbuf)
+	if (!vbuf) {
+		venus_helper_change_dpb_buf_owner(inst, vbuf, type, buf_type, tag);
 		return;
+	}
 
 	vbuf->flags = flags;
 	vbuf->field = V4L2_FIELD_NONE;
@@ -1606,6 +1609,8 @@ static int vdec_open(struct file *file)
 
 	vdec_inst_init(inst);
 
+	ida_init(&inst->dpb_ids);
+
 	/*
 	 * create m2m device for every instance, the m2m context scheduling
 	 * is made by firmware side so we do not need to care about.
@@ -1651,6 +1656,7 @@ static int vdec_close(struct file *file)
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 	v4l2_m2m_release(inst->m2m_dev);
 	vdec_ctrl_deinit(inst);
+	ida_destroy(&inst->dpb_ids);
 	hfi_session_destroy(inst);
 	mutex_destroy(&inst->lock);
 	v4l2_fh_del(&inst->fh);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

