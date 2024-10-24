Return-Path: <linux-media+bounces-20160-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FADA9ADBF9
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 08:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBE842840B7
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 06:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CE8189F5A;
	Thu, 24 Oct 2024 06:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F3JvfKWB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6266189BB9
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 06:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729750703; cv=none; b=gx9p1oBIeV93o3v/9OvNni7g7FIAoZaTT4KNPC53kii8TH9/mbv+sWxXz3YvxLk4axn+b8ej1h/40ESS50bSO52GczPY1ivuZxvdCOB9EWdjQxRWNa3u+isSw1sABUrCGa/ZPspRNoC9Z41hl4iaILHBCh29gcnLGQC6xYEoNgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729750703; c=relaxed/simple;
	bh=WuW3DSRWAirPU5hoOMSkM7ECIZU6B8b6JvmaEpe9eXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FXg5+l/QYRXFKNXm9uGCC3H3WsmfLgFF9hkRmTJaeAUdU0or2SHAM2imev2ULKoAQQoQ+rW3z0T96jeQSqq+vmy2vdr5rNorwhpL5Q9LLj4fEndUGWoq5yEUNWQSisMFzcMo+HQYR0NkSqRcSDyUqgF9IEDhG+NJWx6HWnT/Rx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F3JvfKWB; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20b5affde14so3425755ad.3
        for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 23:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729750701; x=1730355501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0OqRfY2laRwHMvcPD1Pi9U6AIj3M+h1HSZ0JUx96vI=;
        b=F3JvfKWBfvM1nF5EXBeImSyb7m4kuQa+pu7UNX3NqOTKgVk3UXxy4j1bCPz7nxvqXp
         cshoOThG8TNEXx3nQC0V+m/5j045UpjCabhavKsOSG2qNt9xPF7vV7QRQvUkG12Jrx9S
         fWIRMUOd7MGhXtYKMgPE/hHeuqRu8JVcFnzXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729750701; x=1730355501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0OqRfY2laRwHMvcPD1Pi9U6AIj3M+h1HSZ0JUx96vI=;
        b=c6COOuBmx1mqOtr2mqUtm6ACEhx1DSMYUaCAR3AYFwTIyiloDYbIZGXAueeB5zSdnp
         dDfADOJEL4d8LYwe1dM84ekV7K6hPED9UVn2uQdAnSOP7QD0JlqYMlRQ5/njGLi6odyI
         q33LJngTKZ6qWK+24A0uEDXK9bAi9FsM+O0jXRMCsegTFSTmOFg9qCq0WlltEew8jaJY
         lCB4vfVV1qX75g3YpdID3qIXCWiS5w8Y4UzJuqr4ZC4MLI+D0MgWxSua9h+LWI1wqYI9
         RkCVyZ5egJ//KSbf0JGyoPOhIu1ZqmbP4NMl49uzM3ICsMHlBnLX7Jyb8TpVHynI5byx
         VWmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWiT9VdQNX3IEEk8tR3NpSTK6k5aIHTakQAzGwt3Lv8aoAMTAfApcw+3Yc8n0p58ACE8FkzCETLXkyig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzH5MDwlyP15XVzohjnNC+x1g24+0RvrDQ9TTZ6Ts2mUsVW5V6s
	fcs7lNA/VsUpc/AftCiAXvLVOx8S0BDozwdR7xOEQnt9AuXzTErjFYjVoEqv2g==
X-Google-Smtp-Source: AGHT+IGyrwOn7tzkbta+g7U9TkeZyz17lEZfo9cb63EG+ys7jvJGIRRiUSGDj69jHCpOWx+csWxVJw==
X-Received: by 2002:a17:902:da84:b0:20c:a644:c5bf with SMTP id d9443c01a7336-20fb99d958bmr7388245ad.31.1729750700921;
        Wed, 23 Oct 2024 23:18:20 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:9422:d958:f749:9a30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0bd561sm66418885ad.179.2024.10.23.23.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 23:18:20 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2 2/2] media: venus: sync with threaded IRQ during inst destruction
Date: Thu, 24 Oct 2024 15:16:58 +0900
Message-ID: <20241024061809.400260-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241024061809.400260-1-senozhatsky@chromium.org>
References: <20241024061809.400260-1-senozhatsky@chromium.org>
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

Re-arragne inst destruction.  First remove the inst from the
core ->instacnes list, second synchronize IRQ/IRQ-thread to
make sure that nothing else would see the inst while we take
it down.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
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


