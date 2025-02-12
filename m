Return-Path: <linux-media+bounces-26043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6702BA321CF
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 10:11:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3588188983D
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 09:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402F8205E01;
	Wed, 12 Feb 2025 09:11:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C91F1D63C0
	for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 09:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739351495; cv=none; b=S7EawvlMwazPQzb2NABXLLbuHPS8UZYH69SHRdIZNGvvhKYmn0geciN6Uf0xkppksMXud+cB9nKsj+LV9LLKAX1HS3HlypacgjXarG29LWr/BppvYM7evr4oqu9acLiAtAlr0sit7itSuZPDQ9m2hn/f6Bt1GntDDtL/emhij80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739351495; c=relaxed/simple;
	bh=mRFr9dHoNaZOTzl2wK/QQQdK0Bksa5htD9RvTKZTVV0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=XHb0PE8EBGPhT7+bumnllw53qlSQybAN+4Xv4cGFr6ZEhV4DIKpLvC9u5VSeyMnd13RAjDhTK6yd+Ls1LfNIQBCtTY4bAeVCrtFZx72zs8WO9uaY60opJ+S8fhdsgF8yO5ki/tISxH8IgQ09zwLkWPKPuAM6T17QU1fsWJEADn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-855349f7139so449724739f.1
        for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 01:11:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739351493; x=1739956293;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tX8ICBEA9DhqP5/OE0dzRIYxBJhxkdbhRUL3n3qp3N0=;
        b=rVSkadcUJ4yCnRGBJIQmaqmUndlCMPWVnklrwdupYwy0OEHchCEbnSYOtFSyUV45ue
         A95XVzlul7hdRiI29jRVbCwUPVwJFjC3dk0sPvjd2QyTtCUK93JwFE9ddCvHMU41CSdx
         wCSLjoA6wAmz7psWoWYJd/qJ2klHOfYbmrh1N5+nRFnzX+oBXuCGVCrrnH9jXRNolplS
         D0UnruXHFNpjqJmWggqM+7QJaEX+Gr3CWVgW3crfj01BdSyDIa8H8eW5SPPxCYF+ZuA+
         Gnz3pWsYvtrflpvv2ncYbQjVXMNRHNk2qz4O94teYvv7uruY7Y5QqC7F/yS86AE/+Qyq
         BCfA==
X-Forwarded-Encrypted: i=1; AJvYcCVE5LUOUCNenXZKuw5VbIFmhHQK9MjdSwBnetlYmrrjgSgzVv6VY/VoUlwJAJHbqcsOYysrkTolhus31A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5XuZ28pZLMjUEix1vdZ2FoxW7WNLVVrGqSKzRgLdMBcs7+rFA
	Xy/+Dw5C2auqt0CuFDBwEM0T0lvgrT8y2k5vN1fP/3+vSmzKUNBTLQ0J1j0vTW6wyNkj4aNfXih
	KgjRObGBwpALW/97Bsqwh7t/umJys0IHOyt9p3K3bAgGMo9HQ7E46DKE=
X-Google-Smtp-Source: AGHT+IFJrZpM07QzXjdHerSi56dF+sYefPJzcOy/S9CxIdfsBdd1UhGeJOZcjullwHrQSYTGGWCS/8VLFBsgTVMjQqR0xAsqwb7l
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1888:b0:3cf:f9e0:f4ae with SMTP id
 e9e14a558f8ab-3d17be272e3mr21380595ab.6.1739351493127; Wed, 12 Feb 2025
 01:11:33 -0800 (PST)
Date: Wed, 12 Feb 2025 01:11:33 -0800
In-Reply-To: <000000000000c34595061d6db440@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ac65c5.050a0220.3d72c.0132.GAE@google.com>
Subject: Re: [syzbot] [media?] KASAN: vmalloc-out-of-bounds Write in
 tpg_fill_plane_buffer (3)
From: syzbot <syzbot+365005005522b70a36f2@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    09fbf3d50205 Merge tag 'tomoyo-pr-20250211' of git://git.c..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=167e4718580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3c2347dd6174fbe2
dashboard link: https://syzkaller.appspot.com/bug?extid=365005005522b70a36f2
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15d28aa4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1493a3f8580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-09fbf3d5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/835b3d29c46c/vmlinux-09fbf3d5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ff4bfd8a5d42/bzImage-09fbf3d5.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+365005005522b70a36f2@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: vmalloc-out-of-bounds in tpg_fill_plane_pattern drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2608 [inline]
BUG: KASAN: vmalloc-out-of-bounds in tpg_fill_plane_buffer+0x1a9c/0x5af0 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2705
Write of size 1440 at addr ffffc9000d0ffda0 by task vivid-000-vid-c/5304

