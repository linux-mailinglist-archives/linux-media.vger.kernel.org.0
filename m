Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB9C1FF127
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 14:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbgFRMEq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 08:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726919AbgFRMEk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 08:04:40 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18883C0613EE
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 05:04:39 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id i12so2452752pju.3
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 05:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a//uCrVJPF15o3NZ8oa0wIr0G6H6hYlHi4uZ+SX5LZ8=;
        b=pTNgZDNStw8h1YPuLypOjqvoisArtiCZnFpZS7mUjFCyPs8gz6ptyZlFXEaHVsk5V7
         GfEJNSnCJLi+eWXByfnYittSyHNEK89ld4kCmbT06bnG1JzpymBFI2dhc0CxTIypJraf
         iAxCB1qowyl5l+efEAqbLXIl7nengM8S+5Vs/z6gWYBQVfvOWIkPrTGmR/6JyovCCviQ
         +7xdZxMLvH4Mdfd4NnzKmr5u7hpqV/L0G7jaLXblTTpCj3dLwJzhKOWdwhcHTyDKbjsO
         m33zaRcY6qUrJZz2sly0DNIRS1XZzy2nGQlUHnoySC1Hs0ymdwFJxtd0kQLt17eP/6dE
         qmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a//uCrVJPF15o3NZ8oa0wIr0G6H6hYlHi4uZ+SX5LZ8=;
        b=JQJh00LyNStHcM4asfSpNwQC3d56KTdyufqPRXR9zfqytmQDAN55l8dCJH+/GX7lH3
         rRa2xYqZUW/31OkQv0TDczhfb+MRThYVtmPMrTrcoC4iuo7+ckDTvvQa7XOHUMIMHqR8
         eA+o5ZuInWo2I9WDLmB17ta94uVuJC62TaaOOEQRKlR4+aXEIgy9I2shaQizEmI0tKNX
         n1KAzgSlWToyLBaeknotLH+lg48R3OIVuZTMatmn4n0M+bUHZN/f1AA4xo8s0tiVpMuS
         +cJA60egcFsW6U4bXjK6d/qL6f96cNACendNHz4gUFqfatZjVmofBJI+tMNX3GzQFrzH
         zL6Q==
X-Gm-Message-State: AOAM531763StQJLrj3DGiMrb8LFO8blMbF8Qb6X9oITXN6t0uzNTMMGb
        H4FNlEItBs/trGo65y7BiPqIuNmOJap4iuqnquVXFw==
X-Google-Smtp-Source: ABdhPJzktztMvGvD7NTBr3Mk3hKVBOZMQxu0ukUcOQp9V1HsLlNe8tOkynCUSmNOssjI8wujbwWvfa7fiz8a9450K4A=
X-Received: by 2002:a17:902:6ac1:: with SMTP id i1mr3563117plt.147.1592481878557;
 Thu, 18 Jun 2020 05:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000da6a0e058d3ead50@google.com>
