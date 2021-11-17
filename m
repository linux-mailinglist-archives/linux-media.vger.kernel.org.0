Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27F98454F61
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 22:33:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239664AbhKQVgf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 16:36:35 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:36858 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235649AbhKQVgb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 16:36:31 -0500
Received: by mail-io1-f72.google.com with SMTP id w16-20020a5d8a10000000b005e241c13c7bso2325760iod.3
        for <linux-media@vger.kernel.org>; Wed, 17 Nov 2021 13:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=HtOEfgBkkhSqyK1qfuHXImnaPFywsRWVYEdA+Wk8yiE=;
        b=6dNuS5hVcvg4y4qp5F461lD+IfCMo/GR5YsP4KaER9zZhsOenD7tyhVr+f2jENYcTp
         a2RJVCXrL/mGl2YhdoSyhE5lusuafF7UuWT9xqD5kjdvjKVzBPPdg2p9ukcDY9WAhkhJ
         WMNVA4Ahdkna5OXJa0grIAR7/3KqhHoS0muoQT033PkROtGgfFkIaRHzwTgl6eF2daFs
         mdlY1o+oKfm/UDeE9oNX73CU9ccjT+Om89uYD30HruDFvExpLfTp9WVjEZKq3C3NpWaA
         SmWsVSs+Bis1d+gnyAOr6B3e/gJfV4IYkmh7r7AlcxRdpuGuHbkadjHh8fZZSFKkwBau
         HZXg==
X-Gm-Message-State: AOAM532nsWS7VriC1pj1PZps1pm9fP7beUqiq+kM18m6guc6bVDkuAnN
        mcG9cJ6cUH2nyq1lI0efsAN0ARzZ6o/ZdtHHfy0FdfV2cu+o
X-Google-Smtp-Source: ABdhPJw6z0vhpa6F+0lDRaMkRXVMJW1Rh0CiCZcWKmx7jDvqh7g88SSQIGmrzt5lsu6CrAoY47mkZsViSZPKVcEazFiugPmAceHG
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2e90:: with SMTP id m16mr13715000iow.92.1637184812636;
 Wed, 17 Nov 2021 13:33:32 -0800 (PST)
Date:   Wed, 17 Nov 2021 13:33:32 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000305e3b05d102cbc4@google.com>
Subject: [syzbot] WARNING in vivid_cap_update_frame_period
From:   syzbot <syzbot+8e740e8a74e295b37726@syzkaller.appspotmail.com>
To:     hverkuil@xs4all.nl, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    66f4beaa6c1d Merge branch 'linus' of git://git.kernel.org/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14f43b9eb00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a262045c4c15a9e0
dashboard link: https://syzkaller.appspot.com/bug?extid=8e740e8a74e295b37726
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8e740e8a74e295b37726@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 29933 at drivers/media/test-drivers/vivid/vivid-kthread-cap.c:664 vivid_cap_update_frame_period+0x16d/0x1f0 drivers/media/test-drivers/vivid/vivid-kthread-cap.c:664
Modules linked in:
CPU: 1 PID: 29933 Comm: vivid-001-vid-c Not tainted 5.15.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:vivid_cap_update_frame_period+0x16d/0x1f0 drivers/media/test-drivers/vivid/vivid-kthread-cap.c:664
Code: 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 79 48 89 ab d8 a0 00 00 48 83 c4 08 5b 5d 41 5c 41 5d c3 e8 e3 bf 4d fb <0f> 0b 48 b8 00 00 00 00 00 fc ff df 4c 89 ea 48 c1 ea 03 0f b6 14
RSP: 0018:ffffc90017c37e48 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff8881489b0000 RCX: 0000000000000000
RDX: ffff88807d831d00 RSI: ffffffff862a068d RDI: 0000000000000003
RBP: 000000a336db2200 R08: 0000000000000000 R09: 0000000000000001
R10: ffffffff862a05a9 R11: 0000000000000000 R12: 0000000000000000
R13: ffff8881489b9344 R14: ffff8881489b0000 R15: ffff8881489b0000
FS:  0000000000000000(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555556fb1708 CR3: 000000006ff99000 CR4: 00000000003526e0
Call Trace:
 <TASK>
 vivid_thread_vid_cap+0x1ab/0xaf0 drivers/media/test-drivers/vivid/vivid-kthread-cap.c:816
 kthread+0x405/0x4f0 kernel/kthread.c:327
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
 </TASK>
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 29933 Comm: vivid-001-vid-c Not tainted 5.15.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 panic+0x2b0/0x6dd kernel/panic.c:232
 __warn.cold+0x35/0x44 kernel/panic.c:603
 report_bug+0x1bd/0x210 lib/bug.c:199
 handle_bug+0x3c/0x60 arch/x86/kernel/traps.c:239
 exc_invalid_op+0x14/0x40 arch/x86/kernel/traps.c:259
 asm_exc_invalid_op+0x12/0x20 arch/x86/include/asm/idtentry.h:566
RIP: 0010:vivid_cap_update_frame_period+0x16d/0x1f0 drivers/media/test-drivers/vivid/vivid-kthread-cap.c:664
Code: 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 79 48 89 ab d8 a0 00 00 48 83 c4 08 5b 5d 41 5c 41 5d c3 e8 e3 bf 4d fb <0f> 0b 48 b8 00 00 00 00 00 fc ff df 4c 89 ea 48 c1 ea 03 0f b6 14
RSP: 0018:ffffc90017c37e48 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff8881489b0000 RCX: 0000000000000000
RDX: ffff88807d831d00 RSI: ffffffff862a068d RDI: 0000000000000003
RBP: 000000a336db2200 R08: 0000000000000000 R09: 0000000000000001
R10: ffffffff862a05a9 R11: 0000000000000000 R12: 0000000000000000
R13: ffff8881489b9344 R14: ffff8881489b0000 R15: ffff8881489b0000
 vivid_thread_vid_cap+0x1ab/0xaf0 drivers/media/test-drivers/vivid/vivid-kthread-cap.c:816
 kthread+0x405/0x4f0 kernel/kthread.c:327
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
 </TASK>
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
