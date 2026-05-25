Return-Path: <linux-media+bounces-62721-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEV8DfpbFGpxMwcAu9opvQ
	(envelope-from <linux-media+bounces-62721-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 16:26:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C125CBB30
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 16:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6F5B30131EB
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 14:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6CF3ED5A2;
	Mon, 25 May 2026 14:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uHczCGPm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5925D3ED3A6;
	Mon, 25 May 2026 14:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779719153; cv=none; b=XgOvZdWyQYKp+QUcfq2ZkU8gcAL+/pTMM0wn4gNTPv1GsZyVzHOFa3DvAwm/54zRoPpeD4q5ZXjR5DfrMNL8kt+SIzQhFirEXumQSXDLumFJG7rj9zEezdYxrgpv6MI4zRPpswuwqULwhjHIFXV5PdudIETA1g1r/snnVkbEBjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779719153; c=relaxed/simple;
	bh=V3RXhQiJsjp7w9HPTUyCq67XD+/QNEDjLqJo66S30lo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=YzHQWp7jGJeoUzN9ZsXzBcrRWquEfPeEDlNTqgnVXlP1nqcxxNPuWCqYxLK+ZimS0tXeZGMqWT8a06Vcb7s/kBQUVf+KXOV7ShahwVCgaEeNQLaDPlL2Ntgv/Mlv24RLgE0AEjpSvMUdfUf9bazzEJAAweqXNvcLWk3YmFBQjFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uHczCGPm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:ad48:920a:da6f:a034])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07A99A2F;
	Mon, 25 May 2026 16:25:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779719129;
	bh=V3RXhQiJsjp7w9HPTUyCq67XD+/QNEDjLqJo66S30lo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=uHczCGPmuVpW/Fr+dy8yyEDF2BWoZsm2EnWaNlI2b69gQUaeq/jgWBOiB766ipFqx
	 P5g2W7uNkZ7QjB7zW1pRGyN+lefk3s1yNcx5y87XbTl4wenRsgvb+jkRL01fx1yidK
	 uS3H9vK+XTkGtT4uaprBmx389XnLfjA437v83DQY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ag7oq5jO5G0rwvzb@kekkonen.localdomain>
References: <20260520-imx678-v3-0-8b5f9676486e@ideasonboard.com> <20260520-imx678-v3-2-8b5f9676486e@ideasonboard.com> <ag7oq5jO5G0rwvzb@kekkonen.localdomain>
Subject: Re: [PATCH v3 2/2] media: i2c: imx678: Add driver for Sony IMX678
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Lachlan Michael <Lachlan.Michael@sony.com>, Ryuichi Tadano <Ryuichi.Tadano@sony.com>, Kengo Hayasaka <Kengo.Hayasaka@sony.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Mon, 25 May 2026 16:25:42 +0200
Message-ID: <177971914277.2341049.16987956693773109448@selene>
User-Agent: alot/0.12.dev70+g31692a239
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62721-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rect.top:url,willwhang.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:email,ideasonboard.com:dkim,soho-enterprise.com:email]
X-Rspamd-Queue-Id: 57C125CBB30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

   Thanks for the review.

Quoting Sakari Ailus (2026-05-21 13:12:43)
> Hi Jai,
>=20
> Thanks for the set.
>=20
> On Wed, May 20, 2026 at 05:17:26PM +0200, Jai Luthra wrote:
> > Add a V4L2 subdev driver for the Sony IMX678 image sensor.
> >=20
> > IMX678 is a diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type
> > solid-state image sensor with a square pixel array and 8.40 M effective
> > pixels.
> >=20
> > The following features are supported by the driver:
> > - Monochrome and Color (Bayer filter) variants
> > - Multiple input clock frequencies supported
> > - Multiple link frequencies supported
> > - VBLANK and HBLANK control for variable framerate
> > - Freely configurable crop rectangle through S_SELECTION ioctl
> > - Configurable resolution with 2x2 binning (for the current crop)
> >   through S_FMT ioctl
> > - VFLIP and HFLIP control for flipping readout
> > - Test pattern control support
> > - Exposure and gain control
> > - MIPI RAW12 output
> >=20
> > Following features are not currently supported but may be added later:
> > - Pixel-perfect crop reporting, account for the shift-by-1 when flipping
> >   using HFLIP/VFLIP, which maintains the bayer readout order
> > - Increased framerate (lower HMAX/VMAX) when cropping
> > - MIPI RAW10 output mode
> > - Embedded data stream
> >=20
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> > Changes in v3:
> > - Use `reset-gpios`instead of `xclr-gpios`, inverting the logic in
> >   driver
> > - Update minimum crop width and height according to the PIX_[HV]WIDTH
> >   register limits
> > - Expect the user to first select a crop rectangle using S_SELECTION,
> >   and then choose one of two sizes (non-binned or binned) in S_FMT. This
> >   matches what IMX296 already does, simplifying the selection logic
> >   quite a bit.
> > - Enumerate only the frame sizes possible for the current crop rectangle
> >   in ENUM_FRAMESIZES
> >=20
> > Changes in v2:
> > - Treat the pixel rate as a fixed sensor property rather than deriving
> >   it from link frequency and bit depth. Removes the iclk<->pixel
> >   conversion helpers, instead using a fixed 8x ratio.
> > - Express HBLANK in pixels with a step of 8.
> > - Make VBLANK step =3D 2 and rewrite the exposure register when VBLANK
> >   changes, so the effective exposure does not silently shift.
> > - Fix power sequencing: hold the sensor in reset until power_on, add the
> >   missing post-reset delay, and disable the clock before the regulators
> >   on power_off.
> > - Drop the "common regs written" flag, program them in power_on.
> > - Add variant match data and cross-check the register-reported type
> >   against DT; rename detect() to identify_model().
> > - Use v4l2_link_freq_to_bitmap() and expose the full link frequency menu
> >   with the configured one as the selected RO option.
> > - Drop unused includes and defines, misc cleanups
> > - Kconfig: depend on OF_GPIO
> > ---
> >  MAINTAINERS                |    1 +
> >  drivers/media/i2c/Kconfig  |   11 +
> >  drivers/media/i2c/Makefile |    1 +
> >  drivers/media/i2c/imx678.c | 1599 ++++++++++++++++++++++++++++++++++++=
++++++++
> >  4 files changed, 1612 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 6b368345a771..2cc6913fa058 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -24916,6 +24916,7 @@ M:    Jai Luthra <jai.luthra@ideasonboard.com>
> >  L:   linux-media@vger.kernel.org
> >  S:   Maintained
> >  F:   Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
> > +F:   drivers/media/i2c/imx678.c
> > =20
> >  SONY MEMORYSTICK SUBSYSTEM
> >  M:   Maxim Levitsky <maximlevitsky@gmail.com>
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index 8f2ba4121586..26b938466825 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -287,6 +287,17 @@ config VIDEO_IMX415
> >         To compile this driver as a module, choose M here: the
> >         module will be called imx415.
> > =20
> > +config VIDEO_IMX678
> > +     tristate "Sony IMX678 sensor support"
> > +     depends on OF_GPIO
>=20
> Maybe
>=20
>         depends on GPIOLIB
>=20
> instead?
>=20

Ack.

> > +     select V4L2_CCI_I2C
> > +     help
> > +       This is a Video4Linux2 sensor driver for the Sony
> > +       IMX678 camera.
> > +
> > +       To compile this driver as a module, choose M here: the
> > +       module will be called imx678.
> > +
> >  config VIDEO_MAX9271_LIB
> >       tristate
> > =20
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index 90b276a7417a..d9d9a6512875 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -61,6 +61,7 @@ obj-$(CONFIG_VIDEO_IMX335) +=3D imx335.o
> >  obj-$(CONFIG_VIDEO_IMX355) +=3D imx355.o
> >  obj-$(CONFIG_VIDEO_IMX412) +=3D imx412.o
> >  obj-$(CONFIG_VIDEO_IMX415) +=3D imx415.o
> > +obj-$(CONFIG_VIDEO_IMX678) +=3D imx678.o
> >  obj-$(CONFIG_VIDEO_IR_I2C) +=3D ir-kbd-i2c.o
> >  obj-$(CONFIG_VIDEO_ISL7998X) +=3D isl7998x.o
> >  obj-$(CONFIG_VIDEO_KS0127) +=3D ks0127.o
> > diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/imx678.c
> > new file mode 100644
> > index 000000000000..5ac710b7e38b
> > --- /dev/null
> > +++ b/drivers/media/i2c/imx678.c
> > @@ -0,0 +1,1599 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * V4L2 driver for Sony IMX678
> > + *
> > + * Diagonal 8.86 mm (Type 1/1.8) CMOS image sensor with 8.40 M effecti=
ve pixels.
> > + *
> > + * Copyright (C) 2026 Ideas On Board Oy.
> > + *
> > + * Based on Sony IMX678 driver prepared by Will Whang & Soho Enterpris=
e Ltd.
> > + */
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_graph.h>
>=20
> #include <linux/property.h>
>=20

Ack.

