Return-Path: <linux-media+bounces-24619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C3BA09278
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 14:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A810118815E2
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 13:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A40C20E70B;
	Fri, 10 Jan 2025 13:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NDWjl/5W"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF7120E015
	for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 13:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516875; cv=none; b=sZZHBJ62uOQUPXyBTbCTWaaHsCijoxNibZRhDEC4UCyz5T05PO1eUA0wCFiUqsu3ck9bOCFYQnfsHfHlQSqcfGJEQGj14Utmg7VpB6FIGHAexj/nR1FG8zYmJzcJvRAlByuIqGNatYVSMWFg8Qu618FhUow2YXDvJ+vE90RUy7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516875; c=relaxed/simple;
	bh=Z5Ql2U5U7sJvxHcSfbMoVs8BEZQ2rv/xbQ++Y3EOxtg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pgUw0JJC3V6JQs7vUzhlM2MZdyJ2FssI2heQ/S0t/GYjPg9alr3W1vmaYgzomsjEyFlhToAwbOjquXlpbf3GhOxBN/XCWjBFRtTSmmFxnkPucIRNcugYJyHvJAB+j8qFsyBk6RNgNd8sK5BZ8Wuca/Z1p/eG04YCym0OpD9WUJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NDWjl/5W; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30229d5b21cso18355361fa.1
        for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 05:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736516871; x=1737121671; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/6/XuGAHPUGODj82EGAuZPzzoJ9xJGKEzt/GXVcJdws=;
        b=NDWjl/5WJ1IKvQxz/Jg+mcLa92nQ1bTHnO1j4wunuTNuFTIbqmJvBM1W07tMLYX5ae
         WVzw3QziSHVGdKy2KO18rgNLaNpBTTpa47Wq9eSg8pM6nXekTf1mndQ9HR+aQ70CFW0O
         xxt2dl+0LO/7jM1FvcerVGHSwmcmIctrNqZs2HG0E9IyBeNuJbfOpJtF3cpLIk6jsY0n
         qsLok/KFD6b3S4JaZguM63QPSf3vZ3woft9WdEqZv5Qkz+M3gFSCvNoYpNimgWRQB+7p
         A9uU3Nb/BODEzR9dqFpWABlqJbpWiL+FvvwgKCTTfQejl6vFkINe3ndqNI6p5D7ISG3N
         Lyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736516871; x=1737121671;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/6/XuGAHPUGODj82EGAuZPzzoJ9xJGKEzt/GXVcJdws=;
        b=ekZto/b+zi2CoXiJI+CgWrWaPE3HhTrlACdUn4B29nnEDUJStGXEf19CEqZwZheDwO
         dMi2+qHxuNcaJWkPKmnIAWtxk+NltEMmNKqGEnAMc/ednLiH1wbfnL83WSZYwwBnNyGz
         rsNDkRQigVRCK69+S0S2kN4vnZRsP+qieCXnBbUcVDGgoDfg4hLUQ6ByohQmYopnTX3p
         0lMCuMctJkQ3FAmxveIf0WJkQao30hoE8OMRvqNOPI9jtk1nSMc+D1H1QAH1nJBBh4nL
         FX4p6i2LYzni+9nJnE38kVOWFFYyX4ApYZR07Ni+KAYUq79rMk8J7YVjvrA1zIImvoEo
         pegw==
X-Forwarded-Encrypted: i=1; AJvYcCUjR+hI3Z6gm/DKy7N29BtKzYGjLOHg5j7A+tP+YYcdAs7jM9TqmQ5j9aHtw3rzN97+6vYBKenbwFa9BA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnbDa3bLm0KEXOiDakfiA3BjskVhY8wNWlPHiPJxOCvuA2iEa6
	fnMiy5belCghv5/0B8IjuoLSE1RUwB1w65uNlo2kYY0bq7lvXpyy4A76/ewCMMGRqe/R20cPOtb
	Iv3waFA3s/TMycH4vnMQ4aZOAYO2jqhkPSuc0
X-Gm-Gg: ASbGncuSzx2fWlx0J8IiERUl8RqwS0hKMUeZKtAK56iBEGrItmVQSxor7vyZMHY5iL0
	QW74cHeoftfHJbiUF3Ncf184RABIa7PZwz80vF6x7LAq6cnFka10uDnjqJL5OQRccei8EFqA=
