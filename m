Return-Path: <linux-media+bounces-36040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06662AEA835
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 22:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5D691C43D2B
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 20:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BE62E7642;
	Thu, 26 Jun 2025 20:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CIb9VsIE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA89B23B63B;
	Thu, 26 Jun 2025 20:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750969693; cv=none; b=rMQf/vpHIfRiDFcIYlMuuTAZWgbwofbpT8YMpo9rQIMfV8CYahAWbwcFxwg3Kv/V7012cOw+tshSxhLkQDgYCsaIXaz96ntk5jPVjvoH9Tq0Y2uu3ofNK9MmM0HCxsUiOfKeViXC4mpOsu30rjMkv6ah+2aYoq+T64rf3xDWY3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750969693; c=relaxed/simple;
	bh=UO+ZZJLvcSeiXXxLx9yST1in7/LKn9xefRlHfXkoRwo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=j63jTGtIDxXVpaKZJlKeQM/hZIL4oc1Ol2yR3eRhqV32NsSIYkRqJXhvtkR9aNCtrF551gOKyRpB89mxlUcHGHh/Y8n98JfTNi1/HNy88xdrjqnsk3mkdsu6VOmLV/rj2jh4sbMfOsUOalitJz42kIulxc4sePaUOnVrspWa31Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CIb9VsIE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2601:602:8100:c320::cf66])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 151806BE;
	Thu, 26 Jun 2025 22:27:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750969670;
	bh=UO+ZZJLvcSeiXXxLx9yST1in7/LKn9xefRlHfXkoRwo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CIb9VsIEfjFYr9lRd+a/r3dKNclV9sFM9FwjrpKLSElNqA28EHEvyklV1e6CB431w
	 3JKBy24QvrMNSA2qI0Rs9RcRuwvd5LLxwjE6ekPzQNox864tviqqxicMoM/bzY0IgQ
	 BJa4zlvAhjEt7J7zLr+uL9YpsH9ouso+ot23inBs=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aFzh9jF0ZgODThJF@kekkonen.localdomain>
References: <20250410-probe_fixes-v2-0-801bc6eebdea@ideasonboard.com> <20250410-probe_fixes-v2-5-801bc6eebdea@ideasonboard.com> <aFzh9jF0ZgODThJF@kekkonen.localdomain>
Subject: Re: [PATCH v2 5/6] media: cadence: cdns-csi2rx: Support multiple pixels per clock cycle
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Devarsh Thakkar <devarsht@ti.com>, Rishikesh Donadkar <r-donadkar@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>, Changhuang Liang <changhuang.liang@starfivetech.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 26 Jun 2025 13:28:05 -0700
Message-ID: <175096968502.8144.14459853899575450802@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Hi Sakari,

Thanks for the review.

