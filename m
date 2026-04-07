Return-Path: <linux-media+bounces-58198-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMDZGbJq1Wm96AcAu9opvQ
	(envelope-from <linux-media+bounces-58198-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 22:36:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6333B493D
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 22:36:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BBEA30421FC
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 20:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B375B379EFE;
	Tue,  7 Apr 2026 20:35:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F040733D4EE
	for <linux-media@vger.kernel.org>; Tue,  7 Apr 2026 20:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775594131; cv=none; b=BPmtNMvbcIEEDP+JzS5CsACC5EvWohVOa9yUs072lSfkBTMJKcP9EvoXUtrlkTH3vikncWEhp3PYqXPzWBw4ULsbjRL4GAhug4ECERa3NsYSEfPS0cQtTYdnFBVr3k0w/sD9KmP1lZA6Led7wKuv95byvNA1vTMqfFjj2JQ5Qhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775594131; c=relaxed/simple;
	bh=UJQ8tTGwe60L4fGtTfOqmrArLKsfe5i/rLB7iDn6LpE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=e+txec3JlIvKPDGhSZrcHSwetHFha4GkR7WgTAiOGrOrGvEr8uW59KFFsM+9KmeDbUjP4GMvP5c3bLp/mqKnIVR/ExIjc2Sezmz/XL/HghNCKSr94VfS1lnlaOr60jkgxqxtShuJv0iCcTIBUKrqVk1RAzbmSKlFKXKSlj6l2yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-683b4edaab1so7764035eaf.3
        for <linux-media@vger.kernel.org>; Tue, 07 Apr 2026 13:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775594129; x=1776198929;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5KfmEpOYEOSlgLhRYLojn6YVk+Z22HFOwx4QJusbr5w=;
        b=IDu3vqCwMR7/AqAqUxAj0xw7p7SsPb8PXK5nZWCdpCTvA7aHADwe9mthBos95YkHRR
         zT5aKsBAg9guCZekeRoPU0xky8eCE/5BFSRwleiGBLNvqtkd2cnKp7BKleqSXKCtNCUq
         FMT/Rw7NKX7A9ahqW48/UPNhXCjoaa4vQnG+WK3eS2ac8mPtvX2zAON3M51Ln/tULXUZ
         EV8+uYmJ5GCL9B5HZk9aFX8zFDsXHKZinUEc3c8ZMb23bSMlWV4B6rYwpNA/7EHSR/Y/
         z/HvY0lUHRatV9+a+Qv5ZteFtQjLsg1EBv4BUHuqBn/mKsumCr1PF+BqERIX29Va8FgE
         ijMg==
X-Forwarded-Encrypted: i=1; AJvYcCWWV1FMuoOk6ty+Mw1PvelKRShhL3MvLiQfn6OOS6lq1NyHr+SFU9vTW0gSGbSW5Tb4S8NPovr6zLxWMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKIsJ4ATrfD4Te460f2vYe2Bxy6pl1knaaJ9OBczoN8of5KhI8
	49mDeo4IIyvJpxegfEYr9LZoemHI7H4qC9JydZedfQByhYT6M9f2P8QQArake31suDFmNQdqDDW
	VQH833MGKckSym0LB7VRb/kLvSCfqQrh0aQ5E/5u1sQpo3h8neGKR49Qd7PQ=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2f0d:b0:688:b145:46cb with SMTP id
 006d021491bc7-688b14547d6mr951683eaf.32.1775594128990; Tue, 07 Apr 2026
 13:35:28 -0700 (PDT)
Date: Tue, 07 Apr 2026 13:35:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69d56a90.050a0220.28fc4.0002.GAE@google.com>
Subject: [syzbot] [media?] general protection fault in em28xx_resolution_set (2)
From: syzbot <syzbot+755151a86449f029bae0@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=36a2baf561dcdf64];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58198-lists,linux-media=lfdr.de,755151a86449f029bae0];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,goo.gl:url,appspotmail.com:email,syzkaller.appspot.com:url,storage.googleapis.com:url,googlegroups.com:email]
X-Rspamd-Queue-Id: BB6333B493D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot found the following issue on:

