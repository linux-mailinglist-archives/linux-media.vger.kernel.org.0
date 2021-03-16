Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70EA333D547
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 14:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235646AbhCPN43 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 09:56:29 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:45379 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235139AbhCPN4H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 09:56:07 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N3K9E-1ln0eS1CNe-010Ige; Tue, 16 Mar 2021 14:56:06 +0100
Received: by mail-ot1-f42.google.com with SMTP id v24-20020a9d69d80000b02901b9aec33371so6877606oto.2;
        Tue, 16 Mar 2021 06:56:05 -0700 (PDT)
X-Gm-Message-State: AOAM531Sia+av21oLEZBSvKP/xLntFKSa5mIYwLujcGhy/Bu3MDmh/MQ
        dy8LcIHcTBEB3l1TAB869nbzHNk4/46sMk6SU0Y=
X-Google-Smtp-Source: ABdhPJw/nFqJ2QFNPxtBlwh9OrvOgbmHzKetejRMwKkleMasw+BGYxcE4D9yJdQG4M6vtIGK5Cta0IjOCcAXWqRQIKg=
X-Received: by 2002:a05:6830:148c:: with SMTP id s12mr3854936otq.251.1615902964903;
 Tue, 16 Mar 2021 06:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000005ace4405bda4af71@google.com> <CACT4Y+ZJvG+H0Gz9x6cA5qz9=Bf8AdjXaJrQ3GLcwMTj3gPC=Q@mail.gmail.com>
In-Reply-To: <CACT4Y+ZJvG+H0Gz9x6cA5qz9=Bf8AdjXaJrQ3GLcwMTj3gPC=Q@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 16 Mar 2021 14:55:47 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Ea=NM02jfoWZtV7tbAHbhq7eoP1_SvqcPdRZ49+3dog@mail.gmail.com>
Message-ID: <CAK8P3a1Ea=NM02jfoWZtV7tbAHbhq7eoP1_SvqcPdRZ49+3dog@mail.gmail.com>
Subject: Re: [syzbot] KMSAN: uninit-value in video_usercopy (2)
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     syzbot <syzbot+142888ffec98ab194028@syzkaller.appspotmail.com>,
        Alexander Potapenko <glider@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:P9QKSADTHUZMPYWwtQJrPVKkdEHma8DIPWl8Rk9d62PC4RQOFPR
 Z9ooVF31jSlW2NE31RsYH3LeJmpSyne6kicLvq40kiZkMV1uw7LbBfGwKmIgjXjFdCFLboo
 YDJ3Z38aDZedLFEeK5f0AxLVmhKOzemCOcpx9YEKX8qhap12+D9NHgRjnIH85aRr4N/+WzT
 8q/NItPAD8GG/Lzqro6Kg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:f2ECmxUTgpA=:7fmbWf7iN1IO7R4pbh4b7Q
 LlaWiCWytagK3It/OAm92ag0UCsgF8QZzadENc9oxhe3HXPen14z1ela8Bt8tdtRfbh94YTRZ
 Xnu3Scp0y//cTKK88SF8WtLVCwyxcxFCwCcRdCUjV2nsIvMTML1ddavbptAMvBc86GaM2rhVL
 157SXRyAv2VR7Gp9aAk+2ayRRqSseoHrEmfY1JVTSU9UCbXZPiMjqDKD8pNm2cES1yUnF6/u/
 Wb5OgpW6pYyt3HIHqUV3xeFlyu4Bv005ILgv9lpUhl+h1vcvCJ+z0TpoA0QLnwqSqA6BbZtJb
 OsnGDl2DPhXpXmcL2TocZIMa9DCHqZMD9CZdIorbIhy8oCMkUbWcwLu+widxqjb804DOrfDzA
 ax+/hmik8Gv7HFIkKQgQQEDT8N4v5OpR0r2l1jVAl2isojzt9+PqfVxt/Tl8V
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 16, 2021 at 11:44 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Tue, Mar 16, 2021 at 11:18 AM syzbot
> <syzbot+142888ffec98ab194028@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    29ad81a1 arch/x86: add missing include to sparsemem.h

