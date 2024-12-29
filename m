Return-Path: <linux-media+bounces-24143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D319FDD70
	for <lists+linux-media@lfdr.de>; Sun, 29 Dec 2024 06:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 222E516194A
	for <lists+linux-media@lfdr.de>; Sun, 29 Dec 2024 05:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5273D273FD;
	Sun, 29 Dec 2024 05:56:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493A217C8B
	for <linux-media@vger.kernel.org>; Sun, 29 Dec 2024 05:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735451785; cv=none; b=ZTDchugNREMfQ62Ts3kRZRvw6jwTdJw2z3TNs2aT3CmPLz9NQBFzgMEHYAniG0Xr1n9oK2FhxLHr+2QjYsbRS2mkiE3zfS0f/cIKlOeq61Nd7R17+MqaDC8I68ZSjT8C/x4jhr5hC+63AxXK56o3xZ2WXmDIAtCuPDjSSLu98OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735451785; c=relaxed/simple;
	bh=7o6VPlpRsW1BD0M++7nf+oY1LAaDmZn9UC+P3hqjAaI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=dfpbhBN9dB/ebObA9FVm709bT0to6sc5w8RmK/aSxaVaCSFNoL/seZeOOho6Bckokhy/BY/TkSGIHzBg/XP1jY68/crxM+o/W7u+rdSvBixDprnFECqxDFKm0B9ixRpP6qj5fXILtkGKJr3L6QrCQOfPfQ+mt1G05g5KKUZAxMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-844d02766ebso722047639f.2
        for <linux-media@vger.kernel.org>; Sat, 28 Dec 2024 21:56:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735451782; x=1736056582;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2sHLrs5UFtyToXV7msjU4fUPhBX5Ej8GncxVggskpb0=;
        b=Z8N94RQzcW9+nBFsoVUZg9vw4xTU7P3VE/gofIh+DDHATNprzKiMvk0+tsknLOfb5l
         lKIZgNP6WEhgXP8k8vljRcoOsyoIDXQoz+OsFb+jcVokyDwIttIzQIsjk7eavWNEhr4J
         GEraOc33zKTAyfVDUbExGrcH+DZCyKnAFWXXHN2BG4DsGsZx5yfg0zjUtWawrq7ONi3m
         VjzCsqddpAcEk7JYCAhCcuIQbyANZbhPJnWUB5omGD5iX1CDe8zoHxBq53modyUNIXx0
         cixn6wydocmd8UZLNzKVzOP3ZfFQX/H5m5K6nDUvk6trk7P3JeRajS3vPcTd4dpqwrhr
         OZ9g==
X-Forwarded-Encrypted: i=1; AJvYcCUqiMTLKB0PXgndk0XpWt2jryUKUs7zSDf8ezafsRUdenlFZPbggo6RtY68PeGeu5BohveYtFBgkoP5RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf1bu9uItHboY+6qhVJ42w//t93pV2Hpl/bJ3JF9u793pKyZpe
	XurTVx23inapQPwf3vBf70Kx74sY/NFdlk0U4hxuRbtz6k15qci+3nnBmByDWX4Qcifl5KcKUzc
	zs1JCGt2fkzyeggDzOaBv0h2LelhTauW3CzlBtZK2XP07JRZLgqIAshA=
X-Google-Smtp-Source: AGHT+IGVgk1WDDR4XCsYouPFHanA5Jmvnsl68cboxcvbYqV0qDpTHuW1lgDPxEblfvKzIvwEgpehA9aRhG48/3BE8Sfgz1edI0QM
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cdaa:0:b0:3a7:fe47:6228 with SMTP id
 e9e14a558f8ab-3c2d256679amr307719645ab.6.1735451782482; Sat, 28 Dec 2024
 21:56:22 -0800 (PST)
