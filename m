Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8727232F63
	for <lists+linux-media@lfdr.de>; Thu, 30 Jul 2020 11:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728817AbgG3JSZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jul 2020 05:18:25 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:36165 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbgG3JSY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jul 2020 05:18:24 -0400
Received: from mail-qt1-f170.google.com ([209.85.160.170]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MadGG-1kbnQi0lz8-00c9c4; Thu, 30 Jul 2020 11:18:22 +0200
Received: by mail-qt1-f170.google.com with SMTP id s23so19782055qtq.12;
        Thu, 30 Jul 2020 02:18:21 -0700 (PDT)
X-Gm-Message-State: AOAM533p0yK1gTQ9QUiK587ON7jYuaun+ALSI7zan6ney44yqsTYO7HG
        osekkEzZS57fSxxW8pkJla/XyRw0Ewjl0OQ4Ve8=
X-Google-Smtp-Source: ABdhPJxTFkRhqtuLhXAsNUlZ9J0TZfkHL99w5pWpprWMX0g7dJ5QSuxxz8xtNYzXVB7FSGpCxdmyitm5GsMtlvmucAc=
X-Received: by 2002:aed:33e7:: with SMTP id v94mr1965217qtd.18.1596100700959;
 Thu, 30 Jul 2020 02:18:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com> <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam> <CACRpkda7k4L+nqAYE6z2FVZF-WT2Pm3CHH_=fW24xz_u+QCMRQ@mail.gmail.com>
 <20200728130632.GI1913@kadam> <CAK8P3a3MEUYH3qG-+dxgH1Omx2gtcqSRXzKLLaAw21Xho6HAeQ@mail.gmail.com>
 <CAMRc=MciXb152=CHAi1kfpwFuELLN55-BfNOo8hBg8Tzp4wMnQ@mail.gmail.com>
 <CAK8P3a1m7C0rGGEHvndhxun2TyFh-cweNnPHp-rDtu7Z=YyUKw@mail.gmail.com> <20200730083833.GD3703480@smile.fi.intel.com>
In-Reply-To: <20200730083833.GD3703480@smile.fi.intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 30 Jul 2020 11:18:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2i2mnRPZ-f9UNxPNJcjyjdTOA7-fgcMqavsV8Ab17RkQ@mail.gmail.com>
Message-ID: <CAK8P3a2i2mnRPZ-f9UNxPNJcjyjdTOA7-fgcMqavsV8Ab17RkQ@mail.gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Peilin Ye <yepeilin.cs@gmail.com>,
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
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:SnTdMroix1s5FQaL0KTdz3IDTPnV5/yB9vXvjJw3mf0wp298IeX
 AOfGeYooFp6ID9lexXvpqcu/i1mrWTvyhDpMLb/CPbcITlETeCgkvKoF/1RJYAH9cEPg8mD
 uZKJGSh31C/z0/DgUrnqXw8rG/gNauCEkZe2lJYcT37EUFx4oDjOHyxxfaPRdrW7xeQaYx8
 LGeyEI/V3dSdG3q3FN/bg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FC+afytnCgs=:Ss3/fHQWDIcTLfLQrklC7S
 MHk2++ryNfDpGZf0O5DTDHr7sQmEqNJVWds6+F0sCCDuRVVoNQ8QjUPEQKykkVbFi1lCOzB/I
 aBXyebQhVubFbh13mVDorVsrvQ7ZrRTBkqa4A5g3svu289cf8X+KQDX45ndG6aNrCO35cGYa+
 FQTz3rnVsOCo1uuuYb3I6aeVskaauijS3bDMTLPsMCEHgLCcKfxRLB+NuxblJMK+KoqZ2NHb1
 V+hyhJC15wMjhpSUO232Llb8foTYIiScN16xUaPCQwUKpdQd1k03A2SDM5T/qmPZbUihrYb0m
 /HwQ+YeGOc0uTUs6J+l+UoVodfXVr558TJ4/ilP32BdRO26g8+hUthwg6R9NjaayYsqPtyH9x
 MW8JmPjXLtmVZUsktVYQ7j8Q9EYLa8Y2JSM02FvVDaPyvydnt2it3rJwOQAh5Bn6TjQKvYmA9
 rU1Q6Pumz+qMNA/eC3zurIEFm0PUGnSjUUJeZBPnlO2BxJvfaAwopncIkXjOnwrLA725kJO/i
 /ovbFQt94yDgv/2QFeCNNqNQL+ZJQD0Ik2yKxLCKqvwtJMJQEyWcuNcuiCCkYmcw1pJbuLk82
 S/1B5xoGQM3/3V/swX4MOmj3uixcMgCHNNSfzXL+TRBoFfAz5GEWqKf4QnNmgVhhll3BgWota
 NlKfg5ecZTJv69FtnaTpWM3QdPK2vc1GaeKlcwHtGNB9371cg8f9I7dDlBRwHMOuIQejXVXy6
 99dkMzzUlQitMD8fFmtodY/xRgGvZ1lCw2gYtFJ6pUgepmicXWY++Ln2zAOoy71rhNliX+Acf
 utgjv05/ugpxvyUXsmTOYSlMn8OY0X4kQN/u/i5xGFFgLHNzWsdf18E22tI6j8P5+JCxKqQzg
 Fo/cIDBOlW0ERHDvlmQInhXVjnmYlFb10Rz6vM4ahu6n1D8YU6CUb6ZzisGlCsk/N8v+0gZc2
 2/l8uQSdcfkRLQKOz5RjusM9RxHl+9EmqzaPPDOVITVoAyXD9D7Cy
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 30, 2020 at 10:38 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Jul 30, 2020 at 10:15:24AM +0200, Arnd Bergmann wrote:
> > On Thu, Jul 30, 2020 at 10:07 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > On Tue, Jul 28, 2020 at 3:58 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > >
> > > > On Tue, Jul 28, 2020 at 3:06 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > Something like
> > > >
> > > > static int lineevent_put_data(void __user *uptr, struct gpioevent_data *ge)
> > > > {
> > > > #ifdef __x86_64__
> > > >         /* i386 has no padding after 'id' */
> > > >         if (in_ia32_syscall()) {
> > > >                 struct {
> > > >                         compat_u64      timestamp __packed;
> > > >                         u32             id;
> > > >                 } compat_ge = { ge->timestamp, ge->id };
> > > >
> > > >                 if (copy_to_user(uptr, &compat_ge, sizeof(compat_ge)))
> > > >                         return -EFAULT;
> > > >
> > > >                 return sizeof(compat_ge);
> > > >         }
> > > > #endif
> > > >
> > > >         if (copy_to_user(uptr, ge, sizeof(*ge))
> > > >                 return -EFAULT;
> > > >
> > > >         return sizeof(*ge);
> > > > }
> > > >
> > > >        Arnd
> > >
> > > Hi Arnd,
> > >
> > > Andy actually had a patch for that but since this isn't a regression
> > > (it never worked), we decided to leave it as it is and get it right in
> > > v2 API.
> >
> > I would argue that it needs to be fixed anyway, unless you also want
> > to remove the v1 interface for native mode. If this works on 32-bit
> > kernels, on 64-bit kernels with 64-bit user space and on compat
> > 32-bit user space on 64-bit non-x86 architectures, I see no reason
> > to leave it broken specifically on x86 compat user space. There are
> > still reasons to use 32-bit x86 user space for low-memory machines
> > even though native i386 kernels are getting increasingly silly.
>
> It was possible to "fix" (mitigate to some extent) before libgpiod got support
> for several events in a request. Now it seems to be impossible to fix. AFAIU we
> must discard any request to more than one event in it.

Any reason why the workaround I suggested above would not work?
The in_ia32_syscall() check should be completely reliable in telling whether
we are called from read() by an ia32 task or not, and we use the same
logic for input_event, which has a similar problem (on all compat architectures,
not just x86).

> However I'm not an expert in compat IOCTL code (you are :-) and perhaps you may
> provide ideas better than mine.

What makes this interface tricky is that this is actually a read() call, not
ioctl() which is usually easier because it encodes the data length in the
command code. As far as I could tell from skimming the interface, the
ioctls are actually fine here.

    Arnd
