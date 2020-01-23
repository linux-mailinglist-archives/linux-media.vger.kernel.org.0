Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62B9E1467CA
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2020 13:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgAWMUH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jan 2020 07:20:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41640 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgAWMUH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jan 2020 07:20:07 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53C2A2E5;
        Thu, 23 Jan 2020 13:20:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1579782004;
        bh=KS0S74C+5Es7JUWtsilPuRHFWN733L55ph0HVxLpqHY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i9jdhgddanDCQJA6Zc3nf2w3S0iPgVATfRoYu1H4h2uxOIL6RWbOr6hvsRj0ALJF7
         uNbOsZWDofXwDBkgpETkiVaEQdUjATbX0J0LMGb5/Qtig7RtwmZ3J9wGRstvyjUC0t
         0B5a1Awm7OHSTnQpof7w40BDNdQp7qF3rwS0Hl1A=
Date:   Thu, 23 Jan 2020 14:19:47 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hillf Danton <hdanton@sina.com>
Cc:     syzbot <syzbot+75287f75e2fedd69d680@syzkaller.appspotmail.com>,
        andreyknvl@google.com, bnvandana@gmail.com,
        hverkuil-cisco@xs4all.nl, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: KASAN: use-after-free Read in v4l2_release (3)
Message-ID: <20200123121947.GA13922@pendragon.ideasonboard.com>
References: <000000000000de50d7059ba6acd5@google.com>
 <20200123102707.2596-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200123102707.2596-1-hdanton@sina.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hillf,

