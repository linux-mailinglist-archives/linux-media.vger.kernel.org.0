Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 692EF2D88C0
	for <lists+linux-media@lfdr.de>; Sat, 12 Dec 2020 18:44:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439464AbgLLRny (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Dec 2020 12:43:54 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:39723 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439423AbgLLRnv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Dec 2020 12:43:51 -0500
Received: by mail-il1-f198.google.com with SMTP id f2so9749197ils.6
        for <linux-media@vger.kernel.org>; Sat, 12 Dec 2020 09:43:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=aSZGHDMYr39pdAExzWtTdZyDRsiSSJB+x/sK8AbEaCE=;
        b=a3WItkn3rzeL+n810O6lDPbyM22ItbZj9D/Bb4ssiOOHbqKa/l4HxOLoAWcXKyJvqH
         H/QlU1/sS0r60wskzWJiaK2GrJ/LXv51+W53Iq+5RczGRjf6topmX23+XMDAKE8425Sl
         1GIqpJ9dI4UxOYCA49Ey0kel7Owp4jSqViYCgTwwsC5IzA7yAea/zuiHyVtuZyJ2WKVt
         G5SfSITWPvCBGHNGmxL0jplvADxGFAEBYuLpfna4oXQIvem47Vxa/KMSJ3oWutNcKgcB
         hnrotkJ8a+QgT4H3rWJnxZZPo8WSUOicZv1B9wbLT/OXSH0MIGNHodwIz76epAalSlO+
         wtqA==
X-Gm-Message-State: AOAM532NEsm7c/gWtPzHt2AVLRdSMI7qHiBMN4GNDa9g4lxeNZfBbmKF
        f2kb0uzvJ4h1TJ7ynBt9oYT9Dd0qq7Jz/sg/F0MFK5cA0PB0
X-Google-Smtp-Source: ABdhPJxrL1TfLcbCV4wBF/uL3ocKjpSJ6geeoX7viRBgV2SDdoE8WQThYHUMOtsQpRS+m7UV4o4RTsuRh3lDgVql9Jx+TzcTIS0F
MIME-Version: 1.0
X-Received: by 2002:a6b:c9cb:: with SMTP id z194mr22275866iof.110.1607794990282;
 Sat, 12 Dec 2020 09:43:10 -0800 (PST)
Date:   Sat, 12 Dec 2020 09:43:10 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000447ae005b647f1df@google.com>
Subject: KMSAN: uninit-value in legacy_dvb_usb_read_remote_control
From:   syzbot <syzbot+2cd8c5db4a85f0a04142@syzkaller.appspotmail.com>
To:     glider@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    73d62e81 kmsan: random: prevent boot-time reports in _mix_..
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=12d97ccb500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eef728deea880383
dashboard link: https://syzkaller.appspot.com/bug?extid=2cd8c5db4a85f0a04142
compiler:       clang version 11.0.0 (https://github.com/llvm/llvm-project.git ca2dcbd030eadbf0aa9b660efe864ff08af6e18b)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=100658c5500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16e4cb9b500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2cd8c5db4a85f0a04142@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in legacy_dvb_usb_read_remote_control+0x3b8/0x730 drivers/media/usb/dvb-usb/dvb-usb-remote.c:129
CPU: 0 PID: 8393 Comm: kworker/0:5 Not tainted 5.10.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: events legacy_dvb_usb_read_remote_control
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:118
 kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:118
 __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
 legacy_dvb_usb_read_remote_control+0x3b8/0x730 drivers/media/usb/dvb-usb/dvb-usb-remote.c:129
 process_one_work+0x121c/0x1fc0 kernel/workqueue.c:2272
 worker_thread+0x10cc/0x2740 kernel/workqueue.c:2418
 kthread+0x51c/0x560 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

Local variable ----state@legacy_dvb_usb_read_remote_control created at:
 legacy_dvb_usb_read_remote_control+0x68/0x730 drivers/media/usb/dvb-usb/dvb-usb-remote.c:120
 legacy_dvb_usb_read_remote_control+0x68/0x730 drivers/media/usb/dvb-usb/dvb-usb-remote.c:120
=====================================================
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 8393 Comm: kworker/0:5 Tainted: G    B             5.10.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: events legacy_dvb_usb_read_remote_control
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:118
 panic+0x4c8/0xea7 kernel/panic.c:231
 kmsan_report+0x1da/0x1e0 mm/kmsan/kmsan_report.c:141
 __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
 legacy_dvb_usb_read_remote_control+0x3b8/0x730 drivers/media/usb/dvb-usb/dvb-usb-remote.c:129
 process_one_work+0x121c/0x1fc0 kernel/workqueue.c:2272
 worker_thread+0x10cc/0x2740 kernel/workqueue.c:2418
 kthread+0x51c/0x560 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
