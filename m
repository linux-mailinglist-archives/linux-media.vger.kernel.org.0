Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB5624038F
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 10:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgHJIsy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 04:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbgHJIsy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 04:48:54 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE917C061756;
        Mon, 10 Aug 2020 01:48:53 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 0B66FC6389; Mon, 10 Aug 2020 09:48:50 +0100 (BST)
Date:   Mon, 10 Aug 2020 09:48:49 +0100
From:   Sean Young <sean@mess.org>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     syzbot <syzbot+ceef16277388d6f24898@syzkaller.appspotmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: Re: KASAN: use-after-free Read in rc_dev_uevent
Message-ID: <20200810084849.GA8965@gofer.mess.org>
References: <00000000000003dcbd05ac44862c@google.com>
 <20200807091504.GA7397@gofer.mess.org>
 <CAAEAJfDfc_vw15g_5OEG4uX+ynZpZH3M_P16DNFjstwsUnZtCw@mail.gmail.com>
 <20200808092526.GA31150@gofer.mess.org>
 <CAAEAJfDbvX6erE76GpNn-1QP025RWUoW-MARbn1KekPiUbchag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAEAJfDbvX6erE76GpNn-1QP025RWUoW-MARbn1KekPiUbchag@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Aug 09, 2020 at 11:03:28AM -0300, Ezequiel Garcia wrote:
