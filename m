Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB66B387CB8
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 17:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350354AbhERPri (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 11:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350314AbhERPqs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 11:46:48 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43BE6C0613ED
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 08:45:26 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id b25so15337642eju.5
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 08:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1/H81rU02gspRWJgBsv9W0dFt8/8Hr7Pms8U3EgDA+w=;
        b=h4OWn/Ns0ZlE7bfHiYjnBQ/qhCvVVo1H5J/FwA+uo2OgCZFV/gsV5Qbct+RI3pnmWT
         pxXLhFqMd3XnDevqVqwCriVafixt6W/5xVtnxghUorX7c4uxboXhRl37TyT5qESEmoEu
         z5y1XeltxPk1LAQs6v/lmi0kB5ixuSLdEG9xKswYxvzxgJBxcnv68r/vLSIhX7ssWFJR
         xrLVNeHvJd0JoFq+MM1yYtx6gcceAhueq2oSVTtupgXL4CvHoSmgLg3FJRu3CTeoK9Iv
         C2Bxjm6sK6LB//nXIEApzHsVr0QWqW1oysk3gYdzEPenfpmse5oEqrcv1cuNmd3KDwTX
         zkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1/H81rU02gspRWJgBsv9W0dFt8/8Hr7Pms8U3EgDA+w=;
        b=faBAR9/B/YCE2CcwK7UYPRliwRgdlVPVJdKbjqFDd05mANg3t7kNfmfQ7V7qgfXRxZ
         I9dS3jjaJEAtwid4iu7hrYPZId0Uev/ZvICjJOCGWGOr6CD9me4z+YD0+B/woQZL/IMZ
         8yo+vawByZfR3ZAE6OCC7B3F6iuQRSGl5Rs20JbM2k/7btxZOqhz2eUQcxk5KfnmYVlM
         lHjwG87QBeUtSObut5p6wPVW066KpBMHHm7qzAMehwGe0WcAx65RKlTb2dLJpYxxUi3C
         90FcbvT/Mm8MIn8mH+ZoQXFrC/Q+QXPGM7Fv8yX7T/TwyPVx+fp0U3PTaZ3+dZ0hLtsB
         6lfA==
X-Gm-Message-State: AOAM5323TNzRdMOxJSb/eDqsjCqcand9QBJrh2cwcwrIlLApfefWTXUG
        V5es7MH2qjo7oBhpvdKTv5JSryJt9eYNU178
X-Google-Smtp-Source: ABdhPJw3gsXZ5sHEfzaV464cIRS6QXk/qHyuCJXsWVj3j4NcX9/vA+QWANhbySFGTFtFFxC38ZRUsA==
X-Received: by 2002:a17:906:c448:: with SMTP id ck8mr6697836ejb.497.1621352724422;
        Tue, 18 May 2021 08:45:24 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id n17sm13016434eds.72.2021.05.18.08.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 08:45:24 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 1/5] venus: venc: Use pmruntime autosuspend
Date:   Tue, 18 May 2021 18:45:05 +0300
Message-Id: <20210518154509.602137-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518154509.602137-1-stanimir.varbanov@linaro.org>
References: <20210518154509.602137-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Migrate encoder to use pm-runtime autosuspend APIs.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/venc.c | 104 +++++++++++++++++++++--
 1 file changed, 96 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 4a7291f934b6..a7a858f03ba3 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -536,6 +536,64 @@ static const struct v4l2_ioctl_ops venc_ioctl_ops = {
 	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
 };
 
+static int venc_pm_get(struct venus_inst *inst)
+{
+	struct venus_core *core = inst->core;
+	struct device *dev = core->dev_enc;
+	int ret;
+
+	mutex_lock(&core->pm_lock);
+	ret = pm_runtime_get_sync(dev);
+	mutex_unlock(&core->pm_lock);
+
+	return ret < 0 ? ret : 0;
+}
+
+static int venc_pm_put(struct venus_inst *inst, bool autosuspend)
+{
+	struct venus_core *core = inst->core;
+	struct device *dev = core->dev_enc;
+	int ret;
+
+	mutex_lock(&core->pm_lock);
+
+	if (autosuspend)
+		ret = pm_runtime_put_autosuspend(dev);
+	else
+		ret = pm_runtime_put_sync(dev);
+
+	mutex_unlock(&core->pm_lock);
+
+	return ret < 0 ? ret : 0;
+}
+
+static int venc_pm_get_put(struct venus_inst *inst)
+{
+	struct venus_core *core = inst->core;
+	struct device *dev = core->dev_enc;
+	int ret = 0;
+
+	mutex_lock(&core->pm_lock);
+
+	if (pm_runtime_suspended(dev)) {
+		ret = pm_runtime_get_sync(dev);
+		if (ret < 0)
+			goto error;
+
+		ret = pm_runtime_put_autosuspend(dev);
+	}
+
+error:
+	mutex_unlock(&core->pm_lock);
+
+	return ret < 0 ? ret : 0;
+}
+
+static void venc_pm_touch(struct venus_inst *inst)
+{
+	pm_runtime_mark_last_busy(inst->core->dev_enc);
+}
+
 static int venc_set_properties(struct venus_inst *inst)
 {
 	struct venc_controls *ctr = &inst->controls.enc;
@@ -891,10 +949,18 @@ static int venc_queue_setup(struct vb2_queue *q,
 		return 0;
 	}
 
+	ret = venc_pm_get(inst);
+	if (ret)
+		return ret;
+
 	mutex_lock(&inst->lock);
 	ret = venc_init_session(inst);
 	mutex_unlock(&inst->lock);
 
+	if (ret)
+		goto put_power;
+
+	ret = venc_pm_put(inst, false);
 	if (ret)
 		return ret;
 
@@ -930,6 +996,9 @@ static int venc_queue_setup(struct vb2_queue *q,
 		break;
 	}
 
+	return ret;
+put_power:
+	venc_pm_put(inst, false);
 	return ret;
 }
 
