Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E35C12DF4AB
	for <lists+linux-media@lfdr.de>; Sun, 20 Dec 2020 10:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbgLTJeV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Dec 2020 04:34:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727391AbgLTJeP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Dec 2020 04:34:15 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E05C0611CE
        for <linux-media@vger.kernel.org>; Sun, 20 Dec 2020 01:32:55 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id p22so6714969edu.11
        for <linux-media@vger.kernel.org>; Sun, 20 Dec 2020 01:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xJWHNxMCkDCEyrMRNKllf8ulu4dBqb0sn+GPkcIS48k=;
        b=F4B8GnMtgYPmuWkyGKdO+mCwavMP7yX8XX8leC8vRBx6ryHCxdwHnB5xhAa8IGmsrw
         1wKmH2uyBlf86AIAwJANVDnEe/4XF9IH6vcJ97OjaSVc8uvR/DujyaytMaUYiupB0K16
         MqDdLk+qZmpj81I7IWzUz6AWPEgNvfWeyfl/+ZkSzG2WMMLVbvO0KXlA2Aueh+CVpV0m
         unsIJUixZU7n75wbXhtGnwhl33pcyYNa2m3lu3fbdBwrRZybM5J/lxUGDGDHSJx21KQJ
         NoD4q4Nj5YhHpGh40Hlc3OmSIgG6qJNkfeZAXUgJp+Fvl+L39n+y8LMDw3ws/Q8derws
         8MMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xJWHNxMCkDCEyrMRNKllf8ulu4dBqb0sn+GPkcIS48k=;
        b=ROS1/7QTYQxqVwQciB1++fRVm9LGXtI5+2sdoNFpcmjmI16TFyJH7dgNEAYXnzgpph
         yeA4nH0/5lZtErfeNKe2b1iA5dRKW66htcY4oV+n6jGFFzzUQHVO7FfNJAEbuv2I6oBz
         XhRujU1x7YHrmADVF3Ghy/1Psfz0Zq2+5cQMrXrj0n0Vv76edDdyQChk8hLsvDaUkKUl
         oUiB4E5zdJHlR7dUZTME0unvoi+sW/6h8kG4WlUrB7AJCENcPTUfYsQrAd5n6icooHkd
         tsqNc6g1Zv0EnuvZHbgEV+bRWHuMVWB7DG8Myr/jMZUlO31oOb9SE7Mxx7s7ZXNX2Exn
         L9ig==
X-Gm-Message-State: AOAM533PjOX49FZVRdtYDFfQZno+fjmez4wwUZchMPYwxCYf2lP3kN25
        k4ZQTOp32KxtyzljPZrc9Jx2WmBnDEOF9TkJ
X-Google-Smtp-Source: ABdhPJxr2vhEN0iJvtSS0+v3ybxAE/PDGojn5P72QUuDhfNqlV0hZEz8m4srPO/70HzDfhu36ulLsQ==
X-Received: by 2002:a05:6402:491:: with SMTP id k17mr6139719edv.342.1608456774044;
        Sun, 20 Dec 2020 01:32:54 -0800 (PST)
Received: from localhost.localdomain (hst-221-118.medicom.bg. [84.238.221.118])
        by smtp.gmail.com with ESMTPSA id z12sm7769814ejr.17.2020.12.20.01.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 01:32:53 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     vgarodia@codeaurora.org, acourbot@chromium.org,
        Fritz Koenig <frkoenig@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 3/5] venus: helpers: Lock outside of buffer queue helper
Date:   Sun, 20 Dec 2020 11:31:28 +0200
Message-Id: <20201220093130.10177-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201220093130.10177-1-stanimir.varbanov@linaro.org>
References: <20201220093130.10177-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After adding more logic in vdec buf_queue vb2 op it is not
practical to have two lock/unlock for one decoder buf_queue.
So move the instance lock in encoder and decoder vb2 buf_queue
operations.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 11 +++--------
 drivers/media/platform/qcom/venus/vdec.c    |  3 +--
 drivers/media/platform/qcom/venus/venc.c    | 11 ++++++++++-
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 5ca3920237c5..2b6925b6c274 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1343,34 +1343,29 @@ void venus_helper_vb2_buf_queue(struct vb2_buffer *vb)
 	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
 	int ret;
 
-	mutex_lock(&inst->lock);
-
 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
 
 	/* Skip processing queued capture buffers after LAST flag */
 	if (inst->session_type == VIDC_SESSION_TYPE_DEC &&
 	    V4L2_TYPE_IS_CAPTURE(vb->vb2_queue->type) &&
 	    inst->codec_state == VENUS_DEC_STATE_DRC)
-		goto unlock;
+		return;
 
 	cache_payload(inst, vb);
 
 	if (inst->session_type == VIDC_SESSION_TYPE_ENC &&
 	    !(inst->streamon_out && inst->streamon_cap))
-		goto unlock;
+		return;
 
 	if (vb2_start_streaming_called(vb->vb2_queue)) {
 		ret = is_buf_refed(inst, vbuf);
 		if (ret)
-			goto unlock;
+			return;
 
 		ret = session_process_buf(inst, vbuf);
 		if (ret)
 			return_buf_error(inst, vbuf);
 	}
-
-unlock:
-	mutex_unlock(&inst->lock);
 }
 EXPORT_SYMBOL_GPL(venus_helper_vb2_buf_queue);
 
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 4ce23c2fc6eb..9f2c7b3e7d4c 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1241,9 +1241,8 @@ static void vdec_vb2_buf_queue(struct vb2_buffer *vb)
 		return;
 	}
 
-	mutex_unlock(&inst->lock);
-
 	venus_helper_vb2_buf_queue(vb);
+	mutex_unlock(&inst->lock);
 }
 
 static const struct vb2_ops vdec_vb2_ops = {
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 1c61602c5de1..4ecf78e30b59 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -929,13 +929,22 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
 	return ret;
 }
 
+static void venc_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+
+	mutex_lock(&inst->lock);
+	venus_helper_vb2_buf_queue(vb);
+	mutex_unlock(&inst->lock);
+}
+
 static const struct vb2_ops venc_vb2_ops = {
 	.queue_setup = venc_queue_setup,
 	.buf_init = venus_helper_vb2_buf_init,
 	.buf_prepare = venus_helper_vb2_buf_prepare,
 	.start_streaming = venc_start_streaming,
 	.stop_streaming = venus_helper_vb2_stop_streaming,
-	.buf_queue = venus_helper_vb2_buf_queue,
+	.buf_queue = venc_vb2_buf_queue,
 };
 
 static void venc_buf_done(struct venus_inst *inst, unsigned int buf_type,
-- 
2.17.1

