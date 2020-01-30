Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90ADF14DE25
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2020 16:44:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727380AbgA3Pot (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jan 2020 10:44:49 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40452 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727223AbgA3Pos (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jan 2020 10:44:48 -0500
Received: by mail-lj1-f196.google.com with SMTP id n18so3843681ljo.7
        for <linux-media@vger.kernel.org>; Thu, 30 Jan 2020 07:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Y5/5fHz3Wl1g0oPmezLLXZf0rfIMovdyqWbT8xKCz5U=;
        b=BKFWBfY4IEyqnYgSRNiezu+BUWinoYQbjNSmIsCy9T4nyOeKQ+1/kgvqiFsg6Ec2Th
         boIHb/LSiIhbBTCEmNJBloWOjjJJzYf2xtZY0A9uB6DnUplMqRiClVQGvaVeEr9sia+Q
         fvrhJA65wLYKUI6OsPH1JBgvpZmo4lXWsPFVSeySW/h6N7+zssEN8pXEYa6YU1868jCW
         b6V6aQSRqQIf5f5D0FKnG5ong+HhAm9zQetGTcHIphjPEhZFU+MxA0PF/TsL/zkqLuez
         bCrX4JhZfOV7x0xVOZbKHgihk8K4KlaeGj3u+jqX+W9I9JctNebwPteiVW+baA6lx6UC
         lR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Y5/5fHz3Wl1g0oPmezLLXZf0rfIMovdyqWbT8xKCz5U=;
        b=q6N7G8idKeFJrucSNgabJZy3Q4wjQkugLWn2hwn5bhZ9Wj1ZBxhVKfm8slwmBCp/jQ
         yYAiopqkBP8/+lpAKOAUzLCwwkU+tBbw0HdWFrZSJyLg35N2bq4FAZNGbDGdKoOcpcdV
         fiiGoKFWrRJgVpiTaSHlWIM7C1PrW0tUW/69YlqS7IqgHlxzTJlVyc1Hl+eHFJG0qNqO
         bX31r6kOc1Vm3IDaPkaqGJRHGhdtmGxhRA+zgLt9Oe4ZSFxHJ61hIE/m/CaqjYBg11o2
         esj+9jaJolScblEJGBrk62nMZDFeUJU/RTjzUdvck1W9M0V/5pzTTSzX/VWZnFknlM8U
         aGdg==
X-Gm-Message-State: APjAAAXCDVAJcoKu7z/cPKArFMZF/Aa9mmAKyNVi2vvL52hK7yuBLVzv
        ZPzSb3Qz9onAb3Geuqc0cX4XKJUk2qE=
X-Google-Smtp-Source: APXvYqyD+XvywuSr2SrKuODVekHXZto6ykhDB6HrnHTN2/X1Oh/xXqcIz58KXVMCB37zMwtK3dRULA==
X-Received: by 2002:a2e:98a:: with SMTP id 132mr3257970ljj.170.1580399085700;
        Thu, 30 Jan 2020 07:44:45 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id h5sm3225267lja.16.2020.01.30.07.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 07:44:44 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] venus: vdec: Use pmruntime autosuspend
Date:   Thu, 30 Jan 2020 17:44:24 +0200
Message-Id: <20200130154424.29483-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement pmruntime autosuspend in video decoder. This will
allow to save power while the userspace is inactive for some
reasonable period of time. Here we power-off venus core clocks
and power domain and don't touch vcodec because it is under
hardware control. The later decision is made to simplify the
code and avoid a mess in the power management code.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c |   3 +
 drivers/media/platform/qcom/venus/core.h |   2 +
 drivers/media/platform/qcom/venus/vdec.c | 134 +++++++++++++++++++----
 3 files changed, 119 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index c7525d951e92..e7995cbd55c1 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -210,6 +210,8 @@ static int venus_probe(struct platform_device *pdev)
 	if (!core->res)
 		return -ENODEV;
 
+	mutex_init(&core->pm_lock);
+
 	core->pm_ops = venus_pm_get(core->res->hfi_version);
 	if (!core->pm_ops)
 		return -ENODEV;
@@ -336,6 +338,7 @@ static int venus_remove(struct platform_device *pdev)
 	icc_put(core->cpucfg_path);
 
 	v4l2_device_unregister(&core->v4l2_dev);
+	mutex_destroy(&core->pm_lock);
 
 	return ret;
 }
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 55bdeda780bc..75b869c095b4 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -128,6 +128,7 @@ struct venus_caps {
  * @error:	an error returned during last HFI sync operations
  * @sys_error:	an error flag that signal system error event
  * @core_ops:	the core operations
+ * @pm_lock:	a lock for PM operations
  * @enc_codecs:	encoders supported by this core
  * @dec_codecs:	decoders supported by this core
  * @max_sessions_supported:	holds the maximum number of sessions
@@ -168,6 +169,7 @@ struct venus_core {
 	bool sys_error;
 	const struct hfi_core_ops *core_ops;
 	const struct venus_pm_ops *pm_ops;
+	struct mutex pm_lock;
 	unsigned long enc_codecs;
 	unsigned long dec_codecs;
 	unsigned int max_sessions_supported;
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 4997ae294312..e7e97779bc68 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -545,6 +545,64 @@ static const struct v4l2_ioctl_ops vdec_ioctl_ops = {
 	.vidioc_decoder_cmd = vdec_decoder_cmd,
 };
 
+static int vdec_pm_get(struct venus_inst *inst)
+{
+	struct venus_core *core = inst->core;
+	struct device *dev = core->dev_dec;
+	int ret;
+
+	mutex_lock(&core->pm_lock);
+	ret = pm_runtime_get_sync(dev);
+	mutex_unlock(&core->pm_lock);
+
+	return ret < 0 ? ret : 0;
+}
+
+static int vdec_pm_put(struct venus_inst *inst, bool autosuspend)
+{
+	struct venus_core *core = inst->core;
+	struct device *dev = core->dev_dec;
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
+static int vdec_pm_get_put(struct venus_inst *inst)
+{
+	struct venus_core *core = inst->core;
+	struct device *dev = core->dev_dec;
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
+static void vdec_pm_touch(struct venus_inst *inst)
+{
+	pm_runtime_mark_last_busy(inst->core->dev_dec);
+}
+
 static int vdec_set_properties(struct venus_inst *inst)
 {
 	struct vdec_controls *ctr = &inst->controls.dec;
@@ -746,11 +804,19 @@ static int vdec_queue_setup(struct vb2_queue *q,
 		return 0;
 	}
 
-	ret = vdec_session_init(inst);
+	ret = vdec_pm_get(inst);
 	if (ret)
 		return ret;
 
+	ret = vdec_session_init(inst);
+	if (ret)
+		goto put_power;
+
 	ret = vdec_num_buffers(inst, &in_num, &out_num);
+	if (ret)
+		goto put_power;
+
+	ret = vdec_pm_put(inst, false);
 	if (ret)
 		return ret;
 
@@ -786,6 +852,10 @@ static int vdec_queue_setup(struct vb2_queue *q,
 	}
 
 	return ret;
+
+put_power:
+	vdec_pm_put(inst, false);
+	return ret;
 }
 
 static int vdec_verify_conf(struct venus_inst *inst)
@@ -947,14 +1017,23 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 
 	mutex_lock(&inst->lock);
 
-	ret = venus_pm_acquire_core(inst);
-	if (ret)
-		return ret;
-
-	if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+	if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		ret = vdec_start_capture(inst);
-	else
+	} else {
+		ret = vdec_pm_get(inst);
+		if (ret)
+			goto error;
+
+		ret = venus_pm_acquire_core(inst);
+		if (ret)
+			goto put_power;
+
+		ret = vdec_pm_put(inst, true);
+		if (ret)
+			goto error;
+
 		ret = vdec_start_output(inst);
+	}
 
 	if (ret)
 		goto error;
@@ -962,6 +1041,8 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	mutex_unlock(&inst->lock);
 	return 0;
 
+put_power:
+	vdec_pm_put(inst, false);
 error:
 	venus_helper_buffers_done(inst, VB2_BUF_STATE_QUEUED);
 	mutex_unlock(&inst->lock);
@@ -1055,8 +1136,9 @@ static void vdec_session_release(struct venus_inst *inst)
 	struct venus_core *core = inst->core;
 	int ret, abort = 0;
 
-	mutex_lock(&inst->lock);
+	vdec_pm_get(inst);
 
+	mutex_lock(&inst->lock);
 	inst->codec_state = VENUS_DEC_STATE_DEINIT;
 
 	ret = hfi_session_stop(inst);
@@ -1078,10 +1160,11 @@ static void vdec_session_release(struct venus_inst *inst)
 
 	venus_helper_free_dpb_bufs(inst);
 	venus_pm_load_scale(inst);
-	venus_pm_release_core(inst);
 	INIT_LIST_HEAD(&inst->registeredbufs);
-
 	mutex_unlock(&inst->lock);
+
+	venus_pm_release_core(inst);
+	vdec_pm_put(inst, false);
 }
 
 static int vdec_buf_init(struct vb2_buffer *vb)
@@ -1102,6 +1185,15 @@ static void vdec_buf_cleanup(struct vb2_buffer *vb)
 		vdec_session_release(inst);
 }
 
+static void vdec_vb2_buf_queue(struct vb2_buffer *vb)
+{
+	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
+
+	vdec_pm_get_put(inst);
+
+	venus_helper_vb2_buf_queue(vb);
+}
+
 static const struct vb2_ops vdec_vb2_ops = {
 	.queue_setup = vdec_queue_setup,
 	.buf_init = vdec_buf_init,
@@ -1109,7 +1201,7 @@ static const struct vb2_ops vdec_vb2_ops = {
 	.buf_prepare = venus_helper_vb2_buf_prepare,
 	.start_streaming = vdec_start_streaming,
 	.stop_streaming = vdec_stop_streaming,
-	.buf_queue = venus_helper_vb2_buf_queue,
+	.buf_queue = vdec_vb2_buf_queue,
 };
 
 static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
@@ -1121,6 +1213,8 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 	struct vb2_buffer *vb;
 	unsigned int type;
 
+	vdec_pm_touch(inst);
+
 	if (buf_type == HFI_BUFFER_INPUT)
 		type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 	else
@@ -1227,6 +1321,8 @@ static void vdec_event_notify(struct venus_inst *inst, u32 event,
 	struct venus_core *core = inst->core;
 	struct device *dev = core->dev_dec;
 
+	vdec_pm_touch(inst);
+
 	switch (event) {
 	case EVT_SESSION_ERROR:
 		inst->session_error = true;
@@ -1347,13 +1443,9 @@ static int vdec_open(struct file *file)
 	init_waitqueue_head(&inst->reconf_wait);
 	venus_helper_init_instance(inst);
 
-	ret = pm_runtime_get_sync(core->dev_dec);
-	if (ret < 0)
-		goto err_free_inst;
-
 	ret = vdec_ctrl_init(inst);
 	if (ret)
-		goto err_put_sync;
+		goto err_free;
 
 	ret = hfi_session_create(inst, &vdec_hfi_ops);
 	if (ret)
@@ -1392,9 +1484,7 @@ static int vdec_open(struct file *file)
 	hfi_session_destroy(inst);
 err_ctrl_deinit:
 	vdec_ctrl_deinit(inst);
-err_put_sync:
-	pm_runtime_put_sync(core->dev_dec);
-err_free_inst:
+err_free:
 	kfree(inst);
 	return ret;
 }
@@ -1403,6 +1493,8 @@ static int vdec_close(struct file *file)
 {
 	struct venus_inst *inst = to_inst(file);
 
+	vdec_pm_get(inst);
+
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 	v4l2_m2m_release(inst->m2m_dev);
 	vdec_ctrl_deinit(inst);
@@ -1411,7 +1503,7 @@ static int vdec_close(struct file *file)
 	v4l2_fh_del(&inst->fh);
 	v4l2_fh_exit(&inst->fh);
 
-	pm_runtime_put_sync(inst->core->dev_dec);
+	vdec_pm_put(inst, false);
 
 	kfree(inst);
 	return 0;
@@ -1468,6 +1560,8 @@ static int vdec_probe(struct platform_device *pdev)
 	core->dev_dec = dev;
 
 	video_set_drvdata(vdev, core);
+	pm_runtime_set_autosuspend_delay(dev, 2000);
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
 	return 0;
-- 
2.17.1