X-Google-Smtp-Source: AGHT+IEI2dyPCpz8pPYye/CKN42SpM3gI6sDMhVVUA6mnM1K48r7NIN38R1uTQJcWEYBanA+cNHFK8T0t4r4UjowoH0=
X-Received: by 2002:a2e:be09:0:b0:302:1c90:58de with SMTP id
 38308e7fff4ca-305f45efb15mr36659941fa.33.1736516870874; Fri, 10 Jan 2025
 05:47:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67812439.050a0220.216c54.0010.GAE@google.com>
In-Reply-To: <67812439.050a0220.216c54.0010.GAE@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 10 Jan 2025 14:47:39 +0100
X-Gm-Features: AbW1kvaZGG5JVf3wL5un2NlivPtOF68x8pdL4QQ-8m8lhcmA3q6JB810kq9lWPk
Message-ID: <CACT4Y+YvxZoT9j_MxeKQH1nytWLPECQkKsF-TRrko1qurikhTA@mail.gmail.com>
Subject: Re: [syzbot] [media?] KASAN: use-after-free Read in em28xx_v4l2_open
To: syzbot <syzbot+f49137d13c521670729e@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jan 2025 at 14:44, syzbot
<syzbot+f49137d13c521670729e@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    f1a2241778d9 usb: typec: ucsi: Implement ChromeOS UCSI dri..
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=17424edf980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=e27867f71e8bc406
> dashboard link: https://syzkaller.appspot.com/bug?extid=f49137d13c521670729e
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/637d8b06e4f6/disk-f1a22417.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/c3511b47d743/vmlinux-f1a22417.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/d923c98af39e/bzImage-f1a22417.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+f49137d13c521670729e@syzkaller.appspotmail.com
>
> ==================================================================
> BUG: KASAN: use-after-free in __mutex_waiter_is_first kernel/locking/mutex.c:172 [inline]
> BUG: KASAN: use-after-free in __mutex_lock_common kernel/locking/mutex.c:667 [inline]
> BUG: KASAN: use-after-free in __mutex_lock+0x96b/0xa60 kernel/locking/mutex.c:735
> Read of size 8 at addr ffff888123869b30 by task v4l_id/28455
>
> CPU: 0 UID: 0 PID: 28455 Comm: v4l_id Not tainted 6.13.0-rc4-syzkaller-00080-gf1a2241778d9 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
>  print_address_description mm/kasan/report.c:378 [inline]
>  print_report+0xc3/0x620 mm/kasan/report.c:489
>  kasan_report+0xd9/0x110 mm/kasan/report.c:602
>  __mutex_waiter_is_first kernel/locking/mutex.c:172 [inline]
>  __mutex_lock_common kernel/locking/mutex.c:667 [inline]
>  __mutex_lock+0x96b/0xa60 kernel/locking/mutex.c:735
>  em28xx_v4l2_open+0x22c/0x7e0 drivers/media/usb/em28xx/em28xx-video.c:2150

Does the file hold reference to the device?

I am not an expert on this code, but:

static const struct video_device em28xx_video_template = {
....
        .release        = video_device_release_empty,
};

void video_device_release_empty(struct video_device *vdev)
{
        /* Do nothing */
        /* Only valid when the video_device struct is a static. */
}

And it does not look like a static device.


