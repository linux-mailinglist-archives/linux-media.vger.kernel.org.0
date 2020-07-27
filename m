Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FABB22F320
	for <lists+linux-media@lfdr.de>; Mon, 27 Jul 2020 16:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728895AbgG0OzX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jul 2020 10:55:23 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:36535 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728593AbgG0OzX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jul 2020 10:55:23 -0400
Received: from mail-qt1-f176.google.com ([209.85.160.176]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M1rGy-1jxrbk3MBU-002EwH; Mon, 27 Jul 2020 16:55:21 +0200
Received: by mail-qt1-f176.google.com with SMTP id a32so12388268qtb.5;
        Mon, 27 Jul 2020 07:55:20 -0700 (PDT)
X-Gm-Message-State: AOAM533ZWz0enoIgMN0JE8JFROIGl461VIVcMTiHe2Z7S1MsrzAZZ1fy
        W0aPOd+sqKZ2zAnni0baLsQQ+DfCTt131kJTXJA=
X-Google-Smtp-Source: ABdhPJx9V72QTymo8w1nyOPNr9QDIb1f85k08B5c7bfE5ycZlPzb1BLAKjqSaYTOQzF9HCrRgrx1SHcX9er4/B6hPNo=
X-Received: by 2002:ac8:4652:: with SMTP id f18mr4923449qto.142.1595861719558;
 Mon, 27 Jul 2020 07:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com> <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam> <CAK8P3a3+9Gr6G6KDWu=iW3316O9cPH+XupBBajJaxrq20xQcyQ@mail.gmail.com>
 <20200727144335.GB2571@kadam>
In-Reply-To: <20200727144335.GB2571@kadam>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 27 Jul 2020 16:55:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1q-6aWWs0E0BeGo2S2jcQ7ELU2Q0o4Utc4Qb9J8An5kQ@mail.gmail.com>
Message-ID: <CAK8P3a1q-6aWWs0E0BeGo2S2jcQ7ELU2Q0o4Utc4Qb9J8An5kQ@mail.gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Peilin Ye <yepeilin.cs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vandana BN <bnvandana@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:tg/AoHCEOzFAvg7gpivm7llDARO5ETgYItX/UyNLv11Hj+kUEss
 gaoEZqF9Swg/frhxewZMg9np3RCE8raNgC8ifNllb/2kfx9JXS/lpMeXQj+12lADYBftr4C
 5ZnjmUFYNLZ2i/SKgmvJ3NpOxAVewrdOxuX169B0fKxB5Joo/4933kfNlVhejQc+DYsIkdT
 QfzF1CVkSuqzlvs0yjJ4A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/gJ4HQPTSlA=:wK7KjLlZvMxrMBqGlgrOEl
 C6EwE3AgVo1zSP7IpVa33AMGlCVKQg5Zc5b9knmZCKjhTTey8rr324tkm4gRqtg6zOn7tHg8v
 uZfE4F8RVgfydtO7QcBkqd3ThzLh34apHEeAE+czrGQMiPrD1RYdni9lxILFSEvQ+TluXsaZI
 +6fZFucgrJlAYi6uTL1rm24BQZ0S4YIl2qh42fBL2yo2yO7gF785b/QidG/euLr8nEJlnrC+e
 ybyI+PGXUaHkqvL+vnzNGHzFu4bkFpMK83qR5NnLfyQw+qsTQC4s3EJ54wZ2fyPbTvHlQi5FV
 7eIHAwkCI9z9gFD8RBGP3679fF3w+KhW7fUQwMDQrIeflsgLLwjaZZCdfkfF5WPbksoX64U9u
 f6VTTxWTt5CLVNzoOmv2Vvvd5KQKzSSYaX9+p1QJeDZ0mWP35c6Ll/jhqDgEK1VZ9+W0nhxJB
 y7c8hcpMbS/0rthFWxJkrcwU+rBHgRHf92zf1lMd71o0ZEQz5+1h6WCEnZ5isX4D6ou+pACeO
 yiOPOn1K9kLNB6HupDV9qO5CX3SGV7yTJbaouNVcQ5rxEUFYAExaNxEX7P3adupDVxPX6oE2A
 3evrpnfcgNPf2TvbGOa+yCq24tELJ3054emLX/JE35o0kvIg36miAcSUOGOVawj/yr+QRx9qn
 TjKz2c6A7iKOBVbumWnUDkznQnH3s105E36io3PEmrxHoOPzcuy1j7aHWKPMvHRMHNgr02ds9
 8hOf+N9I0cp1rED498wkQfcRm19Cr+539pKmooSvRWipVtCZDAM4Q13WMaJ0kusE58GHM9ncs
 Hyyw/oX+bYYy01LUdJ7lBed2eyMFtMDPpxsImOQGc2ZrwRU3WlOi+oCKT4HrMTkOFsZFIw1cw
 H/ERaHBb2Lut0TYrgrsIQo83fZVABCuU4aaClyF5VXn/rjJSNluW8GGdg0PZLnisI2zYThrTa
 lwLC2cn7oHiSCyeUHOnkIGFuSZSmhuoQRQkYEz+8n12UyceBN5ADh
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 27, 2020 at 4:43 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Mon, Jul 27, 2020 at 04:05:38PM +0200, Arnd Bergmann wrote:
> > On Mon, Jul 27, 2020 at 3:16 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > On Mon, Jul 27, 2020 at 09:25:16AM +0200, Arnd Bergmann wrote:
> > > > On Mon, Jul 27, 2020 at 12:28 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > > > >
> > > > > video_put_user() is copying uninitialized stack memory to userspace due
> > > > > to the compiler not initializing holes in the structures declared on the
> > > > > stack. Fix it by initializing `ev32` and `vb32` using memset().
> > > > >
> > > > > Reported-and-tested-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com
> > > > > Link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
> > > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > > >
> > > > Thanks a lot for addressing this! I now see that I actually created a similar
> > > > bugfix for it back in January, but for some reason that got stuck in my
> > > > backlog and I never wrote a proper description for it or sent it out to the
> > > > list, sorry about that. I would hope we could find a way to have either
> > > > the compiler or sparse warn if we copy uninitialized data to user space,
> > > > but we now don't even check for that within the kernel any more.
> > >
> > > Here are my latest warnings on linux-next from Friday.
> >
> > Ah, I forgot you had that kind of list already, thanks for checking!
> >
> > > block/scsi_ioctl.c:707 scsi_put_cdrom_generic_arg() warn: check that 'cgc32' doesn't leak information (struct has a hole after 'data_direction')
> >
> > I see no padding in this one, should be fine AFAICT. Any idea why you
> > get a warning
> > for this instance?
> >
>
> The warning message only prints the first struct hole or uninitialized
> struct memeber.  ->data_direction in this case.
>
> block/scsi_ioctl.c
>    646  #ifdef CONFIG_COMPAT
>    647  struct compat_cdrom_generic_command {
>    648          unsigned char   cmd[CDROM_PACKET_SIZE];
>    649          compat_caddr_t  buffer;
>    650          compat_uint_t   buflen;
>    651          compat_int_t    stat;
>    652          compat_caddr_t  sense;
>    653          unsigned char   data_direction;
>
> There is going to be 3 bytes of padding between this char and the next
> int.
>
>    654          compat_int_t    quiet;
>    655          compat_int_t    timeout;
>    656          compat_caddr_t  reserved[1];
>    657  };
>    658  #endif
>
> The bug seems real, but it depends on the compiler of course.

Right, I misread the single 'char' in there.


> > > drivers/input/misc/uinput.c:743 uinput_ff_upload_to_user() warn: check that 'ff_up_compat' doesn't leak information (struct has a hole after 'replay')
> >
> > This one hs padding in it and looks broken.
>
> No.  This a bug in smatch.  It's memcpy() over the hole, but the check
> isn't capturing that.  The code is slightly weird...  I could try
> silence the warning but it would only silence this one false positive so
> I haven't investigated it.


Ah right, and the structure it copies in turn comes from user space
originally.

> > > drivers/scsi/megaraid/megaraid_mm.c:824 kioc_to_mimd() warn: check that 'cinfo.base' doesn't leak information
> >
> > Seems fine due to __packed annotation.
> >
>
> It's not related __packed.  Smatch is saying that cinfo.base isn't
> necessarily initialized.
>
> drivers/scsi/megaraid/megaraid_mm.c
>    816
>    817                  case MEGAIOC_QADAPINFO:
>    818
>    819                          hinfo = (mraid_hba_info_t *)(unsigned long)
>    820                                          kioc->buf_vaddr;
>    821
>    822                          hinfo_to_cinfo(hinfo, &cinfo);
>
> hinfo_to_cinfo() is a no-op if hinfo is NULL.  Smatch can't tell if
> "hinfo" is non-NULL.

Ok, that sounds fair, I couldn't easily tell either ;-)

     Arnd
