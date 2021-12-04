Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0A34683D7
	for <lists+linux-media@lfdr.de>; Sat,  4 Dec 2021 10:53:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384636AbhLDJ47 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Dec 2021 04:56:59 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:48866 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384589AbhLDJ4n (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Dec 2021 04:56:43 -0500
Received: by mail-io1-f72.google.com with SMTP id g23-20020a6be617000000b005e245747fb4so4395395ioh.15
        for <linux-media@vger.kernel.org>; Sat, 04 Dec 2021 01:53:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=+ZEiCoXN9kp+MB7qxB8Hm1UnXfwUDLZKCohv2sUbWU0=;
        b=GYuSb7IwtYrff2djoyF45vDKPDmQyupFrpfp5U6oAi+r9bqeYQeRYqWvrnIntwNCg1
         NxrqJuIqQ4z8jZyRM9ABKKUZCPQFjQXpgV1kbcPazaaegRJ7kJ73XCt6qTNeIxzADWSn
         GgvIng8S/rINC6U84koWj33mzDjFXm41X4h+mZSUJPDO0J5hwRUD6Oyi08N/oDA25fyM
         S2pUjC922gbQ1B+eztjGAr1tScVylqcmI9JLq2pOdob56+ZSfk+U/Lb/pk5wbF00M8lQ
         L9dJg7vg7mv7b37xzvSFL+mQENsgsbxq9YRmAqb/9KFia2C9FarsIhHPhgXZWCIvvy2/
         Frkg==
X-Gm-Message-State: AOAM530Z3qLRLd75EffneyjEUBsfnA3uCcQdJ1PgPc06ckerbhhxlGDn
        CW2zVtJksQoalbsoNDEFgWyK9cV7PY60oWR2fhFMzEovGct1
X-Google-Smtp-Source: ABdhPJzEd2e7e4zNqcnL2tv/hzfgl4Cx7UylWAbUbbsW8mwbyeQxBudhwv2vQuxlzkAR9b0TPPOmX0T40i6bFJKB9UGF+EuAc5f5
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16c9:: with SMTP id 9mr21200308ilx.221.1638611597863;
 Sat, 04 Dec 2021 01:53:17 -0800 (PST)
Date:   Sat, 04 Dec 2021 01:53:17 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000372da005d24efed8@google.com>
Subject: [syzbot] general protection fault in virtio_gpu_array_put_free
From:   syzbot <syzbot+e9072e90624a31dfa85f@syzkaller.appspotmail.com>
To:     airlied@linux.ie, christian.koenig@amd.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, kraxel@redhat.com,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, sumit.semwal@linaro.org,
        syzkaller-bugs@googlegroups.com,
        virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    d58071a8a76d Linux 5.16-rc3
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11f773f6b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=171728a464c05f2b
dashboard link: https://syzkaller.appspot.com/bug?extid=e9072e90624a31dfa85f
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e9072e90624a31dfa85f@syzkaller.appspotmail.com

 </TASK>
general protection fault, probably for non-canonical address 0xdffffc000000000e: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000070-0x0000000000000077]
CPU: 0 PID: 20114 Comm: syz-executor.3 Not tainted 5.16.0-rc3-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
RIP: 0010:virtio_gpu_array_put_free+0x2f/0x190 drivers/gpu/drm/virtio/virtgpu_gem.c:251
Code: 55 49 89 fd 41 54 55 53 48 83 ec 08 e8 5a dd 09 fd 49 8d 45 70 48 89 c2 48 89 04 24 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e 21 01 00 00 41 8b 5d 70 31 ff
RSP: 0018:ffffc90005a9fa90 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffc900262ce000
RDX: 000000000000000e RSI: ffffffff846cf6e6 RDI: 0000000000000000
RBP: ffff88801882b800 R08: 0000000000000000 R09: ffffc90005a9f9ef
R10: ffffffff846dcc29 R11: 0000000000000000 R12: ffffc90005a9fbd0
R13: 0000000000000000 R14: ffff888045f60000 R15: 00000000fffffff4
FS:  00007f4ad9393700(0000) GS:ffff88802ca00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f561e680558 CR3: 0000000050bde000 CR4: 0000000000150ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000600
Call Trace:
 <TASK>
 virtio_gpu_object_create+0x5c7/0xd90 drivers/gpu/drm/virtio/virtgpu_object.c:251
 virtio_gpu_gem_create drivers/gpu/drm/virtio/virtgpu_gem.c:42 [inline]
 virtio_gpu_mode_dumb_create+0x319/0x5c0 drivers/gpu/drm/virtio/virtgpu_gem.c:90
 drm_mode_create_dumb+0x26c/0x2f0 drivers/gpu/drm/drm_dumb_buffers.c:96
 drm_ioctl_kernel+0x27d/0x4e0 drivers/gpu/drm/drm_ioctl.c:782
 drm_ioctl+0x51e/0x9d0 drivers/gpu/drm/drm_ioctl.c:885
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl fs/ioctl.c:860 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f4adbe1dae9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f4ad9393188 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f4adbf30f60 RCX: 00007f4adbe1dae9
RDX: 0000000020000040 RSI: 00000000c02064b2 RDI: 0000000000000003
RBP: 00007f4ad93931d0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007ffccb96db4f R14: 00007f4ad9393300 R15: 0000000000022000
 </TASK>
Modules linked in:
---[ end trace 8191b5e5ff4f69ef ]---
RIP: 0010:virtio_gpu_array_put_free+0x2f/0x190 drivers/gpu/drm/virtio/virtgpu_gem.c:251
Code: 55 49 89 fd 41 54 55 53 48 83 ec 08 e8 5a dd 09 fd 49 8d 45 70 48 89 c2 48 89 04 24 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e 21 01 00 00 41 8b 5d 70 31 ff
RSP: 0018:ffffc90005a9fa90 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffc900262ce000
RDX: 000000000000000e RSI: ffffffff846cf6e6 RDI: 0000000000000000
RBP: ffff88801882b800 R08: 0000000000000000 R09: ffffc90005a9f9ef
R10: ffffffff846dcc29 R11: 0000000000000000 R12: ffffc90005a9fbd0
R13: 0000000000000000 R14: ffff888045f60000 R15: 00000000fffffff4
FS:  00007f4ad9393700(0000) GS:ffff88802cb00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000065f4d7 CR3: 0000000050bde000 CR4: 0000000000150ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	55                   	push   %rbp
   1:	49 89 fd             	mov    %rdi,%r13
   4:	41 54                	push   %r12
   6:	55                   	push   %rbp
   7:	53                   	push   %rbx
   8:	48 83 ec 08          	sub    $0x8,%rsp
   c:	e8 5a dd 09 fd       	callq  0xfd09dd6b
  11:	49 8d 45 70          	lea    0x70(%r13),%rax
  15:	48 89 c2             	mov    %rax,%rdx
  18:	48 89 04 24          	mov    %rax,(%rsp)
  1c:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  23:	fc ff df
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax <-- trapping instruction
  2e:	84 c0                	test   %al,%al
  30:	74 08                	je     0x3a
  32:	3c 03                	cmp    $0x3,%al
  34:	0f 8e 21 01 00 00    	jle    0x15b
  3a:	41 8b 5d 70          	mov    0x70(%r13),%ebx
  3e:	31 ff                	xor    %edi,%edi


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
