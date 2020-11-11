Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5963B2AF3C4
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 15:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbgKKOiq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 09:38:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727161AbgKKOik (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 09:38:40 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0CEFC061A51
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 06:38:34 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id p22so2466417wmg.3
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 06:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UgCPIURcil9hG01k4XJ9cyq/wEnYTI+F3ySUT22jgJk=;
        b=QmA+UejWXh4jwqurZUgb6ou4f8RqKFKwIHPWa9zSxdMz7JyAo8H29Pa38ECLkKBAWR
         xh9XKvbk0hVLiWDczMfNSjCP6D9Tg+Efbz/g2MMwIIXQncQJE3mHzYtV0NJNXaHNWb36
         UUehausaXwSZtWsh4v0FGM88ixXTbnMKNwzmLfJU/SAvs0kmELjfVp93j4Felgg1nBSR
         qSTfw7yFRpTjvwYj1a+veAz/JlrrIAFw0v/qUDZTqIzQZGNX6+h3RkGDtmgKcKTBUxCt
         PmLACq4VtWWIMAw55T/e+PB2T/kX3YS/0NgcrxOJHpEERSYvcVTa0BpvTadf1I80tds0
         gTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UgCPIURcil9hG01k4XJ9cyq/wEnYTI+F3ySUT22jgJk=;
        b=B1WHMOIc8xRhuNI7E/3B5T+Q+IR9wDPzAHAWkM6sWBMRRThVTvGhy76nPZugaH69a6
         Rl4teYgOQpsxYErRqxDzc5tx9QZ4+9s1zEryzmQildTycCOCqUZYqVLBSkDDmeNQLsYQ
         u08W9Wy96MxtQNgcwHQ5StkVW/tp66el5c+1SwYYvUaNaagEY39IE48AtWxkAnR03q03
         zYrRVTCnge1gYOfVH13xJMX/hJhTm4XI5KI+kYEqHBn13n8ipS93Bx1V5YVFZveoil5M
         ov8caQXQ9Kb1E/DGA/WhKp8lKYbhaOBAp7jy8G3CDJmfCEX4ctppgoh+4UIjj5cSx3kO
         cFKg==
X-Gm-Message-State: AOAM531VIewVKhGH8Ug/PuWAs/vJg2wBSY41PdOS7X6yOd4ldJZ+F5Bu
        KV6sb2u71M7vkV6HvM0owRDBOWokXBH2Col0
X-Google-Smtp-Source: ABdhPJwZ0P1JYmiuBrLn4FSKP2pDFcznHFEgrw+BxDshi/vutcOK5q4S7aw3K9m2bwFXfHuzAOnX+Q==
X-Received: by 2002:a7b:cd11:: with SMTP id f17mr4537221wmj.127.1605105513442;
        Wed, 11 Nov 2020 06:38:33 -0800 (PST)
Received: from localhost.localdomain (hst-221-89.medicom.bg. [84.238.221.89])
        by smtp.gmail.com with ESMTPSA id b8sm2991405wrv.57.2020.11.11.06.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 06:38:32 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 6/8] venus: venc: add handling for VIDIOC_ENCODER_CMD
Date:   Wed, 11 Nov 2020 16:37:53 +0200
Message-Id: <20201111143755.24541-7-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
References: <20201111143755.24541-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

Add handling for below commands in encoder:
1. V4L2_ENC_CMD_STOP
2. V4L2_ENC_CMD_START

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/venc.c | 77 +++++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 99bfabf90bd2..7512e4a16270 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -507,6 +507,59 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
 	return 0;
 }
 
+static int venc_encoder_cmd(struct file *file, void *fh,
+			    struct v4l2_encoder_cmd *ec)
+{
+	struct venus_inst *inst = to_inst(file);
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
+	struct hfi_frame_data fdata = {0};
+	int ret = 0;
+
+	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, ec);
+	if (ret < 0)
+		return ret;
+
+	mutex_lock(&inst->lock);
+
+	if (!vb2_is_streaming(&m2m_ctx->cap_q_ctx.q) ||
+	    !vb2_is_streaming(&m2m_ctx->out_q_ctx.q))
+		goto unlock;
+
+	if (m2m_ctx->is_draining) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	if (ec->cmd == V4L2_ENC_CMD_STOP) {
+		if (v4l2_m2m_has_stopped(m2m_ctx)) {
+			ret = 0;
+			goto unlock;
+		}
+
+		m2m_ctx->is_draining = true;
+
+		fdata.buffer_type = HFI_BUFFER_INPUT;
+		fdata.flags |= HFI_BUFFERFLAG_EOS;
+		fdata.device_addr = 0;
+		fdata.clnt_data = (u32)-1;
+
+		ret = hfi_session_process_buf(inst, &fdata);
+		if (ret)
+			goto unlock;
+	}
+
+	if (ec->cmd == V4L2_ENC_CMD_START && v4l2_m2m_has_stopped(m2m_ctx)) {
+		vb2_clear_last_buffer_dequeued(&m2m_ctx->cap_q_ctx.q);
+		inst->m2m_ctx->has_stopped = false;
+		venus_helper_process_initial_out_bufs(inst);
+		venus_helper_process_initial_cap_bufs(inst);
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
@@ -534,6 +587,8 @@ static const struct v4l2_ioctl_ops venc_ioctl_ops = {
 	.vidioc_enum_frameintervals = venc_enum_frameintervals,
 	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
 	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+	.vidioc_try_encoder_cmd = v4l2_m2m_ioctl_try_encoder_cmd,
+	.vidioc_encoder_cmd = venc_encoder_cmd,
 };
 
 static int venc_set_properties(struct venus_inst *inst)
@@ -946,9 +1001,22 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
 static void venc_vb2_buf_queue(struct vb2_buffer *vb)
 {
 	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
 
 	mutex_lock(&inst->lock);
-	venus_helper_vb2_buf_queue(vb);
+
+	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
+
+	if (!(inst->streamon_out && inst->streamon_cap))
+		goto unlock;
+
+	if (v4l2_m2m_has_stopped(m2m_ctx))
+		goto unlock;
+
+	venus_helper_process_buf(vb);
+
+unlock:
 	mutex_unlock(&inst->lock);
 }
 
@@ -968,6 +1036,7 @@ static void venc_buf_done(struct venus_inst *inst, unsigned int buf_type,
 	struct vb2_v4l2_buffer *vbuf;
 	struct vb2_buffer *vb;
 	unsigned int type;
+	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
 
 	if (buf_type == HFI_BUFFER_INPUT)
 		type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
@@ -986,6 +1055,12 @@ static void venc_buf_done(struct venus_inst *inst, unsigned int buf_type,
 		vb->planes[0].data_offset = data_offset;
 		vb->timestamp = timestamp_us * NSEC_PER_USEC;
 		vbuf->sequence = inst->sequence_cap++;
+
+		if ((!bytesused && m2m_ctx->is_draining) ||
+		    (vbuf->flags & V4L2_BUF_FLAG_LAST)) {
+			vbuf->flags |= V4L2_BUF_FLAG_LAST;
+			v4l2_m2m_mark_stopped(inst->m2m_ctx);
+		}
 	} else {
 		vbuf->sequence = inst->sequence_out++;
 	}
-- 
2.17.1

