Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6B314856E
	for <lists+linux-media@lfdr.de>; Fri, 24 Jan 2020 13:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387994AbgAXMyE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jan 2020 07:54:04 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:42231 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387559AbgAXMyD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jan 2020 07:54:03 -0500
Received: by mail-il1-f199.google.com with SMTP id c5so1446483ilo.9
        for <linux-media@vger.kernel.org>; Fri, 24 Jan 2020 04:54:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=37DnHe8ofxjxgHB//lHANRdEDN8gOWB1O7s+JZGwEiY=;
        b=GPJe7DLs6v1AJvs5+WfIzacefjAww0O9W02zBa/74pccO3kZ2b6Dd1C2GBNzGcq+be
         Lt8WHkv9S3K2rEkGvgvW79lWHxaFmNxG8kzRxE3dSBauoJ2NFPMroKc+BzMHzw8Ovb+w
         lvl5HMKRrGS+A2wDiKRJU/TJm09DLFEz/yFIw+Cfss/5qksaJOKq28/lRVCmkZkMn30I
         YeII/XJJ+YTIYmIyf3hI+ZE6ibAnv/aPW7UvLTYNr/sYOP+Lu6oeaobozMMkj9/i0R+9
         HUKE6gcRHpYkxBKZ453GCKifWx2bs47OR97k9dv9/cHh1bM7nSqhOwpiMYUug6secbQE
         6kCg==
X-Gm-Message-State: APjAAAXt3JJIg1xZNlXO9FhGDNYsa6NQUTjF5o6mQvY0qJBuXlA99Jhw
        4Ng5a4ChPo0PGTLJuglW3/zz0MhQY7uLMeyTudTJiVl9iuzW
X-Google-Smtp-Source: APXvYqz/hMYvG1nydnnU7Hb3i/y0X5oIx63T3wtDOB6iSu/Hgch9G3vdKnVe/Gf7+Rb5GIs7sb178IxwEbe73EcJkLESuBieVF+H
MIME-Version: 1.0
X-Received: by 2002:a92:8847:: with SMTP id h68mr1400708ild.212.1579870443103;
 Fri, 24 Jan 2020 04:54:03 -0800 (PST)
Date:   Fri, 24 Jan 2020 04:54:03 -0800
In-Reply-To: <CAAeHK+whRFCF9WzUr55MoMiFsn83Ykr9jGGUFE4CTKVbBsZu6Q@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008d6b69059ce24053@google.com>
Subject: Re: KASAN: use-after-free Read in v4l2_release (3)
From:   syzbot <syzbot+75287f75e2fedd69d680@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, bnvandana@gmail.com, hans.verkuil@cisco.com,
        hdanton@sina.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer still triggered crash:
WARNING in kernfs_remove_by_name_ns

------------[ cut here ]------------
kernfs: can not remove 'version', no directory
WARNING: CPU: 1 PID: 94 at fs/kernfs/dir.c:1507 kernfs_remove_by_name_ns+0x98/0xb0 fs/kernfs/dir.c:1507
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 94 Comm: kworker/1:2 Not tainted 5.5.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xef/0x16e lib/dump_stack.c:118
 panic+0x2aa/0x6e1 kernel/panic.c:221
 __warn.cold+0x2f/0x30 kernel/panic.c:582
 report_bug+0x27b/0x2f0 lib/bug.c:195
 fixup_bug arch/x86/kernel/traps.c:174 [inline]
 fixup_bug arch/x86/kernel/traps.c:169 [inline]
 do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:267
 do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:286
 invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1027
RIP: 0010:kernfs_remove_by_name_ns+0x98/0xb0 fs/kernfs/dir.c:1507
Code: b1 ff 48 c7 c7 20 13 1d 87 41 bc fe ff ff ff e8 2e fe fe 03 eb d9 e8 47 4d b1 ff 4c 89 e6 48 c7 c7 c0 51 f1 85 e8 20 33 86 ff <0f> 0b 41 bc fe ff ff ff eb bb 0f 1f 40 00 66 2e 0f 1f 84 00 00 00
RSP: 0018:ffff8881d5d47708 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffff8881cba58390 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff812959ad RDI: ffffed103aba8ed3
RBP: 0000000000000000 R08: ffff8881d6d2c980 R09: fffffbfff1269aae
R10: fffffbfff1269aad R11: ffffffff8934d56f R12: ffffffff8671eb40
R13: 0000000000000000 R14: 0000000000000000 R15: 000000000000000c
 sysfs_remove_file include/linux/sysfs.h:536 [inline]
 device_remove_file+0x25/0x30 drivers/base/core.c:1869
 usbvision_remove_sysfs drivers/media/usb/usbvision/usbvision-video.c:287 [inline]
 usbvision_release+0x88/0x1c0 drivers/media/usb/usbvision/usbvision-video.c:1360
 v4l2_device_release+0x29a/0x3e0 drivers/media/v4l2-core/v4l2-dev.c:225
 device_release+0x71/0x200 drivers/base/core.c:1358
 kobject_cleanup lib/kobject.c:693 [inline]
 kobject_release lib/kobject.c:722 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x256/0x550 lib/kobject.c:739
 put_device drivers/base/core.c:2586 [inline]
 device_unregister+0x34/0xc0 drivers/base/core.c:2697
 video_unregister_device+0xa2/0xc0 drivers/media/v4l2-core/v4l2-dev.c:1075
 usbvision_unregister_video drivers/media/usb/usbvision/usbvision-video.c:1255 [inline]
 usbvision_unregister_video+0xfb/0x120 drivers/media/usb/usbvision/usbvision-video.c:1242
 usbvision_release+0x10d/0x1c0 drivers/media/usb/usbvision/usbvision-video.c:1361
 usbvision_disconnect+0x171/0x1e0 drivers/media/usb/usbvision/usbvision-video.c:1593
 usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
 __device_release_driver drivers/base/dd.c:1134 [inline]
 device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1165
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:532
 device_del+0x481/0xd30 drivers/base/core.c:2664
 usb_disable_device+0x23d/0x790 drivers/usb/core/message.c:1237
 usb_disconnect+0x293/0x900 drivers/usb/core/hub.c:2200
 hub_port_connect drivers/usb/core/hub.c:5035 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
 port_event drivers/usb/core/hub.c:5470 [inline]
 hub_event+0x1a1d/0x4300 drivers/usb/core/hub.c:5552
 process_one_work+0x945/0x15c0 kernel/workqueue.c:2264
 worker_thread+0x96/0xe20 kernel/workqueue.c:2410
 kthread+0x318/0x420 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Kernel Offset: disabled
Rebooting in 86400 seconds..


Tested on:

commit:         ae179410 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=133b3611e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ad1d751a3a72ae57
dashboard link: https://syzkaller.appspot.com/bug?extid=75287f75e2fedd69d680
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15921b69e00000

