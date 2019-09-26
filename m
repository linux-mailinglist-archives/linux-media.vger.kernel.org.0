Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2798BBFACE
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 23:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728815AbfIZVDb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 17:03:31 -0400
Received: from netrider.rowland.org ([192.131.102.5]:51533 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727905AbfIZVDb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 17:03:31 -0400
Received: (qmail 13986 invoked by uid 500); 26 Sep 2019 17:03:30 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 26 Sep 2019 17:03:30 -0400
Date:   Thu, 26 Sep 2019 17:03:30 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
cc:     linux-media@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: general protection fault in usb_set_interface
In-Reply-To: <000000000000cc588d05937a1659@google.com>
Message-ID: <Pine.LNX.4.44L0.1909261637510.29542-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans, Mauro, and other V4L2 maintainers:

The patch tested here (URL listed at the bottom of the syzbot message
below) fixes a couple of bugs in the usbvision driver:

	There are several races between the open, close, and disconnect
	routines (and also vidioc_querycap).

	The driver unregisters its video and radio devices from sysfs
	in the usbvision_release() routine, not in 
	usbvision_disconnect().  (This causes problems when userspace 
	keeps the device open, because by the time the release routine 
	runs, the relevant sysfs directories have already been 
	removed -- drivers in general need to unregister things in 
	their disconnect handlers.)

However, as report below shows, fixing those bugs has revealed an
apparent problem involving reference counting in the V4L2 core.  I
don't understand much about this subsystem, so maybe you can explain
what's going wrong.

The usbvision driver deallocates its private data structure when a
disconnect has occurred and the radio/video device files are closed.  
But in this bug report, the v4l2_release() routine tries to access the
embedded v4l2_device (via video_put) after the structure has been
freed.

Clearly something is wrong, and I can't tell how this is all intended 
to work.  Is the deallocation supposed to occur at a later time?

Any ideas or suggestions?

Alan Stern


On Thu, 26 Sep 2019, syzbot wrote:

> Hello,
> 
> syzbot has tested the proposed patch but the reproducer still triggered  
> crash:
> KASAN: use-after-free Read in v4l2_release
> 
> ==================================================================
> BUG: KASAN: use-after-free in v4l2_release+0x2f1/0x390  
> drivers/media/v4l2-core/v4l2-dev.c:459
> Read of size 4 at addr ffff8881c6e31028 by task v4l_id/2884
> 
> CPU: 1 PID: 2884 Comm: v4l_id Not tainted 5.3.0-rc7+ #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
> Google 01/01/2011
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xca/0x13e lib/dump_stack.c:113
>   print_address_description+0x6a/0x32c mm/kasan/report.c:351
>   __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
>   kasan_report+0xe/0x12 mm/kasan/common.c:618
>   v4l2_release+0x2f1/0x390 drivers/media/v4l2-core/v4l2-dev.c:459
>   __fput+0x2d7/0x840 fs/file_table.c:280
>   task_work_run+0x13f/0x1c0 kernel/task_work.c:113
>   tracehook_notify_resume include/linux/tracehook.h:188 [inline]
>   exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:163
>   prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
>   syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
>   do_syscall_64+0x45f/0x580 arch/x86/entry/common.c:299
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x7fc6c77342b0
> Code: 40 75 0b 31 c0 48 83 c4 08 e9 0c ff ff ff 48 8d 3d c5 32 08 00 e8 c0  
> 07 02 00 83 3d 45 a3 2b 00 00 75 10 b8 03 00 00 00 0f 05 <48> 3d 01 f0 ff  
> ff 73 31 c3 48 83 ec 08 e8 ce 8a 01 00 48 89 04 24
> RSP: 002b:00007ffcea3a5dc8 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
> RAX: 0000000000000000 RBX: 0000000000000003 RCX: 00007fc6c77342b0
> RDX: 0000000000000013 RSI: 0000000080685600 RDI: 0000000000000003
> RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000400884
> R13: 00007ffcea3a5f20 R14: 0000000000000000 R15: 0000000000000000
> 
> Allocated by task 2841:
>   save_stack+0x1b/0x80 mm/kasan/common.c:69
>   set_track mm/kasan/common.c:77 [inline]
>   __kasan_kmalloc mm/kasan/common.c:493 [inline]
>   __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:466
>   kmalloc include/linux/slab.h:552 [inline]
>   kzalloc include/linux/slab.h:748 [inline]
>   usbvision_alloc drivers/media/usb/usbvision/usbvision-video.c:1327 [inline]
>   usbvision_probe.cold+0x586/0x1e56  
> drivers/media/usb/usbvision/usbvision-video.c:1477
>   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
>   really_probe+0x281/0x6d0 drivers/base/dd.c:548
>   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:894
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2165
>   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
>   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
>   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
>   really_probe+0x281/0x6d0 drivers/base/dd.c:548
>   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:894
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2165
>   usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
>   hub_port_connect drivers/usb/core/hub.c:5098 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
>   port_event drivers/usb/core/hub.c:5359 [inline]
>   hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> 
> Freed by task 2884:
>   save_stack+0x1b/0x80 mm/kasan/common.c:69
>   set_track mm/kasan/common.c:77 [inline]
>   __kasan_slab_free+0x130/0x180 mm/kasan/common.c:455
>   slab_free_hook mm/slub.c:1423 [inline]
>   slab_free_freelist_hook mm/slub.c:1474 [inline]
>   slab_free mm/slub.c:3016 [inline]
>   kfree+0xe4/0x2f0 mm/slub.c:3957
>   usbvision_release+0xcf/0x110  
> drivers/media/usb/usbvision/usbvision-video.c:1372
>   usbvision_radio_close.cold+0x2b/0x74  
> drivers/media/usb/usbvision/usbvision-video.c:1142
>   v4l2_release+0x2e7/0x390 drivers/media/v4l2-core/v4l2-dev.c:455
>   __fput+0x2d7/0x840 fs/file_table.c:280
>   task_work_run+0x13f/0x1c0 kernel/task_work.c:113
>   tracehook_notify_resume include/linux/tracehook.h:188 [inline]
>   exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:163
>   prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
>   syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
>   do_syscall_64+0x45f/0x580 arch/x86/entry/common.c:299
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> 
> The buggy address belongs to the object at ffff8881c6e30000
>   which belongs to the cache kmalloc-8k of size 8192
> The buggy address is located 4136 bytes inside of
>   8192-byte region [ffff8881c6e30000, ffff8881c6e32000)
> The buggy address belongs to the page:
> page:ffffea00071b8c00 refcount:1 mapcount:0 mapping:ffff8881da00c500  
> index:0x0 compound_mapcount: 0
> flags: 0x200000000010200(slab|head)
> raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da00c500
> raw: 0000000000000000 0000000080030003 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
> 
> Memory state around the buggy address:
>   ffff8881c6e30f00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffff8881c6e30f80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > ffff8881c6e31000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                                    ^
>   ffff8881c6e31080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffff8881c6e31100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================
> 
> 
> Tested on:
> 
> commit:         f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=1475a74d600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
> dashboard link: https://syzkaller.appspot.com/bug?extid=7fa38a608b1075dfd634
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=148d45d3600000

