Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8541872AD19
	for <lists+linux-media@lfdr.de>; Sat, 10 Jun 2023 18:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjFJQQV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Jun 2023 12:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjFJQQT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Jun 2023 12:16:19 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id CA4843C0E
        for <linux-media@vger.kernel.org>; Sat, 10 Jun 2023 09:15:57 -0700 (PDT)
Received: (qmail 336979 invoked by uid 1000); 10 Jun 2023 12:15:26 -0400
Date:   Sat, 10 Jun 2023 12:15:26 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        syzbot <syzbot+96127c74434e19e4609d@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [tomoyo?] [fs?] INFO: rcu detected stall in newfstatat
 (3)
Message-ID: <1d22149e-ee69-45e9-82f6-cbd8dd9c624e@rowland.harvard.edu>
References: <0000000000009752a005fdc2d114@google.com>
 <b45fa2fd-a19d-7507-726c-66a47f532bf4@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b45fa2fd-a19d-7507-726c-66a47f532bf4@I-love.SAKURA.ne.jp>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jun 10, 2023 at 07:09:26PM +0900, Tetsuo Handa wrote:
> Regarding drivers/media/rc/ directory, igorplugusb_callback() and irtoy_in_callback() and
> mceusb_dev_recv() are handling -EPROTO error, by calling usb_unlink_urb() and returning
> instead of calling usb_submit_urb() again. This indicates that lack of -EPROTO (and some
> other error codes) handling in usb_rx_callback_intf0() is causing infinite resubmit loop.
> So, which error codes does usb_rx_callback_intf0() need to handle?

It depends on how much error handling you want to do.

In theory some USB errors are transient, so they can be worked around by 
retrying over a period of several seconds.  In practice I haven't found 
those sorts of error to occur often enough to be worth the trouble, 
although other people may disagree.

Some drivers just give up completely on any unrecognized error.  That's 
not an unreasonable approach.  But it does make any sort of recovery 
difficult -- the user may need to unbind and rebind the driver, or reset 
the device, or even unplug and replug the device.  (Of course, if the 
reason for the error occurring in the first place was because the user 
hot-unplugged the device, these considerations are moot.)

However, you should realize that the testing done by syzbot differs from 
normal device operation in a signficant way: Instead of using real 
hardware with real packet timings and so on, syzbot uses a software 
emulator.  The emulation isn't perfect, and the difference tends to show 
up when drivers immediately resubmit failed URBs.  The resubmitted URB 
quickly fails for the same reason as before, is resubmitted again, etc.  
This puts the emulator into a tight loop, much of which runs in 
interrupt or softirq context, causing the system to stall.  Real 
hardware would not behave the same way.

Alan Stern

> static void usb_rx_callback_intf0(struct urb *urb)
> {
> 	dev_warn(ictx->dev, "imon %s: status(%d): ignored\n",
> 		__func__, urb->status);
> 	usb_submit_urb(ictx->rx_urb_intf0, GFP_ATOMIC);
> }
> 
> #syz set subsystems: usb
> 
> On 2023/06/10 18:07, syzbot wrote:
> > Hello,
> > 
> > syzbot found the following issue on:
> > 
> > HEAD commit:    d37537a1f7cf Merge 6.4-rc5 into usb-next
> > git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > console output: https://syzkaller.appspot.com/x/log.txt?x=15d9b771280000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=9e12d6d7f5296037
> > dashboard link: https://syzkaller.appspot.com/bug?extid=96127c74434e19e4609d
> > compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=153d7959280000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15bcb6b5280000
> > 
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/752b1860c3b6/disk-d37537a1.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/6f9c9f2751b2/vmlinux-d37537a1.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/bf7433b7dd12/bzImage-d37537a1.xz
> > 
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+96127c74434e19e4609d@syzkaller.appspotmail.com
> 