> > +#include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <media/v4l2-cci.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-mediabus.h>
> > +#include <media/v4l2-rect.h>
> > +#include <media/v4l2-subdev.h>
> > +
> > +/* Standby or streaming mode */
> > +#define IMX678_REG_MODE_SELECT          CCI_REG8(0x3000)
> > +#define IMX678_MODE_STANDBY             0x01
> > +#define IMX678_MODE_STREAMING           0x00
> > +#define IMX678_STREAM_DELAY_US          25000
> > +#define IMX678_STREAM_DELAY_RANGE_US    1000
> > +
> > +/* XVS/XHS sync control */
> > +#define IMX678_REG_XMSTA                CCI_REG8(0x3002)
> > +#define IMX678_REG_XXS_DRV              CCI_REG8(0x30A6)
> > +#define IMX678_REG_XXS_OUTSEL           CCI_REG8(0x30A4)
> > +
> > +/* Clk selection */
> > +#define IMX678_REG_INCK_SEL             CCI_REG8(0x3014)
> > +
> > +/* Link Speed */
> > +#define IMX678_REG_DATARATE_SEL         CCI_REG8(0x3015)
> > +
> > +/* Lane Count */
> > +#define IMX678_REG_LANEMODE             CCI_REG8(0x3040)
> > +
> > +/*
> > + * The internal readout clock runs at 74.25 Hz. In one cycle the AD re=
ads 8
> > + * pixels, thus giving us a rate of 74.25 * 8 =3D 594 MPix/s
> > + */
> > +#define IMX678_PIXEL_RATE            594000000
> > +#define IMX678_PIX_PER_CLK           8
> > +
> > +/* VMAX - Frame Length in Lines */
> > +#define IMX678_REG_VMAX                 CCI_REG24_LE(0x3028)
> > +#define IMX678_VMAX_MAX                 0xfffff
> > +#define IMX678_VMAX_DEFAULT             2250
> > +
> > +/* HMAX - Line Length in Cycles (8 Pixels) */
> > +#define IMX678_REG_HMAX                 CCI_REG16_LE(0x302C)
> > +#define IMX678_HMAX_MAX                 0xffff
> > +
> > +/* SHR internal */
> > +#define IMX678_REG_SHR                  CCI_REG24_LE(0x3050)
> > +#define IMX678_SHR_MIN                  8
> > +
> > +/* Exposure control */
> > +#define IMX678_EXPOSURE_MIN             2
> > +#define IMX678_EXPOSURE_STEP            1
> > +#define IMX678_EXPOSURE_DEFAULT         1000
> > +
> > +/* Analog gain control */
> > +#define IMX678_REG_ANALOG_GAIN          CCI_REG16_LE(0x3070)
> > +#define IMX678_ANA_GAIN_MIN_NORMAL      0
> > +#define IMX678_ANA_GAIN_MAX_NORMAL      240
> > +#define IMX678_ANA_GAIN_STEP            1
> > +#define IMX678_ANA_GAIN_DEFAULT         0
> > +
> > +/* Crop */
> > +#define IMX678_REG_WINMODE           CCI_REG8(0x3018)
> > +#define IMX678_REG_PIX_HST           CCI_REG16_LE(0x303c)
> > +#define IMX678_REG_PIX_HWIDTH                CCI_REG16_LE(0x303e)
> > +#define IMX678_REG_PIX_VST           CCI_REG16_LE(0x3044)
> > +#define IMX678_REG_PIX_VWIDTH                CCI_REG16_LE(0x3046)
> > +
> > +/* Flip */
> > +#define IMX678_REG_WINMODEH             CCI_REG8(0x3020)
> > +#define IMX678_REG_WINMODEV             CCI_REG8(0x3021)
> > +
> > +/* Sensor Identification */
> > +#define IMX678_REG_MONOCHROME                CCI_REG8(0x4D18)
> > +#define IMX678_TYPE                  BIT(0)
> > +#define IMX678_REG_MODULE_ID         CCI_REG16_LE(0x4D1C)
> > +#define IMX678_ID                    0x02a6
> > +#define IMX678_MODULE_ID_DELAY               80000
> > +
> > +/* Common configuration registers */
> > +#define IMX678_REG_WDMODE               CCI_REG8(0x301A)
> > +#define IMX678_REG_ADDMODE              CCI_REG8(0x301B)
> > +#define IMX678_REG_THIN_V_EN            CCI_REG8(0x301C)
> > +#define IMX678_REG_VCMODE               CCI_REG8(0x301E)
> > +#define IMX678_REG_ADBIT                CCI_REG8(0x3022)
> > +#define IMX678_REG_MDBIT                CCI_REG8(0x3023)
> > +#define IMX678_REG_GAIN_PGC_FIDMD       CCI_REG8(0x3400)
>=20
> Lower case hexadecimals, please.
>=20

Ack.

