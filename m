Return-Path: <linux-media+bounces-27727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4205A54E20
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 15:48:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C67083A934E
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 14:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B041624E4;
	Thu,  6 Mar 2025 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZBv7bul"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A941422D4
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 14:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272474; cv=none; b=QrrqJQlXFQMEsDIPyxOAyC0UZoUDL/SOKtQsZRRC76Imep6ThCH8ooWefZwPKp36QFbMV/n6y0cNOxAIPHMRdRasz9OJ9PWgHELpICOVpZRFeFdUuwfNvBNpnoblTEk6nyNlcZCadsLksoW3ArXhsaWRcvPtK5dB56wX5QKeqz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272474; c=relaxed/simple;
	bh=/tKSBQCR83iW8MMXxraFQbAVLlSuTpLIzYcTxwx/YZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oq/5fhxRS0jhfKNVUElpe4anYllM5Ki2PfIIOUDx0ocLbm3sLw1aGQM5pcc69O0NHA04h+vrlmd1z+1O2tzKT/Wrs+tV/NGVew4xjJ7sKjpJEEbeeei7Hn/kXBKMQgv5y8ndxXWmwdW7cuJYjcbDs94iItzJLjxr+Phi0fMnV8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZBv7bul; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741272472; x=1772808472;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/tKSBQCR83iW8MMXxraFQbAVLlSuTpLIzYcTxwx/YZQ=;
  b=gZBv7bulkdLl+DZKzcvROo6wVYMQia/Hqtn3maiNMIyG5RqyZZ/8Zm21
   WBijybCnOB5WwCBoyqBp9mlPvYTKWD9jzHotNzZiF1S+RYJR0KoVEkqBk
   7oUCculLyeh5/Ew8sVdFeGj3Z4C9dXCKNfWhPGt2myczfNlxWXY0v+qOq
   M04Pr0bR5kX9dXOnXQVLDdmvmgseJgmGLzvRfr7tIsbrigodtfSxPbWSt
   hQU7C+ZBForqOkVIgM14nUrT9EpPoY4uJ5Qde4dHs4+BU8ulYSGrB7edd
   wUMoiT9p3bg3usFno0qeBg0W1nAWXUe9B/LjSm8eKhyF8SbWjW8deF4jM
   g==;
X-CSE-ConnectionGUID: 6jbxzL+ERom3yKl/m2/CUQ==
X-CSE-MsgGUID: UyMFX5+sT6OA/SNu7afCaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42199992"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="42199992"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 06:47:51 -0800
X-CSE-ConnectionGUID: w6Ix3ibKTkSXuM9HkllSiA==
X-CSE-MsgGUID: SQRbx6YcRhKZui39zD5PIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119551127"
Received: from unknown (HELO nitin-Super-Server.iind.intel.com) ([10.190.238.72])
  by orviesa007.jf.intel.com with ESMTP; 06 Mar 2025 06:47:49 -0800
From: Nitin Gote <nitin.r.gote@intel.com>
To: christian.koenig@amd.com
Cc: intel-gfx@lists.freedesktop.org,
	sumit.semwal@linaro.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	chris.p.wilson@intel.com,
	andi.shyti@intel.com,
	nitin.r.gote@intel.com
Subject: [PATCH] dma-buf: Take a breath during dma-fence-chain subtests
Date: Thu,  6 Mar 2025 20:41:11 +0530
Message-Id: <20250306151111.1405362-1-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Give the scheduler a chance to breath by adding delay of 10ms
as some of the loops may take some time on old machines (like apl/bsw/pnv),
and so catch the attention of the watchdogs.

v1: Instead of cond_resched(), use more generic call like
    fsleep(). <Christian>

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
Hi,

For reviewer reference, adding here watchdog issue seen on old machines
during dma-fence-chain subtests testing. This log is retrieved from device
pstore log while testing dam-buf@all-tests:

