Return-Path: <linux-media+bounces-55888-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IC8YKgHat2mcWAEAu9opvQ
	(envelope-from <linux-media+bounces-55888-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 11:22:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 224AF297D74
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 11:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2659B3015D1C
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E18838F250;
	Mon, 16 Mar 2026 10:22:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797B0381AED
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 10:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773656568; cv=none; b=R7KByapPcEVRaWVOZDDbzuPZHtl2MbZygCDebM0/kfyyw7U8/JxodFqtJD/DY2fARVfXDTLWlAL6yDpqBYXkhqv/gMe3uPI/kW6t2+kVSewYffISxlUQ88Z+8UBNMOGrU5a8iH0iOm5lQQ/7zrW/dBoVhJ4nDBWozewye81YBzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773656568; c=relaxed/simple;
	bh=isBQOKgwlhba3B56b2KOxcuq1S9BZwmyrHN3kBpQ/2g=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ohbuw2c0BOWakszPQKsJQ6C9yRNKALg1uR5lJ/7f1J6d7w8pycdEt1au2VFfVcj+xNvd0UQz0za/LIe1DR7z4XSqUN+Z31sf9QLXj325ROIsyRls/j3Wp8isY6s5JdwQ1xltKj69luTwZJPswzptrWxU+K/rDXmbMsQT/pTIHss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-67ba64650d9so80848344eaf.3
        for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 03:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773656566; x=1774261366;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VK8/1NqeTNbZAVcvluXSA8kMOQjDKtel70OCMYrgRzU=;
        b=RSq42kk1jowZzKWNq72BHw/n/FmE20dAR/eaz6piz6OYyvu+K4oWZUxTGY6Rf2/01k
         rwSSCXPRHQMQMjhtlJFYhlaShwXSmEAF+nAdNrJtJbgy8pinfHePj8CTd9rd4bnUqWz9
         hWLFNOJ96+2q7uX00wgDE6P46rvJnQ97Bj8n26wXkElLxEx37zuullx9AqDtvqU7QhfQ
         r95Jh15ZT+iLQVsU7yyYIFKo9DXxhRLQ6OqUeqy3Fpe84yyAgxD+WN2XcHjJThfgWM5f
         bUZ0IZIG6EFqhQi2SIPwDwF3efO5GWssR17eTd80zqL0sdhaJjBVOPSKhzf3MtMZc+Q8
         iwzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs3yrkoyNUPhgEBvB25Dzc7uaR5l/0ZtlxcOkEKrpqT1yMaYkeQ94XRitqXPp7ScqTXwQxZn1aMhgEmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzR+wPeqEaYqGNff3GLG8/PHfNmTklawFOk4k+GGqj6Ymamn5cZ
	WIUdVPcmc8snzhx0jDhf8GVNtV6bBXpjQ+EMytx3jdFIRvotVHkFWo+VHJRurqqDcfPS8HZOn5m
	vtLinQiByfWDr3cUpmh6mT0jwjRhBvnSoGogW2xy+enqI8XfOlmfO3LMzwSs=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4dfa:b0:67b:b182:1a7 with SMTP id
 006d021491bc7-67bdaa6820amr8473994eaf.63.1773656566533; Mon, 16 Mar 2026
 03:22:46 -0700 (PDT)
Date: Mon, 16 Mar 2026 03:22:46 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69b7d9f6.050a0220.248e02.0111.GAE@google.com>
Subject: [syzbot] [media?] WARNING in az6007_i2c_xfer (2)
From: syzbot <syzbot+cb60cba6678dbc243930@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=779072223d02a312];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-55888-lists,linux-media=lfdr.de,cb60cba6678dbc243930];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,storage.googleapis.com:url,googlegroups.com:email,goo.gl:url]
X-Rspamd-Queue-Id: 224AF297D74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot found the following issue on:

HEAD commit:    80234b5ab240 Merge tag 'rproc-v7.0-fixes' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14bc775a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=779072223d02a312
dashboard link: https://syzkaller.appspot.com/bug?extid=cb60cba6678dbc243930
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/53f504b3f646/disk-80234b5a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/56d033e102f9/vmlinux-80234b5a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/93e75ca78ad3/bzImage-80234b5a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cb60cba6678dbc243930@syzkaller.appspotmail.com

usb read operation failed. (-71)
------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(__owner_task(owner) != get_current())
WARNING: kernel/locking/mutex.c:949 at __mutex_unlock_slowpath+0x218/0x7d0 kernel/locking/mutex.c:949, CPU#0: syz.0.9868/26313
Modules linked in:
CPU: 0 UID: 0 PID: 26313 Comm: syz.0.9868 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/27/2026
RIP: 0010:__mutex_unlock_slowpath+0x21f/0x7d0 kernel/locking/mutex.c:949
Code: 2e 48 8b 44 24 10 42 0f b6 04 28 84 c0 0f 85 d3 00 00 00 83 3d d5 73 62 04 00 75 13 48 8d 3d 78 87 65 04 48 c7 c6 40 e9 cc 8b <67> 48 0f b9 3a 90 48 8b 54 24 10 e9 2d ff ff ff 48 89 54 24 10 90
RSP: 0018:ffffc90003907ac0 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffffc90003907b60 RCX: 0000000000080000
RDX: ffffc9000c799000 RSI: ffffffff8bcce940 RDI: ffffffff9014d270
RBP: ffffc90003907bd8 R08: ffffffff9011bec3 R09: 1ffffffff20237d8
R10: dffffc0000000000 R11: fffffbfff20237d9 R12: 1ffff92000720f60
R13: dffffc0000000000 R14: 1ffffffff344e690 R15: ffff88807d32c000
FS:  00007f298a8646c0(0000) GS:ffff888125463000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000110c3028ed CR3: 00000000348a2000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 az6007_i2c_xfer+0xb65/0xb90 drivers/media/usb/dvb-usb-v2/az6007.c:827
 __i2c_transfer+0x79a/0x2020 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x1cc/0x2d0 drivers/i2c/i2c-core-base.c:2317
 i2cdev_ioctl_rdwr+0x460/0x740 drivers/i2c/i2c-dev.c:306
 i2cdev_ioctl+0x6a5/0x880 drivers/i2c/i2c-dev.c:467
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f298999c799
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f298a864028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f2989c15fa0 RCX: 00007f298999c799
RDX: 0000200000000340 RSI: 0000000000000707 RDI: 0000000000000004
RBP: 00007f2989a32c99 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f2989c16038 R14: 00007f2989c15fa0 R15: 00007f2989d3fa48
 </TASK>
----------------
Code disassembly (best guess):
   0:	2e 48 8b 44 24 10    	cs mov 0x10(%rsp),%rax
   6:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
   b:	84 c0                	test   %al,%al
   d:	0f 85 d3 00 00 00    	jne    0xe6
  13:	83 3d d5 73 62 04 00 	cmpl   $0x0,0x46273d5(%rip)        # 0x46273ef
  1a:	75 13                	jne    0x2f
  1c:	48 8d 3d 78 87 65 04 	lea    0x4658778(%rip),%rdi        # 0x465879b
  23:	48 c7 c6 40 e9 cc 8b 	mov    $0xffffffff8bcce940,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	90                   	nop
  30:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
  35:	e9 2d ff ff ff       	jmp    0xffffff67
  3a:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
  3f:	90                   	nop


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

