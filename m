Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD2D630CA14
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 19:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238518AbhBBSiK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 13:38:10 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:44646 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234494AbhBBSfg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 13:35:36 -0500
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1l70Vp-003peC-0L
        for linux-media@vger.kernel.org; Tue, 02 Feb 2021 19:34:53 +0100
Date:   Tue, 2 Feb 2021 19:34:52 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     linux-media@vger.kernel.org
Subject: Philips SPC 900NC: kernel/dma/mapping.c WARNING
Message-ID: <YBmbTHGSWSbcH0mQ@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Folks

My pwc: Philips SPC 900NC USB webcam broke with the Debian v5.10
kernel. It worked fine with the Debian v5.9 kernel. Plain 5.11-rc6 is
also broken in the same way:

[   61.314999] ------------[ cut here ]------------
[   61.315002] WARNING: CPU: 2 PID: 3057 at kernel/dma/mapping.c:149 dma_map_page_attrs+0x141/0x200
[   61.315099] CPU: 2 PID: 3057 Comm: v4l2src0:src Tainted: G            E     5.11.0-rc6 #1
[   61.315101] Hardware name: Shuttle Inc. SH87R/FH87, BIOS 1.02 06/26/2013
[   61.315102] RIP: 0010:dma_map_page_attrs+0x141/0x200
[   61.315104] Code: 89 c8 4c 89 df e8 9f 22 00 00 49 89 c2 eb 8c 48 85 c0 74 0c 48 39 d8 48 0f 47 c3 e9 76 ff ff ff 48 89 d8 e9 6e ff ff ff 0f 0b <0f> 0b 49 c7 c2 ff ff ff ff e9 63 ff ff ff 49 89 f2 4c 2b 50 18 e9
[   61.315106] RSP: 0018:ffffbcae81ef3cb0 EFLAGS: 00010246
[   61.315107] RAX: 0000000000000000 RBX: ffff9aa43e935e00 RCX: 0000000000000002
[   61.315109] RDX: 0000000000002580 RSI: ffffe52c85e96200 RDI: ffff9aa6099100a0
[   61.315110] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[   61.315110] R10: 0000000000000000 R11: ffff9aa6099100a0 R12: ffff9aa609910000
[   61.315111] R13: ffff9aa3fa588000 R14: ffff9aa387f40000 R15: 0000000000000000
[   61.315112] FS:  00007f7f16ffd700(0000) GS:ffff9aaa9fc80000(0000) knlGS:0000000000000000
[   61.315114] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   61.315115] CR2: 00007f150019cfb8 CR3: 0000000118960006 CR4: 00000000001706e0
[   61.315116] Call Trace:
[   61.315121]  start_streaming+0x28b/0x490 [pwc]
[   61.315126]  vb2_start_streaming+0x63/0x100 [videobuf2_common]
[   61.315132]  vb2_core_streamon+0x54/0xb0 [videobuf2_common]
[   61.315135]  __video_do_ioctl+0x39e/0x3d0 [videodev]
[   61.315152]  video_usercopy+0x19b/0x6e0 [videodev]
[   61.315159]  ? v4l_print_control+0x20/0x20 [videodev]
[   61.315166]  v4l2_ioctl+0x48/0x50 [videodev]
[   61.315172]  __x64_sys_ioctl+0x83/0xb0
[   61.315176]  do_syscall_64+0x33/0x80
[   61.315179]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   61.315182] RIP: 0033:0x7f7f5b7bacc7
[   61.315184] Code: 00 00 00 48 8b 05 c9 91 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 99 91 0c 00 f7 d8 64 89 01 48
[   61.315186] RSP: 002b:00007f7f16ffc848 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[   61.315187] RAX: ffffffffffffffda RBX: 00005577ed87ef70 RCX: 00007f7f5b7bacc7
[   61.315188] RDX: 00005577ed8ebd10 RSI: 0000000040045612 RDI: 0000000000000019
[   61.315189] RBP: 00005577ed8ebd00 R08: 0000000000000008 R09: 0000000000000000
[   61.315190] R10: 00005577ed992ec0 R11: 0000000000000246 R12: 0000000000000000
[   61.315190] R13: 00007f7f0800fec0 R14: 0000000000000004 R15: 0000000000000001
[   61.315192] ---[ end trace a19ebd2ccc8ab0f7 ]---
[   61.315194] pwc: Failed to allocate urb buffer 0
[   61.489610] pwc: Failed to allocate urb buffer 0

Before i start a git bisect, anybody have any ideas?  Have other media
drivers had the same problem recently?

Thanks
	Andrew