dma-buf: Running dma_fence_chain
Panic#1 Part7
<6> sizeof(dma_fence_chain)=184
<6> dma-buf: Running dma_fence_chain/sanitycheck
<6> dma-buf: Running dma_fence_chain/find_seqno
<6> dma-buf: Running dma_fence_chain/find_signaled
<6> dma-buf: Running dma_fence_chain/find_out_of_order
<6> dma-buf: Running dma_fence_chain/find_gap
<6> dma-buf: Running dma_fence_chain/find_race
<6> Completed 4095 cycles
<6> dma-buf: Running dma_fence_chain/signal_forward
<6> dma-buf: Running dma_fence_chain/signal_backward
<6> dma-buf: Running dma_fence_chain/wait_forward
<6> dma-buf: Running dma_fence_chain/wait_backward
<0> watchdog: BUG: soft lockup - CPU#2 stuck for 26s! [dmabuf:2263]
Panic#1 Part6
<4> irq event stamp: 415735
<4> hardirqs last  enabled at (415734): [<ffffffff813d3a1b>] handle_softirqs+0xab/0x4d0
<4> hardirqs last disabled at (415735): [<ffffffff827c7e31>] sysvec_apic_timer_interrupt+0x11/0xc0
<4> softirqs last  enabled at (415728): [<ffffffff813d3f8f>] __irq_exit_rcu+0x13f/0x160
<4> softirqs last disabled at (415733): [<ffffffff813d3f8f>] __irq_exit_rcu+0x13f/0x160
<4> CPU: 2 UID: 0 PID: 2263 Comm: dmabuf Not tainted 6.14.0-rc2-drm-next_483-g7b91683e7de7+ #1
<4> Hardware name: Intel corporation NUC6CAYS/NUC6CAYB, BIOS AYAPLCEL.86A.0056.2018.0926.1100 09/26/2018
<4> RIP: 0010:handle_softirqs+0xb1/0x4d0
<4> RSP: 0018:ffffc90000154f60 EFLAGS: 00000246
<4> RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
<4> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
<4> RBP: ffffc90000154fb8 R08: 0000000000000000 R09: 0000000000000000
<4> R10: 0000000000000000 R11: 0000000000000000 R12: 000000000000000a
<4> R13: 0000000000000200 R14: 0000000000000200 R15: 0000000000400100
<4> FS:  000077521c5cd940(0000) GS:ffff888277900000(0000) knlGS:0000000000000000
Panic#1 Part5
<4> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4> CR2: 00005dbfee8c00c4 CR3: 0000000133d38000 CR4: 00000000003526f0
<4> Call Trace:
<4>  <IRQ>
<4>  ? show_regs+0x6c/0x80
<4>  ? watchdog_timer_fn+0x247/0x2d0
<4>  ? __pfx_watchdog_timer_fn+0x10/0x10
<4>  ? __hrtimer_run_queues+0x1d0/0x420
<4>  ? hrtimer_interrupt+0x116/0x290
<4>  ? __sysvec_apic_timer_interrupt+0x70/0x1e0
<4>  ? sysvec_apic_timer_interrupt+0x47/0xc0
<4>  ? asm_sysvec_apic_timer_interrupt+0x1b/0x20
<4>  ? handle_softirqs+0xb1/0x4d0
<4>  __irq_exit_rcu+0x13f/0x160
<4>  irq_exit_rcu+0xe/0x20
<4>  sysvec_irq_work+0xa0/0xc0
<4>  </IRQ>
<4>  <TASK>
<4>  asm_sysvec_irq_work+0x1b/0x20
<4> RIP: 0010:_raw_spin_unlock_irqrestore+0x57/0x80
<4> RSP: 0018:ffffc9000292b8f0 EFLAGS: 00000246
<4> RAX: 0000000000000000 RBX: ffff88810f235480 RCX: 0000000000000000
<4> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
<4> RBP: ffffc9000292b900 R08: 0000000000000000 R09: 0000000000000000
<4> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000246
<4> R13: 0000000000000000 R14: 0000000000000246 R15: 000000000003828c
Panic#1 Part4
<4> dma_fence_signal+0x49/0xb0
<4> wait_backward+0xf8/0x140 [dmabuf_selftests]
<4> __subtests+0x75/0x1f0 [dmabuf_selftests]
<4> dma_fence_chain+0x94/0xe0 [dmabuf_selftests]
<4> st_init+0x6a/0xff0 [dmabuf_selftests]
<4> ? __pfx_st_init+0x10/0x10 [dmabuf_selftests]
<4> do_one_initcall+0x79/0x400
<4> do_init_module+0x97/0x2a0
<4> load_module+0x2c23/0x2f60
<4> init_module_from_file+0x97/0xe0
<4> ? init_module_from_file+0x97/0xe0
<4> idempotent_init_module+0x134/0x350
<4> __x64_sys_finit_module+0x77/0x100
<4> x64_sys_call+0x1f37/0x2650
<4> do_syscall_64+0x91/0x180
<4> ? trace_hardirqs_off+0x5d/0xe0
<4> ? syscall_exit_to_user_mode+0x95/0x260
<4> ? do_syscall_64+0x9d/0x180
<4> ? do_syscall_64+0x9d/0x180
<4> ? irqentry_exit+0x77/0xb0
<4> ? sysvec_apic_timer_interrupt+0x57/0xc0
<4> entry_SYSCALL_64_after_hwframe+0x76/0x7e
<4> RIP: 0033:0x77521e72725d

Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 drivers/dma-buf/st-dma-fence-chain.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
index ed4b323886e4..12dfa245ab9a 100644
--- a/drivers/dma-buf/st-dma-fence-chain.c
+++ b/drivers/dma-buf/st-dma-fence-chain.c
@@ -431,7 +431,7 @@ static int __find_race(void *arg)
 signal:
 		seqno = get_random_u32_below(data->fc.chain_length - 1);
 		dma_fence_signal(data->fc.fences[seqno]);
