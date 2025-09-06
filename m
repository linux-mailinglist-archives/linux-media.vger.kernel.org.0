Return-Path: <linux-media+bounces-41910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D63B47142
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 16:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C5B556755C
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 14:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FD61B87C9;
	Sat,  6 Sep 2025 14:48:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6ECDF49;
	Sat,  6 Sep 2025 14:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.75.44.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757170088; cv=none; b=AKIGukeK15kOHBpPNSDfeEI1hOQNHkEL6eOROIPHGSBET1XPz4wN/KAjbUu9NcPrfZFOBtxnmUpkUmp53MofpVMS5ZgIcd/sVZx1IMv0rICvu6WP/ALfP+WTtCgEid3I54j2lM3qcaFQTNoC5c+wKuDU7gDrlEEKxeX8OIBHmIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757170088; c=relaxed/simple;
	bh=qxFxeg7gClN6eZLd6PtGF5dBCHYZBECRvHst1WHCg4s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lH2vG4MVv1sur4K+rP4gxHG/3i9fjZHhjPoA5QBL8I3Zm+XAcfa0zw6sCX4KfgUbQ6gmvbZeHP6IxICP8uCbdRedgxDoYzZwR887u78/5BBT97L31+WIXOkJX7nHlw9JW/9snGP76cJI9afc6ssEI0NF0Mevfp4PHAFu6U3l04o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=13.75.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [106.117.98.8])
	by mtasvr (Coremail) with SMTP id _____wB3OBiYSbxoBpfxAQ--.23147S3;
	Sat, 06 Sep 2025 22:47:53 +0800 (CST)
Received: from ubuntu.localdomain (unknown [106.117.98.8])
	by mail-app1 (Coremail) with SMTP id yy_KCgBn4dqTSbxoz+7QAQ--.17155S2;
	Sat, 06 Sep 2025 22:47:52 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH] media: i2c: tc358743: Fix use-after-free bugs caused by orphan timer in probe
Date: Sat,  6 Sep 2025 22:47:28 +0800
Message-Id: <20250906144728.202997-1-duoming@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:yy_KCgBn4dqTSbxoz+7QAQ--.17155S2
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwEBAWi7PPoDiAAVsJ
X-CM-DELIVERINFO: =?B?xkxl7QXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR1y3Ob4nm0MviJzDnk5A3Tp074NVC2qdtvtXjJm1U9ojHUnAdVe767Pt0Plbb765DP9ci
	Vc6R4q7UaUc1aE2meq2XiLyRieFKRtFFMuNjWG//2lx8NgkgscZys58qtmSZag==
X-Coremail-Antispam: 1Uk129KBj93XoW3XF15trWkCw1kKr45XryruFX_yoWfZryrpF
	nI93yfCrW0qr1UXr42ya18Xr1xJrZFy3W2qr4IyF47WF4Duw4rtF1xt34UWF1UWrWUAFy7
	JFs8JrWUKF1DtagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuY
	vjxU26pBDUUUU

The state->timer is a cyclic timer that schedules work_i2c_poll and
delayed_work_enable_hotplug, while rearming itself. Using timer_delete()
fails to guarantee the timer isn't still running when destroyed, similarly
cancel_delayed_work() cannot ensure delayed_work_enable_hotplug has
terminated if already executing. During probe failure after timer
initialization, these may continue running as orphans and reference the
already-freed tc358743_state object through tc358743_irq_poll_timer.

The following is the trace captured by KASAN.