> > +
> > +/* Test pattern generator */
> > +#define IMX678_REG_TPG_EN_DUOUT              CCI_REG8(0x30E0)
> > +#define IMX678_REG_TPG_PATSEL_DUOUT  CCI_REG8(0x30E2)
> > +#define IMX678_TPG_ALL_000           0
> > +#define IMX678_TPG_ALL_FFF           1
> > +#define IMX678_TPG_ALL_555           2
> > +#define IMX678_TPG_ALL_AAA           3
> > +#define IMX678_TPG_TOG_555_AAA               4
> > +#define IMX678_TPG_TOG_AAA_555               5
> > +#define IMX678_TPG_TOG_000_555               6
> > +#define IMX678_TPG_TOG_555_000               7
> > +#define IMX678_TPG_TOG_000_FFF               8
> > +#define IMX678_TPG_TOG_FFF_000               9
> > +#define IMX678_TPG_H_COLOR_BARS              10
> > +#define IMX678_TPG_V_COLOR_BARS              11
> > +#define IMX678_REG_TPG_COLORWIDTH    CCI_REG8(0x30E4)
> > +#define IMX678_TPG_COLORWIDTH_80PIX  0
> > +#define IMX678_TPG_COLORWIDTH_160PIX 1
> > +#define IMX678_TPG_COLORWIDTH_320PIX 2
> > +#define IMX678_TPG_COLORWIDTH_640PIX 3
> > +
> > +#define IMX678_REG_INTERFACE_SEL     CCI_REG8(0x4E3C)
> > +#define IMX678_INTERFACE_2L_4L               0x07
> > +#define IMX678_INTERFACE_8L_2x4L     0x7f
> > +
> > +/* Minimum output resolution */
> > +#define IMX678_PIXEL_ARRAY_MIN_WIDTH 1040
> > +#define IMX678_PIXEL_ARRAY_MIN_HEIGHT        956
> > +
> > +/* Sensor windowing register alignment */
> > +#define IMX678_CROP_HWIDTH_ALIGN     16
> > +#define IMX678_CROP_VWIDTH_ALIGN     4
> > +#define IMX678_CROP_HST_ALIGN                4
> > +#define IMX678_CROP_VST_ALIGN                4
> > +
> > +/* IMX678 native and active pixel array size. */
> > +static const struct v4l2_rect imx678_native_area =3D {
> > +     .top =3D 0,
> > +     .left =3D 0,
> > +     .width =3D 3857,
> > +     .height =3D 2201,
> > +};
> > +
> > +static const struct v4l2_rect imx678_active_area =3D {
> > +     .top =3D 20,
> > +     .left =3D 0,
> > +     .width =3D 3856,
> > +     .height =3D 2180,
> > +};
> > +
> > +enum imx678_type {
> > +     IMX678_COLOR =3D 0,
> > +     IMX678_MONOCHROME =3D 1,
> > +};
> > +
> > +struct imx678_model_info {
> > +     enum imx678_type type;
> > +};
> > +
> > +static const struct imx678_model_info imx678_aaqr_info =3D {
> > +     .type =3D IMX678_COLOR,
> > +};
> > +
> > +static const struct imx678_model_info imx678_aamr_info =3D {
> > +     .type =3D IMX678_MONOCHROME,
> > +};
> > +
> > +enum imx678_lanemode {
> > +     IMX678_LANEMODE_2L =3D 1,
> > +     IMX678_LANEMODE_4L =3D 3,
> > +};
> > +
> > +/* Link frequency setup (DDR: lane rate =3D 2 x link freq) */
> > +enum {
> > +     IMX678_LINK_FREQ_297MHZ,
> > +     IMX678_LINK_FREQ_360MHZ,
> > +     IMX678_LINK_FREQ_445MHZ,
> > +     IMX678_LINK_FREQ_594MHZ,
> > +     IMX678_LINK_FREQ_720MHZ,
> > +     IMX678_LINK_FREQ_891MHZ,
> > +     IMX678_LINK_FREQ_1039MHZ,
> > +     IMX678_LINK_FREQ_1188MHZ,
> > +};
> > +
> > +static const u8 link_freqs_reg_value[] =3D {
> > +     [IMX678_LINK_FREQ_297MHZ]  =3D 0x07,
> > +     [IMX678_LINK_FREQ_360MHZ]  =3D 0x06,
> > +     [IMX678_LINK_FREQ_445MHZ]  =3D 0x05,
> > +     [IMX678_LINK_FREQ_594MHZ]  =3D 0x04,
> > +     [IMX678_LINK_FREQ_720MHZ]  =3D 0x03,
> > +     [IMX678_LINK_FREQ_891MHZ]  =3D 0x02,
> > +     [IMX678_LINK_FREQ_1039MHZ] =3D 0x01,
> > +     [IMX678_LINK_FREQ_1188MHZ] =3D 0x00,
> > +};
> > +
> > +static const u64 link_freqs[] =3D {
> > +     [IMX678_LINK_FREQ_297MHZ]  =3D 297000000,
> > +     [IMX678_LINK_FREQ_360MHZ]  =3D 360000000,
> > +     [IMX678_LINK_FREQ_445MHZ]  =3D 445500000,
> > +     [IMX678_LINK_FREQ_594MHZ]  =3D 594000000,
> > +     [IMX678_LINK_FREQ_720MHZ]  =3D 720000000,
> > +     [IMX678_LINK_FREQ_891MHZ]  =3D 891000000,
> > +     [IMX678_LINK_FREQ_1039MHZ] =3D 1039500000,
> > +     [IMX678_LINK_FREQ_1188MHZ] =3D 1188000000,
> > +};
> > +
> > +static const u16 min_hmax_4lane[] =3D {
> > +     [IMX678_LINK_FREQ_297MHZ] =3D 1584,
> > +     [IMX678_LINK_FREQ_360MHZ] =3D 1320,
> > +     [IMX678_LINK_FREQ_445MHZ] =3D 1100,
> > +     [IMX678_LINK_FREQ_594MHZ] =3D  792,
> > +     [IMX678_LINK_FREQ_720MHZ] =3D  660,
> > +     [IMX678_LINK_FREQ_891MHZ] =3D  550,
> > +     [IMX678_LINK_FREQ_1039MHZ] =3D 550,
> > +     [IMX678_LINK_FREQ_1188MHZ] =3D 550,
> > +};
> > +
> > +struct imx678_inck_cfg {
> > +     u32 xclk_hz;   /* platform clock rate  */
> > +     u8  inck_sel;  /* value for reg        */
> > +};
> > +
> > +static const struct imx678_inck_cfg imx678_inck_table[] =3D {
> > +     { 74250000, 0x00 },
> > +     { 37125000, 0x01 },
> > +     { 72000000, 0x02 },
> > +     { 27000000, 0x03 },
> > +     { 24000000, 0x04 },
> > +     { 36000000, 0x05 },
> > +     { 18000000, 0x06 },
> > +     { 13500000, 0x07 },
> > +};
> > +
> > +static const char * const imx678_tpg_menu[] =3D {
> > +     "Disabled",
> > +     "All 000h",
> > +     "All FFFh",
> > +     "All 555h",
> > +     "All AAAh",
> > +     "Toggle 555/AAAh",
> > +     "Toggle AAA/555h",
> > +     "Toggle 000/555h",
> > +     "Toggle 555/000h",
> > +     "Toggle 000/FFFh",
> > +     "Toggle FFF/000h",
> > +     "Horizontal color bars",
> > +     "Vertical color bars",
> > +};
> > +
> > +static const int imx678_tpg_val[] =3D {
> > +     IMX678_TPG_ALL_000,
> > +     IMX678_TPG_ALL_000,
> > +     IMX678_TPG_ALL_FFF,
> > +     IMX678_TPG_ALL_555,
> > +     IMX678_TPG_ALL_AAA,
> > +     IMX678_TPG_TOG_555_AAA,
> > +     IMX678_TPG_TOG_AAA_555,
> > +     IMX678_TPG_TOG_000_555,
> > +     IMX678_TPG_TOG_555_000,
> > +     IMX678_TPG_TOG_000_FFF,
> > +     IMX678_TPG_TOG_FFF_000,
> > +     IMX678_TPG_H_COLOR_BARS,
> > +     IMX678_TPG_V_COLOR_BARS,
> > +};
> > +
> > +/* IMX678 Register List */
> > +/* Common Modes */
> > +static const struct cci_reg_sequence common_regs[] =3D {
> > +     {IMX678_REG_THIN_V_EN, 0x00},
>=20
> Spaces inside braces, please.
>=20

Ack.

> > +     {IMX678_REG_VCMODE, 0x01},
> > +     {CCI_REG8(0x306B), 0x00},
> > +     {IMX678_REG_GAIN_PGC_FIDMD, 0x01},
> > +     {CCI_REG8(0x3460), 0x22},
> > +     {CCI_REG8(0x355A), 0x64},
> > +     {CCI_REG8(0x3A02), 0x7A},
> > +     {CCI_REG8(0x3A10), 0xEC},
> > +     {CCI_REG8(0x3A12), 0x71},
> > +     {CCI_REG8(0x3A14), 0xDE},
> > +     {CCI_REG8(0x3A20), 0x2B},
> > +     {CCI_REG8(0x3A24), 0x22},
> > +     {CCI_REG8(0x3A25), 0x25},
> > +     {CCI_REG8(0x3A26), 0x2A},
> > +     {CCI_REG8(0x3A27), 0x2C},
> > +     {CCI_REG8(0x3A28), 0x39},
> > +     {CCI_REG8(0x3A29), 0x38},
> > +     {CCI_REG8(0x3A30), 0x04},
> > +     {CCI_REG8(0x3A31), 0x04},
> > +     {CCI_REG8(0x3A32), 0x03},
> > +     {CCI_REG8(0x3A33), 0x03},
> > +     {CCI_REG8(0x3A34), 0x09},
> > +     {CCI_REG8(0x3A35), 0x06},
> > +     {CCI_REG8(0x3A38), 0xCD},
> > +     {CCI_REG8(0x3A3A), 0x4C},
> > +     {CCI_REG8(0x3A3C), 0xB9},
> > +     {CCI_REG8(0x3A3E), 0x30},
> > +     {CCI_REG8(0x3A40), 0x2C},
> > +     {CCI_REG8(0x3A42), 0x39},
> > +     {CCI_REG8(0x3A4E), 0x00},
> > +     {CCI_REG8(0x3A52), 0x00},
> > +     {CCI_REG8(0x3A56), 0x00},
> > +     {CCI_REG8(0x3A5A), 0x00},
> > +     {CCI_REG8(0x3A5E), 0x00},
> > +     {CCI_REG8(0x3A62), 0x00},
> > +     {CCI_REG8(0x3A64), 0x00},
> > +     {CCI_REG8(0x3A6E), 0xA0},
> > +     {CCI_REG8(0x3A70), 0x50},
> > +     {CCI_REG8(0x3A8C), 0x04},
> > +     {CCI_REG8(0x3A8D), 0x03},
> > +     {CCI_REG8(0x3A8E), 0x09},
> > +     {CCI_REG8(0x3A90), 0x38},
> > +     {CCI_REG8(0x3A91), 0x42},
> > +     {CCI_REG8(0x3A92), 0x3C},
> > +     {CCI_REG8(0x3B0E), 0xF3},
> > +     {CCI_REG8(0x3B12), 0xE5},
> > +     {CCI_REG8(0x3B27), 0xC0},
> > +     {CCI_REG8(0x3B2E), 0xEF},
> > +     {CCI_REG8(0x3B30), 0x6A},
> > +     {CCI_REG8(0x3B32), 0xF6},
> > +     {CCI_REG8(0x3B36), 0xE1},
> > +     {CCI_REG8(0x3B3A), 0xE8},
> > +     {CCI_REG8(0x3B5A), 0x17},
> > +     {CCI_REG8(0x3B5E), 0xEF},
> > +     {CCI_REG8(0x3B60), 0x6A},
> > +     {CCI_REG8(0x3B62), 0xF6},
> > +     {CCI_REG8(0x3B66), 0xE1},
> > +     {CCI_REG8(0x3B6A), 0xE8},
> > +     {CCI_REG8(0x3B88), 0xEC},
> > +     {CCI_REG8(0x3B8A), 0xED},
> > +     {CCI_REG8(0x3B94), 0x71},
> > +     {CCI_REG8(0x3B96), 0x72},
> > +     {CCI_REG8(0x3B98), 0xDE},
> > +     {CCI_REG8(0x3B9A), 0xDF},
> > +     {CCI_REG8(0x3C0F), 0x06},
> > +     {CCI_REG8(0x3C10), 0x06},
> > +     {CCI_REG8(0x3C11), 0x06},
> > +     {CCI_REG8(0x3C12), 0x06},
> > +     {CCI_REG8(0x3C13), 0x06},
> > +     {CCI_REG8(0x3C18), 0x20},
> > +     {CCI_REG8(0x3C37), 0x10},
> > +     {CCI_REG8(0x3C3A), 0x7A},
> > +     {CCI_REG8(0x3C40), 0xF4},
> > +     {CCI_REG8(0x3C48), 0xE6},
> > +     {CCI_REG8(0x3C54), 0xCE},
> > +     {CCI_REG8(0x3C56), 0xD0},
> > +     {CCI_REG8(0x3C6C), 0x53},
> > +     {CCI_REG8(0x3C6E), 0x55},
> > +     {CCI_REG8(0x3C70), 0xC0},
> > +     {CCI_REG8(0x3C72), 0xC2},
> > +     {CCI_REG8(0x3C7E), 0xCE},
> > +     {CCI_REG8(0x3C8C), 0xCF},
> > +     {CCI_REG8(0x3C8E), 0xEB},
> > +     {CCI_REG8(0x3C98), 0x54},
> > +     {CCI_REG8(0x3C9A), 0x70},
> > +     {CCI_REG8(0x3C9C), 0xC1},
> > +     {CCI_REG8(0x3C9E), 0xDD},
> > +     {CCI_REG8(0x3CB0), 0x7A},
> > +     {CCI_REG8(0x3CB2), 0xBA},
> > +     {CCI_REG8(0x3CC8), 0xBC},
> > +     {CCI_REG8(0x3CCA), 0x7C},
> > +     {CCI_REG8(0x3CD4), 0xEA},
> > +     {CCI_REG8(0x3CD5), 0x01},
> > +     {CCI_REG8(0x3CD6), 0x4A},
> > +     {CCI_REG8(0x3CD8), 0x00},
> > +     {CCI_REG8(0x3CD9), 0x00},
> > +     {CCI_REG8(0x3CDA), 0xFF},
> > +     {CCI_REG8(0x3CDB), 0x03},
> > +     {CCI_REG8(0x3CDC), 0x00},
> > +     {CCI_REG8(0x3CDD), 0x00},
> > +     {CCI_REG8(0x3CDE), 0xFF},
> > +     {CCI_REG8(0x3CDF), 0x03},
> > +     {CCI_REG8(0x3CE4), 0x4C},
> > +     {CCI_REG8(0x3CE6), 0xEC},
> > +     {CCI_REG8(0x3CE7), 0x01},
> > +     {CCI_REG8(0x3CE8), 0xFF},
> > +     {CCI_REG8(0x3CE9), 0x03},
> > +     {CCI_REG8(0x3CEA), 0x00},
> > +     {CCI_REG8(0x3CEB), 0x00},
> > +     {CCI_REG8(0x3CEC), 0xFF},
> > +     {CCI_REG8(0x3CED), 0x03},
> > +     {CCI_REG8(0x3CEE), 0x00},
> > +     {CCI_REG8(0x3CEF), 0x00},
> > +     {CCI_REG8(0x3CF2), 0xFF},
> > +     {CCI_REG8(0x3CF3), 0x03},
> > +     {CCI_REG8(0x3CF4), 0x00},
> > +     {CCI_REG8(0x3E28), 0x82},
> > +     {CCI_REG8(0x3E2A), 0x80},
> > +     {CCI_REG8(0x3E30), 0x85},
> > +     {CCI_REG8(0x3E32), 0x7D},
> > +     {CCI_REG8(0x3E5C), 0xCE},
> > +     {CCI_REG8(0x3E5E), 0xD3},
> > +     {CCI_REG8(0x3E70), 0x53},
> > +     {CCI_REG8(0x3E72), 0x58},
> > +     {CCI_REG8(0x3E74), 0xC0},
> > +     {CCI_REG8(0x3E76), 0xC5},
> > +     {CCI_REG8(0x3E78), 0xC0},
> > +     {CCI_REG8(0x3E79), 0x01},
> > +     {CCI_REG8(0x3E7A), 0xD4},
> > +     {CCI_REG8(0x3E7B), 0x01},
> > +     {CCI_REG8(0x3EB4), 0x0B},
> > +     {CCI_REG8(0x3EB5), 0x02},
> > +     {CCI_REG8(0x3EB6), 0x4D},
> > +     {CCI_REG8(0x3EB7), 0x42},
> > +     {CCI_REG8(0x3EEC), 0xF3},
> > +     {CCI_REG8(0x3EEE), 0xE7},
> > +     {CCI_REG8(0x3F01), 0x01},
> > +     {CCI_REG8(0x3F24), 0x10},
> > +     {CCI_REG8(0x3F28), 0x2D},
> > +     {CCI_REG8(0x3F2A), 0x2D},
> > +     {CCI_REG8(0x3F2C), 0x2D},
> > +     {CCI_REG8(0x3F2E), 0x2D},
> > +     {CCI_REG8(0x3F30), 0x23},
> > +     {CCI_REG8(0x3F38), 0x2D},
> > +     {CCI_REG8(0x3F3A), 0x2D},
> > +     {CCI_REG8(0x3F3C), 0x2D},
> > +     {CCI_REG8(0x3F3E), 0x28},
> > +     {CCI_REG8(0x3F40), 0x1E},
> > +     {CCI_REG8(0x3F48), 0x2D},
> > +     {CCI_REG8(0x3F4A), 0x2D},
> > +     {CCI_REG8(0x3F4C), 0x00},
> > +     {CCI_REG8(0x4004), 0xE4},
> > +     {CCI_REG8(0x4006), 0xFF},
> > +     {CCI_REG8(0x4018), 0x69},
> > +     {CCI_REG8(0x401A), 0x84},
> > +     {CCI_REG8(0x401C), 0xD6},
> > +     {CCI_REG8(0x401E), 0xF1},
> > +     {CCI_REG8(0x4038), 0xDE},
> > +     {CCI_REG8(0x403A), 0x00},
> > +     {CCI_REG8(0x403B), 0x01},
> > +     {CCI_REG8(0x404C), 0x63},
> > +     {CCI_REG8(0x404E), 0x85},
> > +     {CCI_REG8(0x4050), 0xD0},
> > +     {CCI_REG8(0x4052), 0xF2},
> > +     {CCI_REG8(0x4108), 0xDD},
> > +     {CCI_REG8(0x410A), 0xF7},
> > +     {CCI_REG8(0x411C), 0x62},
> > +     {CCI_REG8(0x411E), 0x7C},
> > +     {CCI_REG8(0x4120), 0xCF},
> > +     {CCI_REG8(0x4122), 0xE9},
> > +     {CCI_REG8(0x4138), 0xE6},
> > +     {CCI_REG8(0x413A), 0xF1},
> > +     {CCI_REG8(0x414C), 0x6B},
> > +     {CCI_REG8(0x414E), 0x76},
> > +     {CCI_REG8(0x4150), 0xD8},
> > +     {CCI_REG8(0x4152), 0xE3},
> > +     {CCI_REG8(0x417E), 0x03},
> > +     {CCI_REG8(0x417F), 0x01},
> > +     {CCI_REG8(0x4186), 0xE0},
> > +     {CCI_REG8(0x4190), 0xF3},
> > +     {CCI_REG8(0x4192), 0xF7},
> > +     {CCI_REG8(0x419C), 0x78},
> > +     {CCI_REG8(0x419E), 0x7C},
> > +     {CCI_REG8(0x41A0), 0xE5},
> > +     {CCI_REG8(0x41A2), 0xE9},
> > +     {CCI_REG8(0x41C8), 0xE2},
> > +     {CCI_REG8(0x41CA), 0xFD},
> > +     {CCI_REG8(0x41DC), 0x67},
> > +     {CCI_REG8(0x41DE), 0x82},
> > +     {CCI_REG8(0x41E0), 0xD4},
> > +     {CCI_REG8(0x41E2), 0xEF},
> > +     {CCI_REG8(0x4200), 0xDE},
> > +     {CCI_REG8(0x4202), 0xDA},
> > +     {CCI_REG8(0x4218), 0x63},
> > +     {CCI_REG8(0x421A), 0x5F},
> > +     {CCI_REG8(0x421C), 0xD0},
> > +     {CCI_REG8(0x421E), 0xCC},
> > +     {CCI_REG8(0x425A), 0x82},
> > +     {CCI_REG8(0x425C), 0xEF},
> > +     {CCI_REG8(0x4348), 0xFE},
> > +     {CCI_REG8(0x4349), 0x06},
> > +     {CCI_REG8(0x4352), 0xCE},
> > +     {CCI_REG8(0x4420), 0x0B},
> > +     {CCI_REG8(0x4421), 0x02},
> > +     {CCI_REG8(0x4422), 0x4D},
> > +     {CCI_REG8(0x4423), 0x0A},
> > +     {CCI_REG8(0x4426), 0xF5},
> > +     {CCI_REG8(0x442A), 0xE7},
> > +     {CCI_REG8(0x4432), 0xF5},
> > +     {CCI_REG8(0x4436), 0xE7},
> > +     {CCI_REG8(0x4466), 0xB4},
> > +     {CCI_REG8(0x446E), 0x32},
> > +     {CCI_REG8(0x449F), 0x1C},
> > +     {CCI_REG8(0x44A4), 0x2C},
> > +     {CCI_REG8(0x44A6), 0x2C},
> > +     {CCI_REG8(0x44A8), 0x2C},
> > +     {CCI_REG8(0x44AA), 0x2C},
> > +     {CCI_REG8(0x44B4), 0x2C},
> > +     {CCI_REG8(0x44B6), 0x2C},
> > +     {CCI_REG8(0x44B8), 0x2C},
> > +     {CCI_REG8(0x44BA), 0x2C},
> > +     {CCI_REG8(0x44C4), 0x2C},
> > +     {CCI_REG8(0x44C6), 0x2C},
> > +     {CCI_REG8(0x44C8), 0x2C},
> > +     {CCI_REG8(0x4506), 0xF3},
> > +     {CCI_REG8(0x450E), 0xE5},
> > +     {CCI_REG8(0x4516), 0xF3},
> > +     {CCI_REG8(0x4522), 0xE5},
> > +     {CCI_REG8(0x4524), 0xF3},
> > +     {CCI_REG8(0x452C), 0xE5},
> > +     {CCI_REG8(0x453C), 0x22},
> > +     {CCI_REG8(0x453D), 0x1B},
> > +     {CCI_REG8(0x453E), 0x1B},
> > +     {CCI_REG8(0x453F), 0x15},
> > +     {CCI_REG8(0x4540), 0x15},
> > +     {CCI_REG8(0x4541), 0x15},
> > +     {CCI_REG8(0x4542), 0x15},
> > +     {CCI_REG8(0x4543), 0x15},
> > +     {CCI_REG8(0x4544), 0x15},
> > +     {CCI_REG8(0x4548), 0x00},
> > +     {CCI_REG8(0x4549), 0x01},
> > +     {CCI_REG8(0x454A), 0x01},
> > +     {CCI_REG8(0x454B), 0x06},
> > +     {CCI_REG8(0x454C), 0x06},
> > +     {CCI_REG8(0x454D), 0x06},
> > +     {CCI_REG8(0x454E), 0x06},
> > +     {CCI_REG8(0x454F), 0x06},
> > +     {CCI_REG8(0x4550), 0x06},
> > +     {CCI_REG8(0x4554), 0x55},
> > +     {CCI_REG8(0x4555), 0x02},
> > +     {CCI_REG8(0x4556), 0x42},
> > +     {CCI_REG8(0x4557), 0x05},
> > +     {CCI_REG8(0x4558), 0xFD},
> > +     {CCI_REG8(0x4559), 0x05},
> > +     {CCI_REG8(0x455A), 0x94},
> > +     {CCI_REG8(0x455B), 0x06},
> > +     {CCI_REG8(0x455D), 0x06},
> > +     {CCI_REG8(0x455E), 0x49},
> > +     {CCI_REG8(0x455F), 0x07},
> > +     {CCI_REG8(0x4560), 0x7F},
> > +     {CCI_REG8(0x4561), 0x07},
> > +     {CCI_REG8(0x4562), 0xA5},
> > +     {CCI_REG8(0x4564), 0x55},
> > +     {CCI_REG8(0x4565), 0x02},
> > +     {CCI_REG8(0x4566), 0x42},
> > +     {CCI_REG8(0x4567), 0x05},
> > +     {CCI_REG8(0x4568), 0xFD},
> > +     {CCI_REG8(0x4569), 0x05},
> > +     {CCI_REG8(0x456A), 0x94},
> > +     {CCI_REG8(0x456B), 0x06},
> > +     {CCI_REG8(0x456D), 0x06},
> > +     {CCI_REG8(0x456E), 0x49},
> > +     {CCI_REG8(0x456F), 0x07},
> > +     {CCI_REG8(0x4572), 0xA5},
> > +     {CCI_REG8(0x460C), 0x7D},
> > +     {CCI_REG8(0x460E), 0xB1},
> > +     {CCI_REG8(0x4614), 0xA8},
> > +     {CCI_REG8(0x4616), 0xB2},
> > +     {CCI_REG8(0x461C), 0x7E},
> > +     {CCI_REG8(0x461E), 0xA7},
> > +     {CCI_REG8(0x4624), 0xA8},
> > +     {CCI_REG8(0x4626), 0xB2},
> > +     {CCI_REG8(0x462C), 0x7E},
> > +     {CCI_REG8(0x462E), 0x8A},
> > +     {CCI_REG8(0x4630), 0x94},
> > +     {CCI_REG8(0x4632), 0xA7},
> > +     {CCI_REG8(0x4634), 0xFB},
> > +     {CCI_REG8(0x4636), 0x2F},
> > +     {CCI_REG8(0x4638), 0x81},
> > +     {CCI_REG8(0x4639), 0x01},
> > +     {CCI_REG8(0x463A), 0xB5},
> > +     {CCI_REG8(0x463B), 0x01},
> > +     {CCI_REG8(0x463C), 0x26},
> > +     {CCI_REG8(0x463E), 0x30},
> > +     {CCI_REG8(0x4640), 0xAC},
> > +     {CCI_REG8(0x4641), 0x01},
> > +     {CCI_REG8(0x4642), 0xB6},
> > +     {CCI_REG8(0x4643), 0x01},
> > +     {CCI_REG8(0x4644), 0xFC},
> > +     {CCI_REG8(0x4646), 0x25},
> > +     {CCI_REG8(0x4648), 0x82},
> > +     {CCI_REG8(0x4649), 0x01},
> > +     {CCI_REG8(0x464A), 0xAB},
> > +     {CCI_REG8(0x464B), 0x01},
> > +     {CCI_REG8(0x464C), 0x26},
> > +     {CCI_REG8(0x464E), 0x30},
> > +     {CCI_REG8(0x4654), 0xFC},
> > +     {CCI_REG8(0x4656), 0x08},
> > +     {CCI_REG8(0x4658), 0x12},
> > +     {CCI_REG8(0x465A), 0x25},
> > +     {CCI_REG8(0x4662), 0xFC},
> > +     {CCI_REG8(0x46A2), 0xFB},
> > +     {CCI_REG8(0x46D6), 0xF3},
> > +     {CCI_REG8(0x46E6), 0x00},
> > +     {CCI_REG8(0x46E8), 0xFF},
> > +     {CCI_REG8(0x46E9), 0x03},
> > +     {CCI_REG8(0x46EC), 0x7A},
> > +     {CCI_REG8(0x46EE), 0xE5},
> > +     {CCI_REG8(0x46F4), 0xEE},
> > +     {CCI_REG8(0x46F6), 0xF2},
> > +     {CCI_REG8(0x470C), 0xFF},
> > +     {CCI_REG8(0x470D), 0x03},
> > +     {CCI_REG8(0x470E), 0x00},
> > +     {CCI_REG8(0x4714), 0xE0},
> > +     {CCI_REG8(0x4716), 0xE4},
> > +     {CCI_REG8(0x471E), 0xED},
> > +     {CCI_REG8(0x472E), 0x00},
> > +     {CCI_REG8(0x4730), 0xFF},
> > +     {CCI_REG8(0x4731), 0x03},
> > +     {CCI_REG8(0x4734), 0x7B},
> > +     {CCI_REG8(0x4736), 0xDF},
> > +     {CCI_REG8(0x4754), 0x7D},
> > +     {CCI_REG8(0x4756), 0x8B},
> > +     {CCI_REG8(0x4758), 0x93},
> > +     {CCI_REG8(0x475A), 0xB1},
> > +     {CCI_REG8(0x475C), 0xFB},
> > +     {CCI_REG8(0x475E), 0x09},
> > +     {CCI_REG8(0x4760), 0x11},
> > +     {CCI_REG8(0x4762), 0x2F},
> > +     {CCI_REG8(0x4766), 0xCC},
> > +     {CCI_REG8(0x4776), 0xCB},
> > +     {CCI_REG8(0x477E), 0x4A},
> > +     {CCI_REG8(0x478E), 0x49},
> > +     {CCI_REG8(0x4794), 0x7C},
> > +     {CCI_REG8(0x4796), 0x8F},
> > +     {CCI_REG8(0x4798), 0xB3},
> > +     {CCI_REG8(0x4799), 0x00},
> > +     {CCI_REG8(0x479A), 0xCC},
> > +     {CCI_REG8(0x479C), 0xC1},
> > +     {CCI_REG8(0x479E), 0xCB},
> > +     {CCI_REG8(0x47A4), 0x7D},
> > +     {CCI_REG8(0x47A6), 0x8E},
> > +     {CCI_REG8(0x47A8), 0xB4},
> > +     {CCI_REG8(0x47A9), 0x00},
> > +     {CCI_REG8(0x47AA), 0xC0},
> > +     {CCI_REG8(0x47AC), 0xFA},
> > +     {CCI_REG8(0x47AE), 0x0D},
> > +     {CCI_REG8(0x47B0), 0x31},
> > +     {CCI_REG8(0x47B1), 0x01},
> > +     {CCI_REG8(0x47B2), 0x4A},
> > +     {CCI_REG8(0x47B3), 0x01},
> > +     {CCI_REG8(0x47B4), 0x3F},
> > +     {CCI_REG8(0x47B6), 0x49},
> > +     {CCI_REG8(0x47BC), 0xFB},
> > +     {CCI_REG8(0x47BE), 0x0C},
> > +     {CCI_REG8(0x47C0), 0x32},
> > +     {CCI_REG8(0x47C1), 0x01},
> > +     {CCI_REG8(0x47C2), 0x3E},
> > +     {CCI_REG8(0x47C3), 0x01},
> > +     {IMX678_REG_WDMODE, 0x00},
> > +     {IMX678_REG_MDBIT, 0x01},
> > +     {IMX678_REG_XXS_DRV, 0x00},
> > +};
> > +
> > +static const u32 codes_bayer[] =3D {
> > +     MEDIA_BUS_FMT_SRGGB12_1X12,
> > +};
> > +
> > +static const u32 codes_monochrome[] =3D {
> > +     MEDIA_BUS_FMT_Y12_1X12,   /* 12-bit mono */
> > +};
> > +
> > +#define IMX678_NUM_CODES ARRAY_SIZE(codes_bayer)
>=20
> Use ARRAY_SIZE(...) where you need it instead -- like you do for the
> regulators.
>=20
> > +
> > +static const char * const imx678_supply_name[] =3D {
> > +     "avdd",  /* Analog (3.3V) supply */
> > +     "dvdd",  /* Digital Core (1.1V) supply */
> > +     "ovdd",  /* IF (1.8V) supply */
> > +};
> > +
> > +struct imx678 {
> > +     struct v4l2_subdev sd;
> > +     struct media_pad pad;
> > +     struct regmap *cci;
> > +
> > +     enum imx678_type type;
> > +
> > +     struct clk *xclk;
> > +     u32 xclk_freq;
> > +
> > +     /* chosen INCK_SEL register value */
> > +     u8  inck_sel_val;
> > +
> > +     /* Link configurations */
> > +     enum imx678_lanemode lane_mode;
> > +     unsigned long link_freq_bitmap;
> > +
> > +     struct gpio_desc *reset_gpio;
> > +     struct regulator_bulk_data supplies[ARRAY_SIZE(imx678_supply_name=
)];
> > +
> > +     struct v4l2_ctrl_handler ctrl_handler;
> > +
> > +     /* V4L2 Controls */
> > +     struct v4l2_ctrl *pixel_rate;
> > +     struct v4l2_ctrl *link_freq;
> > +     struct v4l2_ctrl *exposure;
> > +     struct v4l2_ctrl *gain;
> > +     struct v4l2_ctrl *vflip;
> > +     struct v4l2_ctrl *hflip;
> > +     struct v4l2_ctrl *vblank;
> > +     struct v4l2_ctrl *hblank;
>=20
> Do you need all of the above?
>=20

Ah no, only the blanking/exposure ones I think, will clean it up.

> > +
> > +     /* Tracking sensor VMAX/HMAX value */
> > +     u32 vmax;
> > +};
> > +
> > +static inline struct imx678 *to_imx678(struct v4l2_subdev *_sd)
> > +{
> > +     return container_of(_sd, struct imx678, sd);
> > +}
> > +
> > +static inline struct v4l2_mbus_framefmt *
> > +imx678_state_format(struct v4l2_subdev_state *state)
> > +{
> > +     return v4l2_subdev_state_get_format(state, 0);
>=20
> I don't think having a function for this is useful.
>=20
> > +}
> > +
> > +static inline struct v4l2_rect *imx678_state_crop(struct v4l2_subdev_s=
tate *state)
> > +{
> > +     return v4l2_subdev_state_get_crop(state, 0);
>=20
> Ditto.
>=20

Ack.

> > +}
> > +
> > +static bool imx678_state_binning(struct v4l2_subdev_state *state)
> > +{
> > +     const struct v4l2_mbus_framefmt *format =3D imx678_state_format(s=
tate);
> > +     const struct v4l2_rect *crop =3D imx678_state_crop(state);
> > +
> > +     return crop->width =3D=3D 2 * format->width &&
> > +            crop->height =3D=3D 2 * format->height;
> > +}
> > +
> > +static const u32 *imx678_mbus_codes(struct imx678 *imx678)
> > +{
> > +     if (imx678->type =3D=3D IMX678_MONOCHROME)
> > +             return codes_monochrome;
> > +     else
> > +             return codes_bayer;
>=20
> Could you store the pointer to the relevant list to the device data?
>=20

Ack.

> > +}
> > +
> > +static u32 imx678_default_mbus_code(struct imx678 *imx678)
> > +{
> > +     const u32 *codes =3D imx678_mbus_codes(imx678);
> > +
> > +     return codes[0];
> > +}
> > +
> > +static bool imx678_mbus_code_supported(struct imx678 *imx678, u32 code)
> > +{
> > +     const u32 *codes =3D imx678_mbus_codes(imx678);
> > +
> > +     for (unsigned int i =3D 0; i < IMX678_NUM_CODES; i++) {
> > +             if (codes[i] =3D=3D code)
> > +                     return true;
> > +     }
> > +
> > +     return false;
> > +}
> > +
> > +static u32 imx678_get_format_code(struct imx678 *imx678, u32 code)
> > +{
> > +     if (imx678_mbus_code_supported(imx678, code))
> > +             return code;
> > +
> > +     return imx678_default_mbus_code(imx678);
> > +}
> > +
> > +static void imx678_set_framing_limits(struct imx678 *imx678,
> > +                                   struct v4l2_subdev_state *state)
> > +{
> > +     const struct v4l2_mbus_framefmt *format =3D imx678_state_format(s=
tate);
> > +     s64 min_hblank, default_hblank, max_hblank, vblank;
>=20
> Why are these 64-bit numbers? The control framework uses 32 bits and the
> sensor uses less than that.

Oops I saw __v4l2_ctrl_modify_range types has u64 parameters, but now I see
that we don't use 64-bit controls unless `V4L2_CTRL_TYPE_INTEGER64` is set.

Will fix in v4.

>=20
> > +     const u32 hmax_4lane =3D min_hmax_4lane[__ffs(imx678->link_freq_b=
itmap)];
> > +     const u32 lane_scale =3D imx678->lane_mode =3D=3D IMX678_LANEMODE=
_2L ? 2 : 1;
> > +     const bool binning =3D imx678_state_binning(state);
> > +     const u8 bpp =3D binning ? 10 : 12;
> > +     u32 hmax, min_hmax;
> > +
> > +     imx678->vmax =3D IMX678_VMAX_DEFAULT;
> > +     hmax =3D hmax_4lane * lane_scale;
> > +
> > +     /* HMAX can go lower when using 10bit AD for binning */
> > +     min_hmax =3D (hmax * bpp) / 12;
> > +     min_hblank =3D min_hmax * IMX678_PIX_PER_CLK - format->width;
> > +     default_hblank =3D hmax * IMX678_PIX_PER_CLK - format->width;
> > +     max_hblank =3D IMX678_HMAX_MAX * IMX678_PIX_PER_CLK - format->wid=
th;
> > +
> > +     __v4l2_ctrl_modify_range(imx678->hblank, min_hblank, max_hblank,
> > +                              IMX678_PIX_PER_CLK, default_hblank);
> > +     __v4l2_ctrl_s_ctrl(imx678->hblank, default_hblank);
> > +
> > +     vblank =3D imx678->vmax - format->height;
> > +     __v4l2_ctrl_modify_range(imx678->vblank, vblank,
> > +                              IMX678_VMAX_MAX - format->height, 2, vbl=
ank);
> > +     __v4l2_ctrl_s_ctrl(imx678->vblank, IMX678_VMAX_DEFAULT - format->=
height);
> > +
> > +     __v4l2_ctrl_modify_range(imx678->exposure, IMX678_EXPOSURE_MIN,
> > +                              imx678->vmax - IMX678_SHR_MIN, 1,
> > +                              IMX678_EXPOSURE_DEFAULT);
> > +}
> > +
> > +static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +     struct imx678 *imx678 =3D container_of(ctrl->handler, struct imx6=
78, ctrl_handler);
> > +     struct v4l2_subdev_state *state;
> > +     struct i2c_client *client =3D v4l2_get_subdevdata(&imx678->sd);
> > +     const struct v4l2_mbus_framefmt *format;
> > +     int ret =3D 0;
> > +
> > +     state =3D v4l2_subdev_get_locked_active_state(&imx678->sd);
> > +     format =3D imx678_state_format(state);
> > +
> > +     if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > +             u32 current_exposure =3D imx678->exposure->cur.val;
> > +
> > +             imx678->vmax =3D format->height + ctrl->val;
> > +
> > +             current_exposure =3D clamp_t(u32, current_exposure, IMX67=
8_EXPOSURE_MIN,
> > +                                        imx678->vmax - IMX678_SHR_MIN);
> > +             __v4l2_ctrl_modify_range(imx678->exposure, IMX678_EXPOSUR=
E_MIN,
> > +                                      imx678->vmax - IMX678_SHR_MIN, 1,
> > +                                      current_exposure);
> > +     }
> > +
> > +     /*
> > +      * Applying V4L2 control value only happens
> > +      * when power is up for streaming
> > +      */
> > +     if (pm_runtime_get_if_in_use(&client->dev) =3D=3D 0)
> > +             return 0;
> > +
> > +     switch (ctrl->id) {
> > +     case V4L2_CID_VBLANK:
> > +             cci_write(imx678->cci, IMX678_REG_VMAX, imx678->vmax, &re=
t);
> > +             fallthrough; /* SHR =3D VMAX - exposure, so update it */
> > +     case V4L2_CID_EXPOSURE: {
>=20
> If exposure changes, this needs to be reflected in the control value. In
> practice you should use __v4l2_ctrl_modify_range().

That's done already in the `if (ctrl->id =3D=3D V4L2_CID_VBLANK)` check abo=
ve.

>=20
> > +             u32 shr =3D imx678->vmax - imx678->exposure->val;
> > +
> > +             cci_write(imx678->cci, IMX678_REG_SHR, shr, &ret);
> > +             break;
> > +     }
> > +     case V4L2_CID_ANALOGUE_GAIN:
> > +             cci_write(imx678->cci, IMX678_REG_ANALOG_GAIN, ctrl->val,=
 &ret);
> > +             break;
> > +     case V4L2_CID_HBLANK: {
> > +             u32 hmax =3D (format->width + ctrl->val) / IMX678_PIX_PER=
_CLK;
>=20
> What does IMX678_PIX_PER_CLK signify?
>=20

The sensor's internal HMAX/LLP register is not in units of pixels but in
units of an internal 74.25 MHz clock. While HBLANK/VBLANK controls are in
units of pixels (at PIXEL_RATE) and lines.

> > +
> > +             cci_write(imx678->cci, IMX678_REG_HMAX, hmax, &ret);
> > +             break;
> > +     }
> > +     case V4L2_CID_TEST_PATTERN: {
> > +             cci_write(imx678->cci, IMX678_REG_TPG_COLORWIDTH,
> > +                       IMX678_TPG_COLORWIDTH_160PIX, &ret);
> > +             cci_write(imx678->cci, IMX678_REG_TPG_PATSEL_DUOUT,
> > +                       imx678_tpg_val[ctrl->val], &ret);
> > +             cci_write(imx678->cci, IMX678_REG_TPG_EN_DUOUT, (ctrl->va=
l) ? 1 : 0,
> > +                       &ret);
> > +             break;
> > +     }
> > +     case V4L2_CID_HFLIP:
> > +             cci_write(imx678->cci, IMX678_REG_WINMODEH, ctrl->val, &r=
et);
> > +             break;
> > +     case V4L2_CID_VFLIP:
> > +             cci_write(imx678->cci, IMX678_REG_WINMODEV, ctrl->val, &r=
et);
> > +             break;
> > +     default:
> > +             dev_warn(&client->dev,
> > +                      "ctrl(id:0x%x,val:0x%x) is not handled\n",
> > +                      ctrl->id, ctrl->val);
> > +             break;
> > +     }
> > +
> > +     pm_runtime_put(&client->dev);
> > +
> > +     return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops imx678_ctrl_ops =3D {
> > +     .s_ctrl =3D imx678_set_ctrl,
> > +};
> > +
> > +static int imx678_enum_mbus_code(struct v4l2_subdev *sd,
> > +                              struct v4l2_subdev_state *sd_state,
> > +                              struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +     struct imx678 *imx678 =3D to_imx678(sd);
> > +     const u32 *codes =3D imx678_mbus_codes(imx678);
> > +
> > +     if (code->index >=3D IMX678_NUM_CODES)
> > +             return -EINVAL;
> > +
> > +     code->code =3D codes[code->index];
> > +     return 0;
> > +}
> > +
> > +static int imx678_enum_frame_size(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_state *sd_state,
> > +                               struct v4l2_subdev_frame_size_enum *fse)
> > +{
> > +     const struct v4l2_rect *crop =3D imx678_state_crop(sd_state);
> > +     struct imx678 *imx678 =3D to_imx678(sd);
> > +
> > +     /* Return non-binned and binned resolution for current crop */
> > +     if (fse->index > 1)
> > +             return -EINVAL;
> > +
> > +     if (!imx678_mbus_code_supported(imx678, fse->code))
> > +             return -EINVAL;
> > +
> > +     fse->min_width =3D crop->width / (fse->index + 1);
> > +     fse->max_width =3D fse->min_width;
> > +     fse->min_height =3D crop->height / (fse->index + 1);
> > +     fse->max_height =3D fse->min_height;
> > +
> > +     return 0;
> > +}
> > +
> > +/*
> > + * Only two format sizes are valid for a given crop rectangle:
> > + *   - format =3D crop         (no binning)
> > + *   - format =3D crop / 2     (2x2 binning, when it fits)
> > + */
> > +static int imx678_set_pad_format(struct v4l2_subdev *sd,
> > +                              struct v4l2_subdev_state *sd_state,
> > +                              struct v4l2_subdev_format *fmt)
> > +{
> > +     struct imx678 *imx678 =3D to_imx678(sd);
> > +     struct v4l2_mbus_framefmt *format;
> > +     u32 width =3D fmt->format.width;
> > +     u32 height =3D fmt->format.height;
> > +     struct v4l2_rect *crop;
> > +
> > +     if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE &&
> > +         v4l2_subdev_is_streaming(sd))
> > +             return -EBUSY;
> > +
> > +     crop =3D imx678_state_crop(sd_state);
> > +     format =3D v4l2_subdev_state_get_format(sd_state, fmt->pad);
> > +
> > +     /* Snap format size to 2x2 binned mode if it is < 0.75 * crop */
> > +     if ((4 * width < 3 * crop->width) &&
> > +         (4 * height < 3 * crop->height)) {
> > +             format->width =3D crop->width / 2;
> > +             format->height =3D crop->height / 2;
>=20
> I think I'd postpone adding this before the common raw sensor model. It
> gets complicated otherwise.
>=20

Ack. I will rebase on your raw sensor model series and test out if I can
get raw capture to work with some minimal changes to userspace tools.

> > +     } else {
> > +             format->width =3D crop->width;
> > +             format->height =3D crop->height;
> > +     }
> > +
> > +     format->code =3D imx678_get_format_code(imx678, fmt->format.code);
> > +     format->field =3D V4L2_FIELD_NONE;
> > +     format->colorspace =3D V4L2_COLORSPACE_RAW;
> > +     format->ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
> > +     format->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> > +     format->xfer_func =3D V4L2_XFER_FUNC_NONE;
> > +
> > +     if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> > +             imx678_set_framing_limits(imx678, sd_state);
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx678_get_selection(struct v4l2_subdev *sd,
> > +                             struct v4l2_subdev_state *sd_state,
> > +                             struct v4l2_subdev_selection *sel)
> > +{
> > +     switch (sel->target) {
> > +     case V4L2_SEL_TGT_CROP:
> > +             sel->r =3D *imx678_state_crop(sd_state);
> > +             return 0;
> > +
> > +     case V4L2_SEL_TGT_NATIVE_SIZE:
> > +             sel->r =3D imx678_native_area;
> > +             return 0;
> > +
> > +     case V4L2_SEL_TGT_CROP_DEFAULT:
> > +     case V4L2_SEL_TGT_CROP_BOUNDS:
> > +             sel->r =3D imx678_active_area;
> > +             return 0;
> > +     }
> > +
> > +     return -EINVAL;
> > +}
> > +
> > +static int imx678_set_selection(struct v4l2_subdev *sd,
> > +                             struct v4l2_subdev_state *sd_state,
> > +                             struct v4l2_subdev_selection *sel)
> > +{
>=20
> This, too, I'd postpone until the common raw sensor model.
>=20

Ack.

> > +     struct imx678 *imx678 =3D to_imx678(sd);
> > +     struct v4l2_rect *crop;
> > +     struct v4l2_rect rect;
> > +
> > +     if (sel->target !=3D V4L2_SEL_TGT_CROP || sel->pad !=3D 0)
> > +             return -EINVAL;
> > +
> > +     if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE &&
> > +         v4l2_subdev_is_streaming(sd))
> > +             return -EBUSY;
> > +
> > +     /* Align left, top to 4 */
> > +     rect.left =3D clamp_t(s32, ALIGN(sel->r.left, IMX678_CROP_HST_ALI=
GN),
> > +                         imx678_active_area.left,
> > +                         imx678_active_area.width - IMX678_PIXEL_ARRAY=
_MIN_WIDTH);
> > +     rect.top =3D clamp_t(s32, ALIGN(sel->r.top, IMX678_CROP_VST_ALIGN=
),
> > +                        imx678_active_area.top,
> > +                        imx678_active_area.height - IMX678_PIXEL_ARRAY=
_MIN_HEIGHT);
> > +     /* Align width to 16 and height to 4 */
> > +     rect.width =3D clamp_t(u32, ALIGN(sel->r.width, IMX678_CROP_HWIDT=
H_ALIGN),
> > +                          IMX678_PIXEL_ARRAY_MIN_WIDTH, imx678_active_=
area.width);
> > +     rect.height =3D clamp_t(u32, ALIGN(sel->r.height, IMX678_CROP_VWI=
DTH_ALIGN),
> > +                           IMX678_PIXEL_ARRAY_MIN_HEIGHT, imx678_activ=
e_area.height);
> > +
> > +     rect.width =3D min_t(u32, rect.width, imx678_native_area.width - =
rect.left);
> > +     rect.height =3D min_t(u32, rect.height, imx678_native_area.height=
 - rect.top);
