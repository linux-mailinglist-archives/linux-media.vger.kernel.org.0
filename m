Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C86E14FB6E
	for <lists+linux-media@lfdr.de>; Sun,  2 Feb 2020 05:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbgBBEiO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Feb 2020 23:38:14 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:43640 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbgBBEiO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Feb 2020 23:38:14 -0500
Received: by mail-il1-f198.google.com with SMTP id o13so9046030ilf.10
        for <linux-media@vger.kernel.org>; Sat, 01 Feb 2020 20:38:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=TO+L6PnnX17CP2SrSKDyRnha9VgVZYQpwtZxLutEP78=;
        b=QtuxxiI2P/+xizRwogvTyywJjycE7IeZzTTg/ZkgxvP81nEhKZGC0liSvqfB1xJ3bn
         pGu0apX4GuAh8sz8q3ZaUQtlmK1S7+iEFXhd5ab1EqA5FKY9pc78a7vP3sYx4ofhq9NK
         VPGgYeKXeVKsfiJup7L4vVHl43eqHdhgZ2Cdi7PLmB39ojqtGxklmkihqwviVogX90hz
         ExBlRO/0bWLR63ZnYehYiPftfaUxuthDwhAQXTohdz8JNO0xkbKzH/XYQWawFGoRKB9x
         6UNe+petBdHONO68of1vnZTKjwBNE0AaUe4wHfbu9Ds4YE1I6Vgn7xNm50ETcSisdoAV
         s0SQ==
X-Gm-Message-State: APjAAAUunUESbx/eMscfWBBEz4Tfb7pu1LlTwbWBvybdcAZlxUNMLVyB
        i+6sRF0PscoaE9A3+Kr3jx5IKSvjlpo4FXCndyg4/mUV7NDn
X-Google-Smtp-Source: APXvYqy1ewjPeYgWBLFL45OlL8grBeAp+UAjGeDMCOCtd6Xd+blyz7xZELfl2RsmNnfLnYrBsbt+Okn9Lm9cYNoibg3/Cgh3m6on
MIME-Version: 1.0
X-Received: by 2002:a92:9c1c:: with SMTP id h28mr9351654ili.189.1580618292143;
 Sat, 01 Feb 2020 20:38:12 -0800 (PST)
Date:   Sat, 01 Feb 2020 20:38:12 -0800
In-Reply-To: <000000000000ae2f81059d7716b8@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d42f3e059d905fe3@google.com>
Subject: Re: KASAN: use-after-free Read in vgem_gem_dumb_create
From:   syzbot <syzbot+0dc4444774d419e916c8@syzkaller.appspotmail.com>
To:     airlied@linux.ie, alexander.deucher@amd.com,
        amd-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk,
        christian.koenig@amd.com, dan.carpenter@oracle.com,
        daniel@ffwll.ch, davem@davemloft.net,
        dri-devel@lists.freedesktop.org, emil.velikov@collabora.com,
        eric@anholt.net, hdanton@sina.com,
        linaro-mm-sig-owner@lists.linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        robdclark@chromium.org, seanpaul@chromium.org,
        sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has found a reproducer for the following crash on:

HEAD commit:    94f2630b Merge tag '5.6-rc-small-smb3-fix-for-stable' of g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11d6c776e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=99db4e42d047be3
dashboard link: https://syzkaller.appspot.com/bug?extid=0dc4444774d419e916c8
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=152385bee00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=123210a1e00000

The bug was bisected to:

commit 7611750784664db46d0db95631e322aeb263dde7
Author: Alex Deucher <alexander.deucher@amd.com>
Date:   Wed Jun 21 16:31:41 2017 +0000

    drm/amdgpu: use kernel is_power_of_2 rather than local version

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11628df1e00000
final crash:    https://syzkaller.appspot.com/x/report.txt?x=13628df1e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=15628df1e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+0dc4444774d419e916c8@syzkaller.appspotmail.com
Fixes: 761175078466 ("drm/amdgpu: use kernel is_power_of_2 rather than local version")

==================================================================
BUG: KASAN: use-after-free in vgem_gem_dumb_create+0x238/0x250 drivers/gpu/drm/vgem/vgem_drv.c:221
Read of size 8 at addr ffff88809a2ee908 by task syz-executor815/10244

CPU: 1 PID: 10244 Comm: syz-executor815 Not tainted 5.5.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x197/0x210 lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd4/0x30b mm/kasan/report.c:374
 __kasan_report.cold+0x1b/0x32 mm/kasan/report.c:506
 kasan_report+0x12/0x20 mm/kasan/common.c:641
 __asan_report_load8_noabort+0x14/0x20 mm/kasan/generic_report.c:135
 vgem_gem_dumb_create+0x238/0x250 drivers/gpu/drm/vgem/vgem_drv.c:221
 drm_mode_create_dumb+0x282/0x310 drivers/gpu/drm/drm_dumb_buffers.c:94
 drm_mode_create_dumb_ioctl+0x26/0x30 drivers/gpu/drm/drm_dumb_buffers.c:100
 drm_ioctl_kernel+0x244/0x300 drivers/gpu/drm/drm_ioctl.c:786
 drm_ioctl+0x54e/0xa60 drivers/gpu/drm/drm_ioctl.c:886
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x123/0x180 fs/ioctl.c:747
 __do_sys_ioctl fs/ioctl.c:756 [inline]
 __se_sys_ioctl fs/ioctl.c:754 [inline]
 __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
 do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x44c3e9
