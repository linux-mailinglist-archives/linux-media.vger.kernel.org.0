Return-Path: <linux-media+bounces-52985-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uH8oBH+SlGl3FgIAu9opvQ
	(envelope-from <linux-media+bounces-52985-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 17:08:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BC914DE45
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 17:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 189B9301060A
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 16:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD7A36E46B;
	Tue, 17 Feb 2026 16:08:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFE2326950
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 16:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771344503; cv=none; b=BbLaaVAxBzWuH0wvW1mXoiRSULXJB8jcQJPSH3WKwVQdxvChHfkSVb5B4ixJ56kSQofP8GN9D1qE1YmPixkdcMXu/DPadHBnWc4dlKUWcpdyp3EXCMQRzJ93FhG5mawh7j+lc7/CLzTCPsY+Xw1UZs8wV5j8gfrcuoLZD0X1WEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771344503; c=relaxed/simple;
	bh=tqUhkTw1neJ+QHGjaK0RfdlwjCOSJvGUdhYaDDeUHG4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=C7536+SAemVeGLxykwWLQUWZN9C8VLZD4lbRRrVnckO6Vh90WKrRW815BzbhtK1FF7g+lronOYC7v7xnaOEC2EM3ahfdWtsnthfDUPYzUJ/2B2gwqDFdejjVB/plZIyd0rm4L//5t0rNNfvvaQ1xKX7LiAfTrs1xO9b7YILnfLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d19e3a3770so40593521a34.0
        for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 08:08:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771344501; x=1771949301;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VmW+icCE2E1I1T2skgfmiiq3dDyGUik5D9bJaR5QQx4=;
        b=St/+3XO9cAsRkSDMqUoBd1I6QxcSZFAvOppvdCkEbmiIagrYpzVR6h7/q0b3GdWT7M
         lw2c82kIZsJ6UniFlFnpuC1YkZtXNM563snWHfRo2154tekUOwt+0ijILpBf8q9nE+Fj
         W1vso7LEsclk40lN2v9KMqnn3mMcUbopP++JrTWWO/oOMT8murp2ydCuyZZIWMsHPFHv
         +b3icmzp3Myo/mOq6p9fjyWmhvCKu2FaOF3aaHBWNlWhIiHh9usMA51RRNSCHcnocPbF
         1zJg9bNABnZs1O1s9BGaIBabOyLBokOVVuyquukFfUycbE6fCShKDw/dvoB82AWtwnuA
         k+AA==
X-Forwarded-Encrypted: i=1; AJvYcCUu9+3+90WeY9Eoo9a5K7zNqMdXuCSn4306uAZlGLf2JvJKH/hnMpsQkWJsgmOfFSPOjqnomiY8l3akdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yycl8jaGmJ/sINajPYjGxS+AN720r0JNqYEQZYyU0oa5JKn0RDi
	iHq79uGmW3q0QJfJEYJ2iRjYVAbVBxeQZes0NWddHHZe2c7s6gIoeLVgVx/eb279fc4D2uKLmAk
	x00AKHwmhFCfnwXBFsr8MDRVjuyaRvdt3pvzAbYyowINcj3I9Pb7q4gi3nZM=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:6aea:b0:672:6fdd:2a50 with SMTP id
 006d021491bc7-677672952b6mr7387446eaf.31.1771344501066; Tue, 17 Feb 2026
 08:08:21 -0800 (PST)
Date: Tue, 17 Feb 2026 08:08:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69949275.050a0220.2eeac1.0144.GAE@google.com>
Subject: [syzbot] [media?] WARNING: refcount bug in dvb_device_open (3)
From: syzbot <syzbot+2e428058cafb408fb695@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=6428d17febdfb14e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-52985-lists,linux-media=lfdr.de,2e428058cafb408fb695];
	MISSING_XM_UA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	R_DKIM_NA(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[goo.gl:url,syzkaller.appspot.com:url,storage.googleapis.com:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 92BC914DE45
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    c22e26bd0906 Merge tag 'landlock-7.0-rc1' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=133fa722580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6428d17febdfb14e
dashboard link: https://syzkaller.appspot.com/bug?extid=2e428058cafb408fb695
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b33c549157ca/disk-c22e26bd.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/34c7ded19553/vmlinux-c22e26bd.xz
kernel image: https://storage.googleapis.com/syzbot-assets/66faec2158ed/bzImage-c22e26bd.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2e428058cafb408fb695@syzkaller.appspotmail.com

netlink: 104 bytes leftover after parsing attributes in process `syz.8.4164'.
------------[ cut here ]------------
refcount_t: saturated; leaking memory.
WARNING: lib/refcount.c:22 at refcount_warn_saturate+0x8c/0x110 lib/refcount.c:22, CPU#0: syz.8.4164/19520
Modules linked in:
CPU: 0 UID: 0 PID: 19520 Comm: syz.8.4164 Tainted: G             L      syzkaller #0 PREEMPT_{RT,(full)} 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
RIP: 0010:refcount_warn_saturate+0x8c/0x110 lib/refcount.c:22
Code: 75 68 e8 d7 88 2e fd 48 8d 3d d0 b7 be 0a 67 48 0f b9 3a eb 66 85 db 74 3e 83 fb 01 75 4c e8 bb 88 2e fd 48 8d 3d c4 b7 be 0a <67> 48 0f b9 3a eb 4a e8 a8 88 2e fd 48 8d 3d c1 b7 be 0a 67 48 0f
RSP: 0000:ffffc90004a176f8 EFLAGS: 00010287
RAX: ffffffff84948cc5 RBX: 0000000000000001 RCX: 0000000000080000
RDX: ffffc9000f978000 RSI: 00000000000018cb RDI: ffffffff8f534490
RBP: 00000000ffffffff R08: ffff88802cbfbc00 R09: 0000000000000005
R10: 0000000000000100 R11: 0000000000000004 R12: ffff88802b964418
R13: ffffffff9933f940 R14: ffff88802b964410 R15: ffff88802b964400
FS:  00007f7a552556c0(0000) GS:ffff888126595000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000110c3cfd8b CR3: 000000009f294000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __refcount_add include/linux/refcount.h:-1 [inline]
 __refcount_inc include/linux/refcount.h:366 [inline]
 refcount_inc include/linux/refcount.h:383 [inline]
 kref_get include/linux/kref.h:45 [inline]
 dvb_device_get drivers/media/dvb-core/dvbdev.c:624 [inline]
 dvb_device_open+0x31f/0x360 drivers/media/dvb-core/dvbdev.c:106
 chrdev_open+0x4d0/0x5f0 fs/char_dev.c:411
 do_dentry_open+0x83d/0x13e0 fs/open.c:949
 vfs_open+0x3b/0x350 fs/open.c:1081
 do_open fs/namei.c:4671 [inline]
 path_openat+0x2e3d/0x38a0 fs/namei.c:4830
 do_file_open+0x23e/0x4a0 fs/namei.c:4859
 do_sys_openat2+0x113/0x200 fs/open.c:1366
 do_sys_open fs/open.c:1372 [inline]
 __do_sys_openat fs/open.c:1388 [inline]
 __se_sys_openat fs/open.c:1383 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1383
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7a56fdc84e
Code: 08 0f 85 a5 a8 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 80 00 00 00 00 48 83 ec 08
RSP: 002b:00007f7a55254b28 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f7a552556c0 RCX: 00007f7a56fdc84e
RDX: 0000000000000002 RSI: 00007f7a55254c00 RDI: ffffffffffffff9c
RBP: 00007f7a55254c00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: cccccccccccccccd
R13: 00007f7a57296128 R14: 00007f7a57296090 R15: 00007fff6ac46eb8
 </TASK>
----------------
Code disassembly (best guess):
   0:	75 68                	jne    0x6a
   2:	e8 d7 88 2e fd       	call   0xfd2e88de
   7:	48 8d 3d d0 b7 be 0a 	lea    0xabeb7d0(%rip),%rdi        # 0xabeb7de
   e:	67 48 0f b9 3a       	ud1    (%edx),%rdi
  13:	eb 66                	jmp    0x7b
  15:	85 db                	test   %ebx,%ebx
  17:	74 3e                	je     0x57
  19:	83 fb 01             	cmp    $0x1,%ebx
  1c:	75 4c                	jne    0x6a
  1e:	e8 bb 88 2e fd       	call   0xfd2e88de
  23:	48 8d 3d c4 b7 be 0a 	lea    0xabeb7c4(%rip),%rdi        # 0xabeb7ee
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	eb 4a                	jmp    0x7b
  31:	e8 a8 88 2e fd       	call   0xfd2e88de
  36:	48 8d 3d c1 b7 be 0a 	lea    0xabeb7c1(%rip),%rdi        # 0xabeb7fe
  3d:	67                   	addr32
  3e:	48                   	rex.W
  3f:	0f                   	.byte 0xf


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

