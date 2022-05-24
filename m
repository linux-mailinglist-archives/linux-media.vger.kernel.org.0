Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEBDD533397
	for <lists+linux-media@lfdr.de>; Wed, 25 May 2022 00:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242438AbiEXWkc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 May 2022 18:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242434AbiEXWka (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 May 2022 18:40:30 -0400
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 792E779802
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 15:40:29 -0700 (PDT)
Received: by mail-il1-f198.google.com with SMTP id r9-20020a92cd89000000b002d16798b3cfso9597840ilb.22
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 15:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=3Wu1WB361cVyVmWaFBDq59Mw0eDvd4l+pFg67au8VgE=;
        b=4da7azfzUprmcAz8+G/R2S54SZdApSW9Y5mv6eQx8sYVUzJ79JO+EEF2a4Z54foXH2
         +e2F0dMKaIyI9CTtEia2acJvNcSqiDOo2TdgAnjqsVIIdea0xIT7n3isBez/Vr49bcNC
         fo4/88EG84S4FDXGvqfWAuY+BCP45pSL2ONL0qDLzpWDcoltqh3p8e/cZD6fdaplvLa7
         EHcSItvM9nMVElbOb9wYTrrk5GudOcBI7bVTHZZihB88UijQLroLbQ1/YksJFI+XWEd3
         0GAaCROSj5jTVYVEtYl4/tbBrrTuybUH1YpcWXLXrXgA0cjIgxBdnrnOH65QlL4fY1XD
         6G6w==
X-Gm-Message-State: AOAM533kUgfAeO+ITH8XvLrUKzrvqZbgl64iBnzGwVSJRHts91YAeDH9
        FCV6AnkqY3AnRjW+ZBTG7hsVmGtYdCNOqgZBAOFzOXQBrH3o
X-Google-Smtp-Source: ABdhPJzSV6nT/ASn4hr8gK9r1/+GtK+/qzh6e8zmFmEYkLIDSP7S5sAPXOiKlM2cs0XqhR9VEbkpIPdiO1AXCM2VVjrChe+pK8SX
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:20e9:b0:2d1:d151:3c53 with SMTP id
 q9-20020a056e0220e900b002d1d1513c53mr1815171ilv.220.1653432028356; Tue, 24
 May 2022 15:40:28 -0700 (PDT)
Date:   Tue, 24 May 2022 15:40:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b5e80405dfc9a4f5@google.com>
Subject: [syzbot] memory leak in dvb_usb_device_init
From:   syzbot <syzbot+f66dd31987e6740657be@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, mudongliangabcd@gmail.com, sean@mess.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    3d7285a335ed Merge tag 'v5.18-p2' of git://git.kernel.org/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13a2f289f00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=50f4d49cdcacc43c
dashboard link: https://syzkaller.appspot.com/bug?extid=f66dd31987e6740657be
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=131c8871f00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f66dd31987e6740657be@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff8881172f1a00 (size 512):
  comm "kworker/0:2", pid 139, jiffies 4294994873 (age 10.960s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff844af012>] dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:75 [inline]
    [<ffffffff844af012>] dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:184 [inline]
    [<ffffffff844af012>] dvb_usb_device_init.cold+0x4e5/0x79e drivers/media/usb/dvb-usb/dvb-usb-init.c:308
    [<ffffffff830db21d>] dib0700_probe+0x8d/0x1b0 drivers/media/usb/dvb-usb/dib0700_core.c:883
    [<ffffffff82d3fdc7>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
    [<ffffffff8274ab37>] call_driver_probe drivers/base/dd.c:542 [inline]
    [<ffffffff8274ab37>] really_probe.part.0+0xe7/0x310 drivers/base/dd.c:621
    [<ffffffff8274ae6c>] really_probe drivers/base/dd.c:583 [inline]
    [<ffffffff8274ae6c>] __driver_probe_device+0x10c/0x1e0 drivers/base/dd.c:752
    [<ffffffff8274af6a>] driver_probe_device+0x2a/0x120 drivers/base/dd.c:782
    [<ffffffff8274b786>] __device_attach_driver+0xf6/0x140 drivers/base/dd.c:899
    [<ffffffff82747c87>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:427
    [<ffffffff8274b352>] __device_attach+0x122/0x260 drivers/base/dd.c:970
    [<ffffffff827498f6>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:487
    [<ffffffff82745cdb>] device_add+0x5fb/0xdf0 drivers/base/core.c:3405
    [<ffffffff82d3d202>] usb_set_configuration+0x8f2/0xb80 drivers/usb/core/message.c:2170
    [<ffffffff82d4dbfc>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<ffffffff82d3f49c>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<ffffffff8274ab37>] call_driver_probe drivers/base/dd.c:542 [inline]
    [<ffffffff8274ab37>] really_probe.part.0+0xe7/0x310 drivers/base/dd.c:621
    [<ffffffff8274ae6c>] really_probe drivers/base/dd.c:583 [inline]
    [<ffffffff8274ae6c>] __driver_probe_device+0x10c/0x1e0 drivers/base/dd.c:752



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