> > +
> > +     crop =3D v4l2_subdev_state_get_crop(sd_state, sel->pad);
> > +
> > +     if (rect.width !=3D crop->width || rect.height !=3D crop->height)=
 {
> > +             struct v4l2_mbus_framefmt *format =3D
> > +                     v4l2_subdev_state_get_format(sd_state, sel->pad);
> > +             format->width =3D rect.width;
> > +             format->height =3D rect.height;
> > +     }
> > +
> > +     *crop =3D rect;
> > +     sel->r =3D *crop;
> > +
> > +     if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> > +             imx678_set_framing_limits(imx678, sd_state);
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx678_init_state(struct v4l2_subdev *sd,
> > +                          struct v4l2_subdev_state *state)
> > +{
> > +     struct imx678 *imx678 =3D to_imx678(sd);
> > +     struct v4l2_subdev_selection sel =3D {
> > +             .which =3D V4L2_SUBDEV_FORMAT_TRY,
> > +             .target =3D V4L2_SEL_TGT_CROP,
> > +             .r =3D imx678_active_area,
> > +     };
> > +     struct v4l2_subdev_format fmt =3D {
> > +             .which =3D V4L2_SUBDEV_FORMAT_TRY,
> > +             .pad =3D 0,
> > +             .format =3D {
> > +                     .code =3D imx678_default_mbus_code(imx678),
> > +                     .width =3D imx678_active_area.width,
> > +                     .height =3D imx678_active_area.height,
> > +             },
> > +     };
> > +
> > +     imx678_set_selection(sd, state, &sel);
> > +     imx678_set_pad_format(sd, state, &fmt);
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx678_write_common(struct imx678 *imx678)
> > +{
> > +     int ret =3D 0;
> > +
> > +     cci_multi_reg_write(imx678->cci, common_regs, ARRAY_SIZE(common_r=
egs), &ret);
> > +
> > +     cci_write(imx678->cci, IMX678_REG_INCK_SEL, imx678->inck_sel_val,=
 &ret);
> > +     cci_write(imx678->cci, IMX678_REG_DATARATE_SEL,
> > +               link_freqs_reg_value[__ffs(imx678->link_freq_bitmap)], =
&ret);
> > +     cci_write(imx678->cci, IMX678_REG_LANEMODE, imx678->lane_mode, &r=
et);
> > +
> > +     cci_write(imx678->cci, IMX678_REG_INTERFACE_SEL, IMX678_INTERFACE=
_2L_4L,
> > +               &ret);
> > +
> > +     return ret;
> > +}
> > +
> > +static int imx678_program_window(struct imx678 *imx678,
> > +                              const struct v4l2_rect *crop, bool binni=
ng)
> > +{
> > +     int ret =3D 0;
> > +
> > +     cci_write(imx678->cci, IMX678_REG_ADDMODE, binning ? 0x01 : 0x00,=
 &ret);
> > +     cci_write(imx678->cci, IMX678_REG_WINMODE,
> > +               v4l2_rect_equal(crop, &imx678_active_area) ? 0x00 : 0x0=
4,
> > +               &ret);
> > +     cci_write(imx678->cci, IMX678_REG_PIX_HST,
> > +               crop->left - imx678_active_area.left, &ret);
> > +     cci_write(imx678->cci, IMX678_REG_PIX_HWIDTH, crop->width, &ret);
> > +     cci_write(imx678->cci, IMX678_REG_PIX_VST,
> > +               crop->top - imx678_active_area.top, &ret);
> > +     cci_write(imx678->cci, IMX678_REG_PIX_VWIDTH, crop->height, &ret);
> > +     cci_write(imx678->cci, IMX678_REG_ADBIT, binning ? 0x00 : 0x01, &=
ret);
> > +
> > +     return ret;
> > +}
> > +
> > +static int imx678_enable_streams(struct v4l2_subdev *sd,
> > +                              struct v4l2_subdev_state *state, u32 pad,
> > +                              u64 mask)
> > +{
> > +     struct i2c_client *client =3D v4l2_get_subdevdata(sd);
> > +     struct imx678 *imx678 =3D to_imx678(sd);
> > +     const struct v4l2_rect *crop =3D imx678_state_crop(state);
> > +     const bool binning =3D imx678_state_binning(state);
> > +     int ret =3D 0;
> > +
> > +     ret =3D pm_runtime_resume_and_get(&client->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D imx678_program_window(imx678, crop, binning);
> > +     if (ret) {
> > +             dev_err(&client->dev, "%s failed to set mode\n", __func__=
);
> > +             goto err_rpm_put;
> > +     }
> > +
> > +     ret =3D __v4l2_ctrl_handler_setup(imx678->sd.ctrl_handler);
> > +     if (ret) {
> > +             dev_err(&client->dev, "%s failed to apply user values\n",=
 __func__);
> > +             goto err_rpm_put;
> > +     }
> > +
> > +     cci_write(imx678->cci, IMX678_REG_MODE_SELECT, IMX678_MODE_STREAM=
ING, &ret);
> > +     usleep_range(IMX678_STREAM_DELAY_US, IMX678_STREAM_DELAY_US +
> > +                  IMX678_STREAM_DELAY_RANGE_US);
> > +     cci_write(imx678->cci, IMX678_REG_XMSTA, 0x00, &ret);
> > +
> > +     if (ret) {
> > +             dev_err(&client->dev, "%s failed to start streaming\n", _=
_func__);
> > +             goto err_rpm_put;
> > +     }
> > +
> > +     return 0;
> > +
> > +err_rpm_put:
> > +     pm_runtime_put(&client->dev);
> > +
> > +     return ret;
> > +}
> > +
> > +static int imx678_disable_streams(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_state *state,
> > +                               u32 pad, u64 mask)
> > +{
> > +     struct i2c_client *client =3D v4l2_get_subdevdata(sd);
> > +     struct imx678 *imx678 =3D to_imx678(sd);
> > +     int ret =3D 0;
> > +
> > +     /* Master mode disable */
> > +     cci_write(imx678->cci, IMX678_REG_XMSTA, 0x01, &ret);
> > +     /* Standby */
> > +     cci_write(imx678->cci, IMX678_REG_MODE_SELECT, IMX678_MODE_STANDB=
Y, &ret);
> > +     if (ret)
> > +             dev_err(&client->dev, "%s failed to stop stream\n", __fun=
c__);
> > +
> > +     pm_runtime_put(&client->dev);
> > +
> > +     return ret;
> > +}
> > +
> > +static int imx678_power_on(struct device *dev)
> > +{
> > +     struct i2c_client *client =3D to_i2c_client(dev);
> > +     struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +     struct imx678 *imx678 =3D to_imx678(sd);
> > +     int ret;
> > +
> > +     ret =3D regulator_bulk_enable(ARRAY_SIZE(imx678_supply_name), imx=
678->supplies);
> > +     if (ret) {
> > +             dev_err(&client->dev, "%s: failed to enable regulators\n",
> > +                     __func__);
> > +             return ret;
> > +     }
> > +
> > +     fsleep(1); /* Tlow > 500ns */
> > +
> > +     gpiod_set_value_cansleep(imx678->reset_gpio, 0);
> > +
> > +     fsleep(1); /* T3 > 1us */
> > +
> > +     ret =3D clk_prepare_enable(imx678->xclk);
> > +     if (ret) {
> > +             dev_err(&client->dev, "%s: failed to enable clock\n",
> > +                     __func__);
> > +             goto reg_off;
> > +     }
> > +
> > +     fsleep(20); /* T4 > 20us */
> > +
> > +     ret =3D imx678_write_common(imx678);
> > +     if (ret) {
> > +             dev_err(&client->dev, "%s failed to write registers\n", _=
_func__);
> > +             goto clk_off;
> > +     }
> > +
> > +     return 0;
> > +
> > +clk_off:
> > +     clk_disable_unprepare(imx678->xclk);
>=20
> A newline here.
>=20
> > +reg_off:
> > +     gpiod_set_value_cansleep(imx678->reset_gpio, 1);
> > +     regulator_bulk_disable(ARRAY_SIZE(imx678_supply_name), imx678->su=
pplies);
>=20
> Here, too.
>=20
> Can you run
>=20
>         $ ./scripts/checkpatch.pl --strict --max-line-length=3D80
>=20
> on this?
>=20

Ah alright, I thought it was 100. Will fix.

> > +     return ret;
> > +}
> > +
> > +static int imx678_power_off(struct device *dev)
> > +{
> > +     struct i2c_client *client =3D to_i2c_client(dev);
> > +     struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +     struct imx678 *imx678 =3D to_imx678(sd);
> > +
> > +     clk_disable_unprepare(imx678->xclk);
> > +     gpiod_set_value_cansleep(imx678->reset_gpio, 1);
> > +     regulator_bulk_disable(ARRAY_SIZE(imx678_supply_name), imx678->su=
pplies);
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx678_get_regulators(struct imx678 *imx678)
> > +{
> > +     struct i2c_client *client =3D v4l2_get_subdevdata(&imx678->sd);
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(imx678_supply_name); i++)
> > +             imx678->supplies[i].supply =3D imx678_supply_name[i];
> > +
> > +     return devm_regulator_bulk_get(&client->dev, ARRAY_SIZE(imx678_su=
pply_name),
> > +                                    imx678->supplies);
>=20
> I'd just put these few lines into probe(). Up to you though.
>=20
> > +}
> > +
> > +static int imx678_identify_model(struct imx678 *imx678)
> > +{
> > +     struct i2c_client *client =3D v4l2_get_subdevdata(&imx678->sd);
> > +     const struct imx678_model_info *info;
> > +     enum imx678_type detected;
> > +     int ret =3D 0;
> > +     u64 val =3D 0;
> > +
> > +     info =3D of_device_get_match_data(&client->dev);
>=20
> Please use device_get_match_data() instead.
>=20
> Note that (theoretically at least) info could be NULL if the device isn't
> instantiated from DT/ACPI.
>=20

Ack.

> > +
> > +     /*
> > +      * This sensor's ID registers become accessible 80ms after coming=
 out
> > +      * of STANDBY mode.
> > +      */
> > +     cci_write(imx678->cci, IMX678_REG_MODE_SELECT, 0, &ret);
> > +     fsleep(IMX678_MODULE_ID_DELAY);
> > +
> > +     cci_read(imx678->cci, IMX678_REG_MODULE_ID, &val, &ret);
> > +
> > +     if (val !=3D IMX678_ID) {
> > +             dev_err(&client->dev,
> > +                     "Chip ID mismatch: %x!=3D%llx\n", IMX678_ID, val);
> > +             return -ENXIO;
> > +     }
> > +
> > +     cci_read(imx678->cci, IMX678_REG_MONOCHROME, &val, &ret);
> > +
> > +     if (ret) {
> > +             dev_err(&client->dev,
> > +                     "I2C transaction failed ret =3D %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     detected =3D val & IMX678_TYPE;
> > +
> > +     if (info && detected !=3D info->type)
> > +             dev_err(&client->dev,
> > +                     "sensor type mismatch: detected %s, DT specifies =
%s; using DT value\n",
> > +                     detected =3D=3D IMX678_MONOCHROME ? "mono" : "col=
or",
> > +                     info->type =3D=3D IMX678_MONOCHROME ? "mono" : "c=
olor");
> > +
> > +     imx678->type =3D info ? info->type : detected;
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_core_ops imx678_core_ops =3D {
> > +     .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> > +     .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
> > +};
> > +
> > +static const struct v4l2_subdev_video_ops imx678_video_ops =3D {
> > +     .s_stream =3D v4l2_subdev_s_stream_helper,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops imx678_pad_ops =3D {
> > +     .enum_mbus_code =3D imx678_enum_mbus_code,
> > +     .get_fmt =3D v4l2_subdev_get_fmt,
> > +     .set_fmt =3D imx678_set_pad_format,
> > +     .get_selection =3D imx678_get_selection,
> > +     .set_selection =3D imx678_set_selection,
> > +     .enum_frame_size =3D imx678_enum_frame_size,
> > +     .enable_streams =3D imx678_enable_streams,
> > +     .disable_streams =3D imx678_disable_streams,
> > +};
> > +
> > +static const struct v4l2_subdev_ops imx678_subdev_ops =3D {
> > +     .core =3D &imx678_core_ops,
> > +     .video =3D &imx678_video_ops,
> > +     .pad =3D &imx678_pad_ops,
> > +};
> > +
> > +static const struct v4l2_subdev_internal_ops imx678_internal_ops =3D {
> > +     .init_state =3D imx678_init_state,
> > +};
> > +
> > +static int imx678_init_controls(struct imx678 *imx678)
> > +{
> > +     struct v4l2_ctrl_handler *ctrl_hdlr;
> > +     const u32 hmax_4lane =3D min_hmax_4lane[__ffs(imx678->link_freq_b=
itmap)];
> > +     const u32 lane_scale =3D imx678->lane_mode =3D=3D IMX678_LANEMODE=
_2L ? 2 : 1;
> > +     struct i2c_client *client =3D v4l2_get_subdevdata(&imx678->sd);
> > +     struct v4l2_fwnode_device_properties props;
> > +     s32 hblank, max_hblank;
> > +     u32 hmax;
> > +     int ret;
> > +
> > +     ctrl_hdlr =3D &imx678->ctrl_handler;
> > +     ret =3D v4l2_ctrl_handler_init(ctrl_hdlr, 11);
> > +     if (ret)
> > +             return ret;
> > +
> > +     imx678->vmax =3D IMX678_VMAX_DEFAULT;
> > +     hmax =3D hmax_4lane * lane_scale;
> > +
> > +     /* PIXEL_RATE is fixed and read-only */
> > +     imx678->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx678_ctrl_=
ops,
> > +                                            V4L2_CID_PIXEL_RATE,
> > +                                            IMX678_PIXEL_RATE,
> > +                                            IMX678_PIXEL_RATE, 1,
> > +                                            IMX678_PIXEL_RATE);
> > +
> > +     /* LINK_FREQ is also read only */
> > +     imx678->link_freq =3D
> > +             v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx678_ctrl_ops,
> > +                                    V4L2_CID_LINK_FREQ,
> > +                                    ARRAY_SIZE(link_freqs) - 1,
> > +                                    __ffs(imx678->link_freq_bitmap),
> > +                                    link_freqs);
> > +
> > +     if (imx678->link_freq)
> > +             imx678->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +     imx678->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx678_ctrl_ops,=
 V4L2_CID_VBLANK,
> > +                                        imx678->vmax - imx678_active_a=
rea.height,
> > +                                        IMX678_VMAX_MAX - imx678_activ=
e_area.height, 2,
> > +                                        imx678->vmax - imx678_active_a=
rea.height);
> > +
> > +     hblank =3D hmax * IMX678_PIX_PER_CLK - imx678_active_area.width;
> > +     max_hblank =3D IMX678_HMAX_MAX * IMX678_PIX_PER_CLK - imx678_acti=
ve_area.width;
> > +     imx678->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx678_ctrl_ops,=
 V4L2_CID_HBLANK,
> > +                                        hblank, max_hblank, IMX678_PIX=
_PER_CLK, hblank);
> > +
> > +     imx678->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx678_ctrl_op=
s,
> > +                                          V4L2_CID_EXPOSURE,
> > +                                          IMX678_EXPOSURE_MIN,
> > +                                          IMX678_VMAX_DEFAULT -
> > +                                          IMX678_SHR_MIN,
> > +                                          IMX678_EXPOSURE_STEP,
> > +                                          IMX678_EXPOSURE_DEFAULT);
> > +
> > +     imx678->gain =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx678_ctrl_ops, V=
4L2_CID_ANALOGUE_GAIN,
> > +                                      IMX678_ANA_GAIN_MIN_NORMAL, IMX6=
78_ANA_GAIN_MAX_NORMAL,
> > +                                      IMX678_ANA_GAIN_STEP, IMX678_ANA=
_GAIN_DEFAULT);
> > +
> > +     imx678->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx678_ctrl_ops, =
V4L2_CID_HFLIP, 0, 1, 1, 0);
> > +     imx678->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx678_ctrl_ops, =
V4L2_CID_VFLIP, 0, 1, 1, 0);
> > +
> > +     v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx678_ctrl_ops, V4L2_CI=
D_TEST_PATTERN,
> > +                                  ARRAY_SIZE(imx678_tpg_menu) - 1, 0, =
0,
> > +                                  imx678_tpg_menu);
> > +
> > +     if (ctrl_hdlr->error) {
> > +             ret =3D ctrl_hdlr->error;
> > +             dev_err(&client->dev, "%s control init failed (%d)\n",
> > +                     __func__, ret);
> > +             goto error;
>=20
> You can omit doing this here; just call v4l2_ctrl_new_fwnode_properties()
> and check for errors after that.
>=20
> > +     }
> > +
> > +     ret =3D v4l2_fwnode_device_parse(&client->dev, &props);
> > +     if (ret)
> > +             goto error;
>=20
> Do this first and you can simplify error handling.
>=20

