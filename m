Return-Path: <linux-media+bounces-49837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B98A3CEDA61
	for <lists+linux-media@lfdr.de>; Fri, 02 Jan 2026 05:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 33C313000B3B
	for <lists+linux-media@lfdr.de>; Fri,  2 Jan 2026 04:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E53D2C0F69;
	Fri,  2 Jan 2026 04:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="xV9S4vVp"
X-Original-To: linux-media@vger.kernel.org
Received: from r3-22.sinamail.sina.com.cn (r3-22.sinamail.sina.com.cn [202.108.3.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED92128541A
	for <linux-media@vger.kernel.org>; Fri,  2 Jan 2026 04:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767327998; cv=none; b=k4/vAgSQd+iL1rE8yOv7GoMu8OlqfeOjmy4Cg3+/6ztog1C+RtmS6ALzr61SSMG+RhP+AFxnejecW5gR73QhKPW7C2LNMVVgGoIgO8UAB39IZGEZAEsNcxKDmIxZc8tvt2KjKQwAhHAl4dRDkgPjrYyKS3Oq8aCJVj8DppRf86w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767327998; c=relaxed/simple;
	bh=eIEqUO6H3nOcorGG/gqI3VQPEbPbR5/1Swl/JkNUuiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BGY+G69FhIBeXXCEN+hzfb2Lmhk1U4BiYMuGc8MP3cxSl4HLMnSsz+eAP3JejfhOmsjVCF9lg61cpZwuhDSnCAtVpFtIa7ya28va2+PgT63yT0L/QaXEDBTeBNKlUvmWeDEQvpjlBs7KnwXBTcM+HX4Bn4asNzMVDKfPSWYJnH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=xV9S4vVp; arc=none smtp.client-ip=202.108.3.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1767327994;
	bh=HoRGImMMGDvXNfhnSb+EBae00ZkrwneUBB5IFCkgFVM=;
	h=From:Subject:Date:Message-ID;
	b=xV9S4vVpvRvfOdmKFrXsxin19FHPy/9VBVuQ9ZU/ntSMlfi9U4Nlj/U02LnfvJclA
	 C/5QQceaJhMgA9KZYG5CtFgqi7E0pBDVc4nVIxkbsPeG1MGHrD0/J5xhXQxyXPB6g9
	 DynzwUkMN5rXT/HremjeVVlA9B7+7ffjAl3ZtUPw=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.57.85])
	by sina.com (10.54.253.33) with ESMTP
	id 6957486500002455; Fri, 2 Jan 2026 12:24:07 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 2223776685145
X-SMAIL-UIID: F4196147B9114C4DBB47570217143C28-20260102-122407-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+2bf29e42be0666f2df70@syzkaller.appspotmail.com>
Cc: laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [media?] KASAN: slab-use-after-free Write in media_request_alloc
Date: Fri,  2 Jan 2026 12:23:56 +0800
Message-ID: <20260102042358.1892-1-hdanton@sina.com>
In-Reply-To: <69573daf.050a0220.a1b6.034d.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Thu, 01 Jan 2026 19:38:23 -0800
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    c875a6c32467 Merge tag 'usb-6.19-rc3' of git://git.kernel...
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1395e49a580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=513255d80ab78f2b
> dashboard link: https://syzkaller.appspot.com/bug?extid=2bf29e42be0666f2df70
> compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1795e49a580000
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-c875a6c3.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/a757db7716a5/vmlinux-c875a6c3.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/3095f726e048/bzImage-c875a6c3.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+2bf29e42be0666f2df70@syzkaller.appspotmail.com
> 
> ==================================================================
> BUG: KASAN: slab-use-after-free in vsnprintf+0x38b/0xee0 lib/vsprintf.c:2898
> Write of size 1 at addr ffff888042136c11 by task syz.4.761/7191
> 
> CPU: 0 UID: 0 PID: 7191 Comm: syz.4.761 Not tainted syzkaller #0 PREEMPT(full) 
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
>  print_address_description mm/kasan/report.c:378 [inline]
>  print_report+0xca/0x240 mm/kasan/report.c:482
>  kasan_report+0x118/0x150 mm/kasan/report.c:595
>  check_region_inline mm/kasan/generic.c:-1 [inline]
>  kasan_check_range+0x2b0/0x2c0 mm/kasan/generic.c:200
>  __asan_memcpy+0x40/0x70 mm/kasan/shadow.c:106
>  vsnprintf+0x38b/0xee0 lib/vsprintf.c:2898
>  snprintf+0xda/0x120 lib/vsprintf.c:3041
>  media_request_alloc+0x319/0x5b0 drivers/media/mc/mc-request.c:320
>  media_device_request_alloc+0x98/0xd0 drivers/media/mc/mc-device.c:380
>  media_device_ioctl+0x278/0x430 drivers/media/mc/mc-device.c:465
>  vfs_ioctl fs/ioctl.c:51 [inline]

What is difficult to understand is why file is closed while ioctl does not finish.

