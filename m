Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0BE2DF207
	for <lists+linux-media@lfdr.de>; Sat, 19 Dec 2020 23:45:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbgLSWnd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Dec 2020 17:43:33 -0500
Received: from mga06.intel.com ([134.134.136.31]:2982 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726449AbgLSWnd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Dec 2020 17:43:33 -0500
IronPort-SDR: EG8lzHvi7qYnJYnqO3r0eYSD38I06m/uHOoiU0p5swy5qQ9uTHsF8JRXtvUhrNzrtsfEiTHeMj
 Rua4eIoy1LOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9839"; a="237168139"
X-IronPort-AV: E=Sophos;i="5.78,433,1599548400"; 
   d="scan'208";a="237168139"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2020 14:41:46 -0800
IronPort-SDR: r64qM+yIoMn909KO2HJye5lO0Tk4Oxq1aR/lo1pw1UV760m70MhuipbW2BPSNI6mZmqiNTYHp2
 ZVhLLgE3anDw==
X-IronPort-AV: E=Sophos;i="5.78,433,1599548400"; 
   d="scan'208";a="559747678"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2020 14:41:44 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 4B5DF205F7; Sun, 20 Dec 2020 00:41:42 +0200 (EET)
Date:   Sun, 20 Dec 2020 00:41:42 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     syzbot <syzbot+1115e79c8df6472c612b@syzkaller.appspotmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: memory leak in video_usercopy
Message-ID: <20201219224142.GZ26370@paasikivi.fi.intel.com>
References: <00000000000025169705b6d100fa@google.com>
 <CAK8P3a3AF4yFUcOEzMPf7SGkf6YVPJthHLzGtM==oGkSj+=mtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3AF4yFUcOEzMPf7SGkf6YVPJthHLzGtM==oGkSj+=mtg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

On Sat, Dec 19, 2020 at 03:08:14PM +0100, Arnd Bergmann wrote:
> ,On Sat, Dec 19, 2020 at 2:15 PM syzbot
> <syzbot+1115e79c8df6472c612b@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    a409ed15 Merge tag 'gpio-v5.11-1' of git://git.kernel.org/..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=10a5880f500000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=37c889fb8b2761af
> > dashboard link: https://syzkaller.appspot.com/bug?extid=1115e79c8df6472c612b
> > compiler:       gcc (GCC) 10.1.0-syz 20200507
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14d18f9b500000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=106a2c13500000
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+1115e79c8df6472c612b@syzkaller.appspotmail.com
> >
> > Debian GNU/Linux 9 syzkaller ttyS0
> > Warning: Permanently added '10.128.10.29' (ECDSA) to the list of known hosts.
> > executing program
> > executing program
> > BUG: memory leak
> > unreferenced object 0xffff88810fb12300 (size 256):
> >   comm "syz-executor399", pid 8472, jiffies 4294942333 (age 13.960s)
> >   hex dump (first 32 bytes):
> >     03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >   backtrace:
> >     [<000000009fd00995>] kmalloc_node include/linux/slab.h:575 [inline]
> >     [<000000009fd00995>] kvmalloc_node+0x61/0xf0 mm/util.c:575
> >     [<0000000096a57c4a>] kvmalloc include/linux/mm.h:773 [inline]
> >     [<0000000096a57c4a>] video_usercopy+0x991/0xa50 drivers/media/v4l2-core/v4l2-ioctl.c:3303
> >     [<00000000f7529cc2>] v4l2_ioctl+0x77/0x90 drivers/media/v4l2-core/v4l2-dev.c:360
> >     [<0000000061b5e6a9>] vfs_ioctl fs/ioctl.c:48 [inline]
> >     [<0000000061b5e6a9>] __do_sys_ioctl fs/ioctl.c:753 [inline]
> >     [<0000000061b5e6a9>] __se_sys_ioctl fs/ioctl.c:739 [inline]
> >     [<0000000061b5e6a9>] __x64_sys_ioctl+0xfc/0x140 fs/ioctl.c:739
> >     [<000000000139479b>] do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
> >     [<00000000d6de1c9c>] entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> It seems there are commands that need both a buffer for the direct ioc
> argument and for array_args. If that happens, we have two kvmalloc() calls
> but only one kvfree(), and that would correctly trigger the leak detector.
> 
> The direct ioc argument copy happens for arguments over 128 bytes.
> Checking the sizes of the comands with array args shows
> 
> VIDIOC_PREPARE_BUF, VIDIOC_QUERYBUF, VIDIOC_QBUF, VIDIOC_DQBUF:
> v4l2_buffer, 84 bytes or less
> 
> VIDIOC_G_EDID, VIDIOC_S_EDID:
> v4l2_edid, 40 bytes or less
> 
> VIDIOC_G_EXT_CTRLS, VIDIOC_S_EXT_CTRLS, VIDIOC_TRY_EXT_CTRLS:
> v4l2_ext_controls, 32 bytes or less
> 
> VIDIOC_G_FMT, VIDIOC_S_FMT, VIDIOC_TRY_FMT:
> v4l2_format, 204 or 208 bytes
> 
> I would conclude it's one of the last three commands, and it could be
> avoided either by increasing the on-stack buffer to sizeof(struct v4l2_format),
> or by restructuring this function again to have two separate pointers
> for alloc/free.

Thanks for reporting this.

I'd say the original approach was risky to begin with, and that risk
effectively materialised here. I'd rather fix the risky construction than
leaving it there.

Considering the format IOCTLs have been unchanged (size-wise) all this
time, it looks like it really has been broken for a few days short of a
decade! sbuf has been 128 bytes all this time.

-- 
Kind regards,

Sakari Ailus
