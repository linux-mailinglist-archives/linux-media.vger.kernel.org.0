Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF0973F150F
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 10:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237234AbhHSIWB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 04:22:01 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:38713 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232653AbhHSIWA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 04:22:00 -0400
Received: by mail-io1-f71.google.com with SMTP id g5-20020a05660203c5b02905867ea91fc6so2876270iov.5
        for <linux-media@vger.kernel.org>; Thu, 19 Aug 2021 01:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=XFBRdhz0KHI7VfN0Q/Ng2rHDw0mHM2htKViTMlQZb7E=;
        b=p62UF67GXuIMGhmL4mSM5zAiKbyHhH1Sq1T3wDSfwv+QOdwZd6QiBQ+2PjfyBBELlg
         VJ0P/NttK5DQsLAbsDx/xkXeavNDYJxHNJvP/ADbFeA5J9+V9d9X1JeE6eKCNuSh75qf
         wJMwbfY1prv971Dvn08WCzUeNuJrC1sZd/krZ7jf/kyASg4UjksFzEGcch65MUvjoqoU
         oehGnV6aesV0gKHbeMs+S8XW/SbxIYslco8Jsc+sPi1v5Zl/c0YtQmYZnNvQp1Ma7mI8
         lhk6msbS4XPuPdP1wVGlKGn8gjIHQ1O+eoT5N1Zvwe35hT1Bxjg34u4j5sFCG3Raw+1p
         FlxA==
X-Gm-Message-State: AOAM530g1IuvbfSv6KEDxPBuVOeBFZEIb9v9KKGhXMaTZ5R/u6xEgqkX
        OLpMdhoQBYqfqdRLFm4HLXnf6LA5mjnJ36p/jFa2cFuX7eGA
X-Google-Smtp-Source: ABdhPJxSyt0gy86Vn7KLBJU4mk/gXZx7JD7qgiYgrOkQjEQImtua7Ue2j9y0izWRrJ+NhcZAsXUsZOn15kxAdLWNE/5u6HxLsJYy
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:5c8:: with SMTP id l8mr9177759ils.282.1629361283953;
 Thu, 19 Aug 2021 01:21:23 -0700 (PDT)
Date:   Thu, 19 Aug 2021 01:21:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008a7a1c05c9e53c87@google.com>
Subject: [syzbot] WARNING in drm_gem_shmem_vm_open
From:   syzbot <syzbot+91525b2bd4b5dff71619@syzkaller.appspotmail.com>
To:     airlied@linux.ie, christian.koenig@amd.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com,
        tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    614cb2751d31 Merge tag 'trace-v5.14-rc6' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1462cb61300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=96f0602203250753
dashboard link: https://syzkaller.appspot.com/bug?extid=91525b2bd4b5dff71619
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.1
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=122bce0e300000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+91525b2bd4b5dff71619@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 11697 at drivers/gpu/drm/drm_gem_shmem_helper.c:562 drm_gem_shmem_vm_open+0x96/0xb0 drivers/gpu/drm/drm_gem_shmem_helper.c:562
Modules linked in:
CPU: 0 PID: 11697 Comm: syz-executor.3 Not tainted 5.14.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:drm_gem_shmem_vm_open+0x96/0xb0 drivers/gpu/drm/drm_gem_shmem_helper.c:562
Code: 89 c6 e8 7d ec 23 fd 85 db 75 1a e8 34 e5 23 fd 48 89 ef 5b 5d 41 5c e9 e8 61 f5 ff e8 23 e5 23 fd 0f 0b eb ca e8 1a e5 23 fd <0f> 0b eb dd e8 b1 1f 6a fd eb 89 e8 aa 1f 6a fd eb a8 0f 1f 84 00
RSP: 0018:ffffc9000b3cfb90 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 00000000fffffffc RCX: 0000000000000000
RDX: ffff8880364eb880 RSI: ffffffff8451c3e6 RDI: 0000000000000003
RBP: ffff888033c70948 R08: 0000000000000000 R09: 0000000000000000
R10: ffffffff8451c3c3 R11: 0000000000000001 R12: ffff888146490800
R13: ffff888033c70a50 R14: 0000000020166000 R15: ffff888033c709d8
FS:  00007fbe43056700(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000005422b8 CR3: 0000000036274000 CR4: 0000000000350ef0
Call Trace:
 __split_vma+0x23c/0x550 mm/mmap.c:2764
 __do_munmap+0x32a/0x11c0 mm/mmap.c:2868
 do_munmap mm/mmap.c:2922 [inline]
 munmap_vma_range mm/mmap.c:604 [inline]
 mmap_region+0x85a/0x1760 mm/mmap.c:1753
 do_mmap+0x86e/0x1180 mm/mmap.c:1584
 vm_mmap_pgoff+0x1b7/0x290 mm/util.c:519
 ksys_mmap_pgoff+0x4a8/0x620 mm/mmap.c:1635
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x4665e9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fbe43056188 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
RAX: ffffffffffffffda RBX: 000000000056bf80 RCX: 00000000004665e9
RDX: 0000000000000000 RSI: 0000000000002000 RDI: 0000000020166000
RBP: 00000000004bfcc4 R08: 0000000000000004 R09: 0000000000000000
R10: 0000000000000013 R11: 0000000000000246 R12: 000000000056bf80
R13: 00007fffb615701f R14: 00007fbe43056300 R15: 0000000000022000
----------------
Code disassembly (best guess):
   0:	89 c6                	mov    %eax,%esi
   2:	e8 7d ec 23 fd       	callq  0xfd23ec84
   7:	85 db                	test   %ebx,%ebx
   9:	75 1a                	jne    0x25
   b:	e8 34 e5 23 fd       	callq  0xfd23e544
  10:	48 89 ef             	mov    %rbp,%rdi
  13:	5b                   	pop    %rbx
  14:	5d                   	pop    %rbp
  15:	41 5c                	pop    %r12
  17:	e9 e8 61 f5 ff       	jmpq   0xfff56204
  1c:	e8 23 e5 23 fd       	callq  0xfd23e544
  21:	0f 0b                	ud2    
  23:	eb ca                	jmp    0xffffffef
  25:	e8 1a e5 23 fd       	callq  0xfd23e544
  2a:	0f 0b                	ud2     <-- trapping instruction
  2c:	eb dd                	jmp    0xb
  2e:	e8 b1 1f 6a fd       	callq  0xfd6a1fe4
  33:	eb 89                	jmp    0xffffffbe
  35:	e8 aa 1f 6a fd       	callq  0xfd6a1fe4
  3a:	eb a8                	jmp    0xffffffe4
  3c:	0f                   	.byte 0xf
  3d:	1f                   	(bad)  
  3e:	84 00                	test   %al,(%rax)


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
