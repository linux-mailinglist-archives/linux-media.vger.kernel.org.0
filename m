Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC34210E025
	for <lists+linux-media@lfdr.de>; Sun,  1 Dec 2019 03:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbfLACQz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Nov 2019 21:16:55 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:40220 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbfLACQz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Nov 2019 21:16:55 -0500
Received: by mail-io1-f66.google.com with SMTP id x1so2534174iop.7;
        Sat, 30 Nov 2019 18:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0/fFrhVVFRKMJFmFpbrJZXnHs4pQToFqbyeKV5Iepow=;
        b=CUg0PpjJ1XVc2BDjRcvFogC95pTDA3+PqMAxarDOQyLeino5Lf6WtpKxo3L/B7w988
         K0yzTwHI+0zfoVD8KCnMLQ05aJ5fmEy68gs8FtQPvGXxfr6ykLn7iUq44dgvcXwpV16X
         TC9MKPxaFmy6Xz69w1Xr50PPpBYOki+F+QpfI2mxnweu3/DQebzcYbwkczEDv9yZonrd
         2tvJJr0Sh6amr0rTno9v/YqgDHiV9tNQHlV/DtTk1F4UXSGklr36sBCrrTHc3FHzC1Gk
         rXWzQyk67a1Ckh0tJFOgCG3O1ZVWtfhzZalVrntM6FEIoV8uA3o5Ss/NB/PBhasSpqM5
         Etnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0/fFrhVVFRKMJFmFpbrJZXnHs4pQToFqbyeKV5Iepow=;
        b=p86CIRfXveGNuHPdn3q3dp2/lbO1aQLb89EYukOBiTieGbU4VlhOyUnYxtGD/441yd
         yYtZAEi1lJ5Cw56zwn14TzFqwZWB+67a4kxRXiFVhKCEVXhmcvetUliNojwU6lKqsvxq
         mzRJlWVbBOtw4kIHUFMD531kN1PXpWxso2fZd36cn6z/BKvRWmRHX0r1QZHt7U5sf9xj
         6uBgyZuTBBCw2LrE9K6dGoJwvG8vK2r1gtgH3dLKozwvbQGoQHqGkYR2/k37P3Ti+72d
         XuISAXwxvOdkmd6PICz2Zpgzh2j+odY6M9m8KnqU6KLqPqhGHPSCOa7p+/7xiFj+t7mS
         vvaQ==
X-Gm-Message-State: APjAAAVKLJ+7xlqBtSAc7Zi+sYxZ1oztThW+gbC96+VgtX8I9Kb5y4/1
        qlzSuZsQCwF3efl++4c7wW1ueMti9dwyE7oFLnk=
X-Google-Smtp-Source: APXvYqynbh/xpUYC8OCWLbocLgLCuYcchc+XofY1lMocGlINrF4oKe94VTY5ed6ZVW3cDUXHHAHCcbW9O1Z9jlAMe2s=
X-Received: by 2002:a6b:d20f:: with SMTP id q15mr13031726iob.78.1575166613619;
 Sat, 30 Nov 2019 18:16:53 -0800 (PST)
MIME-Version: 1.0
References: <20190531085523.10892-1-p.zabel@pengutronix.de>
 <20190531085523.10892-9-p.zabel@pengutronix.de> <cfabcdc7-baff-82d8-2b24-5a18a9c50441@xs4all.nl>
 <20190603220256.1922901a@collabora.com> <93cad5e2-12ef-10e2-e18f-4c22a82d3b04@xs4all.nl>
 <1560254131.13886.9.camel@pengutronix.de>
In-Reply-To: <1560254131.13886.9.camel@pengutronix.de>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 30 Nov 2019 20:16:42 -0600
Message-ID: <CAHCN7x+wCANcjJ+7Pz+ToxXESAbWLZH7Vt20tCA+eaRO_g+LbQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] media: hantro: add initial i.MX8MQ support
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>,
        devicetree <devicetree@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 11, 2019 at 7:26 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> On Tue, 2019-06-04 at 12:42 +0200, Hans Verkuil wrote:
