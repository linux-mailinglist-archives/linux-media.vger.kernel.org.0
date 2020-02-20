Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9544F1659D7
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2020 10:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbgBTJIM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Feb 2020 04:08:12 -0500
Received: from mail-io1-f71.google.com ([209.85.166.71]:55686 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbgBTJIM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Feb 2020 04:08:12 -0500
Received: by mail-io1-f71.google.com with SMTP id z21so2146181iob.22
        for <linux-media@vger.kernel.org>; Thu, 20 Feb 2020 01:08:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=4rw0gQpQnZk+CZTyqoVbFEYEdsf54WxpWJrLPHEp50A=;
        b=hXQ+0pdltBj9lfLGPqATnjMqsPALqws+gFETCUZnq1QgRXHFgMl/Leu9zUme56QcZg
         kZzmzoAwGuQrPhqugMTzqE0oFdK7Aj0uN0RZBsxqm3Q894vs5K5adM5Qr8BGY17dXTz7
         oIWAQPyx4TZN1rhsauhONJND0neFQEGLlybwuKroA6HYdGstbFQT8M4pgSWF0lywzMt0
         J1BrK+EE7lHXSFV42GFWusETHLLbYb8bJnjwSzhx6UQIgyi+vMUyUhtOJzHLMHperNW6
         B9qnSTXATYE3BhYohOvUzR7yDBSDQW3/Z+N5jkF0YrlSjLlnsfHyl7AlVpJlUiy9V9f1
         BUiw==
X-Gm-Message-State: APjAAAWO51yMvrnwBzXvq/M1Uva+KcRGKLhf9HaY3mL13RsPkrRk44zX
        DX+NjgYwWn4SYeohLis++Z4IME+qUclFt9vGN59EVHwBWQ67
X-Google-Smtp-Source: APXvYqyLmWkWi+b/aUPbnHxTmdF61uLlxMshHPca4jVc5ZpYNLrxcJpI3pZeToN4IDHZuTNyz8nfLCPS4OwlSUoKtoKEka7eSakG
MIME-Version: 1.0
X-Received: by 2002:a92:9f1b:: with SMTP id u27mr28596712ili.173.1582189691814;
 Thu, 20 Feb 2020 01:08:11 -0800 (PST)
Date:   Thu, 20 Feb 2020 01:08:11 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008c49b4059efe3e74@google.com>
Subject: KMSAN: kernel-infoleak in video_usercopy (2)
From:   syzbot <syzbot+c67f8c1e31d62912ff2f@syzkaller.appspotmail.com>
To:     arnd@arndb.de, glider@google.com, hverkuil-cisco@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    8bbbc5cf kmsan: don't compile memmove
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=178f51b5e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cd0e9a6b0e555cc3
dashboard link: https://syzkaller.appspot.com/bug?extid=c67f8c1e31d62912ff2f
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11f39f95e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14c423d9e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+c67f8c1e31d62912ff2f@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: kernel-infoleak in kmsan_copy_to_user+0x81/0x90 mm/kmsan/kmsan_hooks.c:253
CPU: 1 PID: 11474 Comm: syz-executor301 Not tainted 5.6.0-rc2-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1c9/0x220 lib/dump_stack.c:118
 kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:118
 kmsan_internal_check_memory+0x238/0x3d0 mm/kmsan/kmsan.c:423
 kmsan_copy_to_user+0x81/0x90 mm/kmsan/kmsan_hooks.c:253
 _copy_to_user+0x15a/0x1f0 lib/usercopy.c:33
 copy_to_user include/linux/uaccess.h:174 [inline]
 video_put_user drivers/media/v4l2-core/v4l2-ioctl.c:3165 [inline]
 video_usercopy+0x248c/0x2b50 drivers/media/v4l2-core/v4l2-ioctl.c:3264
 video_ioctl2+0x9f/0xb0 drivers/media/v4l2-core/v4l2-ioctl.c:3274
 v4l2_ioctl+0x23f/0x270 drivers/media/v4l2-core/v4l2-dev.c:360
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl fs/ioctl.c:763 [inline]
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl+0x2e9/0x410 fs/ioctl.c:770
 __x64_sys_ioctl+0x4a/0x70 fs/ioctl.c:770
 do_syscall_64+0xb8/0x160 arch/x86/entry/common.c:296
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x440289
Code: 18 89 d0 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 fb 13 fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffe00ee4fc8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000004002c8 RCX: 0000000000440289
RDX: 00000000200000c0 RSI: 00000000c050560f RDI: 0000000000000003
RBP: 00000000006ca018 R08: 00000000004002c8 R09: 00000000004002c8
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000401b10
R13: 0000000000401ba0 R14: 0000000000000000 R15: 0000000000000000

Local variable ----vb32.i@video_usercopy created at:
 video_put_user drivers/media/v4l2-core/v4l2-ioctl.c:3149 [inline]
 video_usercopy+0x20bf/0x2b50 drivers/media/v4l2-core/v4l2-ioctl.c:3264
 video_put_user drivers/media/v4l2-core/v4l2-ioctl.c:3149 [inline]
 video_usercopy+0x20bf/0x2b50 drivers/media/v4l2-core/v4l2-ioctl.c:3264

Bytes 52-55 of 80 are uninitialized
Memory access of size 80 starts at ffffa88f81563ce0
Data copied to user address 00000000200000c0
=====================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
