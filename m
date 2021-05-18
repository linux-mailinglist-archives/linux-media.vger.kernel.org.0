Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64CF0387CC2
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 17:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350388AbhERPsH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 11:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350337AbhERPr1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 11:47:27 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0ABBC061347
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 08:45:30 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id u21so15263557ejo.13
        for <linux-media@vger.kernel.org>; Tue, 18 May 2021 08:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8C/6l4d+SEnoWZvzZbTyveJhPhCLYFpI4fdt3SHOYbs=;
        b=DTe/CuZhZG56+uLl6KKrzDwoQgCY26/IKFMDzbQWGQvD5Y952bG/Y+FBSmWAuCKxt4
         GNIYofirAaXsY2UZHs4OXy3Jnwjl290IqHFRA6j3evnX5Zf2PeCaY+gd1a7eiU8jBfDl
         pNI11i8aEq4CgEAwNm7vIPNPSTZsZfIoTBFnu+NEQ0JPKIy7NMnU3UxgrjWWzOSWwnfp
         bCwZOIypTvyB6QWjQPOXaPQchjkpW/EJCvrRHJXkMNa4dPZEMycTYQd5qAwymx80/ZJp
         ct1iAj7uKCFEZn/WM4TFza6KD2pkWG9110K/VXUBU0WVGV2ew3si0PbychMC7sXts1Oc
         YErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8C/6l4d+SEnoWZvzZbTyveJhPhCLYFpI4fdt3SHOYbs=;
        b=pV7VeUTVe6ZFsnnX00682yk4DX6s6G9kyrSgO/IHRsRYbdq0ONQur5ClP2qUa6kik4
         UbNL3U+ZyGNO/KyV5uKz/GPUaHRm7qUGaL6YUSUkqmSqoLNbOydCfhOw8aKp6W0d0iXl
         hb3DCgNmZS8+96NXMNy2RrnmBf7PKWDNg2s4W8aA3pVU3psTxAsbTQDjMmsuP2s4yZJ3
         lvBZ78tBZ1k6Q2TyyzuR3L86wOxaki3ZQ6onio4lEocoeIQikWVV1008BeYU/19PfhNN
         3/8y7maUGBrUzSiKJj8dNDBXwBHh+bpVtkF2HtLMPQTgLNE8Ftr0Qm/hfO0uhjSDqwRc
         pi9w==
X-Gm-Message-State: AOAM530xh2KNVqNovJrPrIUh7U6ceP4GhZ0PmPoGKiWkct8Tr+V84Cbi
        rM5g8IwoDX8TO4uESTndWLvCx75TnfaE7K2x
X-Google-Smtp-Source: ABdhPJwdxUYhpmA0tsAbAA6TGg8omM2MCxbqZw+VBcM91ZLPId93tlIhSYgelM7fgT+ymuTKstyg/A==
X-Received: by 2002:a17:906:3ce9:: with SMTP id d9mr6727934ejh.172.1621352728692;
        Tue, 18 May 2021 08:45:28 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id n17sm13016434eds.72.2021.05.18.08.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 08:45:28 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 5/5] venus: Handle fatal errors during encoding and decoding
Date:   Tue, 18 May 2021 18:45:09 +0300
Message-Id: <20210518154509.602137-6-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518154509.602137-1-stanimir.varbanov@linaro.org>
References: <20210518154509.602137-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to stateful decoder docs a fatal failure of decoding
(and encoding) could be recover it by closing the corresponding
file handle and open new one or reinitialize decoding (and encoding)
by stop streaming on both queues. In order to satisfy this
requirement we add a mechanism ins sys_error_handler and
corresponding decoder and encoder drivers to wait for sys_error_done
waitqueue in reqbuf.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c    |  9 ++++++---
 drivers/media/platform/qcom/venus/core.h    |  3 +++
 drivers/media/platform/qcom/venus/helpers.c |  2 ++
 drivers/media/platform/qcom/venus/vdec.c    | 16 ++++++++++++++++
 drivers/media/platform/qcom/venus/venc.c    | 13 +++++++++++++
 5 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index cc6195f2409c..b1fa9b349efb 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -95,9 +95,8 @@ static void venus_sys_error_handler(struct work_struct *work)
 		failed = true;
 	}
 
-	hfi_core_deinit(core, true);
-
-	mutex_lock(&core->lock);
+	core->ops->core_deinit(core);
+	core->state = CORE_UNINIT;
 
 	for (i = 0; i < max_attempts; i++) {
 		if (!pm_runtime_active(core->dev_dec) && !pm_runtime_active(core->dev_enc))
@@ -105,6 +104,8 @@ static void venus_sys_error_handler(struct work_struct *work)
 		msleep(10);
 	}
 
+	mutex_lock(&core->lock);
+
 	venus_shutdown(core);
 
 	venus_coredump(core);
@@ -162,6 +163,7 @@ static void venus_sys_error_handler(struct work_struct *work)
 
 	mutex_lock(&core->lock);
 	clear_bit(0, &core->sys_error);
+	wake_up_all(&core->sys_err_done);
 	mutex_unlock(&core->lock);
 }
 
