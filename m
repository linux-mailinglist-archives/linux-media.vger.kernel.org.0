Return-Path: <linux-media+bounces-20328-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 919039B0A6C
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 18:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1EEE282AEA
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 16:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D4020BB50;
	Fri, 25 Oct 2024 16:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hcVIrHic"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B66820BB2A
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 16:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729875430; cv=none; b=hhTCxSxUXQvOW/ZjyRLk1WypFkz/ciY8774PWNNSDaWSQiV9kL6xGIQkpnizlRuM+bQQdMiTCtNsxFdfhx7/caCY8C+QZG3HVuAWCcypaotzwnzXJSfk0HpYPXheO5T/hzZqHw6YgIF3XyIEJwYAbI0T+KA7WFzq5qpV2fWfWR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729875430; c=relaxed/simple;
	bh=bECNK6QwMba2Wqz2Ig6wjaW/pLjHaSwRnO7nvbae2bI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mSLIa3NTkt0MU57xJ8x52ljXNCNrxJhc9lca0o+fyWpXpr9YAVZO6EF7qKwIeimqCeMbxhFKLXqwlGlT4OErjP+hQW/NhfudrIk7c47fmOGuJoL/sOsl9hKsXGXIqtTUveG5mHMouNAx5XaXdxoTL8LWkqX0l6+Xr02D2DkEt0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hcVIrHic; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71e74900866so1668957b3a.1
        for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 09:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729875427; x=1730480227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjW2cH/z7fgu+oD0u4Z3vPb6pLQlEe4zR/etcao0t7A=;
        b=hcVIrHicAVQcVpXcGTtMMcZoeQ0N7A96cDBJvBotABpvSZQZ73QLIYOd/egfkktwQa
         btHq6D2vNs7KztOInt/zbMkbdtXwtqLNS5ZSEaAg4E82p46mCKrY3Pa9ZMfuPKzsskuY
         qH5qbY6b+P9KBYHQ/X2WVQFrrkJPdZhOCPIdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729875427; x=1730480227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjW2cH/z7fgu+oD0u4Z3vPb6pLQlEe4zR/etcao0t7A=;
        b=CWlRlkTQkROnKGhgeGaW463qwOqIDf8e/e+t2h8TEPQwOyWwsm7+1Oc5FkAW9QsKKG
         xIoc1UrR6A1tnp1rKG85iCQJvP1hawjCVJ2wHhvmPm3g2JbUc0OrJc1KgAyP5dzWpsOh
         6VnaOrSruihpMF8t/7XsC0UrPMIm8DinM4LtqgFsIPZ3twRVyC96YUv1QuvtfNfy6/En
         rQo4GvVi5FJepTWA+k2JJnzrHrD/YtGP/JnHcxtuhdbCp188VBKW3ziXcPlPvKCGQwbl
         u9xBfGF/YuX4qVchmkfU3ErybY9Aj2ARzJ50qu6IVL68j1LRTzklmjukiXkaap/Op+Gy
         aefA==
X-Forwarded-Encrypted: i=1; AJvYcCXNislYRjNtWAvmioZaEjPlh1UqYlg/WnGePeQvtEmg+KMQbIRHZ4uUsIJ+oGzYlZ6ZrSrg+FmEFMDjQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR3XU9qf0c67ttm/iAD3BC28UpIG1iqz+Ue4xtq39KMO2J0yO0
	HxBRPDHkJUgIEwZx7l1zhlvIlfUDjnR/g5H+2RaKxUD/hCXH2KDlhL+ynALTrA==
X-Google-Smtp-Source: AGHT+IEUiyLyvMrLtopKskNATR7KA0DR+kuqA2bjgdmXLbsHPU/pN/ntoNwqTWgJ5Sa0f+/64i+m+Q==
X-Received: by 2002:a05:6a00:4606:b0:71e:68ae:aae1 with SMTP id d2e1a72fcca58-72063028d99mr249463b3a.19.1729875427268;
        Fri, 25 Oct 2024 09:57:07 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:bd37:bccf:f3e:a9ef])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205791db5fsm1318970b3a.11.2024.10.25.09.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:57:06 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv6 2/3] media: venus: sync with threaded IRQ during inst destruction
Date: Sat, 26 Oct 2024 01:56:42 +0900
Message-ID: <20241025165656.778282-3-senozhatsky@chromium.org>
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

