Return-Path: <linux-media+bounces-20321-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 834AA9B037A
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 15:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42B5D286486
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 13:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E5F20BB22;
	Fri, 25 Oct 2024 13:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bFHsljTY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8BB1C7B79
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 13:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729861937; cv=none; b=rjzLcpGhz3u7EEWDn0VpgGMlCecncwzTlxkMKNmpp4mxLclce/FqKI19lCp8QPTMPsPZFmH575jkLnvhSTuP0m1im/IkG391ooCBQELFl0yeyK943tc2kWpjpkn05USSQmt8uVmgJo6+9zE+KYMD1TYh/+7EPKWlb2JRs0RteWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729861937; c=relaxed/simple;
	bh=VYeq4f4Zfcb8J5pa//j7ztAifslufH54E2jl+sFOs7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CYE3E+HEe23fZq0vjNWGrs1jV8qrW7TbMha5q5qTX9szh71t/gyE2VOy4x79ZAxvIsd/fZwlkTPrzd89NdPhkEuVCMrnVib21zgyZCFnuGBR4sjFBOdDOFwRBbp8Hm64/ny7NnryPiflvFOteIjzhQZNDNLrRJHB3R2F6r6Ph7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bFHsljTY; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7ea9739647bso1349758a12.0
        for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 06:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729861934; x=1730466734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVQVwxVN+EZDuJtnIkGcK8v6mX6ifpY1HBria00wQbQ=;
        b=bFHsljTYVVGvz4zBdT9STLCQvOjuhQmwnq7eRO1E9vvO5tQRra18y4fppAJAULv0C1
         1G7Pxw224DfIIq6Z+QA9iX7ZqC+3P3nDw9tBkDuS38CbahcoC4uoVFkbSeC4RGTclM+L
         fTIsm5Jbpfa7AysnfWiozWhPOx7QIDlEZCFz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729861934; x=1730466734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVQVwxVN+EZDuJtnIkGcK8v6mX6ifpY1HBria00wQbQ=;
        b=joDxkDyUnDrCJbkIu4RWU/xSStx1cozQIFXD5T1dyc9QLzaJuCsW10c+8LY/rbKJ+C
         sVudhkaI1Vync9WHBb0JHqWgjppievnKKg0Ilq0DC6owS0AWWugncyByqrecnWqxa1+5
         c9lTNy/46UighVbsydggVhsJoRjYxREm2iyB3I7LGRiHaRlxAhSL6iqYXe4oBrgPWRCo
         wGZfsNDIqhRaA2z704zoboa/SbafcLVcnaLv0G2z+FZ02TGPmEUE0gCFgp7ct4IyknbN
         hHWDrlJwqPxMoQ7nO6lbnEwEA4SBihXvLGfbpoCI2EQLoQT+tO9psUpIW++Cuu+/8uEZ
         mxUg==
X-Forwarded-Encrypted: i=1; AJvYcCVvg0dCdYfBl17xdJW9z0mqSj2mlG1uPsicDJbFUiBEe4+0SXZkbVZc+9ukPtQ1dP6lWxUzE7e0RPc4og==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMXu5/fzZHEr62FIBJtvx6YzSsthXqat3B+jqSz0BkmWl3KwO2
	/SCniERFf6QlhRquO2+55tdAVmyBKWJaOEY4KqInIWZmrJ+2EbNzw2a3GbpWQtK5xPUIjiub1/g
	=
X-Google-Smtp-Source: AGHT+IHiNexI/pOIVTcN7AQQcw4YyjKxCCDPkWxKz7MtymXLfrf+47z+jBLYRSGUDbFFPAQH9M8+ZQ==
X-Received: by 2002:a17:90a:f288:b0:2c9:a3ca:cc98 with SMTP id 98e67ed59e1d1-2e77f47e9c2mr5877949a91.7.1729861934156;
        Fri, 25 Oct 2024 06:12:14 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:bd37:bccf:f3e:a9ef])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3556517sm1364203a91.8.2024.10.25.06.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:12:13 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv5 3/3] media: venus: factor out inst destruction routine
Date: Fri, 25 Oct 2024 22:11:51 +0900
Message-ID: <20241025131200.747889-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025131200.747889-1-senozhatsky@chromium.org>
References: <20241025131200.747889-1-senozhatsky@chromium.org>
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


