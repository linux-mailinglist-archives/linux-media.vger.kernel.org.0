Return-Path: <linux-media+bounces-56301-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEAUMg6ku2lBmQIAu9opvQ
	(envelope-from <linux-media+bounces-56301-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 08:21:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7139C2C737B
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 08:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C2ADC3008D72
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 07:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39C139EF14;
	Thu, 19 Mar 2026 07:21:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f78.google.com (mail-oo1-f78.google.com [209.85.161.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE16333D4E4
	for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 07:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773904897; cv=none; b=S68HoUPVvg+VbcnnLXOIaoXW5Exz6szpwaJyHI+92cHo2IPqRBUK17E1RsftbFK7RIgg81DU9X74wFVsGwXx6kXA/r/c5ChB3U6fOl/T/gNDu6TryDJUnWIepJPsHN5VU/uwmH7J/BnMWZ2B1MuLH70GW9/eRGF5IRdDnQnUK7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773904897; c=relaxed/simple;
	bh=+6YOSkAia3MK4Mq1F9YvlW2Ab67ia1hUEvE1KVhEuJ0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=FFUrEnSTBTc92D15+4+751lEvrwQ/9YubvBae/tn5+xfSbdKkvkOIAM9//YM33oTQEhnRKGQ2isppETQTpOeHuvCbLsJB5BJgej7Gkuan80MehW3kELK/og+9Iix3HuQ4NJJr9ZduiPfLwpMr9/lTKPmj6JpboPQuPL6CjDgzbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f78.google.com with SMTP id 006d021491bc7-67baaf178d9so12628371eaf.0
        for <linux-media@vger.kernel.org>; Thu, 19 Mar 2026 00:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773904895; x=1774509695;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ca/x4gCyclhSFyozmdZD9rwC/R53rbZ2cv6ip3c+cG8=;
        b=jQp50trxjVP0mLXCalKHG50FLosBpIalA7EhBq+dCnhimDQJmwj0LiQ4pJBkcFUVtT
         cD3PPYcTPe5at8JrN/AC7vm0cT67+te4Ppf8vcbfxC0iNUgYYyl/VfEUyIXABBMHQP70
         b8sgAG03h9Cv+TDnxdVMPHX/8Bst/U3n6DD7/4EoyoiliIdBusSAYqp6+lRo1h541rL+
         KO8aT5ZMuc2YDdr9m5bKUooioeG4R6oxFK45OyhkZAoTKsbp7U6ECcOrvjFpghR65Mcf
         pyApN06t1cuD6t/ROjvyVzt0OCKNPybh/ov5R4U6oOH5Lr9wuGEMEVP9QlKA2a/eyaYr
         5Wew==
X-Forwarded-Encrypted: i=1; AJvYcCXc9jzoXQ1cR1riCkFZjKmmhhTXMx2GfsXGzovcMZgpPhmpnm1Bq2yFNL51N+Zc5TbilwlVXZdQszFeeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVMjo4RcqMJWAhDHWC9zxKk4DxhtIoBNjQxU4H7rOf7C3n4wgp
	ytOQhMI2zv2rA4RdwXSkk8suDFrCoENb+rk5gO5BNLP8kURN3eRXqM+sjS1daXJFyUJ9+oeoJK8
	XEsAvF8t+TFR1ylsnq41nrkr1dWFWbr6pevVlElavE8Q13z7yZSmRqx6K3KM=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1ca9:b0:67b:decf:eef3 with SMTP id
 006d021491bc7-67c0daf21f6mr4895329eaf.37.1773904894957; Thu, 19 Mar 2026
 00:21:34 -0700 (PDT)
Date: Thu, 19 Mar 2026 00:21:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69bba3fe.050a0220.227207.0030.GAE@google.com>
Subject: [syzbot] [media?] [usb?] KASAN: slab-use-after-free Read in v4l2_open
From: syzbot <syzbot+1a7507a194fff09e5c44@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=6f3ef9419150a4b1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-56301-lists,linux-media=lfdr.de,1a7507a194fff09e5c44];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.663];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[storage.googleapis.com:url,goo.gl:url,syzkaller.appspot.com:url,appspotmail.com:email,googlegroups.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7139C2C737B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot found the following issue on:

HEAD commit:    8e5a478b6d6a Add linux-next specific files for 20260317
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1197006a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6f3ef9419150a4b1
dashboard link: https://syzkaller.appspot.com/bug?extid=1a7507a194fff09e5c44
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1161bd52580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16bfc216580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4fb0843c2e97/disk-8e5a478b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/59d50c6221b4/vmlinux-8e5a478b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/891eb3906306/bzImage-8e5a478b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1a7507a194fff09e5c44@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in v4l2_open+0x395/0x3a0 drivers/media/v4l2-core/v4l2-dev.c:444
Read of size 4 at addr ffff88801b168810 by task v4l_id/6152

CPU: 1 UID: 0 PID: 6152 Comm: v4l_id Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 v4l2_open+0x395/0x3a0 drivers/media/v4l2-core/v4l2-dev.c:444
 chrdev_open+0x4cd/0x5e0 fs/char_dev.c:411
 do_dentry_open+0x785/0x14e0 fs/open.c:949
 vfs_open+0x3b/0x340 fs/open.c:1081
 do_open fs/namei.c:4693 [inline]
 path_openat+0x2e08/0x3860 fs/namei.c:4852
 do_file_open+0x23e/0x4a0 fs/namei.c:4881
 do_sys_openat2+0x113/0x200 fs/open.c:1366
 do_sys_open fs/open.c:1372 [inline]
 __do_sys_openat fs/open.c:1388 [inline]
 __se_sys_openat fs/open.c:1383 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1383
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa818fde407
Code: 48 89 fa 4c 89 df e8 38 aa 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffdbeaca3e0 EFLAGS: 00000202 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007fa818f52880 RCX: 00007fa818fde407
RDX: 0000000000000000 RSI: 00007ffdbeacaf1c RDI: ffffffffffffff9c
RBP: 0000000000000002 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000000
R13: 00007ffdbeaca630 R14: 00007fa819237000 R15: 0000562990aec4d8
 </TASK>

Allocated by task 809:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x31c/0x660 mm/slub.c:5412
 kmalloc_noprof include/linux/slab.h:950 [inline]
 kzalloc_noprof include/linux/slab.h:1188 [inline]
 em28xx_v4l2_init+0x10b/0x2e70 drivers/media/usb/em28xx/em28xx-video.c:2538
 em28xx_init_extension+0x120/0x1c0 drivers/media/usb/em28xx/em28xx-core.c:1117
 process_one_work+0x9ab/0x1780 kernel/workqueue.c:3289
 process_scheduled_works kernel/workqueue.c:3380 [inline]
 worker_thread+0xba8/0x11e0 kernel/workqueue.c:3466
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 809:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2689 [inline]
 slab_free mm/slub.c:6242 [inline]
 kfree+0x1c5/0x650 mm/slub.c:6557
 em28xx_free_v4l2 drivers/media/usb/em28xx/em28xx-video.c:2118 [inline]
 kref_put include/linux/kref.h:65 [inline]
 em28xx_v4l2_init+0x1683/0x2e70 drivers/media/usb/em28xx/em28xx-video.c:2907
 em28xx_init_extension+0x120/0x1c0 drivers/media/usb/em28xx/em28xx-core.c:1117
 process_one_work+0x9ab/0x1780 kernel/workqueue.c:3289
 process_scheduled_works kernel/workqueue.c:3380 [inline]
 worker_thread+0xba8/0x11e0 kernel/workqueue.c:3466
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff88801b168000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 2064 bytes inside of
 freed 8192-byte region [ffff88801b168000, ffff88801b16a000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1b168
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b042280 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800020002 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801b042280 dead000000000100 dead000000000122
head: 0000000000000000 0000000800020002 00000000f5000000 0000000000000000
head: 00fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5499, tgid 5499 (S40network), ts 54008512816, free_ts 53918866034
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x231/0x280 mm/page_alloc.c:1857
 prep_new_page mm/page_alloc.c:1865 [inline]
 get_page_from_freelist+0x2418/0x24b0 mm/page_alloc.c:3924
 __alloc_frozen_pages_noprof+0x233/0x3d0 mm/page_alloc.c:5211
 alloc_slab_page mm/slub.c:3278 [inline]
 allocate_slab+0x77/0x660 mm/slub.c:3467
 new_slab mm/slub.c:3525 [inline]
 refill_objects+0x339/0x3d0 mm/slub.c:7247
 refill_sheaf mm/slub.c:2816 [inline]
 __pcs_replace_empty_main+0x321/0x720 mm/slub.c:4651
 alloc_from_pcs mm/slub.c:4749 [inline]
 slab_alloc_node mm/slub.c:4883 [inline]
 __kmalloc_cache_noprof+0x392/0x660 mm/slub.c:5407
 kmalloc_noprof include/linux/slab.h:950 [inline]
 kzalloc_noprof include/linux/slab.h:1188 [inline]
 tomoyo_print_bprm security/tomoyo/audit.c:26 [inline]
 tomoyo_init_log+0x112e/0x1fb0 security/tomoyo/audit.c:264
 tomoyo_supervisor+0x353/0x1570 security/tomoyo/common.c:2232
 tomoyo_audit_env_log security/tomoyo/environ.c:37 [inline]
 tomoyo_env_perm+0x151/0x1f0 security/tomoyo/environ.c:64
 tomoyo_environ security/tomoyo/domain.c:673 [inline]
 tomoyo_find_next_domain+0x15cb/0x1aa0 security/tomoyo/domain.c:889
 tomoyo_bprm_check_security+0x11b/0x180 security/tomoyo/tomoyo.c:102
 security_bprm_check+0x85/0x240 security/security.c:794
 search_binary_handler fs/exec.c:1654 [inline]
 exec_binprm fs/exec.c:1696 [inline]
 bprm_execve+0x8a2/0x1470 fs/exec.c:1748
 do_execveat_common+0x50d/0x690 fs/exec.c:1846
 __do_sys_execve fs/exec.c:1930 [inline]
 __se_sys_execve fs/exec.c:1924 [inline]
 __x64_sys_execve+0x97/0xc0 fs/exec.c:1924
page last free pid 5497 tgid 5497 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1401 [inline]
 __free_frozen_pages+0xbf0/0xd00 mm/page_alloc.c:2942
 __slab_free+0x274/0x2c0 mm/slub.c:5605
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4569 [inline]
 slab_alloc_node mm/slub.c:4898 [inline]
 __kmalloc_cache_noprof+0x2ba/0x660 mm/slub.c:5407
 kmalloc_noprof include/linux/slab.h:950 [inline]
 tomoyo_print_header security/tomoyo/audit.c:156 [inline]
 tomoyo_init_log+0x195/0x1fb0 security/tomoyo/audit.c:255
 tomoyo_supervisor+0x353/0x1570 security/tomoyo/common.c:2232
 tomoyo_audit_path_log security/tomoyo/file.c:169 [inline]
 tomoyo_path_permission+0x25a/0x380 security/tomoyo/file.c:592
 tomoyo_check_open_permission+0x2b2/0x470 security/tomoyo/file.c:782
 security_file_open+0xa9/0x240 security/security.c:2661
 do_dentry_open+0x384/0x14e0 fs/open.c:926
 vfs_open+0x3b/0x340 fs/open.c:1081
 do_open fs/namei.c:4693 [inline]
 path_openat+0x2e08/0x3860 fs/namei.c:4852
 do_file_open+0x23e/0x4a0 fs/namei.c:4881
 do_sys_openat2+0x113/0x200 fs/open.c:1366

Memory state around the buggy address:
 ffff88801b168700: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88801b168780: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88801b168800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff88801b168880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88801b168900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

