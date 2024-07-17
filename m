Return-Path: <linux-media+bounces-15069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2969A933982
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 11:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 326EE1C2205A
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 09:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523903987B;
	Wed, 17 Jul 2024 09:01:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526E947A7C
	for <linux-media@vger.kernel.org>; Wed, 17 Jul 2024 09:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721206884; cv=none; b=JEg1d0RHYZTGOQgELV04Wl45I/B+9bKvBnxQxGKdbqJD5uhhW6qYU5SfJIggynoTv+3tDBRwhK+6d788+rShre9l7IXSLRKcMimpysUO0LlpUctDrtuVV+216BnD5fo0F1wkwAC1GjzdgWtM4c4bN9kEKorzbMS46qgRLnETLbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721206884; c=relaxed/simple;
	bh=g4OxjF0Szmh1AP5musfl+ur8U0TD0awbb66j4iWEBw8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=m6vBNWRP1f05YB8jN9dvfh7nL9N4eUE2ZSkLg9jWKsxOcTiCUAGLuqughPnJ0FJ0hXhVrcvdYVicQmFwvUUXI1tV8gp+qXMhm3rsyR/9zzV9Rb3/aJxqUpuseHtI9qulxWt/Vu7WA8rAUbBv3Hr+HYUKt1GrLS54RgmOXYbYjXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-38acde528afso10113415ab.2
        for <linux-media@vger.kernel.org>; Wed, 17 Jul 2024 02:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721206881; x=1721811681;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ResNza9C/nxlVRUj+92Udy6etCN+wVLhQeDlYGKHQEA=;
        b=PUaX31ffmwMTBrztXgx1Dq6J/OGverL1Sf0D6Xsv0Q1PUjlhuuvBHZi1iRzaMv6WXt
         JzmNi/eR02zPmr8HiQkwzLtCKZXbBJRRCUz9kBF8lvEiHqQyUeTFEMB3HhtioVJdwAwn
         mybtHkibiYgyZPCWNPVWXabgXPXJKJuxSRLeNFqqn9sKAOXAyDU+snXOwpN4lVpum0xF
         qdMXYR6dQ6dHnzIVrlvzXUMFnkmaAmzSHyaOIxlu4u054C0kq5PDPCPAzzMojkd3CUcB
         hu9JUhzhgkS8VD8oKLxgCiIuBm3J0UZXzm6MItjZrBZN/pl7kZZN84NLzx8VZ4/fQFl6
         R/iA==
X-Forwarded-Encrypted: i=1; AJvYcCU9+wg8a+QSKlCQNOniXgr8Pq28bYTN557ivC8SzTnNk1qkrvt/sh5S6sMEpPonbquVUEgESH+8CH3A45j3nE3VbFvQkgymr+81fXI=
X-Gm-Message-State: AOJu0Yz3hCRravdVdwT4TpC7gDQlBHBR2JopmceS8ndxuPUo5JGgYb6g
	fB7+wLlsIV98+fGQWKTONC+jN64pDAtxbNizHgl8vgFuwz3jLlZ3yHVkrLCHb6Kqww0cOXqWI7x
	nj2nacIZgZRps4gZMAh/VZDT8Et5rW0lrDwv/hjP5JmjFjXn/s3ca2eg=
X-Google-Smtp-Source: AGHT+IGQ+ILjExV//2w3oud7t93GgNbOe541n3jRaCn9vRRg/AJ0dvg1/YjgWjIKxjaG7sQhvQDbvt2/6vRQ3ARwrjWAnNFOU3up
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c247:0:b0:381:a678:c55b with SMTP id
 e9e14a558f8ab-395526d9984mr1070185ab.0.1721206881596; Wed, 17 Jul 2024
 02:01:21 -0700 (PDT)
Date: Wed, 17 Jul 2024 02:01:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c34595061d6db440@google.com>
Subject: [syzbot] [media?] KASAN: vmalloc-out-of-bounds Write in
 tpg_fill_plane_buffer (3)
From: syzbot <syzbot+365005005522b70a36f2@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e091caf99f3a Merge tag 'arm-fixes-6.10-3' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1547d131980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b63b35269462a0e0
dashboard link: https://syzkaller.appspot.com/bug?extid=365005005522b70a36f2
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7fdef776dda5/disk-e091caf9.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/40515092c306/vmlinux-e091caf9.xz
kernel image: https://storage.googleapis.com/syzbot-assets/61ceae9ea0d8/bzImage-e091caf9.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+365005005522b70a36f2@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: vmalloc-out-of-bounds in tpg_fill_plane_buffer+0x1ad1/0x5af0 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2702
Write of size 1280 at addr ffffc90004e27b40 by task vivid-000-vid-c/30900

