Return-Path: <linux-media+bounces-20310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D729B007D
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 12:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CD22284483
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2024 10:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F611FC7E0;
	Fri, 25 Oct 2024 10:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Cpvd+EId"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696B71F9431
	for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 10:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729853481; cv=none; b=Q9LSqPsFzLR0473ZUMSGBkNrk24G82dhWNNI0tPVSPI0Z7ZPXEANhyx0vZwXVpAmAjVqO8/BxBwXkW5E2Pg6Xp2LHucr/Vk6WiTq4HisBjV8UpgHYHgitw+KbodYtFlVxuD7Sib5nG4EkjPFK2rQXbMZnlaETfTMka82LEDXIiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729853481; c=relaxed/simple;
	bh=sK3GReGrrBIZCIcruu3To61mhXqDKeErWsYmv/yiG9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OyvQzh/8J1+dnoMkBzgEEpuI88bEgYHOD2O1amcU4Xsh0e2OkCzf6g3pbYu0lacEBpNIV2LwpeoNUjfhmcKjX/W8tLmOVRILIyUPjbGvWBLBHh0KN3P5zQXUMw+9EWqW3jXzKkC9uuX3DijP2I43271eIO+ukaGkcZxsbSdUah8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Cpvd+EId; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20bb39d97d1so14665555ad.2
        for <linux-media@vger.kernel.org>; Fri, 25 Oct 2024 03:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729853479; x=1730458279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZm7zndLXna2WAoQucoUjtozEIUfuaspQMegms8BWLo=;
        b=Cpvd+EIdaZyCUfHVHYZTWr/kTgXfNdvUwzlsmFIHWmKBlNwPifkAXgHVsbznkrT1DK
         VuHiuTgertuXF7FJS12JgN3qY9SpE326TsxL1QfKoJtzEplb6FgHWkyGD4rLhhU1fS1t
         KAoOWF+aBqbGrxEfNYBjyw6Lo7pvlj1uega0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729853479; x=1730458279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZm7zndLXna2WAoQucoUjtozEIUfuaspQMegms8BWLo=;
        b=PTqwhosuPpzVyBB4EbckMDh7Q2kDDiGBhGM8UxfipMP4iBy3UtJphP0XqhGxJw5KbU
         tG+Bx56oLys0eDl3oOGoLn+FhWQm195oXFcyW4PKDG5pK/rXLrj9ou8oi1HQQiYQYuvo
         f+oIOoz1PCDMIIUIv00NU7AKO8miya6aqnUTz+i2DDE2OxgRrMMlPfkCjUD0r0ypra8r
         ceCBtmzkYvoIT5nkJdcuy5QXJZOmYfKb38v3NjsmRh/zwRLl4CbK6UB/aSkxTmybt1Lg
         EBhXG0T+MhFjZsxnQyRMUQk7Su0Jzp8WVLhKhtGSdlicnrr6eqBAxXN8ku6LoIvYFrey
         mCGw==
X-Forwarded-Encrypted: i=1; AJvYcCV866YcEC3yejAsS/qaNMBjSouaekQahWPtepfaOu6BLwrMKTmh7gIWmtw23Ck7CcspvvYlDpXgnoOEjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKDm2ok3bgvPolcASDDzt8fIaUWj1PQEoLiz6iy8mJeReeIPFC
	dhxN3TqbSr1Wq4dbbAo7bPRloNW1ItW1581pNp3vOXKZyzd+yZQy4Tp/QPH2Dg==
X-Google-Smtp-Source: AGHT+IFqEaGoTba85exvNjzZJxFwbl9Yvi0HMXtZoEk9bBO28rmmAgedTotHKBh5xZwt9I4fUs2qPw==
X-Received: by 2002:a17:902:dac3:b0:20c:bea0:8d10 with SMTP id d9443c01a7336-20fa9e1adfbmr137467945ad.20.1729853478870;
        Fri, 25 Oct 2024 03:51:18 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:bd37:bccf:f3e:a9ef])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc030809sm7326755ad.227.2024.10.25.03.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:51:18 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 2/3] media: venus: sync with threaded IRQ during inst destruction
Date: Fri, 25 Oct 2024 19:50:38 +0900
Message-ID: <20241025105104.723764-3-senozhatsky@chromium.org>
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


