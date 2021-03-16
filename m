Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0A233D67C
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 16:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbhCPPHW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 11:07:22 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:54319 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237763AbhCPPHE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 11:07:04 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MGgRW-1lRBUy1CbK-00DlEF; Tue, 16 Mar 2021 16:07:02 +0100
Received: by mail-ot1-f49.google.com with SMTP id g8-20020a9d6c480000b02901b65ca2432cso7012358otq.3;
        Tue, 16 Mar 2021 08:07:01 -0700 (PDT)
X-Gm-Message-State: AOAM532bjTihYx1JXilwDuTcg/bdqUrcGETjZE88oyH8AN0/WaQVMjTF
        dFVV2NCYWkiryDPBpqeaVd4LAvSFzkgXD9sw7YU=
X-Google-Smtp-Source: ABdhPJzYsL80Htw/uBa3WXw5zUsBKmYpwq1Ys9qhO8so0vFnRBelBb94syOptVZbWIJx6RFzZDK+Z68CH4Y6bqcxwTs=
X-Received: by 2002:a05:6830:14c1:: with SMTP id t1mr4059307otq.305.1615907220890;
 Tue, 16 Mar 2021 08:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000005ace4405bda4af71@google.com> <CACT4Y+ZJvG+H0Gz9x6cA5qz9=Bf8AdjXaJrQ3GLcwMTj3gPC=Q@mail.gmail.com>
 <CAK8P3a1Ea=NM02jfoWZtV7tbAHbhq7eoP1_SvqcPdRZ49+3dog@mail.gmail.com> <CACT4Y+Y1_WE1z9TVXwbo8ombG8_abD+mY3cwMEigOVYGenDQRA@mail.gmail.com>
