Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A08368C20F
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 22:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbfHMUV2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 16:21:28 -0400
Received: from gofer.mess.org ([88.97.38.141]:36829 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726231AbfHMUV2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 16:21:28 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 8DDD8603E8; Tue, 13 Aug 2019 21:21:25 +0100 (BST)
Date:   Tue, 13 Aug 2019 21:21:25 +0100
From:   Sean Young <sean@mess.org>
To:     Brad Love <brad@nextdimension.cc>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        syzbot <syzbot+b7f57261c521087d89bb@syzkaller.appspotmail.com>,
        andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media: em28xx: modules workqueue not inited for 2nd
 device
Message-ID: <20190813202125.o6ay4kgg52nb5ntl@gofer.mess.org>
References: <0000000000004bcc0d058faf01c4@google.com>
 <20190811051110.hsdwmjrbvqgrmssc@gofer.mess.org>
 <614221186ed37383778d8890d39e829a0e924796.camel@collabora.com>
 <20190813091059.6ec46psv67y7msef@gofer.mess.org>
 <2a716666-ed08-3c64-1c16-1c34afed6de4@nextdimension.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a716666-ed08-3c64-1c16-1c34afed6de4@nextdimension.cc>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Brad,

On Tue, Aug 13, 2019 at 01:48:34PM -0500, Brad Love wrote:
> > On Mon, Aug 12, 2019 at 10:21:39AM -0300, Ezequiel Garcia wrote:
> >> On Sun, 2019-08-11 at 06:11 +0100, Sean Young wrote:
> >>> syzbot reports an error on flush_request_modules() for the second device.
> >>> This workqueue was never initialised so simply remove the offending line.
> >>>
> >>> usb 1-1: USB disconnect, device number 2
> >>> em28xx 1-1:1.153: Disconnecting em28xx #1
> >>> ------------[ cut here ]------------
> >>> WARNING: CPU: 0 PID: 12 at kernel/workqueue.c:3031
> >>> __flush_work.cold+0x2c/0x36 kernel/workqueue.c:3031
> >>> Kernel panic - not syncing: panic_on_warn set ...
> >>> CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.3.0-rc2+ #25
> >>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> >>> Google 01/01/2011
> >>> Workqueue: usb_hub_wq hub_event
> >>> Call Trace:
> >>>   __dump_stack lib/dump_stack.c:77 [inline]
> >>>   dump_stack+0xca/0x13e lib/dump_stack.c:113
> >>>   panic+0x2a3/0x6da kernel/panic.c:219
> >>>   __warn.cold+0x20/0x4a kernel/panic.c:576
> >>>   report_bug+0x262/0x2a0 lib/bug.c:186
> >>>   fixup_bug arch/x86/kernel/traps.c:179 [inline]
> >>>   fixup_bug arch/x86/kernel/traps.c:174 [inline]
> >>>   do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:272
> >>>   do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:291
> >>>   invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1026
> >>> RIP: 0010:__flush_work.cold+0x2c/0x36 kernel/workqueue.c:3031
> >>> Code: 9a 22 00 48 c7 c7 20 e4 c5 85 e8 d9 3a 0d 00 0f 0b 45 31 e4 e9 98 86
> >>> ff ff e8 51 9a 22 00 48 c7 c7 20 e4 c5 85 e8 be 3a 0d 00 <0f> 0b 45 31 e4
> >>> e9 7d 86 ff ff e8 36 9a 22 00 48 c7 c7 20 e4 c5 85
> >>> RSP: 0018:ffff8881da20f720 EFLAGS: 00010286
> >>> RAX: 0000000000000024 RBX: dffffc0000000000 RCX: 0000000000000000
> >>> RDX: 0000000000000000 RSI: ffffffff8128a0fd RDI: ffffed103b441ed6
> >>> RBP: ffff8881da20f888 R08: 0000000000000024 R09: fffffbfff11acd9a
> >>> R10: fffffbfff11acd99 R11: ffffffff88d66ccf R12: 0000000000000000
> >>> R13: 0000000000000001 R14: ffff8881c6685df8 R15: ffff8881d2a85b78
> >>>   flush_request_modules drivers/media/usb/em28xx/em28xx-cards.c:3325 [inline]
> >>>   em28xx_usb_disconnect.cold+0x280/0x2a6
> >>> drivers/media/usb/em28xx/em28xx-cards.c:4023
> >>>   usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
> >>>   __device_release_driver drivers/base/dd.c:1120 [inline]
> >>>   device_release_driver_internal+0x404/0x4c0 drivers/base/dd.c:1151
> >>>   bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
> >>>   device_del+0x420/0xb10 drivers/base/core.c:2288
> >>>   usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
> >>>   usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2199
> >>>   hub_port_connect drivers/usb/core/hub.c:4949 [inline]
> >>>   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
> >>>   port_event drivers/usb/core/hub.c:5359 [inline]
> >>>   hub_event+0x1454/0x3640 drivers/usb/core/hub.c:5441
> >>>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
> >>>   process_scheduled_works kernel/workqueue.c:2331 [inline]
> >>>   worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
> >>>   kthread+0x318/0x420 kernel/kthread.c:255
> >>>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> >>> Kernel Offset: disabled
> >>> Rebooting in 86400 seconds..
> >>>
> >>> Reported-by: syzbot+b7f57261c521087d89bb@syzkaller.appspotmail.com
> >>> Signed-off-by: Sean Young <sean@mess.org>
> >> I reviewed the syzbot report, but was left head-scratching and
> >> failing to see how the module-loading worker was supposed to be used :-)
> >>
> >> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> >>
> >> Also, this seems a bug, so how about this tag?
> >>
> >> Fixes: be7fd3c3a8c5e ("media: em28xx: Hauppauge DualHD second tuner functionality)
> > Would you mind reviewing this change please Brad? You added the dual_ts
> > feature to the driver so it would be good to have your view on this.
> >
> > Thanks
> > Sean
> 
> 
> Hmmm. I've never encountered this oops, nor had it reported to me. Looks
> like the second device indeed never calls request_modules, and when I
> did the cleanup I just duplicated all the teardown. Since everything
> works without the second workqueue already, I don't think the second
> device needs to initialize it's own. So, I think your solution is proper.
> 
> 
> Reviewed-by: Brad Love <brad@nextdimension.cc>

Great, thank you!

If I understand this correctly, then if you build your kernel with KASAN
and UBSAN then I _think_ this is caught.

Thanks
Sean
