Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADC1639F546
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 13:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231919AbhFHLoY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 07:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231560AbhFHLoX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 07:44:23 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE934C061574
        for <linux-media@vger.kernel.org>; Tue,  8 Jun 2021 04:42:30 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id dj8so24139909edb.6
        for <linux-media@vger.kernel.org>; Tue, 08 Jun 2021 04:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k2wKJvLK7tR0cSFBus6iUpbSIY6nGRz9/ET7AjDR48U=;
        b=R32UCUXBtI7/c9g37x4Z3cV6QgcGQQxUuH1H/ZQQUISK7W6Q8cGXc+uLp3VFs0tBfL
         rJAf8FWLzhIZ5Q+QEOaUioIp/t+XZcW4dKmhL7+H9F3NajRLv3Bwp9SekN02StkgoLxL
         DCftmQZIf20Ui9052JnyCJFn7czcTyaFUSB/5Qd6fPAXm8diHwSJOadB6VRonUKIjrp9
         z4i5x3hx6YdaXVlA8QZKwr8r/0UAGg48qP42uKB/rbNvZgLZHZ5unJa9GqSk31+jeeoH
         KRn5Llm9DNq5n3kBVu9Xx7Qa0ZEfkwPt81SP9is139aQnZKXNIkMs0guB/jS7AKgoTjE
         ERiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k2wKJvLK7tR0cSFBus6iUpbSIY6nGRz9/ET7AjDR48U=;
        b=Wk+uLejd8vmIz7Qm1yC9YjD2n/Diyk2tSmMgGaOq9pJle1yRuUmbzxkJt9vgSQLzOu
         6eVdJEGdliU2eeT811YmgA3tJF5/CR3nkgHW0JGssprs4zpCwom0L1wYdQNcXNqKh9HW
         8BJznKBGugEwWrFUgQaXYncfvrMrSjmOENSMHNcEtaNiaJCruFuu9wlYW7jb96AuLEvV
         b0XEBttUgQPnaKXqfWowuujPsz9AvYqNLmatOFaLsjYTlGDCwzdj8jmZAIPt+wFprXAs
         OmIrL9K+0MQqgc3AqpVI0GZeZdpKfqu4K6seVIBUOMsSPMdbAeHjczFQOsCGk0t56teJ
         u/Uw==
X-Gm-Message-State: AOAM530oyNkdRWLNIDi5S7hW4r25mXHeYGDcZAOMQbT6wZTecwPi2Q7b
        3S4VFdXYRMd5bxsUgDuWUSZhf6KOOFaqvSYu
X-Google-Smtp-Source: ABdhPJx1fY3mD3MXSBOSPBkM412FkGkhPQHglrkVDdMI2xU70RD2T3wXp8TW0mwyMrPbOrUrGGbZrA==
X-Received: by 2002:aa7:d798:: with SMTP id s24mr20722933edq.243.1623152548946;
        Tue, 08 Jun 2021 04:42:28 -0700 (PDT)
Received: from localhost.localdomain (hst-221-104.medicom.bg. [84.238.221.104])
        by smtp.gmail.com with ESMTPSA id x4sm8754740edq.23.2021.06.08.04.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 04:42:28 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 1/5] venus: venc: Use pmruntime autosuspend
Date:   Tue,  8 Jun 2021 14:41:52 +0300
Message-Id: <20210608114156.87018-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210608114156.87018-1-stanimir.varbanov@linaro.org>
References: <20210608114156.87018-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Migrate encoder to pm-runtime autosuspend.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/venc.c | 103 +++++++++++++++++++++--
 1 file changed, 95 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 8dd49d4f124c..47badd43145d 100644
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
+	ret = pm_runtime_resume_and_get(dev);
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
+		ret = pm_runtime_resume_and_get(dev);
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
 
-	ret = pm_runtime_resume_and_get(core->dev_enc);
-	if (ret < 0)
-		goto err_free;
-
 	ret = venc_ctrl_init(inst);
 	if (ret)
-		goto err_put_sync;
+		goto err_free;
 
 	ret = hfi_session_create(inst, &venc_hfi_ops);
 	if (ret)
@@ -1250,8 +1335,6 @@ static int venc_open(struct file *file)
 	hfi_session_destroy(inst);
 err_ctrl_deinit:
 	venc_ctrl_deinit(inst);
-err_put_sync:
-	pm_runtime_put_sync(core->dev_enc);
 err_free:
 	kfree(inst);
 	return ret;
@@ -1261,6 +1344,8 @@ static int venc_close(struct file *file)
 {
 	struct venus_inst *inst = to_inst(file);
 
+	venc_pm_get(inst);
+
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 	v4l2_m2m_release(inst->m2m_dev);
 	venc_ctrl_deinit(inst);
@@ -1269,7 +1354,7 @@ static int venc_close(struct file *file)
 	v4l2_fh_del(&inst->fh);
 	v4l2_fh_exit(&inst->fh);
 
-	pm_runtime_put_sync(inst->core->dev_enc);
+	venc_pm_put(inst, false);
 
 	kfree(inst);
 	return 0;
@@ -1326,6 +1411,8 @@ static int venc_probe(struct platform_device *pdev)
 	core->dev_enc = dev;
 
 	video_set_drvdata(vdev, core);
+	pm_runtime_set_autosuspend_delay(dev, 2000);
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
 	return 0;
-- 
2.25.1

