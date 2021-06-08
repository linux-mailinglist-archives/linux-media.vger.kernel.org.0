Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EEFB39F564
	for <lists+linux-media@lfdr.de>; Tue,  8 Jun 2021 13:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbhFHLpj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 07:45:39 -0400
Received: from mail-ed1-f49.google.com ([209.85.208.49]:41761 "EHLO
        mail-ed1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232208AbhFHLpj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 07:45:39 -0400
Received: by mail-ed1-f49.google.com with SMTP id g18so22130016edq.8
        for <linux-media@vger.kernel.org>; Tue, 08 Jun 2021 04:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=26aHXU1SXvSZ0A6RHa6DT3t7eKawhrtLsouvlIaEHEQ=;
        b=mtLvh6jYIsKx7MN3I7KBDJBag2UsHkcXvWAKZEtmSkTqP8Y9wdlB/gG80/5K/trLuW
         GX/S00MpVl4VCv+h6NOkLppIHqigFzAS0hyYNk/IdLiFg+Yh9fQmehiPah8t2cUfGjsR
         gCiviMeiB26bXFUXkPBfURcYC+Rm4dO7P1769S3DNKAiWyhXNlZdYSK6l1eaJ/uxE88R
         NU8EcLiATM5c1gFBZNUOAOuxbEdzD+g2TacKexrd17UFWrsOf35Pl0P/gZ9vbo6WD5Rp
         jvOzuDwkXgLEFZSiHIKpmDzK+MiYm9Y2xdI6zXfodGm3LkHdSayNmrIvCYjOKYQ9y7fv
         OWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=26aHXU1SXvSZ0A6RHa6DT3t7eKawhrtLsouvlIaEHEQ=;
        b=qbXwq0lRDT5AmUcs0UDayA1DXDWchYGcaa7vNUgTxjFmXZiHQGIqG/ZMMX12gsk4mY
         vTqFBq1yLoDWgnOnJ54AARxs6kg15HMRziPXBsbrrlSQGEj4d5r1LdfeSyMJ7TA4l+4C
         XNJRmwo7t7OEyn0hhXM9xF2/OQkYiY9xlF/Ogd9DqM87g/5fDlfLmONGmXrFFhNa3AE1
         Kr4bGps4jzNqStO9bU79yXhhLYGJdcGwicFBEr8J9Bo//vjHuY+uSHiujxS5wt9eysPq
         MgQgxDlo+2JVk4KKwGMThXvGimtBFFC4My454o6GyLW77j6j8YR7yj21WOiWyLJifmBT
         hNPg==
X-Gm-Message-State: AOAM531QngwQT8H17Uz/8UfB8o9PZbcdEmmYRBKJ+PRAyaHuXSar/mRc
        KO2kqs7Af7+KFTZS5yxUPOXN+dL+3BrMzHCe
X-Google-Smtp-Source: ABdhPJyqD94ChqseTxPk/jjLnW5VWOvfKFqeClavDa5+Inp/+Zu2pxdo/bBUECF/ez5e5WDNv610Vg==
X-Received: by 2002:a05:6402:170e:: with SMTP id y14mr25601743edu.367.1623152551937;
        Tue, 08 Jun 2021 04:42:31 -0700 (PDT)
Received: from localhost.localdomain (hst-221-104.medicom.bg. [84.238.221.104])
        by smtp.gmail.com with ESMTPSA id x4sm8754740edq.23.2021.06.08.04.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 04:42:31 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 5/5] venus: Handle fatal errors during encoding and decoding
Date:   Tue,  8 Jun 2021 14:41:56 +0300
Message-Id: <20210608114156.87018-6-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210608114156.87018-1-stanimir.varbanov@linaro.org>
References: <20210608114156.87018-1-stanimir.varbanov@linaro.org>
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
index a625a8477f75..0f65a3beecbb 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -183,6 +183,7 @@ struct venus_core {
 	struct completion done;
 	unsigned int error;
 	unsigned long sys_error;
+	wait_queue_head_t sys_err_done;
 	const struct hfi_core_ops *core_ops;
 	const struct venus_pm_ops *pm_ops;
 	struct mutex pm_lock;
@@ -333,6 +334,7 @@ enum venus_inst_modes {
  * @registeredbufs:	a list of registered capture bufferes
  * @delayed_process:	a list of delayed buffers
  * @delayed_process_work:	a work_struct for process delayed buffers
+ * @nonblock:		nonblocking flag
  * @ctrl_handler:	v4l control handler
  * @controls:	a union of decoder and encoder control parameters
  * @fh:	 a holder of v4l file handle structure
@@ -396,6 +398,7 @@ struct venus_inst {
 	struct list_head registeredbufs;
 	struct list_head delayed_process;
 	struct work_struct delayed_process_work;
+	bool nonblock;
 
 	struct v4l2_ctrl_handler ctrl_handler;
 	union {
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index abd41ebf3c1b..46aaa25efe9e 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1501,6 +1501,8 @@ void venus_helper_vb2_stop_streaming(struct vb2_queue *q)
 
 	venus_pm_release_core(inst);
 
+	inst->session_error = 0;
+
 	mutex_unlock(&inst->lock);
 }
 EXPORT_SYMBOL_GPL(venus_helper_vb2_stop_streaming);
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 68736359fc2c..5c416c8b9365 100644
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
index 47badd43145d..33a5b4a94cb4 100644
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

