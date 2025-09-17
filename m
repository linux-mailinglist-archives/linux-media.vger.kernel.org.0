Return-Path: <linux-media+bounces-42655-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4710B7D6B4
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 14:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BCAE189FA4B
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 09:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79DE34AAEA;
	Wed, 17 Sep 2025 09:58:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE8E2C08AF;
	Wed, 17 Sep 2025 09:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.97.182.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758103080; cv=none; b=j5SviycWzFAAWlAPHf/gut8cKRvYLO/p0XUEFRYFXRfc7OMyuJfZqY1FB371sckBXo7X7d2MGu7S36MIJi6qDYLvqoyNZRn32q39kp2hhSkSeQjsribTLzCnY/b0TuYib1YuuVJKqv4SYpbt/6dzss8gO12A/m6gLhXjl/EjjLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758103080; c=relaxed/simple;
	bh=IBEow27Vwby7nWC+UOnxz8ki9Kv2cyPuTPAc6O3k1Og=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UgOtlgXTH84lL2R7rxleOfq7G35MArQDv44DOs4anDn0n0KV4ZyQHMBV74bTDQhXsoieIWcsRuw1qhPnE4EVC4d3mLwmV6zowZ4QL/b4uU036UduLzpSTIgUocl9w67t+DzT4CSpjIkPdmUtMpJjACIqsJhCoQh3VRubS0Pl05g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=209.97.182.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [106.117.98.100])
	by mtasvr (Coremail) with SMTP id _____wDHzu4bhspoZO5DAg--.16369S3;
	Wed, 17 Sep 2025 17:57:47 +0800 (CST)
Received: from ubuntu.localdomain (unknown [106.117.98.100])
	by mail-app1 (Coremail) with SMTP id yy_KCgCHCNEXhspoU6klAg--.17850S2;
	Wed, 17 Sep 2025 17:57:45 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH RESEND] media: i2c: tc358743: Fix use-after-free bugs caused by orphan timer in probe
Date: Wed, 17 Sep 2025 17:57:42 +0800
Message-Id: <20250917095742.14721-1-duoming@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:yy_KCgCHCNEXhspoU6klAg--.17850S2
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwcMAWjJvXsO9QADsW
X-CM-DELIVERINFO: =?B?ExHboQXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR12iKd4jvNs88B+wbnYVjPMn2WkPzZ3mJQDe+CwvoyXSW529aPKQUJ/VD/03uKTvJthZh
	ufGFey7IRRJLd1+O+KSzz4sxWHbfVxmnY9cVSIHxK9AMAT+3mukI9oR5gRN+Mw==
X-Coremail-Antispam: 1Uk129KBj93XoW3XF15trWkCw1kKrykAF4fZwc_yoW7Wr1kpF
	ZxK3yYyryUJr1qgF4IyFyUXF95Ka95KwsF9rs7Wr47uFs3XryrJFyxtrWY9F43AFWjyFyf
	A3WUt3sxJF4DKabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZE
	Xa7IU88hL5UUUUU==

The state->timer is a cyclic timer that schedules work_i2c_poll and
delayed_work_enable_hotplug, while rearming itself. Using timer_delete()
fails to guarantee the timer isn't still running when destroyed, similarly
cancel_delayed_work() cannot ensure delayed_work_enable_hotplug has
terminated if already executing. During probe failure after timer
initialization, these may continue running as orphans and reference the
already-freed tc358743_state object through tc358743_irq_poll_timer.

The following is the trace captured by KASAN.

