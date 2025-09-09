Return-Path: <linux-media+bounces-42112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF00B4FC1A
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 15:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E2557ACB7E
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 13:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC7B340DA7;
	Tue,  9 Sep 2025 13:10:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from zg8tmty1ljiyny4xntuumtyw.icoremail.net (zg8tmty1ljiyny4xntuumtyw.icoremail.net [165.227.155.160])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9CCE340D8B;
	Tue,  9 Sep 2025 13:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=165.227.155.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757423458; cv=none; b=Ver5qDdIsOIEeO+XkiojUfBvWV8v+H/ayjDrO2I39U0VsVCY55N3PkNYJIeCNOMLbtV0wtMeT2b300wIvOo9cRjXU7pH+TTmfObimAuVZ3crrw/26B6co2ua/k5uLU6nMkE8hg+SgRZqvCHXkxJq227ipUNGzJ8IHH4w3vRRbck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757423458; c=relaxed/simple;
	bh=zThnCAKA+4vgIwTbAuIkx9JsRCygnh9uUe1gZInsuXw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jFXreVQ0eaqrOXM1L9G6D23xNJ+L5E5ZoLqrIsgQroSA8FI7gbYE3SpgEADMmFxkzZdJdX+MAn1bWC3q/od5wcm3FZRl+YM2239mZfUsuI6jfkwRHLemQ3mTFLaLEmX5lfOA4SdJW0NJkvXAMJSOFnurbvAoFj1wiIHpcRA/EZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=165.227.155.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [106.117.96.180])
	by mtasvr (Coremail) with SMTP id _____wBHl7BPJ8BoriEJAg--.59037S3;
	Tue, 09 Sep 2025 21:10:40 +0800 (CST)
Received: from ubuntu.localdomain (unknown [106.117.96.180])
	by mail-app1 (Coremail) with SMTP id yy_KCgDHSNFIJ8BoD6voAQ--.45626S2;
	Tue, 09 Sep 2025 21:10:38 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH] media: b2c2: Fix use-after-free causing by irq_check_work in flexcop_pci_remove
Date: Tue,  9 Sep 2025 21:10:31 +0800
Message-Id: <20250909131031.21145-1-duoming@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:yy_KCgDHSNFIJ8BoD6voAQ--.45626S2
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwIEAWi-MXoLBQBasM
X-CM-DELIVERINFO: =?B?DZBj1gXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR1wDvNOKYSavpkGCMZiiaTGnUTVl0pofgLRW1IV1nnWiiTXRiJTyFzlfHl8i03uccZd9v
	3VPTioc8hnJTJ6u7CHFWIrnamWWt8f/9CJSpPTQux0AJ1fKpr4k/NRbMCKo/Bw==
X-Coremail-Antispam: 1Uk129KBj93XoWxtrWfXr4DGw43KF1fWryrKrX_yoWxZw1kpF
	s0yryfGr48Jry7XrW2y3W5Xr1rJanxZ3W8Grn2kr1jvF48Gr1UXFyUGr4DKF1DGF4rCFy7
	Ja4DJry3tr1DKabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
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

The original code uses cancel_delayed_work() in flexcop_pci_remove(), which
does not guarantee that the delayed work item irq_check_work has fully
completed if it was already running. This leads to use-after-free scenarios
where flexcop_pci_remove() may free the flexcop_device while irq_check_work
is still active and attempts to dereference the device.

A typical race condition is illustrated below:

CPU 0 (remove)                         | CPU 1 (delayed work callback)
flexcop_pci_remove()                   | flexcop_pci_irq_check_work()
  cancel_delayed_work()                |
  flexcop_device_kfree(fc_pci->fc_dev) |
                                       |   fc = fc_pci->fc_dev; // UAF

This is confirmed by a KASAN report:

[   60.718921] ==================================================================
[   60.734503] BUG: KASAN: slab-use-after-free in __run_timer_base.part.0+0x7d7/0x8c0
[   60.737894] Write of size 8 at addr ffff8880093aa8c8 by task bash/135
...
[   60.742475] Call Trace:
[   60.742729]  <IRQ>
[   60.743030]  dump_stack_lvl+0x55/0x70
[   60.743256]  print_report+0xcf/0x610
[   60.743335]  ? __run_timer_base.part.0+0x7d7/0x8c0
[   60.743394]  kasan_report+0xb8/0xf0
[   60.743489]  ? __run_timer_base.part.0+0x7d7/0x8c0
[   60.743541]  __run_timer_base.part.0+0x7d7/0x8c0
[   60.743598]  ? __pfx___run_timer_base.part.0+0x10/0x10
[   60.743646]  ? __pfx_read_tsc+0x10/0x10
[   60.743684]  ? ktime_get+0x60/0x140
[   60.743725]  ? lapic_next_event+0x11/0x20
[   60.743764]  ? clockevents_program_event+0x1d4/0x2a0
[   60.743813]  run_timer_softirq+0xd1/0x190
[   60.743852]  handle_softirqs+0x16a/0x550
[   60.743911]  irq_exit_rcu+0xaf/0xe0
[   60.743948]  sysvec_apic_timer_interrupt+0x70/0x80
[   60.744044]  </IRQ>
[   60.744083]  <TASK>
[   60.744108]  asm_sysvec_apic_timer_interrupt+0x1a/0x20
[   60.744335] RIP: 0010:down_write+0x0/0x130
[   60.744907] Code: 89 f7 e8 73 e6 e7 fc e9 bf f9 ff ff 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 90 90 908
[   60.745823] RSP: 0018:ffff88800d86fc18 EFLAGS: 00010282
[   60.747927] RAX: 0000000000000000 RBX: ffff8880095bc3e8 RCX: 0000000000000100
[   60.748058] RDX: 1ffff11001ab2450 RSI: ffff88800a054c58 RDI: ffff88800837be68
[   60.748169] RBP: ffff888009734640 R08: ffffffff8194c204 R09: ffff88806cb090b0
[   60.748281] R10: 00000000000000a0 R11: ffff88800ceeeeb0 R12: ffff88800837be68
[   60.748418] R13: ffff88800a054c58 R14: 0000000000000000 R15: ffffffff81b75f80
[   60.748534]  ? __pfx_sysfs_kf_write+0x10/0x10
[   60.748606]  ? kasan_save_stack+0x24/0x50
[   60.748728]  kernfs_remove_by_name_ns+0x81/0x110
[   60.748779]  pci_remove_resource_files+0x48/0xb0
[   60.748834]  pci_stop_and_remove_bus_device_locked+0x15/0x30
[   60.748878]  remove_store+0xcc/0xe0
[   60.748929]  ? __pfx_remove_store+0x10/0x10
[   60.748999]  ? sysfs_kf_write+0xad/0x1a0
[   60.749044]  kernfs_fop_write_iter+0x2c3/0x440
[   60.749091]  vfs_write+0x871/0xd70
[   60.749143]  ? __pfx_vfs_write+0x10/0x10
[   60.749204]  ? fdget_pos+0x1c8/0x4c0
[   60.749243]  ? lapic_next_event+0x11/0x20
[   60.749278]  ? clockevents_program_event+0x1d4/0x2a0
[   60.749322]  ksys_write+0xee/0x1c0
[   60.749361]  ? __pfx_ksys_write+0x10/0x10
[   60.749414]  do_syscall_64+0xac/0x280
[   60.749460]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[   60.749499] RIP: 0033:0x7fbe1c04cad3
[   60.750304] Code: 0c 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb bb 0f 1f 80 00 00 00 00 64 8b 04 25 18 008
[   60.750348] RSP: 002b:00007ffdb3c76078 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[   60.750737] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007fbe1c04cad3
[   60.750782] RDX: 0000000000000002 RSI: 00000000010467c0 RDI: 0000000000000001
[   60.750816] RBP: 00000000010467c0 R08: 000000000000000a R09: 0000000000000001
[   60.750841] R10: 000000000041204f R11: 0000000000000246 R12: 0000000000000002
[   60.750867] R13: 00007fbe1c11c6a0 R14: 0000000000000002 R15: 00007fbe1c1178a0
[   60.750924]  </TASK>
[   60.751106]
[   60.763864] Allocated by task 1:
[   60.764506]  kasan_save_stack+0x24/0x50
[   60.765396]  kasan_save_track+0x14/0x30
[   60.765858]  __kasan_kmalloc+0x7f/0x90
[   60.766098]  __kmalloc_noprof+0x1be/0x460
[   60.766452]  flexcop_device_kmalloc+0x54/0xe0
[   60.766698]  flexcop_pci_probe+0x1f/0x9d0
[   60.767020]  local_pci_probe+0xdc/0x190
[   60.767283]  pci_device_probe+0x2fe/0x470
[   60.767499]  really_probe+0x1ca/0x5c0
[   60.767729]  __driver_probe_device+0x248/0x310
[   60.767953]  driver_probe_device+0x44/0x120
[   60.768262]  __driver_attach+0xd2/0x310
[   60.768457]  bus_for_each_dev+0xed/0x170
[   60.768629]  bus_add_driver+0x208/0x500
[   60.768829]  driver_register+0x132/0x460
[   60.769077]  do_one_initcall+0x89/0x300
[   60.769361]  kernel_init_freeable+0x40d/0x720
[   60.769623]  kernel_init+0x1a/0x150
[   60.769847]  ret_from_fork+0x10c/0x1a0
[   60.770139]  ret_from_fork_asm+0x1a/0x30
[   60.770480]
[   60.770674] Freed by task 135:
[   60.770890]  kasan_save_stack+0x24/0x50
[   60.771135]  kasan_save_track+0x14/0x30
[   60.771354]  kasan_save_free_info+0x3a/0x60
[   60.771581]  __kasan_slab_free+0x3f/0x50
[   60.771824]  kfree+0x137/0x370
[   60.772023]  flexcop_device_kfree+0x32/0x50
[   60.772254]  pci_device_remove+0xa6/0x1d0
[   60.772492]  device_release_driver_internal+0xf8/0x210
[   60.772774]  pci_stop_bus_device+0x105/0x150
[   60.772992]  pci_stop_and_remove_bus_device_locked+0x15/0x30
[   60.773272]  remove_store+0xcc/0xe0
[   60.773473]  kernfs_fop_write_iter+0x2c3/0x440
[   60.773731]  vfs_write+0x871/0xd70
[   60.773933]  ksys_write+0xee/0x1c0
[   60.774151]  do_syscall_64+0xac/0x280
[   60.774382]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
...

Replace cancel_delayed_work() with cancel_delayed_work_sync() to ensure
that the delayed work item is properly canceled and any executing delayed
work has finished before the device memory is deallocated.

Fixes: 382c5546d618 ("V4L/DVB (10694): [PATCH] software IRQ watchdog for Flexcop B2C2 DVB PCI cards")
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 drivers/media/pci/b2c2/flexcop-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/b2c2/flexcop-pci.c b/drivers/media/pci/b2c2/flexcop-pci.c
index 486c8ec0fa60..ab53c5b02c48 100644
--- a/drivers/media/pci/b2c2/flexcop-pci.c
+++ b/drivers/media/pci/b2c2/flexcop-pci.c
@@ -411,7 +411,7 @@ static void flexcop_pci_remove(struct pci_dev *pdev)
 	struct flexcop_pci *fc_pci = pci_get_drvdata(pdev);
 
 	if (irq_chk_intv > 0)
-		cancel_delayed_work(&fc_pci->irq_check_work);
+		cancel_delayed_work_sync(&fc_pci->irq_check_work);
 
 	flexcop_pci_dma_exit(fc_pci);
 	flexcop_device_exit(fc_pci->fc_dev);
-- 
2.34.1