@@ -318,6 +320,7 @@ static int venus_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&core->instances);
 	mutex_init(&core->lock);
 	INIT_DELAYED_WORK(&core->work, venus_sys_error_handler);
+	init_waitqueue_head(&core->sys_err_done);
 
 	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, hfi_isr_thread,
 					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 15713209cc48..8e2b4635a396 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -184,6 +184,7 @@ struct venus_core {
 	struct completion done;
 	unsigned int error;
 	unsigned long sys_error;
+	wait_queue_head_t sys_err_done;
 	const struct hfi_core_ops *core_ops;
 	const struct venus_pm_ops *pm_ops;
 	struct mutex pm_lock;
@@ -329,6 +330,7 @@ struct venus_ts_metadata {
  * @registeredbufs:	a list of registered capture bufferes
  * @delayed_process:	a list of delayed buffers
  * @delayed_process_work:	a work_struct for process delayed buffers
+ * @nonblock:		nonblocking flag
  * @ctrl_handler:	v4l control handler
  * @controls:	a union of decoder and encoder control parameters
  * @fh:	 a holder of v4l file handle structure
@@ -392,6 +394,7 @@ struct venus_inst {
 	struct list_head registeredbufs;
 	struct list_head delayed_process;
 	struct work_struct delayed_process_work;
+	bool nonblock;
 
 	struct v4l2_ctrl_handler ctrl_handler;
 	union {
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 6c4b64e995a1..9b8ff76e3c43 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1502,6 +1502,8 @@ void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
 
 	venus_pm_release_core(inst);
 
+	inst->session_error = 0;
+
 	mutex_unlock(&inst->lock);
 }
 EXPORT_SYMBOL_GPL(venus_helper_vb2_stop_streaming);
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 132a2921902a..5e5584fc21e9 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -830,6 +830,7 @@ static int vdec_queue_setup(struct vb2_queue *q,
 			    unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct venus_inst *inst = vb2_get_drv_priv(q);
+	struct venus_core *core = inst->core;
 	unsigned int in_num, out_num;
 	int ret = 0;
 
@@ -855,6 +856,16 @@ static int vdec_queue_setup(struct vb2_queue *q,
 		return 0;
 	}
 
+	if (test_bit(0, &core->sys_error)) {
+		if (inst->nonblock)
+			return -EAGAIN;
+
+		ret = wait_event_interruptible(core->sys_err_done,
+					       !test_bit(0, &core->sys_error));
+		if (ret)
+			return ret;
+	}
+
 	ret = vdec_pm_get(inst);
 	if (ret)
 		return ret;
@@ -1178,6 +1189,8 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 
 	venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
 
+	inst->session_error = 0;
+
 	if (ret)
 		goto unlock;
 
@@ -1448,6 +1461,7 @@ static void vdec_event_notify(struct venus_inst *inst, u32 event,
 	switch (event) {
 	case EVT_SESSION_ERROR:
 		inst->session_error = true;
+		venus_helper_vb2_queue_error(inst);
 		dev_err(dev, "dec: event session error %x\n", inst->error);
 		break;
 	case EVT_SYS_EVENT_CHANGE:
@@ -1568,6 +1582,8 @@ static int vdec_open(struct file *file)
 	inst->bit_depth = VIDC_BITDEPTH_8;
 	inst->pic_struct = HFI_INTERLACE_FRAME_PROGRESSIVE;
 	init_waitqueue_head(&inst->reconf_wait);
+	inst->nonblock = file->f_flags & O_NONBLOCK;
+
 	venus_helper_init_instance(inst);
 
 	ret = vdec_ctrl_init(inst);
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index a7a858f03ba3..001b9bba3909 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -926,6 +926,7 @@ static int venc_queue_setup(struct vb2_queue *q,
 			    unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct venus_inst *inst = vb2_get_drv_priv(q);
+	struct venus_core *core = inst->core;
 	unsigned int num, min = 4;
 	int ret;
 
@@ -949,6 +950,16 @@ static int venc_queue_setup(struct vb2_queue *q,
 		return 0;
 	}
 
+	if (test_bit(0, &core->sys_error)) {
+		if (inst->nonblock)
+			return -EAGAIN;
+
+		ret = wait_event_interruptible(core->sys_err_done,
+					       !test_bit(0, &core->sys_error));
+		if (ret)
+			return ret;
+	}
+
 	ret = venc_pm_get(inst);
 	if (ret)
 		return ret;
@@ -1208,6 +1219,7 @@ static void venc_event_notify(struct venus_inst *inst, u32 event,
 
 	if (event == EVT_SESSION_ERROR) {
 		inst->session_error = true;
+		venus_helper_vb2_queue_error(inst);
 		dev_err(dev, "enc: event session error %x\n", inst->error);
 	}
 }
@@ -1291,6 +1303,7 @@ static int venc_open(struct file *file)
 	inst->session_type = VIDC_SESSION_TYPE_ENC;
 	inst->clk_data.core_id = VIDC_CORE_ID_DEFAULT;
 	inst->core_acquired = false;
+	inst->nonblock = file->f_flags & O_NONBLOCK;
 
 	venus_helper_init_instance(inst);
 
-- 
2.25.1

