Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 781842CC291
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 17:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730652AbgLBQh5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 11:37:57 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:52970 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbgLBQh4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 11:37:56 -0500
Received: by mail-il1-f199.google.com with SMTP id o18so1898294ilg.19
        for <linux-media@vger.kernel.org>; Wed, 02 Dec 2020 08:37:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=MEXca2PcgGHG4zH8HYiKkHgm2u8C0G/vikFcBTxnEUM=;
        b=PmrWHbJKjMGhgor+1r+6IK6RgAkjxFVjAPB3rFrPSZ1sSXjjjIpUpvftepcRRZTE7g
         nTvRon14LxPRAt2xVfo5tAfZqwiufpgVsxPXsywvQkBr8c98VzLjGTegz06wkQnFN0AR
         o1F6YCbwDjI/m3v+aTOruwkUmvHRIKO7dr9GxGKYbC98jpZwF0Mtq41ihCQwG1A8BsLZ
         7oB18XY1hrgw0agQkQ1diTTnREqfeqJ2AZKgsX0SkapGD7MqlMs+WdGzj1JfAmL8VfkN
         uX9pSn7OiQTJMCbCR/FFs1P5boWqAWemmLUBddgExXoQdeLM7hMjbaYD6pA/YU1TEDMA
         4OKQ==
X-Gm-Message-State: AOAM530BFisE6RM2KQfjY7elzgBfDDKr5+Oy+YOLWeyv/XS78NkFn8V/
        l9EoYHkCPsrOFCE6/B3AVmkcGxwDtbcCguuxttUxGsE0iCjP
X-Google-Smtp-Source: ABdhPJzlsMRm3Ew2hy840r413wVMgvV0DY0YDWuF1QgzVe8jI8XWoSJeKJwd8tkAVSorjH9pDRnWyGsc/BFELgwt4tYQsTa3IU2R
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2ac4:: with SMTP id m4mr2644571iov.97.1606927029504;
 Wed, 02 Dec 2020 08:37:09 -0800 (PST)
Date:   Wed, 02 Dec 2020 08:37:09 -0800
In-Reply-To: <20201202162200.GA1057740@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c60d6405b57dda88@google.com>
Subject: Re: memory leak in hub_event
From:   syzbot <syzbot+44e64397bd81d5e84cba@syzkaller.appspotmail.com>
To:     hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
memory leak in rxrpc_lookup_local

