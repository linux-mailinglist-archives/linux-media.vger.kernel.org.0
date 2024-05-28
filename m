Return-Path: <linux-media+bounces-12066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6028D160C
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 10:14:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 748BC2874BA
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 08:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C2813AD0D;
	Tue, 28 May 2024 08:14:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD2E17E90E
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 08:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716884073; cv=none; b=dUwc7gHCVDewoYVvjWSgY+pD9UykIlA4ILzvlk2OjMOOzUxIZZTanU3YdjTx6YjO/X1rddErxTw0I83Q5mgronmvKteq2Rv3+YB2ZMHsORpiwHew11xItIMzCyqCgsijUnwXnGgbn1bLtK0VZl1VhBDYC62P5xG1zDlWrJY5YS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716884073; c=relaxed/simple;
	bh=0eWo8k2SiyzsJ9fYOcUPFq5LIaob+zHGyuf05nLWH7A=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=PjW/iL+RQZhn/kw9PpeZD3LhLIgD6nbdyUjxOqotdExdP9BNWi8nsl1hKgV6O7CbsdUpiGL43c6KVgQB7TweKeGFQLa7hoDQON1IOxppoX2qLWEIXPm723K3qaAE1Ijf4h3w1IxEeb76fU7qeaM8W6IAAHX5mQOMUG0+B12FLw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-36eb89514a7so4000065ab.0
        for <linux-media@vger.kernel.org>; Tue, 28 May 2024 01:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716884070; x=1717488870;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zAUolh23tKq5wYxUqvc7bBcvTVTp+n7VeXwB2rrSAdo=;
        b=A+hqYnUizczWI8B97Sf66Fr/jW0aNv1U48fXFfBQsqZ+TstBAUC37iq8QbiFoseqTx
         y6QJd5EX4MeW+RMsPQo4bPiOZtufDj0LX7tKSRL6RGLyMInoRmeZ5/R2KLyk5zDkwg+E
         i6Lok/PEE3M9sIbu1AHJKJVevtXAqh3ain18ltGA3z/55bxh5nQsMm7wrb3KiWU/uLyC
         nqV1krCsxmHeIldL8CbznWveHz2TMmX35P1YA2vBPkCvkmbgD1KFoV2/VVxCrO5DRJLo
         TOCNvHswr0ljFfKLZ/W4cMNGLEp1iXtLKrsNR9DVBGO9x9k7fc7eS/BlAxatFgtWXZwk
         QwQg==
X-Forwarded-Encrypted: i=1; AJvYcCVoCA8tkmvCpRVFgE5F+ofPa54RHn1GM+15n+cZ6QYpnXiyQ3O4MTFlAhLc7yEo6fBrXmsFWW0LXIgPbDocmvjgTWHeXKUJvW09WwE=
X-Gm-Message-State: AOJu0YwAyDGM0GcjONlKIPFTzMIpl/dclFABQ4zuZusED1raEypc/laj
	ew5CoMqKUE0q2GT9UYK3MgRzLJgFq3AO38vDdiYwpNkmkGo82Y3rmP2doU/3MLXuDh3kvhAubGM
	OigspfTZklG7nWY5z5wE1fpIv0JQB+skdauLuipOhurcSuDsaBd21jQk=
X-Google-Smtp-Source: AGHT+IHdDIPe/efUxBHApkpoQj8KwBVey4m9Z9nkIX1iqS9LOA9uWHHZOm5WG8g++TidpPWlotNE3rlPYcEutO+WV0CDktKD2PfY
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d09:b0:371:e497:209 with SMTP id
 e9e14a558f8ab-3737b2ba7a5mr7300575ab.1.1716884070294; Tue, 28 May 2024
 01:14:30 -0700 (PDT)
