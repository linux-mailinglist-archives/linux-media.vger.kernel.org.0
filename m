Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E897F2192AC
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 23:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgGHVnR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 17:43:17 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:50256 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgGHVnQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jul 2020 17:43:16 -0400
Received: by mail-io1-f70.google.com with SMTP id 14so19101532ioz.17
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2020 14:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=eoAn1HlYkwtbVVLjbIq4KVlzt4T6kCE2zsNOQ24E920=;
        b=suxw7+X18O8fBVpgy95zTisexGsreyEBBQIJ/ftzY3rU4Equy/sKErThkcB3O966XV
         hXrJBoeQ3H6PjqfGM94gm+sE/m159XvoJXO7AMsRM+sSlR+OhwQnmjz9WelKj5BD3Ose
         EBkiDvvoUasGjX6bpBnXhNeaHzTcbezULbU+0NTS0raBiKqiEs84YW0fzSFAixxtE85G
         DodlIOE/SfOXWl6e+McPmGRGgItxeHakwi4Io6/M/65xl2GCBKiJgeKkIpVN49I429Oh
         yasXETsIVzLsSgq30bz0Eh+L6kPtlCDCdkFpyIJNHb8sDCUWZ5DPgbssRygmZP8VnTpa
         jbeg==
X-Gm-Message-State: AOAM533szmwQVFuLWOa8pHYZf0vpHKlaIUuJftGCccnnpZY6mMSJ5ZVN
        PAG+JKEzxUnrF+irTHIaAcMbVo6UjPKW51uAQo/wul0uVj8E
X-Google-Smtp-Source: ABdhPJxtVs90avTmLhHuFTbp9SwkoETCGdzxpP2pm4glRJJsiB5Q8iHRT7JN6fzz2qPUpuTsElQF6l6PkypUKN+lP0QL06V+vWaG
MIME-Version: 1.0
X-Received: by 2002:a92:4101:: with SMTP id o1mr32609484ila.53.1594244595688;
 Wed, 08 Jul 2020 14:43:15 -0700 (PDT)
Date:   Wed, 08 Jul 2020 14:43:15 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cfab3705a9f4fef7@google.com>
Subject: general protection fault in dma_buf_release
From:   syzbot <syzbot+4342719956b367864c91@syzkaller.appspotmail.com>
To:     christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, sumit.semwal@linaro.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    9e50b94b Add linux-next specific files for 20200703
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=121cf755100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f99cc0faa1476ed6
dashboard link: https://syzkaller.appspot.com/bug?extid=4342719956b367864c91
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1467c5e3100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=153f2283100000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+4342719956b367864c91@syzkaller.appspotmail.com

RBP: 00000000000103d6 R08: 0000000000000001 R09: 00000000004002c8
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000402170
R13: 0000000000402200 R14: 0000000000000000 R15: 0000000000000000
general protection fault, probably for non-canonical address 0xdffffc0000000017: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x00000000000000b8-0x00000000000000bf]
CPU: 1 PID: 6798 Comm: syz-executor223 Not tainted 5.8.0-rc3-next-20200703-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:dma_buf_release+0x51/0x3f0 drivers/dma-buf/dma-buf.c:63
Code: 03 80 3c 02 00 0f 85 30 03 00 00 48 8b ad e8 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d bd b8 00 00 00 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e e3 02 00 00 8b 9d b8 00 00 00
RSP: 0018:ffffc90001b87aa0 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffffffff847e30a0 RCX: ffffffff81c58a83
RDX: 0000000000000017 RSI: ffffffff847e30b0 RDI: 00000000000000b8
RBP: 0000000000000000 R08: 0000000000000001 R09: ffff88808a53c80b
R10: 0000000000000000 R11: 0000000000000000 R12: ffff88808b7dc550
R13: ffff88808b7dc4d8 R14: ffff88808b7dc520 R15: 0000000000000000
FS:  0000000001f09880(0000) GS:ffff8880ae700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000006cc090 CR3: 00000000a87d2000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __dentry_kill+0x42b/0x640 fs/dcache.c:584
 dentry_kill fs/dcache.c:705 [inline]
 dput+0x725/0xbc0 fs/dcache.c:878
 path_put+0x2d/0x60 fs/namei.c:496
 alloc_file_pseudo+0x20d/0x250 fs/file_table.c:236
 dma_buf_getfile drivers/dma-buf/dma-buf.c:439 [inline]
 dma_buf_export+0x5d8/0xae0 drivers/dma-buf/dma-buf.c:555
 udmabuf_create+0xb9d/0xe30 drivers/dma-buf/udmabuf.c:228
 udmabuf_ioctl_create_list drivers/dma-buf/udmabuf.c:284 [inline]
 udmabuf_ioctl+0x265/0x2c0 drivers/dma-buf/udmabuf.c:299
 vfs_ioctl fs/ioctl.c:48 [inline]
 ksys_ioctl+0x11a/0x180 fs/ioctl.c:753
 __do_sys_ioctl fs/ioctl.c:762 [inline]
 __se_sys_ioctl fs/ioctl.c:760 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:760
 do_syscall_64+0x60/0xe0 arch/x86/entry/common.c:367
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x441229
Code: Bad RIP value.
RSP: 002b:00007ffe24394848 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 0000000000441229
RDX: 0000000020000000 RSI: 0000000040087543 RDI: 0000000000000004
RBP: 00000000000103d6 R08: 0000000000000001 R09: 00000000004002c8
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000402170
R13: 0000000000402200 R14: 0000000000000000 R15: 0000000000000000
Modules linked in:
---[ end trace 1a68562902844a66 ]---
RIP: 0010:dma_buf_release+0x51/0x3f0 drivers/dma-buf/dma-buf.c:63
Code: 03 80 3c 02 00 0f 85 30 03 00 00 48 8b ad e8 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d bd b8 00 00 00 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e e3 02 00 00 8b 9d b8 00 00 00
RSP: 0018:ffffc90001b87aa0 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffffffff847e30a0 RCX: ffffffff81c58a83
RDX: 0000000000000017 RSI: ffffffff847e30b0 RDI: 00000000000000b8
RBP: 0000000000000000 R08: 0000000000000001 R09: ffff88808a53c80b
R10: 0000000000000000 R11: 0000000000000000 R12: ffff88808b7dc550
R13: ffff88808b7dc4d8 R14: ffff88808b7dc520 R15: 0000000000000000
FS:  0000000001f09880(0000) GS:ffff8880ae700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000006cc090 CR3: 00000000a87d2000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