On Thu, Jan 23, 2020 at 06:27:07PM +0800, Hillf Danton wrote:
> Wed, 22 Jan 2020 14:58:08 -0800 (PST)
> > syzbot has found a reproducer for the following crash on:
> > 
> > HEAD commit:    4cc301ee usb: gadget: add raw-gadget interface
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=17f5a721e00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=9ba75825443d54bd
> > dashboard link: https://syzkaller.appspot.com/bug?extid=75287f75e2fedd69d680
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16a0b6f1e00000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1327dd76e00000
> > 
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+75287f75e2fedd69d680@syzkaller.appspotmail.com
> > 
> > usbvision_set_audio: can't write iopin register for audio switching
> > usbvision_radio_close: Final disconnect
> > ==================================================================
> > BUG: KASAN: use-after-free in v4l2_release+0x2f1/0x390 drivers/media/v4l2-core/v4l2-dev.c:459
> > Read of size 4 at addr ffff8881caba1068 by task v4l_id/1913
> > 
> > CPU: 1 PID: 1913 Comm: v4l_id Not tainted 5.5.0-rc6-syzkaller #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > Call Trace:
> >  __dump_stack lib/dump_stack.c:77 [inline]
> >  dump_stack+0xef/0x16e lib/dump_stack.c:118
> >  print_address_description.constprop.0.cold+0xd3/0x314 mm/kasan/report.c:374
> >  __kasan_report.cold+0x37/0x85 mm/kasan/report.c:506
> >  kasan_report+0xe/0x20 mm/kasan/common.c:639
> >  v4l2_release+0x2f1/0x390 drivers/media/v4l2-core/v4l2-dev.c:459
> >  __fput+0x2d7/0x840 fs/file_table.c:280
> >  task_work_run+0x13f/0x1c0 kernel/task_work.c:113
> >  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
> >  exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:164
> >  prepare_exit_to_usermode arch/x86/entry/common.c:195 [inline]
> >  syscall_return_slowpath arch/x86/entry/common.c:278 [inline]
> >  do_syscall_64+0x4e0/0x5a0 arch/x86/entry/common.c:304
> >  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> > RIP: 0033:0x7fbeb0b822b0
> > Code: 40 75 0b 31 c0 48 83 c4 08 e9 0c ff ff ff 48 8d 3d c5 32 08 00 e8 c0 07 02 00 83 3d 45 a3 2b 00 00 75 10 b8 03 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 ce 8a 01 00 48 89 04 24
> > RSP: 002b:00007ffe52d6b158 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
> > RAX: 0000000000000000 RBX: 0000000000000003 RCX: 00007fbeb0b822b0
> > RDX: 0000000000000013 RSI: 0000000080685600 RDI: 0000000000000003
> > RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> > R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000400884
> > R13: 00007ffe52d6b2b0 R14: 0000000000000000 R15: 0000000000000000
> > 
> > Allocated by task 94:
> >  save_stack+0x1b/0x80 mm/kasan/common.c:72
> >  set_track mm/kasan/common.c:80 [inline]
> >  __kasan_kmalloc mm/kasan/common.c:513 [inline]
> >  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:486
> >  kmalloc include/linux/slab.h:556 [inline]
> >  kzalloc include/linux/slab.h:670 [inline]
> >  usbvision_alloc drivers/media/usb/usbvision/usbvision-video.c:1315 [inline]
> >  usbvision_probe.cold+0x5c5/0x1f21 drivers/media/usb/usbvision/usbvision-video.c:1469
> >  usb_probe_interface+0x310/0x800 drivers/usb/core/driver.c:361
> >  really_probe+0x290/0xad0 drivers/base/dd.c:548
> >  driver_probe_device+0x223/0x350 drivers/base/dd.c:721
> >  __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:828
> >  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
> >  __device_attach+0x217/0x390 drivers/base/dd.c:894
> >  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
> >  device_add+0x1459/0x1bf0 drivers/base/core.c:2487
> >  usb_set_configuration+0xe47/0x17d0 drivers/usb/core/message.c:2023
> >  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
> >  usb_probe_device+0xaf/0x140 drivers/usb/core/driver.c:266
> >  really_probe+0x290/0xad0 drivers/base/dd.c:548
> >  driver_probe_device+0x223/0x350 drivers/base/dd.c:721
> >  __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:828
> >  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
> >  __device_attach+0x217/0x390 drivers/base/dd.c:894
> >  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
> >  device_add+0x1459/0x1bf0 drivers/base/core.c:2487
> >  usb_new_device.cold+0x540/0xcd0 drivers/usb/core/hub.c:2537
> >  hub_port_connect drivers/usb/core/hub.c:5184 [inline]
> >  hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
> >  port_event drivers/usb/core/hub.c:5470 [inline]
> >  hub_event+0x21cb/0x4300 drivers/usb/core/hub.c:5552
> >  process_one_work+0x945/0x15c0 kernel/workqueue.c:2264
> >  process_scheduled_works kernel/workqueue.c:2326 [inline]
> >  worker_thread+0x7ab/0xe20 kernel/workqueue.c:2412
> >  kthread+0x318/0x420 kernel/kthread.c:255
> >  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> > 
> > Freed by task 1913:
> >  save_stack+0x1b/0x80 mm/kasan/common.c:72
> >  set_track mm/kasan/common.c:80 [inline]
> >  kasan_set_free_info mm/kasan/common.c:335 [inline]
> >  __kasan_slab_free+0x117/0x160 mm/kasan/common.c:474
> >  slab_free_hook mm/slub.c:1425 [inline]
> >  slab_free_freelist_hook mm/slub.c:1458 [inline]
> >  slab_free mm/slub.c:3005 [inline]
> >  kfree+0xd5/0x300 mm/slub.c:3957
> >  usbvision_release+0x181/0x1c0 drivers/media/usb/usbvision/usbvision-video.c:1364
> >  usbvision_radio_close.cold+0x2b/0x74 drivers/media/usb/usbvision/usbvision-video.c:1130
> >  v4l2_release+0x2e7/0x390 drivers/media/v4l2-core/v4l2-dev.c:455
> >  __fput+0x2d7/0x840 fs/file_table.c:280
> >  task_work_run+0x13f/0x1c0 kernel/task_work.c:113
> >  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
> >  exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:164
> >  prepare_exit_to_usermode arch/x86/entry/common.c:195 [inline]
> >  syscall_return_slowpath arch/x86/entry/common.c:278 [inline]
> >  do_syscall_64+0x4e0/0x5a0 arch/x86/entry/common.c:304
> >  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> > 
> > The buggy address belongs to the object at ffff8881caba0000
> >  which belongs to the cache kmalloc-8k of size 8192
> > The buggy address is located 4200 bytes inside of
> >  8192-byte region [ffff8881caba0000, ffff8881caba2000)
> > The buggy address belongs to the page:
> > page:ffffea00072ae800 refcount:1 mapcount:0 mapping:ffff8881da00c500 index:0x0 compound_mapcount: 0
> > raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da00c500
> > raw: 0000000000000000 0000000080020002 00000001ffffffff 0000000000000000
> > page dumped because: kasan: bad access detected
> > 
> > Memory state around the buggy address:
> >  ffff8881caba0f00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >  ffff8881caba0f80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > >ffff8881caba1000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >                                                           ^
> >  ffff8881caba1080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >  ffff8881caba1100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > ==================================================================
> 
> 
> Add the release callback for usbvision video device and use it to release
> resources when the last reference to the device goes away.

