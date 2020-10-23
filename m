Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF0D296FCD
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 14:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464167AbgJWM5o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 08:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S464140AbgJWM5Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 08:57:25 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA3BC0613D6
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 05:57:24 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id i1so1732336wro.1
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 05:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8Un6TK7sYYF4eb6us4s4zFOZ4gYB/IgZ68I4XdameWc=;
        b=GVnhhVaqfTwCYEap7frqME5MIVrpMpblBVZ/bwoQZw4QzcjO+Mu+KKvTli9SowTkHM
         vHf3FYM+MmVOQWPHQwp1e00BPKYvEhzDH98lwl6oEA3Fz84Ir1PsQp8SemBH4kbn0Cry
         HPNxNKnDa1XZivPFke8JL8wdliKbFls003QRmGZOAqWrJeRY35TOPcgYLm6mLpFzAgZp
         IzF549J/4w+q4ozrkPKPSPgv0q74Rt5CGBuwxTlHqDdzOiwTHwsVFG3Cs4lB9T4PHJk0
         0AdmKBDi1Of4eh+208XfIxOG1zMovrIzK4yjzDSp5rw3DKEYXRfXIZWM3C841TklX1aU
         NzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8Un6TK7sYYF4eb6us4s4zFOZ4gYB/IgZ68I4XdameWc=;
        b=kCr4Lv982YK/53gSDhkKmxI+J2e/4YKNW5xJ7vWJb2lMRtxsfimRNX2ZWAqsHLgz20
         8j47t7lq381sQXjkjr1Alx8syL+/gDxj7VuvPUuPVA0pMe/F6GKHi80N+fKdoAo051Qb
         ILFczqa0SmQ1LiWsskMkb/xFjPl0mFxOgPPcX7DEYyXnut7+usGWKZbQkQ3dTMxCJcLa
         eIsvRtwuYFCwGfZ68zzc+DgJa008w6xmu8RSCG0A0XdmFto+obXdsXEOxDSpVd/z5lKm
         1g5CKbazjIZ+79nh40W0DpJr6aKxolvYrXSFnrkvMIVsLZmLYeiqtqFSB5M94Xr1ucBB
         EjxA==
X-Gm-Message-State: AOAM532nnfrFZxRyY/8sEW/yfSV4R/YwVA2DjCXG4MISS0VIXUOkudyU
        2u0z/K9v51/jh3QcD62iqC73DLXQmmNDHZ+0
X-Google-Smtp-Source: ABdhPJyBrePHdzmqzdEums6IS7IVMXLHmgOvwinn39Q9GhIQjs3GTFb9SAKKIYWCDCuxUzbe9zm+0g==
X-Received: by 2002:adf:9793:: with SMTP id s19mr2541826wrb.139.1603457842847;
        Fri, 23 Oct 2020 05:57:22 -0700 (PDT)
Received: from localhost.localdomain (hst-221-77.medicom.bg. [84.238.221.77])
        by smtp.gmail.com with ESMTPSA id s19sm3475873wmc.0.2020.10.23.05.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 05:57:22 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 3/4] venus: venc: Handle reset encoder state