>  __do_sys_ioctl fs/ioctl.c:597 [inline]
>  __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f801458f7c9
> Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f801547d038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007f80147e5fa0 RCX: 00007f801458f7c9
> RDX: 0000000000000000 RSI: 0000000080047c05 RDI: 0000000000000003
> RBP: 00007f8014613f91 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007f80147e6038 R14: 00007f80147e5fa0 R15: 00007ffd838327f8
>  </TASK>
> 
> Allocated by task 7191:
>  kasan_save_stack mm/kasan/common.c:56 [inline]
>  kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
>  poison_kmalloc_redzone mm/kasan/common.c:397 [inline]
>  __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:414
>  kasan_kmalloc include/linux/kasan.h:262 [inline]
>  __kmalloc_cache_noprof+0x3e2/0x700 mm/slub.c:5776
>  kmalloc_noprof include/linux/slab.h:957 [inline]
>  kzalloc_noprof include/linux/slab.h:1094 [inline]
>  media_request_alloc+0xe4/0x5b0 drivers/media/mc/mc-request.c:294
>  media_device_request_alloc+0x98/0xd0 drivers/media/mc/mc-device.c:380
>  media_device_ioctl+0x278/0x430 drivers/media/mc/mc-device.c:465
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:597 [inline]
>  __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> Freed by task 7194:
>  kasan_save_stack mm/kasan/common.c:56 [inline]
>  kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
>  kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
>  poison_slab_object mm/kasan/common.c:252 [inline]
>  __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:284
>  kasan_slab_free include/linux/kasan.h:234 [inline]
>  slab_free_hook mm/slub.c:2540 [inline]
>  slab_free mm/slub.c:6670 [inline]
>  kfree+0x1c0/0x660 mm/slub.c:6878
>  media_request_close+0x38/0x50 drivers/media/mc/mc-request.c:89
>  __fput+0x44c/0xa70 fs/file_table.c:468
>  task_work_run+0x1d4/0x260 kernel/task_work.c:233
>  resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
>  __exit_to_user_mode_loop kernel/entry/common.c:44 [inline]
>  exit_to_user_mode_loop+0xef/0x4e0 kernel/entry/common.c:75
>  __exit_to_user_mode_prepare include/linux/irq-entry-common.h:226 [inline]
>  syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:256 [inline]
>  syscall_exit_to_user_mode_work include/linux/entry-common.h:159 [inline]
>  syscall_exit_to_user_mode include/linux/entry-common.h:194 [inline]
>  do_syscall_64+0x2b7/0xf80 arch/x86/entry/syscall_64.c:100
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> The buggy address belongs to the object at ffff888042136c00
>  which belongs to the cache kmalloc-256 of size 256
> The buggy address is located 17 bytes inside of
>  freed 256-byte region [ffff888042136c00, ffff888042136d00)
> 
> The buggy address belongs to the physical page:
> page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x42136
> flags: 0x4fff00000000000(node=1|zone=1|lastcpupid=0x7ff)
> page_type: f5(slab)
> raw: 04fff00000000000 ffff88801a441b40 ffffea000105e940 dead000000000008
> raw: 0000000000000000 0000000000080008 00000000f5000000 0000000000000000
> page dumped because: kasan: bad access detected
> page_owner tracks the page as allocated
> page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 6435, tgid 6433 (syz.5.390), ts 150606964609, free_ts 150605503050
>  set_page_owner include/linux/page_owner.h:32 [inline]
>  post_alloc_hook+0x234/0x290 mm/page_alloc.c:1846
>  prep_new_page mm/page_alloc.c:1854 [inline]
>  get_page_from_freelist+0x24e0/0x2580 mm/page_alloc.c:3915
>  __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5210
>  alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2486
>  alloc_slab_page mm/slub.c:3075 [inline]
>  allocate_slab+0x86/0x3b0 mm/slub.c:3248
>  new_slab mm/slub.c:3302 [inline]
>  ___slab_alloc+0xe53/0x1820 mm/slub.c:4656
>  __slab_alloc+0x65/0x100 mm/slub.c:4779
>  __slab_alloc_node mm/slub.c:4855 [inline]
>  slab_alloc_node mm/slub.c:5251 [inline]
>  __kmalloc_cache_noprof+0x41e/0x700 mm/slub.c:5771
>  kmalloc_noprof include/linux/slab.h:957 [inline]
>  kzalloc_noprof include/linux/slab.h:1094 [inline]
>  media_request_alloc+0xe4/0x5b0 drivers/media/mc/mc-request.c:294
>  media_device_request_alloc+0x98/0xd0 drivers/media/mc/mc-device.c:380
>  media_device_ioctl+0x278/0x430 drivers/media/mc/mc-device.c:465
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:597 [inline]
>  __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> page last free pid 5325 tgid 5325 stack trace:
>  reset_page_owner include/linux/page_owner.h:25 [inline]
>  free_pages_prepare mm/page_alloc.c:1395 [inline]
>  __free_frozen_pages+0xbc8/0xd30 mm/page_alloc.c:2943
>  __tlb_remove_table_free mm/mmu_gather.c:227 [inline]
>  tlb_remove_table_rcu+0x85/0x100 mm/mmu_gather.c:290
>  rcu_do_batch kernel/rcu/tree.c:2605 [inline]
>  rcu_core+0xc8e/0x1720 kernel/rcu/tree.c:2857
>  handle_softirqs+0x22b/0x7c0 kernel/softirq.c:622
>  do_softirq+0x76/0xd0 kernel/softirq.c:523
>  __local_bh_enable_ip+0xf8/0x130 kernel/softirq.c:450
>  lock_sock include/net/sock.h:1700 [inline]
>  tcp_sendmsg+0x21/0x50 net/ipv4/tcp.c:1411
>  sock_sendmsg_nosec net/socket.c:727 [inline]
>  __sock_sendmsg+0x19c/0x270 net/socket.c:742
>  sock_write_iter+0x279/0x360 net/socket.c:1195
>  new_sync_write fs/read_write.c:593 [inline]
>  vfs_write+0x5c9/0xb30 fs/read_write.c:686
>  ksys_write+0x145/0x250 fs/read_write.c:738
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xec/0xf80 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> Memory state around the buggy address:
>  ffff888042136b00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>  ffff888042136b80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >ffff888042136c00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                          ^
>  ffff888042136c80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>  ffff888042136d00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ==================================================================

