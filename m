Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95B414AAC6E
	for <lists+linux-media@lfdr.de>; Sat,  5 Feb 2022 21:18:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381110AbiBEUSZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Feb 2022 15:18:25 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:52014 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377367AbiBEUSX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Feb 2022 15:18:23 -0500
Received: by mail-io1-f70.google.com with SMTP id h1-20020a056602008100b0061152382337so6033642iob.18
        for <linux-media@vger.kernel.org>; Sat, 05 Feb 2022 12:18:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=//IpWN0Kyb3zdaJDZWQVUdBv0C1amCkj+8BKi6AK2E8=;
        b=cG7ImB1FM8IbHVY8Z67b/padkzfC4rzYyFXYR4hKu+38st9wwvLERYc/t55j1y+maA
         fUkUr8KDZgNe9nflGLZKVj6I4PoWlEtUnKz/Rh6jsfDicM+OmnA1EOHWgRF3dcU5Kb/e
         h8KiXJgFqF4upAf3naybygiS1J4T0D7vGGoH6AjVVjnNQguDP6JT+DlmDnxPHzBthWB8
         M7Gq9r9JvRmEKWwsClHOxFd1Cerqce1lXjawiP+lxD3jz4OU4I9UR/3h5eZDLjUbZLuQ
         KiJFydIjL3vb1IWqk5buIia+rEgLcAXlQBY0Hw1fVUcT6EAA5VwcejcP7Wf0JdBVyuZt
         rBNQ==
X-Gm-Message-State: AOAM531aXWkfbYAvThva7kNVuK3jPgMnROX1IAxtRlowB/d/u2fn5/uF
        f+Dh29t7u+nqLxOps7YrnsbtUbXhdLF4fMK0pz9SjZF+5PP1
X-Google-Smtp-Source: ABdhPJzhnyzMxtbaHXNJiT1k74YVxhCWjxXPME4lFoT8tI7K+SyNyfciNozxXMu79sQ46O/u0++E7iSm/HIuYe/CYp/FV8FIddR+
MIME-Version: 1.0
X-Received: by 2002:a05:6638:389a:: with SMTP id b26mr2580834jav.158.1644092303434;
 Sat, 05 Feb 2022 12:18:23 -0800 (PST)
Date:   Sat, 05 Feb 2022 12:18:23 -0800
In-Reply-To: <000000000000f0196305d219b2fe@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b968f305d74b1195@google.com>
Subject: Re: [syzbot] WARNING in __dma_map_sg_attrs
From:   syzbot <syzbot+10e27961f4da37c443b2@syzkaller.appspotmail.com>
To:     christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        hch@lst.de, iommu@lists.linux-foundation.org,
        linaro-mm-sig-owner@lists.linaro.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, m.szyprowski@samsung.com,
        robin.murphy@arm.com, sumit.semwal@linaro.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot has found a reproducer for the following issue on:

HEAD commit:    0457e5153e0e Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11b2637c700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6f043113811433a5
dashboard link: https://syzkaller.appspot.com/bug?extid=10e27961f4da37c443b2
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11c65542700000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1163f480700000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+10e27961f4da37c443b2@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 3595 at kernel/dma/mapping.c:188 __dma_map_sg_attrs+0x181/0x1f0 kernel/dma/mapping.c:188
Modules linked in:
CPU: 0 PID: 3595 Comm: syz-executor249 Not tainted 5.17.0-rc2-syzkaller-00316-g0457e5153e0e #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__dma_map_sg_attrs+0x181/0x1f0 kernel/dma/mapping.c:188
Code: 00 00 00 00 00 fc ff df 48 c1 e8 03 80 3c 10 00 75 71 4c 8b 3d c0 83 b5 0d e9 db fe ff ff e8 b6 0f 13 00 0f 0b e8 af 0f 13 00 <0f> 0b 45 31 e4 e9 54 ff ff ff e8 a0 0f 13 00 49 8d 7f 50 48 b8 00
RSP: 0018:ffffc90002a07d68 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffff88807e25e2c0 RSI: ffffffff81649e91 RDI: ffff88801b848408
RBP: ffff88801b848000 R08: 0000000000000002 R09: ffff88801d86c74f
R10: ffffffff81649d72 R11: 0000000000000001 R12: 0000000000000002
R13: ffff88801d86c680 R14: 0000000000000001 R15: 0000000000000000
FS:  0000555556e30300(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000200000cc CR3: 000000001d74a000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 dma_map_sgtable+0x70/0xf0 kernel/dma/mapping.c:264
 get_sg_table.isra.0+0xe0/0x160 drivers/dma-buf/udmabuf.c:72
 begin_cpu_udmabuf+0x130/0x1d0 drivers/dma-buf/udmabuf.c:126
 dma_buf_begin_cpu_access+0xfd/0x1d0 drivers/dma-buf/dma-buf.c:1164
 dma_buf_ioctl+0x259/0x2b0 drivers/dma-buf/dma-buf.c:363
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl fs/ioctl.c:860 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f62fcf530f9
Code: 28 c3 e8 2a 14 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe3edab9b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f62fcf530f9
RDX: 0000000020000200 RSI: 0000000040086200 RDI: 0000000000000006
RBP: 00007f62fcf170e0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f62fcf17170
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>

