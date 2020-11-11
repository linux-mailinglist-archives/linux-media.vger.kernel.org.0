Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A21742AF3D5
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 15:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727236AbgKKOjZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 09:39:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727156AbgKKOik (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 09:38:40 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8AC0C061A54
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 06:38:36 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id h2so2498368wmm.0
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 06:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=v6PMbdcIaoeKpv1BZw7/QGsGTQk22a+f7y9ODfXyJpE=;
        b=RFJWXOGAFWIA2m0DXMEeGx7fabcVR1mMGdq6TnQs1KjP24WoouQwbboYBzRcmp8jpB
         qi9Ny8SkABPKT9dqzlz26bVcCblnJUVm3OoDDfUZLpTjMg2LgEFlOiRSH4vMjpjZChEl
         vMu2jvUoBdokjDTEeM9ZhroBqIfQpJWpk2WEumL9qDGbn53+qYvWOKy6TlDbkHDARkBl
         UcnQGFPQTO+rI14M8It/CepOqeJFw/CpN2K2hf3jyZJGUEesPkpOAX84zNwOTE9wMJql
         l8iQpQFls1hnJOY9ixraUMmToUy9fCC+2LpceNKAGBwy11muuFWfBlupdTv84X/Mpp01
         fpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=v6PMbdcIaoeKpv1BZw7/QGsGTQk22a+f7y9ODfXyJpE=;
        b=CNuylrhbj97fsnVeaJ2HPIedtKoZeMPQ5xHiyL3cX4TTjmb7jdhXuUTiB3SVtyiB8q
         5D+hb0L0wwdi28ri1VeTCOjejJncJL6X0nCcTtP555e/ByqifUAPqcWPEXhlg7cbPliZ
         h7wHK2DianYWaO/HzWvz20QhebmmNc/qjSYyixtlNIUkm9/OmUBYJqe+B9OhybR8oPek
         G+LC+e3DZdg2GRM0Cfpt+X9q1TRKCGlQrTovYF6kmZrfT+jpVQa7+tLXZ8nEZYoeuzzz
         I2X7f4EpXkymtbeQKG93GFKwahNo2HxFaJNJt37Fq1U5BUoR0YK2196H0uBVvq1fAOWN
         hjZQ==
X-Gm-Message-State: AOAM530riJCI7hkh1UKGktv/Ho6Pg8P6fZ6twe0S4Ydt/b0W5mx62tLn
        CCN29Yjr0KJFp3H60AZv9u57o1CDmke2vCJW
X-Google-Smtp-Source: ABdhPJyfhwZZGvSjEExcYWQXwgso+d1TfwdG22b4x1vmEe3V5gSHol4/2Oyx2YXdpspM14ZNTjwJ3w==
X-Received: by 2002:a1c:c302:: with SMTP id t2mr4671828wmf.189.1605105515148;
        Wed, 11 Nov 2020 06:38:35 -0800 (PST)
Received: from localhost.localdomain (hst-221-89.medicom.bg. [84.238.221.89])
        by smtp.gmail.com with ESMTPSA id b8sm2991405wrv.57.2020.11.11.06.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 06:38:34 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 7/8] venus: venc: Handle reset encoder state
Date:   Wed, 11 Nov 2020 16:37:54 +0200
Message-Id: <20201111143755.24541-8-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Redesign the encoder driver to be compliant with stateful encoder
spec - specifically adds handling of Reset state.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/venc.c | 155 ++++++++++++++++++-----
 1 file changed, 122 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 7512e4a16270..f1ae89d45a54 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -907,6 +907,54 @@ static int venc_queue_setup(struct vb2_queue *q,
 	return ret;
 }
 
