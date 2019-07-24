Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 262C372BE5
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 11:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfGXJ7f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 05:59:35 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39709 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbfGXJ7e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 05:59:34 -0400
Received: by mail-io1-f65.google.com with SMTP id f4so88315719ioh.6
        for <linux-media@vger.kernel.org>; Wed, 24 Jul 2019 02:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dVYaoBPqlKUhxllRn3ei8bCvScMlLdKVTkxfBLFkDN4=;
        b=rNFp80JGiZF3aHM81XjqStXEZ7MWlub8Oyl5NIDpGiATZHdiNrbNjoFmV+mV02XD2D
         pR3HloKLhIie016OdZKCo3d+4wlcM+rTIp/YbS0J7smhaP0BAwDcuxnR8KQ3UcBR+3tw
         H7jsSnNa/iL3YyzEPmRULDEqwJJQ13JjBoCfAcrPVctVU+roaGPkYP7fSZ+mvKbzq+7l
         JDZd3dwu6quLF3T1ouADFFkqAGF2BN1/Zi06PGuq+uN3umHYegmnnB0/ymel8kiy4QEQ
         WLzbQ4Ch5FlzBl2D7tJnMRfV24RndmzmmXvup1TL7ScvxtHwwhCPXZvnuqDBAlN2Xavs
         343w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dVYaoBPqlKUhxllRn3ei8bCvScMlLdKVTkxfBLFkDN4=;
        b=K0f5U6zGxC/t3o5nWCN91oxbvSTSerMmqlxxpOkiK2tPeX6cUKNWTy0E0e3zCucjOJ
         U9Jxp8epfWbOt0Hg9ota+VT9k+v9YuGZS74xYyFmvAKIRkRKg5xUwzbkrhOOaCa1ZPLs
         s8HFwhzICAE6pKMN99dR/QkE2LhMmvrRH/3nD//6Ylf/FkNwR7VLmNhiKQxmEDsCIQ3u
         O07BeBUtM94ysfKjjyOov5X3Jyu8T6KnWLnjpdy7nmzk9OHbhbShWPhHoYPfN4HDJnuE
         qlnvjgXqvHBPCFq7gZfNi9qBPsPGgeUnXXR5oNfxmyiMsE3jjKTINkIiPy2adqfCBYLe
         hW/A==
X-Gm-Message-State: APjAAAVOJQXQzVt9OGwrCU7XN+CgAjv89+AZVQ6SC10LPxxjX7OOVeKU
        4fRb2IQQVK8Ejno+B/Wu3CMAbulYUCu3PzI1F3RmfA==
X-Google-Smtp-Source: APXvYqzQNpC90SVOqihvRr3heJAJXheST8iwqv8aQr1+tvn2hL2yHhHkvlqsghUtClMCm1IQedqR0FP+4ZKbvuZi6BM=
X-Received: by 2002:a05:6638:303:: with SMTP id w3mr30078738jap.103.1563962373340;
 Wed, 24 Jul 2019 02:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000b68e04058e6a3421@google.com>
In-Reply-To: <000000000000b68e04058e6a3421@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 24 Jul 2019 11:59:22 +0200
Message-ID: <CACT4Y+ZJpqR9HtDXfEv-nGM_pP4_hSRu1odRX3LBdNq+_Dp=tw@mail.gmail.com>
Subject: Re: memory leak in dma_buf_ioctl
To:     syzbot <syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, DRI <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org
Cc:     LKML <linux-kernel@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 24, 2019 at 11:48 AM syzbot
<syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    abdfd52a Merge tag 'armsoc-defconfig' of git://git.kernel...
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=131441d0600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d31de3d88059b7fa
> dashboard link: https://syzkaller.appspot.com/bug?extid=b2098bc44728a4efb3e9
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12526e58600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=161784f0600000

+drivers/dma-buf/dma-buf.c maintainers

> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com
>
> executing program
> executing program
> executing program
> executing program
> executing program
> BUG: memory leak
> unreferenced object 0xffff888114034680 (size 32):
>    comm "syz-executor110", pid 6894, jiffies 4294947136 (age 13.580s)
>    hex dump (first 32 bytes):
>      00 64 6d 61 62 75 66 3a 00 00 00 00 00 00 00 00  .dmabuf:........
>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>    backtrace:
>      [<00000000d259834b>] kmemleak_alloc_recursive
> /./include/linux/kmemleak.h:43 [inline]
>      [<00000000d259834b>] slab_post_alloc_hook /mm/slab.h:522 [inline]
>      [<00000000d259834b>] slab_alloc /mm/slab.c:3319 [inline]
>      [<00000000d259834b>] __do_kmalloc /mm/slab.c:3653 [inline]
>      [<00000000d259834b>] __kmalloc_track_caller+0x165/0x300 /mm/slab.c:3670
>      [<00000000ab207ec1>] memdup_user+0x26/0xa0 /mm/util.c:165
>      [<00000000c0909d36>] strndup_user+0x62/0x80 /mm/util.c:224
>      [<00000000a34a2d25>] dma_buf_set_name /drivers/dma-buf/dma-buf.c:331
> [inline]
>      [<00000000a34a2d25>] dma_buf_ioctl+0x60/0x1b0
> /drivers/dma-buf/dma-buf.c:391
>      [<00000000d7817662>] vfs_ioctl /fs/ioctl.c:46 [inline]
>      [<00000000d7817662>] file_ioctl /fs/ioctl.c:509 [inline]
>      [<00000000d7817662>] do_vfs_ioctl+0x62a/0x810 /fs/ioctl.c:696
>      [<00000000d24a671a>] ksys_ioctl+0x86/0xb0 /fs/ioctl.c:713
>      [<00000000bd810f5d>] __do_sys_ioctl /fs/ioctl.c:720 [inline]
>      [<00000000bd810f5d>] __se_sys_ioctl /fs/ioctl.c:718 [inline]
>      [<00000000bd810f5d>] __x64_sys_ioctl+0x1e/0x30 /fs/ioctl.c:718
>      [<000000005a8e86d5>] do_syscall_64+0x76/0x1a0
> /arch/x86/entry/common.c:296
>      [<000000007d83529f>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
>
> BUG: memory leak
> unreferenced object 0xffff888113b044a0 (size 32):
>    comm "syz-executor110", pid 6895, jiffies 4294947728 (age 7.660s)
>    hex dump (first 32 bytes):
>      00 64 6d 61 62 75 66 3a 00 00 00 00 00 00 00 00  .dmabuf:........
>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>    backtrace:
>      [<00000000d259834b>] kmemleak_alloc_recursive
> /./include/linux/kmemleak.h:43 [inline]
>      [<00000000d259834b>] slab_post_alloc_hook /mm/slab.h:522 [inline]
>      [<00000000d259834b>] slab_alloc /mm/slab.c:3319 [inline]
>      [<00000000d259834b>] __do_kmalloc /mm/slab.c:3653 [inline]
>      [<00000000d259834b>] __kmalloc_track_caller+0x165/0x300 /mm/slab.c:3670
>      [<00000000ab207ec1>] memdup_user+0x26/0xa0 /mm/util.c:165
>      [<00000000c0909d36>] strndup_user+0x62/0x80 /mm/util.c:224
>      [<00000000a34a2d25>] dma_buf_set_name /drivers/dma-buf/dma-buf.c:331
> [inline]
>      [<00000000a34a2d25>] dma_buf_ioctl+0x60/0x1b0
> /drivers/dma-buf/dma-buf.c:391
>      [<00000000d7817662>] vfs_ioctl /fs/ioctl.c:46 [inline]
>      [<00000000d7817662>] file_ioctl /fs/ioctl.c:509 [inline]
>      [<00000000d7817662>] do_vfs_ioctl+0x62a/0x810 /fs/ioctl.c:696
>      [<00000000d24a671a>] ksys_ioctl+0x86/0xb0 /fs/ioctl.c:713
>      [<00000000bd810f5d>] __do_sys_ioctl /fs/ioctl.c:720 [inline]
>      [<00000000bd810f5d>] __se_sys_ioctl /fs/ioctl.c:718 [inline]
>      [<00000000bd810f5d>] __x64_sys_ioctl+0x1e/0x30 /fs/ioctl.c:718
>      [<000000005a8e86d5>] do_syscall_64+0x76/0x1a0
> /arch/x86/entry/common.c:296
>      [<000000007d83529f>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
>
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
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/000000000000b68e04058e6a3421%40google.com.
