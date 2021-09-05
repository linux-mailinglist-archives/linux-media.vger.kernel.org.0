Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06851401181
	for <lists+linux-media@lfdr.de>; Sun,  5 Sep 2021 22:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238131AbhIEUX3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Sep 2021 16:23:29 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:41914 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238014AbhIEUX2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Sep 2021 16:23:28 -0400
Received: by mail-io1-f70.google.com with SMTP id s22-20020a5e98160000b02905afde383110so3699257ioj.8
        for <linux-media@vger.kernel.org>; Sun, 05 Sep 2021 13:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=II+59FLqtMznEdE3o2/0rips7/eUPlc7AU99q2eipqQ=;
        b=RXsvGaj3We3pBn1XV1aSO6PW0gwJFLmJQuoWPnIeokbKQRXkzRG+hCrn5boqKbQcRn
         cf1RS0zWYJFYMfUX/hWG//u9Ugy33CeoOTFywCufbv8VqGKmWIhVPQ4i0i+9/SmVLs48
         es0u4z/Ss7V6e1wN2xzARpT3S1IiMeCiEHAHqiMo7GD1y3N9kr0Ty7No8+lVWz3ILh+k
         K53kRdfgDPdjYVIsX6PL7MmBennAuCaKTCBkrlYBNJ92rymAa5459FNVoSc+zZ/fOCEv
         nUIgUgJb62H9UOVsZzh+9/74Hv1vf29R7rNcOCZMIn7JsGtU/0dP973xTtmPDuqlFjRS
         EAmA==
X-Gm-Message-State: AOAM5312hdnq6+ydMBGg+CgUztwvoye47QqOi7+rqjP7kQp4sl0DdDNY
        z8pc1ugek8poqdJ/2/a1n75ehCfV6rXgW0moVilSNGsbXSUu
X-Google-Smtp-Source: ABdhPJwKR559ncBeYJWrQDGC5mOcPwjKzCnUHKYE8PIH4bjQeXosLoHG3/hym29xSFsXbsOQ9UvGFhPDtfW4jrW9yQ/v4F0oa0B9
MIME-Version: 1.0
X-Received: by 2002:a5e:d70a:: with SMTP id v10mr7334472iom.10.1630873344882;
 Sun, 05 Sep 2021 13:22:24 -0700 (PDT)
Date:   Sun, 05 Sep 2021 13:22:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000065419205cb454ac4@google.com>
Subject: [syzbot] KASAN: vmalloc-out-of-bounds Write in tpg_fill_plane_buffer (2)
From:   syzbot <syzbot+272ce7abd8e49c0ddf42@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    f1583cb1be35 Merge tag 'linux-kselftest-next-5.15-rc1' of ..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1495987d300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9c582b69de20dde2
dashboard link: https://syzkaller.appspot.com/bug?extid=272ce7abd8e49c0ddf42
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.1
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14f79ecd300000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1489a4c9300000

Bisection is inconclusive: the issue happens on the oldest tested release.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11c072a5300000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13c072a5300000
console output: https://syzkaller.appspot.com/x/log.txt?x=15c072a5300000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+272ce7abd8e49c0ddf42@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: vmalloc-out-of-bounds in memcpy include/linux/fortify-string.h:191 [inline]
BUG: KASAN: vmalloc-out-of-bounds in tpg_fill_plane_pattern drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2545 [inline]
BUG: KASAN: vmalloc-out-of-bounds in tpg_fill_plane_buffer+0x1325/0x38e0 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2626
Write of size 128 at addr ffffc9000dbe2fe0 by task vivid-001-vid-c/14838

CPU: 0 PID: 14838 Comm: vivid-001-vid-c Not tainted 5.14.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:105
 print_address_description.constprop.0.cold+0xf/0x309 mm/kasan/report.c:256
 __kasan_report mm/kasan/report.c:442 [inline]
 kasan_report.cold+0x83/0xdf mm/kasan/report.c:459
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0x13d/0x180 mm/kasan/generic.c:189
 memcpy+0x39/0x60 mm/kasan/shadow.c:66
 memcpy include/linux/fortify-string.h:191 [inline]
 tpg_fill_plane_pattern drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2545 [inline]
 tpg_fill_plane_buffer+0x1325/0x38e0 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2626
 vivid_fillbuff+0x1ac1/0x3f00 drivers/media/test-drivers/vivid/vivid-kthread-cap.c:469
 vivid_thread_vid_cap_tick+0x88b/0x2360 drivers/media/test-drivers/vivid/vivid-kthread-cap.c:729
 vivid_thread_vid_cap+0x5d2/0xaf0 drivers/media/test-drivers/vivid/vivid-kthread-cap.c:868
 kthread+0x3e5/0x4d0 kernel/kthread.c:319
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295


Memory state around the buggy address:
 ffffc9000dbe2f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc9000dbe2f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffc9000dbe3000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                   ^
 ffffc9000dbe3080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc9000dbe3100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
