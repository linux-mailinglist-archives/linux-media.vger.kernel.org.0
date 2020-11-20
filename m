Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3B62BA31D
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 08:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgKTHZV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 02:25:21 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:50972 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgKTHZV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 02:25:21 -0500
Received: by mail-io1-f70.google.com with SMTP id l14so6758035ioj.17
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2020 23:25:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=ubesXB0aUyHJPLrB8z6KdL0G7KI6d8FKBulLcGvB/r0=;
        b=iqi0UDxSQwR1+pHQi94zwYaWeybloGwToVyRYeLzXP9t2IFluHP95Kco7sqviko5Pb
         ohD+p95UZV6LkrnPjvlnUyamj1r5UvLbP7ZKSU+fdMD9JLzV1JStyQvJanalWR2wnZ+g
         FfDARdBitHXflCMLC3eyBgQz2ATHLClubbwyMcpHBUPxaFSlz7AJ+/b15GTi6sX5pK5I
         cEcPG5gtr/XnTYXNdifTCpjSTGyiZo0rgbHYij1e8Sk3fsS55gzkWEQ9Y+J0Ool+L5hb
         H57X4h36VNt/T18yRF2skMg+JKkhj1FQNgxA8FGlJZCdVM+8y7jYdALT88rlF32qM/qb
         GMaw==
X-Gm-Message-State: AOAM530jGxDbC+7p9pqvJ2ESgeRZ6kaL1Ju9EzztDM3EULLdUAkwSSQI
        MSvmyuSN2ahgpbEuR2Agu32wPatz3rtP+cEjS0L2K3aWm7Jy
X-Google-Smtp-Source: ABdhPJyiwgDy7V3vzJXq/qp5ZkzXfbJ/gXopi3mE7A+08qp+6ZTJhBDJYYVUZMrBh+t9bBSnOxLJuzb689cebcyNJijqSebgRq7D
MIME-Version: 1.0
X-Received: by 2002:a02:b144:: with SMTP id s4mr11335405jah.32.1605857120055;
 Thu, 19 Nov 2020 23:25:20 -0800 (PST)
Date:   Thu, 19 Nov 2020 23:25:20 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003375a305b484bfc6@google.com>
Subject: general protection fault in drm_atomic_set_crtc_for_connector
From:   syzbot <syzbot+1aec08e752387f55c449@syzkaller.appspotmail.com>
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

HEAD commit:    03430750 Add linux-next specific files for 20201116
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=123c946a500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a1c4c3f27041fdb8
dashboard link: https://syzkaller.appspot.com/bug?extid=1aec08e752387f55c449
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15213981500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16590416500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1aec08e752387f55c449@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 PID: 8503 Comm: syz-executor619 Not tainted 5.10.0-rc3-next-20201116-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:drm_atomic_set_crtc_for_connector+0x426/0x5f0 drivers/gpu/drm/drm_atomic_uapi.c:342
Code: 00 00 fc ff df 48 89 fa 48 c1 ea 03 0f b6 04 02 84 c0 74 08 3c 03 0f 8e a6 00 00 00 48 b8 00 00 00 00 00 fc ff df 41 8b 4d 28 <80> 38 00 0f 85 83 01 00 00 48 8b 2c 25 00 00 00 00 48 b8 00 00 00
RSP: 0018:ffffc900018bf938 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffff8880116b0100 RCX: 0000000000000022
RDX: 1ffff11003019a66 RSI: ffffffff84302d10 RDI: ffff8880180cd330
RBP: 0000000000000000 R08: ffff888018051900 R09: ffff8880180cd343
R10: 0000000000000000 R11: 0000000000000000 R12: ffff88801a024800
R13: ffff8880180cd308 R14: ffff8880116b0108 R15: ffff88801cd1b700
FS:  0000000000000000(0000) GS:ffff8880b9f00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000006cf0a0 CR3: 000000000b08e000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 update_output_state drivers/gpu/drm/drm_atomic.c:1454 [inline]
 __drm_atomic_helper_set_config+0x72a/0xe80 drivers/gpu/drm/drm_atomic.c:1568
 drm_client_modeset_commit_atomic+0x527/0x7c0 drivers/gpu/drm/drm_client_modeset.c:1023
 drm_client_modeset_commit_locked+0x145/0x580 drivers/gpu/drm/drm_client_modeset.c:1145
 drm_client_modeset_commit+0x4d/0x80 drivers/gpu/drm/drm_client_modeset.c:1171
 __drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:252 [inline]
 __drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:231 [inline]
 drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:279 [inline]
 drm_fb_helper_lastclose drivers/gpu/drm/drm_fb_helper.c:1942 [inline]
 drm_fbdev_client_restore+0xe3/0x1a0 drivers/gpu/drm/drm_fb_helper.c:2334
 drm_client_dev_restore+0x17f/0x270 drivers/gpu/drm/drm_client.c:226
 drm_lastclose drivers/gpu/drm/drm_file.c:468 [inline]
 drm_release+0x441/0x530 drivers/gpu/drm/drm_file.c:499
 __fput+0x283/0x920 fs/file_table.c:280
 task_work_run+0xdd/0x190 kernel/task_work.c:140
 exit_task_work include/linux/task_work.h:30 [inline]
 do_exit+0xb9b/0x29f0 kernel/exit.c:823
 do_group_exit+0x125/0x310 kernel/exit.c:920
 __do_sys_exit_group kernel/exit.c:931 [inline]
 __se_sys_exit_group kernel/exit.c:929 [inline]
 __x64_sys_exit_group+0x3a/0x50 kernel/exit.c:929
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x443b18
Code: Unable to access opcode bytes at RIP 0x443aee.
RSP: 002b:00007fff6ec2d738 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 0000000000443b18
RDX: 0000000000000000 RSI: 000000000000003c RDI: 0000000000000000
RBP: 00000000004c34f0 R08: 00000000000000e7 R09: ffffffffffffffd0
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00000000006d5180 R14: 0000000000000000 R15: 0000000000000000
Modules linked in:
---[ end trace f24317b9689e8a7a ]---
RIP: 0010:drm_atomic_set_crtc_for_connector+0x426/0x5f0 drivers/gpu/drm/drm_atomic_uapi.c:342
Code: 00 00 fc ff df 48 89 fa 48 c1 ea 03 0f b6 04 02 84 c0 74 08 3c 03 0f 8e a6 00 00 00 48 b8 00 00 00 00 00 fc ff df 41 8b 4d 28 <80> 38 00 0f 85 83 01 00 00 48 8b 2c 25 00 00 00 00 48 b8 00 00 00
RSP: 0018:ffffc900018bf938 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffff8880116b0100 RCX: 0000000000000022
RDX: 1ffff11003019a66 RSI: ffffffff84302d10 RDI: ffff8880180cd330
RBP: 0000000000000000 R08: ffff888018051900 R09: ffff8880180cd343
R10: 0000000000000000 R11: 0000000000000000 R12: ffff88801a024800
R13: ffff8880180cd308 R14: ffff8880116b0108 R15: ffff88801cd1b700
FS:  0000000000000000(0000) GS:ffff8880b9f00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055ee32e491f8 CR3: 0000000018634000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