When destroying an inst we should make sure that we don't race
against threaded IRQ (or pending IRQ), otherwise we can concurrently
kfree() inst context and inst itself.

BUG: KASAN: slab-use-after-free in vb2_queue_error+0x80/0x90
Call trace:
dump_backtrace+0x1c4/0x1f8
show_stack+0x38/0x60
dump_stack_lvl+0x168/0x1f0
print_report+0x170/0x4c8
kasan_report+0x94/0xd0
__asan_report_load2_noabort+0x20/0x30
vb2_queue_error+0x80/0x90
venus_helper_vb2_queue_error+0x54/0x78
venc_event_notify+0xec/0x158
hfi_event_notify+0x878/0xd20
hfi_process_msg_packet+0x27c/0x4e0
venus_isr_thread+0x258/0x6e8
hfi_isr_thread+0x70/0x90
venus_isr_thread+0x34/0x50
irq_thread_fn+0x88/0x130
irq_thread+0x160/0x2c0
kthread+0x294/0x328
ret_from_fork+0x10/0x20

Allocated by task 20291:
kasan_set_track+0x4c/0x80
kasan_save_alloc_info+0x28/0x38
__kasan_kmalloc+0x84/0xa0
kmalloc_trace+0x7c/0x98
v4l2_m2m_ctx_init+0x74/0x280
venc_open+0x444/0x6d0
v4l2_open+0x19c/0x2a0
chrdev_open+0x374/0x3f0
do_dentry_open+0x710/0x10a8
vfs_open+0x88/0xa8
path_openat+0x1e6c/0x2700
do_filp_open+0x1a4/0x2e0
do_sys_openat2+0xe8/0x508
do_sys_open+0x15c/0x1a0
__arm64_sys_openat+0xa8/0xc8
invoke_syscall+0xdc/0x270
el0_svc_common+0x1ec/0x250
do_el0_svc+0x54/0x70
el0_svc+0x50/0xe8
el0t_64_sync_handler+0x48/0x120
el0t_64_sync+0x1a8/0x1b0

Freed by task 20291:
 kasan_set_track+0x4c/0x80
 kasan_save_free_info+0x3c/0x60
 ____kasan_slab_free+0x124/0x1a0
 __kasan_slab_free+0x18/0x28
 __kmem_cache_free+0x134/0x300
 kfree+0xc8/0x1a8
 v4l2_m2m_ctx_release+0x44/0x60
 venc_close+0x78/0x130 [venus_enc]
 v4l2_release+0x20c/0x2f8
 __fput+0x328/0x7f0
 ____fput+0x2c/0x48
 task_work_run+0x1e0/0x280
 get_signal+0xfb8/0x1190
 do_notify_resume+0x34c/0x16a8
 el0_svc+0x9c/0xe8
 el0t_64_sync_handler+0x48/0x120
 el0t_64_sync+0x1a8/0x1b0

Rearrange inst destruction.  First remove the inst from the
core->instances list, second synchronize IRQ/IRQ-thread to
make sure that nothing else would see the inst while we take
it down.

Fixes: 7472c1c69138 ("[media] media: venus: vdec: add video decoder files")
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 12 +++++++++++-
 drivers/media/platform/qcom/venus/venc.c | 12 +++++++++++-
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 0013c4704f03..b3192a36f388 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1750,10 +1750,20 @@ static int vdec_close(struct file *file)
 	vdec_pm_get(inst);
 
 	cancel_work_sync(&inst->delayed_process_work);
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
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 	v4l2_m2m_release(inst->m2m_dev);
 	ida_destroy(&inst->dpb_ids);
-	hfi_session_destroy(inst);
 	v4l2_fh_del(&inst->fh);
 	v4l2_fh_exit(&inst->fh);
 	vdec_ctrl_deinit(inst);
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 6a26a6592424..36981ce448f5 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1517,9 +1517,19 @@ static int venc_close(struct file *file)
 
 	venc_pm_get(inst);
 
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
 	v4l2_m2m_ctx_release(inst->m2m_ctx);
 	v4l2_m2m_release(inst->m2m_dev);
-	hfi_session_destroy(inst);
 	v4l2_fh_del(&inst->fh);
 	v4l2_fh_exit(&inst->fh);
 	venc_ctrl_deinit(inst);
-- 
2.47.0.163.g1226f6d8fa-goog


