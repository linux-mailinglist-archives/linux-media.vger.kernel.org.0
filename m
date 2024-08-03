Return-Path: <linux-media+bounces-15736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3644B9466F6
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 05:01:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 521E11C20C82
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 03:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E43101CA;
	Sat,  3 Aug 2024 03:01:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3934683
	for <linux-media@vger.kernel.org>; Sat,  3 Aug 2024 03:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722654100; cv=none; b=BqlJfrdDXENeE+4GnUK/OkUXriC2z3UGbTIHwGyKKWAALrrxSSJBzOdhJGmxC/7lCa6tFOpHoZVoRTj0A+IPa3MGFyVrlkOGuSBXAUXMcko6BIl7Jpk9G/1yFFoNK6Zj0KtIFRPrpOZIwjIPuYkEUwOT3O9EuuSOf5t/avNkM08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722654100; c=relaxed/simple;
	bh=2PR3qhoGnm0AvRxZp87Me2ywbgB7BFV29r9IbAQsDNQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=nrE5syBCdbfvnHoBCSjbnKjasn0d9tqjGdjIC/aonVqyqGUGSCeD/TwhstbVgrgS74MUfZPF5QQBM+7R5+faML2rIxtJ3FQmscxr2+lPIEKDf2+8roEUd4BHhlaVJQbOQ4wktoSbdzLGgIuBzd7cGoQdwu0d3QDN4YiRhkrQ9RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-8036e96f0caso1218393839f.0
        for <linux-media@vger.kernel.org>; Fri, 02 Aug 2024 20:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722654098; x=1723258898;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jj2i10BNQHB9xdBgUAAVaGeqNtO2gPAwUCggaU6qdFo=;
        b=saBk8qf1u4s8ynxqawd7I3ZcY6wNTx+25RuCK38y+zwhMGnNsCy09bdU+m52XA6ENZ
         q8pkuuhS8/rQRAZMuqaZE7xrxEHmBVraa8CXiPtnB4uD37R6unibGr5zVf5VNnSx5vyu
         6v60fAcB3rDlmr9rG6f6LOQENBCYmiYng1EWZhyAyymivFwBYKvSgv61Sj/zY5lewPIu
         9VPyhqkdifcl6FDZpm22H1NwWzCwnv6Lwp7VD6CynYjXb4WRelOtdVY14M57kw8VbUOw
         8MaSi9Mp6TmUoarTPmV7UtNvRXPzaXCl0bkSCK01IhLYhudHO9IAxwm5A6aVDECvDFsz
         WZjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWPd2o103znxNlD8RbVeDVu/v3sEq/koMdo3JGDS9mOkS1xyfqqqJPYUStAanHRX7eUsbwYdnrBD2Y9cXKC7vhw8f+mzQ7AwjdoyM=
X-Gm-Message-State: AOJu0YzdNjCYIIPG6gCb03xEzoB7a7VzN9iO+mFeaQm31cvX2HyCyit5
	fVVqjVIqENasEOVeM1fN1ulvXmh31+L1utUJOHSJIwzX2+COGZmGn/K3M7i0K2fnPRV19nv6k9P
	fM/qAA3/lO9w4vroZbeO2B5CGvEvG8MEj7M/wLUlq7tf8tXeyWoIvn+Y=
X-Google-Smtp-Source: AGHT+IF4CybsTRRvI97V0I9KVxBa4F3+6v5wAwVQKHhNvhBKmsqH2LovKVKr0n87gdPqSi9JHciE+a+3E3VCrhruMOsJYWZZ/T7a
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d8a:b0:376:417e:c2ab with SMTP id
 e9e14a558f8ab-39b1fc44fd0mr2719995ab.5.1722654098034; Fri, 02 Aug 2024
 20:01:38 -0700 (PDT)
Date: Fri, 02 Aug 2024 20:01:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000095a6be061ebea91f@google.com>
Subject: [syzbot] [staging?] [usb?] WARNING in r8712_usb_write_mem/usb_submit_urb
 (2)