-		cond_resched();
+		fsleep(10000);
 	}
 
 	if (atomic_dec_and_test(&data->children))
@@ -505,6 +505,7 @@ static int signal_forward(void *arg)
 
 	for (i = 0; i < fc.chain_length; i++) {
 		dma_fence_signal(fc.fences[i]);
+		fsleep(10000);
 
 		if (!dma_fence_is_signaled(fc.chains[i])) {
 			pr_err("chain[%d] not signaled!\n", i);
@@ -537,6 +538,7 @@ static int signal_backward(void *arg)
 
 	for (i = fc.chain_length; i--; ) {
 		dma_fence_signal(fc.fences[i]);
+		fsleep(10000);
 
 		if (i > 0 && dma_fence_is_signaled(fc.chains[i])) {
 			pr_err("chain[%d] is signaled!\n", i);
@@ -587,8 +589,10 @@ static int wait_forward(void *arg)
 	get_task_struct(tsk);
 	yield_to(tsk, true);
 
-	for (i = 0; i < fc.chain_length; i++)
+	for (i = 0; i < fc.chain_length; i++) {
 		dma_fence_signal(fc.fences[i]);
+		fsleep(10000);
+	}
 
 	err = kthread_stop_put(tsk);
 
@@ -616,8 +620,10 @@ static int wait_backward(void *arg)
 	get_task_struct(tsk);
 	yield_to(tsk, true);
 
-	for (i = fc.chain_length; i--; )
+	for (i = fc.chain_length; i--; ) {
 		dma_fence_signal(fc.fences[i]);
+		fsleep(10000);
+	}
 
 	err = kthread_stop_put(tsk);
 
@@ -663,8 +669,10 @@ static int wait_random(void *arg)
 	get_task_struct(tsk);
 	yield_to(tsk, true);
 
-	for (i = 0; i < fc.chain_length; i++)
+	for (i = 0; i < fc.chain_length; i++) {
 		dma_fence_signal(fc.fences[i]);
+		fsleep(10000);
+	}
 
 	err = kthread_stop_put(tsk);
 
-- 
2.25.1


