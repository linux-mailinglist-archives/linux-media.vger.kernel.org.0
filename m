Return-Path: <linux-media+bounces-20329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF64E9B0A6E
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 18:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DCCB1F23E04
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 16:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5131DD0F7;
	Fri, 25 Oct 2024 16:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Mxs6pVxQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBBE1FB8BC
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 16:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729875432; cv=none; b=H6cm3I1C8hGNS5mdfEUQ5m4C5S9Nzv4RbUaWvqA28K+Ksm2NR7wjedoebaEDTW100AWXaDcZnWjBXlLqze6y8Ug5Fgj0I4Uylp/5qCNWWfJ6BjLBFl92dXb2gVY249Un+j/Iqr4idrnbtX/1+EqpFZ3kJcF1k9MYEjpfOIzTf6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729875432; c=relaxed/simple;
	bh=J/203IJWqybElMqVqw6BbzRbXrAvsQIbHr2j66uKx5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u7CUbZvLNVUuVFvyGx04/om1aMCU2BaMn1Wbp+q2ulKNSmqHw67YTXI46stIG8w0UDzaCw3l7dYcTivpTHX7Zof2ztzRFFBMp818i0QbMvhPA5ys8XvjyulHeam+b1gf+re7z9/nKNAausUd0dhJv74HAmTFI/bmzwxWcvuE9xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Mxs6pVxQ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7203c431f93so1771045b3a.1
        for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 09:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729875430; x=1730480230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ERiY9G8dmIZsrZBWXNP+uvBiLRuBPY/kGmlm2qUoyA=;
        b=Mxs6pVxQuojTPj7jQ8yc9cvyqGcXOf5ARpj3kwNzDNiswFluueOlONBFnZ00IvL+4y
         XftmVQWU0N9dR+Gtkl3P8BRt3UXJXQYTnaTvyLyp1dOCe59gW4z0dXMNfIh4WMYALupn
         DqZEwqS2pkonmrEmpufbeEcHSRVXorq90h3Ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729875430; x=1730480230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ERiY9G8dmIZsrZBWXNP+uvBiLRuBPY/kGmlm2qUoyA=;
        b=LPVIA4H87+ejypsnh1/ey2Ppk8Bwt5mjWLbCYDpBpTjsuAS18tvlBWhI/7c+lTEtC5
         YdoHpUoM4TFf6tefMxwVQJZ0w70Jt3Rq4+MQtOQH+27sIRECUtH5rTp0HXU4XazntzFw
         PfOarE5JohVJ3O9dpB1AjtDzjMECLRGUWO7R+MPB6ceQM3hMS1Yd4K80EKvNu5/SD/2L
         AKrhto/ljCOdepkDvqZb7p0Mm5zmFPQAqYmtefMf3abJNpbKhgCO95PXT/fc6rXCV6Q0
         blWZAjHvjHMESslSPqIIcq6OXnHC1fMaAqnzTmf2Uj9iDsUbdJHdh/f1oAwz8jERHBwi
         1UPA==
X-Forwarded-Encrypted: i=1; AJvYcCWJxe0xIJsc5CErnC6QYTE7JlAAExJ77I83HG15aQpXy1oAVNLJyRdBKIVT/rvDegq1wNk2TaR1FZypXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzBWe4GihmPwfCJToRjy+LWKVRW94Yww3GC4GfivPMEEsgJ8Cx
	ajwekYA0f6W/gqcWnHwYZv2c/iHUyoX0I2xTu+2xnCvqKU+tQS5bpBOc25Ay1Q==
X-Google-Smtp-Source: AGHT+IHT4VDxjmjOpU+jhqbokf98K9LDw93NZaNyC0fxX/vEGdUIqLKzWfI+XT5sCvubncdLNVEPhQ==
X-Received: by 2002:a05:6a00:18a3:b0:71e:6fcb:7688 with SMTP id d2e1a72fcca58-7206309804bmr221030b3a.25.1729875429847;
        Fri, 25 Oct 2024 09:57:09 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:bd37:bccf:f3e:a9ef])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205791db5fsm1318970b3a.11.2024.10.25.09.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:57:09 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv6 3/3] media: venus: factor out inst destruction routine