Date: Sat, 28 Dec 2024 21:56:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6770e486.050a0220.2f3838.04a4.GAE@google.com>
Subject: [syzbot] [media?] general protection fault in vidtv_mux_stop_thread
From: syzbot <syzbot+5e248227c80a3be8e96a@syzkaller.appspotmail.com>
To: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9b2ffa6148b1 Merge tag 'mtd/fixes-for-6.13-rc5' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10f0a2f8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c078001e66e4a17e
dashboard link: https://syzkaller.appspot.com/bug?extid=5e248227c80a3be8e96a
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=168b890f980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1562eadf980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c1d66e09941d/disk-9b2ffa61.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8aa24ea0a81d/vmlinux-9b2ffa61.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0d9c0b1e880a/bzImage-9b2ffa61.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5e248227c80a3be8e96a@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000025: 0000 [#1] PREEMPT SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000128-0x000000000000012f]
CPU: 0 UID: 0 PID: 5842 Comm: syz-executor248 Not tainted 6.13.0-rc4-syzkaller-00012-g9b2ffa6148b1 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
RIP: 0010:vidtv_mux_stop_thread+0x26/0x80 drivers/media/test-drivers/vidtv/vidtv_mux.c:471
Code: 90 90 90 90 66 0f 1f 00 55 53 48 89 fb e8 82 2e c8 f9 48 8d bb 28 01 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 02 7e 3b 0f b6 ab 28 01 00 00 31 ff 89 ee e8
RSP: 0018:ffffc90003f2faa8 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff87cfb125
RDX: 0000000000000025 RSI: ffffffff87d120ce RDI: 0000000000000128
RBP: ffff888029b8d220 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000003 R12: ffff888029b8d188
R13: ffffffff8f590aa0 R14: ffffc9000581c5c8 R15: ffff888029a17710
FS:  00007f7eef5156c0(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7eef5e635c CR3: 0000000076ca6000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 vidtv_stop_streaming drivers/media/test-drivers/vidtv/vidtv_bridge.c:209 [inline]
 vidtv_stop_feed+0x151/0x250 drivers/media/test-drivers/vidtv/vidtv_bridge.c:252
 dmx_section_feed_stop_filtering+0x90/0x160 drivers/media/dvb-core/dvb_demux.c:1000
 dvb_dmxdev_feed_stop.isra.0+0x1ee/0x270 drivers/media/dvb-core/dmxdev.c:486
 dvb_dmxdev_filter_stop+0x22a/0x3a0 drivers/media/dvb-core/dmxdev.c:559
 dvb_dmxdev_filter_free drivers/media/dvb-core/dmxdev.c:840 [inline]
 dvb_demux_release+0x92/0x550 drivers/media/dvb-core/dmxdev.c:1246
 __fput+0x3f8/0xb60 fs/file_table.c:450
 task_work_run+0x14e/0x250 kernel/task_work.c:239
 get_signal+0x1d3/0x2610 kernel/signal.c:2790
 arch_do_signal_or_restart+0x90/0x7e0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x150/0x2a0 kernel/entry/common.c:218
 do_syscall_64+0xda/0x250 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7eef55b309
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f7eef515218 EFLAGS: 00000246 ORIG_RAX: 0000000000000013
RAX: fffffffffffffe00 RBX: 00007f7eef5e53e8 RCX: 00007f7eef55b309
RDX: 0000000000000009 RSI: 0000000020003080 RDI: 0000000000000003
RBP: 00007f7eef5e53e0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f7eef5b2280
R13: 00736d79736c6c61 R14: 616b2f636f72702f R15: 0000100000000008
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:vidtv_mux_stop_thread+0x26/0x80 drivers/media/test-drivers/vidtv/vidtv_mux.c:471
Code: 90 90 90 90 66 0f 1f 00 55 53 48 89 fb e8 82 2e c8 f9 48 8d bb 28 01 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 02 7e 3b 0f b6 ab 28 01 00 00 31 ff 89 ee e8
RSP: 0018:ffffc90003f2faa8 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff87cfb125
RDX: 0000000000000025 RSI: ffffffff87d120ce RDI: 0000000000000128
RBP: ffff888029b8d220 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000003 R12: ffff888029b8d188
R13: ffffffff8f590aa0 R14: ffffc9000581c5c8 R15: ffff888029a17710
FS:  00007f7eef5156c0(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7eef5e635c CR3: 0000000076ca6000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	90                   	nop
   1:	90                   	nop
   2:	90                   	nop
   3:	90                   	nop
   4:	66 0f 1f 00          	nopw   (%rax)
   8:	55                   	push   %rbp
   9:	53                   	push   %rbx
   a:	48 89 fb             	mov    %rdi,%rbx
   d:	e8 82 2e c8 f9       	call   0xf9c82e94
  12:	48 8d bb 28 01 00 00 	lea    0x128(%rbx),%rdi
  19:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  20:	fc ff df
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax <-- trapping instruction
  2e:	84 c0                	test   %al,%al
  30:	74 02                	je     0x34
  32:	7e 3b                	jle    0x6f
  34:	0f b6 ab 28 01 00 00 	movzbl 0x128(%rbx),%ebp
  3b:	31 ff                	xor    %edi,%edi
  3d:	89 ee                	mov    %ebp,%esi
  3f:	e8                   	.byte 0xe8


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

