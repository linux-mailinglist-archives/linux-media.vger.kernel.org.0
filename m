Return-Path: <linux-media+bounces-20311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB739B007F
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 12:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 931A21C22210
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 10:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D576E2003B4;
	Fri, 25 Oct 2024 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HEoYrk4b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D351FCC63
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 10:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729853484; cv=none; b=S8YCBJdzf68xGFBbCxnBxl1TVzNPS7Hql67riNTuLDVnINK7VGZx6gfMeRP9H/0Mgy3CPj6llICkCMc9Ss2jjFAQafkxHYui5mBKo4dee5Yy70e702+LdQgiC29d3Bf/9OSwtWBaVCtntszOFeQkd4HUuP42i1KkK51Pl5EjkVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729853484; c=relaxed/simple;
	bh=sQhlMnNVBo2Dt74zCEM1DLtHBhyxhuWR4sM2K9Tmq40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LFoxR5FeUk9Ob0YDATLum3CNDe+Mb2I533CrzCl/R/lJug3FqStTFvKlkZ6K+MJiLqt8Pd3UPiI9EGOq5zzozH+/16QH3HiA9J6p7GgmRvRJJPpIWaA1koyDoDYM3/+ypGSAxrhyZ164PJ4jIFnIz8Pb9mIhPYHLZI7Cye56Ws0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HEoYrk4b; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20ca388d242so16172135ad.2
        for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 03:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729853481; x=1730458281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrI1KtFb2KY8S4zo+ZMGLBKOhiQ3sY33MBh5SmuaJos=;
        b=HEoYrk4bvlEsciXOAEbpAGhyfIZVDVmaqwECVi0+J+3wko4785G532JnZ1qgNqJ9qU
         RX/5cgmjA3nFFJs8y63ektXqNt59rBB+R42LopuOeXuZlYXliw88BdIzifUfpFov8iJ5
         2saQ+mIwjVMQTbxBWzrLJFd15r57oTbP5K53U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729853481; x=1730458281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrI1KtFb2KY8S4zo+ZMGLBKOhiQ3sY33MBh5SmuaJos=;
        b=AgUUoNKvr3frCmxDsBdjpSvfHSFpZak8S7cWwd7PbhE9aHCRDD7DHahpg++stDP/VG
         nrEucP2+/3rHh83Ghgv5kAdYUEaXOi5QzmdaVKROAORqK09DIl1vE1bEzMn62v0/lTxZ
         iH6nvOvvLotqrnjoa/wnbyNS+flse6I1TvzCTJlaRpromnDXbGPHDotFYY9CgLxFDJLF
         YW0o0gVyB3MRfO2s1SxFHiuAmU1aPdSudQjPh7fpYGKbUqdox+WEzKZy2EFAzaXBIKBh
         XD50jg5WQoRgXFx6fo7banPRr7eb7YPx02WVsXbvJfh6dLiFaYdniROBF44TrcUu+Lz0
         tAwA==
X-Forwarded-Encrypted: i=1; AJvYcCUlIXXCCfNIW+r7QrowyXcAT4lvZzdDTyrzsaefkcDDyTa0tgE2yuFS/xG4p5zrEmH75wipVWdyGLU+gA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxycfyhTVe3wWGcWrPSMvtnZJV3AoGd8biLjnuaYSDCZtMU+Hqi
	tHh6PBHIE2AurUL+gNtC+SuG/fyHbZX6RAEOcAOLyYSW85QYjPBwP3OjR+Ey8A==
X-Google-Smtp-Source: AGHT+IFi654UFAPCi5OACZrP8F75athHKlBj41eRN6/vmimnNCczZXeYNsBUfDUcj0SZImr4GLIGiA==
X-Received: by 2002:a17:902:d487:b0:20b:7731:e3f8 with SMTP id d9443c01a7336-20fa9e5d07dmr135198385ad.26.1729853481395;
        Fri, 25 Oct 2024 03:51:21 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:bd37:bccf:f3e:a9ef])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc030809sm7326755ad.227.2024.10.25.03.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:51:21 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 3/3] media: venus: factor out inst destruction routine
Date: Fri, 25 Oct 2024 19:50:39 +0900
Message-ID: <20241025105104.723764-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025105104.723764-1-senozhatsky@chromium.org>
References: <20241025105104.723764-1-senozhatsky@chromium.org>
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
 .../media/platform/qcom/venus/vdec_ctrls.c    |  6 -----
 drivers/media/platform/qcom/venus/venc.c      | 22 +---------------
 6 files changed, 30 insertions(+), 50 deletions(-)

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
index 7e0f29bf7fae..fa034a7fdbed 100644
--- a/drivers/media/platform/qcom/venus/vdec_ctrls.c
+++ b/drivers/media/platform/qcom/venus/vdec_ctrls.c
@@ -4,7 +4,6 @@
  * Copyright (C) 2017 Linaro Ltd.
  */
 #include <linux/types.h>
-#include <media/v4l2-ctrls.h>
 
 #include "core.h"
 #include "helpers.h"
@@ -187,8 +186,3 @@ int vdec_ctrl_init(struct venus_inst *inst)
 
 	return 0;
 }
-
-void vdec_ctrl_deinit(struct venus_inst *inst)
-{
-	v4l2_ctrl_handler_free(&inst->ctrl_handler);
-}
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 36981ce448f5..2ae22ba156bb 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
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
-- 
2.47.0.163.g1226f6d8fa-goog