Date: Sat, 26 Oct 2024 01:56:43 +0900
Message-ID: <20241025165656.778282-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025165656.778282-1-senozhatsky@chromium.org>
References: <20241025165656.778282-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Factor out common instance destruction code into
a common function.

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c      | 25 +++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h      |  2 ++
 drivers/media/platform/qcom/venus/vdec.c      | 24 ++----------------
 drivers/media/platform/qcom/venus/vdec.h      |  1 -
 .../media/platform/qcom/venus/vdec_ctrls.c    |  5 ----
 drivers/media/platform/qcom/venus/venc.c      | 24 ++----------------
 drivers/media/platform/qcom/venus/venc.h      |  1 -
 .../media/platform/qcom/venus/venc_ctrls.c    |  5 ----
 8 files changed, 31 insertions(+), 56 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 423deb5e94dc..ee6c2051a0c4 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -19,6 +19,7 @@
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <media/videobuf2-v4l2.h>
+#include <media/v4l2-ctrls.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/v4l2-ioctl.h>
 
@@ -502,6 +503,30 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
 	return ret;
 }
 
+void venus_close_common(struct venus_inst *inst)
+{
+	/*
+	 * First, remove the inst from the ->instances list, so that
+	 * to_instance() will return NULL.
+	 */
+	hfi_session_destroy(inst);
+	/*
+	 * Second, make sure we don't have IRQ/IRQ-thread currently running
+	 * or pending execution, which would race with the inst destruction.
+	 */
+	synchronize_irq(inst->core->irq);
+
+	v4l2_m2m_ctx_release(inst->m2m_ctx);
+	v4l2_m2m_release(inst->m2m_dev);
+	v4l2_fh_del(&inst->fh);
+	v4l2_fh_exit(&inst->fh);
+	v4l2_ctrl_handler_free(&inst->ctrl_handler);
+
+	mutex_destroy(&inst->lock);
+	mutex_destroy(&inst->ctx_q_lock);
+}
+EXPORT_SYMBOL_GPL(venus_close_common);
+
 static __maybe_unused int venus_runtime_resume(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 435325432922..7bb36a270e15 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -560,4 +560,6 @@ is_fw_rev_or_older(struct venus_core *core, u32 vmajor, u32 vminor, u32 vrev)
 		(core)->venus_ver.minor == vminor &&
 		(core)->venus_ver.rev <= vrev);
 }
+
+void venus_close_common(struct venus_inst *inst);
 #endif
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index b3192a36f388..cba95dc492f1 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1737,7 +1737,7 @@ static int vdec_open(struct file *file)
 err_session_destroy:
 	hfi_session_destroy(inst);
 err_ctrl_deinit:
-	vdec_ctrl_deinit(inst);
+	v4l2_ctrl_handler_free(&inst->ctrl_handler);
 err_free:
 	kfree(inst);
 	return ret;
@@ -1748,29 +1748,9 @@ static int vdec_close(struct file *file)
 	struct venus_inst *inst = to_inst(file);
 
 	vdec_pm_get(inst);
-
 	cancel_work_sync(&inst->delayed_process_work);
-	/*
-	 * First, remove the inst from the ->instances list, so that
-	 * to_instance() will return NULL.
-	 */
-	hfi_session_destroy(inst);
-	/*
-	 * Second, make sure we don't have IRQ/IRQ-thread currently running
-	 * or pending execution, which would race with the inst destruction.
-	 */
-	synchronize_irq(inst->core->irq);
-
-	v4l2_m2m_ctx_release(inst->m2m_ctx);
-	v4l2_m2m_release(inst->m2m_dev);
+	venus_close_common(inst);
 	ida_destroy(&inst->dpb_ids);
