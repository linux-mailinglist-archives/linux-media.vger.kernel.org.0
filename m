Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0FCF2CBB80
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 12:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388754AbgLBLWg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 06:22:36 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:54129 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388722AbgLBLWf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 06:22:35 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id kQChkDOStN7XgkQCkksfzJ; Wed, 02 Dec 2020 12:21:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606908111; bh=LoEJihX4P6hL0y26mmDuyF1tnmXQBQnwUZ+gidGDkPg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vTkU0UqTEwBFgmr8U3/DMayoNsqvZy0JPb5Lgw1Du1b5bqDyc8VGwBmRtDXYZUIJ9
         N6iFXBoGIHZ9ipqbcKZy4iQgZxmNZ1pcgdJlZmj1xRIVpnqonXGvH+why1Zoxvmc5T
         k72b7FoH810IyZpeBe7FchdNIpjPXKJOqmbWCqoTVWmYhOB44qgF2cMGijZTGbZ7n/
         x4lEFOBj0KI40YovaQ8BkTbBbgBZp3bv8nNordlu6YFKTqrpb6jPP57TW/Z9KGIDij
         RM22Uj6nbbgoOULDC9XtrmGxwtuNTW7KukulTcDLm0WilPmFHoKxzHrPyG39OaJBm1
         GTe9SAYhPdt1g==
Subject: Re: KASAN: use-after-free Read in v4l2_fh_init
To:     Rustam Kovhaev <rkovhaev@gmail.com>, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     andreyknvl@google.com, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, sakari.ailus@linux.intel.com,
        syzkaller-bugs@googlegroups.com, gregkh@linuxfoundation.org
References: <000000000000ec53de0586e309fc@google.com>
 <20201018220117.GA3246571@thinkpad>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f2f1c5b0-f97d-dd94-363a-289141f8da09@xs4all.nl>
Date:   Wed, 2 Dec 2020 12:21:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201018220117.GA3246571@thinkpad>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKQhXrSRFou4VnbYlilNnwCE0jeWNjYUxvTUEDwVdZaNslQRihverrkTZbou1mHO31QyPkGsPsgVEIUD8l+OFx0+XqaiCMxZ0xL4yrYoVO2zVt4aT/te
 ZXT0EV2zfhu+Z7NcNeoBIrPbv7P3w/wM9UXvAN5DD2J1T6DH07WhvjjBufBq9FWxd0aFcI4ih8+w1j7JctU7aQ8X1ZW2s8wbJiFf1oGPw+EBUxnYnL5aV4fo
 MPSZMMn0zxTZpXL2dCtJD+5xAkzr+tpPut/qa1I0CT2RPoJeEH5M7u8YJ32XZY0zTEElpyJxR/3gCGiiK6Jn5y4RRogh9Pyxx02Kp0Cqt5Kqoni6f+StOAOu
 ijQWF6+Pc0sIAUMvKfeFSn5QcOnKFPiacDK1ayqrPZqX839TtIXts4vzhfBp5nrlXIvBvbR9stxWQHwZKRyiwSHnnN1Wubw4laECnC5f0Md2zYEgq6rfIZFE
 3T4hzq81fHaG7+7EqHHxsJ8b9VOPRr2fSrKHZZuwxvGYColiutk6TSutndX37YytZ2hUFP78XRqq7ajUTK1VjSdQboHkfxvr2Ut0naLWIJFUwjeVfkFTuvHv
 qHQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/10/2020 00:01, Rustam Kovhaev wrote:
