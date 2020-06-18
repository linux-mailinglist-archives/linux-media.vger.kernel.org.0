Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04F001FF44D
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 16:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730404AbgFROLQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 10:11:16 -0400
Received: from mail-il1-f200.google.com ([209.85.166.200]:48710 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728118AbgFROLP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 10:11:15 -0400
Received: by mail-il1-f200.google.com with SMTP id o4so4116086ilc.15
        for <linux-media@vger.kernel.org>; Thu, 18 Jun 2020 07:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=UT0TmKrgV9XMzDbelh2X/H8AFwYa2V/38tpP1WILxag=;
        b=hO4lRdEke9aeUMvpC+ze8eO+HM4/oYFNCmyOo+vy8QBBF3kk/gty/QVMO4zR5BPoZu
         uzHRFKsLmc5usCX74MFAC6TwgM/8nztSfBK150cBhFhDroug/k/Q+m0faXKSiHXESF/b
         U1OZ762Z/+bJRCn3yt7GoxA7X1kMjaw2JbjdA+RlDpSO4Ef7SMLRS9TShhIIePFnH+BB
         Zz2mkW6dkLNV0Ny/Id6mqgybD6t4XsMyRf8EZhamDpKFCZRg+4v/MUafCTxn1hG3kC18
         f8IbU9KGxhrFR37eYRHqsfNYkqgV0E2WaJB4LWqoZx27C+3yGD3VpuPKtlIlPVGoAMF3
         wzFw==
X-Gm-Message-State: AOAM5333w3J9OA+JnwCUHpA0V9h9SGwG9HlXAXGUt8j6nOAxdM29Tgjk
        3oEZ7IszoAunaUq/l/GM7yi5I24PtbwvB9KjPdGVLfUjNOuA
X-Google-Smtp-Source: ABdhPJwl7XXe1fYCRt3kd/1ugKmZmo8A03IL2s/Ln1Z08KokSwvFA9Vfo4SOxrIqb1EyNR73rUcCVUwck+Dg1r8hnBq/+q1qXWje
MIME-Version: 1.0
X-Received: by 2002:a92:aa13:: with SMTP id j19mr4195179ili.193.1592489474403;
 Thu, 18 Jun 2020 07:11:14 -0700 (PDT)
Date:   Thu, 18 Jun 2020 07:11:14 -0700
In-Reply-To: <000000000000aa674005a845bbc5@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006e33a605a85c59de@google.com>
Subject: Re: KASAN: null-ptr-deref Write in media_request_close
From:   syzbot <syzbot+6bed2d543cf7e48b822b@syzkaller.appspotmail.com>
To:     laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has found a reproducer for the following crash on:

HEAD commit:    7ae77150 Merge tag 'powerpc-5.8-1' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1754d1f1100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=be4578b3f1083656
dashboard link: https://syzkaller.appspot.com/bug?extid=6bed2d543cf7e48b822b
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17b3fc35100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12fbb6f1100000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+6bed2d543cf7e48b822b@syzkaller.appspotmail.com

R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000402220
R13: 00000000004022b0 R14: 0000000000000000 R15: 0000000000000000
==================================================================
BUG: KASAN: null-ptr-deref in atomic_fetch_sub include/asm-generic/atomic-instrumented.h:199 [inline]
BUG: KASAN: null-ptr-deref in refcount_sub_and_test include/linux/refcount.h:266 [inline]
BUG: KASAN: null-ptr-deref in refcount_dec_and_test include/linux/refcount.h:294 [inline]
BUG: KASAN: null-ptr-deref in kref_put include/linux/kref.h:64 [inline]
BUG: KASAN: null-ptr-deref in media_request_put drivers/media/mc/mc-request.c:81 [inline]
BUG: KASAN: null-ptr-deref in media_request_close+0x4d/0x170 drivers/media/mc/mc-request.c:89
Write of size 4 at addr 0000000000000008 by task syz-executor690/6795

CPU: 0 PID: 6795 Comm: syz-executor690 Not tainted 5.7.0-syzkaller #0
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
RIP: 0033:0x444eb9
Code: e8 5c ae 02 00 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 db ce fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffebb3970a8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: fffffffffffffff4 RBX: 0000000000000000 RCX: 0000000000444eb9
RDX: 0000000000000000 RSI: 0000000080047c05 RDI: 0000000000000004
RBP: 000000000000cdaa R08: 0000000000000001 R09: 00000000004002e0
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000402220
R13: 00000000004022b0 R14: 0000000000000000 R15: 0000000000000000
==================================================================

