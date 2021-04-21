Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC413367265
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 20:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245196AbhDUSU3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 14:20:29 -0400
Received: from netrider.rowland.org ([192.131.102.5]:34833 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S245166AbhDUSU2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 14:20:28 -0400
Received: (qmail 217821 invoked by uid 1000); 21 Apr 2021 14:19:54 -0400
Date:   Wed, 21 Apr 2021 14:19:54 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        syzbot <syzbot+d1e69c888f0d3866ead4@syzkaller.appspotmail.com>
Cc:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, mathias.nyman@linux.intel.com,
        syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] memory leak in usb_set_configuration (2)
Message-ID: <20210421181954.GB216484@rowland.harvard.edu>
References: <0000000000001ad5d605c07cfd2e@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0000000000001ad5d605c07cfd2e@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 21, 2021 at 08:12:18AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    9cdbf646 Merge tag 'io_uring-5.12-2021-04-16' of git://git..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=136ce5a6d00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=fd35e661e44323ea
> dashboard link: https://syzkaller.appspot.com/bug?extid=d1e69c888f0d3866ead4
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16ecba29d00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=143cf955d00000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+d1e69c888f0d3866ead4@syzkaller.appspotmail.com
> 
> BUG: memory leak
> unreferenced object 0xffff8881120e1400 (size 1024):
>   comm "kworker/0:2", pid 3660, jiffies 4294952380 (age 24.950s)
>   hex dump (first 32 bytes):
>     c8 78 3c 12 81 88 ff ff c8 78 3c 12 81 88 ff ff  .x<......x<.....
>     01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<ffffffff82ba5d37>] kmalloc include/linux/slab.h:554 [inline]
>     [<ffffffff82ba5d37>] kzalloc include/linux/slab.h:684 [inline]
>     [<ffffffff82ba5d37>] usb_set_configuration+0x187/0xb90 drivers/usb/core/message.c:1992
>     [<ffffffff82bb69ec>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
>     [<ffffffff82ba874c>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
>     [<ffffffff825f67f9>] really_probe+0x159/0x4a0 drivers/base/dd.c:559
>     [<ffffffff825f6bc4>] driver_probe_device+0x84/0x100 drivers/base/dd.c:745
>     [<ffffffff825f72de>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:851
>     [<ffffffff825f3747>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
>     [<ffffffff825f6e72>] __device_attach+0x122/0x250 drivers/base/dd.c:919
>     [<ffffffff825f53e6>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
>     [<ffffffff825f1935>] device_add+0x5d5/0xc40 drivers/base/core.c:3242
>     [<ffffffff841df2d9>] usb_new_device.cold+0x16a/0x582 drivers/usb/core/hub.c:2555
>     [<ffffffff82b9b24e>] hub_port_connect drivers/usb/core/hub.c:5223 [inline]
>     [<ffffffff82b9b24e>] hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
>     [<ffffffff82b9b24e>] port_event drivers/usb/core/hub.c:5509 [inline]
>     [<ffffffff82b9b24e>] hub_event+0x142e/0x20c0 drivers/usb/core/hub.c:5591
>     [<ffffffff81259619>] process_one_work+0x2c9/0x600 kernel/workqueue.c:2275
>     [<ffffffff81259f09>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2421
>     [<ffffffff81261638>] kthread+0x178/0x1b0 kernel/kthread.c:292
>     [<ffffffff8100227f>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
> 
> BUG: memory leak
> unreferenced object 0xffff888110a217a0 (size 32):
>   comm "kworker/0:2", pid 3660, jiffies 4294952380 (age 24.950s)
>   hex dump (first 32 bytes):
>     31 2d 31 3a 30 2e 32 34 31 00 00 00 00 00 00 00  1-1:0.241.......
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<ffffffff8223411c>] kvasprintf+0x6c/0xf0 lib/kasprintf.c:25
>     [<ffffffff822341f8>] kvasprintf_const+0x58/0x110 lib/kasprintf.c:49
>     [<ffffffff822f402b>] kobject_set_name_vargs+0x3b/0xe0 lib/kobject.c:289
>     [<ffffffff825ec413>] dev_set_name+0x63/0x90 drivers/base/core.c:3028
>     [<ffffffff82ba6269>] usb_set_configuration+0x6b9/0xb90 drivers/usb/core/message.c:2099
>     [<ffffffff82bb69ec>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
>     [<ffffffff82ba874c>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
>     [<ffffffff825f67f9>] really_probe+0x159/0x4a0 drivers/base/dd.c:559
>     [<ffffffff825f6bc4>] driver_probe_device+0x84/0x100 drivers/base/dd.c:745
>     [<ffffffff825f72de>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:851
>     [<ffffffff825f3747>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
>     [<ffffffff825f6e72>] __device_attach+0x122/0x250 drivers/base/dd.c:919
>     [<ffffffff825f53e6>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
>     [<ffffffff825f1935>] device_add+0x5d5/0xc40 drivers/base/core.c:3242
>     [<ffffffff841df2d9>] usb_new_device.cold+0x16a/0x582 drivers/usb/core/hub.c:2555
>     [<ffffffff82b9b24e>] hub_port_connect drivers/usb/core/hub.c:5223 [inline]
>     [<ffffffff82b9b24e>] hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
>     [<ffffffff82b9b24e>] port_event drivers/usb/core/hub.c:5509 [inline]
>     [<ffffffff82b9b24e>] hub_event+0x142e/0x20c0 drivers/usb/core/hub.c:5591

This looks like a job for the linux-media people.

The CPiA2 driver in drivers/media/usb/cpia2 calls v4l2_device_register() 
from within cpia2_init_camera_struct() in the probe routine, but doesn't 
call v4l2_device_unregister() on any of the probe failure paths.

Alan Stern
