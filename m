Return-Path: <linux-media+bounces-65200-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z+OGMBzxM2rzJQYAu9opvQ
	(envelope-from <linux-media+bounces-65200-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 15:22:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 272CF6A0727
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 15:22:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=appspotmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65200-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65200-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0E1630AA236
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 13:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C03F301474;
	Thu, 18 Jun 2026 13:20:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f79.google.com (mail-ot1-f79.google.com [209.85.210.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4C08F49
	for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 13:20:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781788826; cv=none; b=aSrX/Rgb52PP2zkNkfj3YLH2KGfsQBmxV1WzcYt55L8D5xD3N4isToquDiKtenuGDL+tuErEws5g7JcFkCvmuy7IPGrBWKy2XnRVcLs2Pxr9e0obuYSeNPXWomoDB40bCJ5HJU/eMQxDnlAWwF4m/wiWZKTKCd+YIVlEt3oj5hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781788826; c=relaxed/simple;
	bh=pXkuN96Sj1R2xwFnc87fHmurZ+59ZgaurHT3mZl0Dok=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Uo4nrO6VjhWKAT0C/ZVeZekSkW9cEeYh7AVHQcowE2frDdzRUaPZTToBFmLkIuJ7IgJ1ldkCiVKH9dyUEl137QImf5qf8rJrwoTGpFvVM0Yxy+WacGfQvWGvh/ij042lg6tlcnW1L77xAjujeqyLQ4PtiNFlIChN8YjE0WehK/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.79
Received: by mail-ot1-f79.google.com with SMTP id 46e09a7af769-7e713779405so1707693a34.3
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2026 06:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781788824; x=1782393624;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/33KdD2/H7Prs87vxAWUnAR8jSqCWlbJEsGg9+fs3rQ=;
        b=MOcK2ONL4utKlTJcExL/X6DnTJ4nNT61C30uLg/tuuIXpX2l7n/bAON93KjiWVSL2U
         /ZzB9pRGupxZurCmkF9FRNcnPopApxHQV1EbZ5Jw3soplbf4++t2/yHqSfEd3jiA+Zgm
         zwH122QeBzlM2EF+Y+7FbbmHBkpbE5ld+XVFjVwIi1btTG6OObOrpN5b0x6DOnb30s7p
         jdc2zK6Xu0Z2RIOAJgI76q7MJ4QhFmCMTYzAJsRBMjGnAe/gtVEf6mIDfGNgQVRLDHbN
         eHEe1tLSyNe0amMnmhxIAgAeBDpkOF7yMySQZqD0VSC5FuD9oOJ32alU3qtA++W7CChA
         yuEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/d5UKQ3StFkqISlRWt0oj8cuENktRuS2FuCd7SX8dpZRdD0MfJIzRr7wVI//6BPWIH081I6sQSxEO8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqZ8xy/eX119jBJpB/vQ7tPl10/sYWw7KatdrHYABiz4C7Ge8P
	lpnGEmy52ZgTKGVdOXuSfHx2ozCx2LcwUeh48/ADKn2lOlT8x52POC0gQEnjOEYj4O26L3jTKK9
	9Teq2i0ySDmj5aVRLkhn/qCGhpUq9Zvj7clvg0RdtgPVlYaz362wnOoaz8Qo=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:208b:b0:69e:f61e:6a43 with SMTP id
 006d021491bc7-6a0b616473bmr7078294eaf.46.1781788824337; Thu, 18 Jun 2026
 06:20:24 -0700 (PDT)
Date: Thu, 18 Jun 2026 06:20:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a33f098.537e895e.3cc275.0002.GAE@google.com>
Subject: [syzbot] [media?] WARNING: ODEBUG bug in cec_transmit_msg_fh
From: syzbot <syzbot+051024d603432b4ab395@syzkaller.appspotmail.com>
To: hverkuil@kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.36 / 15.00];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=4e828c596d7aa593];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65200-lists,linux-media=lfdr.de,051024d603432b4ab395];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,goo.gl:url,syzkaller.appspotmail.com:from_mime,googlegroups.com:email,syzkaller.appspot.com:url,appspotmail.com:email,storage.googleapis.com:url];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	TAGGED_RCPT(0.00)[linux-media];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 272CF6A0727

Hello,

syzbot found the following issue on:

HEAD commit:    e21ee273e6fa Merge tag 'clk-fixes-for-linus' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17340bd2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4e828c596d7aa593
dashboard link: https://syzkaller.appspot.com/bug?extid=051024d603432b4ab395
compiler:       Debian clang version 22.1.6 (++20260514074242+fc4aad7b5db3-1~exp1~20260514074407.73), Debian LLD 22.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/14fcc3decf4c/disk-e21ee273.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3e80c98de356/vmlinux-e21ee273.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2a12732e35df/bzImage-e21ee273.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+051024d603432b4ab395@syzkaller.appspotmail.com

------------[ cut here ]------------
ODEBUG: free active (active state 0) object: ffff888025d28cb8 object type: timer_list hint: cec_wait_timeout+0x0/0x180 include/media/cec.h:-1
WARNING: lib/debugobjects.c:632 at debug_print_object lib/debugobjects.c:629 [inline], CPU#1: syz.0.3204/21212
WARNING: lib/debugobjects.c:632 at __debug_check_no_obj_freed lib/debugobjects.c:1154 [inline], CPU#1: syz.0.3204/21212
WARNING: lib/debugobjects.c:632 at debug_check_no_obj_freed+0x358/0x530 lib/debugobjects.c:1184, CPU#1: syz.0.3204/21212
Modules linked in:
CPU: 1 UID: 0 PID: 21212 Comm: syz.0.3204 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/09/2026
RIP: 0010:debug_print_object lib/debugobjects.c:629 [inline]
RIP: 0010:__debug_check_no_obj_freed lib/debugobjects.c:1154 [inline]
RIP: 0010:debug_check_no_obj_freed+0x39c/0x530 lib/debugobjects.c:1184
Code: 48 89 04 24 e8 a5 b8 75 fd 48 8b 04 24 4c 8b 4d 00 4c 89 ef 48 c7 c6 e0 9f 28 8c 48 c7 c2 60 a5 28 8c 8b 4c 24 1c 4d 89 f8 50 <67> 48 0f b9 3a 48 83 c4 08 4c 8b 6c 24 10 48 b9 00 00 00 00 00 fc
RSP: 0018:ffffc90005ac78a0 EFLAGS: 00010246
RAX: ffffffff87e83c30 RBX: ffffffff9a6fa8b8 RCX: 0000000000000000
RDX: ffffffff8c28a560 RSI: ffffffff8c289fe0 RDI: ffffffff903a7340
RBP: ffffffff8bcf39c0 R08: ffff888025d28cb8 R09: ffffffff8bcf4d20
R10: dffffc0000000000 R11: ffffffff81b1a1f0 R12: 0000000000000001
R13: ffffffff903a7340 R14: ffff888025d28000 R15: ffff888025d28cb8
FS:  00007f6b13bf26c0(0000) GS:ffff8881253b9000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa101deb078 CR3: 000000008a112000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 slab_free_hook mm/slub.c:2620 [inline]
 slab_free mm/slub.c:6251 [inline]
 kfree+0x13e/0x640 mm/slub.c:6566
 cec_transmit_msg_fh+0x16f0/0x24d0 drivers/media/cec/core/cec-adap.c:988
 cec_transmit drivers/media/cec/core/cec-api.c:230 [inline]
 cec_ioctl+0x2020/0x3060 drivers/media/cec/core/cec-api.c:534
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6b1619ce59
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f6b13bf2028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f6b16416360 RCX: 00007f6b1619ce59
RDX: 00002000000000c0 RSI: 00000000c0386105 RDI: 0000000000000006
RBP: 00007f6b16232d6f R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f6b164163f8 R14: 00007f6b16416360 R15: 00007ffdafcf65c8
 </TASK>
----------------
Code disassembly (best guess):
   0:	48 89 04 24          	mov    %rax,(%rsp)
   4:	e8 a5 b8 75 fd       	call   0xfd75b8ae
   9:	48 8b 04 24          	mov    (%rsp),%rax
   d:	4c 8b 4d 00          	mov    0x0(%rbp),%r9
  11:	4c 89 ef             	mov    %r13,%rdi
  14:	48 c7 c6 e0 9f 28 8c 	mov    $0xffffffff8c289fe0,%rsi
  1b:	48 c7 c2 60 a5 28 8c 	mov    $0xffffffff8c28a560,%rdx
  22:	8b 4c 24 1c          	mov    0x1c(%rsp),%ecx
  26:	4d 89 f8             	mov    %r15,%r8
  29:	50                   	push   %rax
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	48 83 c4 08          	add    $0x8,%rsp
  33:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  38:	48                   	rex.W
  39:	b9 00 00 00 00       	mov    $0x0,%ecx
  3e:	00 fc                	add    %bh,%ah


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