Quoting Sakari Ailus (2025-06-25 23:00:22)
> Hi Jai,
>=20
> Thanks for the patchset.
>=20
> On Thu, Apr 10, 2025 at 12:19:03PM +0530, Jai Luthra wrote:
> > The output pixel interface is a parallel bus (32 bits), which
> > supports sending multiple pixels (1, 2 or 4) per clock cycle for
> > smaller pixel widths like RAW8-RAW16.
> >=20
> > Dual-pixel and Quad-pixel modes can be a requirement if the export rate
> > of the Cadence IP in Single-pixel mode maxes out before the maximum
> > supported DPHY-RX frequency, which is the case with TI's integration of
> > this IP [1].
> >=20
> > So, we export a function that lets the downstream hardware block request
> > a higher pixel-per-clock on a particular output pad.
> >=20
> > We check if we can support the requested pixels per clock given the
> > known maximum for the currently configured format. If not, we set it
> > to the highest feasible value and return this value to the caller.
> >=20
> > [1] Section 12.6.1.4.8.14 CSI_RX_IF Programming Restrictions of AM62 TRM
> >=20
> > Link: https://www.ti.com/lit/pdf/spruj16
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  drivers/media/platform/cadence/cdns-csi2rx.c | 75 ++++++++++++++++++++=
+-------
> >  drivers/media/platform/cadence/cdns-csi2rx.h | 19 +++++++
> >  2 files changed, 76 insertions(+), 18 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/med=
ia/platform/cadence/cdns-csi2rx.c
> > index 608298c72462031515d9ad01c6b267bf7375a5bf..154eaacc39ad294db0524e8=
8be888bd0929af071 100644
> > --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> > +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> > @@ -5,6 +5,7 @@
> >   * Copyright (C) 2017 Cadence Design Systems Inc.
> >   */
> > =20
> > +#include <linux/bitfield.h>
> >  #include <linux/clk.h>
> >  #include <linux/delay.h>
> >  #include <linux/io.h>
> > @@ -22,6 +23,8 @@
> >  #include <media/v4l2-fwnode.h>
> >  #include <media/v4l2-subdev.h>
> > =20
> > +#include "cdns-csi2rx.h"
> > +
> >  #define CSI2RX_DEVICE_CFG_REG                        0x000
> > =20
> >  #define CSI2RX_SOFT_RESET_REG                        0x004
> > @@ -53,6 +56,8 @@
> > =20
> >  #define CSI2RX_STREAM_CFG_REG(n)             (CSI2RX_STREAM_BASE(n) + =
0x00c)
> >  #define CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF                (1 << 8)
>=20
> Not a fault of this patch but this should use BIT(). Or at the very least
> (1U << 8). I.e. this isn't a bug but the pattern is bad. It'd be nice to
> fix this in a separate patch.
>=20

Ah, that's my bad, rest of the driver does already use BIT().. will fix in
v3.