CPU: 1 PID: 30900 Comm: vivid-000-vid-c Not tainted 6.10.0-rc7-syzkaller-00231-ge091caf99f3a #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/07/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:114
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0x169/0x550 mm/kasan/report.c:488
 kasan_report+0x143/0x180 mm/kasan/report.c:601
 kasan_check_range+0x282/0x290 mm/kasan/generic.c:189
 __asan_memcpy+0x40/0x70 mm/kasan/shadow.c:106
 tpg_fill_plane_buffer+0x1ad1/0x5af0 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2702
 vivid_fillbuff drivers/media/test-drivers/vivid/vivid-kthread-cap.c:449 [inline]
 vivid_thread_vid_cap_tick+0x1c84/0x5bd0 drivers/media/test-drivers/vivid/vivid-kthread-cap.c:605
 vivid_thread_vid_cap+0x8aa/0xf30 drivers/media/test-drivers/vivid/vivid-kthread-cap.c:743
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

The buggy address belongs to the virtual mapping at
 [ffffc90004e25000, ffffc90004e29000) created by:
 vb2_vmalloc_alloc+0xf2/0x340 drivers/media/common/videobuf2/videobuf2-vmalloc.c:47

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x8 pfn:0x230e1
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000000 0000000000000000 dead000000000122 0000000000000000
raw: 0000000000000008 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x102dc2(GFP_HIGHUSER|__GFP_NOWARN|__GFP_ZERO), pid 30897, tgid 30893 (syz.0.5784), ts 1363420348526, free_ts 1363309065138
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f3/0x230 mm/page_alloc.c:1473
 prep_new_page mm/page_alloc.c:1481 [inline]
 get_page_from_freelist+0x2e4c/0x2f10 mm/page_alloc.c:3425
 __alloc_pages_noprof+0x256/0x6c0 mm/page_alloc.c:4683
 alloc_pages_mpol_noprof+0x3e8/0x680 mm/mempolicy.c:2265
 vm_area_alloc_pages mm/vmalloc.c:3583 [inline]
 __vmalloc_area_node mm/vmalloc.c:3659 [inline]
 __vmalloc_node_range_noprof+0x971/0x1460 mm/vmalloc.c:3840
 vmalloc_user_noprof+0x74/0x80 mm/vmalloc.c:3994
 vb2_vmalloc_alloc+0xf2/0x340 drivers/media/common/videobuf2/videobuf2-vmalloc.c:47
 __vb2_buf_mem_alloc drivers/media/common/videobuf2/videobuf2-core.c:243 [inline]
 __vb2_queue_alloc+0xa0f/0x16f0 drivers/media/common/videobuf2/videobuf2-core.c:510
 vb2_core_reqbufs+0xd2e/0x17c0 drivers/media/common/videobuf2/videobuf2-core.c:951
 __vb2_init_fileio+0x319/0xf90 drivers/media/common/videobuf2/videobuf2-core.c:2855
 vb2_core_poll+0x46c/0x7b0 drivers/media/common/videobuf2/videobuf2-core.c:2689
 vb2_poll drivers/media/common/videobuf2/videobuf2-v4l2.c:980 [inline]
 vb2_fop_poll+0x170/0x360 drivers/media/common/videobuf2/videobuf2-v4l2.c:1245
 v4l2_poll+0x143/0x2c0 drivers/media/v4l2-core/v4l2-dev.c:348
 vfs_poll include/linux/poll.h:84 [inline]
 do_select+0xec6/0x1900 fs/select.c:538
 core_sys_select+0x6f4/0x910 fs/select.c:681
 do_pselect fs/select.c:763 [inline]
 __do_sys_pselect6 fs/select.c:804 [inline]
 __se_sys_pselect6+0x319/0x3f0 fs/select.c:795
page last free pid 30896 tgid 30896 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1093 [inline]
 free_unref_folios+0xf23/0x19e0 mm/page_alloc.c:2637
 folios_put_refs+0x93a/0xa60 mm/swap.c:1024
 free_pages_and_swap_cache+0x2ea/0x690 mm/swap_state.c:329
 __tlb_batch_free_encoded_pages mm/mmu_gather.c:136 [inline]
 tlb_batch_pages_flush mm/mmu_gather.c:149 [inline]
 tlb_flush_mmu_free mm/mmu_gather.c:366 [inline]
 tlb_flush_mmu+0x3a3/0x680 mm/mmu_gather.c:373
 tlb_finish_mmu+0xd4/0x200 mm/mmu_gather.c:465
 exit_mmap+0x44f/0xc80 mm/mmap.c:3354
 __mmput+0x115/0x3c0 kernel/fork.c:1346
 exec_mmap+0x680/0x710 fs/exec.c:1063
 begin_new_exec+0x125f/0x1f50 fs/exec.c:1329
 load_elf_binary+0x974/0x2620 fs/binfmt_elf.c:996
 search_binary_handler fs/exec.c:1797 [inline]
 exec_binprm fs/exec.c:1839 [inline]
 bprm_execve+0xaf8/0x17c0 fs/exec.c:1891
 do_execveat_common+0x553/0x700 fs/exec.c:1998
 do_execve fs/exec.c:2072 [inline]
 __do_sys_execve fs/exec.c:2148 [inline]
 __se_sys_execve fs/exec.c:2143 [inline]
 __x64_sys_execve+0x92/0xb0 fs/exec.c:2143
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffffc90004e27f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc90004e27f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffc90004e28000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                   ^
 ffffc90004e28080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc90004e28100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
==================================================================


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

