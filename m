Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 477A221FDB7
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 21:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729761AbgGNTrz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 15:47:55 -0400
Received: from netrider.rowland.org ([192.131.102.5]:41977 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729466AbgGNTry (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 15:47:54 -0400
Received: (qmail 1035129 invoked by uid 1000); 14 Jul 2020 15:47:53 -0400
Date:   Tue, 14 Jul 2020 15:47:53 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     syzbot <syzbot+4d3749e9612c2cfab956@syzkaller.appspotmail.com>
Cc:     andreyknvl@google.com, fweisbec@gmail.com,
        Jarod Wilson <jarod@redhat.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mingo@kernel.org, syzkaller-bugs@googlegroups.com,
        tglx@linutronix.de
Subject: Re: INFO: rcu detected stall in dummy_timer (3)
Message-ID: <20200714194753.GA1033470@rowland.harvard.edu>
References: <000000000000e7493205aa694785@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000e7493205aa694785@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 14, 2020 at 09:27:18AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    25051b55 udc: lpc32xx: make symbol 'lpc32xx_usbddata' static
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=12e0ba00900000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=999be4eb2478ffa5
> dashboard link: https://syzkaller.appspot.com/bug?extid=4d3749e9612c2cfab956
> compiler:       gcc (GCC) 10.1.0-syz 20200507
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=127354e7100000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10ba8500900000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+4d3749e9612c2cfab956@syzkaller.appspotmail.com
> 
> mceusb 5-1:0.0: Error: urb status = -71
> mceusb 3-1:0.0: Error: urb status = -71
> mceusb 4-1:0.0: Error: urb status = -71
> mceusb 6-1:0.0: Error: urb status = -71
> mceusb 5-1:0.0: Error: urb status = -71
> rcu: INFO: rcu_sched self-detected stall on CPU

This looks like an error in mceusb_dev_recv() in 
drivers/media/rc/mceusb.c.  In the case of a -EPROTO error (indeed, any 
error code it doesn't recognize), the routine immediately resubmits the 
URB.  Instead it should do the same thing as in the other error cases: 
return without resubmitting.

(Incidentally, the calls to usb_unlink_urb() in that routine are useless 
and look very strange.  The URB is already unlinked, since 
mceusb_dev_recv() is the completion handler.)

Alan Stern
