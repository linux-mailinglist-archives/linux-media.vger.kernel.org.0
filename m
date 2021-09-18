Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6F81410778
	for <lists+linux-media@lfdr.de>; Sat, 18 Sep 2021 17:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239984AbhIRP4q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Sep 2021 11:56:46 -0400
Received: from mail-il1-f200.google.com ([209.85.166.200]:37429 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239977AbhIRP4q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Sep 2021 11:56:46 -0400
Received: by mail-il1-f200.google.com with SMTP id f10-20020a92b50a000000b002412aa49d44so24429671ile.4
        for <linux-media@vger.kernel.org>; Sat, 18 Sep 2021 08:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=XMxetvyBy6RpfXzI/o6mtRK4n4vUfY7++UdwikUvFsw=;
        b=07AoEHSOM9+TiKkSIWkrjwsA5jW3t4d4r6a+zORrMyVMOwRK+Zbpl5I1LL7zfAqZhj
         W5lsd0M1qUxV7fFsQP8qn1XUN52s3tTd9Jz4wCi9BUKJVQgXArd2vYfhIgotMwPfXR1r
         YKJGIJf7Slc+z7xzFBvQkC3U7tOf+HsgkGwfjpQnRDTOdAWC6JPob2146liBRdeN8fG6
         bAvHqqpqQhe0y8T6o2ISVKocNec0vZhlreuUVZ06XNvwDnRHYCQBlF6y3w+M0FYGSY2z
         edW69KbRd4eJcVRzREE6YMHNENgbGJpZcIPV4OhjQYNaImFNG0xTUjtoS5Zxf0lp7IXD
         tOUg==
X-Gm-Message-State: AOAM530348uNL8+hdiOMZ9sonnz7FYdSGkJJ3L+VCSnv2lI+DHslg1Zu
        7TfzFlSryGDxMztzic9ACpSv+540kjfBhs5hme4arib7rf53
X-Google-Smtp-Source: ABdhPJxI/Osky+DPZVWKJ/FxBMXlSNNAWN8E4vrFXWNoBIBvWBo4DYsZeQDGGphRTDLILgtfqQERIw5zLOG1zu4eF+Amf6/OkzUY
MIME-Version: 1.0
X-Received: by 2002:a05:6638:130f:: with SMTP id r15mr251077jad.141.1631980522116;
 Sat, 18 Sep 2021 08:55:22 -0700 (PDT)
Date:   Sat, 18 Sep 2021 08:55:22 -0700
In-Reply-To: <000000000000fe7dd005cc2d77c0@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004d23aa05cc471360@google.com>
Subject: Re: [syzbot] kernel BUG in vmf_insert_pfn_prot
From:   syzbot <syzbot+2d4f8693f438d2bd4bdb@syzkaller.appspotmail.com>
To:     airlied@linux.ie, christian.koenig@amd.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org,
        linaro-mm-sig-owner@lists.linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, sumit.semwal@linaro.org,
        syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has found a reproducer for the following issue on:

HEAD commit:    9004fd387338 Add linux-next specific files for 20210917
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=11e1691d300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=45d5ac72f31f29f3
dashboard link: https://syzkaller.appspot.com/bug?extid=2d4f8693f438d2bd4bdb
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13ad5527300000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13beef77300000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2d4f8693f438d2bd4bdb@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at mm/memory.c:2103!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 6537 Comm: syz-executor894 Not tainted 5.15.0-rc1-next-20210917-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:vmf_insert_pfn_prot+0x248/0x450 mm/memory.c:2103
Code: 0f 0b e8 6b d0 ca ff 4d 89 f7 bf 20 00 00 00 41 83 e7 28 4c 89 fe e8 b7 d5 ca ff 49 83 ff 20 0f 85 a5 fe ff ff e8 48 d0 ca ff <0f> 0b 49 be ff ff ff ff ff ff 0f 00 e8 37 d0 ca ff 4d 21 ee 4c 89
RSP: 0000:ffffc90002c5fbd0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 1ffff9200058bf7c RCX: 0000000000000000
RDX: ffff888014d81c80 RSI: ffffffff81ab3e18 RDI: 0000000000000003
RBP: ffff88806ec18318 R08: 0000000000000020 R09: ffffc90002c5fbb7
R10: ffffffff81ab3e09 R11: 0000000000000000 R12: 0000000020000000
R13: 000000000001a305 R14: 0000000008140476 R15: 0000000000000020
FS:  00007fd624da5700(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020000600 CR3: 000000006e41e000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 drm_gem_shmem_fault+0x1e3/0x290 drivers/gpu/drm/drm_gem_shmem_helper.c:564
 __do_fault+0x10d/0x4d0 mm/memory.c:3848
 do_cow_fault mm/memory.c:4184 [inline]
 do_fault mm/memory.c:4285 [inline]
 handle_pte_fault mm/memory.c:4541 [inline]
 __handle_mm_fault+0x370e/0x5120 mm/memory.c:4676
 handle_mm_fault+0x1c8/0x790 mm/memory.c:4774
 do_user_addr_fault+0x48b/0x11c0 arch/x86/mm/fault.c:1390
 handle_page_fault arch/x86/mm/fault.c:1475 [inline]
 exc_page_fault+0x9e/0x180 arch/x86/mm/fault.c:1531
 asm_exc_page_fault+0x1e/0x30 arch/x86/include/asm/idtentry.h:568
RIP: 0033:0x7fd624db0238
Code: c0 75 63 48 8d 75 0c b9 40 42 0f 00 ba 81 00 00 00 c7 45 0c 01 00 00 00 bf ca 00 00 00 31 c0 e8 0e 2a 04 00 eb 85 0f 1f 40 00 <4c> 89 24 25 00 06 00 20 45 31 c0 31 c9 31 c0 c6 04 25 08 06 00 20
RSP: 002b:00007fd624da5320 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 00007fd624e7b3e8 RCX: 00007fd624df2c59
RDX: 0000000000000000 RSI: 0000000000000080 RDI: 00007fd624e7b3e8
RBP: 00007fd624e7b3e0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 3162662f7665642f
R13: 00007ffe82f363ff R14: 00007fd624da5400 R15: 0000000000022000
Modules linked in:
---[ end trace 0e8bfa618299b282 ]---
RIP: 0010:vmf_insert_pfn_prot+0x248/0x450 mm/memory.c:2103
Code: 0f 0b e8 6b d0 ca ff 4d 89 f7 bf 20 00 00 00 41 83 e7 28 4c 89 fe e8 b7 d5 ca ff 49 83 ff 20 0f 85 a5 fe ff ff e8 48 d0 ca ff <0f> 0b 49 be ff ff ff ff ff ff 0f 00 e8 37 d0 ca ff 4d 21 ee 4c 89
RSP: 0000:ffffc90002c5fbd0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 1ffff9200058bf7c RCX: 0000000000000000
RDX: ffff888014d81c80 RSI: ffffffff81ab3e18 RDI: 0000000000000003
RBP: ffff88806ec18318 R08: 0000000000000020 R09: ffffc90002c5fbb7
R10: ffffffff81ab3e09 R11: 0000000000000000 R12: 0000000020000000
R13: 000000000001a305 R14: 0000000008140476 R15: 0000000000000020
FS:  00007fd624da5700(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f27acc516c0 CR3: 000000006e41e000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

