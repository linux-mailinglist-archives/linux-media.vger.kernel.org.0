Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5DC51FCBE8
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 13:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgFQLMU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 07:12:20 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:35695 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbgFQLMU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 07:12:20 -0400
Received: by mail-io1-f71.google.com with SMTP id c5so1555531ioh.2
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 04:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=cK7FTAwbUSTiZjl6IkrYdUSKLpi8bAFJPJNJyEpu2aE=;
        b=B2GprHccd2lwn7Ouji5v1f5UNPkO4sFifgAP/AYcckkY9MNqBM1STTL+aQAO97DJXy
         pN9QJKDAaow9hUjvezylaf8KErTN3tzj50MhHU1fmKA4H9CEXQG77jGpWq9HTIYg0d/u
         LlWiOh9NuucUbXSOiNkXuKE7k+JIlo+9ggpNsjw3suHmgqsRo27GBskyW35TRXh8+diq
         7Bz39irJ2bsubqxbAkFpLX64AhpeE3Rdbn7cqte67bYa3x58ABuWxY5CjPYfHue2jKF/
         3r+f6JA4+X08kimhVOTvlExWupYCQjjX88C8a9M1FAHpkcoGU6CueUpE3++cUNtcFmzs
         dWWA==
X-Gm-Message-State: AOAM53198NG7z3WTHHmVuODc6pFEELRkGSMZWuMzI1YmproPWDyNGSAF
        czlNVTmIzDtEHbFcfZOcrUfo5URsT7JiOyHUgw5uGQt1818Z
X-Google-Smtp-Source: ABdhPJwem8R228KKsE/YZaUkfEzFGhsGTcUNrUIavzcGCWj1WAo0Jip64m76KutfyvhSJDZU3cyFjADTRrbg3RNznlhdehS3T6FA
MIME-Version: 1.0
X-Received: by 2002:a92:b001:: with SMTP id x1mr7180749ilh.18.1592392338268;
 Wed, 17 Jun 2020 04:12:18 -0700 (PDT)
Date:   Wed, 17 Jun 2020 04:12:18 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000aa674005a845bbc5@google.com>
Subject: KASAN: null-ptr-deref Write in media_request_close
From:   syzbot <syzbot+6bed2d543cf7e48b822b@syzkaller.appspotmail.com>
To:     laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    7ae77150 Merge tag 'powerpc-5.8-1' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13880e71100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=be4578b3f1083656
dashboard link: https://syzkaller.appspot.com/bug?extid=6bed2d543cf7e48b822b
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+6bed2d543cf7e48b822b@syzkaller.appspotmail.com

RBP: 000000000078bf00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000004
R13: 0000000000000404 R14: 00000000004c6c29 R15: 00007f0c04c4a6d4
==================================================================
BUG: KASAN: null-ptr-deref in atomic_fetch_sub include/asm-generic/atomic-instrumented.h:199 [inline]
BUG: KASAN: null-ptr-deref in refcount_sub_and_test include/linux/refcount.h:266 [inline]
BUG: KASAN: null-ptr-deref in refcount_dec_and_test include/linux/refcount.h:294 [inline]
BUG: KASAN: null-ptr-deref in kref_put include/linux/kref.h:64 [inline]
BUG: KASAN: null-ptr-deref in media_request_put drivers/media/mc/mc-request.c:81 [inline]
BUG: KASAN: null-ptr-deref in media_request_close+0x4d/0x170 drivers/media/mc/mc-request.c:89
Write of size 4 at addr 0000000000000008 by task syz-executor.5/16136

CPU: 0 PID: 16136 Comm: syz-executor.5 Not tainted 5.7.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1e9/0x30e lib/dump_stack.c:118
 __kasan_report mm/kasan/report.c:517 [inline]
 kasan_report+0x151/0x1d0 mm/kasan/report.c:530
 check_memory_region_inline mm/kasan/generic.c:183 [inline]
 check_memory_region+0x2b5/0x2f0 mm/kasan/generic.c:192
 atomic_fetch_sub include/asm-generic/atomic-instrumented.h:199 [inline]
 refcount_sub_and_test include/linux/refcount.h:266 [inline]
 refcount_dec_and_test include/linux/refcount.h:294 [inline]
 kref_put include/linux/kref.h:64 [inline]
 media_request_put drivers/media/mc/mc-request.c:81 [inline]
 media_request_close+0x4d/0x170 drivers/media/mc/mc-request.c:89
 __fput+0x2ed/0x750 fs/file_table.c:281
 task_work_run+0x147/0x1d0 kernel/task_work.c:123
 tracehook_notify_resume include/linux/tracehook.h:188 [inline]
 exit_to_usermode_loop arch/x86/entry/common.c:165 [inline]
 prepare_exit_to_usermode+0x48e/0x600 arch/x86/entry/common.c:196
 entry_SYSCALL_64_after_hwframe+0x49/0xb3
RIP: 0033:0x45ca69
Code: 0d b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 db b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f0c04c49c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: fffffffffffffff4 RBX: 00000000004e9300 RCX: 000000000045ca69
RDX: 00000000200000c0 RSI: 0000000080047c05 RDI: 0000000000000003
RBP: 000000000078bf00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000004
R13: 0000000000000404 R14: 00000000004c6c29 R15: 00007f0c04c4a6d4
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
