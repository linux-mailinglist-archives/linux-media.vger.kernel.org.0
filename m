Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7248635D7
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 14:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbfGIM1i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 08:27:38 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:53511 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbfGIM1I (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 08:27:08 -0400
Received: by mail-io1-f69.google.com with SMTP id h3so22894032iob.20
        for <linux-media@vger.kernel.org>; Tue, 09 Jul 2019 05:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=NebuMAkCn1+znBhCDmKMJxR+15w2PZJUV9MwEwc6ooc=;
        b=tFrCMwtcA5fq8GIBDguf1KPMerMQ5EbzkF2tOOlPSYWNNmh+TEyH2yyPwaAsOSxTQc
         ja2emVMg2fTRvfpvrFtfkQaumwFGHRmhjkdQXWSb3Y8XzzbCuQruflhucopslqOC7ndQ
         jgav7IezKZk5ZtfeD/Wi7azaatreg6vDvUs10Y8pNIekYOsTGzQXH0lI3hq1t1iu27df
         wXFl6mdESANMQp+jzxOf7D8sCnBkpmIkVV8N4/99WNMHac28mELVL7B/N6GH6KtBBiP4
         k+AwYhLVagkEDy1NW52WWi3UYbffhtR/207h4c67tLTQ49nmm26X5yW7gP649Ca+2h6F
         wcnw==
X-Gm-Message-State: APjAAAW+/CDzl0icG0EKLfHiVZGJETsioIZ5bLH9ug+7wzoxfL6LP6oC
        D8HJmc51sb6WI36XSFs72IPXziI/6bI1iHUlUpfu67a1X9jL
X-Google-Smtp-Source: APXvYqxOnYwlM/KwfZvRBaNh/afE0RR6116tCNtS6/Reiv8S1pCZegG1cKFDfqh8NqnK8YMGCdy5qXYdKkDVtdhbvxfaQWKUamSh
MIME-Version: 1.0
X-Received: by 2002:a5e:8b43:: with SMTP id z3mr3852350iom.287.1562675227812;
 Tue, 09 Jul 2019 05:27:07 -0700 (PDT)
Date:   Tue, 09 Jul 2019 05:27:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000da6a0e058d3ead50@google.com>
Subject: general protection fault in vidioc_querycap
From:   syzbot <syzbot+646272341e25afebff05@syzkaller.appspotmail.com>
To:     allison@lohutok.net, andreyknvl@google.com,
        gregkh@linuxfoundation.org, hverkuil@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    7829a896 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=1321f9a3a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f6d4561982f71f63
dashboard link: https://syzkaller.appspot.com/bug?extid=646272341e25afebff05
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12ac261ba00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=171d6739a00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+646272341e25afebff05@syzkaller.appspotmail.com

kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] SMP KASAN
CPU: 1 PID: 1878 Comm: v4l_id Not tainted 5.2.0-rc6+ #13
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:usb_make_path include/linux/usb.h:913 [inline]
RIP: 0010:vidioc_querycap+0x12d/0x3e0  
drivers/media/usb/usbvision/usbvision-video.c:461
Code: 3c 02 00 0f 85 ba 02 00 00 49 8b ac 24 58 16 00 00 48 b8 00 00 00 00  
00 fc ff df 48 8d 7d 48 4c 8d 45 04 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f  
85 7d 02 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b
RSP: 0018:ffff8881cc727a28 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff8881cc727c20 RCX: 0000000000000000
RDX: 0000000000000009 RSI: 451f481f4b404f27 RDI: 0000000000000048
RBP: 0000000000000000 R08: 0000000000000004 R09: fffffbfff0c9ba38
R10: fffffbfff0c9ba37 R11: ffffffff864dd1b8 R12: ffff8881cc9aa100
R13: ffff8881cc9ab804 R14: ffff8881cc9aa998 R15: ffff8881cc727c50
FS:  00007f579210f700(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000625208 CR3: 00000001cd192000 CR4: 00000000001406e0
Call Trace:
  v4l_querycap+0x121/0x340 drivers/media/v4l2-core/v4l2-ioctl.c:1058
  __video_do_ioctl+0x5b0/0xb30 drivers/media/v4l2-core/v4l2-ioctl.c:2871
  video_usercopy+0x446/0xee0 drivers/media/v4l2-core/v4l2-ioctl.c:3053
  v4l2_ioctl+0x147/0x1a0 drivers/media/v4l2-core/v4l2-dev.c:360
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xcda/0x12e0 fs/ioctl.c:696
  ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
  do_syscall_64+0xb7/0x560 arch/x86/entry/common.c:301
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x7f5791c42347
Code: 90 90 90 48 8b 05 f1 fa 2a 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff  
ff c3 90 90 90 90 90 90 90 90 90 90 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 73 01 c3 48 8b 0d c1 fa 2a 00 31 d2 48 29 c2 64
RSP: 002b:00007ffced1878d8 EFLAGS: 00000206 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f5791c42347
RDX: 00007ffced1878e0 RSI: 0000000080685600 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000400884
R13: 00007ffced187a30 R14: 0000000000000000 R15: 0000000000000000
Modules linked in:
---[ end trace 5550531bc37b28bc ]---
RIP: 0010:usb_make_path include/linux/usb.h:913 [inline]
RIP: 0010:vidioc_querycap+0x12d/0x3e0  
drivers/media/usb/usbvision/usbvision-video.c:461
Code: 3c 02 00 0f 85 ba 02 00 00 49 8b ac 24 58 16 00 00 48 b8 00 00 00 00  
00 fc ff df 48 8d 7d 48 4c 8d 45 04 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f  
85 7d 02 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b
RSP: 0018:ffff8881cc727a28 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff8881cc727c20 RCX: 0000000000000000
RDX: 0000000000000009 RSI: 451f481f4b404f27 RDI: 0000000000000048
RBP: 0000000000000000 R08: 0000000000000004 R09: fffffbfff0c9ba38
R10: fffffbfff0c9ba37 R11: ffffffff864dd1b8 R12: ffff8881cc9aa100
R13: ffff8881cc9ab804 R14: ffff8881cc9aa998 R15: ffff8881cc727c50
FS:  00007f579210f700(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000625208 CR3: 00000001cd192000 CR4: 00000000001406e0


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
