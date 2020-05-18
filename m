Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C26C1D8B42
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 00:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbgERWtV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 18:49:21 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:56930 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727802AbgERWtU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 18:49:20 -0400
Received: by mail-io1-f69.google.com with SMTP id 7so2006157iof.23
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 15:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=s7pJG3kCbjesl2+yw3Ny5oEdOD0W3IyGzcv0S7xrJhM=;
        b=ECCh2nu+d3yUZ+hdn6l1yuNnhDc/tMurkn5p98RnhQkrHem4RFAAXrt05P2AjfUsX6
         0nlOQZz0F/zGwRxwczgfhn7mN8uXQrxnQyclEzsdzJEbC2GRYoqMKCZNTLLxUkX3XG5k
         rnICyEju6Noy1+PTw9NcqckdFken9Rp0TMMY764bWvS2hHl40yHdl3Wk4eV5N5OGNcaN
         HCZfIo0E41eUy9lVWJSYKc3ATcRYAvOhzZCFviE/4SkRSzR/bF0UsOSDYy6LCvsftE5b
         QQ9UGJJIuvTrpirp8CO+7VDpFqY4NdOHXhL0Wr0pMV8dzZc0dnExRih5NbB+2rpwFWaH
         getg==
X-Gm-Message-State: AOAM532SwbJF9OLupeROQirrTsiiGAwtA3U4H7JgLJ+R5+wpripOlftn
        XPhZ3ibjeuNi8TqdBUdHiEWb+trdq98bj8uK8RBFKWUAjY11
X-Google-Smtp-Source: ABdhPJxTNOY/otNKuIWN6DE4p24smH8pkB9L9kKuOxWfH7PMuAvIAfFp5Bh/xKJebEJobEGdI8hkjREJxNwHDhJanxGYxr6quyZO
MIME-Version: 1.0
X-Received: by 2002:a92:8b0a:: with SMTP id i10mr18159399ild.245.1589842158029;
 Mon, 18 May 2020 15:49:18 -0700 (PDT)
Date:   Mon, 18 May 2020 15:49:18 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001413f305a5f3f9ba@google.com>
Subject: KASAN: use-after-free Read in em28xx_release_resources
From:   syzbot <syzbot+83803be25e647b7e40b0@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    806d8acc USB: dummy-hcd: use configurable endpoint naming ..
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=161ad202100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d800e9bad158025f
dashboard link: https://syzkaller.appspot.com/bug?extid=83803be25e647b7e40b0
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+83803be25e647b7e40b0@syzkaller.appspotmail.com

em28xx 2-1:0.63: Closing input extension
==================================================================
BUG: KASAN: use-after-free in media_device_unregister drivers/media/mc/mc-device.c:822 [inline]
BUG: KASAN: use-after-free in media_device_unregister+0x564/0x5d0 drivers/media/mc/mc-device.c:800
Read of size 8 at addr ffff8881ccf74210 by task kworker/1:7/3751

CPU: 1 PID: 3751 Comm: kworker/1:7 Not tainted 5.7.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xef/0x16e lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd3/0x314 mm/kasan/report.c:382
 __kasan_report.cold+0x37/0x92 mm/kasan/report.c:511
 kasan_report+0x33/0x50 mm/kasan/common.c:625
 media_device_unregister drivers/media/mc/mc-device.c:822 [inline]
 media_device_unregister+0x564/0x5d0 drivers/media/mc/mc-device.c:800
 em28xx_unregister_media_device drivers/media/usb/em28xx/em28xx-cards.c:3392 [inline]
 em28xx_release_resources+0xaf/0x254 drivers/media/usb/em28xx/em28xx-cards.c:3413
 em28xx_usb_disconnect.cold+0x18b/0x284 drivers/media/usb/em28xx/em28xx-cards.c:4072
 usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:436
 __device_release_driver drivers/base/dd.c:1110 [inline]
 device_release_driver_internal+0x432/0x500 drivers/base/dd.c:1141
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
 device_del+0x481/0xd30 drivers/base/core.c:2715
 usb_disable_device+0x23d/0x790 drivers/usb/core/message.c:1245
 usb_disconnect+0x293/0x900 drivers/usb/core/hub.c:2216
 hub_port_connect drivers/usb/core/hub.c:5058 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5347 [inline]
 port_event drivers/usb/core/hub.c:5493 [inline]
 hub_event+0x1abf/0x43c0 drivers/usb/core/hub.c:5575
 process_one_work+0x965/0x1630 kernel/workqueue.c:2268
 process_scheduled_works kernel/workqueue.c:2330 [inline]
 worker_thread+0x7ab/0xe20 kernel/workqueue.c:2416
 kthread+0x326/0x430 kernel/kthread.c:268
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:351

The buggy address belongs to the page:
page:ffffea000733dd00 refcount:0 mapcount:-128 mapping:00000000f4330ebd index:0x0
flags: 0x200000000000000()
raw: 0200000000000000 ffffea00071b0808 ffff88821fffabd0 0000000000000000
raw: 0000000000000000 0000000000000002 00000000ffffff7f 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8881ccf74100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff8881ccf74180: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>ffff8881ccf74200: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                         ^
 ffff8881ccf74280: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff8881ccf74300: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
