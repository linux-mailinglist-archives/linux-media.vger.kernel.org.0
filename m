Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32C942DEFF8
	for <lists+linux-media@lfdr.de>; Sat, 19 Dec 2020 15:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbgLSOJM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Dec 2020 09:09:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:37042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726484AbgLSOJL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Dec 2020 09:09:11 -0500
X-Gm-Message-State: AOAM530TtgSoTXLhbJ7Ij6Vk5upb6bye3hQNj4SCwCdiIkZzB6DMHhJS
        KqtXnxBMmr9yf3hid8IGvXCd2rWg+sSkXjfjxXE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608386911;
        bh=GCNhyMIqrW3dQUWAJB68zPdfJSZq7pVhBnvhSWVUw1c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qj5g/pc43gm2muVdIcQ14aYoZRJgSRgCeFrGadx5W/q8XJU8YCJpGPwyRdWBpA9Vs
         RMVwCD8ahFv1p/i7u89tgmnI+Fqa4W9qWnVDzQ3dX/L8J9tMonA3dsCpKHrIcy0vcw
         fSZ/ayLTJ5yzoJ68XIfJe5NTlJCD4w6TkBhRfTc3oUmHpa0XTX9222R9EClQW5qype
         L1MCWgATOPmkldaLBCJp0D2splOm1M3oFmfrpt2HSe4Xl985mKGRgdV0ZNMvkWKLEd
         TdLCG+Amu4hvLU32naDcb9G0KUuHZ3MjfRFIS+kqtnA3Fkxb7ijapvR5MXdUj/7MlN
         LdIfFJHDSsCYw==
X-Google-Smtp-Source: ABdhPJzPtEoTjFlEJ9RMzHkZ6RQFbm+VIwPPqktF6pHXoBiGs2eomNI8mTim6ADtg0WbwOyIpyVJm5I1x0lZQXnlzHQ=
X-Received: by 2002:a05:6830:1e14:: with SMTP id s20mr6293125otr.210.1608386910461;
 Sat, 19 Dec 2020 06:08:30 -0800 (PST)
MIME-Version: 1.0
References: <00000000000025169705b6d100fa@google.com>
In-Reply-To: <00000000000025169705b6d100fa@google.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Sat, 19 Dec 2020 15:08:14 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3AF4yFUcOEzMPf7SGkf6YVPJthHLzGtM==oGkSj+=mtg@mail.gmail.com>
Message-ID: <CAK8P3a3AF4yFUcOEzMPf7SGkf6YVPJthHLzGtM==oGkSj+=mtg@mail.gmail.com>
Subject: Re: memory leak in video_usercopy
To:     syzbot <syzbot+1115e79c8df6472c612b@syzkaller.appspotmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

,On Sat, Dec 19, 2020 at 2:15 PM syzbot
<syzbot+1115e79c8df6472c612b@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    a409ed15 Merge tag 'gpio-v5.11-1' of git://git.kernel.org/..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=10a5880f500000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=37c889fb8b2761af
> dashboard link: https://syzkaller.appspot.com/bug?extid=1115e79c8df6472c612b
> compiler:       gcc (GCC) 10.1.0-syz 20200507
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14d18f9b500000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=106a2c13500000
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+1115e79c8df6472c612b@syzkaller.appspotmail.com
>
> Debian GNU/Linux 9 syzkaller ttyS0
> Warning: Permanently added '10.128.10.29' (ECDSA) to the list of known hosts.
> executing program
> executing program
> BUG: memory leak
> unreferenced object 0xffff88810fb12300 (size 256):
>   comm "syz-executor399", pid 8472, jiffies 4294942333 (age 13.960s)
>   hex dump (first 32 bytes):
>     03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<000000009fd00995>] kmalloc_node include/linux/slab.h:575 [inline]
>     [<000000009fd00995>] kvmalloc_node+0x61/0xf0 mm/util.c:575
>     [<0000000096a57c4a>] kvmalloc include/linux/mm.h:773 [inline]
>     [<0000000096a57c4a>] video_usercopy+0x991/0xa50 drivers/media/v4l2-core/v4l2-ioctl.c:3303
>     [<00000000f7529cc2>] v4l2_ioctl+0x77/0x90 drivers/media/v4l2-core/v4l2-dev.c:360
>     [<0000000061b5e6a9>] vfs_ioctl fs/ioctl.c:48 [inline]
>     [<0000000061b5e6a9>] __do_sys_ioctl fs/ioctl.c:753 [inline]
>     [<0000000061b5e6a9>] __se_sys_ioctl fs/ioctl.c:739 [inline]
>     [<0000000061b5e6a9>] __x64_sys_ioctl+0xfc/0x140 fs/ioctl.c:739
>     [<000000000139479b>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
>     [<00000000d6de1c9c>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

It seems there are commands that need both a buffer for the direct ioc
argument and for array_args. If that happens, we have two kvmalloc() calls
but only one kvfree(), and that would correctly trigger the leak detector.

The direct ioc argument copy happens for arguments over 128 bytes.
Checking the sizes of the comands with array args shows

VIDIOC_PREPARE_BUF, VIDIOC_QUERYBUF, VIDIOC_QBUF, VIDIOC_DQBUF:
v4l2_buffer, 84 bytes or less

VIDIOC_G_EDID, VIDIOC_S_EDID:
v4l2_edid, 40 bytes or less

VIDIOC_G_EXT_CTRLS, VIDIOC_S_EXT_CTRLS, VIDIOC_TRY_EXT_CTRLS:
v4l2_ext_controls, 32 bytes or less

VIDIOC_G_FMT, VIDIOC_S_FMT, VIDIOC_TRY_FMT:
v4l2_format, 204 or 208 bytes

I would conclude it's one of the last three commands, and it could be
avoided either by increasing the on-stack buffer to sizeof(struct v4l2_format),
or by restructuring this function again to have two separate pointers
for alloc/free.

      Arnd