BUG: memory leak
unreferenced object 0xffff88810ae30400 (size 256):
  comm "syz-executor.2", pid 8878, jiffies 4294943959 (age 433.730s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 0a 00 00 00 00 40 75 17 81 88 ff ff  .........@u.....
  backtrace:
    [<00000000d78976b4>] kmalloc include/linux/slab.h:552 [inline]
    [<00000000d78976b4>] kzalloc include/linux/slab.h:664 [inline]
    [<00000000d78976b4>] rxrpc_alloc_local net/rxrpc/local_object.c:79 [inline]
    [<00000000d78976b4>] rxrpc_lookup_local+0x1c1/0x760 net/rxrpc/local_object.c:244
    [<000000000f4771f3>] rxrpc_bind+0x174/0x240 net/rxrpc/af_rxrpc.c:149
    [<00000000a1ca3956>] afs_open_socket+0xdb/0x200 fs/afs/rxrpc.c:64
    [<000000000b4e3083>] afs_net_init+0x2b4/0x340 fs/afs/main.c:126
    [<0000000057174e11>] ops_init+0x4e/0x190 net/core/net_namespace.c:152
    [<000000001ef2d4d2>] setup_net+0xdb/0x2d0 net/core/net_namespace.c:342
    [<000000000c0943a9>] copy_net_ns+0x14b/0x320 net/core/net_namespace.c:483
    [<000000000134587c>] create_new_namespaces+0x199/0x4e0 kernel/nsproxy.c:110
    [<00000000ab7ab634>] unshare_nsproxy_namespaces+0x9b/0x120 kernel/nsproxy.c:231
    [<000000000a7b8a55>] ksys_unshare+0x2fe/0x5c0 kernel/fork.c:2949
    [<000000007378cba1>] __do_sys_unshare kernel/fork.c:3017 [inline]
    [<000000007378cba1>] __se_sys_unshare kernel/fork.c:3015 [inline]
    [<000000007378cba1>] __x64_sys_unshare+0x12/0x20 kernel/fork.c:3015
    [<000000002e47b3c4>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
    [<00000000daddea42>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff888117639d00 (size 256):
  comm "syz-executor.0", pid 8872, jiffies 4294943961 (age 433.710s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 0a 00 00 00 00 40 7a 17 81 88 ff ff  .........@z.....
  backtrace:
    [<00000000d78976b4>] kmalloc include/linux/slab.h:552 [inline]
    [<00000000d78976b4>] kzalloc include/linux/slab.h:664 [inline]
    [<00000000d78976b4>] rxrpc_alloc_local net/rxrpc/local_object.c:79 [inline]
    [<00000000d78976b4>] rxrpc_lookup_local+0x1c1/0x760 net/rxrpc/local_object.c:244
    [<000000000f4771f3>] rxrpc_bind+0x174/0x240 net/rxrpc/af_rxrpc.c:149
    [<00000000a1ca3956>] afs_open_socket+0xdb/0x200 fs/afs/rxrpc.c:64
    [<000000000b4e3083>] afs_net_init+0x2b4/0x340 fs/afs/main.c:126
    [<0000000057174e11>] ops_init+0x4e/0x190 net/core/net_namespace.c:152
    [<000000001ef2d4d2>] setup_net+0xdb/0x2d0 net/core/net_namespace.c:342
    [<000000000c0943a9>] copy_net_ns+0x14b/0x320 net/core/net_namespace.c:483
    [<000000000134587c>] create_new_namespaces+0x199/0x4e0 kernel/nsproxy.c:110
    [<00000000ab7ab634>] unshare_nsproxy_namespaces+0x9b/0x120 kernel/nsproxy.c:231
    [<000000000a7b8a55>] ksys_unshare+0x2fe/0x5c0 kernel/fork.c:2949
    [<000000007378cba1>] __do_sys_unshare kernel/fork.c:3017 [inline]
    [<000000007378cba1>] __se_sys_unshare kernel/fork.c:3015 [inline]
    [<000000007378cba1>] __x64_sys_unshare+0x12/0x20 kernel/fork.c:3015
    [<000000002e47b3c4>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
    [<00000000daddea42>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff888117a9cb00 (size 256):
  comm "syz-executor.7", pid 8882, jiffies 4294943964 (age 433.680s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 0a 00 00 00 00 80 8b 17 81 88 ff ff  ................
  backtrace:
    [<00000000d78976b4>] kmalloc include/linux/slab.h:552 [inline]
    [<00000000d78976b4>] kzalloc include/linux/slab.h:664 [inline]
    [<00000000d78976b4>] rxrpc_alloc_local net/rxrpc/local_object.c:79 [inline]
    [<00000000d78976b4>] rxrpc_lookup_local+0x1c1/0x760 net/rxrpc/local_object.c:244
    [<000000000f4771f3>] rxrpc_bind+0x174/0x240 net/rxrpc/af_rxrpc.c:149
    [<00000000a1ca3956>] afs_open_socket+0xdb/0x200 fs/afs/rxrpc.c:64
    [<000000000b4e3083>] afs_net_init+0x2b4/0x340 fs/afs/main.c:126
    [<0000000057174e11>] ops_init+0x4e/0x190 net/core/net_namespace.c:152
    [<000000001ef2d4d2>] setup_net+0xdb/0x2d0 net/core/net_namespace.c:342
    [<000000000c0943a9>] copy_net_ns+0x14b/0x320 net/core/net_namespace.c:483
    [<000000000134587c>] create_new_namespaces+0x199/0x4e0 kernel/nsproxy.c:110
    [<00000000ab7ab634>] unshare_nsproxy_namespaces+0x9b/0x120 kernel/nsproxy.c:231
    [<000000000a7b8a55>] ksys_unshare+0x2fe/0x5c0 kernel/fork.c:2949
    [<000000007378cba1>] __do_sys_unshare kernel/fork.c:3017 [inline]
    [<000000007378cba1>] __se_sys_unshare kernel/fork.c:3015 [inline]
    [<000000007378cba1>] __x64_sys_unshare+0x12/0x20 kernel/fork.c:3015
    [<000000002e47b3c4>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
    [<00000000daddea42>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff88810c9b9700 (size 256):
  comm "syz-executor.5", pid 8881, jiffies 4294943965 (age 433.670s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 0a 00 00 00 00 c0 b4 0c 81 88 ff ff  ................
  backtrace:
    [<00000000d78976b4>] kmalloc include/linux/slab.h:552 [inline]
    [<00000000d78976b4>] kzalloc include/linux/slab.h:664 [inline]
    [<00000000d78976b4>] rxrpc_alloc_local net/rxrpc/local_object.c:79 [inline]
    [<00000000d78976b4>] rxrpc_lookup_local+0x1c1/0x760 net/rxrpc/local_object.c:244
    [<000000000f4771f3>] rxrpc_bind+0x174/0x240 net/rxrpc/af_rxrpc.c:149
    [<00000000a1ca3956>] afs_open_socket+0xdb/0x200 fs/afs/rxrpc.c:64
    [<000000000b4e3083>] afs_net_init+0x2b4/0x340 fs/afs/main.c:126
    [<0000000057174e11>] ops_init+0x4e/0x190 net/core/net_namespace.c:152
    [<000000001ef2d4d2>] setup_net+0xdb/0x2d0 net/core/net_namespace.c:342
    [<000000000c0943a9>] copy_net_ns+0x14b/0x320 net/core/net_namespace.c:483
    [<000000000134587c>] create_new_namespaces+0x199/0x4e0 kernel/nsproxy.c:110
    [<00000000ab7ab634>] unshare_nsproxy_namespaces+0x9b/0x120 kernel/nsproxy.c:231
    [<000000000a7b8a55>] ksys_unshare+0x2fe/0x5c0 kernel/fork.c:2949
    [<000000007378cba1>] __do_sys_unshare kernel/fork.c:3017 [inline]
    [<000000007378cba1>] __se_sys_unshare kernel/fork.c:3015 [inline]
    [<000000007378cba1>] __x64_sys_unshare+0x12/0x20 kernel/fork.c:3015
    [<000000002e47b3c4>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
    [<00000000daddea42>] entry_SYSCALL_64_after_hwframe+0x44/0xa9



Tested on:

commit:         4d02da97 Merge tag 'net-5.10-rc5' of git://git.kernel.org/..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16754c55500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9e70f46496e4daad
dashboard link: https://syzkaller.appspot.com/bug?extid=44e64397bd81d5e84cba
compiler:       gcc (GCC) 10.1.0-syz 20200507
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12ca5c73500000