> > +#define CSI2RX_STREAM_CFG_NUM_PIXELS_MASK            GENMASK(5, 4)
> > +#define CSI2RX_STREAM_CFG_NUM_PIXELS(n)                      ((n) >> 1)
> > =20
> >  #define CSI2RX_LANES_MAX     4
> >  #define CSI2RX_STREAMS_MAX   4
> > @@ -68,7 +73,10 @@ enum csi2rx_pads {
> > =20
> >  struct csi2rx_fmt {
> >       u32                             code;
> > +     /* width of a single pixel on CSI-2 bus */
> >       u8                              bpp;
> > +     /* max pixels per clock supported on output bus */
> > +     u8                              max_pixels;
> >  };
> > =20
> >  struct csi2rx_priv {
> > @@ -90,6 +98,7 @@ struct csi2rx_priv {
> >       struct reset_control            *pixel_rst[CSI2RX_STREAMS_MAX];
> >       struct phy                      *dphy;
> > =20
> > +     u8                              num_pixels[CSI2RX_STREAMS_MAX];
> >       u8                              lanes[CSI2RX_LANES_MAX];
> >       u8                              num_lanes;
> >       u8                              max_lanes;
> > @@ -106,22 +115,22 @@ struct csi2rx_priv {
> >  };
> > =20
> >  static const struct csi2rx_fmt formats[] =3D {
> > -     { .code =3D MEDIA_BUS_FMT_YUYV8_1X16, .bpp =3D 16, },
> > -     { .code =3D MEDIA_BUS_FMT_UYVY8_1X16, .bpp =3D 16, },
> > -     { .code =3D MEDIA_BUS_FMT_YVYU8_1X16, .bpp =3D 16, },
> > -     { .code =3D MEDIA_BUS_FMT_VYUY8_1X16, .bpp =3D 16, },
> > -     { .code =3D MEDIA_BUS_FMT_SBGGR8_1X8, .bpp =3D 8, },
> > -     { .code =3D MEDIA_BUS_FMT_SGBRG8_1X8, .bpp =3D 8, },
> > -     { .code =3D MEDIA_BUS_FMT_SGRBG8_1X8, .bpp =3D 8, },
> > -     { .code =3D MEDIA_BUS_FMT_SRGGB8_1X8, .bpp =3D 8, },
> > -     { .code =3D MEDIA_BUS_FMT_Y8_1X8,     .bpp =3D 8, },
> > -     { .code =3D MEDIA_BUS_FMT_SBGGR10_1X10, .bpp =3D 10, },
> > -     { .code =3D MEDIA_BUS_FMT_SGBRG10_1X10, .bpp =3D 10, },
> > -     { .code =3D MEDIA_BUS_FMT_SGRBG10_1X10, .bpp =3D 10, },
> > -     { .code =3D MEDIA_BUS_FMT_SRGGB10_1X10, .bpp =3D 10, },
> > -     { .code =3D MEDIA_BUS_FMT_RGB565_1X16,  .bpp =3D 16, },
> > -     { .code =3D MEDIA_BUS_FMT_RGB888_1X24,  .bpp =3D 24, },
> > -     { .code =3D MEDIA_BUS_FMT_BGR888_1X24,  .bpp =3D 24, },
> > +     { .code =3D MEDIA_BUS_FMT_YUYV8_1X16, .bpp =3D 16, .max_pixels =
=3D 2, },
> > +     { .code =3D MEDIA_BUS_FMT_UYVY8_1X16, .bpp =3D 16, .max_pixels =
=3D 2, },
> > +     { .code =3D MEDIA_BUS_FMT_YVYU8_1X16, .bpp =3D 16, .max_pixels =
=3D 2, },
> > +     { .code =3D MEDIA_BUS_FMT_VYUY8_1X16, .bpp =3D 16, .max_pixels =
=3D 2, },
> > +     { .code =3D MEDIA_BUS_FMT_SBGGR8_1X8, .bpp =3D 8, .max_pixels =3D=
 4, },
> > +     { .code =3D MEDIA_BUS_FMT_SGBRG8_1X8, .bpp =3D 8, .max_pixels =3D=
 4, },
> > +     { .code =3D MEDIA_BUS_FMT_SGRBG8_1X8, .bpp =3D 8, .max_pixels =3D=
 4, },
> > +     { .code =3D MEDIA_BUS_FMT_SRGGB8_1X8, .bpp =3D 8, .max_pixels =3D=
 4, },
> > +     { .code =3D MEDIA_BUS_FMT_Y8_1X8,     .bpp =3D 8, .max_pixels =3D=
 4, },
> > +     { .code =3D MEDIA_BUS_FMT_SBGGR10_1X10, .bpp =3D 10, .max_pixels =
=3D 2, },
> > +     { .code =3D MEDIA_BUS_FMT_SGBRG10_1X10, .bpp =3D 10, .max_pixels =
=3D 2, },
> > +     { .code =3D MEDIA_BUS_FMT_SGRBG10_1X10, .bpp =3D 10, .max_pixels =
=3D 2, },
> > +     { .code =3D MEDIA_BUS_FMT_SRGGB10_1X10, .bpp =3D 10, .max_pixels =
=3D 2, },
> > +     { .code =3D MEDIA_BUS_FMT_RGB565_1X16,  .bpp =3D 16, .max_pixels =
=3D 1, },
> > +     { .code =3D MEDIA_BUS_FMT_RGB888_1X24,  .bpp =3D 24, .max_pixels =
=3D 1, },
> > +     { .code =3D MEDIA_BUS_FMT_BGR888_1X24,  .bpp =3D 24, .max_pixels =
=3D 1, },
> >  };
> > =20
> >  static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
> > @@ -276,8 +285,10 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
> > =20
> >               reset_control_deassert(csi2rx->pixel_rst[i]);
> > =20
> > -             writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF,
> > -                    csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
> > +             reg =3D CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF;
> > +             reg |=3D FIELD_PREP(CSI2RX_STREAM_CFG_NUM_PIXELS_MASK,
> > +                               csi2rx->num_pixels[i]);
> > +             writel(reg, csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
>=20
> I'd write this as:
>=20
>                 writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF |
>                        FIELD_PREP(CSI2RX_STREAM_CFG_NUM_PIXELS_MASK,
>                                   csi2rx->num_pixels[i]),
>                        csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
>=20
> But up to you.
>=20

Will do in v3.

> > =20
> >               /*
> >                * Enable one virtual channel. When multiple virtual chan=
nels
> > @@ -458,6 +469,34 @@ static int csi2rx_init_state(struct v4l2_subdev *s=
ubdev,
> >       return csi2rx_set_fmt(subdev, state, &format);
> >  }
> > =20
> > +int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int=
 pad,
> > +                           u8 *ppc)
> > +{
> > +     struct csi2rx_priv *csi2rx =3D v4l2_subdev_to_csi2rx(subdev);
> > +     const struct csi2rx_fmt *csi_fmt;
> > +     struct v4l2_subdev_state *state;
> > +     struct v4l2_mbus_framefmt *fmt;
> > +     int ret =3D 0;
>=20
> ret is redundant.
>=20

Good catch, will fix.

> > +
> > +     if (!ppc || pad < CSI2RX_PAD_SOURCE_STREAM0 || pad >=3D CSI2RX_PA=
D_MAX)
> > +             return -EINVAL;
> > +
> > +     state =3D v4l2_subdev_lock_and_get_active_state(subdev);
> > +     fmt =3D v4l2_subdev_state_get_format(state, pad);
> > +     csi_fmt =3D csi2rx_get_fmt_by_code(fmt->code);
> > +
> > +     /* Reduce requested PPC if it is too high */
> > +     *ppc =3D min(*ppc, csi_fmt->max_pixels);
> > +
> > +     v4l2_subdev_unlock_state(state);
> > +
> > +     csi2rx->num_pixels[pad - CSI2RX_PAD_SOURCE_STREAM0] =3D
> > +             CSI2RX_STREAM_CFG_NUM_PIXELS(*ppc);
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL(cdns_csi2rx_negotiate_ppc);
>=20
> EXPORT_SYMBOL_GPL(). Or maybe use a namespace?
>=20

Ah I wasn't aware of different namespaces. I think a module-specific one as
documented here [1] might make the most sense in this case. Will try that,
else will use _GPL.

[1] https://docs.kernel.org/core-api/symbol-namespaces.html#using-the-expor=
t-symbol-gpl-for-modules-macro

> > +
> >  static const struct v4l2_subdev_pad_ops csi2rx_pad_ops =3D {
> >       .enum_mbus_code =3D csi2rx_enum_mbus_code,
> >       .get_fmt        =3D v4l2_subdev_get_fmt,
> > diff --git a/drivers/media/platform/cadence/cdns-csi2rx.h b/drivers/med=
ia/platform/cadence/cdns-csi2rx.h
>=20
> I wonder if it'd be better to put this under include/media.
>=20

I was unsure about it, as while these are two separate drivers it's
essentially the same "device".. but I don't see a harm in keeping this
under include/media. Will do in v3.

> > new file mode 100644
> > index 0000000000000000000000000000000000000000..128d47e8513c99c083f49e2=
49e876be6d19389f6
> > --- /dev/null
> > +++ b/drivers/media/platform/cadence/cdns-csi2rx.h
> > @@ -0,0 +1,19 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +#ifndef CDNS_CSI2RX_H
> > +#define CDNS_CSI2RX_H
> > +
> > +#include <media/v4l2-subdev.h>
> > +
> > +/**
> > + * cdns_csi2rx_negotiate_ppc - Negotiate pixel-per-clock on output int=
erface
> > + *
> > + * @subdev: point to &struct v4l2_subdev
> > + * @pad: pad number of the source pad
> > + * @ppc: pointer to requested pixel-per-clock value
> > + *
> > + * Returns 0 on success, negative error code otherwise.
> > + */
> > +int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int=
 pad,
> > +                           u8 *ppc);
> > +
> > +#endif
> >=20
>=20
> --=20
> Regards,
>=20
> Sakari Ailus

Thanks,
Jai

