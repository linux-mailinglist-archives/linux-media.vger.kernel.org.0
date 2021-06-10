Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 562643A2733
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 10:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbhFJIjE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 04:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbhFJIjD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 04:39:03 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0C6C061574;
        Thu, 10 Jun 2021 01:37:07 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id g6so1017050pfq.1;
        Thu, 10 Jun 2021 01:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=BYzneVRTchqVV1zpNyvC8n1HUVYTmsXKKmbtKhzdA60=;
        b=B/wmHR0fwQtXS4VUSoHnTOnH8kzwdjesVP5cG+CT3Nj2AE5Cw8xZA8DUgNEizT+3af
         R2MyPRWgkz0E59gSqzOTNmObjiQ2GTxgSgmyHsd7nLzR9XAxap63t8SE2GiNFtQ6hVMM
         OpoUeYrVSiPdFbRYhg8Z7YZl6O/5Uh4es8PX5q1PFxeEvX/DUVoYqkpqwi+3b+Hw1Cjb
         kYpa5SclFIqELPKWQ7uskrVWW7Rg41+Vrqjv4cs+TwehTxf2mCc978iLNFS5yZGAvcXi
         Vxa+ujtZwpRbNGwwOCE9Wn39dV0hBSCCrMhouhusbBdW048A/g33lfugf7szeiL05E+c
         MhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BYzneVRTchqVV1zpNyvC8n1HUVYTmsXKKmbtKhzdA60=;
        b=jaQlrIEQ3gtg5XH/9FXTOXSqi3fSZp/EdnGdbooFp7JlnUvcLrK7qf+HbBixd9kLEA
         1svOkoJGK4MUTLp9oc6ZXeBHqdIlXkSz6M4PKrIaCRmzx4FbvEj+wV+MpXWQogXstuHv
         rWznlX6W610C+njX5wUarpRkjfocudp6HhGGTWtqJxhSVWhm4SmorRG0dFeE8KL2S81T
         q9fCO8YC1//H2tG29Gf9/9VklvIaLwV4dWl5v5PkiCdYxPOYY+JyvbLijdYDwizxHfzn
         I+t0poJR4U86txE2gE1VvInt/yivnIOdX4aWcbQBDQWKZqrdCBfprgyk/WSAq4yFnPyz
         2AoQ==
X-Gm-Message-State: AOAM530RRYXGGr16IqEY7KfPbW5tYes5efWAXJzg6owsSvtgwU9dyqQQ
        ooL7UTSgkypkL/LzPFTYFw==
X-Google-Smtp-Source: ABdhPJy/s51m6asIKf5vNjdOTjKFgJlgJJAUQTKVflemdhKTZaJhp31EYbElmphyMq0N1eiFd7rjHQ==
X-Received: by 2002:a05:6a00:1685:b029:2da:df4b:b8b with SMTP id k5-20020a056a001685b02902dadf4b0b8bmr1974109pfc.16.1623314227222;
        Thu, 10 Jun 2021 01:37:07 -0700 (PDT)
Received: from vultr.guest ([107.191.53.97])
        by smtp.gmail.com with ESMTPSA id p7sm1785724pfb.45.2021.06.10.01.37.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jun 2021 01:37:06 -0700 (PDT)
From:   Zheyu Ma <zheyuma97@gmail.com>
To:     mchehab@kernel.org
Cc:     sean@mess.org, zheyuma97@gmail.com, arnd@arndb.de,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] media: b2c2: Add missing check in flexcop_pci_isr:
Date:   Thu, 10 Jun 2021 08:36:57 +0000
Message-Id: <1623314217-14459-1-git-send-email-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A out-of-bounds bug can be triggered by an interrupt, the reason for
this bug is the lack of checking of register values.

In flexcop_pci_isr, the driver reads value from a register and uses it as
a dma address. Finally, this address will be passed to the count parameter
of find_next_packet. If this value is larger than the size of dma, the
index of buffer will be out-of-bounds.

Fix this by adding a check after reading the value of the register.

The following KASAN report reveals it:

BUG: KASAN: slab-out-of-bounds in find_next_packet
drivers/media/dvb-core/dvb_demux.c:528 [inline]
BUG: KASAN: slab-out-of-bounds in _dvb_dmx_swfilter
drivers/media/dvb-core/dvb_demux.c:572 [inline]
BUG: KASAN: slab-out-of-bounds in dvb_dmx_swfilter+0x3fa/0x420
drivers/media/dvb-core/dvb_demux.c:603
Read of size 1 at addr ffff8880608c00a0 by task swapper/2/0

CPU: 2 PID: 0 Comm: swapper/2 Not tainted 4.19.177-gdba4159c14ef #25
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xec/0x156 lib/dump_stack.c:118
 print_address_description+0x78/0x290 mm/kasan/report.c:256
 kasan_report_error mm/kasan/report.c:354 [inline]
 kasan_report+0x25b/0x380 mm/kasan/report.c:412
 __asan_report_load1_noabort+0x19/0x20 mm/kasan/report.c:430
 find_next_packet drivers/media/dvb-core/dvb_demux.c:528 [inline]
 _dvb_dmx_swfilter drivers/media/dvb-core/dvb_demux.c:572 [inline]
 dvb_dmx_swfilter+0x3fa/0x420 drivers/media/dvb-core/dvb_demux.c:603
 flexcop_pass_dmx_data+0x2e/0x40 drivers/media/common/b2c2/flexcop.c:167
 flexcop_pci_isr+0x3d1/0x5d0 drivers/media/pci/b2c2/flexcop-pci.c:212
 __handle_irq_event_percpu+0xfb/0x770 kernel/irq/handle.c:149
 handle_irq_event_percpu+0x79/0x150 kernel/irq/handle.c:189
 handle_irq_event+0xac/0x140 kernel/irq/handle.c:206
 handle_fasteoi_irq+0x232/0x5c0 kernel/irq/chip.c:725
 generic_handle_irq_desc include/linux/irqdesc.h:155 [inline]
 handle_irq+0x230/0x3a0 arch/x86/kernel/irq_64.c:87
 do_IRQ+0xa7/0x1e0 arch/x86/kernel/irq.c:247
 common_interrupt+0xf/0xf arch/x86/entry/entry_64.S:670
 </IRQ>
RIP: 0010:native_safe_halt+0x28/0x30 arch/x86/include/asm/irqflags.h:61
Code: 00 00 55 be 04 00 00 00 48 c7 c7 00 62 2f 8c 48 89 e5 e8 fb 31
e8 f8 8b 05 75 4f 8e 03 85 c0 7e 07 0f 00 2d 8a 61 66 00 fb f4 <5d> c3
90 90 90 90 90 90 0f 1f 44 00 00 55 48 89 e5 41 57 41 56 41
RSP: 0018:ffff88806b71fcc8 EFLAGS: 00000246 ORIG_RAX: ffffffffffffffde
RAX: 0000000000000000 RBX: ffffffff8bde44c8 RCX: ffffffff88a11285
RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffffffff8c2f6200
RBP: ffff88806b71fcc8 R08: fffffbfff185ec40 R09: fffffbfff185ec40
R10: 0000000000000001 R11: fffffbfff185ec40 R12: 0000000000000002
R13: ffffffff8be9d6e0 R14: 0000000000000000 R15: 0000000000000000
 arch_safe_halt arch/x86/include/asm/paravirt.h:94 [inline]
 default_idle+0x6f/0x360 arch/x86/kernel/process.c:557
 arch_cpu_idle+0xf/0x20 arch/x86/kernel/process.c:548
 default_idle_call+0x3b/0x60 kernel/sched/idle.c:93
 cpuidle_idle_call kernel/sched/idle.c:153 [inline]
 do_idle+0x2ab/0x3c0 kernel/sched/idle.c:263
 cpu_startup_entry+0xcb/0xe0 kernel/sched/idle.c:369
 start_secondary+0x3b8/0x4e0 arch/x86/kernel/smpboot.c:271
 secondary_startup_64+0xa4/0xb0 arch/x86/kernel/head_64.S:243