In-Reply-To: <000000000000da6a0e058d3ead50@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 18 Jun 2020 14:04:27 +0200
Message-ID: <CAAeHK+zcrzHr8yzgM1UOEXqXhxv35-OEDte=YRpprQ+pUmzs0A@mail.gmail.com>
Subject: Re: general protection fault in vidioc_querycap
To:     syzbot <syzbot+646272341e25afebff05@syzkaller.appspotmail.com>
Cc:     Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 9, 2019 at 2:27 PM syzbot
<syzbot+646272341e25afebff05@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    7829a896 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=1321f9a3a00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=f6d4561982f71f63
> dashboard link: https://syzkaller.appspot.com/bug?extid=646272341e25afebff05
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12ac261ba00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=171d6739a00000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+646272341e25afebff05@syzkaller.appspotmail.com
>
> kasan: CONFIG_KASAN_INLINE enabled
> kasan: GPF could be caused by NULL-ptr deref or user memory access
> general protection fault: 0000 [#1] SMP KASAN
> CPU: 1 PID: 1878 Comm: v4l_id Not tainted 5.2.0-rc6+ #13
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> RIP: 0010:usb_make_path include/linux/usb.h:913 [inline]
> RIP: 0010:vidioc_querycap+0x12d/0x3e0
> drivers/media/usb/usbvision/usbvision-video.c:461
> Code: 3c 02 00 0f 85 ba 02 00 00 49 8b ac 24 58 16 00 00 48 b8 00 00 00 00
> 00 fc ff df 48 8d 7d 48 4c 8d 45 04 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f
> 85 7d 02 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b
> RSP: 0018:ffff8881cc727a28 EFLAGS: 00010206
> RAX: dffffc0000000000 RBX: ffff8881cc727c20 RCX: 0000000000000000
> RDX: 0000000000000009 RSI: 451f481f4b404f27 RDI: 0000000000000048
> RBP: 0000000000000000 R08: 0000000000000004 R09: fffffbfff0c9ba38
> R10: fffffbfff0c9ba37 R11: ffffffff864dd1b8 R12: ffff8881cc9aa100
> R13: ffff8881cc9ab804 R14: ffff8881cc9aa998 R15: ffff8881cc727c50
> FS:  00007f579210f700(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000625208 CR3: 00000001cd192000 CR4: 00000000001406e0
> Call Trace:
>   v4l_querycap+0x121/0x340 drivers/media/v4l2-core/v4l2-ioctl.c:1058
>   __video_do_ioctl+0x5b0/0xb30 drivers/media/v4l2-core/v4l2-ioctl.c:2871
>   video_usercopy+0x446/0xee0 drivers/media/v4l2-core/v4l2-ioctl.c:3053
>   v4l2_ioctl+0x147/0x1a0 drivers/media/v4l2-core/v4l2-dev.c:360
>   vfs_ioctl fs/ioctl.c:46 [inline]
>   file_ioctl fs/ioctl.c:509 [inline]
>   do_vfs_ioctl+0xcda/0x12e0 fs/ioctl.c:696
>   ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
>   __do_sys_ioctl fs/ioctl.c:720 [inline]
>   __se_sys_ioctl fs/ioctl.c:718 [inline]
>   __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
>   do_syscall_64+0xb7/0x560 arch/x86/entry/common.c:301
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x7f5791c42347
> Code: 90 90 90 48 8b 05 f1 fa 2a 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff
> ff c3 90 90 90 90 90 90 90 90 90 90 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff
> ff 73 01 c3 48 8b 0d c1 fa 2a 00 31 d2 48 29 c2 64
> RSP: 002b:00007ffced1878d8 EFLAGS: 00000206 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f5791c42347
> RDX: 00007ffced1878e0 RSI: 0000000080685600 RDI: 0000000000000003
> RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000400884
> R13: 00007ffced187a30 R14: 0000000000000000 R15: 0000000000000000
> Modules linked in:
> ---[ end trace 5550531bc37b28bc ]---
> RIP: 0010:usb_make_path include/linux/usb.h:913 [inline]
> RIP: 0010:vidioc_querycap+0x12d/0x3e0
> drivers/media/usb/usbvision/usbvision-video.c:461
> Code: 3c 02 00 0f 85 ba 02 00 00 49 8b ac 24 58 16 00 00 48 b8 00 00 00 00
> 00 fc ff df 48 8d 7d 48 4c 8d 45 04 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f
> 85 7d 02 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b
> RSP: 0018:ffff8881cc727a28 EFLAGS: 00010206
> RAX: dffffc0000000000 RBX: ffff8881cc727c20 RCX: 0000000000000000
> RDX: 0000000000000009 RSI: 451f481f4b404f27 RDI: 0000000000000048
> RBP: 0000000000000000 R08: 0000000000000004 R09: fffffbfff0c9ba38
> R10: fffffbfff0c9ba37 R11: ffffffff864dd1b8 R12: ffff8881cc9aa100
> R13: ffff8881cc9ab804 R14: ffff8881cc9aa998 R15: ffff8881cc727c50
> FS:  00007f579210f700(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000625208 CR3: 00000001cd192000 CR4: 00000000001406e0
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