> > On 6/3/19 10:02 PM, Boris Brezillon wrote:
> > > On Mon, 3 Jun 2019 14:45:37 +0200
> > > Hans Verkuil <hverkuil@xs4all.nl> wrote:
> > >
> > > > On 5/31/19 10:55 AM, Philipp Zabel wrote:
> > > > > For now this just enables MPEG-2 decoding on the Hantro G1 on i.MX8MQ.
> > > > >
> > > > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > > > ---
> > > > > Changes since v2 [1]:
> > > > >  - Adapted to changes in patches 4 and 5
> > > > >
> > > > > [1] https://patchwork.linuxtv.org/patch/56420/
> > > > > ---
> > > > >  drivers/staging/media/hantro/Kconfig        |   8 +-
> > > > >  drivers/staging/media/hantro/Makefile       |   1 +
> > > > >  drivers/staging/media/hantro/hantro_drv.c   |   1 +
> > > > >  drivers/staging/media/hantro/hantro_hw.h    |   1 +
> > > > >  drivers/staging/media/hantro/imx8m_vpu_hw.c | 171 ++++++++++++++++++++
> > > > >  5 files changed, 178 insertions(+), 4 deletions(-)
> > > > >  create mode 100644 drivers/staging/media/hantro/imx8m_vpu_hw.c
> > > > >
> > > > > diff --git a/drivers/staging/media/hantro/Kconfig b/drivers/staging/media/hantro/Kconfig
> > > > > index 660cca358f04..6fdb72df7bd3 100644
> > > > > --- a/drivers/staging/media/hantro/Kconfig
> > > > > +++ b/drivers/staging/media/hantro/Kconfig
> > > > > @@ -1,15 +1,15 @@
> > > > >  # SPDX-License-Identifier: GPL-2.0
> > > > >  config VIDEO_HANTRO
> > > > >         tristate "Hantro VPU driver"
> > > > > -       depends on ARCH_ROCKCHIP || COMPILE_TEST
> > > > > +       depends on ARCH_MXC || ARCH_ROCKCHIP || COMPILE_TEST
> > > > >         depends on VIDEO_DEV && VIDEO_V4L2 && MEDIA_CONTROLLER
> > > > >         depends on MEDIA_CONTROLLER_REQUEST_API
> > > > >         select VIDEOBUF2_DMA_CONTIG
> > > > >         select VIDEOBUF2_VMALLOC
> > > > >         select V4L2_MEM2MEM_DEV
> > > > >         help
> > > > > -         Support for the Hantro IP based Video Processing Unit present on
> > > > > -         Rockchip SoC, which accelerates video and image encoding and
> > > > > -         decoding.
> > > > > +         Support for the Hantro IP based Video Processing Units present on
> > > > > +         Rockchip and NXP i.MX8M SoCs, which accelerate video and image
> > > > > +         encoding and decoding.
> > > > >           To compile this driver as a module, choose M here: the module
> > > > >           will be called hantro-vpu.
> > > > > diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
> > > > > index 14f17a4e48cb..1dac16af451e 100644
> > > > > --- a/drivers/staging/media/hantro/Makefile
> > > > > +++ b/drivers/staging/media/hantro/Makefile
> > > > > @@ -9,5 +9,6 @@ hantro-vpu-y += \
> > > > >                 rk3399_vpu_hw.o \
> > > > >                 rk3399_vpu_hw_jpeg_enc.o \
> > > > >                 rk3399_vpu_hw_mpeg2_dec.o \
> > > > > +               imx8m_vpu_hw.o \
> > > > >                 hantro_jpeg.o \
> > > > >                 hantro_mpeg2.o
> > > >
> > > > I'm a bit concerned about how this is organized. As far as I can tell,
> > > > enabling this driver would compile both rockchip and imx8 code into the
> > > > same driver. You would expect that only the code for the selected
> > > > architectures would be compiled in (or all if COMPILE_TEST is set, of course).
> > > >
> > > > Can you take a look at this?
> > >
> > > Shouldn't be hard to do:
> > >
> > > config VIDEO_HANTRO
> > >     tristate "Hantro VPU driver"
> > >     ...
> > >
> > > config VIDEO_HANTRO_ROCKCHIP
> > >     bool "Rockchip Hantro VPU driver"
> > >     depends on ARCH_ROCKCHIP || COMPILE_TEST
> > >     depends on VIDEO_HANTRO
> > >     ...
> > >
> > > config VIDEO_HANTRO_IMX8
> > >     bool "IMX8 Hantro VPU driver"
> > >     depends on ARCH_IMX || COMPILE_TEST
> > >     depends on VIDEO_HANTRO
> > >     ...
> > >
> > > hantro-vpu-$(VIDEO_HANTRO_RK3288)   += rkxxxx...
> > > hantro-vpu-$(VIDEO_HANTRO_IMX8)             += imx8...
> > >
> > > and a couple of #ifdef in rockchip_vpu_drv.c.
> > >
> > > This being said, I think most of the code in the SoC specific files
> > > could be shared if we find a way to abstract the reg layout (using
> > > regmap/reg_field?), leaving a small amount of SoC-specific code, so I'm
> > > not sure it's a big deal if have support for all SoCs compiled in. What
> > > could be a problem though is if each SoC starts pulling its own set of
> > > dependencies.
> > >
> >
> > I'd rather we do this right from the start. It's easy enough to implement,
> > and it is cleaner this way.
>
> I'm not sure the size difference is worth the additional Kconfig
> options, but I'll add them and see.

What is the status of this?  It would be nice to support the hantro
driver on the i.MX8M... family if possible.

let me know if I can help in any way.

adam
>
> regards
> Philipp
