Return-Path: <linux-media+bounces-67604-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OzZbKp37VmrZDwEAu9opvQ
	(envelope-from <linux-media+bounces-67604-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:16:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4E775A3E1
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 05:16:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67604-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67604-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=appspotmail.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA44C30338B8
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 03:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D432E363095;
	Wed, 15 Jul 2026 03:16:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A4625B0BF
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 03:16:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784085397; cv=none; b=gtD8KdmzrcRcsWtZsyTnHCNquebGRvhukAz5jSBNDqQjJcg2M3Pun9t+RDgoCTHm4N+OX8VdifTH2Ygk8pcomoDyIo17kE8GLGTtHLbTXAgIxX2elkVOsgIFQdpfG0Trc9XpVoAbEarGo7nft6ctX47dXkfO67PFCbW4im2aoWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784085397; c=relaxed/simple;
	bh=dGcyDd6iRFZ2PFIHIA0eZ8bDG/AZ44iqdkKOjjHQNkQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ECSM9QJMN4Bibzs6kl7eYZVrVjrKD4v4jINA5ys7jIG14po41BeVyrjkNJT6n5daNOPV2J/xzJutppywUadl+1+trnze38mmvv2kXRuat1h6DKyUz8ZtYpiNvU2/zJ0qM8P+vLlBMaIWnRNwt7HGWOuiS1RAlY6YRpyuvt19ovM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-495b4a78694so8246627b6e.0
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 20:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784085395; x=1784690195;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Vl2OeRFhCCelhBd3N0eEuVBOIOoMZFFFoFgeC0FBmc=;
        b=bADuHHH1F4QhdNzkLg36jVnxiWFG4Ic8KD1Akq/BauSqWYONL1tDCsJQiARbMG1mh8
         ZyMI6pMM4XjX4PEmIR4tRpUflq0R0COp74PsWL27zOHW0i7siFV4DaA7UGZAqQW4xO09
         QvmN3twxEe74tjTVsi4TfH575rI0vVBaTKRedNxK/uhC1+3lPdOq6hhgJr2yvs2e1JcV
         YrGzMhyvDwzcGaHRHkO8tZXlaOogj8Rxmzmovy0ojCjFnjAY1CeBq+X2XQW2jHd7m/xV
         uOqu03oUe6s13Ztw6w+CjbFZJTGtq0HQz+6Rmo4q9uGNI4abqNxh/qExkzxdQAMZlaxZ
         1BFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrnpmwz1oXQEQFpMsUQVKyomwzyu74Hufu8M+wjbO7H+NrPEVdU83+0TT64PyWDye6ltuW6ve+Y6r+DSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnNxBberkvGYl86Q3gGItfLbIz4BNHZc9uaWRqVHfl8zkb91y7
	LusVA2f+v2ILYvdVNKHwjnKGZyJIUijqdiPPKbaYb8gpUOLR6D2p16h18JFGZgi+Y3WTA6ve7qp
	UzFj+uRzDEpZB0eGwpERbKQQlhyCOInazaOZiLWLcN+//W+U0xoII66wWPCk=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b25:b0:4a4:d2b:8e7a with SMTP id
 5614622812f47-4a49607ea2amr890192b6e.35.1784085394843; Tue, 14 Jul 2026
 20:16:34 -0700 (PDT)
Date: Tue, 14 Jul 2026 20:16:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a56fb92.c90005c7.37d349.003c.GAE@google.com>
Subject: [syzbot] [media?] INFO: trying to register non-static key in __vb2_queue_cancel
From: syzbot <syzbot+2302c5dc59995fbb8089@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	m.szyprowski@samsung.com, mchehab@kernel.org, syzkaller-bugs@googlegroups.com, 
	tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.36 / 15.00];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=2290ccbf984c524f];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67604-lists,linux-media=lfdr.de,2302c5dc59995fbb8089];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,storage.googleapis.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,goo.gl:url,syzkaller.appspot.com:url,appspotmail.com:email];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:m.szyprowski@samsung.com,m:mchehab@kernel.org,m:syzkaller-bugs@googlegroups.com,m:tfiga@chromium.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
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
X-Rspamd-Queue-Id: 1C4E775A3E1

Hello,

syzbot found the following issue on:

HEAD commit:    cc2b5f627e8c Add linux-next specific files for 20260714
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17fb04b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2290ccbf984c524f
dashboard link: https://syzkaller.appspot.com/bug?extid=2302c5dc59995fbb8089
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12d598b9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14500789580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6836f8efb1da/disk-cc2b5f62.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0109d3477cc7/vmlinux-cc2b5f62.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c2e49e350bbf/bzImage-cc2b5f62.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2302c5dc59995fbb8089@syzkaller.appspotmail.com