Code: e8 8c e7 ff ff 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 1b cc fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f40263e9db8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000006ddc58 RCX: 000000000044c3e9
RDX: 0000000020000000 RSI: 00000000c02064b2 RDI: 0000000000000004
RBP: 00000000006ddc50 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000006ddc5c
R13: 00007ffed0d4362f R14: 00007f40263ea9c0 R15: 00000000006ddc5c

Allocated by task 10244:
 save_stack+0x23/0x90 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 __kasan_kmalloc mm/kasan/common.c:515 [inline]
 __kasan_kmalloc.constprop.0+0xcf/0xe0 mm/kasan/common.c:488
 kasan_kmalloc+0x9/0x10 mm/kasan/common.c:529
 kmem_cache_alloc_trace+0x158/0x790 mm/slab.c:3551
 kmalloc include/linux/slab.h:556 [inline]
 kzalloc include/linux/slab.h:670 [inline]
 __vgem_gem_create+0x49/0x100 drivers/gpu/drm/vgem/vgem_drv.c:165
 vgem_gem_create drivers/gpu/drm/vgem/vgem_drv.c:194 [inline]
 vgem_gem_dumb_create+0xd7/0x250 drivers/gpu/drm/vgem/vgem_drv.c:217
 drm_mode_create_dumb+0x282/0x310 drivers/gpu/drm/drm_dumb_buffers.c:94
 drm_mode_create_dumb_ioctl+0x26/0x30 drivers/gpu/drm/drm_dumb_buffers.c:100
 drm_ioctl_kernel+0x244/0x300 drivers/gpu/drm/drm_ioctl.c:786
 drm_ioctl+0x54e/0xa60 drivers/gpu/drm/drm_ioctl.c:886
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x123/0x180 fs/ioctl.c:747
 __do_sys_ioctl fs/ioctl.c:756 [inline]
 __se_sys_ioctl fs/ioctl.c:754 [inline]
 __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
 do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 10244:
 save_stack+0x23/0x90 mm/kasan/common.c:72
 set_track mm/kasan/common.c:80 [inline]
 kasan_set_free_info mm/kasan/common.c:337 [inline]
 __kasan_slab_free+0x102/0x150 mm/kasan/common.c:476
 kasan_slab_free+0xe/0x10 mm/kasan/common.c:485
 __cache_free mm/slab.c:3426 [inline]
 kfree+0x10a/0x2c0 mm/slab.c:3757
 vgem_gem_free_object+0xbe/0xe0 drivers/gpu/drm/vgem/vgem_drv.c:68
 drm_gem_object_free+0x100/0x220 drivers/gpu/drm/drm_gem.c:983
 kref_put include/linux/kref.h:65 [inline]
 drm_gem_object_put_unlocked drivers/gpu/drm/drm_gem.c:1017 [inline]
 drm_gem_object_put_unlocked+0x196/0x1c0 drivers/gpu/drm/drm_gem.c:1002
 vgem_gem_create drivers/gpu/drm/vgem/vgem_drv.c:199 [inline]
 vgem_gem_dumb_create+0x115/0x250 drivers/gpu/drm/vgem/vgem_drv.c:217
 drm_mode_create_dumb+0x282/0x310 drivers/gpu/drm/drm_dumb_buffers.c:94
 drm_mode_create_dumb_ioctl+0x26/0x30 drivers/gpu/drm/drm_dumb_buffers.c:100
 drm_ioctl_kernel+0x244/0x300 drivers/gpu/drm/drm_ioctl.c:786
 drm_ioctl+0x54e/0xa60 drivers/gpu/drm/drm_ioctl.c:886
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x123/0x180 fs/ioctl.c:747
 __do_sys_ioctl fs/ioctl.c:756 [inline]
 __se_sys_ioctl fs/ioctl.c:754 [inline]
 __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
 do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
 entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff88809a2ee800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 264 bytes inside of
 1024-byte region [ffff88809a2ee800, ffff88809a2eec00)
The buggy address belongs to the page:
page:ffffea000268bb80 refcount:1 mapcount:0 mapping:ffff8880aa400c40 index:0x0
flags: 0xfffe0000000200(slab)
raw: 00fffe0000000200 ffffea0002816448 ffffea0002551bc8 ffff8880aa400c40
raw: 0000000000000000 ffff88809a2ee000 0000000100000002 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff88809a2ee800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88809a2ee880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88809a2ee900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                      ^
 ffff88809a2ee980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88809a2eea00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