Would you be able to submit this with a commit message and your
Signed-off-by line ?

> --- a/drivers/media/usb/usbvision/usbvision-video.c
> +++ b/drivers/media/usb/usbvision/usbvision-video.c
> @@ -401,7 +401,6 @@ static int usbvision_v4l2_close(struct f
>  
>  	if (r) {
>  		printk(KERN_INFO "%s: Final disconnect\n", __func__);
> -		usbvision_release(usbvision);
>  		return 0;
>  	}
>  
> @@ -409,6 +408,11 @@ static int usbvision_v4l2_close(struct f
>  	return v4l2_fh_release(file);
>  }
>  
> +static void usbvision_video_device_release(struct video_device *vdev)
> +{
> +	struct usb_usbvision *usbvision = video_get_drvdata(vdev);
> +	usbvision_release(usbvision);
> +}
>  
>  /*
>   * usbvision_ioctl()
> @@ -1181,7 +1185,7 @@ static struct video_device usbvision_vid
>  	.fops		= &usbvision_fops,
>  	.ioctl_ops	= &usbvision_ioctl_ops,
>  	.name           = "usbvision-video",
> -	.release	= video_device_release_empty,
> +	.release	= usbvision_video_device_release,
>  	.tvnorms        = USBVISION_NORMS,
>  };
>  
> --- a/drivers/media/v4l2-core/v4l2-dev.c
> +++ b/drivers/media/v4l2-core/v4l2-dev.c
> @@ -206,7 +206,10 @@ static void v4l2_device_release(struct d
>  	}
>  #endif
>  
> -	/* Do not call v4l2_device_put if there is no release callback set.
> +	/*
> +	 * Decrease v4l2_device refcount
> +	 *
> +	 * Do not call v4l2_device_put if there is no release callback set.
>  	 * Drivers that have no v4l2_device release callback might free the
>  	 * v4l2_dev instance in the video_device release callback below, so we
>  	 * must perform this check here.
> @@ -214,16 +217,12 @@ static void v4l2_device_release(struct d
>  	 * TODO: In the long run all drivers that use v4l2_device should use the
>  	 * v4l2_device release callback. This check will then be unnecessary.
>  	 */
> -	if (v4l2_dev->release == NULL)
> -		v4l2_dev = NULL;
> +	if (v4l2_dev->release)
> +		v4l2_device_put(v4l2_dev);
>  
>  	/* Release video_device and perform other
>  	   cleanups as needed. */
>  	vdev->release(vdev);
> -
> -	/* Decrease v4l2_device refcount */
> -	if (v4l2_dev)
> -		v4l2_device_put(v4l2_dev);
>  }
>  
>  static struct class video_class = {

-- 
Regards,

Laurent Pinchart
