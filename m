Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42F80292952
	for <lists+linux-media@lfdr.de>; Mon, 19 Oct 2020 16:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729223AbgJSO3Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 10:29:16 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:60139 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728311AbgJSO3Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 10:29:16 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 19 Oct 2020 07:29:16 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 19 Oct 2020 07:29:14 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 19 Oct 2020 19:59:00 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 5492F52E7; Mon, 19 Oct 2020 19:58:59 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH] venus: venc: add handling for VIDIOC_ENCODER_CMD
Date:   Mon, 19 Oct 2020 19:58:57 +0530
Message-Id: <1603117737-16965-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add handling for below commands in encoder:
1. V4L2_ENC_CMD_STOP
2. V4L2_ENC_CMD_START

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.h |  9 +++++
 drivers/media/platform/qcom/venus/venc.c | 64 +++++++++++++++++++++++++++++++-
 2 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index e30eeaf..5c46936 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -276,6 +276,14 @@ enum venus_dec_state {
 	VENUS_DEC_STATE_DRC		= 7,
 };
 
+enum venus_enc_state {
+	VENUS_ENC_STATE_DEINIT		= 0,
+	VENUS_ENC_STATE_INIT		= 1,
+	VENUS_ENC_STATE_ENCODING	= 2,
+	VENUS_ENC_STATE_STOPPED		= 3,
+	VENUS_ENC_STATE_DRAIN		= 4,
+};
+
 struct venus_ts_metadata {
 	bool used;
 	u64 ts_ns;
@@ -367,6 +375,7 @@ struct venus_inst {
 	u8 quantization;
 	u8 xfer_func;
 	enum venus_dec_state codec_state;
+	enum venus_enc_state enc_state;
 	wait_queue_head_t reconf_wait;
 	unsigned int subscriptions;
 	int buf_count;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index f7fb6e3..c6143b0 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -498,6 +498,46 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
 	return 0;
 }
 
+static int
+venc_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *cmd)
+{
+	struct venus_inst *inst = to_inst(file);
+	struct hfi_frame_data fdata = {0};
+	int ret = 0;
+
+	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, cmd);
+	if (ret)
+		return ret;
+
+	mutex_lock(&inst->lock);
+
+	if (cmd->cmd == V4L2_ENC_CMD_STOP &&
+	    inst->enc_state == VENUS_ENC_STATE_ENCODING) {
+		/*
+		 * Implement V4L2_ENC_CMD_STOP by enqueue an empty buffer on
+		 * encoder input to signal EOS.
+		 */
+		if (!(inst->streamon_out && inst->streamon_cap))
+			goto unlock;
+
+		fdata.buffer_type = HFI_BUFFER_INPUT;
+		fdata.flags |= HFI_BUFFERFLAG_EOS;
+		fdata.device_addr = 0xdeadb000;
+
+		ret = hfi_session_process_buf(inst, &fdata);
+
+		inst->enc_state = VENUS_ENC_STATE_DRAIN;
+	} else if (cmd->cmd == V4L2_ENC_CMD_START &&
+		inst->enc_state == VENUS_ENC_STATE_STOPPED) {
+		vb2_clear_last_buffer_dequeued(&inst->fh.m2m_ctx->cap_q_ctx.q);
+		inst->enc_state = VENUS_ENC_STATE_ENCODING;
+	}
+
+unlock:
+	mutex_unlock(&inst->lock);
+	return ret;
+}
+
 static const struct v4l2_ioctl_ops venc_ioctl_ops = {
 	.vidioc_querycap = venc_querycap,
 	.vidioc_enum_fmt_vid_cap = venc_enum_fmt,
@@ -525,6 +565,7 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
 	.vidioc_enum_frameintervals = venc_enum_frameintervals,
 	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
 	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+	.vidioc_encoder_cmd = venc_encoder_cmd,
 };
 
 static int venc_set_properties(struct venus_inst *inst)
@@ -884,6 +925,8 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
 	if (ret)
 		goto deinit_sess;
 
+	inst->enc_state = VENUS_ENC_STATE_ENCODING;
+
 	mutex_unlock(&inst->lock);
 
 	return 0;
@@ -903,8 +946,19 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
 static void venc_vb2_buf_queue(struct vb2_buffer *vb)
 {
 	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 
 	mutex_lock(&inst->lock);
+
+	if (inst->enc_state == VENUS_ENC_STATE_STOPPED) {
+		vbuf->sequence = inst->sequence_cap++;
+		vbuf->field = V4L2_FIELD_NONE;
+		vb2_set_plane_payload(vb, 0, 0);
+		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
+		mutex_unlock(&inst->lock);
+		return;
+	}
+
 	venus_helper_vb2_buf_queue(vb);
 	mutex_unlock(&inst->lock);
 }
@@ -943,6 +997,11 @@ static void venc_buf_done(struct venus_inst *inst, unsigned int buf_type,
 		vb->planes[0].data_offset = data_offset;
 		vb->timestamp = timestamp_us * NSEC_PER_USEC;
 		vbuf->sequence = inst->sequence_cap++;
+
+		if ((vbuf->flags & V4L2_BUF_FLAG_LAST) &&
+		    inst->enc_state == VENUS_ENC_STATE_DRAIN) {
+			inst->enc_state = VENUS_ENC_STATE_STOPPED;
+		}
 	} else {
 		vbuf->sequence = inst->sequence_out++;
 	}
@@ -1041,6 +1100,9 @@ static int venc_open(struct file *file)
 	inst->clk_data.core_id = VIDC_CORE_ID_DEFAULT;
 	inst->core_acquired = false;
 
+	if (inst->enc_state == VENUS_ENC_STATE_DEINIT)
+		inst->enc_state = VENUS_ENC_STATE_INIT;
+
 	venus_helper_init_instance(inst);
 
 	ret = pm_runtime_get_sync(core->dev_enc);
@@ -1105,7 +1167,7 @@ static int venc_close(struct file *file)
 	mutex_destroy(&inst->lock);
 	v4l2_fh_del(&inst->fh);
 	v4l2_fh_exit(&inst->fh);
-
+	inst->enc_state = VENUS_ENC_STATE_DEINIT;
 	pm_runtime_put_sync(inst->core->dev_enc);
 
 	kfree(inst);
-- 
1.9.1