em28xx 1-1:0.132: AC97 chip type couldn't be determined
em28xx 1-1:0.132: No AC97 audio processor
usb 1-1: Decoder not found
em28xx 1-1:0.132: failed to create media graph
em28xx 1-1:0.132: V4L2 device video103 deregistered
INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 1 UID: 0 PID: 5649 Comm: kworker/1:3 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/25/2026
Workqueue: events request_module_async
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 assign_lock_key+0x133/0x150 kernel/locking/lockdep.c:1000
 register_lock_class+0xcc/0x2e0 kernel/locking/lockdep.c:1315
 __lock_acquire+0xaf/0x2e40 kernel/locking/lockdep.c:5128
 lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5906
 rt_spin_lock+0x83/0x400 kernel/locking/spinlock_rt.c:56
 spin_lock include/linux/spinlock_rt.h:45 [inline]
 __wake_up_common_lock+0x2f/0x1f0 kernel/sched/wait.c:124
 __vb2_queue_cancel+0x2de/0xdc0 drivers/media/common/videobuf2/videobuf2-core.c:2244
 vb2_core_queue_release+0x2f/0x150 drivers/media/common/videobuf2/videobuf2-core.c:2677
 vb2_queue_release drivers/media/common/videobuf2/videobuf2-v4l2.c:956 [inline]
 vb2_video_unregister_device+0x15b/0x200 drivers/media/common/videobuf2/videobuf2-v4l2.c:1292
 em28xx_v4l2_init+0x1c60/0x3140 drivers/media/usb/em28xx/em28xx-video.c:3097
 em28xx_init_extension+0x120/0x1d0 drivers/media/usb/em28xx/em28xx-core.c:1248
 process_one_work+0xaaf/0x1480 kernel/workqueue.c:3379
 process_scheduled_works kernel/workqueue.c:3462 [inline]
 worker_thread+0xb05/0x10d0 kernel/workqueue.c:3543
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 UID: 0 PID: 5649 Comm: kworker/1:3 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/25/2026
Workqueue: events request_module_async
RIP: 0010:__wake_up_common kernel/sched/wait.c:104 [inline]
RIP: 0010:__wake_up_common_lock+0xd6/0x1f0 kernel/sched/wait.c:125
Code: 0f 84 d4 00 00 00 44 8b 7c 24 04 eb 13 48 ba 00 00 00 00 00 fc ff df 4c 39 ed 0f 84 ba 00 00 00 49 89 ee 48 89 e8 48 c1 e8 03 <80> 3c 10 00 74 12 4c 89 f7 e8 1c ce 93 00 48 ba 00 00 00 00 00 fc
RSP: 0018:ffffc9000595f908 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: dffffc0000000000 RSI: ffffffff8bcbd060 RDI: 00000000ffffffff
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffffbfff1fa1890 R12: ffff88803e181b14
R13: ffff88803e181c28 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888125af2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005625301fb660 CR3: 000000003774e000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __vb2_queue_cancel+0x2de/0xdc0 drivers/media/common/videobuf2/videobuf2-core.c:2244
 vb2_core_queue_release+0x2f/0x150 drivers/media/common/videobuf2/videobuf2-core.c:2677
 vb2_queue_release drivers/media/common/videobuf2/videobuf2-v4l2.c:956 [inline]
 vb2_video_unregister_device+0x15b/0x200 drivers/media/common/videobuf2/videobuf2-v4l2.c:1292
 em28xx_v4l2_init+0x1c60/0x3140 drivers/media/usb/em28xx/em28xx-video.c:3097
 em28xx_init_extension+0x120/0x1d0 drivers/media/usb/em28xx/em28xx-core.c:1248
 process_one_work+0xaaf/0x1480 kernel/workqueue.c:3379
 process_scheduled_works kernel/workqueue.c:3462 [inline]
 worker_thread+0xb05/0x10d0 kernel/workqueue.c:3543
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__wake_up_common kernel/sched/wait.c:104 [inline]
RIP: 0010:__wake_up_common_lock+0xd6/0x1f0 kernel/sched/wait.c:125
Code: 0f 84 d4 00 00 00 44 8b 7c 24 04 eb 13 48 ba 00 00 00 00 00 fc ff df 4c 39 ed 0f 84 ba 00 00 00 49 89 ee 48 89 e8 48 c1 e8 03 <80> 3c 10 00 74 12 4c 89 f7 e8 1c ce 93 00 48 ba 00 00 00 00 00 fc
RSP: 0018:ffffc9000595f908 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: dffffc0000000000 RSI: ffffffff8bcbd060 RDI: 00000000ffffffff
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffffbfff1fa1890 R12: ffff88803e181b14
R13: ffff88803e181c28 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888125af2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005625301fb660 CR3: 000000003774e000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	0f 84 d4 00 00 00    	je     0xda
   6:	44 8b 7c 24 04       	mov    0x4(%rsp),%r15d
   b:	eb 13                	jmp    0x20
   d:	48 ba 00 00 00 00 00 	movabs $0xdffffc0000000000,%rdx
  14:	fc ff df
  17:	4c 39 ed             	cmp    %r13,%rbp
  1a:	0f 84 ba 00 00 00    	je     0xda
  20:	49 89 ee             	mov    %rbp,%r14
  23:	48 89 e8             	mov    %rbp,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1) <-- trapping instruction
  2e:	74 12                	je     0x42
  30:	4c 89 f7             	mov    %r14,%rdi
  33:	e8 1c ce 93 00       	call   0x93ce54
  38:	48                   	rex.W
  39:	ba 00 00 00 00       	mov    $0x0,%edx
  3e:	00 fc                	add    %bh,%ah


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