Date:   Fri, 23 Oct 2020 15:57:03 +0300
Message-Id: <20201023125704.4984-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201023125704.4984-1-stanimir.varbanov@linaro.org>
References: <20201023125704.4984-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Redesign the encoder driver to be compliant with stateful encoder
spec - specifically adds handling of Reset state.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h |  10 +-
 drivers/media/platform/qcom/venus/venc.c | 242 ++++++++++++++++++-----
 2 files changed, 197 insertions(+), 55 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 5c4693678e3f..294d5467a6a1 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -277,11 +277,11 @@ enum venus_dec_state {
 };
 
 enum venus_enc_state {
-	VENUS_ENC_STATE_DEINIT		= 0,
-	VENUS_ENC_STATE_INIT		= 1,
-	VENUS_ENC_STATE_ENCODING	= 2,
-	VENUS_ENC_STATE_STOPPED		= 3,
-	VENUS_ENC_STATE_DRAIN		= 4,
+	VENUS_ENC_STATE_INIT		= 0,
+	VENUS_ENC_STATE_ENCODING	= 1,
+	VENUS_ENC_STATE_STOPPED		= 2,
+	VENUS_ENC_STATE_DRAIN		= 3,
+	VENUS_ENC_STATE_RESET		= 4,
 };
 
 struct venus_ts_metadata {
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index c6143b07914c..aa9255ddb0a5 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -565,6 +565,7 @@ static const struct v4l2_ioctl_ops venc_ioctl_ops = {
 	.vidioc_enum_frameintervals = venc_enum_frameintervals,
 	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
 	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+	.vidioc_try_encoder_cmd = v4l2_m2m_ioctl_try_encoder_cmd,
 	.vidioc_encoder_cmd = venc_encoder_cmd,
 };
 
@@ -850,6 +851,69 @@ static int venc_queue_setup(struct vb2_queue *q,
 	return ret;
 }
 
+static void venc_release_session(struct venus_inst *inst)
+{
+	struct venus_core *core = inst->core;
+	int ret, abort = 0;
+
+	mutex_lock(&inst->lock);
+
+	if (inst->enc_state != VENUS_ENC_STATE_RESET)
+		dev_dbg(core->dev_enc, VDBGH "wrong state!\n");
+
+	ret = hfi_session_stop(inst);
+	abort |= (ret && ret != -EINVAL) ? 1 : 0;
+	ret = hfi_session_unload_res(inst);
+	abort |= (ret && ret != -EINVAL) ? 1 : 0;
+	ret = venus_helper_unregister_bufs(inst);
+	abort |= (ret && ret != -EINVAL) ? 1 : 0;
+	ret = venus_helper_intbufs_free(inst);
+	abort |= (ret && ret != -EINVAL) ? 1 : 0;
+	ret = hfi_session_deinit(inst);
+	abort |= (ret && ret != -EINVAL) ? 1 : 0;
+
+	if (inst->session_error)
+		abort = 1;
+
+	if (abort)
+		hfi_session_abort(inst);
+
+	venus_pm_load_scale(inst);
+	INIT_LIST_HEAD(&inst->registeredbufs);
+
+	inst->enc_state = VENUS_ENC_STATE_INIT;
+
+	mutex_unlock(&inst->lock);
+
+	venus_pm_release_core(inst);
+}
+
+static int venc_buf_init(struct vb2_buffer *vb)
+{
+	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+
+	inst->buf_count++;
+
+	return venus_helper_vb2_buf_init(vb);
+}
+
+static void venc_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct venus_buffer *buf = to_venus_buffer(vbuf);
+
+	mutex_lock(&inst->lock);
+	if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		if (!list_empty(&inst->registeredbufs))
+			list_del_init(&buf->reg_list);
+	mutex_unlock(&inst->lock);
+
+	inst->buf_count--;
+	if (!inst->buf_count)
+		venc_release_session(inst);
+}
+
 static int venc_verify_conf(struct venus_inst *inst)
 {
 	enum hfi_version ver = inst->core->res->hfi_version;
@@ -881,61 +945,73 @@ static int venc_verify_conf(struct venus_inst *inst)
 static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct venus_inst *inst = vb2_get_drv_priv(q);
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&inst->lock);
 
-	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
 		inst->streamon_out = 1;
 	else
 		inst->streamon_cap = 1;
 
-	if (!(inst->streamon_out & inst->streamon_cap)) {
-		mutex_unlock(&inst->lock);
-		return 0;
-	}
+	if (!(inst->streamon_out & inst->streamon_cap))
+		goto unlock;
 
-	venus_helper_init_instance(inst);
+	if (inst->enc_state == VENUS_ENC_STATE_INIT) {
+		venus_helper_init_instance(inst);
 
-	inst->sequence_cap = 0;
-	inst->sequence_out = 0;
+		inst->sequence_cap = 0;
+		inst->sequence_out = 0;
 
-	ret = venc_init_session(inst);
-	if (ret)
-		goto bufs_done;
+		ret = venc_init_session(inst);
+		if (ret)
+			goto bufs_done;
 
-	ret = venus_pm_acquire_core(inst);
-	if (ret)
-		goto deinit_sess;
+		ret = venus_pm_acquire_core(inst);
+		if (ret)
+			goto deinit_sess;
 
-	ret = venc_set_properties(inst);
-	if (ret)
-		goto deinit_sess;
+		ret = venc_verify_conf(inst);
+		if (ret)
+			goto deinit_sess;
 
-	ret = venc_verify_conf(inst);
-	if (ret)
-		goto deinit_sess;
+		ret = venus_helper_set_num_bufs(inst, inst->num_input_bufs,
+						inst->num_output_bufs, 0);
+		if (ret)
+			goto deinit_sess;
 
-	ret = venus_helper_set_num_bufs(inst, inst->num_input_bufs,
-					inst->num_output_bufs, 0);
-	if (ret)
-		goto deinit_sess;
+		ret = venus_helper_vb2_start_streaming(inst);
+		if (ret)
+			goto deinit_sess;
 
-	ret = venus_helper_vb2_start_streaming(inst);
-	if (ret)
-		goto deinit_sess;
+		venus_helper_process_initial_out_bufs(inst);
+		venus_helper_process_initial_cap_bufs(inst);
 
-	inst->enc_state = VENUS_ENC_STATE_ENCODING;
+		inst->enc_state = VENUS_ENC_STATE_ENCODING;
+	} else if (inst->enc_state == VENUS_ENC_STATE_RESET &&
+		   V4L2_TYPE_IS_CAPTURE(q->type)) {
+		ret = venus_helper_vb2_start_streaming(inst);
+		if (ret)
+			goto bufs_done;
 
-	mutex_unlock(&inst->lock);
+		venus_helper_process_initial_out_bufs(inst);
+		venus_helper_process_initial_cap_bufs(inst);
 
-	return 0;
+		inst->enc_state = VENUS_ENC_STATE_ENCODING;
+	} else if (inst->enc_state == VENUS_ENC_STATE_STOPPED &&
+		   V4L2_TYPE_IS_OUTPUT(q->type)) {
+		inst->enc_state = VENUS_ENC_STATE_ENCODING;
+	}
+
+unlock:
+	mutex_unlock(&inst->lock);
+	return ret;
 
 deinit_sess:
 	hfi_session_deinit(inst);
 bufs_done:
 	venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_QUEUED);
