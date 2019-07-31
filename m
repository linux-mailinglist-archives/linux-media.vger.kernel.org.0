Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85AA17C600
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2019 17:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729666AbfGaPTl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Jul 2019 11:19:41 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:47028 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729464AbfGaPTk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Jul 2019 11:19:40 -0400
Received: by mail-ed1-f65.google.com with SMTP id d4so66094793edr.13;
        Wed, 31 Jul 2019 08:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=eUJ8t2456YLpO+5wsj/zvfqMDj98OQZKV0lfzwF4lOM=;
        b=tfJP8LTraZCnglh0kDKjE7CEi2QBq5FY2I6FmFlrxGtPxIgnvYLDwnTdJN/t1PIC8c
         gC2TQWxLcCKDa4P6hb3CgX4PnJ2MD3JS+81BoLl6SCc9hfKfemMZ1tg0KlCx6VLkIjQb
         PpOpv3gKOO4NI3wFuLFmahVDb/3HpUEZil4v/38gCJdomEBReWEowpcJUo/01v8Yoreu
         /PvtjZ89qP8SPw3o9jn30L9wnej4qYtAVjgacHL9lu9CIfJruJgPQV+lLAIGv6aB68zI
         kGr/RiWSNeM8S8bjOJPMLIkbN0Xqh95X3VGa7W8OXLkIAvaU8F0a+RiwRL4fx1V8fETP
         r5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=eUJ8t2456YLpO+5wsj/zvfqMDj98OQZKV0lfzwF4lOM=;
        b=Dm3aD0BN15aQUO4YgYG4YfMthDrpMF0UdLz1VvESzlPKnXh+LFq7miuHlpCTQf964e
         J14sIw6dVp8zPJig84Q7XSlxPj+bE7JaK0CxWFhPaPeHtuPhI1Y/d9WS6h+R7mpoF3Lh
         /5uN9n6qqVbCiHwDcAMoth/b9aZL3ZmGxYQWNYuVXjah/r6JZF9TuMIcKv3N5wx5VR5P
         50gzA85Oik1bvOePLzZGLET1GipxjjCNtPfovQ5fhHCLpUwy73PbNpAu+00mYycfGVGk
         BdYXXl4jHBNiMzsH4QLdOKaCnlKyHE8et9LjlJiyhrRvzdOYKcUpKo1seQMsGMQovVuN
         rq7Q==
X-Gm-Message-State: APjAAAVKjebdz0+sc3OfcdK1wgEFn2SiVdFugLTlptvq85qNxMGcesFP
        r9P+IidLF16kdqQg9VAFf8Q=
X-Google-Smtp-Source: APXvYqwmhJS7wCt8sv9HpQBTgaLkCzSAW2WgGVTLm6TdVSFvA+J4LevOPVV0vBadE15ibRy3qazgIA==
X-Received: by 2002:a17:906:27c7:: with SMTP id k7mr95478244ejc.91.1564586378071;
        Wed, 31 Jul 2019 08:19:38 -0700 (PDT)
Received: from localhost.localdomain ([130.185.139.210])
        by smtp.gmail.com with ESMTPSA id o22sm17288382edc.37.2019.07.31.08.19.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 08:19:37 -0700 (PDT)
From:   Tomas Bortoli <tomasbortoli@gmail.com>
To:     mchehab@kernel.org
Cc:     gregkh@linuxfoundation.org, tglx@linutronix.de,
        rfontana@redhat.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, syzkaller@googlegroups.com,
        Tomas Bortoli <tomasbortoli@gmail.com>
Subject: [PATCH] media: ttusb-dec: Fix info-leak in ttusb_dec_send_command()
Date:   Wed, 31 Jul 2019 11:19:05 -0400
Message-Id: <20190731151905.9189-1-tomasbortoli@gmail.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function at issue does not always initialize each byte allocated for 'b'
and can therefore leak uninitialized memory to a USB device in the call to usb_bulk_msg()

Use kzalloc() instead of kmalloc()


