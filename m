Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2DA296AEE
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 10:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S373096AbgJWIKE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 04:10:04 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:35260 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S370395AbgJWIHS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 04:07:18 -0400
Received: by mail-io1-f71.google.com with SMTP id w16so519312ioa.2
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 01:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=avFdxvuI4d+FtRnDRWKp2wYDjXYib8YQoZplNdzq9xQ=;
        b=L/CeS3GtH1vcnnBoBSnDcrFWs0fepAdSOrEijEDheA7gaRtHr1VVugxRkYBWJ7M82b
         doFEhnRNYaw7RI3pPuS2Sde/vnBA3bkNWIRY9EF9N41iEPySGhbNddxSPxkGWYY+AAxv
         qJ0Waho6gci5p83nsqjmwyi+XB8Zbxv31eTa15eBzQlIqikpUyl7CkmcvczQ2aztI3tg
         3u1NIfvj55RkLUw6UfiAj0+HS28gYyvaZ0bIhVfG7r9Tu3E6qONe9wu6eoJkEJ2fF0l5
         zfNMK0rUi16HcEJSe6oy9uLjV3qWNksBWkWM4VcxVQwJCNlSboUaYkS2u9M/TUnPr+3h
         MbMA==
X-Gm-Message-State: AOAM531cTL58vzNjCxAbJleagt+tphHkvo/t4l9vG04HduMaqEeYKBRY
        g3O5XgMJk+WjDvbcudqVJmRpsTT1UmN6cQLxl0dZT2TwunCd
X-Google-Smtp-Source: ABdhPJyKpvu/aW0887ulwZrOSkGT0WHGTnrZVN79ORXfHN9Ute9jAaDxC6KIUluPJ/VB+XxPIL1XY9xKOvt/1o/74wjpWUBX8g4b
MIME-Version: 1.0
X-Received: by 2002:a92:bbc7:: with SMTP id x68mr821939ilk.290.1603440437505;
 Fri, 23 Oct 2020 01:07:17 -0700 (PDT)
Date:   Fri, 23 Oct 2020 01:07:17 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b2357105b25211a5@google.com>
Subject: KMSAN: uninit-value in dib3000mb_attach (2)
From:   syzbot <syzbot+c88fc0ebe0d5935c70da@syzkaller.appspotmail.com>
To:     glider@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    3351e2b9 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=1249ce95a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=40511ad0c5945201
dashboard link: https://syzkaller.appspot.com/bug?extid=c88fc0ebe0d5935c70da
compiler:       clang version 9.0.0 (/home/glider/llvm/clang 80fee25776c2fb61e74c1ecb1a523375c2500b69)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14f81fb9a00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13577d85a00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c88fc0ebe0d5935c70da@syzkaller.appspotmail.com

dvb-usb: will use the device's hardware PID filter (table count: 16).
dvbdev: DVB: registering new adapter (Grandtec USB1.1 DVB-T)
usb 1-1: media controller created
dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.
dvb-usb: bulk message failed: -22 (6/-30592)
==================================================================
BUG: KMSAN: uninit-value in dib3000mb_attach+0x340/0x450 drivers/media/dvb-frontends/dib3000mb.c:762
CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.2.0-rc4+ #5
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x191/0x1f0 lib/dump_stack.c:113
 kmsan_report+0x162/0x2d0 mm/kmsan/kmsan.c:611
 __msan_warning+0x75/0xe0 mm/kmsan/kmsan_instr.c:304
 dib3000mb_attach+0x340/0x450 drivers/media/dvb-frontends/dib3000mb.c:762
 dibusb_dib3000mb_frontend_attach+0x1af/0x3b0 drivers/media/usb/dvb-usb/dibusb-mb.c:34
 dvb_usb_adapter_frontend_init+0x105/0xa00 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:291
 dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:84 [inline]
 dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:160 [inline]
 dvb_usb_device_init+0x2297/0x2cc0 drivers/media/usb/dvb-usb/dvb-usb-init.c:274
 dibusb_probe+0x75/0x280 drivers/media/usb/dvb-usb/dibusb-mb.c:113
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

Local variable description: ----rb@dib3000_read_reg
Variable was created at:
 dib3000_read_reg+0xdb/0x540 drivers/media/dvb-frontends/dib3000mb.c:58
 dib3000mb_attach+0x17d/0x450 drivers/media/dvb-frontends/dib3000mb.c:762
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