HEAD commit:    81ebd43cc0d6 usb: gadget: f_hid: don't call cdev_init whil..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=140d45ca580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=36a2baf561dcdf64
dashboard link: https://syzkaller.appspot.com/bug?extid=755151a86449f029bae0
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/59aca7fb2d65/disk-81ebd43c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/87180154ea1a/vmlinux-81ebd43c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/862a7fc58ad2/bzImage-81ebd43c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+755151a86449f029bae0@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000354: 0000 [#1] SMP KASAN PTI
KASAN: probably user-memory-access in range [0x0000000000001aa0-0x0000000000001aa7]
CPU: 0 UID: 0 PID: 5637 Comm: v4l_id Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
RIP: 0010:norm_maxh drivers/media/usb/em28xx/em28xx-video.c:149 [inline]
RIP: 0010:em28xx_resolution_set.isra.0+0xe4/0x730 drivers/media/usb/em28xx/em28xx-video.c:317
Code: 0f 85 d5 05 00 00 48 8d bd a0 1a 00 00 44 0f b6 bb 3c 01 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 41 83 e7 10 <80> 3c 02 00 0f 85 e9 05 00 00 31 ff 44 89 fe 4c 8b a5 a0 1a 00 00
RSP: 0018:ffffc90002027798 EFLAGS: 00010246

RAX: dffffc0000000000 RBX: ffff88811f368000 RCX: ffffffff85a50292
RDX: 0000000000000354 RSI: ffffffff85a4f799 RDI: 0000000000001aa0
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000002
R10: 0000000000000000 R11: 0000000000000000 R12: ffff88812bc88000
R13: 1ffff92000404ef7 R14: ffff88811f36813c R15: 0000000000000000
FS:  00007f8c837eb880(0000) GS:ffff8882686f6000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f8c839e455a CR3: 000000010735c000 CR4: 00000000003506f0
Call Trace:
 <TASK>
 em28xx_v4l2_open+0x457/0x570 drivers/media/usb/em28xx/em28xx-video.c:2166
 v4l2_open+0x1d2/0x490 drivers/media/v4l2-core/v4l2-dev.c:433
 chrdev_open+0x234/0x6a0 fs/char_dev.c:411
 do_dentry_open+0x68b/0x14b0 fs/open.c:949
 vfs_open+0x82/0x3f0 fs/open.c:1081
 do_open fs/namei.c:4671 [inline]
 path_openat+0x208c/0x31a0 fs/namei.c:4830
 do_file_open+0x20e/0x430 fs/namei.c:4859
 do_sys_openat2+0x10d/0x1e0 fs/open.c:1366
 do_sys_open fs/open.c:1372 [inline]
 __do_sys_openat fs/open.c:1388 [inline]
 __se_sys_openat fs/open.c:1383 [inline]
 __x64_sys_openat+0x12d/0x210 fs/open.c:1383
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x106/0x7b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8c838d9407
Code: 48 89 fa 4c 89 df e8 38 aa 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffe5cd9fa90 EFLAGS: 00000202
 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f8c837eb880 RCX: 00007f8c838d9407
RDX: 0000000000000000 RSI: 00007ffe5cda0f21 RDI: ffffffffffffff9c
RBP: 0000000000000002 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000000
R13: 00007ffe5cd9fce0 R14: 00007f8c8406f000 R15: 0000555f3c43e4d8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:norm_maxh drivers/media/usb/em28xx/em28xx-video.c:149 [inline]
RIP: 0010:em28xx_resolution_set.isra.0+0xe4/0x730 drivers/media/usb/em28xx/em28xx-video.c:317
Code: 0f 85 d5 05 00 00 48 8d bd a0 1a 00 00 44 0f b6 bb 3c 01 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 41 83 e7 10 <80> 3c 02 00 0f 85 e9 05 00 00 31 ff 44 89 fe 4c 8b a5 a0 1a 00 00
RSP: 0018:ffffc90002027798 EFLAGS: 00010246

RAX: dffffc0000000000 RBX: ffff88811f368000 RCX: ffffffff85a50292
RDX: 0000000000000354 RSI: ffffffff85a4f799 RDI: 0000000000001aa0
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000002
----------------
Code disassembly (best guess):
   0:	0f 85 d5 05 00 00    	jne    0x5db
   6:	48 8d bd a0 1a 00 00 	lea    0x1aa0(%rbp),%rdi
   d:	44 0f b6 bb 3c 01 00 	movzbl 0x13c(%rbx),%r15d
  14:	00
  15:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  1c:	fc ff df
  1f:	48 89 fa             	mov    %rdi,%rdx
  22:	48 c1 ea 03          	shr    $0x3,%rdx
  26:	41 83 e7 10          	and    $0x10,%r15d
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 e9 05 00 00    	jne    0x61d
  34:	31 ff                	xor    %edi,%edi
  36:	44 89 fe             	mov    %r15d,%esi
  39:	4c 8b a5 a0 1a 00 00 	mov    0x1aa0(%rbp),%r12


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