>  v4l2_open+0x222/0x490 drivers/media/v4l2-core/v4l2-dev.c:429
>  chrdev_open+0x237/0x6a0 fs/char_dev.c:414
>  do_dentry_open+0x6cb/0x1390 fs/open.c:945
>  vfs_open+0x82/0x3f0 fs/open.c:1075
>  do_open fs/namei.c:3828 [inline]
>  path_openat+0x1e6a/0x2d60 fs/namei.c:3987
>  do_filp_open+0x20c/0x470 fs/namei.c:4014
>  do_sys_openat2+0x17a/0x1e0 fs/open.c:1402
>  do_sys_open fs/open.c:1417 [inline]
>  __do_sys_openat fs/open.c:1433 [inline]
>  __se_sys_openat fs/open.c:1428 [inline]
>  __x64_sys_openat+0x175/0x210 fs/open.c:1428
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f9e668f39a4
> Code: 24 20 48 8d 44 24 30 48 89 44 24 28 64 8b 04 25 18 00 00 00 85 c0 75 2c 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3d 00 f0 ff ff 76 60 48 8b 15 55 a4 0d 00 f7 d8 64 89 02 48 83
> RSP: 002b:00007ffc1b3c97a0 EFLAGS: 00000246
>  ORIG_RAX: 0000000000000101
> RAX: ffffffffffffffda RBX: 00007ffc1b3c99b8 RCX: 00007f9e668f39a4
> RDX: 0000000000000000 RSI: 00007ffc1b3caf22 RDI: 00000000ffffff9c
> RBP: 00007ffc1b3caf22 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007ffc1b3c99d0 R14: 000055a2b40c3670 R15: 00007f9e66d42a80
>  </TASK>
>
> The buggy address belongs to the physical page:
> page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888100000004 pfn:0x123869
> flags: 0x200000000000000(node=0|zone=2)
> raw: 0200000000000000 0000000000000000 ffffffffffffffff 0000000000000000
> raw: ffff888100000004 0000000000000000 00000000ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
> page_owner tracks the page as freed
> page last allocated via order 2, migratetype Unmovable, gfp_mask 0x40dc0(GFP_KERNEL|__GFP_COMP|__GFP_ZERO), pid 9, tgid 9 (kworker/0:1), ts 2999230831583, free_ts 3004034271205
>  set_page_owner include/linux/page_owner.h:32 [inline]
>  post_alloc_hook+0x2d1/0x350 mm/page_alloc.c:1558
>  prep_new_page mm/page_alloc.c:1566 [inline]
>  get_page_from_freelist+0xe76/0x2b90 mm/page_alloc.c:3476
>  __alloc_pages_noprof+0x21c/0x22a0 mm/page_alloc.c:4753
>  __alloc_pages_node_noprof include/linux/gfp.h:269 [inline]
>  alloc_pages_node_noprof include/linux/gfp.h:296 [inline]
>  ___kmalloc_large_node+0x84/0x1b0 mm/slub.c:4243
>  __kmalloc_large_noprof+0x1c/0x70 mm/slub.c:4260
>  kmalloc_noprof include/linux/slab.h:898 [inline]
>  kzalloc_noprof include/linux/slab.h:1037 [inline]
>  em28xx_usb_probe+0x1db/0x3720 drivers/media/usb/em28xx/em28xx-cards.c:3908
>  usb_probe_interface+0x300/0x9c0 drivers/usb/core/driver.c:396
>  call_driver_probe drivers/base/dd.c:579 [inline]
>  really_probe+0x23e/0xa90 drivers/base/dd.c:658
>  __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
>  driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
>  __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
>  bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:459
>  __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
>  bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:534
>  device_add+0x114b/0x1a70 drivers/base/core.c:3665
>  usb_set_configuration+0x10cb/0x1c50 drivers/usb/core/message.c:2210
> page last free pid 9 tgid 9 stack trace:
>  reset_page_owner include/linux/page_owner.h:25 [inline]
>  free_pages_prepare mm/page_alloc.c:1127 [inline]
>  free_unref_page+0x661/0xe40 mm/page_alloc.c:2659
>  __folio_put+0x1e8/0x2d0 mm/swap.c:112
>  em28xx_free_device drivers/media/usb/em28xx/em28xx-cards.c:3566 [inline]
>  kref_put include/linux/kref.h:65 [inline]
>  em28xx_usb_disconnect+0x3a5/0x610 drivers/media/usb/em28xx/em28xx-cards.c:4207
>  usb_unbind_interface+0x1e2/0x960 drivers/usb/core/driver.c:458
>  device_remove drivers/base/dd.c:569 [inline]
>  device_remove+0x122/0x170 drivers/base/dd.c:561
>  __device_release_driver drivers/base/dd.c:1273 [inline]
>  device_release_driver_internal+0x44a/0x610 drivers/base/dd.c:1296
>  bus_remove_device+0x22f/0x420 drivers/base/bus.c:576
>  device_del+0x396/0x9f0 drivers/base/core.c:3854
>  usb_disable_device+0x36c/0x7f0 drivers/usb/core/message.c:1418
>  usb_disconnect+0x2e1/0x920 drivers/usb/core/hub.c:2304
>  hub_port_connect drivers/usb/core/hub.c:5361 [inline]
>  hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
>  port_event drivers/usb/core/hub.c:5821 [inline]
>  hub_event+0x1bed/0x4f40 drivers/usb/core/hub.c:5903
>  process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
>  process_scheduled_works kernel/workqueue.c:3310 [inline]
>  worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
>  kthread+0x2c1/0x3a0 kernel/kthread.c:389
>  ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>
> Memory state around the buggy address:
>  ffff888123869a00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>  ffff888123869a80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> >ffff888123869b00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>                                      ^
>  ffff888123869b80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>  ffff888123869c00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ==================================================================
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller-bugs/67812439.050a0220.216c54.0010.GAE%40google.com.

