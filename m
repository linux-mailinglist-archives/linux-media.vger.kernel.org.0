Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35DE526AAB1
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 19:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgIORbK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 13:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727697AbgIORaY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 13:30:24 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9260C06174A
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2020 10:30:21 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id s12so4153794wrw.11
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2020 10:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KU+UzM2iQxi4a7Pm3/8lpRkctbKtSRODyvAKnXBTjew=;
        b=VZc770IBad7D7ljD9AHl46It0kOHWeuSdlIClSKAGayYsf5lP1VjmwMCF1MRcJwyby
         NOcKvkDKMIgwM18USw0259fvXaFxxnrPC/+Ue70PGa5BewEpvLfY9SRMy5aBEBr8pEcR
         /6FKmaUrxi5lxov1PwOJ0VO/jRKlC6zt+88w70gp/zKm9nb1WsCzYBiWcVmyTEULxjCr
         /5zMEMKDvG9Phm9lwrAszy13XSH+Xp6GO2GMxuzZnTg9RHfjTVlCzroSx3TIXncW7i8f
         2CVTyqISwcmNea++OPwYQHTLAk4YxBPkUwSKKoiOLINy53BgN0JOfc6kl6QtlFuvcRda
         XWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KU+UzM2iQxi4a7Pm3/8lpRkctbKtSRODyvAKnXBTjew=;
        b=Q6Tf0Qnf9Y3Bx/D8s66t69K7zIGZoo2+uCjJGbp9i6gUo9tg24DUzDWp4CNRczZg6J
         Xpp2zksYXiLBzF4GQLL6p7TnNIZnwOW5U56fPxVoURvFy5c+A4iijG9kZSl5fmbfIICz
         KLi7W8avKLYqzp1BEbsVCxORGojE2tCj3o9SJgsMVDrbkaWtKJtYVDrMKbqXvIh5VjPN
         COf2aButf7Ud/qIgNS/M0Q9Dw6x/IpVM5rgC4VXWCiDsoniTLJZdplzgw978yzpyHkIQ
         XXQt/M9tj09DSly4SFK+Hltt6VzYsFXOFn9NIHAN2N7ai50jiV9otJlLNWEXmHQjTrm6
         C2sQ==
X-Gm-Message-State: AOAM532KCHPF0mXfaZfuk9xBBMPvgznoILxUvt7sPODBWv6sjU2HTE1x
        VsRAvdcfzXsa3YowCrUFQEH48xAm+fwfYeUMPNhyWg==
X-Google-Smtp-Source: ABdhPJzAlIhzhGqiu8gKke6ay9fiuPMpfpXhwrzWw1tCrPDwACtRVvPaGors9shcn+dlC8X5tfpxx1N4RSzk2WEM6NE=
X-Received: by 2002:adf:912b:: with SMTP id j40mr22584892wrj.42.1600191020141;
 Tue, 15 Sep 2020 10:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
 <20200504092611.9798-5-laurent.pinchart@ideasonboard.com> <20200915070326.GI834@valkosipuli.retiisi.org.uk>
In-Reply-To: <20200915070326.GI834@valkosipuli.retiisi.org.uk>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 15 Sep 2020 18:30:01 +0100
Message-ID: <CAPY8ntBif=KA+kJvTGpCZLKVcO9QAO+pZcw68Ky4nANp7pT=uw@mail.gmail.com>
Subject: Re: [PATCH v2 04/34] media: bcm2835-unicam: Driver for CCP2/CSI2
 camera interface
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

Answering one of the review comments

