Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 396EA1FF122
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 14:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729004AbgFRMDG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 08:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729089AbgFRMDB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 08:03:01 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18CFCC0613ED
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 05:03:01 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id s10so2837605pgm.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 05:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nWsuqg7Yu66mT/q/JxKo0HVLhXwrAmGtoYvK3Kwvd34=;
        b=g3rwUct3JlKyyE41P9BrhIl5b/TYy8JXLYVzjhRszHQsBPkIwuqqQHFDDxCVa76xZo
         zB4KBMBEwyLjZFkbJiC9LvOwu3FO7RS1PY4YzK1V2/wnv0mq9j5QroOQjJFowKByki4O
         sCl4qinV6odwzZkZu857UYHyZJTeNFGJYeBUATfGPc6to4Zd/+92PhvlLWEzt07cRErT
         7kwkIApVwIFV2At/8jEihlTwo0HqihrDDNkbBrPXGiMiTCt4FAjPVOuvL/kiINnn6D3V
         lKzdbcuJzs9UTTprBIfp7W3NER9a6i3nK2xpXa06PzvrGebCgxFcZp/1UfmuCsTTDKcY
         7tRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nWsuqg7Yu66mT/q/JxKo0HVLhXwrAmGtoYvK3Kwvd34=;
        b=I/o3crq8zWOuSYMIyE3iGWcyWyBYIf81ADYkQ9amhuB7lppyILPQI+3ryH8sFwc6An
         SmZ6JusBhZY49MojQ605NDzlEghAlqjTbq4sJPixg2hJFHkDxXCIABC7cgopNB7qqbMA
         gRCqdATpknFNjKYU3+j+sOeWZK/S2md+v8BW8ZK1+FB5CXsJlb/R+IUAhBswokS6cnPF
         eya4wUo5PsMSl/ncOwP46ELYMXgml8mwU+R/FzXpyk2hu6I57w2vM8313yrmHRlXX20o
         O/jkodmVV7sAv5uKnB5h8Mc5amX8pUMBgpsLU5pfUu1G5OfOe1+dz/uT2d7oAzqN8g8n
         SHaA==
X-Gm-Message-State: AOAM5316ce+t7IeOSWXbsokvpnJgGGcHdvoVl7wGTa7i6QdF5raGqs0+
        tF9rkEx0688ajhAM0VhBH6cdlIr4NOOz9cIvhQvR/w==
X-Google-Smtp-Source: ABdhPJwxF6MYYIG0+EL3146IGDe2TsGe+QFklONLxF4+OUcIDaB/S2RR9gOt335djci39/WpnZlUAl+/sR9oMHKg7y8=
X-Received: by 2002:a63:480d:: with SMTP id v13mr3148877pga.286.1592481779991;
 Thu, 18 Jun 2020 05:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000043d7e6058fea8482@google.com>
In-Reply-To: <00000000000043d7e6058fea8482@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 18 Jun 2020 14:02:49 +0200
Message-ID: <CAAeHK+xwO2t4BaCD1-NAp_a4-Zuzcey2070eLuUN7Y1XTVaZ_A@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Read in mceusb_dev_recv
To:     syzbot <syzbot+c7fdb6cb36e65f2fe8c9@syzkaller.appspotmail.com>
Cc:     as1033x@comcast.net, brad@nextdimension.cc,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Richard Fontana <rfontana@redhat.com>,
        Sean Young <sean@mess.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 12, 2019 at 2:18 PM syzbot