CPU: 0 UID: 0 PID: 5304 Comm: vivid-000-vid-c Not tainted 6.14.0-rc2-syzkaller-00039-g09fbf3d50205 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x169/0x550 mm/kasan/report.c:489
 kasan_report+0x143/0x180 mm/kasan/report.c:602
 kasan_check_range+0x282/0x290 mm/kasan/generic.c:189
 __asan_memcpy+0x40/0x70 mm/kasan/shadow.c:106
 tpg_fill_plane_pattern drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2608 [inline]
 tpg_fill_plane_buffer+0x1a9c/0x5af0 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2705
 vivid_fillbuff drivers/media/test-drivers/vivid/vivid-kthread-cap.c:470 [inline]
 vivid_thread_vid_cap_tick+0xf8e/0x60d0 drivers/media/test-drivers/vivid/vivid-kthread-cap.c:629
 vivid_thread_vid_cap+0x8aa/0xf30 drivers/media/test-drivers/vivid/vivid-kthread-cap.c:767
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

The buggy address belongs to the virtual mapping at
 [ffffc9000d0e9000, ffffc9000d101000) created by:
 vb2_vmalloc_alloc+0xf2/0x340 drivers/media/common/videobuf2/videobuf2-vmalloc.c:47

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x43e47
flags: 0x4fff00000000000(node=1|zone=1|lastcpupid=0x7ff)
raw: 04fff00000000000 0000000000000000 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x2dc2(GFP_KERNEL|__GFP_HIGHMEM|__GFP_NOWARN|__GFP_ZERO), pid 5303, tgid 5303 (syz-executor881), ts 69776556067, free_ts 68046210271
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f4/0x240 mm/page_alloc.c:1551
 prep_new_page mm/page_alloc.c:1559 [inline]
 get_page_from_freelist+0x365c/0x37a0 mm/page_alloc.c:3477
 __alloc_frozen_pages_noprof+0x292/0x710 mm/page_alloc.c:4739
 alloc_pages_mpol+0x311/0x660 mm/mempolicy.c:2270
 alloc_frozen_pages_noprof mm/mempolicy.c:2341 [inline]
 alloc_pages_noprof+0x121/0x190 mm/mempolicy.c:2361
 vm_area_alloc_pages mm/vmalloc.c:3591 [inline]
 __vmalloc_area_node mm/vmalloc.c:3669 [inline]
 __vmalloc_node_range_noprof+0x9c6/0x1380 mm/vmalloc.c:3846
 vmalloc_user_noprof+0x74/0x80 mm/vmalloc.c:4000
 vb2_vmalloc_alloc+0xf2/0x340 drivers/media/common/videobuf2/videobuf2-vmalloc.c:47
 __vb2_buf_mem_alloc drivers/media/common/videobuf2/videobuf2-core.c:242 [inline]
 __vb2_queue_alloc+0xa0b/0x16f0 drivers/media/common/videobuf2/videobuf2-core.c:523
 vb2_core_reqbufs+0xd2e/0x17c0 drivers/media/common/videobuf2/videobuf2-core.c:964
 __vb2_init_fileio+0x319/0xf90 drivers/media/common/videobuf2/videobuf2-core.c:2895
 __vb2_perform_fileio+0x31a/0x17b0 drivers/media/common/videobuf2/videobuf2-core.c:3041
 vb2_fop_read+0x247/0x330 drivers/media/common/videobuf2/videobuf2-v4l2.c:1215
 v4l2_read+0x1a4/0x2c0 drivers/media/v4l2-core/v4l2-dev.c:316
 vfs_read+0x1f8/0xb40 fs/read_write.c:563
 ksys_read+0x18f/0x2b0 fs/read_write.c:708
page last free pid 5290 tgid 5290 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_frozen_pages+0xe0d/0x10e0 mm/page_alloc.c:2660
 discard_slab mm/slub.c:2684 [inline]
 __put_partials+0x160/0x1c0 mm/slub.c:3153
 put_cpu_partial+0x17c/0x250 mm/slub.c:3228
 __slab_free+0x290/0x380 mm/slub.c:4479
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x9a/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x14f/0x170 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x23/0x80 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4115 [inline]
 slab_alloc_node mm/slub.c:4164 [inline]
 kmem_cache_alloc_noprof+0x1d9/0x380 mm/slub.c:4171
 vm_area_dup+0x27/0x290 kernel/fork.c:487
 __split_vma+0x1cb/0xc50 mm/vma.c:466
 vms_gather_munmap_vmas+0x2e6/0x1600 mm/vma.c:1268
 do_vmi_align_munmap+0x3ff/0x6f0 mm/vma.c:1436
 do_vmi_munmap+0x24e/0x2d0 mm/vma.c:1493
 __vm_munmap+0x372/0x510 mm/vma.c:2951
 __do_sys_munmap mm/mmap.c:1084 [inline]
 __se_sys_munmap mm/mmap.c:1081 [inline]
 __x64_sys_munmap+0x60/0x70 mm/mmap.c:1081
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83

Memory state around the buggy address:
 ffffc9000d0fff00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc9000d0fff80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffc9000d100000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                   ^
 ffffc9000d100080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc9000d100100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