On Tue, 15 Sep 2020 at 08:04, Sakari Ailus <sakari.ailus@iki.fi> wrote:
>
> Hi Laurent,
>
> Thanks for the patch, and my apologies for the late review. Please do cc =
me
> for v3.
>
> After a quick look I can already say this is the cleanest Unicam driver
> I've ever seen. But please also see my detailed comments below.
>
> On Mon, May 04, 2020 at 12:25:41PM +0300, Laurent Pinchart wrote:
> > From: Naushir Patuck <naush@raspberrypi.com>
> >
> > Add a driver for the Unicam camera receiver block on BCM283x processors=
.
> > Compared to the bcm2835-camera driver present in staging, this driver
> > handles the Unicam block only (CSI-2 receiver), and doesn't depend on
> > the VC4 firmware running on the VPU.
> >
> > The commit is made up of a series of changes cherry-picked from the
> > rpi-5.4.y branch of https://github.com/raspberrypi/linux/ with
> > additional enhancements, forward-ported to the mainline kernel.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> >
> > - Re-fetch mbus code from subdev on a g_fmt call
> > - Group all ioctl disabling together
> > - Fix reference counting in unicam_open
> > - Add support for VIDIOC_[S|G]_SELECTION
> > ---
> >  MAINTAINERS                                   |    7 +
> >  drivers/media/platform/Kconfig                |    1 +
> >  drivers/media/platform/Makefile               |    2 +
> >  drivers/media/platform/bcm2835/Kconfig        |   15 +
> >  drivers/media/platform/bcm2835/Makefile       |    3 +
> >  .../media/platform/bcm2835/bcm2835-unicam.c   | 2825 +++++++++++++++++
> >  .../media/platform/bcm2835/vc4-regs-unicam.h  |  253 ++
> >  7 files changed, 3106 insertions(+)
> >  create mode 100644 drivers/media/platform/bcm2835/Kconfig
> >  create mode 100644 drivers/media/platform/bcm2835/Makefile
> >  create mode 100644 drivers/media/platform/bcm2835/bcm2835-unicam.c
> >  create mode 100644 drivers/media/platform/bcm2835/vc4-regs-unicam.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index b816a453b10e..edf5b8d9c98a 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3341,6 +3341,13 @@ N:     bcm113*
> >  N:   bcm216*
> >  N:   kona
> >
> > +BROADCOM BCM2835 CAMERA DRIVER
> > +M:   Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> > +L:   linux-media@vger.kernel.org
> > +S:   Maintained
> > +F:   drivers/media/platform/bcm2835/
> > +F:   Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> > +
> >  BROADCOM BCM47XX MIPS ARCHITECTURE
> >  M:   Hauke Mehrtens <hauke@hauke-m.de>
> >  M:   Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kc=
onfig
> > index e01bbb9dd1c1..98721a4e0be1 100644
> > --- a/drivers/media/platform/Kconfig
> > +++ b/drivers/media/platform/Kconfig
> > @@ -146,6 +146,7 @@ source "drivers/media/platform/am437x/Kconfig"
> >  source "drivers/media/platform/xilinx/Kconfig"
> >  source "drivers/media/platform/rcar-vin/Kconfig"
> >  source "drivers/media/platform/atmel/Kconfig"
> > +source "drivers/media/platform/bcm2835/Kconfig"
> >  source "drivers/media/platform/sunxi/Kconfig"
> >
> >  config VIDEO_TI_CAL
> > diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/M=
akefile
> > index d13db96e3015..a425e4d2e3f3 100644
> > --- a/drivers/media/platform/Makefile
> > +++ b/drivers/media/platform/Makefile
> > @@ -98,4 +98,6 @@ obj-y                                       +=3D meso=
n/
> >
> >  obj-y                                        +=3D cros-ec-cec/
> >
> > +obj-y                                        +=3D bcm2835/
> > +
> >  obj-y                                        +=3D sunxi/
> > diff --git a/drivers/media/platform/bcm2835/Kconfig b/drivers/media/pla=
tform/bcm2835/Kconfig
> > new file mode 100644
> > index 000000000000..ec46e3ef053c
> > --- /dev/null
> > +++ b/drivers/media/platform/bcm2835/Kconfig
> > @@ -0,0 +1,15 @@
> > +# Broadcom VideoCore4 V4L2 camera support
> > +
> > +config VIDEO_BCM2835_UNICAM
> > +     tristate "Broadcom BCM2835 Unicam video capture driver"
> > +     depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API && MEDIA_CONTROLLE=
R
> > +     depends on ARCH_BCM2835 || COMPILE_TEST
> > +     select VIDEOBUF2_DMA_CONTIG
> > +     select V4L2_FWNODE
> > +     help
> > +       Say Y here to enable support for the BCM2835 CSI-2 receiver. Th=
is is a
> > +       V4L2 driver that controls the CSI-2 receiver directly, independ=
ently
> > +       from the VC4 firmware.
>
> \o/
>
> > +
> > +       To compile this driver as a module, choose M here. The module w=
ill be
> > +       called bcm2835-unicam.
> > diff --git a/drivers/media/platform/bcm2835/Makefile b/drivers/media/pl=
atform/bcm2835/Makefile
> > new file mode 100644
> > index 000000000000..a98aba03598a
> > --- /dev/null
> > +++ b/drivers/media/platform/bcm2835/Makefile
> > @@ -0,0 +1,3 @@
> > +# Makefile for BCM2835 Unicam driver
> > +
> > +obj-$(CONFIG_VIDEO_BCM2835_UNICAM) +=3D bcm2835-unicam.o
> > diff --git a/drivers/media/platform/bcm2835/bcm2835-unicam.c b/drivers/=
media/platform/bcm2835/bcm2835-unicam.c
> > new file mode 100644
> > index 000000000000..2e9387cbc1e0
> > --- /dev/null
> > +++ b/drivers/media/platform/bcm2835/bcm2835-unicam.c
> > @@ -0,0 +1,2825 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * BCM2835 Unicam Capture Driver
> > + *
> > + * Copyright (C) 2017-2020 - Raspberry Pi (Trading) Ltd.
> > + *
> > + * Dave Stevenson <dave.stevenson@raspberrypi.com>
> > + *
> > + * Based on TI am437x driver by
> > + *   Benoit Parrot <bparrot@ti.com>
> > + *   Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > + *
> > + * and TI CAL camera interface driver by
> > + *    Benoit Parrot <bparrot@ti.com>
> > + *
> > + *
> > + * There are two camera drivers in the kernel for BCM283x - this one
> > + * and bcm2835-camera (currently in staging).
> > + *
> > + * This driver directly controls the Unicam peripheral - there is no
> > + * involvement with the VideoCore firmware. Unicam receives CSI-2 or
> > + * CCP2 data and writes it into SDRAM.
> > + * The only potential processing options are to repack Bayer data into=
 an
> > + * alternate format, and applying windowing.
> > + * The repacking does not shift the data, so can repack V4L2_PIX_FMT_S=
xxxx10P
> > + * to V4L2_PIX_FMT_Sxxxx10, or V4L2_PIX_FMT_Sxxxx12P to V4L2_PIX_FMT_S=
xxxx12,
> > + * but not generically up to V4L2_PIX_FMT_Sxxxx16. The driver will add=
 both
