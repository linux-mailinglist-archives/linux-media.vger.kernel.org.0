Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03C652DEFC5
	for <lists+linux-media@lfdr.de>; Sat, 19 Dec 2020 14:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgLSNOx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Dec 2020 08:14:53 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:46593 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbgLSNOv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Dec 2020 08:14:51 -0500
Received: by mail-io1-f70.google.com with SMTP id a2so3809039iod.13
        for <linux-media@vger.kernel.org>; Sat, 19 Dec 2020 05:14:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=Cu2aYISGQPzLf0fZUerl33lGzRiwpaY7H+fv9PeBU0Q=;
        b=LPqcs+3a8bD3Ot0S6u45/gtx8p/PuRvwZKB3EhYCI8IZvzl9dHtVFXdSpDVU8VyYWI
         4c2SuY/xYIELlVImDzlMWoeWdyVGDrhqSshVhJudTLYTewNDCiP6webmC1nRUju5o+Vt
         r77etbRwCFTU/mw+AGt+gstXisFXdZap2P/M3ZLGDx7/l7RwC7RrldE1BmFlbmvAcbn/
         kz9q/kVQDgQABbfJFA/FnJuWp0BCMrg2NpLOHxSGwyBTVqZDznxOLeGwSlauvNmOk4gb
         6IR605q8HibMcKy/KAdiLkzACQzZ/7uUizRidBf2q0+B9p2Xmfa/shionuF/yt2D2d2t
         5UDg==
X-Gm-Message-State: AOAM531bLjTc5GfdOxk5kLvAeI5qGTQo4sMbO2RRFM8JQaOjXKw9qqgP
        45M4BlgiZiX6ReuP6c11Pfr2/EGznZKVDZL641enJqe/MtUD
X-Google-Smtp-Source: ABdhPJz5xeNYdQX8k5KLaYB+tapLYOA3m44Hc9edbJK7QCmrpplYFGIQ/mwzsr4Xa/25jQ0P0TbV7Y3LFHbf+db6znhfiooUKqQp
MIME-Version: 1.0
X-Received: by 2002:a02:cf30:: with SMTP id s16mr8209401jar.144.1608383650402;
 Sat, 19 Dec 2020 05:14:10 -0800 (PST)
Date:   Sat, 19 Dec 2020 05:14:10 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000025169705b6d100fa@google.com>
Subject: memory leak in video_usercopy
From:   syzbot <syzbot+1115e79c8df6472c612b@syzkaller.appspotmail.com>
To:     arnd@arndb.de, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    a409ed15 Merge tag 'gpio-v5.11-1' of git://git.kernel.org/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10a5880f500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=37c889fb8b2761af
dashboard link: https://syzkaller.appspot.com/bug?extid=1115e79c8df6472c612b
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14d18f9b500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=106a2c13500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1115e79c8df6472c612b@syzkaller.appspotmail.com

Debian GNU/Linux 9 syzkaller ttyS0
Warning: Permanently added '10.128.10.29' (ECDSA) to the list of known hosts.
executing program
executing program
BUG: memory leak
unreferenced object 0xffff88810fb12300 (size 256):
  comm "syz-executor399", pid 8472, jiffies 4294942333 (age 13.960s)
  hex dump (first 32 bytes):
    03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<000000009fd00995>] kmalloc_node include/linux/slab.h:575 [inline]
    [<000000009fd00995>] kvmalloc_node+0x61/0xf0 mm/util.c:575
    [<0000000096a57c4a>] kvmalloc include/linux/mm.h:773 [inline]
    [<0000000096a57c4a>] video_usercopy+0x991/0xa50 drivers/media/v4l2-core/v4l2-ioctl.c:3303
    [<00000000f7529cc2>] v4l2_ioctl+0x77/0x90 drivers/media/v4l2-core/v4l2-dev.c:360
    [<0000000061b5e6a9>] vfs_ioctl fs/ioctl.c:48 [inline]
    [<0000000061b5e6a9>] __do_sys_ioctl fs/ioctl.c:753 [inline]
    [<0000000061b5e6a9>] __se_sys_ioctl fs/ioctl.c:739 [inline]
    [<0000000061b5e6a9>] __x64_sys_ioctl+0xfc/0x140 fs/ioctl.c:739
    [<000000000139479b>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
    [<00000000d6de1c9c>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff88810f934300 (size 256):
  comm "syz-executor399", pid 8473, jiffies 4294942927 (age 8.030s)
  hex dump (first 32 bytes):
    03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<000000009fd00995>] kmalloc_node include/linux/slab.h:575 [inline]
    [<000000009fd00995>] kvmalloc_node+0x61/0xf0 mm/util.c:575
    [<0000000096a57c4a>] kvmalloc include/linux/mm.h:773 [inline]
    [<0000000096a57c4a>] video_usercopy+0x991/0xa50 drivers/media/v4l2-core/v4l2-ioctl.c:3303
    [<00000000f7529cc2>] v4l2_ioctl+0x77/0x90 drivers/media/v4l2-core/v4l2-dev.c:360
    [<0000000061b5e6a9>] vfs_ioctl fs/ioctl.c:48 [inline]
    [<0000000061b5e6a9>] __do_sys_ioctl fs/ioctl.c:753 [inline]
    [<0000000061b5e6a9>] __se_sys_ioctl fs/ioctl.c:739 [inline]
    [<0000000061b5e6a9>] __x64_sys_ioctl+0xfc/0x140 fs/ioctl.c:739
    [<000000000139479b>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
    [<00000000d6de1c9c>] entry_SYSCALL_64_after_hwframe+0x44/0xa9



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
