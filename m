Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59C9B59C4A
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 15:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727272AbfF1NAn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 09:00:43 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36287 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727255AbfF1NAn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 09:00:43 -0400
Received: by mail-wr1-f68.google.com with SMTP id n4so6230890wrs.3
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 06:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cqNW5TepyqJSQjT3wXnjRFvBshqnH/sS+2K51W7sW/A=;
        b=g/d14WmjQTWaZsq7cM+6sWfheqExgPtpi6bdrVMsgQMKV12GeKR87Q6AmwsPC0/MwZ
         Q42o3anGJbqcRb6bd6ANt9+SACrZh1ivAFCkOw0tHr97E8OM8o1aI6ldo67Gm9ZjDMtm
         eqgkcdLQYZYmQRxjjcy10bHmTHVOsMM3a0FZ1qmgEqSHMYDjIYlsuB/bYcJ4s+EL2N7J
         EZZXMKzTWASfwYYh6sRwPqgWTvEjGhPJWmrKmbzR0yF1JUJZyDsA6pWfc0cxK7ko7m5c
         faX5IptfsjfTdP4Hk44dGAwT0valRSM/iL/tG/uhqBv3Shd++/c5QcSSrOtSwy1rA797
         xAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cqNW5TepyqJSQjT3wXnjRFvBshqnH/sS+2K51W7sW/A=;
        b=I5r2/aXI0vcSiUJPLfGBa4QZnd0jeiHig8bVOKOPixKT0uM0gB+xhE53JcNS/gMiTX
         EZCV5GlLuNpMiVpWX+6khWwiHmEx2+KI1YlYRbZIW3SwiQzROR377otrdFkYkyA/AkeP
         4eEBefk0AcpMG0uB+r7pLiUsIKZ26G+3DTxrt2oMeJuhbePitGxGxIYu06dsho2fB6vY
         rCdcrQQnK4Gw6oqql0qc5ymWx8hDOFsAN80HHQt7VI9RFCcJkxASjylLaHaPDUpshQ6Y
         rAqt07m/f7azOMGQSViLu3GORCN1CC0Lr4mScsRVko6aMaKvv0sk6U7MiySGxXlGBJXT
         x2yw==
X-Gm-Message-State: APjAAAUQ3mtafwgIfDX9Nv1kekscJz4OSa7oo7GG4pfBmtzrnUlEDoYW
        My7fZHv5fG4deTYplJEG70LdR4r7p8k=
X-Google-Smtp-Source: APXvYqweXVQtC+cpNRbhpM7NsJPlbBPr4dEZ2p2sYLJyBFeTE+Z+Fk5iBEnEsOQGWas4JNIgggIzlA==
X-Received: by 2002:adf:dec3:: with SMTP id i3mr7787958wrn.74.1561726838881;
        Fri, 28 Jun 2019 06:00:38 -0700 (PDT)