Allocated by task 1:
 save_stack+0x43/0xd0 mm/kasan/kasan.c:448
 set_track mm/kasan/kasan.c:460 [inline]
 kasan_kmalloc+0xad/0xe0 mm/kasan/kasan.c:553
 kasan_slab_alloc+0x11/0x20 mm/kasan/kasan.c:490
 slab_post_alloc_hook mm/slab.h:445 [inline]
 slab_alloc_node mm/slub.c:2741 [inline]
 slab_alloc mm/slub.c:2749 [inline]
 kmem_cache_alloc+0xeb/0x280 mm/slub.c:2754
 kmem_cache_zalloc include/linux/slab.h:699 [inline]
 __kernfs_new_node+0xe2/0x6f0 fs/kernfs/dir.c:633
 kernfs_new_node+0x9a/0x120 fs/kernfs/dir.c:693
 __kernfs_create_file+0x5f/0x340 fs/kernfs/file.c:992
 sysfs_add_file_mode_ns+0x22a/0x4e0 fs/sysfs/file.c:306
 create_files fs/sysfs/group.c:63 [inline]
 internal_create_group+0x34e/0xc30 fs/sysfs/group.c:147
 sysfs_create_group fs/sysfs/group.c:173 [inline]
 sysfs_create_groups+0x9c/0x140 fs/sysfs/group.c:200
 driver_add_groups+0x3e/0x50 drivers/base/driver.c:129
 bus_add_driver+0x3a5/0x790 drivers/base/bus.c:684
 driver_register+0x1cd/0x410 drivers/base/driver.c:170
 __pci_register_driver+0x197/0x200 drivers/pci/pci-driver.c:1411
 cx88_audio_pci_driver_init+0x23/0x25 drivers/media/pci/cx88/cx88-alsa.c:
 1017
 do_one_initcall+0xe0/0x610 init/main.c:884
 do_initcall_level init/main.c:952 [inline]
 do_initcalls init/main.c:960 [inline]
 do_basic_setup init/main.c:978 [inline]
 kernel_init_freeable+0x4d0/0x592 init/main.c:1145
 kernel_init+0x18/0x190 init/main.c:1062
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:415

Freed by task 0:
(stack is not available)

The buggy address belongs to the object at ffff8880608c0000
 which belongs to the cache kernfs_node_cache of size 160
The buggy address is located 0 bytes to the right of
 160-byte region [ffff8880608c0000, ffff8880608c00a0)
The buggy address belongs to the page:
page:ffffea0001823000 count:1 mapcount:0 mapping:ffff88806bed1e00
index:0x0 compound_mapcount: 0
flags: 0x100000000008100(slab|head)
raw: 0100000000008100 dead000000000100 dead000000000200 ffff88806bed1e00
raw: 0000000000000000 0000000000240024 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8880608bff80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff8880608c0000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff8880608c0080: 00 00 00 00 fc fc fc fc fc fc fc fc 00 00 00 00
                               ^
 ffff8880608c0100: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff8880608c0180: fc fc fc fc fc fc fc fc 00 00 00 00 00 00 00 00
==================================================================

Reported-by: Zheyu Ma <zheyuma97@gmail.com>
Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/media/pci/b2c2/flexcop-pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/pci/b2c2/flexcop-pci.c b/drivers/media/pci/b2c2/flexcop-pci.c
index 6a4c7cb0ad0f..b03704c11a41 100644
--- a/drivers/media/pci/b2c2/flexcop-pci.c
+++ b/drivers/media/pci/b2c2/flexcop-pci.c
@@ -185,6 +185,8 @@ static irqreturn_t flexcop_pci_isr(int irq, void *dev_id)
 		dma_addr_t cur_addr =
 			fc->read_ibi_reg(fc,dma1_008).dma_0x8.dma_cur_addr << 2;
 		u32 cur_pos = cur_addr - fc_pci->dma[0].dma_addr0;
+		if (cur_pos > fc_pci->dma[0].size*2)
+			goto error;
 
 		deb_irq("%u irq: %08x cur_addr: %llx: cur_pos: %08x, last_cur_pos: %08x ",
 				jiffies_to_usecs(jiffies - fc_pci->last_irq),
@@ -225,6 +227,7 @@ static irqreturn_t flexcop_pci_isr(int irq, void *dev_id)
 		ret = IRQ_NONE;
 	}
 
+error:
 	spin_unlock_irqrestore(&fc_pci->irq_lock, flags);
 	return ret;
 }
-- 
2.17.1

