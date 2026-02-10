Return-Path: <linux-media+bounces-52540-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKpUFEl7i2nTUgAAu9opvQ
	(envelope-from <linux-media+bounces-52540-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 19:39:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD6E11E5C8
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 19:39:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03D0930427CF
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 18:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0203932BF32;
	Tue, 10 Feb 2026 18:38:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4508F30B50F
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 18:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770748708; cv=none; b=kNNPI0/+Dd+TGiPzuPphdf85xc4bcqc3Mq2slxtKq1tM7hdNeq1RT/EyDg7qamzH1YO15krihcP1MKcaVmdko+5A9aWfFHSeQ3/WIlHfxdKkpvNJdHrNlIbCVpnSrqg+XuLIB0ytKh9K94my7Yee2z+37chKamxG+ZmpDsvRd04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770748708; c=relaxed/simple;
	bh=dyG0mLGXYgYxIdRbwSk2IwfLHQh7qvmvD0nFAApyIfE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ARiao71V9D8MYYlrYqxqG8O/HL6BKrZ6TPYTZtdKQN0xCYeTEOEmfluXT9N1NC8RDNq67R7+aCbFuKihnM6cuxpX/3DTaK79dcdctVn2kkKesMjjJGkuxsSLiT2xKToROvAmA3Db6ZDT1cIxWJ5j7bAnbGMt67M8eHnjiMJY1hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-672c40f3873so4482417eaf.2
        for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 10:38:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770748706; x=1771353506;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a8LSFP7OPOkrK1SoWwZpDd2fBQPKlIhi3Syl2Bip+aI=;
        b=OI0uxe1stmf49iXEWwhH3JhC/nmMK4oGZtF2NeRnwpqFzvaVQiWazrbla0xNMyJxOR
         puDq4OsJplLTCuRO7NhU1Z9ffGj1yCfi/duRV6i+d2gW2RZqKWaRaP1yMyxXMtUJjqjG
         iPbwhThBDmN3NoBJgfjz/ZGT29Xi/2xdGd4hWd3T6w2bUuUzG68Zo5JMJ1leh/7Etzoj
         kiV4rQHs6wzwjIdGXr7UNOAS5WcZlQaMpxlBunhMUd++oIo2qQbBta+gTs3NoNrZNHIC
         RkTGmGtV4IDPTnkFPSWGy+H5fJyJoydbqLom31vxs7s/BaddZ3uqOiH6ks5wKYajtS9V
         nYcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0f/R+YxraU6ztBC+5XyqUjiCR7bWkE5HWFJAgQUUkQ9/dZFpzovhcIfGapahtiBeiUtzws7Y9lILsGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzR7vZtY1ULqlm4I1PV5rRTPSo3H8q+qEuy8j/dTJRrObSuYwg7
	Ih/KbH8bt7aFx9EuayvwoKl9qxUkAirNx7TDcos3zILs9HB/xopcvQO9Vnlq6eUdfH2ewClKfX9
	n2cj5zudrupTwwMO6uFWpH4gOsXhiNVEXvRcdRBTD2JoF7A4zR3uPsACyS7U=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1806:b0:662:fb61:785a with SMTP id
 006d021491bc7-66d0a37b24cmr7133511eaf.19.1770748706223; Tue, 10 Feb 2026
 10:38:26 -0800 (PST)
Date: Tue, 10 Feb 2026 10:38:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <698b7b22.050a0220.2eeac1.008d.GAE@google.com>
Subject: [syzbot] [media?] KMSAN: uninit-value in dvb_demux_read
From: syzbot <syzbot+bd7c90de4c9f1f8ab660@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=9682a42d8ec8b05c];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-52540-lists,linux-media=lfdr.de,bd7c90de4c9f1f8ab660];
	MISSING_XM_UA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	R_DKIM_NA(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[goo.gl:url,appspotmail.com:email,googlegroups.com:email,storage.googleapis.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: 9DD6E11E5C8
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    2687c848e578 x86/vmware: Fix hypercall clobbers
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=135fa7fa580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9682a42d8ec8b05c
dashboard link: https://syzkaller.appspot.com/bug?extid=bd7c90de4c9f1f8ab660
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16db1402580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1481265a580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/915713ca8484/disk-2687c848.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9b87f40abe9d/vmlinux-2687c848.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d4744727b418/bzImage-2687c848.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+bd7c90de4c9f1f8ab660@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in dvb_dmxdev_read_sec drivers/media/dvb-core/dmxdev.c:975 [inline]
BUG: KMSAN: uninit-value in dvb_demux_read+0x580/0xa40 drivers/media/dvb-core/dmxdev.c:1020
 dvb_dmxdev_read_sec drivers/media/dvb-core/dmxdev.c:975 [inline]
 dvb_demux_read+0x580/0xa40 drivers/media/dvb-core/dmxdev.c:1020
 do_loop_readv_writev fs/read_write.c:847 [inline]
 vfs_readv+0x931/0xf30 fs/read_write.c:1020
 do_preadv fs/read_write.c:1132 [inline]
 __do_sys_preadv fs/read_write.c:1179 [inline]
 __se_sys_preadv fs/read_write.c:1174 [inline]
 __x64_sys_preadv+0x2a3/0x510 fs/read_write.c:1174
 x64_sys_call+0x3033/0x3e70 arch/x86/include/generated/asm/syscalls_64.h:296
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xc9/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
 __alloc_frozen_pages_noprof+0x6df/0xf50 mm/page_alloc.c:5263
 alloc_pages_mpol+0x328/0x860 mm/mempolicy.c:2486
 alloc_frozen_pages_noprof mm/mempolicy.c:2557 [inline]
 alloc_pages_noprof+0x101/0x280 mm/mempolicy.c:2577
 vm_area_alloc_pages mm/vmalloc.c:3649 [inline]
 __vmalloc_area_node mm/vmalloc.c:3863 [inline]
 __vmalloc_node_range_noprof+0xa97/0x2d80 mm/vmalloc.c:4051
 __vmalloc_node_noprof mm/vmalloc.c:4111 [inline]
 __vmalloc_noprof+0x128/0x1f0 mm/vmalloc.c:4127
 __vmalloc_array_noprof mm/util.c:633 [inline]
 vmalloc_array_noprof+0x48/0x80 mm/util.c:644
 dvb_dmxdev_init+0xd8/0x680 drivers/media/dvb-core/dmxdev.c:1417
 vidtv_bridge_dmxdev_init drivers/media/test-drivers/vidtv/vidtv_bridge.c:343 [inline]
 vidtv_bridge_dvb_init drivers/media/test-drivers/vidtv/vidtv_bridge.c:445 [inline]
 vidtv_bridge_probe+0x1bfd/0x2690 drivers/media/test-drivers/vidtv/vidtv_bridge.c:508
 platform_probe+0x213/0x370 drivers/base/platform.c:1446
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x4d5/0xe40 drivers/base/dd.c:661
 __driver_probe_device+0x25e/0x370 drivers/base/dd.c:803
 driver_probe_device+0x70/0x8f0 drivers/base/dd.c:833
 __driver_attach+0x53e/0xaa0 drivers/base/dd.c:1227
 bus_for_each_dev+0x33b/0x580 drivers/base/bus.c:383
 driver_attach+0x51/0x70 drivers/base/dd.c:1245
 bus_add_driver+0x54f/0xdb0 drivers/base/bus.c:715
 driver_register+0x42e/0x6a0 drivers/base/driver.c:249
 __platform_driver_register+0x65/0x80 drivers/base/platform.c:908
 vidtv_bridge_init+0x73/0x100 drivers/media/test-drivers/vidtv/vidtv_bridge.c:598
 do_one_initcall+0x22b/0xad0 init/main.c:1378
 do_initcall_level+0x157/0x2e0 init/main.c:1440
 do_initcalls+0x176/0x310 init/main.c:1456
 do_basic_setup+0x1d/0x30 init/main.c:1475
 kernel_init_freeable+0x213/0x430 init/main.c:1688
 kernel_init+0x2f/0x5e0 init/main.c:1578
 ret_from_fork+0x207/0x6f0 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246

CPU: 1 UID: 0 PID: 6063 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/24/2026
=====================================================


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