This tree seems to be missing fb18802a338b ("media: v4l: ioctl: Fix memory
leak in video_usercopy"), which rewrote that function partly and might
fix the problem.

> > Local variable ----sbuf@video_usercopy created at:
> >  video_usercopy+0xaa/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3285
> >  video_usercopy+0xaa/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3285
> > =====================================================
> > =====================================================
> > BUG: KMSAN: uninit-value in check_fmt+0x864/0x1070 drivers/media/v4l2-core/v4l2-ioctl.c:963
> > CPU: 0 PID: 19595 Comm: syz-executor.4 Tainted: G    B             5.11.0-rc7-syzkaller #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > Call Trace:
> >  __dump_stack lib/dump_stack.c:79 [inline]
> >  dump_stack+0x21c/0x280 lib/dump_stack.c:120
> >  kmsan_report+0xfb/0x1e0 mm/kmsan/kmsan_report.c:118
> >  __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
> >  check_fmt+0x864/0x1070 drivers/media/v4l2-core/v4l2-ioctl.c:963
> >  v4l_prepare_buf+0xbf/0x1d0 drivers/media/v4l2-core/v4l2-ioctl.c:2107
> >  __video_do_ioctl+0x15cd/0x1d20 drivers/media/v4l2-core/v4l2-ioctl.c:2993
> >  video_usercopy+0x2313/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3345
> >  video_ioctl2+0x9f/0xb0 drivers/media/v4l2-core/v4l2-ioctl.c:3391
> >  v4l2_ioctl+0x255/0x290 drivers/media/v4l2-core/v4l2-dev.c:360
> >  v4l2_compat_ioctl32+0x2c6/0x370 drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1248
> >  __do_compat_sys_ioctl fs/ioctl.c:842 [inline]
> >  __se_compat_sys_ioctl+0x53d/0x1100 fs/ioctl.c:793
> >  __ia32_compat_sys_ioctl+0x4a/0x70 fs/ioctl.c:793
> >  do_syscall_32_irqs_on arch/x86/entry/common.c:79 [inline]
> >  __do_fast_syscall_32+0x102/0x160 arch/x86/entry/common.c:141
> >  do_fast_syscall_32+0x6a/0xc0 arch/x86/entry/common.c:166
> >  do_SYSENTER_32+0x73/0x90 arch/x86/entry/common.c:209
> >  entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
> > RIP: 0023:0xf7fec549
> > Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
> > RSP: 002b:00000000f55e65fc EFLAGS: 00000296 ORIG_RAX: 0000000000000036
> > RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000c050565d
> > RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> > RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> > R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> > R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> >
> > Local variable ----sbuf@video_usercopy created at:
> >  video_usercopy+0xaa/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3285
> >  video_usercopy+0xaa/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3285
> > =====================================================
>
> I did not get to the very bottom of this, but I looked at this a bit.
> It seems to be related to some unfortunate interaction of compat
> syscall and CONFIG_COMPAT_32BIT_TIME. It seems that in this case
> nothing at all is copied from userspace because cmd gets messed up or
> something. Perhaps VIDIOC_QUERYBUF is translated into
> VIDIOC_QUERYBUF_TIME32 instead of VIDIOC_QUERYBUF32_TIME32 and then
> this gets into compat syscall path and v4l2_compat_get_user does not
> recognize the command, copies nothing but returns 0.

User space would be calling VIDIOC_QUERYBUF32_TIME32 here,
if it's built against glibc, though with a musl based user space, you
would get called with VIDIOC_QUERYBUF32.

What I notice in get_v4l2_buffer32_time32(), is that we do a full
copy_from_user() to the stack of this function, and then copy the
members individually to the output v4l2_buffer structure:

        struct v4l2_buffer32_time32 vb32;
        if (copy_from_user(&vb32, arg, sizeof(vb32)))
                return -EFAULT;
        *vb = (struct v4l2_buffer) {
                .index          = vb32.index,
                .type           = vb32.type,
                .bytesused      = vb32.bytesused,
                .flags          = vb32.flags,
                .field          = vb32.field,
                .timestamp.tv_sec       = vb32.timestamp.tv_sec,
                .timestamp.tv_usec      = vb32.timestamp.tv_usec,
                .timecode       = vb32.timecode,
                .sequence       = vb32.sequence,
                .memory         = vb32.memory,
                .m.offset       = vb32.m.offset,
                .length         = vb32.length,
                .request_fd     = vb32.request_fd,
        };

This struct assignment will however leave any padding
fields uninitialized. There is padding between 'field' and
'timestamp.  Could that trigger a KMSAN bug?

        Arnd
