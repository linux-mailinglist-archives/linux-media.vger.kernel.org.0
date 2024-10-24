Return-Path: <linux-media+bounces-20179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 015929AE223
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 12:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A814A2842E0
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 10:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00ECE1C07CD;
	Thu, 24 Oct 2024 10:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i3xWoBIO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B0D1B85DF
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 10:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729764545; cv=none; b=GwEh+fDy5hRxGu2tAIvuFCEKWGb3pmVxY1sq3gDN5g7U3zFWPUybpCdAtXt0PvxnSWHm3uXKe3wHx+DKN9PiLGC33ZrCH5d9Qbia7Kzc2etbFfqfxke3+pz5k8bBiHK9dNMx1vRvOmJy54tleh3xR2FT6vqlhjbEEgnfomqS1Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729764545; c=relaxed/simple;
	bh=k1nBt95mDbyhDxbPCLlaIKpMahAyfs6sWuDAOOUJkK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V2fejbOjMtBU3KR/szyOMt+iciPHul4aCxLYaPUwonN6NLNZZZNL8dcbHNSvqvRw6NFFUMuyIEOUEDkF1RFJgWBxUkcD8e8xrQPFNZRsnWKWVkZM6JojwGr+PnBZwCfpDwMmkw+X6m3tPTgEvDTupdLfsR8WhUp9G1gO25gk2ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i3xWoBIO; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-208cf673b8dso5360315ad.3
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 03:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729764542; x=1730369342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gURJbTxvaaJOpeAsWXo2fQU4uT2CG3ZOcVs4p24pfVc=;
        b=i3xWoBIO1r0IIGe+me+s6FBREHfZ7aE7hf+uhcy0rD63pyZ9tovl6qJcwIWneooKNV
         TeQGdAOufkSDxLPgdUNtJCNUlQ4SCakPWI+D20nnAnSI3n0iKPPmfFiaSoKulVeU20ut
         gT8IFTurOwNsFTx4g28IdMXGlrtZues1U/j4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729764542; x=1730369342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gURJbTxvaaJOpeAsWXo2fQU4uT2CG3ZOcVs4p24pfVc=;
        b=JHR9uTUcyFCDCXLzu9UmJobezRboZNi8D28nEvdWe34vRCGCFF6HYS9ub108IzYbSw
         8MyjRxCkVfnP1VyPKOt9ptgdhq/+NUxhZikaqw56ba/s2RcikAk1huQz9aUZKKJ26VoE
         v/LaOP3KSDSDQU3WSvIa/DdBs7AMoYzb4/DY1+SD57YmJlAUROpPvQUSIw62UoP6CKTQ
         AjPeqWgedUx3Ky2DD6dXi/VmEoFF6bT9fujA02CLri1BRtCwRGqrdCbP9Nlea4fn/goQ
         iySum/15mhBVkiVJNwr8g/eapdJNHvyRz3Wb17EhmZr3kUlB6ckHecwZpTysRap0bcHw
         Ks2w==
X-Forwarded-Encrypted: i=1; AJvYcCW9q+uon+ITcGT0TGEOLEDKlnmORP6FBv/AckrhscN8zATy0D56e6WndwtWcFi4vqXXeVT84ES35lABCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY53QfLvH4ENcIBrG0vjFT+S0x7cAsHNMdxHrw0rID3tfVvZII
	1UfgwjOZC9Q8hH86lnNx+74dJ2lGLQd5uqh0ANu0d5laaPL2IFWpAGql/diOZg==
X-Google-Smtp-Source: AGHT+IHtc6rcq2Eb1JDmXfRILd21AGwvkS2Xsm8gNi7W7PV3DUsh33c9JpHQfgKlZmJXi+AV56J0mg==
X-Received: by 2002:a17:903:32c2:b0:20c:a7d8:e428 with SMTP id d9443c01a7336-20fb98902a4mr15880505ad.7.1729764542247;
        Thu, 24 Oct 2024 03:09:02 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:c7f5:2aa6:333b:bb6d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee681fsm69715985ad.55.2024.10.24.03.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 03:09:01 -0700 (PDT)
Date: Thu, 24 Oct 2024 19:08:57 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 2/2] media: venus: sync with threaded IRQ during inst
 destruction
Message-ID: <20241024100857.GN1279924@google.com>
References: <20241024061809.400260-1-senozhatsky@chromium.org>
 <20241024061809.400260-3-senozhatsky@chromium.org>
 <4b96f1f8-e084-4599-abe9-05039bfac569@linaro.org>
 <20241024093916.GM1279924@google.com>
 <b9a42abd-a078-4740-b070-ba5c86855e73@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9a42abd-a078-4740-b070-ba5c86855e73@linaro.org>

On (24/10/24 10:43), Bryan O'Donoghue wrote:
> > > It also occurs to me that most of the close() operation code is shared
> > > between venc_close() and vdec_close() a welcome patch for V3 would be to
> > > functionally decompose the common code to a shared location.
> > 
> > Any preferences where that "shared location" should be?
> 
> Probably core.c is the only place we can jam stuff to be shared

Ack.

So, we need to
- export a couple of symbols
- include vdec header in core

Does something like this look OK to you?

---

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 31ea0982f58e..e7c69a292b3c 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -500,6 +500,31 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
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
+	ida_destroy(&inst->dpb_ids);
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
index 3748a9a74dce..75e9b29d1b01 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -17,6 +17,7 @@
 #include "hfi.h"
 #include "hfi_platform.h"
 #include "hfi_helper.h"
+#include "vdec.h"
 
 #define VDBGL	"VenusLow : "
 #define VDBGM	"VenusMed : "
@@ -569,4 +570,6 @@ is_fw_rev_or_older(struct venus_core *core, u32 vmajor, u32 vminor, u32 vrev)
 		(core)->venus_ver.minor == vminor &&
 		(core)->venus_ver.rev <= vrev);
 }
+
+void venus_close_common(struct venus_inst *inst);
 #endif
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index d802ece8948f..b7d4801222cb 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1746,29 +1746,8 @@ static int vdec_close(struct file *file)
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
-	ida_destroy(&inst->dpb_ids);
-	v4l2_fh_del(&inst->fh);
-	v4l2_fh_exit(&inst->fh);
-	vdec_ctrl_deinit(inst);
-
-	mutex_destroy(&inst->lock);
-	mutex_destroy(&inst->ctx_q_lock);
-
+	venus_close_common(inst);
 	vdec_pm_put(inst, false);
 
 	kfree(inst);
diff --git a/drivers/media/platform/qcom/venus/vdec_ctrls.c b/drivers/media/platform/qcom/venus/vdec_ctrls.c
index 7e0f29bf7fae..2b6b2eee619c 100644
--- a/drivers/media/platform/qcom/venus/vdec_ctrls.c
+++ b/drivers/media/platform/qcom/venus/vdec_ctrls.c
@@ -192,3 +192,4 @@ void vdec_ctrl_deinit(struct venus_inst *inst)
 {
 	v4l2_ctrl_handler_free(&inst->ctrl_handler);
 }
+EXPORT_SYMBOL_GPL(vdec_ctrl_deinit);
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index a72681de1179..55108117d085 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1537,28 +1537,8 @@ static int venc_close(struct file *file)
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