From: syzbot <syzbot+ca2eaaadab55de6a5a42@syzkaller.appspotmail.com>
To: florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    1722389b0d86 Merge tag 'net-6.11-rc1' of git://git.kernel...
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=12d2a623980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e3044dca4d5f6dbe
dashboard link: https://syzkaller.appspot.com/bug?extid=ca2eaaadab55de6a5a42
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=123da96d980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1560c223980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/78a5695ed7e2/disk-1722389b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1507b4c5000d/vmlinux-1722389b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/449aa9e94d6b/bzImage-1722389b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ca2eaaadab55de6a5a42@syzkaller.appspotmail.com

------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 3 != type 1
WARNING: CPU: 0 PID: 2583 at drivers/usb/core/urb.c:503 usb_submit_urb+0xe4b/0x1730 drivers/usb/core/urb.c:503
Modules linked in:
CPU: 0 UID: 0 PID: 2583 Comm: dhcpcd Not tainted 6.10.0-syzkaller-g1722389b0d86 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
RIP: 0010:usb_submit_urb+0xe4b/0x1730 drivers/usb/core/urb.c:503
Code: 84 3c 02 00 00 e8 a5 eb fe fc 4c 89 ef e8 2d 21 d7 fe 45 89 e0 89 e9 4c 89 f2 48 89 c6 48 c7 c7 e0 17 a0 87 e8 96 dc c4 fc 90 <0f> 0b 90 90 e9 e9 f8 ff ff e8 77 eb fe fc 49 81 c4 c0 05 00 00 e9
RSP: 0018:ffffc900015b7678 EFLAGS: 00010282
RAX: 0000000000000000 RBX: ffff888103e8ad00 RCX: ffffffff81194ce9
RDX: ffff88810e70ba00 RSI: ffffffff81194cf6 RDI: 0000000000000001
RBP: 0000000000000003 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000001
R13: ffff888100fec0a8 R14: ffff888109f01e00 R15: ffff888103e8ad7c
FS:  00007f3757320740(0000) GS:ffff8881f6200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd527ba8870 CR3: 000000010c766000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 r8712_usb_write_mem+0x2e4/0x3f0 drivers/staging/rtl8712/usb_ops_linux.c:170
 rtl8712_dl_fw+0x7ab/0xfe0 drivers/staging/rtl8712/hal_init.c:203
 rtl8712_hal_init drivers/staging/rtl8712/hal_init.c:330 [inline]
 rtl871x_hal_init+0xb3/0x190 drivers/staging/rtl8712/hal_init.c:394
 netdev_open+0xea/0x800 drivers/staging/rtl8712/os_intfs.c:397
 __dev_open+0x2d4/0x4e0 net/core/dev.c:1474
 __dev_change_flags+0x561/0x720 net/core/dev.c:8837
 dev_change_flags+0x8f/0x160 net/core/dev.c:8909
 devinet_ioctl+0x127a/0x1f10 net/ipv4/devinet.c:1177
 inet_ioctl+0x3aa/0x3f0 net/ipv4/af_inet.c:1003
 sock_do_ioctl+0x116/0x280 net/socket.c:1222
 sock_ioctl+0x22e/0x6c0 net/socket.c:1341
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl fs/ioctl.c:893 [inline]
 __x64_sys_ioctl+0x193/0x220 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f37573eed49
Code: 5c c3 48 8d 44 24 08 48 89 54 24 e0 48 89 44 24 c0 48 8d 44 24 d0 48 89 44 24 c8 b8 10 00 00 00 c7 44 24 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 76 10 48 8b 15 ae 60 0d 00 f7 d8 41 83 c8
RSP: 002b:00007ffe0c834f48 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f37573206c0 RCX: 00007f37573eed49
RDX: 00007ffe0c845138 RSI: 0000000000008914 RDI: 0000000000000005
RBP: 00007ffe0c8552f8 R08: 00007ffe0c8450f8 R09: 00007ffe0c8450a8
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffe0c845138 R14: 0000000000000028 R15: 0000000000008914
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