BUG: KASAN: slab-use-after-free in __run_timer_base.part.0+0x7d7/0x8c0
Write of size 8 at addr ffff88800ded83c8 by task swapper/1/0
...
Call Trace:
 <IRQ>
 dump_stack_lvl+0x55/0x70
 print_report+0xcf/0x610
 ? __pfx_sched_balance_find_src_group+0x10/0x10
 ? __run_timer_base.part.0+0x7d7/0x8c0
 kasan_report+0xb8/0xf0
 ? __run_timer_base.part.0+0x7d7/0x8c0
 __run_timer_base.part.0+0x7d7/0x8c0
 ? rcu_sched_clock_irq+0xb06/0x27d0
 ? __pfx___run_timer_base.part.0+0x10/0x10
 ? try_to_wake_up+0xb15/0x1960
 ? tmigr_update_events+0x280/0x740
 ? _raw_spin_lock_irq+0x80/0xe0
 ? __pfx__raw_spin_lock_irq+0x10/0x10
 tmigr_handle_remote_up+0x603/0x7e0
 ? __pfx_tmigr_handle_remote_up+0x10/0x10
 ? sched_balance_trigger+0x98/0x9f0
 ? sched_tick+0x221/0x5a0
 ? _raw_spin_lock_irq+0x80/0xe0
 ? __pfx__raw_spin_lock_irq+0x10/0x10
 ? tick_nohz_handler+0x339/0x440
 ? __pfx_tmigr_handle_remote_up+0x10/0x10
 __walk_groups.isra.0+0x42/0x150
 tmigr_handle_remote+0x1f4/0x2e0
 ? __pfx_tmigr_handle_remote+0x10/0x10
 ? ktime_get+0x60/0x140
 ? lapic_next_event+0x11/0x20
 ? clockevents_program_event+0x1d4/0x2a0
 ? hrtimer_interrupt+0x322/0x780
 handle_softirqs+0x16a/0x550
 irq_exit_rcu+0xaf/0xe0
 sysvec_apic_timer_interrupt+0x70/0x80
 </IRQ>
...

Allocated by task 141:
 kasan_save_stack+0x24/0x50
 kasan_save_track+0x14/0x30
 __kasan_kmalloc+0x7f/0x90
 __kmalloc_node_track_caller_noprof+0x198/0x430
 devm_kmalloc+0x7b/0x1e0
 tc358743_probe+0xb7/0x610  i2c_device_probe+0x51d/0x880
 really_probe+0x1ca/0x5c0
 __driver_probe_device+0x248/0x310
 driver_probe_device+0x44/0x120
 __device_attach_driver+0x174/0x220
 bus_for_each_drv+0x100/0x190
 __device_attach+0x206/0x370
 bus_probe_device+0x123/0x170
 device_add+0xd25/0x1470
 i2c_new_client_device+0x7a0/0xcd0
 do_one_initcall+0x89/0x300
 do_init_module+0x29d/0x7f0
 load_module+0x4f48/0x69e0
 init_module_from_file+0xe4/0x150
 idempotent_init_module+0x320/0x670
 __x64_sys_finit_module+0xbd/0x120
 do_syscall_64+0xac/0x280
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 141:
 kasan_save_stack+0x24/0x50
 kasan_save_track+0x14/0x30
 kasan_save_free_info+0x3a/0x60
 __kasan_slab_free+0x3f/0x50
 kfree+0x137/0x370
 release_nodes+0xa4/0x100
 devres_release_group+0x1b2/0x380
 i2c_device_probe+0x694/0x880
 really_probe+0x1ca/0x5c0
 __driver_probe_device+0x248/0x310
 driver_probe_device+0x44/0x120
 __device_attach_driver+0x174/0x220
 bus_for_each_drv+0x100/0x190
 __device_attach+0x206/0x370
 bus_probe_device+0x123/0x170
 device_add+0xd25/0x1470
 i2c_new_client_device+0x7a0/0xcd0
 do_one_initcall+0x89/0x300
 do_init_module+0x29d/0x7f0
 load_module+0x4f48/0x69e0
 init_module_from_file+0xe4/0x150
 idempotent_init_module+0x320/0x670
 __x64_sys_finit_module+0xbd/0x120
 do_syscall_64+0xac/0x280
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
...

Replace timer_delete() with timer_delete_sync() and cancel_delayed_work()
with cancel_delayed_work_sync() to ensure proper termination of timer and
work items before resource cleanup.

This bug was initially identified through static analysis. For reproduction
and testing, I created a functional emulation of the tc358743 device via a
kernel module and introduced faults through the debugfs interface.

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


