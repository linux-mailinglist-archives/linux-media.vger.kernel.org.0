Return-Path: <linux-media+bounces-20281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 879019AF873
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 05:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46B6C2831DA
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 03:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D14A18D62D;
	Fri, 25 Oct 2024 03:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NU1GeQtH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8503E18D621
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 03:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729828010; cv=none; b=o09FiEXgJtnzng3GxKpEsey3y+eES54xrt5al1I0DbbG67xfxoNAu41qjSCf8I7ZaTbmKdGp9Ceulz+ArmiQsvfONwx2X3Sqlzf5YvogVBXk2E/Kb9d+hDowl8TtwXhyVh/pyT/LQ4v9GSoofOGHs9VxwZ4F1gSa5l12WxvNhEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729828010; c=relaxed/simple;
	bh=QpTD8hxED2wDX3dgk8VKfkgjXuRNcJok9NK/WVr5sVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VlOqAeN6jfI52rB8LjQyvbx807HMJbrWDyXGo9eiND3LUayn+8yQxdQCo8iB9VjrIq/IbAJK5vFQ0+0/AKyfsNib+5KbBRx0K/Y4+6VTH/SqOLxjI8B5tqG32wrfpKu0zQtK0j0tNVWr+nMKI6OPWEFjbohQyy9vN/x6b2GUfb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NU1GeQtH; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso1007360a12.1
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 20:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729828008; x=1730432808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUNQUULke1pyOwStLzAxkmj+PTm04Zh/YHnvRV+y96k=;
        b=NU1GeQtHZzpmEyZgOSvOSod1WvSvYBx1Yw+Gp463Cw2LU9MyjbLifIaW7GGPD6vrY0
         brfk/4lx/feEbBgoNBQa2FwCpL3GRshSxrbh4K0iLXM0XheArECJV/crGVg69lyNPnFw
         5LurMuorvlRdKiws5DSDWPh2GMvA7XU11bzNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729828008; x=1730432808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUNQUULke1pyOwStLzAxkmj+PTm04Zh/YHnvRV+y96k=;
        b=HtxP+KUM47cm/WnrpnHXuv66if9weBcl7Qz6kRXIkRWO/7vzbIUgoRn2PsTnoSUeeP
         SNTDZX9xsXNAO9Hbt7wAr1WUrtXu12ktIPzoLnd9HyK/p6L2yDf76sMkACTfEdrjdyQ8
         cnp1KwuQlkb5j1fQutHJCoEX8dup+GV0hamSFeCzwvPdCtGV49uw/AtzbXPgi9SQVY3P
         LJCfin4LC0ndhRbNMwD/jEffGgqY15dT0uhHsfBkDnwS4jeZVB1gpIJar6DPK8XGM9i5
         RRkNfAch+YYwElGM2yJBkZU5ORUUv6XpDN2PtVqh1PQQ/7Q6Q4ILKiutzZ1NmuNx4mH0
         4BwA==
X-Gm-Message-State: AOJu0YzcIUFn3EOWZFBzVxEFAQQUi/guDjlqKSryktIsyl1Ki+ZiWdiV
	+JHsZ5VBrBs80uV8GP09NR8JrTggb0blnuFBCJbOpzw4qJIa2va2Ic93hdn8BQ==
X-Google-Smtp-Source: AGHT+IFvKAIEa9lu3NCBQ0y43n0tV2Gk5ztEQyDc1ntixz7J4b7NasqBqla8ruzfugcdmaFPPgyA5w==
X-Received: by 2002:a05:6a20:1589:b0:1d4:e40b:3de6 with SMTP id adf61e73a8af0-1d98898dd86mr6793335637.16.1729828007834;
        Thu, 24 Oct 2024 20:46:47 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:c7f5:2aa6:333b:bb6d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8696bbbsm185197a12.49.2024.10.24.20.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 20:46:47 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 3/3] media: venus: factor out inst destruction routine
Date: Fri, 25 Oct 2024 12:46:14 +0900
Message-ID: <20241025034629.660047-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025034629.660047-1-senozhatsky@chromium.org>
References: <20241025034629.660047-1-senozhatsky@chromium.org>
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
 drivers/media/platform/qcom/venus/vdec.c      | 22 +---------------
 drivers/media/platform/qcom/venus/vdec.h      |  7 +++++-
 .../media/platform/qcom/venus/vdec_ctrls.c    |  6 -----
 drivers/media/platform/qcom/venus/venc.c      | 22 +---------------
 6 files changed, 35 insertions(+), 49 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 423deb5e94dc..4d90fc1c21fe 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -26,6 +26,7 @@
 #include "firmware.h"
 #include "pm_helpers.h"
 #include "hfi_venus_io.h"
+#include "vdec.h"
 
 static void venus_coredump(struct venus_core *core)
 {
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
+	vdec_ctrl_deinit(inst);
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
index b3192a36f388..9a680402c711 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
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
index 6b262d0bf561..2687255b1616 100644
--- a/drivers/media/platform/qcom/venus/vdec.h
+++ b/drivers/media/platform/qcom/venus/vdec.h
@@ -6,9 +6,14 @@
 #ifndef __VENUS_VDEC_H__
 #define __VENUS_VDEC_H__
 
+#include <media/v4l2-ctrls.h>
+
 struct venus_inst;
 
 int vdec_ctrl_init(struct venus_inst *inst);
-void vdec_ctrl_deinit(struct venus_inst *inst);
+static inline void vdec_ctrl_deinit(struct venus_inst *inst)
+{
+	v4l2_ctrl_handler_free(&inst->ctrl_handler);
+}
 
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


