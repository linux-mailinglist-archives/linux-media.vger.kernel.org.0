Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12FAC14194F
	for <lists+linux-media@lfdr.de>; Sat, 18 Jan 2020 21:02:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbgARUCL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jan 2020 15:02:11 -0500
Received: from mail-il1-f198.google.com ([209.85.166.198]:46567 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbgARUCL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jan 2020 15:02:11 -0500
Received: by mail-il1-f198.google.com with SMTP id a2so21744232ill.13
        for <linux-media@vger.kernel.org>; Sat, 18 Jan 2020 12:02:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=j5TaLbhFNmTyarqgc7hZ5VnIztWIpdTA2QbSaPuHXxw=;
        b=AziWQpIQcRVrAxGhupVMrgzmnkpHw+E5nImY/VhkgGIEyAgNVV7h5mOuofjQQBboft
         T4UFPUuC96UjYhUxE1Uv5Pcj/7hDXddvpf6/zUqqDcAR7xa3zGhqwcmzuT5p6apJdIaU
         /YgO5QowtaDMCEym2QZG5bBQKfCkC7E9z+ZlK+F7RZxGw9I/Vho9GJAe4W/n2BKPG3Jy
         O1aWzCF/DzeISWURufN5CdLhf30sLl93XS17UixzO5CTMGfeNeGbJ+u/nQoawi/S9Z9z
         b4X1TzYXO9wD8FYDa0Wmn1Nk9NCDdYnesTrPDsGCPDbyQCuh8aHgZR8jM/JSrVWSUsdQ
         YL4g==
X-Gm-Message-State: APjAAAWdIErUlNYPjkfWAG/JHG+5IYdu/IEMKPqZjNDBcalCiEMw5XBa
        wS1YMedSvZD3feDJBspyIY4awSuWalWeY13W5KCsu8aGoWgS
X-Google-Smtp-Source: APXvYqydb2YTWMAH19wg8slSUp3oKFBlkKwyBElLzVi7VDY8c8oQXEZ34ULpQBpRtRjW9H3dTeXAzH1BjGeOzealIAnTDQX91Bvb
MIME-Version: 1.0
X-Received: by 2002:a92:498d:: with SMTP id k13mr4253302ilg.254.1579377730974;
 Sat, 18 Jan 2020 12:02:10 -0800 (PST)
Date:   Sat, 18 Jan 2020 12:02:10 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009ef919059c6f88e7@google.com>
Subject: KASAN: vmalloc-out-of-bounds Write in tpg_fill_plane_buffer
From:   syzbot <syzbot+698def9813b5d6596933@syzkaller.appspotmail.com>
To:     hverkuil-cisco@xs4all.nl, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com, vivek.kasireddy@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    25e73aad Merge tag 'io_uring-5.5-2020-01-16' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1684f959e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d9290aeb7e6cf1c4
dashboard link: https://syzkaller.appspot.com/bug?extid=698def9813b5d6596933
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+698def9813b5d6596933@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: vmalloc-out-of-bounds in memcpy include/linux/string.h:380 [inline]
BUG: KASAN: vmalloc-out-of-bounds in tpg_fill_plane_pattern drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2512 [inline]
BUG: KASAN: vmalloc-out-of-bounds in tpg_fill_plane_buffer+0x10de/0x2f00 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2600
Write of size 360 at addr ffffc90004e52ea0 by task vivid-000-vid-c/28265

CPU: 1 PID: 28265 Comm: vivid-000-vid-c Not tainted 5.5.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x197/0x210 lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0x5/0x30b mm/kasan/report.c:374
 __kasan_report.cold+0x1b/0x41 mm/kasan/report.c:506
 kasan_report+0x12/0x20 mm/kasan/common.c:639
 check_memory_region_inline mm/kasan/generic.c:185 [inline]
 check_memory_region+0x134/0x1a0 mm/kasan/generic.c:192
 memcpy+0x38/0x50 mm/kasan/common.c:126
 memcpy include/linux/string.h:380 [inline]
 tpg_fill_plane_pattern drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2512 [inline]
 tpg_fill_plane_buffer+0x10de/0x2f00 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:2600
 vivid_fillbuff+0x1861/0x3af0 drivers/media/platform/vivid/vivid-kthread-cap.c:468
 vivid_thread_vid_cap_tick+0x8cf/0x2210 drivers/media/platform/vivid/vivid-kthread-cap.c:727
 vivid_thread_vid_cap+0x5d8/0xa60 drivers/media/platform/vivid/vivid-kthread-cap.c:866
 kthread+0x361/0x430 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352


Memory state around the buggy address:
 ffffc90004e52f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc90004e52f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffc90004e53000: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
                   ^
 ffffc90004e53080: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
 ffffc90004e53100: f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9 f9
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