Ack.

> > +
> > +     ret =3D v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx678_ctrl_o=
ps, &props);
> > +     if (ret)
> > +             goto error;
> > +
> > +     imx678->sd.ctrl_handler =3D ctrl_hdlr;
> > +
> > +     return 0;
> > +
> > +error:
> > +     v4l2_ctrl_handler_free(ctrl_hdlr);
> > +
> > +     return ret;
> > +}
> > +
> > +static void imx678_free_controls(struct imx678 *imx678)
> > +{
> > +     v4l2_ctrl_handler_free(imx678->sd.ctrl_handler);
>=20
> I'm not sure having a function for this is useful.
>=20

Ack.

> > +}
> > +
> > +static int imx678_check_hwcfg(struct device *dev, struct imx678 *imx67=
8)
> > +{
> > +     struct fwnode_handle *endpoint;
> > +     struct v4l2_fwnode_endpoint ep_cfg =3D {
> > +             .bus_type =3D V4L2_MBUS_CSI2_DPHY
> > +     };
> > +     int ret =3D -EINVAL;
> > +
> > +     endpoint =3D fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL=
);
>=20
> Please use fwnode_graph_get_endpoint_by_id().
>=20

Ack.

Thanks,
    Jai

> > +     if (!endpoint) {
> > +             dev_err(dev, "endpoint node not found\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg)) {
> > +             dev_err(dev, "could not parse endpoint\n");
> > +             goto error_out;
> > +     }
> > +
> > +     switch (ep_cfg.bus.mipi_csi2.num_data_lanes) {
> > +     case 2:
> > +             imx678->lane_mode =3D IMX678_LANEMODE_2L;
> > +             break;
> > +     case 4:
> > +             imx678->lane_mode =3D IMX678_LANEMODE_4L;
> > +             break;
> > +     default:
> > +             dev_err(dev,
> > +                     "only 2 or 4 CSI2 data lanes are currently suppor=
ted\n");
> > +             goto error_out;
> > +     }
> > +
> > +     ret =3D v4l2_link_freq_to_bitmap(dev, ep_cfg.link_frequencies,
> > +                                    ep_cfg.nr_of_link_frequencies,
> > +                                    link_freqs, ARRAY_SIZE(link_freqs),
> > +                                    &imx678->link_freq_bitmap);
> > +
> > +error_out:
> > +     v4l2_fwnode_endpoint_free(&ep_cfg);
> > +     fwnode_handle_put(endpoint);
> > +
> > +     return ret;
> > +}
> > +
> > +static int imx678_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     struct imx678 *imx678;
> > +     int ret, i;
> > +
> > +     imx678 =3D devm_kzalloc(&client->dev, sizeof(*imx678), GFP_KERNEL=
);
> > +     if (!imx678)
> > +             return -ENOMEM;
> > +
> > +     v4l2_i2c_subdev_init(&imx678->sd, client, &imx678_subdev_ops);
> > +
> > +     imx678->cci =3D devm_cci_regmap_init_i2c(client, 16);
> > +     if (IS_ERR(imx678->cci))
> > +             return dev_err_probe(dev, PTR_ERR(imx678->cci),
> > +                                  "failed to init CCI\n");
> > +
> > +     if (imx678_check_hwcfg(dev, imx678))
> > +             return -EINVAL;
> > +
> > +     imx678->xclk =3D devm_v4l2_sensor_clk_get(dev, NULL);
> > +     if (IS_ERR(imx678->xclk))
> > +             return dev_err_probe(dev, PTR_ERR(imx678->xclk),
> > +                                  "failed to get xclk\n");
> > +
> > +     imx678->xclk_freq =3D clk_get_rate(imx678->xclk);
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(imx678_inck_table); ++i) {
> > +             if (imx678_inck_table[i].xclk_hz =3D=3D imx678->xclk_freq=
) {
> > +                     imx678->inck_sel_val =3D imx678_inck_table[i].inc=
k_sel;
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (i =3D=3D ARRAY_SIZE(imx678_inck_table))
> > +             return dev_err_probe(dev, -EINVAL,
> > +                                  "unsupported XCLK rate %u Hz\n",
> > +                                  imx678->xclk_freq);
> > +
> > +     ret =3D imx678_get_regulators(imx678);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to get regulators\=
n");
> > +
> > +     imx678->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
> > +                                                  GPIOD_OUT_HIGH);
> > +     if (IS_ERR(imx678->reset_gpio))
> > +             return dev_err_probe(dev, PTR_ERR(imx678->reset_gpio),
> > +                                  "failed to get reset GPIO\n");
> > +
> > +     ret =3D imx678_power_on(dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D imx678_identify_model(imx678);
> > +     if (ret)
> > +             goto error_power_off;
> > +
> > +     pm_runtime_set_active(dev);
> > +     pm_runtime_enable(dev);
> > +
> > +     ret =3D imx678_init_controls(imx678);
> > +     if (ret)
> > +             goto error_pm_runtime;
> > +
> > +     imx678->sd.internal_ops =3D &imx678_internal_ops;
> > +     imx678->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
> > +                             V4L2_SUBDEV_FL_HAS_EVENTS;
> > +     imx678->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +     imx678->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> > +
> > +     ret =3D media_entity_pads_init(&imx678->sd.entity, 1, &imx678->pa=
d);
> > +     if (ret) {
> > +             dev_err(dev, "failed to init entity pads: %d\n", ret);
> > +             goto error_handler_free;
> > +     }
> > +
> > +     imx678->sd.state_lock =3D imx678->ctrl_handler.lock;
> > +     ret =3D v4l2_subdev_init_finalize(&imx678->sd);
> > +     if (ret < 0) {
> > +             dev_err(dev, "subdev init error\n");
> > +             goto error_media_entity;
> > +     }
> > +
> > +     ret =3D v4l2_async_register_subdev_sensor(&imx678->sd);
> > +     if (ret < 0) {
> > +             dev_err(dev, "failed to register sensor sub-device: %d\n"=
, ret);
> > +             goto error_subdev_cleanup;
> > +     }
> > +
> > +     pm_runtime_idle(dev);
> > +
> > +     return 0;
> > +
> > +error_subdev_cleanup:
> > +     v4l2_subdev_cleanup(&imx678->sd);
> > +
> > +error_media_entity:
> > +     media_entity_cleanup(&imx678->sd.entity);
> > +
> > +error_handler_free:
> > +     imx678_free_controls(imx678);
> > +
> > +error_pm_runtime:
> > +     pm_runtime_disable(&client->dev);
> > +     pm_runtime_set_suspended(&client->dev);
> > +
> > +error_power_off:
> > +     imx678_power_off(&client->dev);
> > +
> > +     return ret;
> > +}
> > +
> > +static void imx678_remove(struct i2c_client *client)
> > +{
> > +     struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +     struct imx678 *imx678 =3D to_imx678(sd);
> > +
> > +     v4l2_async_unregister_subdev(sd);
> > +     v4l2_subdev_cleanup(sd);
> > +     media_entity_cleanup(&sd->entity);
> > +     imx678_free_controls(imx678);
> > +
> > +     pm_runtime_disable(&client->dev);
> > +     if (!pm_runtime_status_suspended(&client->dev))
> > +             imx678_power_off(&client->dev);
> > +     pm_runtime_set_suspended(&client->dev);
> > +}
> > +
> > +static const struct dev_pm_ops imx678_pm_ops =3D {
> > +     SET_RUNTIME_PM_OPS(imx678_power_off, imx678_power_on, NULL)
> > +};
> > +
> > +static const struct of_device_id imx678_of_match[] =3D {
> > +     { .compatible =3D "sony,imx678" },
> > +     { .compatible =3D "sony,imx678-aamr", .data =3D &imx678_aamr_info=
 },
> > +     { .compatible =3D "sony,imx678-aaqr", .data =3D &imx678_aaqr_info=
 },
> > +     { /* sentinel */ }
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, imx678_of_match);
> > +
> > +static struct i2c_driver imx678_i2c_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "imx678",
> > +             .of_match_table =3D imx678_of_match,
> > +             .pm =3D &imx678_pm_ops,
> > +     },
> > +     .probe =3D imx678_probe,
> > +     .remove =3D imx678_remove,
> > +};
> > +
> > +module_i2c_driver(imx678_i2c_driver);
> > +
> > +MODULE_AUTHOR("Will Whang <will@willwhang.com>");
> > +MODULE_AUTHOR("Tetsuya NOMURA <tetsuya.nomura@soho-enterprise.com>");
> > +MODULE_AUTHOR("Jai Luthra <jai.luthra@ideasonboard.com>");
> > +MODULE_DESCRIPTION("Sony imx678 sensor driver");
> > +MODULE_LICENSE("GPL");
>=20
> --=20
> Kind regards,
>=20
> Sakari Ailus

