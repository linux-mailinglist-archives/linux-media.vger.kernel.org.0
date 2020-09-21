Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA23B271F8E
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbgIUKCg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:02:36 -0400
Received: from mail-io1-f78.google.com ([209.85.166.78]:51713 "EHLO
        mail-io1-f78.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgIUKCW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:02:22 -0400
Received: by mail-io1-f78.google.com with SMTP id q12so9419313iob.18
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=8At/pGVVkTvpu/mp8Xc1NUUCOQaO1LHGiWdU5OkrovU=;
        b=IzeAHaM8VY7DFB6hagvukdxXFRmG+V5O1mLYJj6Hfmpt6C4MdkjinbyV2bprRS2doZ
         REpkPqckFoWrFeY1xiQHDP08KR2+moPY5mdAOvgJH6qIYpO2N1MBra9WoK9YV4SoExNw
         tY8VBpRwhH+NEr/a6m6WVgkpWnE/fS828G/ueTYTs5Lch1oOGCzf7DI67Cgdekm2zUUK
         AeTPc9teAy4G/WPoy8FPQwlEAO5M9CM89qML45hDpXdc5SpvPhLDt10HMkCQvXbyHsQe
         bbOr/JS1fd7vteQ6QskPDXHZYcMmn+QxBTov3FXjobE0v64XbZY8MWJHzieGnvHlu7HZ
         8Jdw==
X-Gm-Message-State: AOAM531vKHvNuWqHnhGx5WZUrGlnaiM+b3O9FRckCoPaXcHjdRzGpLq2
        0QCXTxP6LDDdZH6yWQB+NuRS+24JEWs70OXlSiCXUJz1h05O
X-Google-Smtp-Source: ABdhPJxPUybSAP4Njtc33THXv/FIAL+YAdszuiOczoJOLnIlLdsyLDL4g4fKHLTRtNpCNgn4E9o9Ol9mX2203FoqPwF5SL6quLgc
MIME-Version: 1.0
X-Received: by 2002:a92:d07:: with SMTP id 7mr39101806iln.243.1600682541373;
 Mon, 21 Sep 2020 03:02:21 -0700 (PDT)
Date:   Mon, 21 Sep 2020 03:02:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000046e0e905afcff205@google.com>
Subject: KASAN: vmalloc-out-of-bounds Read in bpf_trace_run2
From:   syzbot <syzbot+845923d2172947529b58@syzkaller.appspotmail.com>
To:     andriin@fb.com, ast@kernel.org, bpf@vger.kernel.org,
        coreteam@netfilter.org, daniel@iogearbox.net, davem@davemloft.net,
        hawk@kernel.org, john.fastabend@gmail.com, kaber@trash.net,
        kadlec@blackhole.kfki.hu, kafai@fb.com, kpsingh@chromium.org,
        kuba@kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        mchehab@s-opensource.com, mingo@redhat.com, netdev@vger.kernel.org,
        netfilter-devel@vger.kernel.org, pablo@netfilter.org,
        rostedt@goodmis.org, songliubraving@fb.com,
        syzkaller-bugs@googlegroups.com, yhs@fb.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    70b97111 bpf: Use hlist_add_head_rcu when linking to local..
git tree:       bpf-next
console output: https://syzkaller.appspot.com/x/log.txt?x=15c624ad900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7e0ca96a9b6ee858
dashboard link: https://syzkaller.appspot.com/bug?extid=845923d2172947529b58
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10193f3b900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=168c729b900000

The issue was bisected to:

commit 0a93dc1c18fd86f936bcb44f72dc044c0ea826a8
Author: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Date:   Wed Oct 12 11:11:16 2016 +0000

    [media] dvb-core: don't break long lines

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=170e18d3900000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=148e18d3900000
console output: https://syzkaller.appspot.com/x/log.txt?x=108e18d3900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+845923d2172947529b58@syzkaller.appspotmail.com
Fixes: 0a93dc1c18fd ("[media] dvb-core: don't break long lines")

==================================================================
BUG: KASAN: vmalloc-out-of-bounds in __bpf_trace_run kernel/trace/bpf_trace.c:1937 [inline]
BUG: KASAN: vmalloc-out-of-bounds in bpf_trace_run2+0x397/0x3d0 kernel/trace/bpf_trace.c:1974
Read of size 8 at addr ffffc90000e76030 by task syz-executor514/6838

CPU: 0 PID: 6838 Comm: syz-executor514 Not tainted 5.9.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x18f/0x20d lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0x5/0x497 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
 __bpf_trace_run kernel/trace/bpf_trace.c:1937 [inline]
 bpf_trace_run2+0x397/0x3d0 kernel/trace/bpf_trace.c:1974
 trace_sys_enter include/trace/events/syscalls.h:18 [inline]
 syscall_trace_enter kernel/entry/common.c:64 [inline]
 syscall_enter_from_user_mode+0x22c/0x290 kernel/entry/common.c:82
 do_syscall_64+0xf/0x70 arch/x86/entry/common.c:41
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x4441ba
Code: 25 18 00 00 00 00 74 01 f0 48 0f b1 3d ef f9 28 00 48 39 c2 75 da f3 c3 0f 1f 84 00 00 00 00 00 48 63 ff b8 e4 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 06 f3 c3 0f 1f 40 00 48 c7 c2 d0 ff ff ff f7
RSP: 002b:00007ffeec2fd9d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e4
RAX: ffffffffffffffda RBX: 0000000000001ac2 RCX: 00000000004441ba
RDX: 0000000000000000 RSI: 00007ffeec2fd9e0 RDI: 0000000000000001
RBP: 000000000000e4f7 R08: 0000000000001ab6 R09: 00000000022b5880
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000004022d0
R13: 0000000000402360 R14: 0000000000000000 R15: 0000000000000000


Memory state around the buggy address:
 ffffc90000e75f00: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc90000e75f80: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>ffffc90000e76000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                                     ^
 ffffc90000e76080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc90000e76100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