In-Reply-To: <CACT4Y+Y1_WE1z9TVXwbo8ombG8_abD+mY3cwMEigOVYGenDQRA@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 16 Mar 2021 16:06:44 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0k-yaGa+0S_rKo52n4Bd2e3bd=Ybj23xY1vO_atV7QKA@mail.gmail.com>
Message-ID: <CAK8P3a0k-yaGa+0S_rKo52n4Bd2e3bd=Ybj23xY1vO_atV7QKA@mail.gmail.com>
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
X-Provags-ID: V03:K1:MhuC39CqFYTF3nPk2kdQMYIQsqgfP1TIsSKq0ChBYZJJJv65Ld8
 xUCaBJPdKT4Zzmw0UEjE3MYRKkdd6KuL4qAu9UdSWZ2BwdSfKHVCdLtx1NA6aJRJYV/5NO/
 Q7MHQ8Po9pNwSA0wEd9HgcBCdYCjCWS6/+uy0Z3wYpk7unNUWLPx9aSyhEFAvQxsDwtfGuX
 cstI38r7FjOmml2WuRoqg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:c3si5TUqg5c=:Hl1dnIRDgK7MJ5ngfh3Dva
 n4/eX1Ef8vz14nKEI/MVXJGV3jOeQSdvRW4dLh/+E2t+SoaLMgFdC0eCSD/V1Fk6Oqj25ZiF6
 u8HUv0XpsG5HqzVTbIEn6zDARii0hUtt6MW6Knzb24N9x++BX0RdENKxvTL9vDiy3duXSPMF2
 CVEzvN9UdVhBgQ9uCXy3BjjeldbE0qu90gU3mijQ/0vsxeIeB71vRPjqet+KsDD4ZabdBTZKf
 3UYG5uooEwPYF0ji6h8V5skqtJAMIBSwJYCxHK8+IZsSq2y19/jUfDUGM9mWbolqpSRye6gpj
 HdFceyJKX8jSRfxLm3tZ/ZulfNJBjVHr8Tpg6M540bEiRNgxJEvRqn12FqRiSHEBY9wyfVAxV
 3PXZpeECfKUlBWeSbL6yPHf/lViHq8zBxx6m7OdMnpdw8MVh8CmPINaNRh2vn
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 16, 2021 at 3:02 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> On Tue, Mar 16, 2021 at 2:56 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Tue, Mar 16, 2021 at 11:44 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> > > On Tue, Mar 16, 2021 at 11:18 AM syzbot
> > > <syzbot+142888ffec98ab194028@syzkaller.appspotmail.com> wrote:
> > > >
> > > > Hello,
> > > >
> > > > syzbot found the following issue on:
> > > >
> > > > HEAD commit:    29ad81a1 arch/x86: add missing include to sparsemem.h
> >
> > This tree seems to be missing fb18802a338b ("media: v4l: ioctl: Fix memory
> > leak in video_usercopy"), which rewrote that function partly and might
> > fix the problem.
> >
> > > > Local variable ----sbuf@video_usercopy created at:
> > > >  video_usercopy+0xaa/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3285
> > > >  video_usercopy+0xaa/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3285
> > > > =====================================================
> > > > =====================================================
> > > > BUG: KMSAN: uninit-value in check_fmt+0x864/0x1070 drivers/media/v4l2-core/v4l2-ioctl.c:963
> > > > CPU: 0 PID: 19595 Comm: syz-executor.4 Tainted: G    B             5.11.0-rc7-syzkaller #0
> > > > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > > > Call Trace:
> > > >  __dump_stack lib/dump_stack.c:79 [inline]
> > > >  dump_stack+0x21c/0x280 lib/dump_stack.c:120
> > > >  kmsan_report+0xfb/0x1e0 mm/kmsan/kmsan_report.c:118
> > > >  __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
> > > >  check_fmt+0x864/0x1070 drivers/media/v4l2-core/v4l2-ioctl.c:963
> > > >  v4l_prepare_buf+0xbf/0x1d0 drivers/media/v4l2-core/v4l2-ioctl.c:2107
> > > >  __video_do_ioctl+0x15cd/0x1d20 drivers/media/v4l2-core/v4l2-ioctl.c:2993
> > > >  video_usercopy+0x2313/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3345
> > > >  video_ioctl2+0x9f/0xb0 drivers/media/v4l2-core/v4l2-ioctl.c:3391
> > > >  v4l2_ioctl+0x255/0x290 drivers/media/v4l2-core/v4l2-dev.c:360
> > > >  v4l2_compat_ioctl32+0x2c6/0x370 drivers/media/v4l2-core/v4l2-compat-ioctl32.c:1248
> > > >  __do_compat_sys_ioctl fs/ioctl.c:842 [inline]
> > > >  __se_compat_sys_ioctl+0x53d/0x1100 fs/ioctl.c:793
> > > >  __ia32_compat_sys_ioctl+0x4a/0x70 fs/ioctl.c:793
> > > >  do_syscall_32_irqs_on arch/x86/entry/common.c:79 [inline]
> > > >  __do_fast_syscall_32+0x102/0x160 arch/x86/entry/common.c:141
> > > >  do_fast_syscall_32+0x6a/0xc0 arch/x86/entry/common.c:166
> > > >  do_SYSENTER_32+0x73/0x90 arch/x86/entry/common.c:209
> > > >  entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
> > > > RIP: 0023:0xf7fec549
> > > > Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
> > > > RSP: 002b:00000000f55e65fc EFLAGS: 00000296 ORIG_RAX: 0000000000000036
> > > > RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000c050565d
> > > > RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> > > > RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> > > > R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> > > > R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> > > >
> > > > Local variable ----sbuf@video_usercopy created at:
> > > >  video_usercopy+0xaa/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3285
> > > >  video_usercopy+0xaa/0x3d30 drivers/media/v4l2-core/v4l2-ioctl.c:3285
> > > > =====================================================
> > >
> > > I did not get to the very bottom of this, but I looked at this a bit.
> > > It seems to be related to some unfortunate interaction of compat
> > > syscall and CONFIG_COMPAT_32BIT_TIME. It seems that in this case
> > > nothing at all is copied from userspace because cmd gets messed up or
> > > something. Perhaps VIDIOC_QUERYBUF is translated into
> > > VIDIOC_QUERYBUF_TIME32 instead of VIDIOC_QUERYBUF32_TIME32 and then
> > > this gets into compat syscall path and v4l2_compat_get_user does not
> > > recognize the command, copies nothing but returns 0.
> >
> > User space would be calling VIDIOC_QUERYBUF32_TIME32 here,
> > if it's built against glibc, though with a musl based user space, you
> > would get called with VIDIOC_QUERYBUF32.
>
> Or somebody fetching somebody else's credit card number will be
> calling VIDIOC_QUERYBUF_TIME32 directly ;)

Ah of course, I forgot the ioctl command may already be fuzzed here.

When I look at
https://syzkaller.appspot.com/text?tag=CrashLog&x=12bd0e3ad00000

I see 0xc0585609, which would be a VIDIOC_QUERYBUF with
size=0x58, which is the native ioctl, not the compat one. This
is something we didn't expect to get passed into the compat ioctl
handler, but should of course handle gracefully

If the command were to get is the 64-bit version of
VIDIOC_QUERYBUF_TIME32 (0xc0505609), then it gets converted to
VIDIOC_QUERYBUF by video_translate_cmd().
If it's VIDIOC_QUERYBUF, it stays that way.

It does break down in v4l2_compat_get_user() when we get
called with VIDIOC_QUERYBUF_TIME32, since that leads
to not copying at all, as you guessed.

I think this should fix the case of passing
VIDIOC_QUERYBUF_TIME32:

--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -3115,7 +3115,7 @@ static int check_array_args(unsigned int cmd,
void *parg, size_t *array_size,
 static unsigned int video_translate_cmd(unsigned int cmd)
 {
        switch (cmd) {
-#ifdef CONFIG_COMPAT_32BIT_TIME
+#if !defined(CONFIG_64BIT) && defined(CONFIG_COMPAT_32BIT_TIME)
        case VIDIOC_DQEVENT_TIME32:
                return VIDIOC_DQEVENT;
        case VIDIOC_QUERYBUF_TIME32:

       Arnd
