Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1889E1DF9B1
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2020 19:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387660AbgEWRi4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 May 2020 13:38:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387515AbgEWRi4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 May 2020 13:38:56 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 381F4C061A0E;
        Sat, 23 May 2020 10:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=hPoQCBjZWmjMZw8FIVwgdhSjmWeQlwdjeV959pqd6d4=; b=XT+8AQbxTPZM29pEwHt33upJzd
        BULVgdiPtVtJzJdlO6boiPP2mNsIplOVjNEzOH4u8CS4F8YJmCJNVzt74RompVLLTVANwFyEPH47J
        3PFAHLH6Ku56XLNX55ZXLAYfuoN/loa5ySfRY5Vmn+M3PD+8XbcZcfq9jDLBDTLKpbIqhesOlRFlA
        xC6CQXQollwsIIxAAiBIAzELwBqcjCdwGl9kua+0iYVbMVfhNZiZnNyFR3OC0Bdhh66CeD73/pkmW
        9N3EhrkmUmGCv4OBXyVncN97TTg104K/CR6q6msHoTPl6oLn9SiIHW8NZ/yWaRNb4T4e99V387KHK
        LWmf2N0w==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jcY6n-0002yu-4c; Sat, 23 May 2020 17:38:53 +0000
Subject: Re: possible deadlock in media_devnode_release
To:     syzbot <syzbot+e3c234427cd464510547@syzkaller.appspotmail.com>,
        brendanhiggins@google.com, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, rafael.j.wysocki@intel.com,
        sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
References: <0000000000004ae30305a653bc86@google.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <08f732a9-986f-6dcf-87dd-075a9b4605d7@infradead.org>
Date:   Sat, 23 May 2020 10:38:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <0000000000004ae30305a653bc86@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/23/20 10:04 AM, syzbot wrote:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    c11d28ab Add linux-next specific files for 20200522
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=17330172100000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3f6dbdea4159fb66
> dashboard link: https://syzkaller.appspot.com/bug?extid=e3c234427cd464510547
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=122eacba100000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12fffa9a100000
> 
> The bug was bisected to:
> 
> commit 4ef12f7198023c09ad6d25b652bd8748c965c7fa
> Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Date:   Wed May 13 15:18:40 2020 +0000
> 
>     kobject: Make sure the parent does not get released before its children

Hi,

Greg just sent a revert for this patch:
https://lore.kernel.org/lkml/20200523152922.GA224858@kroah.com/

so all 3 of these reports should be cleared up soon.

> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=146b3d22100000
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=166b3d22100000
> console output: https://syzkaller.appspot.com/x/log.txt?x=126b3d22100000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+e3c234427cd464510547@syzkaller.appspotmail.com
> Fixes: 4ef12f719802 ("kobject: Make sure the parent does not get released before its children")
> 
> usb 1-1: USB disconnect, device number 2
> ============================================
> WARNING: possible recursive locking detected
> 5.7.0-rc6-next-20200522-syzkaller #0 Not tainted
> --------------------------------------------
> kworker/1:1/28 is trying to acquire lock:
> ffffffff8a4f3aa8 (media_devnode_lock){+.+.}-{3:3}, at: media_devnode_release+0x1a/0xe0 drivers/media/mc/mc-devnode.c:53
> 
> but task is already holding lock:
> ffffffff8a4f3aa8 (media_devnode_lock){+.+.}-{3:3}, at: media_devnode_unregister+0x1c/0x69 drivers/media/mc/mc-devnode.c:283
> 
> other info that might help us debug this:
>  Possible unsafe locking scenario:
> 
>        CPU0
>        ----
>   lock(media_devnode_lock);
>   lock(media_devnode_lock);
> 
>  *** DEADLOCK ***
> 
>  May be due to missing lock nesting notation
> 
> 6 locks held by kworker/1:1/28:
>  #0: ffff88821a8e6138 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: __write_once_size include/linux/compiler.h:303 [inline]
>  #0: ffff88821a8e6138 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
>  #0: ffff88821a8e6138 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic64_set include/asm-generic/atomic-instrumented.h:856 [inline]
>  #0: ffff88821a8e6138 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic_long_set include/asm-generic/atomic-long.h:41 [inline]
>  #0: ffff88821a8e6138 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:615 [inline]
>  #0: ffff88821a8e6138 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:642 [inline]
>  #0: ffff88821a8e6138 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x844/0x16a0 kernel/workqueue.c:2239
>  #1: ffffc90000de7dc0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x878/0x16a0 kernel/workqueue.c:2243
>  #2: ffff88809e850218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:768 [inline]
>  #2: ffff88809e850218 (&dev->mutex){....}-{3:3}, at: hub_event+0x1b6/0x38f0 drivers/usb/core/hub.c:5522
>  #3: ffff88809749e218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:768 [inline]
>  #3: ffff88809749e218 (&dev->mutex){....}-{3:3}, at: usb_disconnect+0x91/0x8d0 drivers/usb/core/hub.c:2208
>  #4: ffff8880951c01a8 (&dev->mutex){....}-{3:3}, at: device_release_driver_internal+0x23/0x500 drivers/base/dd.c:1141
>  #5: ffffffff8a4f3aa8 (media_devnode_lock){+.+.}-{3:3}, at: media_devnode_unregister+0x1c/0x69 drivers/media/mc/mc-devnode.c:283
> 
> stack backtrace:
> CPU: 1 PID: 28 Comm: kworker/1:1 Not tainted 5.7.0-rc6-next-20200522-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x18f/0x20d lib/dump_stack.c:118
>  print_deadlock_bug kernel/locking/lockdep.c:2391 [inline]
>  check_deadlock kernel/locking/lockdep.c:2432 [inline]
>  validate_chain kernel/locking/lockdep.c:3202 [inline]
>  __lock_acquire.cold+0x240/0x3e2 kernel/locking/lockdep.c:4380
>  lock_acquire+0x1f2/0x8f0 kernel/locking/lockdep.c:4959
>  __mutex_lock_common kernel/locking/mutex.c:956 [inline]
>  __mutex_lock+0x156/0x13c0 kernel/locking/mutex.c:1103
>  media_devnode_release+0x1a/0xe0 drivers/media/mc/mc-devnode.c:53
>  device_release+0x71/0x200 drivers/base/core.c:1541
>  kobject_cleanup lib/kobject.c:701 [inline]
>  kobject_release lib/kobject.c:732 [inline]
>  kref_put include/linux/kref.h:65 [inline]
>  kobject_put+0x1c8/0x2f0 lib/kobject.c:749
>  cdev_device_del+0x69/0x80 fs/char_dev.c:575
>  media_devnode_unregister+0x2b/0x69 drivers/media/mc/mc-devnode.c:285
>  media_device_unregister drivers/media/mc/mc-device.c:846 [inline]
>  media_device_unregister+0x3da/0x570 drivers/media/mc/mc-device.c:800
>  uvc_unregister_video+0x1b6/0x210 drivers/media/usb/uvc/uvc_driver.c:1960
>  uvc_disconnect+0xbc/0x160 drivers/media/usb/uvc/uvc_driver.c:2270
>  usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:436
>  __device_release_driver drivers/base/dd.c:1113 [inline]
>  device_release_driver_internal+0x432/0x500 drivers/base/dd.c:1144
>  bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:533
>  device_del+0x481/0xd30 drivers/base/core.c:2839
>  usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1245
>  usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2217
>  hub_port_connect drivers/usb/core/hub.c:5059 [inline]
>  hub_port_connect_change drivers/usb/core/hub.c:5348 [inline]
>  port_event drivers/usb/core/hub.c:5494 [inline]
>  hub_event+0x17ca/0x38f0 drivers/usb/core/hub.c:5576
>  process_one_work+0x965/0x16a0 kernel/workqueue.c:2268
>  worker_thread+0x96/0xe20 kernel/workqueue.c:2414
>  kthread+0x3b5/0x4a0 kernel/kthread.c:291
>  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:351
> 
> 
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> syzbot can test patches for this bug, for details see:
> https://goo.gl/tpsmEJ#testing-patches
> 


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
