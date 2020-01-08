Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B57F133E5D
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 10:33:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727578AbgAHJdK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 04:33:10 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:48596 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727205AbgAHJdJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 04:33:09 -0500
Received: by mail-il1-f199.google.com with SMTP id u14so1664926ilq.15
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2020 01:33:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=LY7RClBCfw36dmo/Xb3qBZZhHQ24q33KuEw9ptEq/VY=;
        b=iBQ3lEA5UmrpSdSKGRyOz6Cg09cIsoCSwTghOtJVH9R3muRR7jze3GOYBhuCZH9H3t
         yvXm4WZ8pEOoVJ5Bv3o0ytZcjpztwwpOfEnKWXPG/tOIKunbV4kC7nYQ7b12FG/cPR4K
         ezm0o6lDXm/Wr9uWYv1ZgJ6ZY0pdt73SOY15r782QzOn4qHbpdHJBoTDh2bpQTy4IyBY
         ZVlXkiOpMPskj5MDKrCDWIBTb1hg9fu5MqKy09mxwPZ53vRP7odNe5sXEXPnxytfXLg9
         i7ZDvsTvnigO1rC1Nqh6v2cxPA9WobRaNCqFMepotiXitwKMBlta+Leac++ka072am1e
         H2ag==
X-Gm-Message-State: APjAAAWke6t62yED/DaPnqLXwns6Jtg2kCWRl6wGHEGkfTK/QMkKtxzj
        UGRuCCoxnhycIPjgzR7ERvYQpOKHW82pJhubluTQbh6Bnbxx
X-Google-Smtp-Source: APXvYqz4G2FuO9r54eh6MgioK3Oua2a3RF//e0XLPpt69iO1kgDvnoaLdTEXLQKYTjvPm3hSO2XRC2R14Ll9S1elVUIz/79dNKS2
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1014:: with SMTP id n20mr3071778ilj.172.1578475989335;
 Wed, 08 Jan 2020 01:33:09 -0800 (PST)
Date:   Wed, 08 Jan 2020 01:33:09 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a185d8059b9d94be@google.com>
Subject: KASAN: user-memory-access Write in video_usercopy
From:   syzbot <syzbot+54fd8cca4b7226c94b8e@syzkaller.appspotmail.com>
To:     arnd@arndb.de, hverkuil-cisco@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    26467385 Add linux-next specific files for 20200107
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=10d44076e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2265a716722be976
dashboard link: https://syzkaller.appspot.com/bug?extid=54fd8cca4b7226c94b8e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+54fd8cca4b7226c94b8e@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: user-memory-access in memset include/linux/string.h:411 [inline]
BUG: KASAN: user-memory-access in video_get_user+0x67f/0x890  
drivers/media/v4l2-core/v4l2-ioctl.c:3053
Write of size 512 at addr 00000000200001c0 by task syz-executor.2/1523

CPU: 1 PID: 1523 Comm: syz-executor.2 Not tainted  
5.5.0-rc5-next-20200107-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x197/0x210 lib/dump_stack.c:118
  __kasan_report.cold+0x5/0x32 mm/kasan/report.c:510
  kasan_report+0x12/0x20 mm/kasan/common.c:641
  check_memory_region_inline mm/kasan/generic.c:185 [inline]
  check_memory_region+0x134/0x1a0 mm/kasan/generic.c:192
  memset+0x24/0x40 mm/kasan/common.c:108
  memset include/linux/string.h:411 [inline]
  video_get_user+0x67f/0x890 drivers/media/v4l2-core/v4l2-ioctl.c:3053
  video_usercopy+0x21f/0x10b0 drivers/media/v4l2-core/v4l2-ioctl.c:3210
  video_ioctl2+0x2d/0x35 drivers/media/v4l2-core/v4l2-ioctl.c:3274
  v4l2_ioctl+0x1ac/0x230 drivers/media/v4l2-core/v4l2-dev.c:360
  vfs_ioctl fs/ioctl.c:47 [inline]
  ksys_ioctl+0x123/0x180 fs/ioctl.c:747
  __do_sys_ioctl fs/ioctl.c:756 [inline]
  __se_sys_ioctl fs/ioctl.c:754 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45af49
Code: ad b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 7b b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f5917b07c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 000000000045af49
RDX: 00000000200001c0 RSI: 0000001002008914 RDI: 0000000000000006
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f5917b086d4
R13: 00000000004c2837 R14: 00000000004d8b30 R15: 00000000ffffffff
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