+static void venc_release_session(struct venus_inst *inst)
+{
+	int ret, abort = 0;
+
+	mutex_lock(&inst->lock);
+
+	ret = hfi_session_deinit(inst);
+	abort = (ret && ret != -EINVAL) ? 1 : 0;
+
+	if (inst->session_error)
+		abort = 1;
+
+	if (abort)
+		hfi_session_abort(inst);
+
+	venus_pm_load_scale(inst);
+	INIT_LIST_HEAD(&inst->registeredbufs);
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
@@ -938,49 +986,57 @@ static int venc_verify_conf(struct venus_inst *inst)
 static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct venus_inst *inst = vb2_get_drv_priv(q);
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
 	int ret;
 
 	mutex_lock(&inst->lock);
 
-	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
 		inst->streamon_out = 1;
 	else
 		inst->streamon_cap = 1;
 
-	if (!(inst->streamon_out & inst->streamon_cap)) {
-		mutex_unlock(&inst->lock);
-		return 0;
-	}
+	if (inst->streamon_out && inst->streamon_cap &&
+	    inst->state == INST_UNINIT) {
+		venus_helper_init_instance(inst);
 
-	venus_helper_init_instance(inst);
+		inst->sequence_cap = 0;
+		inst->sequence_out = 0;
 
-	inst->sequence_cap = 0;
-	inst->sequence_out = 0;
+		ret = venc_init_session(inst);
+		if (ret)
+			goto bufs_done;
 
-	ret = venc_init_session(inst);
-	if (ret)
-		goto bufs_done;
+		ret = venus_pm_acquire_core(inst);
+		if (ret)
+			goto deinit_sess;
 
-	ret = venus_pm_acquire_core(inst);
-	if (ret)
-		goto deinit_sess;
+		ret = venc_verify_conf(inst);
+		if (ret)
+			goto deinit_sess;
 
-	ret = venc_set_properties(inst);
-	if (ret)
-		goto deinit_sess;
+		ret = venus_helper_set_num_bufs(inst, inst->num_input_bufs,
+						inst->num_output_bufs, 0);
+		if (ret)
+			goto deinit_sess;
 
-	ret = venc_verify_conf(inst);
-	if (ret)
-		goto deinit_sess;
+		ret = venus_helper_vb2_start_streaming(inst);
+		if (ret)
+			goto deinit_sess;
 
-	ret = venus_helper_set_num_bufs(inst, inst->num_input_bufs,
-					inst->num_output_bufs, 0);
-	if (ret)
-		goto deinit_sess;
+		venus_helper_process_initial_out_bufs(inst);
+		venus_helper_process_initial_cap_bufs(inst);
+	} else if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->streamon_cap &&
+		   inst->streamon_out) {
+		ret = venus_helper_vb2_start_streaming(inst);
+		if (ret)
+			goto bufs_done;
 
-	ret = venus_helper_vb2_start_streaming(inst);
-	if (ret)
-		goto deinit_sess;
+		venus_helper_process_initial_out_bufs(inst);
+		venus_helper_process_initial_cap_bufs(inst);
+	}
 
 	mutex_unlock(&inst->lock);
 
@@ -990,15 +1046,43 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
 	hfi_session_deinit(inst);
 bufs_done:
 	venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_QUEUED);
-	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
 		inst->streamon_out = 0;
 	else
 		inst->streamon_cap = 0;
+
 	mutex_unlock(&inst->lock);
 	return ret;
 }
 
-static void venc_vb2_buf_queue(struct vb2_buffer *vb)
+static void venc_stop_streaming(struct vb2_queue *q)
+{
+	struct venus_inst *inst = vb2_get_drv_priv(q);
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	int ret = -EINVAL;
+
+	mutex_lock(&inst->lock);
+
+	v4l2_m2m_clear_state(m2m_ctx);
+
+	if (V4L2_TYPE_IS_CAPTURE(q->type)) {
+		ret = hfi_session_stop(inst);
+		ret |= hfi_session_unload_res(inst);
+		ret |= venus_helper_unregister_bufs(inst);
+		ret |= venus_helper_intbufs_free(inst);
+	}
+
+	venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
+		inst->streamon_out = 0;
+	else
+		inst->streamon_cap = 0;
+
+	mutex_unlock(&inst->lock);
+}
+
+static void venc_buf_queue(struct vb2_buffer *vb)
 {
 	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
@@ -1022,11 +1106,12 @@ static void venc_vb2_buf_queue(struct vb2_buffer *vb)
 
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
@@ -1084,8 +1169,12 @@ static const struct hfi_inst_ops venc_hfi_ops = {
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
 
-- 
2.17.1