[   34.674318] BUG: KASAN: slab-use-after-free in __run_timer_base.part.0+0x7d7/0x8c0
[   34.674949] Write of size 8 at addr ffff88800ded83c8 by task swapper/1/0
......
[   34.677259] Call Trace:
[   34.677336]  <IRQ>
[   34.677447]  dump_stack_lvl+0x55/0x70
[   34.677532]  print_report+0xcf/0x610
[   34.677562]  ? __pfx_sched_balance_find_src_group+0x10/0x10
[   34.677586]  ? __run_timer_base.part.0+0x7d7/0x8c0
[   34.677603]  kasan_report+0xb8/0xf0
[   34.677622]  ? __run_timer_base.part.0+0x7d7/0x8c0
[   34.677642]  __run_timer_base.part.0+0x7d7/0x8c0
[   34.677665]  ? rcu_sched_clock_irq+0xb06/0x27d0
[   34.677683]  ? __pfx___run_timer_base.part.0+0x10/0x10
[   34.677698]  ? try_to_wake_up+0xb15/0x1960
[   34.677717]  ? tmigr_update_events+0x280/0x740
[   34.677737]  ? _raw_spin_lock_irq+0x80/0xe0
[   34.677756]  ? __pfx__raw_spin_lock_irq+0x10/0x10
[   34.677775]  tmigr_handle_remote_up+0x603/0x7e0
[   34.677800]  ? __pfx_tmigr_handle_remote_up+0x10/0x10
[   34.677817]  ? sched_balance_trigger+0x98/0x9f0
[   34.677834]  ? sched_tick+0x221/0x5a0
[   34.677851]  ? _raw_spin_lock_irq+0x80/0xe0
[   34.677866]  ? __pfx__raw_spin_lock_irq+0x10/0x10
[   34.677883]  ? tick_nohz_handler+0x339/0x440
[   34.677901]  ? __pfx_tmigr_handle_remote_up+0x10/0x10
[   34.677918]  __walk_groups.isra.0+0x42/0x150
[   34.677938]  tmigr_handle_remote+0x1f4/0x2e0
[   34.677955]  ? __pfx_tmigr_handle_remote+0x10/0x10
[   34.677973]  ? ktime_get+0x60/0x140
[   34.677990]  ? lapic_next_event+0x11/0x20
[   34.678008]  ? clockevents_program_event+0x1d4/0x2a0
[   34.678023]  ? hrtimer_interrupt+0x322/0x780
[   34.678042]  handle_softirqs+0x16a/0x550
[   34.678069]  irq_exit_rcu+0xaf/0xe0
[   34.678086]  sysvec_apic_timer_interrupt+0x70/0x80
[   34.678117]  </IRQ>
[   34.678129]  <TASK>
[   34.678137]  asm_sysvec_apic_timer_interrupt+0x1a/0x20
[   34.678213] RIP: 0010:pv_native_safe_halt+0xf/0x20
[   34.678290] Code: 67 ec 00 c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f0
[   34.678346] RSP: 0018:ffff8880089afe60 EFLAGS: 00000216
[   34.678431] RAX: ffff8880e59c4000 RBX: 0000000000000001 RCX: ffffffff84aa9571
[   34.678469] RDX: 0000000000000001 RSI: 0000000000000004 RDI: 000000000001a7dc
[   34.678501] RBP: dffffc0000000000 R08: ffff88806d0a7ae0 R09: ffffed100da1613b
[   34.678535] R10: ffffed100da1613a R11: ffff88806d0b09d3 R12: ffffffff8666be50
[   34.678567] R13: 1ffff11001135fd2 R14: 0000000000000000 R15: 0000000000000000
[   34.678607]  ? ct_kernel_exit.constprop.0+0xa1/0xc0
[   34.678633]  default_idle+0x9/0x10
[   34.678651]  default_idle_call+0x3a/0x60
[   34.678667]  do_idle+0x2e5/0x3a0
[   34.678687]  ? __pfx_do_idle+0x10/0x10
[   34.678703]  ? swake_up_locked.part.0+0x5f/0x170
[   34.678719]  ? __kthread_bind_mask+0x44/0x90
[   34.678739]  cpu_startup_entry+0x4f/0x60
[   34.678755]  start_secondary+0x1b3/0x210
[   34.678774]  common_startup_64+0x13e/0x148
[   34.678811]  </TASK>
[   34.678863]
[   34.685702] Allocated by task 141:
[   34.686070]  kasan_save_stack+0x24/0x50
[   34.686382]  kasan_save_track+0x14/0x30
[   34.686597]  __kasan_kmalloc+0x7f/0x90
[   34.686827]  __kmalloc_node_track_caller_noprof+0x198/0x430
[   34.687085]  devm_kmalloc+0x7b/0x1e0
[   34.687341]  tc358743_probe+0xb7/0x610 [tc358743]
[   34.688028]  i2c_device_probe+0x51d/0x880
[   34.688141]  really_probe+0x1ca/0x5c0
[   34.688248]  __driver_probe_device+0x248/0x310
[   34.688489]  driver_probe_device+0x44/0x120
[   34.688639]  __device_attach_driver+0x174/0x220
[   34.688827]  bus_for_each_drv+0x100/0x190
[   34.689035]  __device_attach+0x206/0x370
[   34.689272]  bus_probe_device+0x123/0x170
[   34.689473]  device_add+0xd25/0x1470
[   34.689694]  i2c_new_client_device+0x7a0/0xcd0
[   34.690193]  do_one_initcall+0x89/0x300
[   34.690389]  do_init_module+0x29d/0x7f0
[   34.690608]  load_module+0x4f48/0x69e0
[   34.690782]  init_module_from_file+0xe4/0x150
[   34.691113]  idempotent_init_module+0x320/0x670
[   34.691291]  __x64_sys_finit_module+0xbd/0x120
[   34.691429]  do_syscall_64+0xac/0x280
[   34.691684]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   34.692042]
[   34.692240] Freed by task 141:
[   34.692436]  kasan_save_stack+0x24/0x50
[   34.692743]  kasan_save_track+0x14/0x30
[   34.692968]  kasan_save_free_info+0x3a/0x60
[   34.693263]  __kasan_slab_free+0x3f/0x50
[   34.693485]  kfree+0x137/0x370
[   34.693653]  release_nodes+0xa4/0x100
[   34.693849]  devres_release_group+0x1b2/0x380
[   34.694009]  i2c_device_probe+0x694/0x880
[   34.694307]  really_probe+0x1ca/0x5c0
[   34.694526]  __driver_probe_device+0x248/0x310
[   34.694829]  driver_probe_device+0x44/0x120
[   34.695076]  __device_attach_driver+0x174/0x220
[   34.695366]  bus_for_each_drv+0x100/0x190
[   34.695629]  __device_attach+0x206/0x370
[   34.695731]  bus_probe_device+0x123/0x170
[   34.695971]  device_add+0xd25/0x1470
[   34.696173]  i2c_new_client_device+0x7a0/0xcd0
[   34.696491]  do_one_initcall+0x89/0x300
[   34.696664]  do_init_module+0x29d/0x7f0
[   34.696856]  load_module+0x4f48/0x69e0
[   34.697047]  init_module_from_file+0xe4/0x150
[   34.697345]  idempotent_init_module+0x320/0x670
[   34.697681]  __x64_sys_finit_module+0xbd/0x120
[   34.697972]  do_syscall_64+0xac/0x280
[   34.698123]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   34.698421]
[   34.698666] The buggy address belongs to the object at ffff88800ded8000
[   34.698666]  which belongs to the cache kmalloc-2k of size 2048
[   34.699248] The buggy address is located 968 bytes inside of
[   34.699248]  freed 2048-byte region [ffff88800ded8000, ffff88800ded8800)
[   34.699780]
[   34.700099] The buggy address belongs to the physical page:
[   34.700794] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0xded8
[   34.701253] head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
[   34.701674] flags: 0x100000000000040(head|node=0|zone=1)
[   34.702298] page_type: f5(slab)
[   34.702973] raw: 0100000000000040 ffff888008042f00 dead000000000122 0000000000000000
[   34.703395] raw: 0000000000000000 0000000080080008 00000000f5000000 0000000000000000
[   34.704087] head: 0100000000000040 ffff888008042f00 dead000000000122 0000000000000000
[   34.704372] head: 0000000000000000 0000000080080008 00000000f5000000 0000000000000000
[   34.704495] head: 0100000000000003 ffffea000037b601 00000000ffffffff 00000000ffffffff
[   34.704599] head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
[   34.704739] page dumped because: kasan: bad access detected
[   34.704823]
[   34.704862] Memory state around the buggy address:
[   34.705390]  ffff88800ded8280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[   34.705718]  ffff88800ded8300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[   34.706286] >ffff88800ded8380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[   34.706706]                                               ^
[   34.707255]  ffff88800ded8400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[   34.707573]  ffff88800ded8480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[   34.707937] ==================================================================

Replace timer_delete() with del_timer_sync() and cancel_delayed_work() with
cancel_delayed_work_sync() to ensure proper termination of timer and work
items before resource cleanup.

Fixes: 869f38ae07f7 ("media: i2c: tc358743: Fix crash in the probe error path when using polling")
Fixes: d32d98642de6 ("[media] Driver for Toshiba TC358743 HDMI to CSI-2 bridge")
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 drivers/media/i2c/tc358743.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 1cc7636e446d..5042cf612d21 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -2245,10 +2245,10 @@ static int tc358743_probe(struct i2c_client *client)
 err_work_queues:
 	cec_unregister_adapter(state->cec_adap);
 	if (!state->i2c_client->irq) {
-		timer_delete(&state->timer);
+		timer_delete_sync(&state->timer);
 		flush_work(&state->work_i2c_poll);
 	}
-	cancel_delayed_work(&state->delayed_work_enable_hotplug);
+	cancel_delayed_work_sync(&state->delayed_work_enable_hotplug);
 	mutex_destroy(&state->confctl_mutex);
 err_hdl:
 	media_entity_cleanup(&sd->entity);
-- 
2.34.1


