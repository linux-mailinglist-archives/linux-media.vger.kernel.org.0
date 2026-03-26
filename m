Return-Path: <linux-media+bounces-57121-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kQOdMUvBxGku3QQAu9opvQ
	(envelope-from <linux-media+bounces-57121-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 06:16:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 197BD32F49B
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 06:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C38DA302B740
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 05:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0369935F19F;
	Thu, 26 Mar 2026 05:13:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f77.google.com (mail-ot1-f77.google.com [209.85.210.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376E834EF0A
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 05:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774502006; cv=none; b=lBWcHQefXzjLKOdClvItKFQyyKsw61c6bHlapV/hGwfZSYjWy9Hz5AUVsDku+M4OIEbJwJMVqK0rIapjVrpehPQGc/2tO0jSM0tqJLJlNM5AUd9Cb2cW6KbVPtlZXXMgSjpbjS6JTh8tQe4/l5SZjYSo0/l31KTsO4ujm1XDG1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774502006; c=relaxed/simple;
	bh=d4aOYKq/uSXZ4sQEf6CFchKMqXPpGhLK9drREZIjET4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=K3J4OP/3qlg0e8ty2Lje8XkDapRimemvdS7Z7QguyO+NkGV0CmEPJoI//N2GSUWPTC9w04sjGGgy3XrwN5qRfxZ01MGiFE1KUKCfMhWpxixiPN6Ey5rmptu0gJIUzgIbQfAPW0oJyGXIAT9L116dNWOziH6Qhn3/dHr2jbtkep8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f77.google.com with SMTP id 46e09a7af769-7d7df10ae0bso1477123a34.0
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 22:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774502004; x=1775106804;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=97IId0RNd8EcJk74njPEDWFIYJlmzIGkgcDJePXBeD0=;
        b=lQ5xAqCgxMItWiiY+6XFNpY9H5tlyuWL+VcyN6puHG9EA9hO6IQsJabvmQBBU293mm
         4Z0Jc+4JLrDlxeYdzaa2E39m/iIgNKRpvOj9E3XYng16hdb0/OvenOnttHbDxUOKAiQV
         0zWpsX0faYTaXiEeuo1Fe7Q40pbWVIpi0geCLx/kQpyGqADpq8ow+NkgG/56SJivoCGV
         KWWSEqnnIGmD80d6IhbxuHsWit/HfGGjF45cA9e89Bs8IEGGnjtQ0R9CvmfR2b0VomMv
         rNbxGSjHtJJ1HFNiNhvYdB+g5C3D/glJ1ak8+T9qdeZ77B1mXv30TwROV6aQ8MxpIlcG
         pVFw==
X-Forwarded-Encrypted: i=1; AJvYcCXLfRauDQ15AlRzECymf+ouL2ZBC6ys+Ea0b/vPlRH7W1kWd08Tq//c1uoicHTw9kh4GCy/HpnTRZbnYA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4WW7BxCCcldVpvOz5g0Kx0mdWFbcIDfhwyfHVa/qYslHYpROw
	HNrUlykR+CVmRpa4J0jwoK5VnrMBZu5BOPXj46xHbUvYxc+rzfkafQrNk+1OnyKLtOQOLbRuS6n
	8lZm3SPMcztXwoLG37o7SraPpb1/MG1AjM9aay/rnk9ajlHcChTv/IC4WneI=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:178d:b0:67b:bd04:96dd with SMTP id
 006d021491bc7-67dff596e7amr3099237eaf.64.1774502004189; Wed, 25 Mar 2026
 22:13:24 -0700 (PDT)
Date: Wed, 25 Mar 2026 22:13:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69c4c074.a70a0220.23629d.0008.GAE@google.com>
Subject: [syzbot] [media?] WARNING in as102_dvb_dmx_start_feed
From: syzbot <syzbot+3825a6102073c418fe41@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=6754c86e8d9e4c91];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
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
	TAGGED_FROM(0.00)[bounces-57121-lists,linux-media=lfdr.de,3825a6102073c418fe41];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[googlegroups.com:email,syzkaller.appspot.com:url,storage.googleapis.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,appspotmail.com:email]
X-Rspamd-Queue-Id: 197BD32F49B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot found the following issue on:

HEAD commit:    bbeb83d3182a Merge tag 'kbuild-fixes-7.0-3' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=136f4772580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6754c86e8d9e4c91
dashboard link: https://syzkaller.appspot.com/bug?extid=3825a6102073c418fe41
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=176e7af6580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16754b52580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/dbd3eaf2f899/disk-bbeb83d3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/45838a797bcf/vmlinux-bbeb83d3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ba91cdcacfe1/bzImage-bbeb83d3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3825a6102073c418fe41@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(lock->magic != lock)
WARNING: kernel/locking/mutex.c:593 at __mutex_lock_common kernel/locking/mutex.c:593 [inline], CPU#1: syz.2.23/6152
WARNING: kernel/locking/mutex.c:593 at __mutex_lock+0x10a4/0x1300 kernel/locking/mutex.c:776, CPU#1: syz.2.23/6152
Modules linked in:
CPU: 1 UID: 0 PID: 6152 Comm: syz.2.23 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:593 [inline]
RIP: 0010:__mutex_lock+0x10ab/0x1300 kernel/locking/mutex.c:776
Code: 11 90 48 c1 e8 03 42 0f b6 04 28 84 c0 0f 85 33 02 00 00 83 3d d9 a1 61 04 00 75 13 48 8d 3d 1c b7 64 04 48 c7 c6 c0 e0 cc 8b <67> 48 0f b9 3a 90 e9 ac f0 ff ff 90 0f 0b 90 e9 73 f4 ff ff 90 0f
RSP: 0018:ffffc90003917a20 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 1ffff92000722f5c RCX: ffff88807c728000
RDX: 0000000000000000 RSI: ffffffff8bcce0c0 RDI: ffffffff9014fc10
RBP: ffffc90003917bd8 R08: ffffffff9011e6c3 R09: 1ffffffff2023cd8
R10: dffffc0000000000 R11: fffffbfff2023cd9 R12: ffff88807e2e2b60
R13: dffffc0000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  00005555608ec500(0000) GS:ffff88812555d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b2fb63fff CR3: 000000007e05c000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 as102_dvb_dmx_start_feed+0x70/0x290 drivers/media/usb/as102/as102_drv.c:139
 dmx_section_feed_start_filtering+0x518/0x6c0 drivers/media/dvb-core/dvb_demux.c:977
 dvb_dmxdev_filter_start+0xcf4/0x10e0 drivers/media/dvb-core/dmxdev.c:760
 dvb_demux_do_ioctl+0x470/0x540 drivers/media/dvb-core/dmxdev.c:1083
 dvb_usercopy+0x199/0x2e0 drivers/media/dvb-core/dvbdev.c:996
 dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1201
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9a3979c799
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffef627ed38 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f9a39a15fa0 RCX: 00007f9a3979c799
RDX: 0000200000000200 RSI: 00000000403c6f2b RDI: 0000000000000004
RBP: 00007f9a39832c99 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f9a39a15fac R14: 00007f9a39a15fa0 R15: 00007f9a39a15fa0
 </TASK>
----------------
Code disassembly (best guess):
   0:	11 90 48 c1 e8 03    	adc    %edx,0x3e8c148(%rax)
   6:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
   b:	84 c0                	test   %al,%al
   d:	0f 85 33 02 00 00    	jne    0x246
  13:	83 3d d9 a1 61 04 00 	cmpl   $0x0,0x461a1d9(%rip)        # 0x461a1f3
  1a:	75 13                	jne    0x2f
  1c:	48 8d 3d 1c b7 64 04 	lea    0x464b71c(%rip),%rdi        # 0x464b73f
  23:	48 c7 c6 c0 e0 cc 8b 	mov    $0xffffffff8bcce0c0,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	90                   	nop
  30:	e9 ac f0 ff ff       	jmp    0xfffff0e1
  35:	90                   	nop
  36:	0f 0b                	ud2
  38:	90                   	nop
  39:	e9 73 f4 ff ff       	jmp    0xfffff4b1
  3e:	90                   	nop
  3f:	0f                   	.byte 0xf


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

