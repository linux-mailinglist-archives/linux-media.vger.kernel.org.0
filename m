Return-Path: <linux-media+bounces-48343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88740CA9D79
	for <lists+linux-media@lfdr.de>; Sat, 06 Dec 2025 02:23:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D324630463A1
	for <lists+linux-media@lfdr.de>; Sat,  6 Dec 2025 01:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1058274BE1;
	Sat,  6 Dec 2025 01:19:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com [209.85.161.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104131EA7CC
	for <linux-media@vger.kernel.org>; Sat,  6 Dec 2025 01:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764983969; cv=none; b=e9alGWdRjjZ4qeh+enA49adO8XXeirRA+BEagB8mn73NQYWDCmd6C6BgbImzTvJpptKpPsdLP0l9FPOxKiuNy+KPd6yM2WOsZVzZXRs1LMbGKOD/FfRVVEvxP5dPqkX0M56tqvDyHITmAI92Qw4axdnN4t6KijaA9uRoLOcT3tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764983969; c=relaxed/simple;
	bh=DxTa8UKIVjRkjmLDcd3huCRnhUNnF9PY7u//r3LuyjM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=O5kii88Dbo1EIeZ9enUNcaD9rp0KowAtHMDtlwWse6umeavXhKcsj8syh3tp+HFIsGvlAEFbZc1YwGp+dzXgAlvvnO6RQMqvPv7x8BvU+vWeOgI5yJHtccNSW0TppG85GMc1zcCMFoZ1yvueU6k3FezDTY87NWFRJb5s/JDWzdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f80.google.com with SMTP id 006d021491bc7-656bc3a7ab3so3564262eaf.2
        for <linux-media@vger.kernel.org>; Fri, 05 Dec 2025 17:19:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764983967; x=1765588767;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iamnrkElp7j3TjhockSVR4ojhUOK2ChBJfnCvlBuTjI=;
        b=UfRIHQNXUJElcmuZMUO+wBHHJY7TrqE63vSmJMHmEWb1oQkBlmR3MGJP1HulkV/1ZU
         ImKIRjj0gvKLrrD4fl4FT8mBEphViQBXMS+0HzOmLOmH5wA5MdItRL8q97xjid1HfDci
         jxm0hyqK/EFnl4zwkNA078gNSrGbKzJBCFCMSrIvyDQn3NCmxczMp7A42nGieufNYJsV
         1UDzAbd+WUapooixl0rLVEOv8WqsU5O2Uq9/y+WnIc0muDDdz8Y5OhsiISiuSTtMoUxj
         mKHmDZZavi+43Gm4QDz4CgooHufHN53ulOrlfN6/BkacW3ug2BwuN/HEWi87LLbdmHPC
         Mi7w==
X-Forwarded-Encrypted: i=1; AJvYcCUEAs9tenzyoffRL2Q/jdSFdFGDCynNiWyVZlrOi6JTEnMS8NwbhXqYasNVB26A2VRH1uU7LtB8nJMG0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUTxtQ3A1T54pioe4np0qRBmHwZLim837Ne8TbUF/ptFrU6j0P
	oeVA3z1rtReXTvd3potqEshPG+/a3LuvGHEfA6IOpF9spqP5pQGXhGyzoA6cvSKPh9AXCh2Xj4D
	UefOoUV7JCDdaJ+fFdlhPrd/Dz3OZD7IXWCH0nHiMCNYIQiFnmzJrh/fflh4=
X-Google-Smtp-Source: AGHT+IFTXBAiajNCFxz6p22lgnqCsewrHy8l5CrMbwVzmSF0kEp1CYnit5k/Ep3FZ7GrUryFn1zjUnrbHOfW4JgI/VmPkCkDcaZq
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f03:b0:659:9a49:8fcd with SMTP id
 006d021491bc7-6599a9774f2mr508232eaf.70.1764983967246; Fri, 05 Dec 2025
 17:19:27 -0800 (PST)
Date: Fri, 05 Dec 2025 17:19:27 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6933849f.a70a0220.243dc6.0026.GAE@google.com>
Subject: [syzbot] [media?] [dri?] WARNING in dma_buf_vmap
From: syzbot <syzbot+4317d7108e14e5d56308@syzkaller.appspotmail.com>
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    1d18101a644e Merge tag 'kernel-6.19-rc1.cred' of git://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13fba192580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a1db0fea040c2a9f
dashboard link: https://syzkaller.appspot.com/bug?extid=4317d7108e14e5d56308
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1055e2b4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16ddf484580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-1d18101a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/98f78b52cccd/vmlinux-1d18101a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7a8898061bfb/bzImage-1d18101a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4317d7108e14e5d56308@syzkaller.appspotmail.com

Total swap = 124996kB
393083 pages RAM
0 pages HighMem/MovableOnly
184478 pages reserved
0 pages cma reserved
------------[ cut here ]------------
WARNING: CPU: 0 PID: 5488 at drivers/dma-buf/dma-buf.c:1536 dma_buf_vmap+0x306/0x3b0 drivers/dma-buf/dma-buf.c:1536
Modules linked in:
CPU: 0 UID: 0 PID: 5488 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:dma_buf_vmap+0x306/0x3b0 drivers/dma-buf/dma-buf.c:1536
Code: 64 05 cc e8 0c 99 d7 fb 90 0f 0b 90 b8 ea ff ff ff eb bc e8 fc 98 d7 fb 90 0f 0b 90 e9 0d fe ff ff e8 ee 98 d7 fb 44 89 f0 90 <0f> 0b 90 49 bd 00 00 00 00 00 fc ff df eb 91 e8 c6 9c 61 05 48 c7
RSP: 0018:ffffc90002bbf3a0 EFLAGS: 00010293
RAX: 00000000fffffff4 RBX: ffff888000e02428 RCX: ffff888000eb4900
RDX: 0000000000000000 RSI: 00000000fffffff4 RDI: 0000000000000000
RBP: ffffc90002bbf450 R08: ffffc90002bbf227 R09: 1ffff92000577e44
R10: dffffc0000000000 R11: fffff52000577e45 R12: ffffffff85ea4500
R13: ffff888000e02430 R14: 00000000fffffff4 R15: 1ffff110001c0485
FS:  0000555591ecc500(0000) GS:ffff88808d722000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055859af10a08 CR3: 00000000589bb000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 drm_gem_shmem_vmap_locked+0x14c/0x790 drivers/gpu/drm/drm_gem_shmem_helper.c:354
 drm_gem_vmap_locked drivers/gpu/drm/drm_gem.c:1279 [inline]
 drm_gem_vmap+0x10a/0x1d0 drivers/gpu/drm/drm_gem.c:1321
 drm_gem_fb_vmap+0xaa/0x8d0 drivers/gpu/drm/drm_gem_framebuffer_helper.c:368
 drm_atomic_helper_prepare_planes+0x2d6/0xb60 drivers/gpu/drm/drm_atomic_helper.c:2760
 drm_atomic_helper_commit+0x19a/0xb10 drivers/gpu/drm/drm_atomic_helper.c:2189
 drm_atomic_commit+0x262/0x2c0 drivers/gpu/drm/drm_atomic.c:1577
 drm_atomic_helper_update_plane+0x248/0x3b0 drivers/gpu/drm/drm_atomic_helper.c:3348
 drm_mode_cursor_universal drivers/gpu/drm/drm_plane.c:1256 [inline]
 drm_mode_cursor_common+0xb7e/0x12d0 drivers/gpu/drm/drm_plane.c:1315
 drm_mode_cursor_ioctl+0xbf/0x110 drivers/gpu/drm/drm_plane.c:1365
 drm_ioctl_kernel+0x2cf/0x390 drivers/gpu/drm/drm_ioctl.c:797
 drm_ioctl+0x67f/0xb10 drivers/gpu/drm/drm_ioctl.c:894
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcd9898f7c9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe37777948 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fcd98be5fa0 RCX: 00007fcd9898f7c9
RDX: 0000200000000280 RSI: 00000000c01c64a3 RDI: 0000000000000003
RBP: 00007ffe377779a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007fcd98be5fa0 R14: 00007fcd98be5fa0 R15: 0000000000000003
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

