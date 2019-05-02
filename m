Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8A911FCA
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 18:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbfEBQKw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 12:10:52 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36079 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbfEBQKw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 May 2019 12:10:52 -0400
Received: by mail-pf1-f196.google.com with SMTP id v80so1365634pfa.3
        for <linux-media@vger.kernel.org>; Thu, 02 May 2019 09:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D3YDkpmzHxdhUQMUnx3mTJcJgwOyUC8yFEPxSbnfe4M=;
        b=lOtHHm/JaVfqdlgeAOquhuVyu/dUB945WnJQES1DDfTDywnbi8blc5HPqurF0Quafv
         zXA3X+4eAxak0MlMzNdDhmUGdsSp24ntiBrWwg5EoVJekstJtwtacHCLahHj30s3ul3u
         zVV36QdJ8dzSLyP9FRjyn2lAPrsOkIWHlFI/rLyOQ44eLAGuhKiq3RsiWbG/37MHM8RN
         wUjokFXA7wer7yNDIfnzgFKwH2CXXPXdTderQqIMsk9+cFq7cQBTSDnmME3+/xJar8dF
         4iZ5eRH4/A4x5PL8wIhjuPjW+JmqUBz2Q2TYZs89SAy4S6eCyyobW2YuMIosdaMFXYXd
         ih8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D3YDkpmzHxdhUQMUnx3mTJcJgwOyUC8yFEPxSbnfe4M=;
        b=tzGNRF+GLQjE5l7e6RnWNyityRKxWMphfCjUhp4nl0DXa4e+m/xI9T8VYRmxDHanxI
         zM80iQVbM/temBwvGixRTbC5NFsicS2Jr1Qv/EPBw0Vq6WVSiZT2bvBppCFPxUBPfDaR
         AqWGVbyUpzEbh2cydkbSIDLEu8f4/JcZFOeL+vmzcViONP/acbwa5vE+RGhExotd2erl
         FXLOIZF6lR/y/SoGe9Z379LcBSvP5sdjQZJPhAnUYS27p4+VlSxiXujLdyM/81grkeY+
         S2aegrFPvt5HV9WNBWgEWyDUKIwtJ48J1qzT+nUB3S+40hYZAEDO0Zhiz1aEM/4xUgoT
         sRGQ==
X-Gm-Message-State: APjAAAXrjS/WGuNKH5Kp9HrUijB8vqdpidfJdsSMFoBFtT4kjvkqNjzn
        pr9r4Myl9c4oCh9yFU2BuZ8kiMLyANoqZ+urVymCCw3sFzA=
X-Google-Smtp-Source: APXvYqzfALkDWAxRy5p0qxtcbo6+h1HGtE8n83+tgVY8D4QEgmEEsiQq4qpbSnmbHqhL4/c9nFEI8uiYTq+yH2URBoI=
X-Received: by 2002:aa7:8289:: with SMTP id s9mr5046731pfm.208.1556813451177;
 Thu, 02 May 2019 09:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000b7a84a0587c3f3e5@google.com> <Pine.LNX.4.44L0.1904301530070.1465-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1904301530070.1465-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 2 May 2019 18:10:40 +0200
Message-ID: <CAAeHK+x40G6B9penzkSHNqTXSg9ZfxrfD0hsmtJgm-O95nzcjw@mail.gmail.com>
Subject: Re: WARNING: Detected a wedged cx25840 chip; the device will not work.
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Mike Isely <isely@pobox.com>,
        syzbot <syzbot+170a86bf206dd2c6217e@syzkaller.appspotmail.com>,
        linux-media@vger.kernel.org,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 30, 2019 at 9:34 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Tue, 30 Apr 2019, syzbot wrote:
