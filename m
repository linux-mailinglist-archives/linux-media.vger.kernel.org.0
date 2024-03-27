Return-Path: <linux-media+bounces-7993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4292C88EF44
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 20:34:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C7D61C349C7
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 19:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6A614E2E1;
	Wed, 27 Mar 2024 19:34:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D7F5227
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 19:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711568067; cv=none; b=M99+fLix/zB1JXmKNQYog5zmSwOE4faaKT7oysjYHC8nscOq6jye6iG/PdBH6f+qLFCzjYSvE5Kpl63B84oL0bJpQanVohhJycbqLHAEhYLzkMr1UpIklhMor8EboOub9HlmYMnEFtsKcsJ51bNq6YQHPElJpiUWj5ZF69HQ/aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711568067; c=relaxed/simple;
	bh=hQWKy53aTb2ih2XdPF/0YYMwKMWU1mu+KsbLNh3hTx0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=KWysCgXOdiFm6OTcDJxWbpK4vYhWzeQzBYwlxav/ikv9rbCdPxAYDW0joWg1n7PkWCWev/+haNSiOCC+rzkFIPW30aqz/ktq6ZwRsitNfp1983CTpsHKA3KSAidQqlcF1fs7IB+YayqZ4KUpDO7J903MjbEdO8fZc9DwtN3XMyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7cbf1d5d35bso19037239f.0
        for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 12:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711568065; x=1712172865;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MUyaCv8rddZ7Libs8b5LW6ZFZ1yn8SPg8ni9VsoSkMw=;
        b=f36kvOEffapiAU3cILXIQF/S3j+XeZYaAzVuCpDWrWwCprSESRwGJCh6g5ytduk5Z3
         72FF3NBtwH3sCTZGZQhnksfUVS23uzg2DRy8QPDCLFpmWaOzF+jZ1HCXrvfoCN06FRXb
         Bag9CZy9JraeYLnE8VbsH5Ryr05pqn6cc+KcYvd/P0irq+cXmajd0DYyBb/7iI3kaE+6
         ub1wmmgwZnEQGKhZVsu8VZ2qA80Y8a0gHnlgYipddr7LOwn89LMx4wjjhu7CSiWbNnKr
         qGSWkkeai7+k+qUK8u3fsNap8aYXJpcdxbDXyHM07w6uWkf9TzwvAiBqKetJsI9CsyEW
         SgsA==
X-Forwarded-Encrypted: i=1; AJvYcCVk3m+eudndv4v9HVGjFD6aNr/lpGfz89tpffXrnLWCW4Kb7VzcSgzan9yipMtByHB13A2dcBfU1S8dpugN24aZPbUrc7dWJVyAcKs=
X-Gm-Message-State: AOJu0YzTD/pWTRoVOPW+I9rz5QUglzhidpj2Z0hJa7poWcTHE2wPWl+U
	O9dGsi29/nxpg5yI7eB4JyA/QoLC6ZqExTrZOy7LTT/IZZMT2A4t6+bAIijm9XWtxjEU5HBtlrC
	mSPsdLs/g6Ci2fQ+dm79RDgt+oF5xSC/f8yqSMrK6SxgfPsHPpbIkXYA=
X-Google-Smtp-Source: AGHT+IEV6GoMsx/L+siSWIT568CoqM4zUbCVV5qQXk5smb/6xZ2kmaJoitb2EaIRWtLX4cwu5jzM7ToEaHDW0MEt6Jryh4sDqJUL
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:158e:b0:7cc:6af9:38a4 with SMTP id
 e14-20020a056602158e00b007cc6af938a4mr11354iow.4.1711568065434; Wed, 27 Mar
 2024 12:34:25 -0700 (PDT)
Date: Wed, 27 Mar 2024 12:34:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008cabee0614a97e81@google.com>
Subject: [syzbot] [media?] WARNING in call_s_stream
From: syzbot <syzbot+5bcd7c809d365e14c4df@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    480e035fc4c7 Merge tag 'drm-next-2024-03-13' of https://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=141370b1180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1e5b814e91787669
dashboard link: https://syzkaller.appspot.com/bug?extid=5bcd7c809d365e14c4df
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5f73b6ef963d/disk-480e035f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/46c949396aad/vmlinux-480e035f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e3b4d0f5a5f8/bzImage-480e035f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5bcd7c809d365e14c4df@syzkaller.appspotmail.com

vimc vimc.0: subdev_call error Scaler
------------[ cut here ]------------
WARNING: CPU: 1 PID: 7323 at drivers/media/v4l2-core/v4l2-subdev.c:412 call_s_stream+0x1f5/0x220 drivers/media/v4l2-core/v4l2-subdev.c:412
Modules linked in:
CPU: 1 PID: 7323 Comm: syz-executor.4 Not tainted 6.8.0-syzkaller-08073-g480e035fc4c7 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/29/2024
RIP: 0010:call_s_stream+0x1f5/0x220 drivers/media/v4l2-core/v4l2-subdev.c:412
Code: c1 e8 03 80 3c 28 00 74 08 4c 89 ff e8 a4 79 4c fa 49 8b 3f 48 c7 c6 a0 5a 64 8c 89 da e8 03 d0 c7 03 eb 9e e8 6c 2a e9 f9 90 <0f> 0b 90 eb b0 44 89 e1 80 e1 07 80 c1 03 38 c1 0f 8c ca fe ff ff
RSP: 0018:ffffc9000939f880 EFLAGS: 00010293
RAX: ffffffff87abcae4 RBX: 0000000000000000 RCX: ffff88801ee13c00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000001 R08: ffffffff87abc951 R09: 1ffff92001273e78
R10: dffffc0000000000 R11: ffffffff87abc8f0 R12: ffff888024a6c190
R13: 0000000000000000 R14: 1ffff1100494d832 R15: ffff888024a6c020
FS:  00007ff8da9646c0(0000) GS:ffff8880b9500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f3e3ed79198 CR3: 0000000049c48000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 vimc_streamer_pipeline_terminate+0x219/0x360 drivers/media/test-drivers/vimc/vimc-streamer.c:62
 vimc_streamer_s_stream+0x69f/0x800 drivers/media/test-drivers/vimc/vimc-streamer.c:203
 vimc_capture_start_streaming+0x230/0x440 drivers/media/test-drivers/vimc/vimc-capture.c:255
 vb2_start_streaming+0x12e/0x510 drivers/media/common/videobuf2/videobuf2-core.c:1676
 vb2_core_qbuf+0x87d/0x13b0 drivers/media/common/videobuf2/videobuf2-core.c:1850
 vb2_qbuf+0x31b/0x3b0 drivers/media/common/videobuf2/videobuf2-v4l2.c:827
 __video_do_ioctl+0xc26/0xde0 drivers/media/v4l2-core/v4l2-ioctl.c:3049
 video_usercopy+0x899/0x1180 drivers/media/v4l2-core/v4l2-ioctl.c:3390
 v4l2_ioctl+0x18c/0x1e0 drivers/media/v4l2-core/v4l2-dev.c:364
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:904 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:890
 do_syscall_64+0xfb/0x240
 entry_SYSCALL_64_after_hwframe+0x6d/0x75
RIP: 0033:0x7ff8d9c7dda9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 20 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ff8da9640c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007ff8d9dac050 RCX: 00007ff8d9c7dda9
RDX: 00000000200000c0 RSI: 00000000c058560f RDI: 0000000000000003
RBP: 00007ff8d9cca47a R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 000000000000006e R14: 00007ff8d9dac050 R15: 00007ff8d9ecfa48
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

