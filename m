Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D85C13731E8
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 23:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232840AbhEDV3T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 17:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232684AbhEDV3S (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 May 2021 17:29:18 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA83C061574;
        Tue,  4 May 2021 14:28:23 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id x188so336964pfd.7;
        Tue, 04 May 2021 14:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=rC//UL0/if2O+6rVcbTRHyqn0UdJ7E2Vf9+qwJ26TeM=;
        b=fZlfWZAbu4AwQZ+NbeVjgm9DgtC+xgb9ILAqOypUGFJMQZENNfA6hVJlQmsvs+jOmp
         P3SNIZBWZWZvYe+DBJcv7K62+tBq14nGIoZBIN4kJIjhIx4+ho2cUB7XyP1HokNJZcFt
         PhWqcEOsMBo72RBlIM17dUoZvgZvKD8tH4BDaymN75s7Md0OKA9MW7e8uGdh0+HVMVnm
         cCBwJItqb8rU9OTuI8yvZODDhCpCZIS+et81uYC6rsFqIkBemc3kQsURT+jZe4k2zbPS
         Df+AEL69PeaH5UqKAee8GpQ4brRGvt75oLLqktk7Z3AxlWdEdpa5jC+MrbgOYOV0PCeb
         UB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rC//UL0/if2O+6rVcbTRHyqn0UdJ7E2Vf9+qwJ26TeM=;
        b=k2SaF1qcbT+RjDdDHjhI6/v+OHAIZHnOomB4Sh/VxSzGkZReXGlLS3GcvN7c+NGgoR
         dvDVaoepHRIGJtJmXDCN3wuKtZ0PRcxgseBiyqefWXR+efepgPyj48XPFhODrSdD2klT
         Cdd+rPPtxUF8H7g35N3ZkOY05DDXyE7jhqnf2cv5NKfC9p262X57udywt3dy+LP+IqkL
         4a4Fy90oyhk8YA/7SjGuvfqiXXZAIl/p9pqKi3HrhacOVXLFEqjIVbZQwfp0VJR9Mg2q
         RYBD62ga15IdlD76od3sPyKlILD+szNkkHEuQ7GpJlnZJgJiY+86l+gdYytK8QifnWCK
         +WBw==
X-Gm-Message-State: AOAM531znHSL6UQCMJ5MHRSg3PZI0IaEa5//85zOS7bMs78f6EC5hav7
        fKYvgRQ9tFWyZwQExYhEKkw=
X-Google-Smtp-Source: ABdhPJychChkEZvwblfM+Ev1M/+OJ/hC+QsmiOLtnzW6WN20OXxgWF5ZG9aLWujmqKLsAwx4PycEUA==
X-Received: by 2002:aa7:80c9:0:b029:249:cac5:e368 with SMTP id a9-20020aa780c90000b0290249cac5e368mr25276068pfn.12.1620163703116;
        Tue, 04 May 2021 14:28:23 -0700 (PDT)
Received: from [192.168.1.41] (097-090-198-083.res.spectrum.com. [97.90.198.83])
        by smtp.gmail.com with ESMTPSA id c134sm8571790pfb.135.2021.05.04.14.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 May 2021 14:28:22 -0700 (PDT)
Subject: Re: KASAN: use-after-free Read in v4l2_fh_open
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org
References: <00000000000017937c05bb617f1d@google.com>
From:   SyzScope <syzscope@gmail.com>
Message-ID: <471c3801-2fe9-59bd-b2ad-9877dae05484@gmail.com>
Date:   Tue, 4 May 2021 14:28:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <00000000000017937c05bb617f1d@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This is SyzScope, a research project that aims to reveal high-risk 
primitives from a seemingly low-risk bug (UAF/OOB read, WARNING, BUG, etc.).

We are currently testing seemingly low-risk bugs on syzbot's open 
section(https://syzkaller.appspot.com/upstream), and try to reach out to 
kernel developers as long as SyzScope discovers any high-risk primitives.

Please let us know if SyzScope indeed helps, and any suggestions/feedback.

Regrading the bug "KASAN: use-after-free Read in v4l2_fh_open", SyzScope 
reports 1 memory write capability.

The detailed comments can be found at 
https://sites.google.com/view/syzscope/kasan-use-after-free-read-in-v4l2_fh_open

On 2/15/2021 7:18 AM, syzbot wrote:

> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    291009f6 Merge tag 'pm-5.11-rc8' of git://git.kernel.org/p..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=17260814d00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=6a218c95bd23063a
> dashboard link: https://syzkaller.appspot.com/bug?extid=b2391895514ed9ef4a8e
> compiler:       Debian clang version 11.0.1-2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14ec5814d00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17179dd4d00000
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+b2391895514ed9ef4a8e@syzkaller.appspotmail.com
>
> ==================================================================
> BUG: KASAN: use-after-free in v4l2_fh_init drivers/media/v4l2-core/v4l2-fh.c:25 [inline]
> BUG: KASAN: use-after-free in v4l2_fh_open+0xc7/0x430 drivers/media/v4l2-core/v4l2-fh.c:63
> Read of size 8 at addr ffff8880228b88b8 by task v4l_id/18349
>
> CPU: 1 PID: 18349 Comm: v4l_id Not tainted 5.11.0-rc7-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>   __dump_stack lib/dump_stack.c:79 [inline]
>   dump_stack+0x137/0x1be lib/dump_stack.c:120
>   print_address_description+0x5f/0x3a0 mm/kasan/report.c:230
>   __kasan_report mm/kasan/report.c:396 [inline]
>   kasan_report+0x15e/0x200 mm/kasan/report.c:413
>   v4l2_fh_init drivers/media/v4l2-core/v4l2-fh.c:25 [inline]
>   v4l2_fh_open+0xc7/0x430 drivers/media/v4l2-core/v4l2-fh.c:63
>   em28xx_v4l2_open+0x15c/0xa60 drivers/media/usb/em28xx/em28xx-video.c:2163
>   v4l2_open+0x229/0x360 drivers/media/v4l2-core/v4l2-dev.c:423
>   chrdev_open+0x4a0/0x570 fs/char_dev.c:414
>   do_dentry_open+0x7cb/0x1010 fs/open.c:817
>   do_open fs/namei.c:3254 [inline]
>   path_openat+0x2791/0x37a0 fs/namei.c:3371
>   do_filp_open+0x191/0x3a0 fs/namei.c:3398
>   do_sys_openat2+0xba/0x380 fs/open.c:1172
>   do_sys_open fs/open.c:1188 [inline]
>   __do_sys_open fs/open.c:1196 [inline]
>   __se_sys_open fs/open.c:1192 [inline]
>   __x64_sys_open+0x1af/0x1e0 fs/open.c:1192
>   do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
>   entry_SYSCALL_64_after_hwframe+0x44/0xa9
> RIP: 0033:0x7fdd62b00840
> Code: 73 01 c3 48 8b 0d 68 77 20 00 f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 83 3d 89 bb 20 00 00 75 10 b8 02 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 1e f6 ff ff 48 89 04 24
> RSP: 002b:00007ffe8bb255b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
> RAX: ffffffffffffffda RBX: 00007ffe8bb25728 RCX: 00007fdd62b00840
> RDX: 00007fdd62aecea0 RSI: 0000000000000000 RDI: 00007ffe8bb26f1c
> RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000002 R11: 0000000000000246 R12: 000055f8a7dee8d0
> R13: 00007ffe8bb25720 R14: 0000000000000000 R15: 0000000000000000
>
> The buggy address belongs to the page:
> page:00000000b7dd9778 refcount:0 mapcount:-128 mapping:0000000000000000 index:0x0 pfn:0x228b8
> flags: 0xfff00000000000()
> raw: 00fff00000000000 ffffea0000580108 ffff88813fffb910 0000000000000000
> raw: 0000000000000000 0000000000000002 00000000ffffff7f 0000000000000000
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>   ffff8880228b8780: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>   ffff8880228b8800: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>> ffff8880228b8880: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>                                          ^
>   ffff8880228b8900: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>   ffff8880228b8980: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
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
> syzbot can test patches for this issue, for details see:
> https://goo.gl/tpsmEJ#testing-patches
>