-	v4l2_fh_del(&inst->fh);
-	v4l2_fh_exit(&inst->fh);
-	vdec_ctrl_deinit(inst);
-
-	mutex_destroy(&inst->lock);
-	mutex_destroy(&inst->ctx_q_lock);
-
 	vdec_pm_put(inst, false);
 
 	kfree(inst);
diff --git a/drivers/media/platform/qcom/venus/vdec.h b/drivers/media/platform/qcom/venus/vdec.h
index 6b262d0bf561..0cf981108ff0 100644
--- a/drivers/media/platform/qcom/venus/vdec.h
+++ b/drivers/media/platform/qcom/venus/vdec.h
@@ -9,6 +9,5 @@
 struct venus_inst;
 
 int vdec_ctrl_init(struct venus_inst *inst);
-void vdec_ctrl_deinit(struct venus_inst *inst);
 
 #endif
diff --git a/drivers/media/platform/qcom/venus/vdec_ctrls.c b/drivers/media/platform/qcom/venus/vdec_ctrls.c
index 7e0f29bf7fae..36ed955b0419 100644
--- a/drivers/media/platform/qcom/venus/vdec_ctrls.c
+++ b/drivers/media/platform/qcom/venus/vdec_ctrls.c
@@ -187,8 +187,3 @@ int vdec_ctrl_init(struct venus_inst *inst)
 
 	return 0;
 }
-
-void vdec_ctrl_deinit(struct venus_inst *inst)
-{
-	v4l2_ctrl_handler_free(&inst->ctrl_handler);
-}
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 36981ce448f5..b9940da73772 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1505,7 +1505,7 @@ static int venc_open(struct file *file)
 err_session_destroy:
 	hfi_session_destroy(inst);
 err_ctrl_deinit:
-	venc_ctrl_deinit(inst);
+	v4l2_ctrl_handler_free(&inst->ctrl_handler);
 err_free:
 	kfree(inst);
 	return ret;
@@ -1516,28 +1516,8 @@ static int venc_close(struct file *file)
 	struct venus_inst *inst = to_inst(file);
 
 	venc_pm_get(inst);
-
-	/*
-	 * First, remove the inst from the ->instances list, so that
-	 * to_instance() will return NULL.
-	 */
-	hfi_session_destroy(inst);
-	/*
-	 * Second, make sure we don't have IRQ/IRQ-thread currently running
-	 * or pending execution, which would race with the inst destruction.
-	 */
-	synchronize_irq(inst->core->irq);
-
-	v4l2_m2m_ctx_release(inst->m2m_ctx);
-	v4l2_m2m_release(inst->m2m_dev);
-	v4l2_fh_del(&inst->fh);
-	v4l2_fh_exit(&inst->fh);
-	venc_ctrl_deinit(inst);
-
+	venus_close_common(inst);
 	inst->enc_state = VENUS_ENC_STATE_DEINIT;
-	mutex_destroy(&inst->lock);
-	mutex_destroy(&inst->ctx_q_lock);
-
 	venc_pm_put(inst, false);
 
 	kfree(inst);
diff --git a/drivers/media/platform/qcom/venus/venc.h b/drivers/media/platform/qcom/venus/venc.h
index 4ea37fdcd9b8..719d0f73b14b 100644
--- a/drivers/media/platform/qcom/venus/venc.h
+++ b/drivers/media/platform/qcom/venus/venc.h
@@ -9,6 +9,5 @@
 struct venus_inst;
 
 int venc_ctrl_init(struct venus_inst *inst);
-void venc_ctrl_deinit(struct venus_inst *inst);
 
 #endif
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index d9d2a293f3ef..c6d1d3675466 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -635,8 +635,3 @@ int venc_ctrl_init(struct venus_inst *inst)
 	v4l2_ctrl_handler_free(&inst->ctrl_handler);
 	return ret;
 }
-
-void venc_ctrl_deinit(struct venus_inst *inst)
-{
-	v4l2_ctrl_handler_free(&inst->ctrl_handler);
-}
-- 
2.47.0.163.g1226f6d8fa-goog


