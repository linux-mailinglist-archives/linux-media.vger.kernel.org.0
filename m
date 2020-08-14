Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDF724428D
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 02:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgHNAqT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Aug 2020 20:46:19 -0400
Received: from mail-il1-f198.google.com ([209.85.166.198]:45403 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgHNAqS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Aug 2020 20:46:18 -0400
Received: by mail-il1-f198.google.com with SMTP id 65so5523645ilb.12
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2020 17:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=oaxnNW/Br0LLMOJ1gnBQDMyfBMIIFqJZlMLKTFnUu0o=;
        b=TRu2ayplzqAr6PGzkr+ppdFqa/noqzfDx3JfUS0UaUdiv4/1+INIQL1ObJ3SacbTlb
         /oc1Wcty595x0TzoTKtdMgYxELC5J0EOpQwi1MVehJIUsztQNEC+VPmeYSQt6pkTwh+9
         MBA4EW0zETXh4ZbExazPF+NztelauFq0QfiB1uN9xnSsjQ/LeNCtINM2O1GkrpoiWcI0
         a7xLB/0aJZ9DRhCdh089Xs+Yoe4H4a03UDad0Z/WiKADPl29UjdJl5ICog7GFfipje3W
         1W/3Nv3ZnTXZhbQl/YfuZpR35J/PK2emG9VG4qlIA7OPfu3dAOb3V6nsxdO/x3eIMwWD
         Gbew==
X-Gm-Message-State: AOAM532CMgux+FAVHPybQ9L5iFSiD5C1hvfLQGXhIQ1bZ2hAfzztX/dS
        MtioNG22cvRU6nmlwo5184mzibpMSjmO/fMUUw3QA+78H/UW
X-Google-Smtp-Source: ABdhPJxuz4pG1DV16E3mS5q0aQqyltRwPKU7IIryPXt38yJXXBDKlWhrriq+Srz37wqJFnLs3gRJwG8HSgDSGTlRan/8erXR0JZh
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:134e:: with SMTP id k14mr393810ilr.271.1597365977225;
 Thu, 13 Aug 2020 17:46:17 -0700 (PDT)
Date:   Thu, 13 Aug 2020 17:46:17 -0700
In-Reply-To: <000000000000fc7a3705ac9cf2e7@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a61ed405accbbf76@google.com>
Subject: Re: KMSAN: uninit-value in tda8083_attach
From:   syzbot <syzbot+909a91e75919efd2b557@syzkaller.appspotmail.com>
To:     glider@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has found a reproducer for the following issue on:

HEAD commit:    ce8056d1 wip: changed copy_from_user where instrumented
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=164cd76a900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3afe005fb99591f
dashboard link: https://syzkaller.appspot.com/bug?extid=909a91e75919efd2b557
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=160a9c7a900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=165d7f6a900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+909a91e75919efd2b557@syzkaller.appspotmail.com

usb 1-1: config 0 descriptor??
usb 1-1: selecting invalid altsetting 1
ttusb_init_controller: error
dvbdev: DVB: registering new adapter (Technotrend/Hauppauge Nova-USB)
=====================================================
BUG: KMSAN: uninit-value in tda8083_attach+0x55a/0x6d0 drivers/media/dvb-frontends/tda8083.c:428
CPU: 1 PID: 49 Comm: kworker/1:1 Not tainted 5.8.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:118
 kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:121
 __msan_warning+0x58/0xa0 mm/kmsan/kmsan_instr.c:215
 tda8083_attach+0x55a/0x6d0 drivers/media/dvb-frontends/tda8083.c:428
 frontend_init drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:1574 [inline]
 ttusb_probe+0x4238/0x5040 drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:1739
 usb_probe_interface+0xece/0x1550 drivers/usb/core/driver.c:374
 really_probe+0xf20/0x20b0 drivers/base/dd.c:529
 driver_probe_device+0x293/0x390 drivers/base/dd.c:701
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:807
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x4e2/0x7f0 drivers/base/dd.c:873
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:920
 bus_probe_device+0x177/0x3d0 drivers/base/bus.c:491
 device_add+0x3b0e/0x40d0 drivers/base/core.c:2680
 usb_set_configuration+0x380f/0x3f10 drivers/usb/core/message.c:2032
 usb_generic_driver_probe+0x138/0x300 drivers/usb/core/generic.c:241
 usb_probe_device+0x311/0x490 drivers/usb/core/driver.c:272
 really_probe+0xf20/0x20b0 drivers/base/dd.c:529
 driver_probe_device+0x293/0x390 drivers/base/dd.c:701
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:807
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x4e2/0x7f0 drivers/base/dd.c:873
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:920
 bus_probe_device+0x177/0x3d0 drivers/base/bus.c:491
 device_add+0x3b0e/0x40d0 drivers/base/core.c:2680
 usb_new_device+0x1bd4/0x2a30 drivers/usb/core/hub.c:2554
 hub_port_connect drivers/usb/core/hub.c:5208 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5348 [inline]
 port_event drivers/usb/core/hub.c:5494 [inline]
 hub_event+0x5e7b/0x8a70 drivers/usb/core/hub.c:5576
 process_one_work+0x1688/0x2140 kernel/workqueue.c:2269
 worker_thread+0x10bc/0x2730 kernel/workqueue.c:2415
 kthread+0x551/0x590 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:293

Local variable ----reg1.addr.i.i@tda8083_attach created at:
 tda8083_readregs drivers/media/dvb-frontends/tda8083.c:425 [inline]
 tda8083_readreg drivers/media/dvb-frontends/tda8083.c:83 [inline]
 tda8083_attach+0x1af/0x6d0 drivers/media/dvb-frontends/tda8083.c:428
 tda8083_readregs drivers/media/dvb-frontends/tda8083.c:425 [inline]
 tda8083_readreg drivers/media/dvb-frontends/tda8083.c:83 [inline]
 tda8083_attach+0x1af/0x6d0 drivers/media/dvb-frontends/tda8083.c:428
=====================================================

