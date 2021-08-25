Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7B273F7418
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 13:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240178AbhHYLJw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 07:09:52 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:35853 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231697AbhHYLJs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 07:09:48 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 25 Aug 2021 04:09:03 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 Aug 2021 04:09:00 -0700
X-QCInternal: smtphost
Received: from c-mansur-linux.qualcomm.com ([10.204.83.180])
  by ironmsg02-blr.qualcomm.com with ESMTP; 25 Aug 2021 16:38:44 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 518FA227B2; Wed, 25 Aug 2021 16:38:43 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, dikshita@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [V3] venus: vdec: decoded picture buffer handling during reconfig sequence
Date:   Wed, 25 Aug 2021 16:38:41 +0530
Message-Id: <20210825110841.12815-1-mansur@codeaurora.org>
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

Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>

Changes in V3:
- Migrated id allocation using kernel API ida_alloc_min()

---
 drivers/media/platform/qcom/venus/helpers.c | 50 ++++++++++++++++++++-
 drivers/media/platform/qcom/venus/helpers.h |  2 +
 drivers/media/platform/qcom/venus/vdec.c    |  7 ++-
 3 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 8012f5c7bf34..f36361d346b2 100644
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
@@ -21,6 +22,13 @@
 #define NUM_MBS_720P	(((1280 + 15) >> 4) * ((720 + 15) >> 4))
 #define NUM_MBS_4K	(((4096 + 15) >> 4) * ((2304 + 15) >> 4))
 
+static DEFINE_IDA(dpb_out_tag_ida);
+
+enum dpb_buf_owner {
+	DRIVER,
+	FIRMWARE,
+};
+
 struct intbuf {
 	struct list_head list;
 	u32 type;
@@ -28,6 +36,8 @@ struct intbuf {
 	void *va;
 	dma_addr_t da;
 	unsigned long attrs;
+	enum dpb_buf_owner owned_by;
+	u32 dpb_out_tag;
 };
 
 bool venus_helper_check_codec(struct venus_inst *inst, u32 v4l2_pixfmt)
@@ -95,9 +105,16 @@ int venus_helper_queue_dpb_bufs(struct venus_inst *inst)
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
@@ -110,13 +127,19 @@ int venus_helper_free_dpb_bufs(struct venus_inst *inst)
 	struct intbuf *buf, *n;
 
 	list_for_each_entry_safe(buf, n, &inst->dpbbufs, list) {
+		if (buf->owned_by == FIRMWARE)
+			continue;
+
+		ida_free(&dpb_out_tag_ida, buf->dpb_out_tag);
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
@@ -134,6 +157,7 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
 	unsigned int i;
 	u32 count;
 	int ret;
+	int id;
 
 	/* no need to allocate dpb buffers */
 	if (!inst->dpb_fmt)
@@ -171,6 +195,15 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
 			ret = -ENOMEM;
 			goto fail;
 		}
+		buf->owned_by = DRIVER;
+
+		id = ida_alloc_min(&dpb_out_tag_ida, VB2_MAX_FRAME, GFP_KERNEL);
+		if (id < 0) {
+			ret = id;
+			goto fail;
+		}
+
+		buf->dpb_out_tag = id;
 
 		list_add_tail(&buf->list, &inst->dpbbufs);
 	}
@@ -1365,6 +1398,21 @@ venus_helper_find_buf(struct venus_inst *inst, unsigned int type, u32 idx)
 }
 EXPORT_SYMBOL_GPL(venus_helper_find_buf);
 
+void venus_helper_find_dpb_buf(struct venus_inst *inst, struct vb2_v4l2_buffer *vbuf,
+			       unsigned int type, unsigned int buf_type, u32 tag)
+{
+	struct intbuf *dpb_buf;
+
+	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+	    buf_type == HFI_BUFFER_OUTPUT)
+		list_for_each_entry(dpb_buf, &inst->dpbbufs, list)
+			if (dpb_buf->dpb_out_tag == tag) {
+				dpb_buf->owned_by = DRIVER;
+				break;
+			}
+}
+EXPORT_SYMBOL_GPL(venus_helper_find_dpb_buf);
+
 int venus_helper_vb2_buf_init(struct vb2_buffer *vb)
 {
 	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index e6269b4be3af..17c5aadaec82 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -14,6 +14,8 @@ struct venus_core;
 bool venus_helper_check_codec(struct venus_inst *inst, u32 v4l2_pixfmt);
 struct vb2_v4l2_buffer *venus_helper_find_buf(struct venus_inst *inst,
 					      unsigned int type, u32 idx);
+void venus_helper_find_dpb_buf(struct venus_inst *inst, struct vb2_v4l2_buffer *vbuf,
+			       unsigned int type, unsigned int buf_type, u32 idx);
 void venus_helper_buffers_done(struct venus_inst *inst, unsigned int type,
 			       enum vb2_buffer_state state);
 int venus_helper_vb2_buf_init(struct vb2_buffer *vb);
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 198e47eb63f4..cafdc3d8e473 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1297,6 +1297,7 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 	struct vb2_v4l2_buffer *vbuf;
 	struct vb2_buffer *vb;
 	unsigned int type;
+	struct intbuf *dpb_buf;
 
 	vdec_pm_touch(inst);
 
@@ -1306,8 +1307,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 		type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 
 	vbuf = venus_helper_find_buf(inst, type, tag);
-	if (!vbuf)
+	if (!vbuf) {
+		venus_helper_find_dpb_buf(inst, vbuf, type, buf_type, tag);
 		return;
+	}
 
 	vbuf->flags = flags;
 	vbuf->field = V4L2_FIELD_NONE;
@@ -1622,6 +1625,8 @@ static int vdec_close(struct file *file)
 
 	vdec_pm_get(inst);
 
+	venus_helper_free_dpb_bufs(inst);
+	INIT_LIST_HEAD(&inst->dpbbufs);
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 	v4l2_m2m_release(inst->m2m_dev);
 	vdec_ctrl_deinit(inst);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