Date: Tue, 28 May 2024 01:14:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002174ba06197f39c1@google.com>
Subject: [syzbot] [dri?] [media?] general protection fault in udmabuf_create (2)
From: syzbot <syzbot+40c7dad27267f61839d4@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	kraxel@redhat.com, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    6dc544b66971 Add linux-next specific files for 20240528
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1590bec8980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6a363b35598e573d
dashboard link: https://syzkaller.appspot.com/bug?extid=40c7dad27267f61839d4
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/334699ab67f8/disk-6dc544b6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4ca32b2218ce/vmlinux-6dc544b6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/400bc5f019b3/bzImage-6dc544b6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+40c7dad27267f61839d4@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] PREEMPT SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
CPU: 1 PID: 7202 Comm: syz-executor.4 Not tainted 6.10.0-rc1-next-20240528-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024
RIP: 0010:PageTail include/linux/page-flags.h:284 [inline]
RIP: 0010:const_folio_flags include/linux/page-flags.h:312 [inline]
RIP: 0010:folio_test_head include/linux/page-flags.h:837 [inline]
RIP: 0010:folio_test_large include/linux/page-flags.h:858 [inline]
RIP: 0010:folio_nr_pages include/linux/mm.h:2076 [inline]
RIP: 0010:udmabuf_create+0xa54/0x11c0 drivers/dma-buf/udmabuf.c:376
Code: 01 00 00 48 8b 44 24 70 42 80 3c 28 00 48 8b 5c 24 68 74 08 48 89 df e8 fa d5 ee fb 4c 8b 3b 49 8d 5f 08 48 89 d8 48 c1 e8 03 <42> 80 3c 28 00 74 08 48 89 df e8 dd d5 ee fb 48 8b 1b 48 89 de 48
RSP: 0018:ffffc9000cfcfbe0 EFLAGS: 00010202
RAX: 0000000000000001 RBX: 0000000000000008 RCX: dffffc0000000000
RDX: ffffc90009011000 RSI: 0000000000000cc5 RDI: 0000000000000cc6
RBP: ffffc9000cfcfd70 R08: ffffffff8fad856f R09: 1ffffffff1f5b0ad
R10: dffffc0000000000 R11: fffffbfff1f5b0ae R12: 0000000000000001
R13: dffffc0000000000 R14: ffff88801bf793a8 R15: 0000000000000000
FS:  00007fb83bd9f6c0(0000) GS:ffff8880b9500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b32f21000 CR3: 000000002e5d8000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 udmabuf_ioctl_create_list drivers/dma-buf/udmabuf.c:439 [inline]
 udmabuf_ioctl+0x3b2/0x4f0 drivers/dma-buf/udmabuf.c:454
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb83b07cee9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 20 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fb83bd9f0c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fb83b1b3f80 RCX: 00007fb83b07cee9
RDX: 00000000200000c0 RSI: 0000000040087543 RDI: 0000000000000003
RBP: 00007fb83b0c947f R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 000000000000000b R14: 00007fb83b1b3f80 R15: 00007ffd6ccc32c8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:PageTail include/linux/page-flags.h:284 [inline]
RIP: 0010:const_folio_flags include/linux/page-flags.h:312 [inline]
RIP: 0010:folio_test_head include/linux/page-flags.h:837 [inline]
RIP: 0010:folio_test_large include/linux/page-flags.h:858 [inline]
RIP: 0010:folio_nr_pages include/linux/mm.h:2076 [inline]
RIP: 0010:udmabuf_create+0xa54/0x11c0 drivers/dma-buf/udmabuf.c:376
Code: 01 00 00 48 8b 44 24 70 42 80 3c 28 00 48 8b 5c 24 68 74 08 48 89 df e8 fa d5 ee fb 4c 8b 3b 49 8d 5f 08 48 89 d8 48 c1 e8 03 <42> 80 3c 28 00 74 08 48 89 df e8 dd d5 ee fb 48 8b 1b 48 89 de 48
RSP: 0018:ffffc9000cfcfbe0 EFLAGS: 00010202
RAX: 0000000000000001 RBX: 0000000000000008 RCX: dffffc0000000000
RDX: ffffc90009011000 RSI: 0000000000000cc5 RDI: 0000000000000cc6
RBP: ffffc9000cfcfd70 R08: ffffffff8fad856f R09: 1ffffffff1f5b0ad
R10: dffffc0000000000 R11: fffffbfff1f5b0ae R12: 0000000000000001
R13: dffffc0000000000 R14: ffff88801bf793a8 R15: 0000000000000000
FS:  00007fb83bd9f6c0(0000) GS:ffff8880b9500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b32f21000 CR3: 000000002e5d8000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	01 00                	add    %eax,(%rax)
   2:	00 48 8b             	add    %cl,-0x75(%rax)
   5:	44 24 70             	rex.R and $0x70,%al
   8:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
   d:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  12:	74 08                	je     0x1c
  14:	48 89 df             	mov    %rbx,%rdi
  17:	e8 fa d5 ee fb       	call   0xfbeed616
  1c:	4c 8b 3b             	mov    (%rbx),%r15
  1f:	49 8d 5f 08          	lea    0x8(%r15),%rbx
  23:	48 89 d8             	mov    %rbx,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	48 89 df             	mov    %rbx,%rdi
  34:	e8 dd d5 ee fb       	call   0xfbeed616
  39:	48 8b 1b             	mov    (%rbx),%rbx
  3c:	48 89 de             	mov    %rbx,%rsi
  3f:	48                   	rex.W


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

