Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C97B614CDEC
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 17:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbgA2QGP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 11:06:15 -0500
Received: from mail-il1-f200.google.com ([209.85.166.200]:33687 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbgA2QGP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 11:06:15 -0500
Received: by mail-il1-f200.google.com with SMTP id s9so194632ilk.0
        for <linux-media@vger.kernel.org>; Wed, 29 Jan 2020 08:06:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=fEUlUjM8SEojeOk6pwtcSTQDu8D7nALBWF21TUkUjFQ=;
        b=t4nokeCol+qUACrEuABExBH46O0OmRqKt8VxkiKXjQZ4DYROuEUmvk+WA6h/tuCYmM
         FY2HP8AC2ZCjwtKDIJS8HmXv3b4JWO6ixegPztO/U/EcHbsuLU0h4oVJQHmK2C5H82Zb
         MR+z0SJIqK69QJCZZrrqUyi9IwOhXfK9DGOA5rJFHLzknt8EYELaz7jWFnOiTZOl/3Kd
         n1CaZ4UpDvjn1iUODYzJlRPN/vWZVujfgC5YvsgFDssm16nYMgbDlSrmiRbQPIs/oaNn
         P9BZ/kfvL1CbBO1ZcNBUAAhPFECeVBq6ijyK5Uh1cNhXC+nJvOwj/oCyWHrtMhGsURGe
         TfYw==
X-Gm-Message-State: APjAAAXHvQtrBbMrBq1ABz4Jnni/bSf5LCHPD3ThdATnFn50BH2KsgRH
        SHpvTRHo0/Ci1nDt2Ak2/1/V0sR2ptlq1NEfeZ8Ea+9m+jJd
X-Google-Smtp-Source: APXvYqxRd2se19n9AMGBF0tsd+V/QMOOXynWF3G0Gosz8cItmjCbMWlTR4gOeDt0e9z2keIjwUnyAv5NoJ294QR5X7nnb81NTilm
MIME-Version: 1.0
X-Received: by 2002:a92:914a:: with SMTP id t71mr26674745ild.293.1580313974646;
 Wed, 29 Jan 2020 08:06:14 -0800 (PST)
Date:   Wed, 29 Jan 2020 08:06:14 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000017ad0d059d498531@google.com>
Subject: memory leak in snd_pcm_hw_params
From:   syzbot <syzbot+30edd0f34bfcdc548ac4@syzkaller.appspotmail.com>
To:     alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, perex@perex.cz,
        sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com,
        tglx@linutronix.de, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    b3a60822 Merge branch 'for-v5.6' of git://git.kernel.org:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1351cf66e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e97a1bc78afb77f
dashboard link: https://syzkaller.appspot.com/bug?extid=30edd0f34bfcdc548ac4
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14e97735e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13cd9bc9e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+30edd0f34bfcdc548ac4@syzkaller.appspotmail.com

executing program
executing program
executing program
BUG: memory leak
unreferenced object 0xffff888108fdefc0 (size 64):
  comm "syz-executor222", pid 7310, jiffies 4294946025 (age 13.660s)
  hex dump (first 32 bytes):
    07 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 10 33 02 00 c9 ff ff 00 00 00 00 00 00 00 00  ..3.............
  backtrace:
    [<00000000c59c6b0c>] kmemleak_alloc_recursive include/linux/kmemleak.h:43 [inline]
    [<00000000c59c6b0c>] slab_post_alloc_hook mm/slab.h:586 [inline]
    [<00000000c59c6b0c>] slab_alloc mm/slab.c:3320 [inline]
    [<00000000c59c6b0c>] kmem_cache_alloc_trace+0x145/0x2c0 mm/slab.c:3549
    [<00000000478172ce>] kmalloc include/linux/slab.h:556 [inline]
    [<00000000478172ce>] kzalloc include/linux/slab.h:670 [inline]
    [<00000000478172ce>] snd_pcm_lib_malloc_pages+0x12b/0x200 sound/core/pcm_memory.c:404
    [<0000000091532e16>] snd_pcm_hw_params+0x720/0x830 sound/core/pcm_native.c:691
    [<000000002070a986>] snd_pcm_kernel_ioctl+0xb5/0x170 sound/core/pcm_native.c:3238
    [<00000000394e99f4>] snd_pcm_oss_change_params_locked+0x745/0x1140 sound/core/oss/pcm_oss.c:944
    [<00000000c81f42ac>] snd_pcm_oss_change_params+0x43/0x80 sound/core/oss/pcm_oss.c:1087
    [<000000007710a1c0>] snd_pcm_oss_make_ready+0x55/0xc0 sound/core/oss/pcm_oss.c:1146
    [<0000000069305204>] snd_pcm_oss_sync.isra.0+0xb8/0x310 sound/core/oss/pcm_oss.c:1707
    [<00000000692460c8>] snd_pcm_oss_release+0xef/0x100 sound/core/oss/pcm_oss.c:2545
    [<0000000013ba02c9>] __fput+0xed/0x300 fs/file_table.c:280
    [<0000000080810f18>] ____fput+0x16/0x20 fs/file_table.c:313
    [<00000000e6bb3aa6>] task_work_run+0x9d/0xc0 kernel/task_work.c:113
    [<00000000b6ce71eb>] exit_task_work include/linux/task_work.h:22 [inline]
    [<00000000b6ce71eb>] do_exit+0x3fa/0xe20 kernel/exit.c:801
    [<0000000045ce7ad3>] do_group_exit+0x4b/0xe0 kernel/exit.c:899
    [<00000000aeb85903>] __do_sys_exit_group kernel/exit.c:910 [inline]
    [<00000000aeb85903>] __se_sys_exit_group kernel/exit.c:908 [inline]
    [<00000000aeb85903>] __x64_sys_exit_group+0x1c/0x20 kernel/exit.c:908
    [<000000008b12db16>] do_syscall_64+0x73/0x220 arch/x86/entry/common.c:294



---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
