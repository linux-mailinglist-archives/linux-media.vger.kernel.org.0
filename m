Return-Path: <linux-media+bounces-56769-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPK8HdWfwWmFUAQAu9opvQ
	(envelope-from <linux-media+bounces-56769-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 21:17:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7012FD174
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 21:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8098306C464
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 20:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902353E123E;
	Mon, 23 Mar 2026 20:13:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f78.google.com (mail-oo1-f78.google.com [209.85.161.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DDE3DFC7C
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 20:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296820; cv=none; b=GYQWdNsyny0CJUYncPyF6dFOa6V4VpynWfIHHyUlVw1q3dYVRMbHE0WjxXza/IXAxxI7q8awVdzPIIagDT4H8Wi5YRBZz5jqlK/yRBAJk4dfONHeT7/GSPecgDTSQejODyPg61WJd21jhvUHkLC8urCLdnGbS0zjQ5wl5L2HfuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296820; c=relaxed/simple;
	bh=cj8ALMrx35H2DTMyqR4QEKUGwvRYO/9HFJ7GMEZ5JxY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=lcj100Xli4DYZownhb9h1A7LlI5vBkGy2GrLteh3t0LxDQ05S32DcJaRdGeNB6ZhHGD01BmWcYoRPU4BqI98a1v/XQWZg0SnP9/DZY+1L9FaC4ZB45LZP9EversaYwG3WInx4ophRxnxc80//Vq6XvSJCwQE+99z+p+hgVQudv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f78.google.com with SMTP id 006d021491bc7-67df00643eeso14048836eaf.1
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 13:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774296817; x=1774901617;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0pEoFV3Z+GhDMvVnTuUQ5HLbi+15yPEKi/PRT6DkVAQ=;
        b=k/mxMH7Eyb09nXNh2CGNY1rgpZMJDTE+XcAa5sNeikbsdY+0JyiHMI+XeLyv595Foj
         5gaXW9fPZtHb8g+QgHw98EzVAea0bDwdCto30DYP6KPAl2dGoipb6HyQyczSaUVLxTVR
         acuD/bMLs7FQCFrGQ15BgwHdo/IsoHoLFjI+GvRiAPxmTkUSLPzG9sl31lz0nCrhwbC9
         vIJBj8ZRMmRiS2qnz7S1rjL9hXiv33OEzRpa3V6JK16nTzqK19j6Cz3KNdw01tUhXpoi
         qlZtV0H2jk4bL2iMCAgUFywz9p32dziBKX0AZrucTXJBtUc9UpkESDXx6gJhn6N78Y6t
         ZERg==
X-Forwarded-Encrypted: i=1; AJvYcCX+aqRswnvCnFsWJL1P4gcHxvqVGUwuJ7UB1YaiW/0Nfu4Wzi17jJVUrutUK+pN1vfdeavVLB0sOm/7og==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcbNU8Mq5kHlzxoxWKtgbRPPpKrXc6KKI0i7j8Ia8UCqwoB84t
	yZFdZ4+ieI+6cJmCjez7UQ5aZ33VEQXzZgLy0ncMVvH62pD5kGfnnx5IQ++WyNuZOlNBL8kJSE0
	6IdA7G+1aeHVt6vtn4GCf968ikGXnWOBsKFZjs6vIPqSD35vjeMQueZE8qYA=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3090:b0:67b:a4cb:293f with SMTP id
 006d021491bc7-67df5d6a987mr683972eaf.17.1774296816960; Mon, 23 Mar 2026
 13:13:36 -0700 (PDT)
Date: Mon, 23 Mar 2026 13:13:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69c19ef0.050a0220.3bf4de.00aa.GAE@google.com>
Subject: [syzbot] [media?] [usb?] KASAN: slab-out-of-bounds Read in ec168_i2c_xfer
From: syzbot <syzbot+64485d3659c4c07111b4@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=c584910d0d74158d];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-56769-lists,linux-media=lfdr.de,64485d3659c4c07111b4];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[googlegroups.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,storage.googleapis.com:url,appspotmail.com:email,syzkaller.appspot.com:url,goo.gl:url]
X-Rspamd-Queue-Id: DE7012FD174
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot found the following issue on:

HEAD commit:    785f0eb2f85d Add linux-next specific files for 20260320
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=12cc5e02580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c584910d0d74158d
dashboard link: https://syzkaller.appspot.com/bug?extid=64485d3659c4c07111b4
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1689e06a580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12e22cba580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a1f7fd9c1a63/disk-785f0eb2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6c138da87c25/vmlinux-785f0eb2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4d1be64e56db/bzImage-785f0eb2.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+64485d3659c4c07111b4@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-out-of-bounds in ec168_i2c_xfer+0x4cd/0x640 drivers/media/usb/dvb-usb-v2/ec168.c:143
Read of size 1 at addr ffff888022a8e061 by task syz.0.17/6065

CPU: 0 UID: 0 PID: 6065 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 ec168_i2c_xfer+0x4cd/0x640 drivers/media/usb/dvb-usb-v2/ec168.c:143
 __i2c_transfer+0x79a/0x1f70 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x1cc/0x2d0 drivers/i2c/i2c-core-base.c:2317
 i2cdev_ioctl_rdwr+0x460/0x740 drivers/i2c/i2c-dev.c:306
 i2cdev_ioctl+0x6a5/0x880 drivers/i2c/i2c-dev.c:467
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc935d9c799
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffef6f8b6b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fc936015fa0 RCX: 00007fc935d9c799
RDX: 0000200000000140 RSI: 0000000000000707 RDI: 0000000000000004
RBP: 00007fc935e32c99 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fc936015fac R14: 00007fc936015fa0 R15: 00007fc936015fa0
 </TASK>

Allocated by task 6065:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5292 [inline]
 __kmalloc_node_track_caller_noprof+0x4db/0x7b0 mm/slub.c:5400
 memdup_user+0x2b/0xd0 mm/util.c:221
 i2cdev_ioctl_rdwr+0x1c6/0x740 drivers/i2c/i2c-dev.c:266
 i2cdev_ioctl+0x6a5/0x880 drivers/i2c/i2c-dev.c:467
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888022a8e060
 which belongs to the cache kmalloc-8 of size 8
The buggy address is located 0 bytes to the right of
 allocated 1-byte region [ffff888022a8e060, ffff888022a8e061)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888022a8e260 pfn:0x22a8e
flags: 0xfff00000000200(workingset|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000200 ffff88801b041500 ffffea0000a17150 ffffea0000cd6d90
raw: ffff888022a8e260 000000080080007b 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 3746368734, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x231/0x280 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0x2418/0x24b0 mm/page_alloc.c:3926
 __alloc_frozen_pages_noprof+0x233/0x3d0 mm/page_alloc.c:5213
 alloc_slab_page mm/slub.c:3278 [inline]
 allocate_slab+0x77/0x660 mm/slub.c:3467
 new_slab mm/slub.c:3525 [inline]
 refill_objects+0x339/0x3d0 mm/slub.c:7247
 refill_sheaf mm/slub.c:2816 [inline]
 __pcs_replace_empty_main+0x321/0x720 mm/slub.c:4651
 alloc_from_pcs mm/slub.c:4749 [inline]
 slab_alloc_node mm/slub.c:4883 [inline]
 __do_kmalloc_node mm/slub.c:5291 [inline]
 __kmalloc_noprof+0x474/0x760 mm/slub.c:5304
 kmalloc_noprof include/linux/slab.h:954 [inline]
 kzalloc_noprof include/linux/slab.h:1188 [inline]
 acpi_ns_internalize_name+0x2c9/0x3e0 drivers/acpi/acpica/nsutils.c:331
 acpi_ns_get_node_unlocked+0x186/0x480 drivers/acpi/acpica/nsutils.c:666
 acpi_ns_get_node+0x76/0xc0 drivers/acpi/acpica/nsutils.c:726
 acpi_ns_evaluate+0x283/0x1230 drivers/acpi/acpica/nseval.c:62
 acpi_evaluate_object+0x657/0xd50 drivers/acpi/acpica/nsxfeval.c:354
 acpi_evaluate_dsm drivers/acpi/utils.c:797 [inline]
 acpi_check_dsm+0x1bb/0x6f0 drivers/acpi/utils.c:830
 device_has_acpi_name drivers/pci/pci-label.c:44 [inline]
 acpi_attr_is_visible+0x89/0xe0 drivers/pci/pci-label.c:221
 create_files fs/sysfs/group.c:69 [inline]
 internal_create_group+0x5e5/0x1180 fs/sysfs/group.c:189
 internal_create_groups fs/sysfs/group.c:229 [inline]
 sysfs_create_groups+0x59/0x120 fs/sysfs/group.c:255
page_owner free stack trace missing

Memory state around the buggy address:
 ffff888022a8df00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888022a8df80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888022a8e000: fa fc fc fc fa fc fc fc fa fc fc fc 01 fc fc fc
                                                       ^
 ffff888022a8e080: 00 fc fc fc fa fc fc fc fa fc fc fc 07 fc fc fc
 ffff888022a8e100: 07 fc fc fc 05 fc fc fc fa fc fc fc 06 fc fc fc
==================================================================


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