> > + * formats where the relevant formats are defined, and will automatica=
lly
> > + * configure the repacking as required.
> > + * Support for windowing may be added later.
> > + *
> > + * It should be possible to connect this driver to any sensor with a
> > + * suitable output interface and V4L2 subdevice driver.
> > + *
> > + * bcm2835-camera uses the VideoCore firmware to control the sensor,
> > + * Unicam, ISP, and all tuner control loops. Fully processed frames ar=
e
> > + * delivered to the driver by the firmware. It only has sensor drivers
> > + * for Omnivision OV5647, and Sony IMX219 sensors.
> > + *
> > + * The two drivers are mutually exclusive for the same Unicam instance=
.
> > + * The VideoCore firmware checks the device tree configuration during =
boot.
> > + * If it finds device tree nodes called csi0 or csi1 it will block the
> > + * firmware from accessing the peripheral, and bcm2835-camera will
> > + * not be able to stream data.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/err.h>
> > +#include <linux/init.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/pinctrl/consumer.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/slab.h>
> > +#include <linux/uaccess.h>
> > +#include <linux/videodev2.h>
> > +
> > +#include <media/v4l2-common.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-dev.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-dv-timings.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-ioctl.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +
> > +#include "vc4-regs-unicam.h"
> > +
> > +#define UNICAM_MODULE_NAME   "unicam"
> > +#define UNICAM_VERSION               "0.1.0"
> > +
> > +static int debug;
> > +module_param(debug, int, 0644);
> > +MODULE_PARM_DESC(debug, "Debug level 0-3");
> > +
> > +#define unicam_dbg(level, dev, fmt, arg...)  \
> > +             v4l2_dbg(level, debug, &(dev)->v4l2_dev, fmt, ##arg)
> > +#define unicam_info(dev, fmt, arg...)        \
> > +             v4l2_info(&(dev)->v4l2_dev, fmt, ##arg)
> > +#define unicam_err(dev, fmt, arg...) \
> > +             v4l2_err(&(dev)->v4l2_dev, fmt, ##arg)
>
> I'd just use dev_*() macros in new drivers unless you really need somethi=
ng
> else. It's configurable. Up to you...
>
> > +
> > +/*
> > + * To protect against a dodgy sensor driver never returning an error f=
rom
> > + * enum_mbus_code, set a maximum index value to be used.
> > + */
> > +#define MAX_ENUM_MBUS_CODE   128
>
> Hmm.
>
> Is it Unicam driver's job to work around sensor driver bugs? That same bu=
g
> would hit user space, too. I'd say such a sensor driver must be fixed, an=
d
> not just worked around here and there.

Yes, it would hit userspace too.

However the issue from Unicam's side is that in order to support and
enumerate both the packed and unpacked version of each Bayer or mono
format (eg RGGB10 and RGGB10P), unicam_enum_fmt_vid_cap loops until
either it reaches the requested index (and it only counts supported
formats), or the subdev returns an error. If the subdev has a bug such
that it doesn't check index and return an error, and the last format
isn't supported, then there is no way of breaking that loop. Being
stuck in a loop within the kernel, whether the fault of the subdev or
Unicam, is surely a bad thing, hence some defensive programming.

Yes, I was bitten by this, but I don't recall which driver it was that
I was working on at the time.

> > +
> > +/*
> > + * Stride is a 16 bit register, but also has to be a multiple of 32.
> > + */
> > +#define BPL_ALIGNMENT                32
> > +#define MAX_BYTESPERLINE     ((1 << 16) - BPL_ALIGNMENT)
> > +/*
> > + * Max width is therefore determined by the max stride divided by
> > + * the number of bits per pixel. Take 32bpp as a
> > + * worst case.
> > + * No imposed limit on the height, so adopt a square image for want
> > + * of anything better.
> > + */
> > +#define MAX_WIDTH            (MAX_BYTESPERLINE / 4)
> > +#define MAX_HEIGHT           MAX_WIDTH
> > +/* Define a nominal minimum image size */
> > +#define MIN_WIDTH            16
> > +#define MIN_HEIGHT           16
> > +/* Default size of the embedded buffer */
> > +#define UNICAM_EMBEDDED_SIZE 8192
> > +
> > +/*
> > + * Size of the dummy buffer. Can be any size really, but the DMA
> > + * allocation works in units of page sizes.
> > + */
> > +#define DUMMY_BUF_SIZE               (PAGE_SIZE)
> > +
> > +enum pad_types {
> > +     IMAGE_PAD,
> > +     METADATA_PAD,
> > +     MAX_NODES
> > +};
> > +
> > +/*
> > + * struct unicam_fmt - Unicam media bus format information
> > + * @pixelformat: V4L2 pixel format FCC identifier. 0 if n/a.
> > + * @repacked_fourcc: V4L2 pixel format FCC identifier if the data is e=
xpanded
> > + * out to 16bpp. 0 if n/a.
> > + * @code: V4L2 media bus format code.
> > + * @depth: Bits per pixel as delivered from the source.
> > + * @csi_dt: CSI data type.
> > + * @check_variants: Flag to denote that there are multiple mediabus fo=
rmats
> > + *           still in the list that could match this V4L2 format.
> > + */
> > +struct unicam_fmt {
> > +     u32     fourcc;
> > +     u32     repacked_fourcc;
> > +     u32     code;
> > +     u8      depth;
> > +     u8      csi_dt;
> > +     u8      check_variants;
> > +};
> > +
> > +static const struct unicam_fmt formats[] =3D {
> > +     /* YUV Formats */
> > +     {
> > +             .fourcc         =3D V4L2_PIX_FMT_YUYV,
> > +             .code           =3D MEDIA_BUS_FMT_YUYV8_2X8,
> > +             .depth          =3D 16,
> > +             .csi_dt         =3D 0x1e,
> > +             .check_variants =3D 1,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_UYVY,
> > +             .code           =3D MEDIA_BUS_FMT_UYVY8_2X8,
> > +             .depth          =3D 16,
> > +             .csi_dt         =3D 0x1e,
> > +             .check_variants =3D 1,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_YVYU,
> > +             .code           =3D MEDIA_BUS_FMT_YVYU8_2X8,
> > +             .depth          =3D 16,
> > +             .csi_dt         =3D 0x1e,
> > +             .check_variants =3D 1,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_VYUY,
> > +             .code           =3D MEDIA_BUS_FMT_VYUY8_2X8,
> > +             .depth          =3D 16,
> > +             .csi_dt         =3D 0x1e,
> > +             .check_variants =3D 1,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_YUYV,
> > +             .code           =3D MEDIA_BUS_FMT_YUYV8_1X16,
> > +             .depth          =3D 16,
> > +             .csi_dt         =3D 0x1e,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_UYVY,
> > +             .code           =3D MEDIA_BUS_FMT_UYVY8_1X16,
> > +             .depth          =3D 16,
> > +             .csi_dt         =3D 0x1e,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_YVYU,
> > +             .code           =3D MEDIA_BUS_FMT_YVYU8_1X16,
> > +             .depth          =3D 16,
> > +             .csi_dt         =3D 0x1e,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_VYUY,
> > +             .code           =3D MEDIA_BUS_FMT_VYUY8_1X16,
> > +             .depth          =3D 16,
> > +             .csi_dt         =3D 0x1e,
> > +     }, {
> > +     /* RGB Formats */
> > +             .fourcc         =3D V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrr=
rggg */
> > +             .code           =3D MEDIA_BUS_FMT_RGB565_2X8_LE,
> > +             .depth          =3D 16,
> > +             .csi_dt         =3D 0x22,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_RGB565X, /* rrrrrggg ggg=
bbbbb */
> > +             .code           =3D MEDIA_BUS_FMT_RGB565_2X8_BE,
> > +             .depth          =3D 16,
> > +             .csi_dt         =3D 0x22
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_RGB555, /* gggbbbbb arrr=
rrgg */
> > +             .code           =3D MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE,
> > +             .depth          =3D 16,
> > +             .csi_dt         =3D 0x21,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_RGB555X, /* arrrrrgg ggg=
bbbbb */
> > +             .code           =3D MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE,
> > +             .depth          =3D 16,
> > +             .csi_dt         =3D 0x21,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_RGB24, /* rgb */
> > +             .code           =3D MEDIA_BUS_FMT_RGB888_1X24,
> > +             .depth          =3D 24,
> > +             .csi_dt         =3D 0x24,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_BGR24, /* bgr */
> > +             .code           =3D MEDIA_BUS_FMT_BGR888_1X24,
> > +             .depth          =3D 24,
> > +             .csi_dt         =3D 0x24,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_RGB32, /* argb */
> > +             .code           =3D MEDIA_BUS_FMT_ARGB8888_1X32,
> > +             .depth          =3D 32,
> > +             .csi_dt         =3D 0x0,
> > +     }, {
> > +     /* Bayer Formats */
> > +             .fourcc         =3D V4L2_PIX_FMT_SBGGR8,
> > +             .code           =3D MEDIA_BUS_FMT_SBGGR8_1X8,
> > +             .depth          =3D 8,
> > +             .csi_dt         =3D 0x2a,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_SGBRG8,
> > +             .code           =3D MEDIA_BUS_FMT_SGBRG8_1X8,
> > +             .depth          =3D 8,
> > +             .csi_dt         =3D 0x2a,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_SGRBG8,
> > +             .code           =3D MEDIA_BUS_FMT_SGRBG8_1X8,
> > +             .depth          =3D 8,
> > +             .csi_dt         =3D 0x2a,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_SRGGB8,
> > +             .code           =3D MEDIA_BUS_FMT_SRGGB8_1X8,
> > +             .depth          =3D 8,
> > +             .csi_dt         =3D 0x2a,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_SBGGR10P,
> > +             .repacked_fourcc =3D V4L2_PIX_FMT_SBGGR10,
> > +             .code           =3D MEDIA_BUS_FMT_SBGGR10_1X10,
> > +             .depth          =3D 10,
> > +             .csi_dt         =3D 0x2b,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_SGBRG10P,
> > +             .repacked_fourcc =3D V4L2_PIX_FMT_SGBRG10,
> > +             .code           =3D MEDIA_BUS_FMT_SGBRG10_1X10,
> > +             .depth          =3D 10,
> > +             .csi_dt         =3D 0x2b,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_SGRBG10P,
> > +             .repacked_fourcc =3D V4L2_PIX_FMT_SGRBG10,
> > +             .code           =3D MEDIA_BUS_FMT_SGRBG10_1X10,
> > +             .depth          =3D 10,
> > +             .csi_dt         =3D 0x2b,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_SRGGB10P,
> > +             .repacked_fourcc =3D V4L2_PIX_FMT_SRGGB10,
> > +             .code           =3D MEDIA_BUS_FMT_SRGGB10_1X10,
> > +             .depth          =3D 10,
> > +             .csi_dt         =3D 0x2b,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_SBGGR12P,
> > +             .repacked_fourcc =3D V4L2_PIX_FMT_SBGGR12,
> > +             .code           =3D MEDIA_BUS_FMT_SBGGR12_1X12,
> > +             .depth          =3D 12,
> > +             .csi_dt         =3D 0x2c,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_SGBRG12P,
> > +             .repacked_fourcc =3D V4L2_PIX_FMT_SGBRG12,
> > +             .code           =3D MEDIA_BUS_FMT_SGBRG12_1X12,
> > +             .depth          =3D 12,
> > +             .csi_dt         =3D 0x2c,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_SGRBG12P,
> > +             .repacked_fourcc =3D V4L2_PIX_FMT_SGRBG12,
> > +             .code           =3D MEDIA_BUS_FMT_SGRBG12_1X12,
> > +             .depth          =3D 12,
> > +             .csi_dt         =3D 0x2c,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_SRGGB12P,
> > +             .repacked_fourcc =3D V4L2_PIX_FMT_SRGGB12,
> > +             .code           =3D MEDIA_BUS_FMT_SRGGB12_1X12,
> > +             .depth          =3D 12,
> > +             .csi_dt         =3D 0x2c,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_SBGGR14P,
> > +             .code           =3D MEDIA_BUS_FMT_SBGGR14_1X14,
> > +             .depth          =3D 14,
> > +             .csi_dt         =3D 0x2d,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_SGBRG14P,
> > +             .code           =3D MEDIA_BUS_FMT_SGBRG14_1X14,
> > +             .depth          =3D 14,
> > +             .csi_dt         =3D 0x2d,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_SGRBG14P,
> > +             .code           =3D MEDIA_BUS_FMT_SGRBG14_1X14,
> > +             .depth          =3D 14,
> > +             .csi_dt         =3D 0x2d,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_SRGGB14P,
> > +             .code           =3D MEDIA_BUS_FMT_SRGGB14_1X14,
> > +             .depth          =3D 14,
> > +             .csi_dt         =3D 0x2d,
> > +     }, {
> > +     /*
> > +      * 16 bit Bayer formats could be supported, but there is no CSI2
> > +      * data_type defined for raw 16, and no sensors that produce it a=
t
> > +      * present.
> > +      */
> > +
> > +     /* Greyscale formats */
> > +             .fourcc         =3D V4L2_PIX_FMT_GREY,
> > +             .code           =3D MEDIA_BUS_FMT_Y8_1X8,
> > +             .depth          =3D 8,
> > +             .csi_dt         =3D 0x2a,
> > +     }, {
> > +             .fourcc         =3D V4L2_PIX_FMT_Y10P,
> > +             .repacked_fourcc =3D V4L2_PIX_FMT_Y10,
> > +             .code           =3D MEDIA_BUS_FMT_Y10_1X10,
> > +             .depth          =3D 10,
> > +             .csi_dt         =3D 0x2b,
> > +     }, {
> > +             /* NB There is no packed V4L2 fourcc for this format. */
> > +             .repacked_fourcc =3D V4L2_PIX_FMT_Y12,
> > +             .code           =3D MEDIA_BUS_FMT_Y12_1X12,
> > +             .depth          =3D 12,
> > +             .csi_dt         =3D 0x2c,
> > +     },
> > +     /* Embedded data format */
> > +     {
> > +             .fourcc         =3D V4L2_META_FMT_SENSOR_DATA,
> > +             .code           =3D MEDIA_BUS_FMT_SENSOR_DATA,
> > +             .depth          =3D 8,
> > +     }
> > +};
> > +
> > +struct unicam_buffer {
> > +     struct vb2_v4l2_buffer vb;
> > +     struct list_head list;
> > +};
> > +
> > +static inline struct unicam_buffer *to_unicam_buffer(struct vb2_buffer=
 *vb)
> > +{
> > +     return container_of(vb, struct unicam_buffer, vb.vb2_buf);
> > +}
> > +
> > +struct unicam_node {
> > +     bool registered;
> > +     int open;
> > +     bool streaming;
> > +     unsigned int pad_id;
> > +     /* Pointer pointing to current v4l2_buffer */
> > +     struct unicam_buffer *cur_frm;
> > +     /* Pointer pointing to next v4l2_buffer */
> > +     struct unicam_buffer *next_frm;
> > +     /* video capture */
> > +     const struct unicam_fmt *fmt;
> > +     /* Used to store current pixel format */
> > +     struct v4l2_format v_fmt;
> > +     /* Used to store current mbus frame format */
> > +     struct v4l2_mbus_framefmt m_fmt;
> > +     /* Buffer queue used in video-buf */
> > +     struct vb2_queue buffer_queue;
> > +     /* Queue of filled frames */
> > +     struct list_head dma_queue;
> > +     /* IRQ lock for DMA queue */
> > +     spinlock_t dma_queue_lock;
> > +     /* lock used to access this structure */
> > +     struct mutex lock;
> > +     /* Identifies video device for this channel */
> > +     struct video_device video_dev;
> > +     /* Pointer to the parent handle */
> > +     struct unicam_device *dev;
> > +     struct media_pad pad;
> > +     unsigned int embedded_lines;
> > +     /*
> > +      * Dummy buffer intended to be used by unicam
> > +      * if we have no other queued buffers to swap to.
> > +      */
> > +     void *dummy_buf_cpu_addr;
> > +     dma_addr_t dummy_buf_dma_addr;
> > +};
> > +
> > +struct unicam_device {
> > +     struct kref kref;
> > +
> > +     /* V4l2 specific parameters */
> > +     struct v4l2_async_subdev asd;
> > +
> > +     /* peripheral base address */
> > +     void __iomem *base;
> > +     /* clock gating base address */
> > +     void __iomem *clk_gate_base;
> > +     /* clock handle */
> > +     struct clk *clock;
> > +     /* V4l2 device */
> > +     struct v4l2_device v4l2_dev;
> > +     struct media_device mdev;
> > +
> > +     /* parent device */
> > +     struct platform_device *pdev;
> > +     /* subdevice async Notifier */
> > +     struct v4l2_async_notifier notifier;
> > +     unsigned int sequence;
> > +
> > +     /* ptr to  sub device */
> > +     struct v4l2_subdev *sensor;
> > +     /* Pad config for the sensor */
> > +     struct v4l2_subdev_pad_config *sensor_config;
> > +
> > +     enum v4l2_mbus_type bus_type;
> > +     /*
> > +      * Stores bus.mipi_csi2.flags for CSI2 sensors, or
> > +      * bus.mipi_csi1.strobe for CCP2.
> > +      */
> > +     unsigned int bus_flags;
> > +     unsigned int max_data_lanes;
> > +     unsigned int active_data_lanes;
> > +     bool sensor_embedded_data;
> > +
> > +     struct unicam_node node[MAX_NODES];
> > +     struct v4l2_ctrl_handler ctrl_handler;
> > +};
> > +
> > +static inline struct unicam_device *
> > +to_unicam_device(struct v4l2_device *v4l2_dev)
> > +{
> > +     return container_of(v4l2_dev, struct unicam_device, v4l2_dev);
> > +}
> > +
> > +/* Hardware access */
> > +static inline void clk_write(struct unicam_device *dev, u32 val)
> > +{
> > +     writel(val | 0x5a000000, dev->clk_gate_base);
> > +}
> > +
> > +static inline u32 reg_read(struct unicam_device *dev, u32 offset)
> > +{
> > +     return readl(dev->base + offset);
> > +}
> > +
> > +static inline void reg_write(struct unicam_device *dev, u32 offset, u3=
2 val)
> > +{
> > +     writel(val, dev->base + offset);
> > +}
> > +
> > +static inline int get_field(u32 value, u32 mask)
> > +{
> > +     return (value & mask) >> __ffs(mask);
> > +}
> > +
> > +static inline void set_field(u32 *valp, u32 field, u32 mask)
> > +{
> > +     u32 val =3D *valp;
> > +
> > +     val &=3D ~mask;
> > +     val |=3D (field << __ffs(mask)) & mask;
> > +     *valp =3D val;
> > +}
> > +
> > +static inline u32 reg_read_field(struct unicam_device *dev, u32 offset=
,
> > +                              u32 mask)
> > +{
> > +     return get_field(reg_read(dev, offset), mask);
> > +}
> > +
> > +static inline void reg_write_field(struct unicam_device *dev, u32 offs=
et,
> > +                                u32 field, u32 mask)
> > +{
> > +     u32 val =3D reg_read(dev, offset);
> > +
> > +     set_field(&val, field, mask);
> > +     reg_write(dev, offset, val);
> > +}
> > +
> > +/* Power management functions */
> > +static inline int unicam_runtime_get(struct unicam_device *dev)
> > +{
> > +     return pm_runtime_get_sync(&dev->pdev->dev);
> > +}
> > +
> > +static inline void unicam_runtime_put(struct unicam_device *dev)
> > +{
> > +     pm_runtime_put_sync(&dev->pdev->dev);
> > +}
>
> Please don't add such wrappers.
>
> > +
> > +/* Format setup functions */
> > +static const struct unicam_fmt *find_format_by_code(u32 code)
> > +{
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(formats); i++) {
> > +             if (formats[i].code =3D=3D code)
> > +                     return &formats[i];
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> > +static int check_mbus_format(struct unicam_device *dev,
> > +                          const struct unicam_fmt *format)
> > +{
> > +     unsigned int i;
> > +     int ret =3D 0;
> > +
> > +     for (i =3D 0; !ret && i < MAX_ENUM_MBUS_CODE; i++) {
> > +             struct v4l2_subdev_mbus_code_enum mbus_code =3D {
> > +                     .index =3D i,
> > +                     .pad =3D IMAGE_PAD,
> > +                     .which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> > +             };
> > +
> > +             ret =3D v4l2_subdev_call(dev->sensor, pad, enum_mbus_code=
,
> > +                                    NULL, &mbus_code);
> > +
> > +             if (!ret && mbus_code.code =3D=3D format->code)
> > +                     return 1;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct unicam_fmt *find_format_by_pix(struct unicam_devic=
e *dev,
> > +                                                u32 pixelformat)
> > +{
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(formats); i++) {
> > +             if (formats[i].fourcc =3D=3D pixelformat ||
> > +                 formats[i].repacked_fourcc =3D=3D pixelformat) {
> > +                     if (formats[i].check_variants &&
> > +                         !check_mbus_format(dev, &formats[i]))
> > +                             continue;
> > +                     return &formats[i];
> > +             }
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> > +static inline unsigned int bytes_per_line(u32 width,
> > +                                       const struct unicam_fmt *fmt,
> > +                                       u32 v4l2_fourcc)
> > +{
> > +     if (v4l2_fourcc =3D=3D fmt->repacked_fourcc)
> > +             /* Repacking always goes to 16bpp */
> > +             return ALIGN(width << 1, BPL_ALIGNMENT);
> > +     else
> > +             return ALIGN((width * fmt->depth) >> 3, BPL_ALIGNMENT);
> > +}
> > +
> > +static int __subdev_get_format(struct unicam_device *dev,
> > +                            struct v4l2_mbus_framefmt *fmt, int pad_id=
)
> > +{
> > +     struct v4l2_subdev_format sd_fmt =3D {
> > +             .which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> > +             .pad =3D pad_id
> > +     };
> > +     int ret;
> > +
> > +     ret =3D v4l2_subdev_call(dev->sensor, pad, get_fmt, dev->sensor_c=
onfig,
> > +                            &sd_fmt);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     *fmt =3D sd_fmt.format;
> > +
> > +     unicam_dbg(1, dev, "%s %dx%d code:%04x\n", __func__,
> > +                fmt->width, fmt->height, fmt->code);
> > +
> > +     return 0;
> > +}
> > +
> > +static int __subdev_set_format(struct unicam_device *dev,
> > +                            struct v4l2_mbus_framefmt *fmt, int pad_id=
)
> > +{
> > +     struct v4l2_subdev_format sd_fmt =3D {
> > +             .which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> > +             .pad =3D pad_id
> > +     };
> > +     int ret;
> > +
> > +     sd_fmt.format =3D *fmt;
> > +
> > +     ret =3D v4l2_subdev_call(dev->sensor, pad, set_fmt, dev->sensor_c=
onfig,
> > +                            &sd_fmt);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     *fmt =3D sd_fmt.format;
> > +
> > +     if (pad_id =3D=3D IMAGE_PAD)
> > +             unicam_dbg(1, dev, "%s %dx%d code:%04x\n", __func__, fmt-=
>width,
> > +                        fmt->height, fmt->code);
> > +     else
> > +             unicam_dbg(1, dev, "%s Embedded data code:%04x\n", __func=
__,
> > +                        sd_fmt.format.code);
> > +
> > +     return 0;
> > +}
> > +
> > +static int unicam_calc_format_size_bpl(struct unicam_device *dev,
> > +                                    const struct unicam_fmt *fmt,
> > +                                    struct v4l2_format *f)
> > +{
> > +     unsigned int min_bytesperline;
> > +
> > +     v4l_bound_align_image(&f->fmt.pix.width, MIN_WIDTH, MAX_WIDTH, 2,
> > +                           &f->fmt.pix.height, MIN_HEIGHT, MAX_HEIGHT,=
 0,
> > +                           0);
> > +
> > +     min_bytesperline =3D bytes_per_line(f->fmt.pix.width, fmt,
> > +                                       f->fmt.pix.pixelformat);
> > +
> > +     if (f->fmt.pix.bytesperline > min_bytesperline &&
> > +         f->fmt.pix.bytesperline <=3D MAX_BYTESPERLINE)
> > +             f->fmt.pix.bytesperline =3D ALIGN(f->fmt.pix.bytesperline=
,
> > +                                             BPL_ALIGNMENT);
> > +     else
> > +             f->fmt.pix.bytesperline =3D min_bytesperline;
> > +
> > +     f->fmt.pix.sizeimage =3D f->fmt.pix.height * f->fmt.pix.bytesperl=
ine;
> > +
> > +     unicam_dbg(3, dev, "%s: fourcc: %08X size: %dx%d bpl:%d img_size:=
%d\n",
> > +                __func__,
> > +                f->fmt.pix.pixelformat,
> > +                f->fmt.pix.width, f->fmt.pix.height,
> > +                f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
> > +
> > +     return 0;
> > +}
> > +
> > +static int unicam_reset_format(struct unicam_node *node)
> > +{
> > +     struct unicam_device *dev =3D node->dev;
> > +     struct v4l2_mbus_framefmt mbus_fmt;
> > +     int ret;
> > +
> > +     if (dev->sensor_embedded_data || node->pad_id !=3D METADATA_PAD) =
{
> > +             ret =3D __subdev_get_format(dev, &mbus_fmt, node->pad_id)=
;
> > +             if (ret) {
> > +                     unicam_err(dev, "Failed to get_format - ret %d\n"=
, ret);
> > +                     return ret;
> > +             }
> > +
> > +             if (mbus_fmt.code !=3D node->fmt->code) {
> > +                     unicam_err(dev, "code mismatch - fmt->code %08x, =
mbus_fmt.code %08x\n",
> > +                                node->fmt->code, mbus_fmt.code);
> > +                     return ret;
> > +             }
> > +     }
> > +
> > +     if (node->pad_id =3D=3D IMAGE_PAD) {
> > +             v4l2_fill_pix_format(&node->v_fmt.fmt.pix, &mbus_fmt);
> > +             node->v_fmt.type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE;
> > +             unicam_calc_format_size_bpl(dev, node->fmt, &node->v_fmt)=
;
> > +     } else {
> > +             node->v_fmt.type =3D V4L2_BUF_TYPE_META_CAPTURE;
> > +             node->v_fmt.fmt.meta.dataformat =3D V4L2_META_FMT_SENSOR_=
DATA;
> > +             if (dev->sensor_embedded_data) {
> > +                     node->v_fmt.fmt.meta.buffersize =3D
> > +                                     mbus_fmt.width * mbus_fmt.height;
> > +                     node->embedded_lines =3D mbus_fmt.height;
> > +             } else {
> > +                     node->v_fmt.fmt.meta.buffersize =3D UNICAM_EMBEDD=
ED_SIZE;
> > +                     node->embedded_lines =3D 1;
> > +             }
> > +     }
> > +
> > +     node->m_fmt =3D mbus_fmt;
> > +     return 0;
> > +}
> > +
> > +static void unicam_wr_dma_addr(struct unicam_device *dev, dma_addr_t d=
maaddr,
> > +                            unsigned int buffer_size, int pad_id)
> > +{
> > +     dma_addr_t endaddr =3D dmaaddr + buffer_size;
> > +
> > +     /*
> > +      * dmaaddr and endaddr should be a 32-bit address with the top tw=
o bits
> > +      * set to 0x3 to signify uncached access through the Videocore me=
mory
> > +      * controller.
> > +      */
> > +     WARN_ON((dmaaddr >> 30) !=3D 0x3 || (endaddr >> 30) !=3D 0x3);
> > +
> > +     if (pad_id =3D=3D IMAGE_PAD) {
> > +             reg_write(dev, UNICAM_IBSA0, dmaaddr);
> > +             reg_write(dev, UNICAM_IBEA0, endaddr);
> > +     } else {
> > +             reg_write(dev, UNICAM_DBSA0, dmaaddr);
> > +             reg_write(dev, UNICAM_DBEA0, endaddr);
> > +     }
> > +}
> > +
> > +static inline unsigned int unicam_get_lines_done(struct unicam_device =
*dev)
> > +{
> > +     dma_addr_t start_addr, cur_addr;
> > +     unsigned int stride =3D dev->node[IMAGE_PAD].v_fmt.fmt.pix.bytesp=
erline;
> > +     struct unicam_buffer *frm =3D dev->node[IMAGE_PAD].cur_frm;
> > +
> > +     if (!frm)
> > +             return 0;
> > +
> > +     start_addr =3D vb2_dma_contig_plane_dma_addr(&frm->vb.vb2_buf, 0)=
;
> > +     cur_addr =3D reg_read(dev, UNICAM_IBWP);
> > +     return (unsigned int)(cur_addr - start_addr) / stride;
> > +}
> > +
> > +static inline void unicam_schedule_next_buffer(struct unicam_node *nod=
e)
> > +{
> > +     struct unicam_device *dev =3D node->dev;
> > +     struct unicam_buffer *buf;
> > +     unsigned int size;
> > +     dma_addr_t addr;
> > +
> > +     buf =3D list_first_entry(&node->dma_queue, struct unicam_buffer, =
list);
> > +     node->next_frm =3D buf;
> > +     list_del(&buf->list);
> > +
> > +     addr =3D vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
> > +     size =3D (node->pad_id =3D=3D IMAGE_PAD) ?
> > +                     node->v_fmt.fmt.pix.sizeimage :
> > +                     node->v_fmt.fmt.meta.buffersize;
> > +
> > +     unicam_wr_dma_addr(dev, addr, size, node->pad_id);
> > +}
> > +
> > +static inline void unicam_schedule_dummy_buffer(struct unicam_node *no=
de)
> > +{
> > +     struct unicam_device *dev =3D node->dev;
> > +
> > +     unicam_dbg(3, dev, "Scheduling dummy buffer for node %d\n",
> > +                node->pad_id);
> > +
> > +     unicam_wr_dma_addr(dev, node->dummy_buf_dma_addr, DUMMY_BUF_SIZE,
> > +                        node->pad_id);
> > +     node->next_frm =3D NULL;
> > +}
> > +
> > +static inline void unicam_process_buffer_complete(struct unicam_node *=
node,
> > +                                               unsigned int sequence)
> > +{
> > +     node->cur_frm->vb.field =3D node->m_fmt.field;
> > +     node->cur_frm->vb.sequence =3D sequence;
> > +
> > +     vb2_buffer_done(&node->cur_frm->vb.vb2_buf, VB2_BUF_STATE_DONE);
> > +}
> > +
> > +static bool unicam_all_nodes_streaming(struct unicam_device *dev)
> > +{
> > +     bool ret;
> > +
> > +     ret =3D dev->node[IMAGE_PAD].open && dev->node[IMAGE_PAD].streami=
ng;
> > +     ret &=3D !dev->node[METADATA_PAD].open ||
> > +            dev->node[METADATA_PAD].streaming;
> > +     return ret;
> > +}
> > +
> > +static bool unicam_all_nodes_disabled(struct unicam_device *dev)
> > +{
> > +     return !dev->node[IMAGE_PAD].streaming &&
> > +            !dev->node[METADATA_PAD].streaming;
> > +}
> > +
> > +static void unicam_queue_event_sof(struct unicam_device *unicam)
> > +{
> > +     struct v4l2_event event =3D {
> > +             .type =3D V4L2_EVENT_FRAME_SYNC,
> > +             .u.frame_sync.frame_sequence =3D unicam->sequence,
> > +     };
> > +
> > +     v4l2_event_queue(&unicam->node[IMAGE_PAD].video_dev, &event);
> > +}
> > +
> > +/*
> > + * unicam_isr : ISR handler for unicam capture
> > + * @irq: irq number
> > + * @dev_id: dev_id ptr
> > + *
> > + * It changes status of the captured buffer, takes next buffer from th=
e queue
> > + * and sets its address in unicam registers
> > + */
> > +static irqreturn_t unicam_isr(int irq, void *dev)
> > +{
> > +     struct unicam_device *unicam =3D dev;
> > +     unsigned int lines_done =3D unicam_get_lines_done(dev);
> > +     unsigned int sequence =3D unicam->sequence;
> > +     unsigned int i;
> > +     u32 ista, sta;
> > +     u64 ts;
> > +
> > +     /*
> > +      * Don't service interrupts if not streaming.
> > +      * Avoids issues if the VPU should enable the
> > +      * peripheral without the kernel knowing (that
> > +      * shouldn't happen, but causes issues if it does).
> > +      */
> > +     if (unicam_all_nodes_disabled(unicam))
> > +             return IRQ_NONE;
> > +
> > +     sta =3D reg_read(unicam, UNICAM_STA);
> > +     /* Write value back to clear the interrupts */
> > +     reg_write(unicam, UNICAM_STA, sta);
> > +
> > +     ista =3D reg_read(unicam, UNICAM_ISTA);
> > +     /* Write value back to clear the interrupts */
> > +     reg_write(unicam, UNICAM_ISTA, ista);
> > +
> > +     unicam_dbg(3, unicam, "ISR: ISTA: 0x%X, STA: 0x%X, sequence %d, l=
ines done %d",
> > +                ista, sta, sequence, lines_done);
> > +
> > +     if (!(sta & (UNICAM_IS | UNICAM_PI0)))
> > +             return IRQ_HANDLED;
> > +
> > +     /*
> > +      * We must run the frame end handler first. If we have a valid ne=
xt_frm
> > +      * and we get a simultaneout FE + FS interrupt, running the FS ha=
ndler
> > +      * first would null out the next_frm ptr and we would have lost t=
he
> > +      * buffer forever.
> > +      */
> > +     if (ista & UNICAM_FEI || sta & UNICAM_PI0) {
> > +             /*
> > +              * Ensure we have swapped buffers already as we can't
> > +              * stop the peripheral. If no buffer is available, use a
> > +              * dummy buffer to dump out frames until we get a new buf=
fer
> > +              * to use.
> > +              */
> > +             for (i =3D 0; i < ARRAY_SIZE(unicam->node); i++) {
> > +                     if (!unicam->node[i].streaming)
> > +                             continue;
> > +
> > +                     if (unicam->node[i].cur_frm)
> > +                             unicam_process_buffer_complete(&unicam->n=
ode[i],
> > +                                                            sequence);
> > +                     unicam->node[i].cur_frm =3D unicam->node[i].next_=
frm;
> > +             }
> > +             unicam->sequence++;
> > +     }
> > +
> > +     if (ista & UNICAM_FSI) {
> > +             /*
> > +              * Timestamp is to be when the first data byte was captur=
ed,
> > +              * aka frame start.
> > +              */
> > +             ts =3D ktime_get_ns();
> > +             for (i =3D 0; i < ARRAY_SIZE(unicam->node); i++) {
> > +                     if (!unicam->node[i].streaming)
> > +                             continue;
> > +
> > +                     if (unicam->node[i].cur_frm)
> > +                             unicam->node[i].cur_frm->vb.vb2_buf.times=
tamp =3D
> > +                                                             ts;
> > +                     /*
> > +                      * Set the next frame output to go to a dummy fra=
me
> > +                      * if we have not managed to obtain another frame
> > +                      * from the queue.
> > +                      */
> > +                     unicam_schedule_dummy_buffer(&unicam->node[i]);
> > +             }
> > +
> > +             unicam_queue_event_sof(unicam);
> > +     }
> > +
> > +     /*
> > +      * Cannot swap buffer at frame end, there may be a race condition
> > +      * where the HW does not actually swap it if the new frame has
> > +      * already started.
> > +      */
> > +     if (ista & (UNICAM_FSI | UNICAM_LCI) && !(ista & UNICAM_FEI)) {
> > +             for (i =3D 0; i < ARRAY_SIZE(unicam->node); i++) {
> > +                     if (!unicam->node[i].streaming)
> > +                             continue;
> > +
> > +                     spin_lock(&unicam->node[i].dma_queue_lock);
> > +                     if (!list_empty(&unicam->node[i].dma_queue) &&
> > +                         !unicam->node[i].next_frm)
> > +                             unicam_schedule_next_buffer(&unicam->node=
[i]);
> > +                     spin_unlock(&unicam->node[i].dma_queue_lock);
> > +             }
> > +     }
> > +
> > +     if (reg_read(unicam, UNICAM_ICTL) & UNICAM_FCM) {
> > +             /* Switch out of trigger mode if selected */
> > +             reg_write_field(unicam, UNICAM_ICTL, 1, UNICAM_TFC);
> > +             reg_write_field(unicam, UNICAM_ICTL, 0, UNICAM_FCM);
> > +     }
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static int unicam_querycap(struct file *file, void *priv,
> > +                        struct v4l2_capability *cap)
> > +{
> > +     struct unicam_node *node =3D video_drvdata(file);
> > +     struct unicam_device *dev =3D node->dev;
> > +
> > +     strlcpy(cap->driver, UNICAM_MODULE_NAME, sizeof(cap->driver));
> > +     strlcpy(cap->card, UNICAM_MODULE_NAME, sizeof(cap->card));
>
> strscpy()?
>
> > +
> > +     snprintf(cap->bus_info, sizeof(cap->bus_info),
> > +              "platform:%s", dev_name(&dev->pdev->dev));
> > +
> > +     cap->capabilities |=3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_META_CAP=
TURE;
>
> Please also fill cap->device_caps.
>
> > +
> > +     return 0;
> > +}
> > +
> > +static int unicam_enum_fmt_vid_cap(struct file *file, void  *priv,
> > +                                struct v4l2_fmtdesc *f)
> > +{
> > +     struct unicam_node *node =3D video_drvdata(file);
> > +     struct unicam_device *dev =3D node->dev;
> > +     unsigned int index =3D 0;
> > +     unsigned int i;
> > +     int ret =3D 0;
> > +
> > +     if (node->pad_id !=3D IMAGE_PAD)
> > +             return -EINVAL;
> > +
> > +     for (i =3D 0; !ret && i < MAX_ENUM_MBUS_CODE; i++) {
> > +             struct v4l2_subdev_mbus_code_enum mbus_code =3D {
> > +                     .index =3D i,
> > +                     .pad =3D IMAGE_PAD,
> > +                     .which =3D V4L2_SUBDEV_FORMAT_ACTIVE,
> > +             };
> > +             const struct unicam_fmt *fmt;
> > +
> > +             ret =3D v4l2_subdev_call(dev->sensor, pad, enum_mbus_code=
,
> > +                                    NULL, &mbus_code);
> > +             if (ret < 0) {
> > +                     unicam_dbg(2, dev,
> > +                                "subdev->enum_mbus_code idx %d returne=
d %d - index invalid\n",
> > +                                i, ret);
> > +                     return -EINVAL;
> > +             }
> > +
> > +             fmt =3D find_format_by_code(mbus_code.code);
> > +             if (fmt) {
> > +                     if (fmt->fourcc) {
> > +                             if (index =3D=3D f->index) {
> > +                                     f->pixelformat =3D fmt->fourcc;
> > +                                     break;
> > +                             }
> > +                             index++;
> > +                     }
> > +                     if (fmt->repacked_fourcc) {
> > +                             if (index =3D=3D f->index) {
> > +                                     f->pixelformat =3D fmt->repacked_=
fourcc;
> > +                                     break;
> > +                             }
> > +                             index++;
> > +                     }
> > +             }
> > +     }

Following on from the above comment, we should check
if (i >=3D MAX_ENUM_MBUS_CODE)
    return -EINVAL;
rather than always returning 0 from here. Possibly add a WARN_ONCE as
well to flag the subdev bug?

  Dave
