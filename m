Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8678D31260E
	for <lists+linux-media@lfdr.de>; Sun,  7 Feb 2021 17:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbhBGQhP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Feb 2021 11:37:15 -0500
Received: from netrider.rowland.org ([192.131.102.5]:35379 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229491AbhBGQhO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Feb 2021 11:37:14 -0500
Received: (qmail 666614 invoked by uid 1000); 7 Feb 2021 11:36:32 -0500
Date:   Sun, 7 Feb 2021 11:36:32 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     syzbot <syzbot+d4ebc877b1223f20d5a0@syzkaller.appspotmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     andreyknvl@google.com, andriy.shevchenko@linux.intel.com,
        gregkh@linuxfoundation.org, johan@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, mathias.nyman@linux.intel.com,
        syzkaller-bugs@googlegroups.com
Subject: Re: WARNING in go7007_usb_onboard_write_interrupt/usb_submit_urb
Message-ID: <20210207163632.GA666362@rowland.harvard.edu>
References: <000000000000ef60e905baba29d0@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000ef60e905baba29d0@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans:

On Sat, Feb 06, 2021 at 11:40:13PM -0800, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    64eaa0fa platform/chrome: cros_ec_typec: Fix call to typec..
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=12d5c090d00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=29ec25b819cb42f3
> dashboard link: https://syzkaller.appspot.com/bug?extid=d4ebc877b1223f20d5a0
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16b47dd8d00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=164896c4d00000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+d4ebc877b1223f20d5a0@syzkaller.appspotmail.com
> 
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: SerialNumber: syz
> usb 1-1: config 0 descriptor??
> ------------[ cut here ]------------
> usb 1-1: BOGUS urb xfer, pipe 2 != type 3
> WARNING: CPU: 0 PID: 2608 at drivers/usb/core/urb.c:493 usb_submit_urb+0xd27/0x1540 drivers/usb/core/urb.c:493
> Modules linked in:
> CPU: 0 PID: 2608 Comm: kworker/0:2 Not tainted 5.11.0-rc5-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Workqueue: usb_hub_wq hub_event
> RIP: 0010:usb_submit_urb+0xd27/0x1540 drivers/usb/core/urb.c:493
> Code: 84 d4 02 00 00 e8 e9 e9 ba fd 4c 89 ef e8 f1 3d 1d ff 41 89 d8 44 89 e1 4c 89 f2 48 89 c6 48 c7 c7 00 6a 61 86 e8 31 ee f9 01 <0f> 0b e9 81 f8 ff ff e8 bd e9 ba fd 48 81 c5 30 06 00 00 e9 ad f7
> RSP: 0018:ffffc90006cf6c70 EFLAGS: 00010286
> RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000000000
> RDX: ffff88810a895040 RSI: ffffffff81299db3 RDI: fffff52000d9ed80
> RBP: ffff88810155f8a0 R08: 0000000000000001 R09: 0000000000000000
> R10: ffffffff8149c4ab R11: 0000000000000000 R12: 0000000000000002
> R13: ffff8881121670a0 R14: ffff8881031c06e0 R15: ffff888102b46f00
> FS:  0000000000000000(0000) GS:ffff8881f6800000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000055bfb7b520d0 CR3: 000000010a1f1000 CR4: 00000000001506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  usb_start_wait_urb+0x101/0x4c0 drivers/usb/core/message.c:58
>  usb_internal_control_msg drivers/usb/core/message.c:102 [inline]
>  usb_control_msg+0x31c/0x4a0 drivers/usb/core/message.c:153
>  go7007_usb_onboard_write_interrupt+0x26a/0x340 drivers/media/usb/go7007/go7007-usb.c:735

It looks like the go7007 driver isn't very careful about checking that 
the endpoints it uses have the right types.  In particular, this bug was 
caused by not checking that ep2 is a control endpoint (highly unusual to 
have a control endpoint other than 0, but allowed).

Alan Stern