<syzbot+c7fdb6cb36e65f2fe8c9@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=13e270e2600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
> dashboard link: https://syzkaller.appspot.com/bug?extid=c7fdb6cb36e65f2fe8c9
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15b73802600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=161b8cd2600000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+c7fdb6cb36e65f2fe8c9@syzkaller.appspotmail.com
>
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in mceusb_handle_command
> drivers/media/rc/mceusb.c:1080 [inline]
> BUG: KASAN: slab-out-of-bounds in mceusb_process_ir_data
> drivers/media/rc/mceusb.c:1171 [inline]
> BUG: KASAN: slab-out-of-bounds in mceusb_dev_recv+0x1014/0x12e0
> drivers/media/rc/mceusb.c:1254
> Read of size 1 at addr ffff8881d5357880 by task swapper/1/0
>
> CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.3.0-rc2+ #25
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Call Trace:
>   <IRQ>
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xca/0x13e lib/dump_stack.c:113
>   print_address_description+0x6a/0x32c mm/kasan/report.c:351
>   __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
>   kasan_report+0xe/0x12 mm/kasan/common.c:612
>   mceusb_handle_command drivers/media/rc/mceusb.c:1080 [inline]
>   mceusb_process_ir_data drivers/media/rc/mceusb.c:1171 [inline]
>   mceusb_dev_recv+0x1014/0x12e0 drivers/media/rc/mceusb.c:1254
>   __usb_hcd_giveback_urb+0x1f2/0x470 drivers/usb/core/hcd.c:1757
>   usb_hcd_giveback_urb+0x368/0x420 drivers/usb/core/hcd.c:1822
>   dummy_timer+0x120f/0x2fa2 drivers/usb/gadget/udc/dummy_hcd.c:1965
>   call_timer_fn+0x179/0x650 kernel/time/timer.c:1322
>   expire_timers kernel/time/timer.c:1366 [inline]
>   __run_timers kernel/time/timer.c:1685 [inline]
>   __run_timers kernel/time/timer.c:1653 [inline]
>   run_timer_softirq+0x5cc/0x14b0 kernel/time/timer.c:1698
>   __do_softirq+0x221/0x912 kernel/softirq.c:292
>   invoke_softirq kernel/softirq.c:373 [inline]
>   irq_exit+0x178/0x1a0 kernel/softirq.c:413
>   exiting_irq arch/x86/include/asm/apic.h:537 [inline]
>   smp_apic_timer_interrupt+0x12f/0x500 arch/x86/kernel/apic/apic.c:1095
>   apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:828
>   </IRQ>
> RIP: 0010:default_idle+0x28/0x2e0 arch/x86/kernel/process.c:581
> Code: 90 90 41 56 41 55 65 44 8b 2d 54 fa 93 7a 41 54 55 53 0f 1f 44 00 00
> e8 76 7f d5 fb e9 07 00 00 00 0f 00 2d 6a 9f 54 00 fb f4 <65> 44 8b 2d 30
> fa 93 7a 0f 1f 44 00 00 5b 5d 41 5c 41 5d 41 5e c3
> RSP: 0018:ffff8881da217dc8 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
> RAX: 0000000000000007 RBX: ffff8881da1fb000 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000006 RDI: ffff8881da1fb844
> RBP: ffffed103b43f600 R08: ffff8881da1fb000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
> R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000000
>   cpuidle_idle_call kernel/sched/idle.c:154 [inline]
>   do_idle+0x3c2/0x4f0 kernel/sched/idle.c:263
>   cpu_startup_entry+0x14/0x20 kernel/sched/idle.c:354
>   start_secondary+0x297/0x340 arch/x86/kernel/smpboot.c:264
>   secondary_startup_64+0xa4/0xb0 arch/x86/kernel/head_64.S:241
>
> Allocated by task 21:
>   save_stack+0x1b/0x80 mm/kasan/common.c:69
>   set_track mm/kasan/common.c:77 [inline]
>   __kasan_kmalloc mm/kasan/common.c:487 [inline]
>   __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:460
>   kmalloc include/linux/slab.h:557 [inline]
>   hcd_buffer_alloc+0x1ca/0x290 drivers/usb/core/buffer.c:135
>   usb_alloc_coherent+0x5d/0x80 drivers/usb/core/usb.c:910
>   mceusb_dev_probe+0x714/0x2f20 drivers/media/rc/mceusb.c:1576
>   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
>   really_probe+0x281/0x650 drivers/base/dd.c:548
>   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
>   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:882
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2114
>   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
>   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
>   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
>   really_probe+0x281/0x650 drivers/base/dd.c:548
>   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
>   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:882
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2114
>   usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
>   hub_port_connect drivers/usb/core/hub.c:5098 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
>   port_event drivers/usb/core/hub.c:5359 [inline]
>   hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> Freed by task 1:
>   save_stack+0x1b/0x80 mm/kasan/common.c:69
>   set_track mm/kasan/common.c:77 [inline]
>   __kasan_slab_free+0x130/0x180 mm/kasan/common.c:449
>   slab_free_hook mm/slub.c:1423 [inline]
>   slab_free_freelist_hook mm/slub.c:1470 [inline]
>   slab_free mm/slub.c:3012 [inline]
>   kfree+0xe4/0x2f0 mm/slub.c:3953
>   akcipher_request_free include/crypto/akcipher.h:210 [inline]
>   public_key_verify_signature+0x874/0xc40
> crypto/asymmetric_keys/public_key.c:314
>   x509_check_for_self_signed+0x33c/0x560
> crypto/asymmetric_keys/x509_public_key.c:132
>   x509_cert_parse+0x61e/0x8a0 crypto/asymmetric_keys/x509_cert_parser.c:135
>   x509_key_preparse+0x61/0x8e0 crypto/asymmetric_keys/x509_public_key.c:165
>   asymmetric_key_preparse+0xab/0x110
> crypto/asymmetric_keys/asymmetric_type.c:385
>   key_create_or_update+0x32e/0xb30 security/keys/key.c:857
>   load_keys_from_buffer net/wireless/reg.c:742 [inline]
>   load_builtin_regdb_keys net/wireless/reg.c:780 [inline]
>   regulatory_init_db+0x29b/0x45b net/wireless/reg.c:3916
>   do_one_initcall+0xf0/0x614 init/main.c:939
>   do_initcall_level init/main.c:1007 [inline]
>   do_initcalls init/main.c:1015 [inline]
>   do_basic_setup init/main.c:1032 [inline]
>   kernel_init_freeable+0x4a9/0x596 init/main.c:1192
>   kernel_init+0xd/0x1bf init/main.c:1110
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> The buggy address belongs to the object at ffff8881d5357780
>   which belongs to the cache kmalloc-256 of size 256
> The buggy address is located 0 bytes to the right of
>   256-byte region [ffff8881d5357780, ffff8881d5357880)
> The buggy address belongs to the page:
> page:ffffea000754d5c0 refcount:1 mapcount:0 mapping:ffff8881da002780
> index:0x0
> flags: 0x200000000000200(slab)
> raw: 0200000000000200 ffffea000754cac0 0000000500000005 ffff8881da002780
> raw: 0000000000000000 00000000000c000c 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>   ffff8881d5357780: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   ffff8881d5357800: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > ffff8881d5357880: fc fc fc fc fc fc fc fc 00 00 00 00 00 00 00 00
>                     ^
>   ffff8881d5357900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   ffff8881d5357980: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
> ==================================================================
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this bug, for details see:
> https://goo.gl/tpsmEJ#testing-patches

Closing old USB bugs that haven't happened for a long time.

#syz invalid