>
> > Hello,
> >
> > syzbot has tested the proposed patch but the reproducer still triggered
> > crash:
> > WARNING in sysfs_remove_group
> >
> > pvrusb2: Attached sub-driver tuner
> > pvrusb2: ***WARNING*** pvrusb2 driver initialization failed due to the
> > failure of one or more sub-device kernel modules.
> > pvrusb2: You need to resolve the failing condition before this driver can
> > function.  There should be some earlier messages giving more information
> > about the problem.
> > ------------[ cut here ]------------
> > sysfs group 'power' not found for kobject '0-0044'
> > WARNING: CPU: 1 PID: 586 at fs/sysfs/group.c:254 sysfs_remove_group
> > fs/sysfs/group.c:254 [inline]
> > WARNING: CPU: 1 PID: 586 at fs/sysfs/group.c:254
> > sysfs_remove_group+0x15a/0x1b0 fs/sysfs/group.c:245
> > Kernel panic - not syncing: panic_on_warn set ...
> > CPU: 1 PID: 586 Comm: pvrusb2-context Not tainted 5.1.0-rc3-g43151d6-dirty
> > #1
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> > Google 01/01/2011
> > Call Trace:
> >   __dump_stack lib/dump_stack.c:77 [inline]
> >   dump_stack+0xe8/0x16e lib/dump_stack.c:113
> >   panic+0x29d/0x5f2 kernel/panic.c:214
> >   __warn.cold+0x20/0x48 kernel/panic.c:571
> >   report_bug+0x262/0x2a0 lib/bug.c:186
> >   fixup_bug arch/x86/kernel/traps.c:179 [inline]
> >   fixup_bug arch/x86/kernel/traps.c:174 [inline]
> >   do_error_trap+0x130/0x1f0 arch/x86/kernel/traps.c:272
> >   do_invalid_op+0x37/0x40 arch/x86/kernel/traps.c:291
> >   invalid_op+0x14/0x20 arch/x86/entry/entry_64.S:973
> > RIP: 0010:sysfs_remove_group fs/sysfs/group.c:254 [inline]
> > RIP: 0010:sysfs_remove_group+0x15a/0x1b0 fs/sysfs/group.c:245
> > Code: 48 89 d9 49 8b 14 24 48 b8 00 00 00 00 00 fc ff df 48 c1 e9 03 80 3c
> > 01 00 75 41 48 8b 33 48 c7 c7 a0 31 7a 8e e8 e6 c2 6e ff <0f> 0b eb 95 e8
> > 0d de d3 ff e9 d2 fe ff ff 48 89 df e8 00 de d3 ff
> > RSP: 0018:ffff88809ced7b70 EFLAGS: 00010286
> > RAX: 0000000000000000 RBX: ffffffff8f037e80 RCX: 0000000000000000
> > RDX: 0000000000000000 RSI: ffffffff815b2132 RDI: ffffed10139daf60
> > RBP: 0000000000000000 R08: ffff88809ce96200 R09: ffffed1015a23edb
> > R10: ffffed1015a23eda R11: ffff8880ad11f6d7 R12: ffff888218b8e630
> > R13: ffffffff8f038520 R14: 1ffff110139daf97 R15: ffff888218b8e628
> >   dpm_sysfs_remove+0xa2/0xc0 drivers/base/power/sysfs.c:737
> >   device_del+0x175/0xb90 drivers/base/core.c:2246
> > usb 4-1: new high-speed USB device number 3 using dummy_hcd
> >   device_unregister+0x27/0xd0 drivers/base/core.c:2301
> >   i2c_unregister_device drivers/i2c/i2c-core-base.c:814 [inline]
> >   __unregister_client drivers/i2c/i2c-core-base.c:1422 [inline]
> >   __unregister_client+0x7d/0x90 drivers/i2c/i2c-core-base.c:1418
> >   device_for_each_child+0x100/0x170 drivers/base/core.c:2401
> >   i2c_del_adapter drivers/i2c/i2c-core-base.c:1485 [inline]
> >   i2c_del_adapter+0x35b/0x640 drivers/i2c/i2c-core-base.c:1447
> >   pvr2_i2c_core_done+0x6e/0xbb
> > drivers/media/usb/pvrusb2/pvrusb2-i2c-core.c:662
> >   pvr2_hdw_destroy+0x17e/0x380 drivers/media/usb/pvrusb2/pvrusb2-hdw.c:2669
> >   pvr2_context_destroy+0x89/0x240
> > drivers/media/usb/pvrusb2/pvrusb2-context.c:79
> >   pvr2_context_check drivers/media/usb/pvrusb2/pvrusb2-context.c:146 [inline]
> >   pvr2_context_thread_func+0x65e/0x870
> > drivers/media/usb/pvrusb2/pvrusb2-context.c:167
> >   kthread+0x313/0x420 kernel/kthread.c:253
> >   ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352
> > Kernel Offset: disabled
> > Rebooting in 86400 seconds..
> >
> >
> > Tested on:
> >
> > commit:         43151d6c usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=15433634a00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=274aad0cf966c3bc
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > patch:          https://syzkaller.appspot.com/x/patch.diff?x=13df3d24a00000
>
> It seems pretty clear that this problem is caused by the
> pvr2_context_thread trying to unregister the device before the main
> probe routine has finished registering it.
>
> I'm not familiar enough with this driver to want to fix the problem,
> however.  Someone else who knows the code better should work on it.

Yeah, it's a different bug than I intended to fix. I've sent patch for
the original issue (using "WARNING:") though.

>
> Alan Stern
>
