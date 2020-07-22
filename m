Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1FF222901C
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 07:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbgGVFxU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 01:53:20 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:40155 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727993AbgGVFxU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 01:53:20 -0400
Received: by mail-io1-f70.google.com with SMTP id f25so1128343ioh.7
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 22:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=9IgRu2uMesy4c9c+gNLBJYsfcIEEN+7tndJeF0Yh/Zg=;
        b=eyqTf/xmy3zBRlSZ06H2egX0NQ5MHr3ikjJDu+QdkMi90aCmdqAdK6pSVz0tVdZcbC
         6uwqE8Ut6aVHXu/gqJkXROl30Njqs3wxLPseRPgEoqgm+UOC7Yrgl2CSrokQCLQJrZsx
         QStBPUS3oV74l/2xQNkdmMNim3OkmL8sAWncHbNWiUSmSc0lGXcHT+bC0hDOxOrQuBcA
         W9RdNiKl4WYCnS0N+w5Yx7G998yBe8OReak7/4LErcyqJiqXxxzy4MaZ169qRl3Ur7yI
         i55eFDH+WuYRpug9hH4OUVQg+nWB4nMrA7uNP/5JM4TXlZGPay+zeWgEsGwe9PphzvG6
         DK3A==
X-Gm-Message-State: AOAM533GJJTPd6NKKH6/P7bMsenhMyBcLGWs+KYN90b9IAKDLHEucQEz
        fAgkgmdSibWASR3zbCVdb+ux2ofQZFTX5iQYXxqICDy8SrQn
X-Google-Smtp-Source: ABdhPJx4ETI+hJ9B7DaNY0pHG6EuDb/SP4iQAglQKZ41CgdONAdLTa4V/NlhyPKE6bCDgRmyUE6PaBJXgMuva1uC/npo5rNPbGz+
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:4ca:: with SMTP id f10mr31722621ils.291.1595397199398;
 Tue, 21 Jul 2020 22:53:19 -0700 (PDT)
Date:   Tue, 21 Jul 2020 22:53:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000588d8b05ab015bed@google.com>
Subject: KMSAN: uninit-value in video_usercopy
From:   syzbot <syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com>
To:     arnd@arndb.de, bnvandana@gmail.com, glider@google.com,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, niklas.soderlund+renesas@ragnatech.se,
        sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    14525656 compiler.h: reinstate missing KMSAN_INIT
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=15be8380900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c534a9fad6323722
dashboard link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17eb93d0900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=116da33b100000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in kmsan_check_memory+0xd/0x10 mm/kmsan/kmsan_hooks.c:428
CPU: 0 PID: 8471 Comm: syz-executor794 Not tainted 5.8.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1df/0x240 lib/dump_stack.c:118
 kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:121
 kmsan_internal_check_memory+0x238/0x3d0 mm/kmsan/kmsan.c:423
 kmsan_check_memory+0xd/0x10 mm/kmsan/kmsan_hooks.c:428
 instrument_copy_to_user include/linux/instrumented.h:91 [inline]
 _copy_to_user+0x100/0x1d0 lib/usercopy.c:30
 copy_to_user include/linux/uaccess.h:161 [inline]
 video_put_user drivers/media/v4l2-core/v4l2-ioctl.c:3226 [inline]
 video_usercopy+0x248a/0x2c00 drivers/media/v4l2-core/v4l2-ioctl.c:3325
 video_ioctl2+0x9f/0xb0 drivers/media/v4l2-core/v4l2-ioctl.c:3335
 v4l2_ioctl+0x23f/0x270 drivers/media/v4l2-core/v4l2-dev.c:360
 vfs_ioctl fs/ioctl.c:48 [inline]
 ksys_ioctl fs/ioctl.c:753 [inline]
 __do_sys_ioctl fs/ioctl.c:762 [inline]
 __se_sys_ioctl+0x2e9/0x410 fs/ioctl.c:760
 __x64_sys_ioctl+0x4a/0x70 fs/ioctl.c:760
 do_syscall_64+0xb0/0x150 arch/x86/entry/common.c:386
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x444009
Code: Bad RIP value.
RSP: 002b:00007ffd83706aa8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000004002e0 RCX: 0000000000444009
RDX: 0000000020000100 RSI: 00000000c0505611 RDI: 0000000000000003
RBP: 00000000006ce018 R08: 00000000004002e0 R09: 00000000004002e0
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000401c90
R13: 0000000000401d20 R14: 0000000000000000 R15: 0000000000000000

Local variable ----vb32.i@video_usercopy created at:
 video_put_user drivers/media/v4l2-core/v4l2-ioctl.c:3210 [inline]
 video_usercopy+0x20bd/0x2c00 drivers/media/v4l2-core/v4l2-ioctl.c:3325
 video_put_user drivers/media/v4l2-core/v4l2-ioctl.c:3210 [inline]
 video_usercopy+0x20bd/0x2c00 drivers/media/v4l2-core/v4l2-ioctl.c:3325

Bytes 52-55 of 80 are uninitialized
Memory access of size 80 starts at ffffa41d80dcfce0
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