-	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
 		inst->streamon_out = 0;
 	else
 		inst->streamon_cap = 0;
@@ -943,33 +1019,97 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
 	return ret;
 }
 
-static void venc_vb2_buf_queue(struct vb2_buffer *vb)
+static int venc_stop_capture(struct venus_inst *inst)
+{
+	int ret;
+
+	switch (inst->enc_state) {
+	case VENUS_ENC_STATE_ENCODING:
+	case VENUS_ENC_STATE_DRAIN:
+	case VENUS_ENC_STATE_STOPPED:
+		inst->enc_state = VENUS_ENC_STATE_RESET;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = hfi_session_stop(inst);
+	ret |= hfi_session_unload_res(inst);
+	ret |= venus_helper_unregister_bufs(inst);
+	ret |= venus_helper_intbufs_free(inst);
+
+	return ret;
+}
+
+static int venc_stop_output(struct venus_inst *inst)
+{
+	switch (inst->enc_state) {
+	case VENUS_ENC_STATE_ENCODING:
+		inst->enc_state = VENUS_ENC_STATE_STOPPED;
+		break;
+	case VENUS_ENC_STATE_DRAIN:
+		inst->enc_state = VENUS_ENC_STATE_STOPPED;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void venc_stop_streaming(struct vb2_queue *q)
+{
+	struct venus_inst *inst = vb2_get_drv_priv(q);
+	int ret = -EINVAL;
+
+	mutex_lock(&inst->lock);
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
+		ret = venc_stop_output(inst);
+	else
+		ret = venc_stop_capture(inst);
+
+	venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
+
+	if (ret)
+		goto unlock;
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
+		inst->streamon_out = 0;
+	else
+		inst->streamon_cap = 0;
+
+unlock:
+	mutex_unlock(&inst->lock);
+}
+
+static void venc_buf_queue(struct vb2_buffer *vb)
 {
 	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
 
 	mutex_lock(&inst->lock);
 
-	if (inst->enc_state == VENUS_ENC_STATE_STOPPED) {
-		vbuf->sequence = inst->sequence_cap++;
-		vbuf->field = V4L2_FIELD_NONE;
-		vb2_set_plane_payload(vb, 0, 0);
-		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
-		mutex_unlock(&inst->lock);
-		return;
-	}
+	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
+
+	if (!(inst->streamon_out && inst->streamon_cap))
+		goto unlock;
+
+	venus_helper_process_buf(vb);
 
-	venus_helper_vb2_buf_queue(vb);
+unlock:
 	mutex_unlock(&inst->lock);
 }
 
 static const struct vb2_ops venc_vb2_ops = {
 	.queue_setup = venc_queue_setup,
-	.buf_init = venus_helper_vb2_buf_init,
+	.buf_init = venc_buf_init,
+	.buf_cleanup = venc_buf_cleanup,
 	.buf_prepare = venus_helper_vb2_buf_prepare,
 	.start_streaming = venc_start_streaming,
-	.stop_streaming = venus_helper_vb2_stop_streaming,
-	.buf_queue = venc_vb2_buf_queue,
+	.stop_streaming = venc_stop_streaming,
+	.buf_queue = venc_buf_queue,
 };
 
 static void venc_buf_done(struct venus_inst *inst, unsigned int buf_type,
@@ -1025,8 +1165,12 @@ static const struct hfi_inst_ops venc_hfi_ops = {
 	.event_notify = venc_event_notify,
 };
 
+static void venc_m2m_device_run(void *priv)
+{
+}
+
 static const struct v4l2_m2m_ops venc_m2m_ops = {
-	.device_run = venus_helper_m2m_device_run,
+	.device_run = venc_m2m_device_run,
 	.job_abort = venus_helper_m2m_job_abort,
 };
 
@@ -1098,11 +1242,9 @@ static int venc_open(struct file *file)
 	inst->core = core;
 	inst->session_type = VIDC_SESSION_TYPE_ENC;
 	inst->clk_data.core_id = VIDC_CORE_ID_DEFAULT;
+	inst->enc_state = VENUS_ENC_STATE_INIT;
 	inst->core_acquired = false;
 
-	if (inst->enc_state == VENUS_ENC_STATE_DEINIT)
-		inst->enc_state = VENUS_ENC_STATE_INIT;
-
 	venus_helper_init_instance(inst);
 
 	ret = pm_runtime_get_sync(core->dev_enc);
@@ -1167,7 +1309,7 @@ static int venc_close(struct file *file)
 	mutex_destroy(&inst->lock);
 	v4l2_fh_del(&inst->fh);
 	v4l2_fh_exit(&inst->fh);
-	inst->enc_state = VENUS_ENC_STATE_DEINIT;
+
 	pm_runtime_put_sync(inst->core->dev_enc);
 
 	kfree(inst);
-- 
2.17.1

