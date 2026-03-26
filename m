Return-Path: <linux-media+bounces-57122-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJkHLl7BxGku3QQAu9opvQ
	(envelope-from <linux-media+bounces-57122-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 06:17:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAF932F4A9
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 06:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74621304A6E7
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 05:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2523A366DBE;
	Thu, 26 Mar 2026 05:13:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f78.google.com (mail-oo1-f78.google.com [209.85.161.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C71356A03
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 05:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774502006; cv=none; b=JQEtiqXtjsUc02jHAEE/ue+cuH+AqLGyisUxY2AuLQClsBjFVjSpX8RvlsyXfrGXN0aTrxMhmYP7e6B6xWFgu1oEjlyJSmPzV/NLlgvvqMnXiYj2jGUt9mSz1w5IzxLsNGxQb0y6pMu+mKzjNTn4zfpPGqoLK4zwAWOWDnskmK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774502006; c=relaxed/simple;
	bh=u+l/c3cYmqPRnqZRMHia+c6QMMNCBeloKC59kKaXAPw=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Q43rtFczSTYT+6JMayktJf5rb1gZT3ENSyfV2sNR8+MwCMAgxhZJ4n6p4vhAmPctCS3eQIaUNN82jRCjaPl+SlfdXuBVCPNEu5+30T2khsjv5f3JN36r9H5jfMR3e/gZa7V8R2oi7Oe7bL7hOkiOH8zwIwg+YVM/0KPVcOdvXO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f78.google.com with SMTP id 006d021491bc7-67a1e063795so4560422eaf.1
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 22:13:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774502004; x=1775106804;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ewCOCxTUrYuI2/74x2RPEf4HEXCrVCh4hNpAPGlOa4=;
        b=nk/l8lj6fHfqREXKA/ego06eDlukMshEjwGbptCuY65kGMWrteA9ZscyFMsF4YK4/o
         jFPdkN1GKNmiIXQyWuecXn4SXl6AXpWt8i7J5G+tLPktBXEkYoSwiDE0w0MmxjlbseCs
         jlTdwwDf203YwGa7xcaq8cJe24dtvjzzOndCLx7MI3lsv8xu9yrNxN0k2+iKo7GJkvoy
         MSWDvYYeYwomtCuQVnyaEvdoUK+rSYBcOc49cCBK1qj2+4N3XYuShA/lfKiSfZiA46nG
         IxEluL1waiHAvhS1P+UL3sXM6u3mdd0gL7ySyBzOlErwhFk6ssLDt970pLzqougpU+PA
         cX3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGTd2ozohFHWYfxiqnd7yXojb2KSHcO/kkHr/L6ADYo3TIwlo1/HPxP8mFctSsFP2CIg0dY86kkLPqCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyojqia+fcOkOXDDz7QJMLfDpsi1XQIp53dDQ5uvt60Y4LT9AZc
	CVfuMU/plis9S9IxeVI4/fom/vrM8CTGusFRKj55vCAhf5in2tGLjKQrZltxFTCGWrpNFIC5aOn
	T+7KplodtLFOKnP39oKL0Qa1FD0a37ggiKNsA43jFeELLuEQyfEfbliFxiFU=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4de4:b0:67e:1c:dd88 with SMTP id
 006d021491bc7-67e10d1b6b8mr111259eaf.29.1774502004411; Wed, 25 Mar 2026
 22:13:24 -0700 (PDT)
Date: Wed, 25 Mar 2026 22:13:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69c4c074.a70a0220.23629d.0009.GAE@google.com>
Subject: [syzbot] [media?] INFO: trying to register non-static key in as102_dvb_dmx_start_feed
From: syzbot <syzbot+3f395d8da879a58fb019@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=45cb3c58fd963c27];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-57122-lists,linux-media=lfdr.de,3f395d8da879a58fb019];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[googlegroups.com:email,goo.gl:url,syzkaller.appspot.com:url,storage.googleapis.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,appspotmail.com:email]
X-Rspamd-Queue-Id: 1FAF932F4A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot found the following issue on:

HEAD commit:    bbeb83d3182a Merge tag 'kbuild-fixes-7.0-3' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1749d6da580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=45cb3c58fd963c27
dashboard link: https://syzkaller.appspot.com/bug?extid=3f395d8da879a58fb019
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=151e5e16580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11334b52580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/fed7fabd5bd6/disk-bbeb83d3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3776359aa4d4/vmlinux-bbeb83d3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6ea274e547d3/bzImage-bbeb83d3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3f395d8da879a58fb019@syzkaller.appspotmail.com

INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 1 UID: 0 PID: 6076 Comm: syz.1.43 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 assign_lock_key+0x133/0x150 kernel/locking/lockdep.c:984
 register_lock_class+0xcc/0x2e0 kernel/locking/lockdep.c:1299
 __lock_acquire+0xad/0x2cf0 kernel/locking/lockdep.c:5112
 lock_acquire+0xf0/0x2e0 kernel/locking/lockdep.c:5868
 __mutex_lock_common kernel/locking/rtmutex_api.c:533 [inline]
 mutex_lock_interruptible_nested+0x5a/0x1d0 kernel/locking/rtmutex_api.c:566
 as102_dvb_dmx_start_feed+0x70/0x290 drivers/media/usb/as102/as102_drv.c:139
 dmx_section_feed_start_filtering+0x518/0x6c0 drivers/media/dvb-core/dvb_demux.c:977
 dvb_dmxdev_filter_start+0xcf4/0x10e0 drivers/media/dvb-core/dmxdev.c:760
 dvb_demux_do_ioctl+0x473/0x540 drivers/media/dvb-core/dmxdev.c:1083
 dvb_usercopy+0x199/0x2e0 drivers/media/dvb-core/dvbdev.c:996
 dvb_demux_ioctl+0x29/0x40 drivers/media/dvb-core/dmxdev.c:1201
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xff/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa44073c799
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fffd63530b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fa4409b5fa0 RCX: 00007fa44073c799
RDX: 0000200000000200 RSI: 00000000403c6f2b RDI: 0000000000000004
RBP: 00007fa4407d2c99 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fa4409b5fac R14: 00007fa4409b5fa0 R15: 00007fa4409b5fa0
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