Received: from localhost.localdomain ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id w20sm3717174wra.96.2019.06.28.06.00.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 28 Jun 2019 06:00:38 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 09/11] venus: make decoder compliant with stateful codec API
Date:   Fri, 28 Jun 2019 16:00:00 +0300
Message-Id: <20190628130002.24293-10-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
References: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This refactors code for start/stop streaming vb2 operations and
adds a state machine handling similar to the one in stateful codec
API documentation. One major change is that now the HFI session is
started on STREAMON(OUTPUT) and stopped on REQBUF(OUTPUT,count=0),
during that time STREAMOFF(CAP,OUT) just flush buffers but doesn't
stop the session. The other major change is that now the capture
and output queues are completely separated.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h    |  24 +-
 drivers/media/platform/qcom/venus/helpers.c |  23 +-
 drivers/media/platform/qcom/venus/helpers.h |   1 +
 drivers/media/platform/qcom/venus/vdec.c    | 519 +++++++++++++++-----
 4 files changed, 435 insertions(+), 132 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 9ab95fd57760..139b5d786375 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -209,6 +209,18 @@ struct venus_buffer {
 
 #define to_venus_buffer(ptr)	container_of(ptr, struct venus_buffer, vb)
 
+enum venus_dec_state {
+	VENUS_DEC_STATE_DEINIT 		= 0,
+	VENUS_DEC_STATE_INIT		= 1,
+	VENUS_DEC_STATE_CAPTURE_SETUP	= 2,
+	VENUS_DEC_STATE_STOPPED		= 3,
+	VENUS_DEC_STATE_SEEK		= 4,
+	VENUS_DEC_STATE_DRAIN		= 5,
+	VENUS_DEC_STATE_DECODING	= 6,
+	VENUS_DEC_STATE_DRC		= 7
+};
+
+
 /**
  * struct venus_inst - holds per instance parameters
  *
@@ -232,6 +244,10 @@ struct venus_buffer {
  * @colorspace:	current color space
  * @quantization:	current quantization
  * @xfer_func:	current xfer function
+ * @codec_state:	current codec API state (see DEC/ENC_STATE_)
+ * @reconf_wait:	wait queue for resolution change event
+ * @subscriptions:	used to hold current events subscriptions
+ * @buf_count:		used to count number of buffers (reqbuf(0))
  * @fps:		holds current FPS
  * @timeperframe:	holds current time per frame structure
  * @fmt_out:	a reference to output format structure
@@ -246,8 +262,6 @@ struct venus_buffer {
  * @opb_buftype:	output picture buffer type
  * @opb_fmt:		output picture buffer raw format
  * @reconfig:	a flag raised by decoder when the stream resolution changed
- * @reconfig_width:	holds the new width
- * @reconfig_height:	holds the new height
  * @hfi_codec:		current codec for this instance in HFI space
  * @sequence_cap:	a sequence counter for capture queue
  * @sequence_out:	a sequence counter for output queue
@@ -287,6 +301,10 @@ struct venus_inst {
 	u8 ycbcr_enc;
 	u8 quantization;
 	u8 xfer_func;
+	enum venus_dec_state codec_state;
+	wait_queue_head_t reconf_wait;
+	unsigned int subscriptions;
+	int buf_count;
 	u64 fps;
 	struct v4l2_fract timeperframe;
 	const struct venus_format *fmt_out;
@@ -301,8 +319,6 @@ struct venus_inst {
 	u32 opb_buftype;
 	u32 opb_fmt;
 	bool reconfig;
-	u32 reconfig_width;
-	u32 reconfig_height;
 	u32 hfi_codec;
 	u32 sequence_cap;
 	u32 sequence_out;
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index ab20fd3b36d9..176facdd415d 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1021,16 +1021,19 @@ void venus_helper_vb2_buf_queue(struct vb2_buffer *vb)
 
 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
 
-	if (!(inst->streamon_out & inst->streamon_cap))
+	if (inst->session_type == VIDC_SESSION_TYPE_ENC &&
+	    !(inst->streamon_out && inst->streamon_cap))
 		goto unlock;
 
-	ret = is_buf_refed(inst, vbuf);
-	if (ret)
-		goto unlock;
+	if (vb2_start_streaming_called(vb->vb2_queue)) {
+		ret = is_buf_refed(inst, vbuf);
+		if (ret)
+			goto unlock;
 
-	ret = session_process_buf(inst, vbuf);
-	if (ret)
-		return_buf_error(inst, vbuf);
+		ret = session_process_buf(inst, vbuf);
+		if (ret)
+			return_buf_error(inst, vbuf);
+	}
 
 unlock:
 	mutex_unlock(&inst->lock);
@@ -1146,14 +1149,8 @@ int venus_helper_vb2_start_streaming(struct venus_inst *inst)
 	if (ret)
 		goto err_unload_res;
 
-	ret = venus_helper_queue_dpb_bufs(inst);
-	if (ret)
-		goto err_session_stop;
-
 	return 0;
 
-err_session_stop:
-	hfi_session_stop(inst);
 err_unload_res:
 	hfi_session_unload_res(inst);
 err_unreg_bufs:
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index 486598d52811..f2e111555bd9 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -8,6 +8,7 @@
 
 #include <media/videobuf2-v4l2.h>
 
+
 struct venus_inst;
 struct venus_core;
 
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index fb9afee76793..336d49132d19 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -186,33 +186,56 @@ static int vdec_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
+static int vdec_check_src_change(struct venus_inst *inst)
+{
+	int ret;
+
+	if (inst->subscriptions & V4L2_EVENT_SOURCE_CHANGE &&
+	    inst->codec_state == VENUS_DEC_STATE_INIT &&
+	    !inst->reconfig)
+		return -EINVAL;
+
+	if (inst->subscriptions & V4L2_EVENT_SOURCE_CHANGE)
+		return 0;
+
+	/*
+	 * The code snippet below is a workaround for backward compatibility
+	 * with applications which doesn't support V4L2 events. It will be
+	 * dropped in future once those applications are fixed.
+	 */
+
+	if (inst->codec_state != VENUS_DEC_STATE_INIT)
+		goto done;
+
+	ret = wait_event_timeout(inst->reconf_wait, inst->reconfig,
+				 msecs_to_jiffies(100));
+	if (!ret)
+		return -EINVAL;
+
+	if (!(inst->codec_state == VENUS_DEC_STATE_CAPTURE_SETUP) ||
+	    !inst->reconfig)
+		dev_dbg(inst->core->dev, "%s: wrong state\n", __func__);
+
+done:
+	return 0;
+}
+
 static int vdec_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
 {
 	struct venus_inst *inst = to_inst(file);
 	const struct venus_format *fmt = NULL;
 	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
+	int ret;
 
 	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
 		fmt = inst->fmt_cap;
 	else if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		fmt = inst->fmt_out;
 
-	if (inst->reconfig) {
-		struct v4l2_format format = {};
-
-		inst->out_width = inst->reconfig_width;
-		inst->out_height = inst->reconfig_height;
-		inst->reconfig = false;
-
-		format.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
-		format.fmt.pix_mp.pixelformat = inst->fmt_cap->pixfmt;
-		format.fmt.pix_mp.width = inst->out_width;
-		format.fmt.pix_mp.height = inst->out_height;
-
-		vdec_try_fmt_common(inst, &format);
-
-		inst->width = format.fmt.pix_mp.width;
-		inst->height = format.fmt.pix_mp.height;
+	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		ret = vdec_check_src_change(inst);
+		if (ret)
+			return ret;
 	}
 
 	pixmp->pixelformat = fmt->pixfmt;
@@ -427,11 +450,18 @@ static int vdec_enum_framesizes(struct file *file, void *fh,
 static int vdec_subscribe_event(struct v4l2_fh *fh,
 				const struct v4l2_event_subscription *sub)
 {
+	struct venus_inst *inst = container_of(fh, struct venus_inst, fh);
+	int ret;
+
 	switch (sub->type) {
 	case V4L2_EVENT_EOS:
 		return v4l2_event_subscribe(fh, sub, 2, NULL);
 	case V4L2_EVENT_SOURCE_CHANGE:
-		return v4l2_src_change_event_subscribe(fh, sub);
+		ret = v4l2_src_change_event_subscribe(fh, sub);
+		if (ret)
+			return ret;
+		inst->subscriptions |= V4L2_EVENT_SOURCE_CHANGE;
+		return 0;
 	case V4L2_EVENT_CTRL:
 		return v4l2_ctrl_subscribe_event(fh, sub);
 	default:
@@ -439,21 +469,6 @@ static int vdec_subscribe_event(struct v4l2_fh *fh,
 	}
 }
 
-static int
-vdec_try_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
-{
-	switch (cmd->cmd) {
-	case V4L2_DEC_CMD_STOP:
-		if (cmd->flags & V4L2_DEC_CMD_STOP_TO_BLACK)
-			return -EINVAL;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int
 vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 {
@@ -461,24 +476,29 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 	struct hfi_frame_data fdata = {0};
 	int ret;
 
-	ret = vdec_try_decoder_cmd(file, fh, cmd);
+	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, cmd);
 	if (ret)
 		return ret;
 
 	mutex_lock(&inst->lock);
 
-	/*
-	 * Implement V4L2_DEC_CMD_STOP by enqueue an empty buffer on decoder
-	 * input to signal EOS.
-	 */
-	if (!(inst->streamon_out & inst->streamon_cap))
-		goto unlock;
+	if (cmd->cmd == V4L2_DEC_CMD_STOP) {
+		/*
+		 * Implement V4L2_DEC_CMD_STOP by enqueue an empty buffer on
+		 * decoder input to signal EOS.
+		 */
+		if (!(inst->streamon_out && inst->streamon_cap))
+			goto unlock;
 
-	fdata.buffer_type = HFI_BUFFER_INPUT;
-	fdata.flags |= HFI_BUFFERFLAG_EOS;
-	fdata.device_addr = 0xdeadbeef;
+		fdata.buffer_type = HFI_BUFFER_INPUT;
+		fdata.flags |= HFI_BUFFERFLAG_EOS;
+		fdata.device_addr = 0xdeadb000;
 
-	ret = hfi_session_process_buf(inst, &fdata);
+		ret = hfi_session_process_buf(inst, &fdata);
+
+		if (!ret && inst->codec_state == VENUS_DEC_STATE_DECODING)
+			inst->codec_state = VENUS_DEC_STATE_DRAIN;
+	}
 
 unlock:
 	mutex_unlock(&inst->lock);
@@ -509,7 +529,7 @@ static const struct v4l2_ioctl_ops vdec_ioctl_ops = {
 	.vidioc_enum_framesizes = vdec_enum_framesizes,
 	.vidioc_subscribe_event = vdec_subscribe_event,
 	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
-	.vidioc_try_decoder_cmd = vdec_try_decoder_cmd,
+	.vidioc_try_decoder_cmd = v4l2_m2m_ioctl_try_decoder_cmd,
 	.vidioc_decoder_cmd = vdec_decoder_cmd,
 };
 
@@ -639,20 +659,18 @@ static int vdec_output_conf(struct venus_inst *inst)
 	return 0;
 }
 
-static int vdec_init_session(struct venus_inst *inst)
+static int vdec_session_init(struct venus_inst *inst)
 {
 	int ret;
 
 	ret = hfi_session_init(inst, inst->fmt_out->pixfmt);
-	if (ret)
+	if (ret == -EINVAL)
+		return 0;
+	else if (ret)
 		return ret;
 
-	ret = venus_helper_set_input_resolution(inst, inst->out_width,
-						inst->out_height);
-	if (ret)
-		goto deinit;
-
-	ret = venus_helper_set_color_format(inst, inst->fmt_cap->pixfmt);
+	ret = venus_helper_set_input_resolution(inst, frame_width_min(inst),
+						frame_height_min(inst));
 	if (ret)
 		goto deinit;
 
@@ -671,26 +689,19 @@ static int vdec_num_buffers(struct venus_inst *inst, unsigned int *in_num,
 
 	*in_num = *out_num = 0;
 
-	ret = vdec_init_session(inst);
-	if (ret)
-		return ret;
-
 	ret = venus_helper_get_bufreq(inst, HFI_BUFFER_INPUT, &bufreq);
 	if (ret)
-		goto deinit;
+		return ret;
 
 	*in_num = HFI_BUFREQ_COUNT_MIN(&bufreq, ver);
 
 	ret = venus_helper_get_bufreq(inst, HFI_BUFFER_OUTPUT, &bufreq);
 	if (ret)
-		goto deinit;
+		return ret;
 
 	*out_num = HFI_BUFREQ_COUNT_MIN(&bufreq, ver);
 
-deinit:
-	hfi_session_deinit(inst);
-
-	return ret;
+	return 0;
 }
 
 static int vdec_queue_setup(struct vb2_queue *q,
@@ -723,6 +734,10 @@ static int vdec_queue_setup(struct vb2_queue *q,
 		return 0;
 	}
 
+	ret = vdec_session_init(inst);
+	if (ret)
+		return ret;
+
 	ret = vdec_num_buffers(inst, &in_num, &out_num);
 	if (ret)
 		return ret;
@@ -747,6 +762,11 @@ static int vdec_queue_setup(struct vb2_queue *q,
 		inst->output_buf_size = sizes[0];
 		*num_buffers = max(*num_buffers, out_num);
 		inst->num_output_bufs = *num_buffers;
+
+		mutex_lock(&inst->lock);
+		if (inst->codec_state == VENUS_DEC_STATE_CAPTURE_SETUP)
+			inst->codec_state = VENUS_DEC_STATE_STOPPED;
+		mutex_unlock(&inst->lock);
 		break;
 	default:
 		ret = -EINVAL;
@@ -783,80 +803,295 @@ static int vdec_verify_conf(struct venus_inst *inst)
 	return 0;
 }
 
-static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
+static int vdec_start_capture(struct venus_inst *inst)
 {
-	struct venus_inst *inst = vb2_get_drv_priv(q);
 	int ret;
 
-	mutex_lock(&inst->lock);
+	if (!inst->streamon_out)
+		return 0;
 
-	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
-		inst->streamon_out = 1;
-	else
-		inst->streamon_cap = 1;
+	if (inst->codec_state == VENUS_DEC_STATE_DECODING) {
+		if (inst->reconfig)
+			goto reconfigure;
 
-	if (!(inst->streamon_out & inst->streamon_cap)) {
-		mutex_unlock(&inst->lock);
+		venus_helper_queue_dpb_bufs(inst);
+		venus_helper_process_initial_cap_bufs(inst);
+		inst->streamon_cap = 1;
 		return 0;
 	}
 
-	venus_helper_init_instance(inst);
+	if (inst->codec_state != VENUS_DEC_STATE_STOPPED)
+		return 0;
 
-	inst->reconfig = false;
-	inst->sequence_cap = 0;
-	inst->sequence_out = 0;
+reconfigure:
+	ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT);
+	if (ret)
+		return ret;
+
+	ret = vdec_output_conf(inst);
+	if (ret)
+		return ret;
+
+	ret = venus_helper_set_num_bufs(inst, inst->num_input_bufs,
+					VB2_MAX_FRAME, VB2_MAX_FRAME);
+	if (ret)
+		return ret;
+
+	ret = venus_helper_intbufs_realloc(inst);
+	if (ret)
+		goto err;
+
+	ret = venus_helper_alloc_dpb_bufs(inst);
+	if (ret)
+		goto err;
+
+	ret = venus_helper_queue_dpb_bufs(inst);
+	if (ret)
+		goto free_dpb_bufs;
 
-	ret = vdec_init_session(inst);
+	ret = venus_helper_process_initial_cap_bufs(inst);
 	if (ret)
-		goto bufs_done;
+		goto free_dpb_bufs;
+
+	venus_helper_load_scale_clocks(inst->core);
+
+	ret = hfi_session_continue(inst);
+	if (ret)
+		goto free_dpb_bufs;
+
+	inst->codec_state = VENUS_DEC_STATE_DECODING;
+
+	inst->streamon_cap = 1;
+	inst->sequence_cap = 0;
+	inst->reconfig = false;
+
+	return 0;
+
+free_dpb_bufs:
+	venus_helper_free_dpb_bufs(inst);
+err:
+	return ret;
+}
+
+static int vdec_start_output(struct venus_inst *inst)
+{
+	int ret;
+
+	if (inst->codec_state == VENUS_DEC_STATE_SEEK) {
+		ret = venus_helper_process_initial_out_bufs(inst);
+		inst->codec_state = VENUS_DEC_STATE_DECODING;
+		goto done;
+	}
+
+	if (inst->codec_state == VENUS_DEC_STATE_INIT ||
+	    inst->codec_state == VENUS_DEC_STATE_CAPTURE_SETUP) {
+		ret = venus_helper_process_initial_out_bufs(inst);
+		goto done;
+	}
+
+	if (inst->codec_state != VENUS_DEC_STATE_DEINIT)
+		return -EINVAL;
+
+	venus_helper_init_instance(inst);
+	inst->sequence_out = 0;
+	inst->reconfig = false;
 
 	ret = vdec_set_properties(inst);
 	if (ret)
-		goto deinit_sess;
+		return ret;
 
 	ret = vdec_output_conf(inst);
 	if (ret)
-		goto deinit_sess;
+		return ret;
 
 	ret = vdec_verify_conf(inst);
 	if (ret)
-		goto deinit_sess;
+		return ret;
 
 	ret = venus_helper_set_num_bufs(inst, inst->num_input_bufs,
 					VB2_MAX_FRAME, VB2_MAX_FRAME);
 	if (ret)
-		goto deinit_sess;
+		return ret;
 
-	ret = venus_helper_alloc_dpb_bufs(inst);
+	ret = venus_helper_vb2_start_streaming(inst);
+	if (ret)
+		return ret;
+
+	ret = venus_helper_process_initial_out_bufs(inst);
 	if (ret)
-		goto deinit_sess;
+		return ret;
+
+	inst->codec_state = VENUS_DEC_STATE_INIT;
+
+done:
+	inst->streamon_out = 1;
+	return ret;
+}
+
+static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct venus_inst *inst = vb2_get_drv_priv(q);
+	int ret;
+
+	mutex_lock(&inst->lock);
+
+	if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		ret = vdec_start_capture(inst);
+	else
+		ret = vdec_start_output(inst);
 
-	ret = venus_helper_vb2_start_streaming(inst);
 	if (ret)
-		goto deinit_sess;
+		goto error;
 
 	mutex_unlock(&inst->lock);
-
 	return 0;
 
-deinit_sess:
-	hfi_session_deinit(inst);
-bufs_done:
+error:
 	venus_helper_buffers_done(inst, VB2_BUF_STATE_QUEUED);
+	mutex_unlock(&inst->lock);
+	return ret;
+}
+
+static void vdec_cancel_dst_buffers(struct venus_inst *inst)
+{
+	struct vb2_v4l2_buffer *buf;
+
+	while ((buf = v4l2_m2m_dst_buf_remove(inst->m2m_ctx)))
+		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_ERROR);
+}
+
+static int vdec_stop_capture(struct venus_inst *inst)
+{
+	int ret = 0;
+
+	switch (inst->codec_state) {
+	case VENUS_DEC_STATE_DECODING:
+		ret = hfi_session_flush(inst, HFI_FLUSH_ALL);
+		/* fallthrough */
+	case VENUS_DEC_STATE_DRAIN:
+		vdec_cancel_dst_buffers(inst);
+		inst->codec_state = VENUS_DEC_STATE_STOPPED;
+		break;
+	case VENUS_DEC_STATE_DRC:
+		ret = hfi_session_flush(inst, HFI_FLUSH_OUTPUT);
+		vdec_cancel_dst_buffers(inst);
+		inst->codec_state = VENUS_DEC_STATE_CAPTURE_SETUP;
+		INIT_LIST_HEAD(&inst->registeredbufs);
+		venus_helper_free_dpb_bufs(inst);
+		break;
+	default:
+		return 0;
+	}
+
+	return ret;
+}
+
+static int vdec_stop_output(struct venus_inst *inst)
+{
+	int ret = 0;
+
+	switch (inst->codec_state) {
+	case VENUS_DEC_STATE_DECODING:
+	case VENUS_DEC_STATE_DRAIN:
+	case VENUS_DEC_STATE_STOPPED:
+		ret = hfi_session_flush(inst, HFI_FLUSH_ALL);
+		inst->codec_state = VENUS_DEC_STATE_SEEK;
+		break;
+	case VENUS_DEC_STATE_INIT:
+	case VENUS_DEC_STATE_CAPTURE_SETUP:
+		ret = hfi_session_flush(inst, HFI_FLUSH_INPUT);
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static void vdec_stop_streaming(struct vb2_queue *q)
+{
+	struct venus_inst *inst = vb2_get_drv_priv(q);
+	int ret = -EINVAL;
+
+	mutex_lock(&inst->lock);
+
+	if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		ret = vdec_stop_capture(inst);
+	else
+		ret = vdec_stop_output(inst);
+
+	venus_helper_buffers_done(inst, VB2_BUF_STATE_ERROR);
+
+	if (ret)
+		goto unlock;
+
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		inst->streamon_out = 0;
 	else
 		inst->streamon_cap = 0;
+
+unlock:
+	mutex_unlock(&inst->lock);
+}
+
+static void vdec_session_release(struct venus_inst *inst)
+{
+	struct venus_core *core = inst->core;
+	int ret, abort = 0;
+
+	mutex_lock(&inst->lock);
+
+	inst->codec_state = VENUS_DEC_STATE_DEINIT;
+
+	ret = hfi_session_stop(inst);
+	abort = (ret && ret != -EINVAL) ? 1 : 0;
+	ret = hfi_session_unload_res(inst);
+	abort = (ret && ret != -EINVAL) ? 1 : 0;
+	ret = venus_helper_unregister_bufs(inst);
+	abort = (ret && ret != -EINVAL) ? 1 : 0;
+	ret = venus_helper_intbufs_free(inst);
+	abort = (ret && ret != -EINVAL) ? 1 : 0;
+	ret = hfi_session_deinit(inst);
+	abort = (ret && ret != -EINVAL) ? 1 : 0;
+
+	if (inst->session_error || core->sys_error)
+		abort = 1;
+
+	if (abort)
+		hfi_session_abort(inst);
+
+	venus_helper_free_dpb_bufs(inst);
+	venus_helper_load_scale_clocks(core);
+	INIT_LIST_HEAD(&inst->registeredbufs);
+
 	mutex_unlock(&inst->lock);
-	return ret;
+}
+
+static int vdec_buf_init(struct vb2_buffer *vb)
+{
+	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+
+	inst->buf_count++;
+
+	return venus_helper_vb2_buf_init(vb);
+}
+
+static void vdec_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+
+	inst->buf_count--;
+	if (!inst->buf_count)
+		vdec_session_release(inst);
 }
 
 static const struct vb2_ops vdec_vb2_ops = {
 	.queue_setup = vdec_queue_setup,
-	.buf_init = venus_helper_vb2_buf_init,
+	.buf_init = vdec_buf_init,
+	.buf_cleanup = vdec_buf_cleanup,
 	.buf_prepare = venus_helper_vb2_buf_prepare,
 	.start_streaming = vdec_start_streaming,
-	.stop_streaming = venus_helper_vb2_stop_streaming,
+	.stop_streaming = vdec_stop_streaming,
 	.buf_queue = venus_helper_vb2_buf_queue,
 };
 
@@ -880,9 +1115,9 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 
 	vbuf->flags = flags;
 	vbuf->field = V4L2_FIELD_NONE;
+	vb = &vbuf->vb2_buf;
 
 	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
-		vb = &vbuf->vb2_buf;
 		vb2_set_plane_payload(vb, 0, bytesused);
 		vb->planes[0].data_offset = data_offset;
 		vb->timestamp = timestamp_us * NSEC_PER_USEC;
@@ -892,6 +1127,9 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 			const struct v4l2_event ev = { .type = V4L2_EVENT_EOS };
 
 			v4l2_event_queue_fh(&inst->fh, &ev);
+
+			if (inst->codec_state == VENUS_DEC_STATE_DRAIN)
+				inst->codec_state = VENUS_DEC_STATE_STOPPED;
 		}
 	} else {
 		vbuf->sequence = inst->sequence_out++;
@@ -903,17 +1141,69 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 	if (hfi_flags & HFI_BUFFERFLAG_DATACORRUPT)
 		state = VB2_BUF_STATE_ERROR;
 
+	if (hfi_flags & HFI_BUFFERFLAG_DROP_FRAME) {
+		state = VB2_BUF_STATE_ERROR;
+		vb2_set_plane_payload(vb, 0, 0);
+		vb->timestamp = 0;
+	}
+
 	v4l2_m2m_buf_done(vbuf, state);
 }
 
+static void vdec_event_change(struct venus_inst *inst,
+			      struct hfi_event_data *ev_data, bool sufficient)
+{
+	static const struct v4l2_event ev = {
+		.type = V4L2_EVENT_SOURCE_CHANGE,
+		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION };
+	struct device *dev = inst->core->dev_dec;
+	struct v4l2_format format = {};
+
+	mutex_lock(&inst->lock);
+
+	format.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	format.fmt.pix_mp.pixelformat = inst->fmt_cap->pixfmt;
+	format.fmt.pix_mp.width = ev_data->width;
+	format.fmt.pix_mp.height = ev_data->height;
+
+	vdec_try_fmt_common(inst, &format);
+
+	inst->width = format.fmt.pix_mp.width;
+	inst->height = format.fmt.pix_mp.height;
+
+	inst->out_width = ev_data->width;
+	inst->out_height = ev_data->height;
+
+	dev_dbg(dev, "event %s sufficient resources (%ux%u)\n",
+		sufficient ? "" : "not", ev_data->width, ev_data->height);
+
+	if (sufficient) {
+		hfi_session_continue(inst);
+	} else {
+		switch (inst->codec_state) {
+		case VENUS_DEC_STATE_INIT:
+			inst->codec_state = VENUS_DEC_STATE_CAPTURE_SETUP;
+			break;
+		case VENUS_DEC_STATE_DECODING:
+			inst->codec_state = VENUS_DEC_STATE_DRC;
+			break;
+		default:
+			break;
+		}
+	}
+
+	inst->reconfig = true;
+	v4l2_event_queue_fh(&inst->fh, &ev);
+	wake_up(&inst->reconf_wait);
+
+	mutex_unlock(&inst->lock);
+}
+
 static void vdec_event_notify(struct venus_inst *inst, u32 event,
 			      struct hfi_event_data *data)
 {
 	struct venus_core *core = inst->core;
 	struct device *dev = core->dev_dec;
-	static const struct v4l2_event ev = {
-		.type = V4L2_EVENT_SOURCE_CHANGE,
-		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION };
 
 	switch (event) {
 	case EVT_SESSION_ERROR:
@@ -923,18 +1213,10 @@ static void vdec_event_notify(struct venus_inst *inst, u32 event,
 	case EVT_SYS_EVENT_CHANGE:
 		switch (data->event_type) {
 		case HFI_EVENT_DATA_SEQUENCE_CHANGED_SUFFICIENT_BUF_RESOURCES:
-			hfi_session_continue(inst);
-			dev_dbg(dev, "event sufficient resources\n");
+			vdec_event_change(inst, data, true);
 			break;
 		case HFI_EVENT_DATA_SEQUENCE_CHANGED_INSUFFICIENT_BUF_RESOURCES:
-			inst->reconfig_height = data->height;
-			inst->reconfig_width = data->width;
-			inst->reconfig = true;
-
-			v4l2_event_queue_fh(&inst->fh, &ev);
-
-			dev_dbg(dev, "event not sufficient resources (%ux%u)\n",
-				data->width, data->height);
+			vdec_event_change(inst, data, false);
 			break;
 		case HFI_EVENT_RELEASE_BUFFER_REFERENCE:
 			venus_helper_release_buf_ref(inst, data->tag);
@@ -955,20 +1237,25 @@ static const struct hfi_inst_ops vdec_hfi_ops = {
 
 static void vdec_inst_init(struct venus_inst *inst)
 {
+	inst->hfi_codec = HFI_VIDEO_CODEC_H264;
 	inst->fmt_out = &vdec_formats[6];
 	inst->fmt_cap = &vdec_formats[0];
-	inst->width = 1280;
-	inst->height = ALIGN(720, 32);
-	inst->out_width = 1280;
-	inst->out_height = 720;
+	inst->width = frame_width_min(inst);
+	inst->height = ALIGN(frame_height_min(inst), 32);
+	inst->out_width = frame_width_min(inst);
+	inst->out_height = frame_height_min(inst);
 	inst->fps = 30;
 	inst->timeperframe.numerator = 1;
 	inst->timeperframe.denominator = 30;
-	inst->hfi_codec = HFI_VIDEO_CODEC_H264;
+	inst->opb_buftype = HFI_BUFFER_OUTPUT;
+}
+
+static void vdec_m2m_device_run(void *priv)
+{
 }
 
 static const struct v4l2_m2m_ops vdec_m2m_ops = {
-	.device_run = venus_helper_m2m_device_run,
+	.device_run = vdec_m2m_device_run,
 	.job_abort = venus_helper_m2m_job_abort,
 };
 
@@ -986,7 +1273,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	src_vq->drv_priv = inst;
 	src_vq->buf_struct_size = sizeof(struct venus_buffer);
 	src_vq->allow_zero_bytesused = 1;
-	src_vq->min_buffers_needed = 1;
+	src_vq->min_buffers_needed = 0;
 	src_vq->dev = inst->core->dev;
 	ret = vb2_queue_init(src_vq);
 	if (ret)
@@ -1000,7 +1287,7 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->drv_priv = inst;
 	dst_vq->buf_struct_size = sizeof(struct venus_buffer);
 	dst_vq->allow_zero_bytesused = 1;
-	dst_vq->min_buffers_needed = 1;
+	dst_vq->min_buffers_needed = 0;
 	dst_vq->dev = inst->core->dev;
 	ret = vb2_queue_init(dst_vq);
 	if (ret) {
@@ -1030,7 +1317,9 @@ static int vdec_open(struct file *file)
 	inst->core = core;
 	inst->session_type = VIDC_SESSION_TYPE_DEC;
 	inst->num_output_bufs = 1;
-
+	inst->codec_state = VENUS_DEC_STATE_DEINIT;
+	inst->buf_count = 0;
+	init_waitqueue_head(&inst->reconf_wait);
 	venus_helper_init_instance(inst);
 
 	ret = pm_runtime_get_sync(core->dev_dec);
-- 
2.17.1

