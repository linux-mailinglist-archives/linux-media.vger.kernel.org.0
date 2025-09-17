Return-Path: <linux-media+bounces-42656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2015B7D822
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 14:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73EBA325AF8
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 10:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE00F34DCDD;
	Wed, 17 Sep 2025 09:59:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F09B30C341;
	Wed, 17 Sep 2025 09:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758103183; cv=none; b=DV8O4ielYA3K/d2kg4Vst2BYOlk4gCdG4tBuvuEIF90K2d3N/f7G5gj+4cwLouex3vo7joQybU4p2jxTx8KhAqOieEGBQod+d2434/X5UJKLiFoucIinQME3ePqPBdd7fqw9JuKp72eV3548buuwV8NeVHBYaJ6c41pV5uljP9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758103183; c=relaxed/simple;
	bh=0Giy6+4iUL9MvNTjLoplBZjg9dOsb9KnyA0sVTN34Uk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UlbfG0o0WVWESpXrNMDh9OZn82osAVwpGm+rQ0S6hUH++jBr0JEw2oy6r/3XKmexdCik4ZQMYvccbKqoteVFFuXlirZj+WeU05FHYMYuYhFBLXxFhxjVTX/qsG97LSXGXlxy5quxMvjZJA0f3oJS32ph0OiiStEArvBhjZ62+50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [106.117.98.100])
	by mtasvr (Coremail) with SMTP id _____wB3L1aDhspoO_BDAg--.6088S3;
	Wed, 17 Sep 2025 17:59:31 +0800 (CST)
Received: from ubuntu.localdomain (unknown [106.117.98.100])
	by mail-app1 (Coremail) with SMTP id yy_KCgCHCNF_hspoTKslAg--.17865S2;
	Wed, 17 Sep 2025 17:59:30 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH RESEND] media: b2c2: Fix use-after-free causing by irq_check_work in flexcop_pci_remove
Date: Wed, 17 Sep 2025 17:59:26 +0800
Message-Id: <20250917095926.15024-1-duoming@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:yy_KCgCHCNF_hspoTKslAg--.17865S2
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwcMAWjJvXsO9QAJsc
X-CM-DELIVERINFO: =?B?S6ssLgXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR12iKd4jvNs88B+wbnYVjPMmV7sT+aJ5LQQikwe3C7LYK+RLuxX0yIk+nYCurx9pIZ8wq
	+tJujV6Fgi6rC5dpJmHB/9WAV9Rtg1syeINJy1T6UK0pMjzUrtEW+zP8/mmapg==
X-Coremail-Antispam: 1Uk129KBj93XoWxGw13CF1fuw1Dur4Utr4DWrX_yoWrWFW8pr
	Z8u34fJryUJryUXr47Aw10vF1UJa93t34Ykrn2kw1SgF4fWr1ava45K3Wv9F1UGFWvyFyf
	Aa4Utr9rXF1DKabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZE
	Xa7IU8c4S7UUUUU==

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

==================================================================
BUG: KASAN: slab-use-after-free in __run_timer_base.part.0+0x7d7/0x8c0
Write of size 8 at addr ffff8880093aa8c8 by task bash/135
...
Call Trace:
 <IRQ>
 dump_stack_lvl+0x55/0x70
 print_report+0xcf/0x610
 ? __run_timer_base.part.0+0x7d7/0x8c0
 kasan_report+0xb8/0xf0
 ? __run_timer_base.part.0+0x7d7/0x8c0
 __run_timer_base.part.0+0x7d7/0x8c0
 ? __pfx___run_timer_base.part.0+0x10/0x10
 ? __pfx_read_tsc+0x10/0x10
 ? ktime_get+0x60/0x140
 ? lapic_next_event+0x11/0x20
 ? clockevents_program_event+0x1d4/0x2a0
 run_timer_softirq+0xd1/0x190
 handle_softirqs+0x16a/0x550
 irq_exit_rcu+0xaf/0xe0
 sysvec_apic_timer_interrupt+0x70/0x80
 </IRQ>
...

Allocated by task 1:
 kasan_save_stack+0x24/0x50
 kasan_save_track+0x14/0x30
 __kasan_kmalloc+0x7f/0x90
 __kmalloc_noprof+0x1be/0x460
 flexcop_device_kmalloc+0x54/0xe0
 flexcop_pci_probe+0x1f/0x9d0
 local_pci_probe+0xdc/0x190
 pci_device_probe+0x2fe/0x470
 really_probe+0x1ca/0x5c0
 __driver_probe_device+0x248/0x310
 driver_probe_device+0x44/0x120
 __driver_attach+0xd2/0x310
 bus_for_each_dev+0xed/0x170
 bus_add_driver+0x208/0x500
 driver_register+0x132/0x460
 do_one_initcall+0x89/0x300
 kernel_init_freeable+0x40d/0x720
 kernel_init+0x1a/0x150
 ret_from_fork+0x10c/0x1a0
 ret_from_fork_asm+0x1a/0x30

Freed by task 135:
 kasan_save_stack+0x24/0x50
 kasan_save_track+0x14/0x30
 kasan_save_free_info+0x3a/0x60
 __kasan_slab_free+0x3f/0x50
 kfree+0x137/0x370
 flexcop_device_kfree+0x32/0x50
 pci_device_remove+0xa6/0x1d0
 device_release_driver_internal+0xf8/0x210
 pci_stop_bus_device+0x105/0x150
 pci_stop_and_remove_bus_device_locked+0x15/0x30
 remove_store+0xcc/0xe0
 kernfs_fop_write_iter+0x2c3/0x440
 vfs_write+0x871/0xd70
 ksys_write+0xee/0x1c0
 do_syscall_64+0xac/0x280
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
...

Replace cancel_delayed_work() with cancel_delayed_work_sync() to ensure
that the delayed work item is properly canceled and any executing delayed
work has finished before the device memory is deallocated.

This bug was initially identified through static analysis. To reproduce
and test it, I simulated the B2C2 FlexCop PCI device in QEMU and introduced
artificial delays within the flexcop_pci_irq_check_work() function to
increase the likelihood of triggering the bug.

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