> On Sat, 8 Aug 2020 at 06:25, Sean Young <sean@mess.org> wrote:
> > On Fri, Aug 07, 2020 at 08:45:12PM -0300, Ezequiel Garcia wrote:
> > > On Fri, 7 Aug 2020 at 06:15, Sean Young <sean@mess.org> wrote:
> > > >
> > > > On Fri, Aug 07, 2020 at 12:26:29AM -0700, syzbot wrote:
> > > > > Hello,
> > > > >
> > > > > syzbot found the following issue on:
> > > > >
> > > > > HEAD commit:    7b4ea945 Revert "x86/mm/64: Do not sync vmalloc/ioremap ma..
> > > > > git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > > > > console output: https://syzkaller.appspot.com/x/log.txt?x=11a7813a900000
> > > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=72a84c46d0c668c
> > > > > dashboard link: https://syzkaller.appspot.com/bug?extid=ceef16277388d6f24898
> > > > > compiler:       gcc (GCC) 10.1.0-syz 20200507
> > > > >
> > > > > Unfortunately, I don't have any reproducer for this issue yet.
> > > > >
> > > > > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > > > > Reported-by: syzbot+ceef16277388d6f24898@syzkaller.appspotmail.com
> > > > >
> > > > > ==================================================================
> > > > > BUG: KASAN: use-after-free in string_nocheck lib/vsprintf.c:611 [inline]
> > > > > BUG: KASAN: use-after-free in string+0x39c/0x3d0 lib/vsprintf.c:693
> > > > > Read of size 1 at addr ffff8881ca21cd20 by task systemd-udevd/5147
> > > > >
> > > > > CPU: 1 PID: 5147 Comm: systemd-udevd Not tainted 5.8.0-syzkaller #0
> > > > > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > > > > Call Trace:
> > > > >  __dump_stack lib/dump_stack.c:77 [inline]
> > > > >  dump_stack+0xf6/0x16e lib/dump_stack.c:118
> > > > >  print_address_description.constprop.0+0x1a/0x210 mm/kasan/report.c:383
> > > > >  __kasan_report mm/kasan/report.c:513 [inline]
> > > > >  kasan_report.cold+0x37/0x7c mm/kasan/report.c:530
> > > > >  string_nocheck lib/vsprintf.c:611 [inline]
> > > > >  string+0x39c/0x3d0 lib/vsprintf.c:693
> > > > >  vsnprintf+0x71b/0x14f0 lib/vsprintf.c:2617
> > > > >  add_uevent_var+0x14d/0x310 lib/kobject_uevent.c:664
> > > > >  rc_dev_uevent+0x54/0x140 drivers/media/rc/rc-main.c:1616
> > > > >  dev_uevent+0x30e/0x780 drivers/base/core.c:1916
> > > > >  uevent_show+0x1bb/0x360 drivers/base/core.c:1963
> > > > >  dev_attr_show+0x4b/0x90 drivers/base/core.c:1667
> > > > >  sysfs_kf_seq_show+0x1f8/0x400 fs/sysfs/file.c:60
> > > > >  seq_read+0x432/0x1070 fs/seq_file.c:208
> > > > >  kernfs_fop_read+0xe9/0x590 fs/kernfs/file.c:251
> > > > >  vfs_read+0x1df/0x520 fs/read_write.c:479
> > > > >  ksys_read+0x12d/0x250 fs/read_write.c:607
> > > > >  do_syscall_64+0x2d/0x40 arch/x86/entry/common.c:46
> > > > >  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> > > > > RIP: 0033:0x7f6e6c02f910
> > > > > Code: b6 fe ff ff 48 8d 3d 0f be 08 00 48 83 ec 08 e8 06 db 01 00 66 0f 1f 44 00 00 83 3d f9 2d 2c 00 00 75 10 b8 00 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 de 9b 01 00 48 89 04 24
> > > > > RSP: 002b:00007fff3cddeae8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> > > > > RAX: ffffffffffffffda RBX: 0000558492caaae0 RCX: 00007f6e6c02f910
> > > > > RDX: 0000000000001000 RSI: 0000558492cc7530 RDI: 0000000000000007
> > > > > RBP: 00007f6e6c2ea440 R08: 00007f6e6c2ee298 R09: 0000000000001010
> > > > > R10: 0000558492caaae0 R11: 0000000000000246 R12: 0000000000001000
> > > > > R13: 0000000000000d68 R14: 0000558492cc7530 R15: 00007f6e6c2e9900
> > > >
> > > > This thread is reading the uevent sysfs file, which reads
> > > > rc_dev->map.name, and also rc_dev->device_name, but that is not causing
> > > > problems is this case.
> > > >
> > > > >
> > > > > Allocated by task 5:
> > > > >  save_stack+0x1b/0x40 mm/kasan/common.c:48
> > > > >  set_track mm/kasan/common.c:56 [inline]
> > > > >  __kasan_kmalloc.constprop.0+0xc2/0xd0 mm/kasan/common.c:494
> > > > >  slab_post_alloc_hook mm/slab.h:586 [inline]
> > > > >  slab_alloc_node mm/slub.c:2824 [inline]
> > > > >  slab_alloc mm/slub.c:2832 [inline]
> > > > >  __kmalloc_track_caller+0xec/0x280 mm/slub.c:4430
> > > > >  kstrdup+0x36/0x70 mm/util.c:60
> > > > >  ir_create_table drivers/media/rc/rc-main.c:217 [inline]
> > > > >  ir_setkeytable drivers/media/rc/rc-main.c:477 [inline]
> > > > >  rc_prepare_rx_device drivers/media/rc/rc-main.c:1786 [inline]
> > > > >  rc_register_device+0x464/0x1600 drivers/media/rc/rc-main.c:1914
> > > > >  igorplugusb_probe+0x7e6/0xc98 drivers/media/rc/igorplugusb.c:209
> > > > >  usb_probe_interface+0x315/0x7f0 drivers/usb/core/driver.c:374
> > > > >  really_probe+0x291/0xde0 drivers/base/dd.c:553
> > > > >  driver_probe_device+0x26b/0x3d0 drivers/base/dd.c:738
> > > > >  __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:844
> > > > >  bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:431
> > > > >  __device_attach+0x228/0x4a0 drivers/base/dd.c:912
> > > > >  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
> > > > >  device_add+0xb51/0x1c70 drivers/base/core.c:2930
> > > > >  usb_set_configuration+0xf05/0x18a0 drivers/usb/core/message.c:2032
> > > > >  usb_generic_driver_probe+0xba/0xf2 drivers/usb/core/generic.c:239
> > > > >  usb_probe_device+0xd9/0x250 drivers/usb/core/driver.c:272
> > > > >  really_probe+0x291/0xde0 drivers/base/dd.c:553
> > > > >  driver_probe_device+0x26b/0x3d0 drivers/base/dd.c:738
> > > > >  __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:844
> > > > >  bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:431
> > > > >  __device_attach+0x228/0x4a0 drivers/base/dd.c:912
> > > > >  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
> > > > >  device_add+0xb51/0x1c70 drivers/base/core.c:2930
> > > > >  usb_new_device.cold+0x71d/0xfd4 drivers/usb/core/hub.c:2554
> > > > >  hub_port_connect drivers/usb/core/hub.c:5208 [inline]
> > > > >  hub_port_connect_change drivers/usb/core/hub.c:5348 [inline]
> > > > >  port_event drivers/usb/core/hub.c:5494 [inline]
> > > > >  hub_event+0x2361/0x4390 drivers/usb/core/hub.c:5576
> > > > >  process_one_work+0x94c/0x15f0 kernel/workqueue.c:2269
> > > > >  worker_thread+0x64c/0x1120 kernel/workqueue.c:2415
> > > > >  kthread+0x392/0x470 kernel/kthread.c:292
> > > > >  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
> > > >
> > > > .. this probed the device ..
> > > >
> > > > > Freed by task 5:
> > > > >  save_stack+0x1b/0x40 mm/kasan/common.c:48
> > > > >  set_track mm/kasan/common.c:56 [inline]
> > > > >  kasan_set_free_info mm/kasan/common.c:316 [inline]
> > > > >  __kasan_slab_free+0x116/0x160 mm/kasan/common.c:455
> > > > >  slab_free_hook mm/slub.c:1474 [inline]
> > > > >  slab_free_freelist_hook+0x53/0x140 mm/slub.c:1507
> > > > >  slab_free mm/slub.c:3072 [inline]
> > > > >  kfree+0xbc/0x2c0 mm/slub.c:4052
> > > > >  ir_free_table drivers/media/rc/rc-main.c:245 [inline]
> > > > >  rc_free_rx_device drivers/media/rc/rc-main.c:1875 [inline]
> > > > >  rc_unregister_device+0x142/0x410 drivers/media/rc/rc-main.c:2014
> > > > >  igorplugusb_disconnect+0x58/0x110 drivers/media/rc/igorplugusb.c:232
> > > > >  usb_unbind_interface+0x1d8/0x8d0 drivers/usb/core/driver.c:436
> > > > >  __device_release_driver+0x3c6/0x6f0 drivers/base/dd.c:1153
> > > > >  device_release_driver_internal drivers/base/dd.c:1184 [inline]
> > > > >  device_release_driver+0x26/0x40 drivers/base/dd.c:1207
> > > > >  bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
> > > > >  device_del+0x481/0xd90 drivers/base/core.c:3107
> > > > >  usb_disable_device+0x387/0x930 drivers/usb/core/message.c:1245
> > > > >  usb_disconnect.cold+0x27d/0x780 drivers/usb/core/hub.c:2217
> > > > >  hub_port_connect drivers/usb/core/hub.c:5059 [inline]
> > > > >  hub_port_connect_change drivers/usb/core/hub.c:5348 [inline]
> > > > >  port_event drivers/usb/core/hub.c:5494 [inline]
> > > > >  hub_event+0x1c93/0x4390 drivers/usb/core/hub.c:5576
> > > > >  process_one_work+0x94c/0x15f0 kernel/workqueue.c:2269
> > > > >  process_scheduled_works kernel/workqueue.c:2331 [inline]
> > > > >  worker_thread+0x82b/0x1120 kernel/workqueue.c:2417
> > > > >  kthread+0x392/0x470 kernel/kthread.c:292
> > > > >  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
> > > >
> > > > This unplugged the device, and freed rc_dev->map->name and sets
> > > > it to NULL. There is no locking between the two threads so this is
> > > > a race condition.
> > > >
> > > > I think there are worse, related problems here. For example, iguanair
> > > > driver allocates rc_dev->device_name and frees it in its usb disconnect
> > > > handler. This field is also read by uevent, and not set to null by
> > > > the disconnect handler.
> > > >
> > > > Not sure what the best solution is yet.
> > > >
> > >
> > > All USB drivers (and also any kind of driver that can be hotplugged)
> > > should implement some sort of refcounting, to avoid this kind of
> > > use-after-free issue.
> > >
> > > Drivers can't free memory that may be associated with an open
> > > handle, until you remove the device node.
> >
> > Thank you for trying to be helpful, but I do know all these things; I
> 
> I hope you didn't read my reply as condescending. I was just being
> a bit naive: after seeing your latest patches using the registered boolean
> for sysfs paths I realized that I got confused by seeing rc_unregister_device,
> and not seeing the refcounted rc_dev_release.

Not at all, please don't worry about it!


Sean