@@ -946,6 +1015,8 @@ static void venc_release_session(struct venus_inst *inst)
 {
 	int ret;
 
+	venc_pm_get(inst);
+
 	mutex_lock(&inst->lock);
 
 	ret = hfi_session_deinit(inst);
@@ -957,6 +1028,8 @@ static void venc_release_session(struct venus_inst *inst)
 	venus_pm_load_scale(inst);
 	INIT_LIST_HEAD(&inst->registeredbufs);
 	venus_pm_release_core(inst);
+
+	venc_pm_put(inst, false);
 }
 
 static void venc_buf_cleanup(struct vb2_buffer *vb)
@@ -1026,7 +1099,15 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
 	inst->sequence_cap = 0;
 	inst->sequence_out = 0;
 
+	ret = venc_pm_get(inst);
+	if (ret)
+		goto error;
+
 	ret = venus_pm_acquire_core(inst);
+	if (ret)
+		goto put_power;
+
+	ret = venc_pm_put(inst, true);
 	if (ret)
 		goto error;
 
@@ -1051,6 +1132,8 @@ static int venc_start_streaming(struct vb2_queue *q, unsigned int count)
 
 	return 0;
 
+put_power:
+	venc_pm_put(inst, false);
 error:
 	venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_QUEUED);
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -1065,6 +1148,8 @@ static void venc_vb2_buf_queue(struct vb2_buffer *vb)
 {
 	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
 
+	venc_pm_get_put(inst);
+
 	mutex_lock(&inst->lock);
 	venus_helper_vb2_buf_queue(vb);
 	mutex_unlock(&inst->lock);
@@ -1088,6 +1173,8 @@ static void venc_buf_done(struct venus_inst *inst, unsigned int buf_type,
 	struct vb2_buffer *vb;
 	unsigned int type;
 
+	venc_pm_touch(inst);
+
 	if (buf_type == HFI_BUFFER_INPUT)
 		type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 	else
@@ -1117,6 +1204,8 @@ static void venc_event_notify(struct venus_inst *inst, u32 event,
 {
 	struct device *dev = inst->core->dev_enc;
 
+	venc_pm_touch(inst);
+
 	if (event == EVT_SESSION_ERROR) {
 		inst->session_error = true;
 		dev_err(dev, "enc: event session error %x\n", inst->error);
@@ -1205,13 +1294,9 @@ static int venc_open(struct file *file)
 
 	venus_helper_init_instance(inst);
 
-	ret = pm_runtime_get_sync(core->dev_enc);
-	if (ret < 0)
-		goto err_put_sync;
-
 	ret = venc_ctrl_init(inst);
 	if (ret)
-		goto err_put_sync;
+		goto err_free;
 
 	ret = hfi_session_create(inst, &venc_hfi_ops);
 	if (ret)
@@ -1250,8 +1335,7 @@ static int venc_open(struct file *file)
 	hfi_session_destroy(inst);
 err_ctrl_deinit:
 	venc_ctrl_deinit(inst);
-err_put_sync:
-	pm_runtime_put_sync(core->dev_enc);
+err_free:
 	kfree(inst);
 	return ret;
 }
@@ -1260,6 +1344,8 @@ static int venc_close(struct file *file)
 {
 	struct venus_inst *inst = to_inst(file);
 
+	venc_pm_get(inst);
+
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 	v4l2_m2m_release(inst->m2m_dev);
 	venc_ctrl_deinit(inst);
@@ -1268,7 +1354,7 @@ static int venc_close(struct file *file)
 	v4l2_fh_del(&inst->fh);
 	v4l2_fh_exit(&inst->fh);
 
-	pm_runtime_put_sync(inst->core->dev_enc);
+	venc_pm_put(inst, false);
 
 	kfree(inst);
 	return 0;
@@ -1325,6 +1411,8 @@ static int venc_probe(struct platform_device *pdev)
 	core->dev_enc = dev;
 
 	video_set_drvdata(vdev, core);
+	pm_runtime_set_autosuspend_delay(dev, 2000);
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
 	return 0;
-- 
2.25.1