Signed-off-by: Tomas Bortoli <tomasbortoli@gmail.com>
Reported-by: syzbot+0522702e9d67142379f1@syzkaller.appspotmail.com
---
Crash log:
==================================================================
BUG: KMSAN: kernel-usb-infoleak in usb_submit_urb+0x7ef/0x1f50 drivers/usb/core/urb.c:405
CPU: 1 PID: 3095 Comm: kworker/1:2 Not tainted 5.2.0-rc4+ #10
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x191/0x1f0 lib/dump_stack.c:113
 kmsan_report+0x162/0x2d0 mm/kmsan/kmsan_report.c:109
 kmsan_internal_check_memory+0x974/0xa80 mm/kmsan/kmsan.c:573
 kmsan_handle_urb+0x28/0x40 mm/kmsan/kmsan_hooks.c:617
 usb_submit_urb+0x7ef/0x1f50 drivers/usb/core/urb.c:405
 usb_start_wait_urb+0x143/0x410 drivers/usb/core/message.c:58
 usb_bulk_msg+0x811/0x920 drivers/usb/core/message.c:257
 ttusb_dec_send_command+0x47d/0xd50 drivers/media/usb/ttusb-dec/ttusb_dec.c:345
 ttusb_dec_get_stb_state drivers/media/usb/ttusb-dec/ttusb_dec.c:393 [inline]
 ttusb_dec_init_stb drivers/media/usb/ttusb-dec/ttusb_dec.c:1421 [inline]
 ttusb_dec_probe+0xe31/0x4df0 drivers/media/usb/ttusb-dec/ttusb_dec.c:1680
 usb_probe_interface+0xd19/0x1310 drivers/usb/core/driver.c:361
 really_probe+0x1344/0x1d90 drivers/base/dd.c:513
 driver_probe_device+0x1ba/0x510 drivers/base/dd.c:670
 __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:777
 bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
 __device_attach+0x489/0x750 drivers/base/dd.c:843
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:890
 bus_probe_device+0x131/0x390 drivers/base/bus.c:514
 device_add+0x25b5/0x2df0 drivers/base/core.c:2111
 usb_set_configuration+0x309f/0x3710 drivers/usb/core/message.c:2027
 generic_probe+0xe7/0x280 drivers/usb/core/generic.c:210
 usb_probe_device+0x146/0x200 drivers/usb/core/driver.c:266
 really_probe+0x1344/0x1d90 drivers/base/dd.c:513
 driver_probe_device+0x1ba/0x510 drivers/base/dd.c:670
 __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:777
 bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
 __device_attach+0x489/0x750 drivers/base/dd.c:843
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:890
 bus_probe_device+0x131/0x390 drivers/base/bus.c:514
 device_add+0x25b5/0x2df0 drivers/base/core.c:2111
 usb_new_device+0x23e5/0x2fb0 drivers/usb/core/hub.c:2534
 hub_port_connect drivers/usb/core/hub.c:5089 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
 port_event drivers/usb/core/hub.c:5350 [inline]
 hub_event+0x5853/0x7320 drivers/usb/core/hub.c:5432
 process_one_work+0x1572/0x1f00 kernel/workqueue.c:2269
 worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
 kthread+0x4b5/0x4f0 kernel/kthread.c:256
 ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355
Uninit was created at:
 kmsan_save_stack_with_flags mm/kmsan/kmsan.c:200 [inline]
 kmsan_internal_poison_shadow+0x53/0xa0 mm/kmsan/kmsan.c:159
 kmsan_kmalloc+0xa4/0x130 mm/kmsan/kmsan_hooks.c:178
 kmem_cache_alloc_trace+0x503/0xae0 mm/slub.c:2793
 kmalloc include/linux/slab.h:547 [inline]
 ttusb_dec_send_command+0x155/0xd50 drivers/media/usb/ttusb-dec/ttusb_dec.c:322
 ttusb_dec_get_stb_state drivers/media/usb/ttusb-dec/ttusb_dec.c:393 [inline]
 ttusb_dec_init_stb drivers/media/usb/ttusb-dec/ttusb_dec.c:1421 [inline]
 ttusb_dec_probe+0xe31/0x4df0 drivers/media/usb/ttusb-dec/ttusb_dec.c:1680
 usb_probe_interface+0xd19/0x1310 drivers/usb/core/driver.c:361
 really_probe+0x1344/0x1d90 drivers/base/dd.c:513
 driver_probe_device+0x1ba/0x510 drivers/base/dd.c:670
 __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:777
 bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
 __device_attach+0x489/0x750 drivers/base/dd.c:843
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:890
 bus_probe_device+0x131/0x390 drivers/base/bus.c:514
 device_add+0x25b5/0x2df0 drivers/base/core.c:2111
 usb_set_configuration+0x309f/0x3710 drivers/usb/core/message.c:2027
 generic_probe+0xe7/0x280 drivers/usb/core/generic.c:210
 usb_probe_device+0x146/0x200 drivers/usb/core/driver.c:266
 really_probe+0x1344/0x1d90 drivers/base/dd.c:513
 driver_probe_device+0x1ba/0x510 drivers/base/dd.c:670
 __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:777
 bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
 __device_attach+0x489/0x750 drivers/base/dd.c:843
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:890
 bus_probe_device+0x131/0x390 drivers/base/bus.c:514
 device_add+0x25b5/0x2df0 drivers/base/core.c:2111
 usb_new_device+0x23e5/0x2fb0 drivers/usb/core/hub.c:2534
 hub_port_connect drivers/usb/core/hub.c:5089 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
 port_event drivers/usb/core/hub.c:5350 [inline]
 hub_event+0x5853/0x7320 drivers/usb/core/hub.c:5432
 process_one_work+0x1572/0x1f00 kernel/workqueue.c:2269
 worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
 kthread+0x4b5/0x4f0 kernel/kthread.c:256
 ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355
Bytes 4-63 of 64 are uninitialized
Memory access of size 64 starts at ffff8880ba4efac0
==================================================================

 drivers/media/usb/ttusb-dec/ttusb_dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index 1d0afa340f47..3198f9624b7c 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -319,7 +319,7 @@ static int ttusb_dec_send_command(struct ttusb_dec *dec, const u8 command,
 
 	dprintk("%s\n", __func__);
 
-	b = kmalloc(COMMAND_PACKET_SIZE + 4, GFP_KERNEL);
+	b = kzalloc(COMMAND_PACKET_SIZE + 4, GFP_KERNEL);
 	if (!b)
 		return -ENOMEM;
 
-- 
2.11.0

