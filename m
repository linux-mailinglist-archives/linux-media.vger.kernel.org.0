Return-Path: <linux-media+bounces-61872-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJ3yHLJoCmpP1AQAu9opvQ
	(envelope-from <linux-media+bounces-61872-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 03:17:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA43B564B62
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 03:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EBF7301A1E0
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 01:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F4619D071;
	Mon, 18 May 2026 01:17:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f79.google.com (mail-ot1-f79.google.com [209.85.210.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EC0191
	for <linux-media@vger.kernel.org>; Mon, 18 May 2026 01:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779067049; cv=none; b=jh7EHB+TYK/WkEP4jZG+kwL+8/ozeW/V55GlSaI1u9dYjp4WNlBtAManqM5GqzyGzDJlzPtad3P8+WUBTMGSJzilDzKQ06RQQc42Mqny1VEbObrJo7krzBVH8XUFItcGDaCllD35fpv6EgOFXUvDEPEBqlEpk8obKkjwBlUmC6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779067049; c=relaxed/simple;
	bh=2S1bXa81hEHENRfO9ZPkNDxKwgEQibu3KB3r3p+F83A=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=HhoYqIdIvmH3bftaF0kIkO6HKFV5Twt+D+FGYoNqGE5vawxs+alGCz8l4QUtF2GnLhiiyHH26TOPPSYxLHsHq4MCUpkHbvVZhgtlAJX5iROU1NTubAiA4Bd7846quWI8t9ESeCi+3VJ1L/vwriZitg6w/aN3Fb4p0iZoOLch+Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f79.google.com with SMTP id 46e09a7af769-7dbd4fe0e15so5191476a34.3
        for <linux-media@vger.kernel.org>; Sun, 17 May 2026 18:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779067046; x=1779671846;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jH8fQ9nq0ikUNSnsDIN+m1zj1Z2YS+fYybGmZ5EjKXE=;
        b=KLZ8nsn+KrC1hGeRLZaAzfIfbTV4uNQf5bGS8I0Ru+8X1xt3/z9+M4EVm9B997JyR+
         EkWMozvmg+fLQTY8juCsuEKBX7qKw0uukfmEXAnJaZGv/TemmohjLgn83VZmGS4LOYXv
         Y8KW0PZ2sKgIfFMWxhGbxVjKYqcUL/6AjfkqyFbrcSUO7sl7qCXiu+Xfg+PQpgTZhPgt
         WlL/GLUjx2LTEnaQeh3+XUIGvY/725L0vuR5FEE9g1rZdlirlTdo+kUiurLBSZUez6vt
         VMu0SzUZUMwOBCpNcAH9YjOpErNczYJC8C3x+wh4d33iJf8eUy7yGQtDRG/1QA4y38Bm
         MX5w==
X-Forwarded-Encrypted: i=1; AFNElJ8xG6Dicgb7IyMFv19GkN/7TpBPXtVNVGjluHrHkO+C6O+NPRNNQ3puwSj2a9Ohy1+Qg+ajQClsVwpgLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkPigCoGYFrofFy1nkWhofUCXKdSolPDFGVyzKA3i5xiYP5awc
	A1YCPzXD9gPf0xdJfqd+q5i7Mop8CdgDzuPr2ms+5YrVfAogYLyTdlLdImkmRR0f0qHriTF92RV
	8k0JSJkvx6qIrzmHs+eDep5/Ci3jVFB5zVSoZgE2KVm2IN6XOFrsQCEOv9RI=
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2210:b0:696:22dc:b4db with SMTP id
 006d021491bc7-69c94588765mr8712794eaf.41.1779067046301; Sun, 17 May 2026
 18:17:26 -0700 (PDT)
Date: Sun, 17 May 2026 18:17:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a0a68a6.170a0220.bc3c0.0008.GAE@google.com>
Subject: [syzbot] [media?] KASAN: slab-use-after-free Read in dvb_frontend_open
From: syzbot <syzbot+40339ea82afa8184ad5d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: CA43B564B62
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=a834c6344141a58b];
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
	TAGGED_FROM(0.00)[bounces-61872-lists,linux-media=lfdr.de,40339ea82afa8184ad5d];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[storage.googleapis.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    5cbb61bf4168 arm64/fpsimd: ptrace: zero target's fpsimd_st..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=14614fce580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a834c6344141a58b
dashboard link: https://syzkaller.appspot.com/bug?extid=40339ea82afa8184ad5d
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=127e5636580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/04156ec16593/disk-5cbb61bf.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6bfa041e2c79/vmlinux-5cbb61bf.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a92d82d8a79e/Image-5cbb61bf.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+40339ea82afa8184ad5d@syzkaller.appspotmail.com

i2c i2c-0: dvb_frontend_start: failed to start kthread (-4)
==================================================================
BUG: KASAN: slab-use-after-free in dvb_frontend_open+0xdac/0x105c drivers/media/dvb-core/dvb_frontend.c:2892
Read of size 4 at addr ffff0000cc9e9c3c by task syz.4.109/5364

CPU: 1 UID: 0 PID: 5364 Comm: syz.4.109 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/18/2026
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 print_address_description+0xb0/0x238 mm/kasan/report.c:378
 print_report+0x68/0x84 mm/kasan/report.c:482
 kasan_report+0x8c/0xc4 mm/kasan/report.c:595
 __asan_report_load4_noabort+0x20/0x2c mm/kasan/report_generic.c:380
 dvb_frontend_open+0xdac/0x105c drivers/media/dvb-core/dvb_frontend.c:2892
 dvb_device_open+0x1f4/0x250 drivers/media/dvb-core/dvbdev.c:109
 chrdev_open+0x398/0x3e8 fs/char_dev.c:411
 do_dentry_open+0x5c8/0x10dc fs/open.c:947
 vfs_open+0x44/0x2d4 fs/open.c:1079
 do_open fs/namei.c:4699 [inline]
 path_openat+0x2234/0x2a6c fs/namei.c:4858
 do_file_open+0x1c4/0x2e4 fs/namei.c:4887
 do_sys_openat2+0x114/0x1e8 fs/open.c:1364
 do_sys_open+0xac/0xdc fs/open.c:1370
 __do_sys_openat fs/open.c:1386 [inline]
 __se_sys_openat fs/open.c:1381 [inline]
 __arm64_sys_openat+0x9c/0xb8 fs/open.c:1381
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xe8/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x25c arch/arm64/kernel/entry-common.c:723
 el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:742
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594

Allocated by task 1:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x40/0x78 mm/kasan/common.c:78
 kasan_save_alloc_info+0x44/0x54 mm/kasan/generic.c:570
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x9c/0xb4 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x284/0x56c mm/slub.c:5415
 kmalloc_noprof include/linux/slab.h:950 [inline]
 kzalloc_noprof include/linux/slab.h:1188 [inline]
 dvb_register_device+0x1ac/0x16ec drivers/media/dvb-core/dvbdev.c:472
 dvb_register_frontend+0x464/0x698 drivers/media/dvb-core/dvb_frontend.c:3051
 vidtv_bridge_dvb_init drivers/media/test-drivers/vidtv/vidtv_bridge.c:438 [inline]
 vidtv_bridge_probe+0x57c/0xa24 drivers/media/test-drivers/vidtv/vidtv_bridge.c:510
 platform_probe+0xfc/0x198 drivers/base/platform.c:1418
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x2a8/0x7e8 drivers/base/dd.c:709
 __driver_probe_device+0x1e0/0x33c drivers/base/dd.c:871
 driver_probe_device+0x6c/0x19c drivers/base/dd.c:901
 __driver_attach+0x164/0x374 drivers/base/dd.c:1295
 bus_for_each_dev+0x128/0x1b4 drivers/base/bus.c:383
 driver_attach+0x4c/0x5c drivers/base/dd.c:1313
 bus_add_driver+0x208/0x4fc drivers/base/bus.c:756
 driver_register+0x220/0x30c drivers/base/driver.c:249
 __platform_driver_register+0x6c/0x80 drivers/base/platform.c:910
 vidtv_bridge_init+0x34/0x5c drivers/media/test-drivers/vidtv/vidtv_bridge.c:600
 do_one_initcall+0x274/0xc20 init/main.c:1392
 do_initcall_level+0x128/0x1c4 init/main.c:1454
 do_initcalls+0x70/0xd0 init/main.c:1470
 do_basic_setup+0x7c/0x90 init/main.c:1490
 kernel_init_freeable+0x268/0x3a8 init/main.c:1703
 kernel_init+0x24/0x1dc init/main.c:1593
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:842

Freed by task 5364:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x40/0x78 mm/kasan/common.c:78
 kasan_save_free_info+0x58/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x74/0xa4 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2689 [inline]
 slab_free mm/slub.c:6246 [inline]
 kfree+0x188/0x5e4 mm/slub.c:6561
 dvb_free_device drivers/media/dvb-core/dvbdev.c:616 [inline]
 kref_put include/linux/kref.h:65 [inline]
 dvb_device_put+0x64/0xd0 drivers/media/dvb-core/dvbdev.c:629
 dvb_generic_release+0xec/0x154 drivers/media/dvb-core/dvbdev.c:169
 dvb_frontend_open+0x9b8/0x105c drivers/media/dvb-core/dvb_frontend.c:2890
 dvb_device_open+0x1f4/0x250 drivers/media/dvb-core/dvbdev.c:109
 chrdev_open+0x398/0x3e8 fs/char_dev.c:411
 do_dentry_open+0x5c8/0x10dc fs/open.c:947
 vfs_open+0x44/0x2d4 fs/open.c:1079
 do_open fs/namei.c:4699 [inline]
 path_openat+0x2234/0x2a6c fs/namei.c:4858
 do_file_open+0x1c4/0x2e4 fs/namei.c:4887
 do_sys_openat2+0x114/0x1e8 fs/open.c:1364
 do_sys_open+0xac/0xdc fs/open.c:1370
 __do_sys_openat fs/open.c:1386 [inline]
 __se_sys_openat fs/open.c:1381 [inline]
 __arm64_sys_openat+0x9c/0xb8 fs/open.c:1381
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xe8/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x25c arch/arm64/kernel/entry-common.c:723
 el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:742
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594

The buggy address belongs to the object at ffff0000cc9e9c00
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 60 bytes inside of
 freed 256-byte region [ffff0000cc9e9c00, ffff0000cc9e9d00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff0000cc9e9200 pfn:0x10c9e8
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x5ffc00000000240(workingset|head|node=0|zone=2|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 05ffc00000000240 ffff0000c0001b40 fffffdffc333d590 fffffdffc3064090
raw: ffff0000cc9e9200 000000080010000f 00000000f5000000 0000000000000000
head: 05ffc00000000240 ffff0000c0001b40 fffffdffc333d590 fffffdffc3064090
head: ffff0000cc9e9200 000000080010000f 00000000f5000000 0000000000000000
head: 05ffc00000000001 fffffdffc3327a01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000002
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff0000cc9e9b00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff0000cc9e9b80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff0000cc9e9c00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                        ^
 ffff0000cc9e9c80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff0000cc9e9d00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================
------------[ cut here ]------------
refcount_t: underflow; use-after-free.
WARNING: lib/refcount.c:28 at refcount_warn_saturate+0x154/0x1f8 lib/refcount.c:28, CPU#1: syz.4.109/5364
Modules linked in:
CPU: 1 UID: 0 PID: 5364 Comm: syz.4.109 Tainted: G    B               syzkaller #0 PREEMPT 
Tainted: [B]=BAD_PAGE
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/18/2026
pstate: 63400005 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : refcount_warn_saturate+0x154/0x1f8 lib/refcount.c:28
lr : refcount_warn_saturate+0x154/0x1f8 lib/refcount.c:28
sp : ffff80009bdd7540
x29: ffff80009bdd7540 x28: ffff0000dbdcc748 x27: dfff800000000000
x26: 1fffe0001b7b98e9 x25: dfff800000000000 x24: ffff0000cc649068
x23: ffff0000dbdcc748 x22: ffff800083949be4 x21: 0000000000000000
x20: ffff0000cc9e9c10 x19: ffff800089f06000 x18: 0000000000000000
x17: 3d3d3d3d3d3d3d3d x16: 3d3d3d3d3d3d3d3d x15: 3d3d3d3d3d3d3d3d
x14: 3d3d3d3d3d3d3d3d x13: 0000000000000001 x12: 0000000000000000
x11: 0000000000000b4e x10: 0000000000ff0100 x9 : 9ef5470fdd42bb00
x8 : 9ef5470fdd42bb00 x7 : 0000000000000000 x6 : ffff8000804886d0
x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff8000802f13b0
x2 : 0000000100000000 x1 : ffff0000d7dc8000 x0 : 0000000000000000
Call trace:
 refcount_warn_saturate+0x154/0x1f8 lib/refcount.c:28 (P)
 __refcount_sub_and_test include/linux/refcount.h:400 [inline]
 __refcount_dec_and_test include/linux/refcount.h:432 [inline]
 refcount_dec_and_test include/linux/refcount.h:450 [inline]
 kref_put include/linux/kref.h:64 [inline]
 dvb_device_put+0xac/0xd0 drivers/media/dvb-core/dvbdev.c:629
 dvb_device_open+0x238/0x250 drivers/media/dvb-core/dvbdev.c:113
 chrdev_open+0x398/0x3e8 fs/char_dev.c:411
 do_dentry_open+0x5c8/0x10dc fs/open.c:947
 vfs_open+0x44/0x2d4 fs/open.c:1079
 do_open fs/namei.c:4699 [inline]
 path_openat+0x2234/0x2a6c fs/namei.c:4858
 do_file_open+0x1c4/0x2e4 fs/namei.c:4887
 do_sys_openat2+0x114/0x1e8 fs/open.c:1364
 do_sys_open+0xac/0xdc fs/open.c:1370
 __do_sys_openat fs/open.c:1386 [inline]
 __se_sys_openat fs/open.c:1381 [inline]
 __arm64_sys_openat+0x9c/0xb8 fs/open.c:1381
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xe8/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x25c arch/arm64/kernel/entry-common.c:723
 el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:742
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594
irq event stamp: 562843
hardirqs last  enabled at (562843): [<ffff8000867248cc>] irqentry_exit_to_kernel_mode_after_preempt include/linux/irq-entry-common.h:515 [inline]
hardirqs last  enabled at (562843): [<ffff8000867248cc>] arm64_exit_to_kernel_mode+0x7c/0x90 arch/arm64/kernel/entry-common.c:62
hardirqs last disabled at (562842): [<ffff800086720b00>] __el1_irq arch/arm64/kernel/entry-common.c:493 [inline]
hardirqs last disabled at (562842): [<ffff800086720b00>] el1_interrupt+0x28/0x60 arch/arm64/kernel/entry-common.c:509
softirqs last  enabled at (562784): [<ffff800080139e6c>] local_bh_enable+0x10/0x34 include/linux/bottom_half.h:32
softirqs last disabled at (562782): [<ffff800080139e38>] local_bh_disable+0x10/0x34 include/linux/bottom_half.h:19
---[ end trace 0000000000000000 ]---


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

