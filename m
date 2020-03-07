Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B628517CF88
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 18:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgCGRpO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 12:45:14 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:37714 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgCGRpO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Mar 2020 12:45:14 -0500
Received: by mail-io1-f72.google.com with SMTP id p4so3746724ioo.4
        for <linux-media@vger.kernel.org>; Sat, 07 Mar 2020 09:45:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=adrPTs5EReBXNjXAz2JJkhvKUk54b45LCW/ZFGpHhpw=;
        b=gTZ3YTxLlHxW2K3eq8df8aW1lluBkNcoTqotqktfi6zykov00EHmhfM6yLhfhJ9s5R
         oYHtxqPsKMGPGfiL81eiCpmh8JMUAsQQxn5TxvBw55ZbVcQIbHHQLRCgohMDLcEfB3kT
         3QFN+3lLSAs0/+0BMS47ZiIfqhvabN28SV/mEGtvZ3PxZkpeHdAgL8Tih84Qme9ZK4WE
         GmIRWuLP/u8p6cwgJl3mUxTC/V+JU7ZYKczxcG8vETc3WYuE9EIufGf+zzn2BcMhSYKF
         hbMRrbBPc8/RdDogz2227pPd5xksulNUpVnT1/wJbxXPaHtLywKdSl/F+ldM13jqvAH8
         cLdg==
X-Gm-Message-State: ANhLgQ3Gveuyuh90MTxSYKl3XlsjFwvx3VT/UhoLJFwROpk8qsM8ySiB
        YOs/224eHsiRJQs03Y3BzcGwa4f3DxH+KM9iYwuWtHwueOfH
X-Google-Smtp-Source: ADFU+vvPJdT0lErpVGKSwp+bdK2H2RInnrNgD5oOyHnfRJO1wLyxv3r1p4RZSjsApzQx1kabfKjTAgJitFO44xE95LVcgxfygpc2
MIME-Version: 1.0
X-Received: by 2002:a92:670f:: with SMTP id b15mr8527912ilc.71.1583603111955;
 Sat, 07 Mar 2020 09:45:11 -0800 (PST)
Date:   Sat, 07 Mar 2020 09:45:11 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f415bd05a047548f@google.com>
Subject: kernel BUG at drivers/dma-buf/dma-buf.c:LINE!
From:   syzbot <syzbot+d6734079f30f7fc39021@syzkaller.appspotmail.com>
To:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    63623fd4 Merge tag 'for-linus' of git://git.kernel.org/pub..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=177bf331e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9833e26bab355358
dashboard link: https://syzkaller.appspot.com/bug?extid=d6734079f30f7fc39021
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=109d3ac3e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+d6734079f30f7fc39021@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at drivers/dma-buf/dma-buf.c:99!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 18500 Comm: syz-executor.0 Not tainted 5.6.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:dma_buf_release+0x35b/0x420 drivers/dma-buf/dma-buf.c:99
Code: 00 00 e8 f8 d3 ec fc 4c 89 e7 45 31 e4 e8 ed 7a 35 fd e8 38 25 f7 fc 44 89 e0 5b 41 5c 41 5d 41 5e 41 5f 5d c3 e8 25 25 f7 fc <0f> 0b e8 1e 25 f7 fc 4c 89 ef e8 46 eb 00 00 eb 97 e8 0f 25 f7 fc
RSP: 0018:ffffc9000296fdc8 EFLAGS: 00010293
RAX: ffff888094086300 RBX: 0000000000000004 RCX: ffffffff847e6fc5
RDX: 0000000000000000 RSI: ffffffff847e722b RDI: 0000000000000005
RBP: ffffc9000296fdf0 R08: ffff888094086300 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff88808c6ec800
R13: ffff88808e6ecd7c R14: ffff88808e6ecd28 R15: ffff888097011940
FS:  0000000002b7b940(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000008a9e80 CR3: 00000000916f0000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __fput+0x2ff/0x890 fs/file_table.c:280
 ____fput+0x16/0x20 fs/file_table.c:313
 task_work_run+0x145/0x1c0 kernel/task_work.c:113
 tracehook_notify_resume include/linux/tracehook.h:188 [inline]
 exit_to_usermode_loop+0x316/0x380 arch/x86/entry/common.c:164
 prepare_exit_to_usermode arch/x86/entry/common.c:195 [inline]
 syscall_return_slowpath arch/x86/entry/common.c:278 [inline]
 do_syscall_64+0x676/0x790 arch/x86/entry/common.c:304
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x416011
Code: 75 14 b8 03 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 04 1b 00 00 c3 48 83 ec 08 e8 0a fc ff ff 48 89 04 24 b8 03 00 00 00 0f 05 <48> 8b 3c 24 48 89 c2 e8 53 fc ff ff 48 89 d0 48 83 c4 08 48 3d 01
RSP: 002b:00007fff23e39030 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000009 RCX: 0000000000416011
RDX: 0000000000000000 RSI: 0000000000000081 RDI: 0000000000000008
RBP: 0000000000000000 R08: 0000000000000000 R09: 01ffffffffffffff
R10: 0000000000770938 R11: 0000000000000293 R12: 000000000076bf20
R13: 0000000000770948 R14: 0000000000000000 R15: 000000000076bf2c
Modules linked in:
---[ end trace 432bc1955550b75d ]---
RIP: 0010:dma_buf_release+0x35b/0x420 drivers/dma-buf/dma-buf.c:99
Code: 00 00 e8 f8 d3 ec fc 4c 89 e7 45 31 e4 e8 ed 7a 35 fd e8 38 25 f7 fc 44 89 e0 5b 41 5c 41 5d 41 5e 41 5f 5d c3 e8 25 25 f7 fc <0f> 0b e8 1e 25 f7 fc 4c 89 ef e8 46 eb 00 00 eb 97 e8 0f 25 f7 fc
RSP: 0018:ffffc9000296fdc8 EFLAGS: 00010293
RAX: ffff888094086300 RBX: 0000000000000004 RCX: ffffffff847e6fc5
RDX: 0000000000000000 RSI: ffffffff847e722b RDI: 0000000000000005
RBP: ffffc9000296fdf0 R08: ffff888094086300 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff88808c6ec800
R13: ffff88808e6ecd7c R14: ffff88808e6ecd28 R15: ffff888097011940
FS:  0000000002b7b940(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000008a9e80 CR3: 00000000916f0000 CR4: 00000000001406e0
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
