Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF1F2F7D4
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 09:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbfE3HRo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 03:17:44 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:40770 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726949AbfE3HRn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 03:17:43 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 46407A0CC356BA3EDF68;
        Thu, 30 May 2019 15:17:41 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Thu, 30 May 2019 15:17:33 +0800
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
To:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Kefeng Wang <wangkefeng.wang@huawei.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH] media: wl128x: Fix some error handling in fm_v4l2_init_video_device()
Date:   Thu, 30 May 2019 15:25:49 +0800
Message-ID: <20190530072549.112280-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The fm_v4l2_init_video_device() forget to unregister v4l2/video device
in the error path, it could lead to UAF issue, eg,

  BUG: KASAN: use-after-free in atomic64_read include/asm-generic/atomic-instrumented.h:836 [inline]
  BUG: KASAN: use-after-free in atomic_long_read include/asm-generic/atomic-long.h:28 [inline]
  BUG: KASAN: use-after-free in __mutex_unlock_slowpath+0x92/0x690 kernel/locking/mutex.c:1206
  Read of size 8 at addr ffff8881e84a7c70 by task v4l_id/3659

  CPU: 1 PID: 3659 Comm: v4l_id Not tainted 5.1.0 #8
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1ubuntu1 04/01/2014
  Call Trace:
   __dump_stack lib/dump_stack.c:77 [inline]
   dump_stack+0xa9/0x10e lib/dump_stack.c:113
   print_address_description+0x65/0x270 mm/kasan/report.c:187
   kasan_report+0x149/0x18d mm/kasan/report.c:317
   atomic64_read include/asm-generic/atomic-instrumented.h:836 [inline]
   atomic_long_read include/asm-generic/atomic-long.h:28 [inline]
   __mutex_unlock_slowpath+0x92/0x690 kernel/locking/mutex.c:1206
   fm_v4l2_fops_open+0xac/0x120 [fm_drv]
   v4l2_open+0x191/0x390 [videodev]
   chrdev_open+0x20d/0x570 fs/char_dev.c:417
   do_dentry_open+0x700/0xf30 fs/open.c:777
   do_last fs/namei.c:3416 [inline]
   path_openat+0x7c4/0x2a90 fs/namei.c:3532
   do_filp_open+0x1a5/0x2b0 fs/namei.c:3563
   do_sys_open+0x302/0x490 fs/open.c:1069
   do_syscall_64+0x9f/0x450 arch/x86/entry/common.c:290
   entry_SYSCALL_64_after_hwframe+0x49/0xbe
  RIP: 0033:0x7f8180c17c8e
  ...
  Allocated by task 3642:
   set_track mm/kasan/common.c:87 [inline]
   __kasan_kmalloc.constprop.3+0xa0/0xd0 mm/kasan/common.c:497
   fm_drv_init+0x13/0x1000 [fm_drv]
   do_one_initcall+0xbc/0x47d init/main.c:901
   do_init_module+0x1b5/0x547 kernel/module.c:3456
   load_module+0x6405/0x8c10 kernel/module.c:3804
   __do_sys_finit_module+0x162/0x190 kernel/module.c:3898
   do_syscall_64+0x9f/0x450 arch/x86/entry/common.c:290
   entry_SYSCALL_64_after_hwframe+0x49/0xbe

  Freed by task 3642:
   set_track mm/kasan/common.c:87 [inline]
   __kasan_slab_free+0x130/0x180 mm/kasan/common.c:459
   slab_free_hook mm/slub.c:1429 [inline]
   slab_free_freelist_hook mm/slub.c:1456 [inline]
   slab_free mm/slub.c:3003 [inline]
   kfree+0xe1/0x270 mm/slub.c:3958
   fm_drv_init+0x1e6/0x1000 [fm_drv]
   do_one_initcall+0xbc/0x47d init/main.c:901
   do_init_module+0x1b5/0x547 kernel/module.c:3456
   load_module+0x6405/0x8c10 kernel/module.c:3804
   __do_sys_finit_module+0x162/0x190 kernel/module.c:3898
   do_syscall_64+0x9f/0x450 arch/x86/entry/common.c:290
   entry_SYSCALL_64_after_hwframe+0x49/0xbe

Add relevant unregister functions to fix it.

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hans.verkuil@cisco.com>
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 drivers/media/radio/wl128x/fmdrv_v4l2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/radio/wl128x/fmdrv_v4l2.c b/drivers/media/radio/wl128x/fmdrv_v4l2.c
index e25fd4d4d280..a1eaea19a81c 100644
--- a/drivers/media/radio/wl128x/fmdrv_v4l2.c
+++ b/drivers/media/radio/wl128x/fmdrv_v4l2.c
@@ -550,6 +550,7 @@ int fm_v4l2_init_video_device(struct fmdev *fmdev, int radio_nr)
 
 	/* Register with V4L2 subsystem as RADIO device */
 	if (video_register_device(&gradio_dev, VFL_TYPE_RADIO, radio_nr)) {
+		v4l2_device_unregister(&fmdev->v4l2_dev);
 		fmerr("Could not register video device\n");
 		return -ENOMEM;
 	}
@@ -563,6 +564,8 @@ int fm_v4l2_init_video_device(struct fmdev *fmdev, int radio_nr)
 	if (ret < 0) {
 		fmerr("(fmdev): Can't init ctrl handler\n");
 		v4l2_ctrl_handler_free(&fmdev->ctrl_handler);
+		video_unregister_device(fmdev->radio_dev);
+		v4l2_device_unregister(&fmdev->v4l2_dev);
 		return -EBUSY;
 	}
 
-- 
2.20.1