> On Fri, Apr 19, 2019 at 07:36:05AM -0700, syzbot wrote:
>> Hello,
>>
>> syzbot found the following crash on:
>>
>> HEAD commit:    d34f9519 usb-fuzzer: main usb gadget fuzzer driver
>> git tree:       https://github.com/google/kasan/tree/usb-fuzzer
>> console output: https://syzkaller.appspot.com/x/log.txt?x=125bbb5b200000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=c73d1bb5aeaeae20
>> dashboard link: https://syzkaller.appspot.com/bug?extid=c025d34b8eaa54c571b8
>> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1513ac1d200000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13555c1d200000
>>
>> IMPORTANT: if you fix the bug, please add the following tag to the commit:
>> Reported-by: syzbot+c025d34b8eaa54c571b8@syzkaller.appspotmail.com
>>
>> em28xx 1-1:5.176: failed to create media graph
>> em28xx 1-1:5.176: V4L2 device video32 deregistered
>> em28xx 1-1:5.176: Binding DVB extension
>> ==================================================================
>> em28xx 1-1:5.176: no endpoint for DVB mode and transfer type 0
>> BUG: KASAN: use-after-free in v4l2_fh_init+0x24c/0x290
>> drivers/media/v4l2-core/v4l2-fh.c:33
>> Read of size 8 at addr ffff8880a4f149d0 by task v4l_id/5313
>>
>> CPU: 1 PID: 5313 Comm: v4l_id Not tainted 5.1.0-rc5-319617-gd34f951 #4
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
>> Google 01/01/2011
>> em28xx 1-1:5.176: failed to pre-allocate USB transfer buffers for DVB.
>> Call Trace:
>>  __dump_stack lib/dump_stack.c:77 [inline]
>>  dump_stack+0xe8/0x16e lib/dump_stack.c:113
>>  print_address_description+0x6c/0x236 mm/kasan/report.c:187
>> em28xx 1-1:5.176: Registering input extension
>>  kasan_report.cold+0x1a/0x3c mm/kasan/report.c:317
>>  v4l2_fh_init+0x24c/0x290 drivers/media/v4l2-core/v4l2-fh.c:33
>>  v4l2_fh_open+0x8d/0xd0 drivers/media/v4l2-core/v4l2-fh.c:71
>>  em28xx_v4l2_open+0x11f/0x470 drivers/media/usb/em28xx/em28xx-video.c:2184
>>  v4l2_open+0x1b6/0x360 drivers/media/v4l2-core/v4l2-dev.c:427
>>  chrdev_open+0x220/0x5d0 fs/char_dev.c:417
>>  do_dentry_open+0x49c/0x1130 fs/open.c:777
>>  do_last fs/namei.c:3416 [inline]
>>  path_openat+0x147d/0x40b0 fs/namei.c:3533
>>  do_filp_open+0x1a6/0x280 fs/namei.c:3563
>>  do_sys_open+0x3c5/0x590 fs/open.c:1069
>>  do_syscall_64+0xcf/0x4f0 arch/x86/entry/common.c:290
>>  entry_SYSCALL_64_after_hwframe+0x49/0xbe
>> RIP: 0033:0x7fdb23b8d120
>> Code: 48 8b 15 1b 4d 2b 00 f7 d8 64 89 02 83 c8 ff c3 90 90 90 90 90 90 90
>> 90 90 90 83 3d d5 a4 2b 00 00 75 10 b8 02 00 00 00 0f 05 <48> 3d 01 f0 ff ff
>> 73 31 c3 48 83 ec 08 e8 5e 8c 01 00 48 89 04 24
>> RSP: 002b:00007ffc1aebde18 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
>> RAX: ffffffffffffffda RBX: 00007ffc1aebdf78 RCX: 00007fdb23b8d120
>> RDX: 00007fdb23e42138 RSI: 0000000000000000 RDI: 00007ffc1aebef17
>> RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000400884
>> R13: 00007ffc1aebdf70 R14: 0000000000000000 R15: 0000000000000000
>>
>> Allocated by task 12:
>>  set_track mm/kasan/common.c:87 [inline]
>>  __kasan_kmalloc mm/kasan/common.c:497 [inline]
>>  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:470
>>  kmalloc include/linux/slab.h:547 [inline]
>>  kzalloc include/linux/slab.h:742 [inline]
>>  em28xx_v4l2_init drivers/media/usb/em28xx/em28xx-video.c:2563 [inline]
>>  em28xx_v4l2_init.cold+0x93/0x3112
>> drivers/media/usb/em28xx/em28xx-video.c:2541
>>  em28xx_init_extension+0x13a/0x200
>> drivers/media/usb/em28xx/em28xx-core.c:1128
>>  request_module_async+0x62/0x70 drivers/media/usb/em28xx/em28xx-cards.c:3300
>>  process_one_work+0x90f/0x1580 kernel/workqueue.c:2269
>>  worker_thread+0x9b/0xe20 kernel/workqueue.c:2415
>>  kthread+0x313/0x420 kernel/kthread.c:253
>>  ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352
>>
>> Freed by task 12:
>>  set_track mm/kasan/common.c:87 [inline]
>>  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:459
>>  slab_free_hook mm/slub.c:1429 [inline]
>>  slab_free_freelist_hook+0x5e/0x140 mm/slub.c:1456
>>  slab_free mm/slub.c:3003 [inline]
>>  kfree+0xce/0x280 mm/slub.c:3958
>>  em28xx_free_v4l2 drivers/media/usb/em28xx/em28xx-video.c:2149 [inline]
>>  kref_put include/linux/kref.h:67 [inline]
>>  em28xx_v4l2_init drivers/media/usb/em28xx/em28xx-video.c:2920 [inline]
>>  em28xx_v4l2_init.cold+0x2cf/0x3112
>> drivers/media/usb/em28xx/em28xx-video.c:2541
>>  em28xx_init_extension+0x13a/0x200
>> drivers/media/usb/em28xx/em28xx-core.c:1128
>>  request_module_async+0x62/0x70 drivers/media/usb/em28xx/em28xx-cards.c:3300
>>  process_one_work+0x90f/0x1580 kernel/workqueue.c:2269
>>  worker_thread+0x9b/0xe20 kernel/workqueue.c:2415
>>  kthread+0x313/0x420 kernel/kthread.c:253
>>  ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352
>>
>> The buggy address belongs to the object at ffff8880a4f14200
>>  which belongs to the cache kmalloc-8k of size 8192
>> The buggy address is located 2000 bytes inside of
>>  8192-byte region [ffff8880a4f14200, ffff8880a4f16200)
>> The buggy address belongs to the page:
>> page:ffffea000293c400 count:1 mapcount:0 mapping:ffff88812c3f4400 index:0x0
>> compound_mapcount: 0
>> flags: 0xfff00000010200(slab|head)
>> raw: 00fff00000010200 dead000000000100 dead000000000200 ffff88812c3f4400
>> raw: 0000000000000000 0000000080030003 00000001ffffffff 0000000000000000
>> page dumped because: kasan: bad access detected
>>
>> Memory state around the buggy address:
>>  ffff8880a4f14880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>  ffff8880a4f14900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>> ffff8880a4f14980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>                                                  ^
>>  ffff8880a4f14a00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>  ffff8880a4f14a80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>> ==================================================================
>>
>>
>> ---
>> This bug is generated by a bot. It may contain errors.
>> See https://goo.gl/tpsmEJ for more information about syzbot.
>> syzbot engineers can be reached at syzkaller@googlegroups.com.
>>
>> syzbot will keep track of this bug report. See:
>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>> syzbot can test patches for this bug, for details see:
>> https://goo.gl/tpsmEJ#testing-patches
> 
> in v4l2_open() calling video_get() has no effect when vdev is a nested
> struct inside some driver's struct (em28xx_v4l2 in this case), and referencing
> vdev again, after a call to vdev->fops->open(), might cause UAF if
> the driver's struct has already been freed
> 
> the following patch fixes both syzbot issue with v4l2_fh_init() and side
> issue with v4l2_open() described above:
> https://syzkaller.appspot.com/text?tag=Patch&x=15fbba30500000
> 1. it adds check for already freed struct in em28xx_v4l2_open(), it fixes
> this syzbot UAF report about v4l2_fh_init(), but it moves UAF up to v4l2_open()
> 2. it delays freeing of em28xx_v4l2, hence allows v4l2_open() to
> safely reference vdev and exit without UAF
> 
> fix for #2 does not look great, and it seems that proper fix would
> be changing em28xx driver and having vdev allocated separateley and not
> nested in struct em28xx_v4l2:
> 	struct video_device *vdev 
> instead of:
> 	struct video_device vdev
> and having em28xx utilize video_device_release() instead of
> video_device_release_empty()
> 
> any advice or hints in fixing this would be highly appreciated, tyvm!
> 

What should happen here is that the release() callback of 'struct v4l2_device v4l2_dev'
is set. That release callback is called when the very last filehandle to any of the
video device nodes is closed. I think a release callback that just calls
'kref_put(&v4l2->ref, em28xx_free_v4l2); kref_put(&dev->ref, em28xx_free_device);'
should work.

This driver predates that callback and it was never converted to use it.

Regards,

	Hans
