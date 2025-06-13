Return-Path: <linux-media+bounces-34742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EAAAD89ED
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 13:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8788917749B
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 11:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E332D29AE;
	Fri, 13 Jun 2025 11:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ff5LBwed"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AE663A9;
	Fri, 13 Jun 2025 11:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749812585; cv=none; b=FIy918+dtem3EbjNkS138cMMwElHOHNgK8G44BvDSSbLkaLzy6O8HvSIJ8Ko+F7/sdvRzFdk0WVfako9jyHHOJKydax5VWopM3zUkIYcC6w1stvAdxaaeWYTJgcuVTnqTSdOBUWLpU7J5wug7RohkwUBA1mh8og8ZBptuanzDg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749812585; c=relaxed/simple;
	bh=w1g5Q1dd3cz3osFH6+vwqRHq/zmMWntL+UV34jwqUl4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ZKcPI/nBWtQbjoa3a/7yeJp/m+Y+Ftm2CC2t8eo3xUyM/MN9BxKtgawFvxi3VnYpn8g0/hqz+j8sAvp11o1q+hTOgSZuv7bnC1v6hEhpuC7EyNoSFHkUFlDxRahtTKWByBHhW8D2dPHYJm0jUdMB99YnAnIGjizEOH2YgQXcBAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ff5LBwed; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 367B4348;
	Fri, 13 Jun 2025 13:02:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749812570;
	bh=w1g5Q1dd3cz3osFH6+vwqRHq/zmMWntL+UV34jwqUl4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Ff5LBwedevnupTcj3wVbm9lGZWNH01LDZwaRxiLomNSeh1Oj8QmClDaswe7oUgomg
	 NE1AqqqP6zn9ZE5hqy/cl5aBL00TLN09GIJ0IVkyn7WJPbrzVt90jyWdKvabwHk/q4
	 scORhx/L55K4pjBPcobtM11huXx2wORaLZO0z5NE=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com> <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: mchehab@kernel.org, laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org, krzk@kernel.org, dave.stevenson@raspberrypi.com, hdegoede@redhat.com, jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com, dantony@amd.com, vengutta@amd.com, dongcheng.yan@intel.com, jason.z.chen@intel.com, jimmy.su@intel.com
To: Hao Yao <hao.yao@intel.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>, sakari.ailus@linux.intel.com
Date: Fri, 13 Jun 2025 12:02:55 +0100
Message-ID: <174981257597.425770.15369432320575770694@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Hao Yao (2025-06-13 05:55:46)
> Hi Pratap,
>=20
> Thanks for your patch.
>=20
> This patch is written for your camera sensor module, which seems very=20
> different from those already applied on Dell laptops (some of "Dell Pro" =

> series). Looking into the driver, I think this version will break the=20

Have there been existing efforts from Intel to upstream support for that
device?

Or is this simply the case that Intel have lost the race by not working
towards upstream?

I see plenty of references to OV05C10 in the intel/ipu6 repositories on
github - but that doesn't count as upstream here ...

Perhaps could Intel work to support the additional requirements on top
of AMD's driver ?


But having multiple devices use the same sensor driver is a good thing
here.

I think it will highlight that werever possible - the code below should
be factored out to support the different configuration requirements.
Cleaning up the large tables of register addresses and making those
configurable functions for example configuring the link rate
independently would be really beneficial!

That's precisely why we continually push for reducing the large
"undocumented register" tables in sensor drivers...



> devices using ov05c10 sensor.
>=20
> I think this patch is better to be validated on existing devices, but=20
> please do some fixes before we can do validation. Please check my=20
> comments inline.
>=20
>=20
> On 2025/6/10 03:42, Pratap Nirujogi wrote:
> > Add driver for OmniVision 5.2M OV05C10 sensor. This driver
> > supports only the full size normal 2888x1808@30fps 2-lane
> > sensor profile.
> >=20
> > Co-developed-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
> > Signed-off-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
> > Co-developed-by: Bin Du <bin.du@amd.com>
> > Signed-off-by: Bin Du <bin.du@amd.com>
> > Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> > ---
> > Changes v2 -> v3:
> >=20
> > * Update "refclk" property variable as "clock-frequency".
> > * Update sensor GPIO connector id name.
> > * Fix sensor v4l2 compliance issue.
> > * Fix license info.
> > * Address review comments.
> >=20
> >   MAINTAINERS                 |    8 +
> >   drivers/media/i2c/Kconfig   |   10 +
> >   drivers/media/i2c/Makefile  |    1 +
> >   drivers/media/i2c/ov05c10.c | 1061 +++++++++++++++++++++++++++++++++++
> >   4 files changed, 1080 insertions(+)
> >   create mode 100644 drivers/media/i2c/ov05c10.c
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index a92290fffa16..caca25d00bf2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -18303,6 +18303,14 @@ T:   git git://linuxtv.org/media.git
> >   F:  Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml
> >   F:  drivers/media/i2c/ov02e10.c
> >  =20
> > +OMNIVISION OV05C10 SENSOR DRIVER
> > +M:   Nirujogi Pratap <pratap.nirujogi@amd.com>
> > +M:   Bin Du <bin.du@amd.com>
> > +L:   linux-media@vger.kernel.org
> > +S:   Maintained
> > +T:   git git://linuxtv.org/media.git
> > +F:   drivers/media/i2c/ov05c10.c
> > +
> >   OMNIVISION OV08D10 SENSOR DRIVER
> >   M:  Jimmy Su <jimmy.su@intel.com>
> >   L:  linux-media@vger.kernel.org
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index e68202954a8f..1662fb29d75c 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -377,6 +377,16 @@ config VIDEO_OV02C10
> >         To compile this driver as a module, choose M here: the
> >         module will be called ov02c10.
> >  =20
> > +config VIDEO_OV05C10
> > +     tristate "OmniVision OV05C10 sensor support"
> > +     select V4L2_CCI_I2C
> > +     help
> > +       This is a Video4Linux2 sensor driver for the OmniVision
> > +       OV05C10 camera.
> > +
> > +       To compile this driver as a module, choose M here: the
> > +       module will be called OV05C10.
> > +
> >   config VIDEO_OV08D10
> >           tristate "OmniVision OV08D10 sensor support"
> >           help
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index 5873d29433ee..b4a1d721a7f2 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -85,6 +85,7 @@ obj-$(CONFIG_VIDEO_OV01A10) +=3D ov01a10.o
> >   obj-$(CONFIG_VIDEO_OV02A10) +=3D ov02a10.o
> >   obj-$(CONFIG_VIDEO_OV02C10) +=3D ov02c10.o
> >   obj-$(CONFIG_VIDEO_OV02E10) +=3D ov02e10.o
> > +obj-$(CONFIG_VIDEO_OV05C10) +=3D ov05c10.o
> >   obj-$(CONFIG_VIDEO_OV08D10) +=3D ov08d10.o
> >   obj-$(CONFIG_VIDEO_OV08X40) +=3D ov08x40.o
> >   obj-$(CONFIG_VIDEO_OV13858) +=3D ov13858.o
> > diff --git a/drivers/media/i2c/ov05c10.c b/drivers/media/i2c/ov05c10.c
> > new file mode 100644
> > index 000000000000..9a1e493c4073
> > --- /dev/null
> > +++ b/drivers/media/i2c/ov05c10.c
> > @@ -0,0 +1,1061 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +// Copyright (C) 2025 Advanced Micro Devices, Inc.
> > +
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/units.h>
> > +#include <media/v4l2-cci.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-fwnode.h>
> > +
> > +#define DRV_NAME                     "ov05c10"
> > +#define OV05C10_REF_CLK                      (24 * HZ_PER_MHZ)
>=20
> Seems your module use 24 MHz clock input. The Dell's modules always use=20
> 19.2MHz, which means your the PLL settings will not work on Dell's.

That sounds like a feature that Dell and Intel could work towards
supporting ?

For instance, we made the Sony IMX283 support multiple input frequencies:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/media/i2c/imx283.c#n263

Of course it would be even better if we could always dynamically
calculate the PLLs correctly based on the input clocks.

And if we can make the drivers more freely configurable instead of
mode-based - then they would be more adaptable to the different platform
configurations possible in different environments.

>=20
> > +
> > +#define MODE_WIDTH  2888
> > +#define MODE_HEIGHT 1808
> > +
> > +#define PAGE_NUM_MASK                        0xff000000
> > +#define PAGE_NUM_SHIFT                       24
> > +#define REG_ADDR_MASK                        0x00ffffff
> > +
> > +#define OV05C10_SYSCTL_PAGE          (0 << PAGE_NUM_SHIFT)
> > +#define OV05C10_CISCTL_PAGE          (1 << PAGE_NUM_SHIFT)
> > +#define OV05C10_ISPCTL_PAGE          (4 << PAGE_NUM_SHIFT)
> > +
> > +/* Chip ID */
> > +#define OV05C10_REG_CHIP_ID          (CCI_REG24(0x00) | OV05C10_SYSCTL=
_PAGE)
> > +#define OV05C10_CHIP_ID                      0x43055610
> > +
> > +/* Control registers */
> > +#define OV05C10_REG_TRIGGER          (CCI_REG8(0x01) | OV05C10_CISCTL_=
PAGE)
> > +#define OV05C_REG_TRIGGER_START              BIT(0)
> > +
> > +/* Exposure control */
> > +#define OV05C10_REG_EXPOSURE         (CCI_REG24(0x02) | OV05C10_CISCTL=
_PAGE)
> > +#define OV05C10_EXPOSURE_MAX_MARGIN  33
> > +#define OV05C10_EXPOSURE_MIN         4
> > +#define OV05C10_EXPOSURE_STEP                1
> > +#define OV05C10_EXPOSURE_DEFAULT     0x40
> > +
> > +/* V_TIMING internal */
> > +#define OV05C10_REG_VTS                      (CCI_REG16(0x05) | OV05C1=
0_CISCTL_PAGE)
> > +#define OV05C10_VTS_30FPS            1860
> > +#define OV05C10_VTS_MAX                      0x7fff
> > +
> > +/* Test Pattern Control */
> > +#define OV05C10_REG_TEST_PATTERN     (CCI_REG8(0x12) | OV05C10_ISPCTL_=
PAGE)
> > +#define OV05C10_TEST_PATTERN_ENABLE  BIT(0)
> > +#define OV05C10_REG_TEST_PATTERN_CTL (CCI_REG8(0xf3) | OV05C10_ISPCTL_=
PAGE)
> > +#define OV05C10_REG_TEST_PATTERN_XXX BIT(0)
> > +
> > +/* Digital gain control */
> > +#define OV05C10_REG_DGTL_GAIN_H              (CCI_REG8(0x21) | OV05C10=
_CISCTL_PAGE)
> > +#define OV05C10_REG_DGTL_GAIN_L              (CCI_REG8(0x22) | OV05C10=
_CISCTL_PAGE)
> > +
> > +#define OV05C10_DGTL_GAIN_MIN                0x40
> > +#define OV05C10_DGTL_GAIN_MAX                0xff
> > +#define OV05C10_DGTL_GAIN_DEFAULT    0x40
> > +#define OV05C10_DGTL_GAIN_STEP               1
> > +
> > +#define OV05C10_DGTL_GAIN_L_MASK     0xff
> > +#define OV05C10_DGTL_GAIN_H_SHIFT    8
> > +#define OV05C10_DGTL_GAIN_H_MASK     0xff00
> > +
> > +/* Analog gain control */
> > +#define OV05C10_REG_ANALOG_GAIN              (CCI_REG8(0x24) | OV05C10=
_CISCTL_PAGE)
> > +#define OV05C10_ANA_GAIN_MIN         0x80
> > +#define OV05C10_ANA_GAIN_MAX         0x07c0
> > +#define OV05C10_ANA_GAIN_STEP                1
> > +#define OV05C10_ANA_GAIN_DEFAULT     0x80
> > +
> > +/* H TIMING internal */
> > +#define OV05C10_REG_HTS                      (CCI_REG16(0x37) | OV05C1=
0_CISCTL_PAGE)
> > +#define OV05C10_HTS_30FPS            0x0280
> > +
> > +/* Page selection */
> > +#define OV05C10_REG_PAGE_CTL         CCI_REG8(0xfd)
> > +
> > +#define NUM_OF_PADS 1
> > +
> > +#define OV05C10_GET_PAGE_NUM(reg)    (((reg) & PAGE_NUM_MASK) >>\
> > +                                      PAGE_NUM_SHIFT)
> > +#define OV05C10_GET_REG_ADDR(reg)    ((reg) & REG_ADDR_MASK)
> > +
> > +enum {
> > +     OV05C10_LINK_FREQ_900MHZ_INDEX,
> > +};
> > +
> > +struct ov05c10_reg_list {
> > +     u32 num_of_regs;
> > +     const struct cci_reg_sequence *regs;
> > +};
> > +
> > +/* Mode : resolution and related config&values */
> > +struct ov05c10_mode {
> > +     /* Frame width */
> > +     u32 width;
> > +     /* Frame height */
> > +     u32 height;
> > +     /* number of lanes */
> > +     u32 lanes;
> > +
> > +     /* V-timing */
> > +     u32 vts_def;
> > +     u32 vts_min;
> > +
> > +     /* HTS */
> > +     u32 hts;
> > +
> > +     /* Index of Link frequency config to be used */
> > +     u32 link_freq_index;
> > +
> > +     /* Default register values */
> > +     struct ov05c10_reg_list reg_list;
> > +};
> > +
> > +static const s64 ov05c10_link_frequencies[] =3D {
> > +     925 * HZ_PER_MHZ,
> > +};
>=20
> Is it 900 MHz, or 925 MHz?
>=20
> > +
> > +/* 2888x1808 30fps, 1800mbps, 2lane, 24mhz */
>=20
> Currently Dell's devices with ov05c10 use a CV chip to passthrough MIPI=20
> CSI signals, but it supports max 750 MHz link frequency. That's why this =

> version:
> https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov05c=
10.c
> uses 480 MHz link frequency and a different resolution setting=20
> (2800x1576). At least the setting in out-of-tree Github driver should be =

> merged into this version.

If Pratap doesn't have that device, can you work towards adding the
support and testing?



>=20
> > +static const struct cci_reg_sequence ov05c10_2888x1808_regs[] =3D {
> > +     { CCI_REG8(0xfd),  0x00 },
> > +     { CCI_REG8(0x20),  0x00 },
> > +     { CCI_REG8(0xfd),  0x00 },
> > +     { CCI_REG8(0x20),  0x0b },
> > +     { CCI_REG8(0xc1),  0x09 },
> > +     { CCI_REG8(0x21),  0x06 },
> > +     { CCI_REG8(0x14),  0x78 },
> > +     { CCI_REG8(0xe7),  0x03 },
> > +     { CCI_REG8(0xe7),  0x00 },
> > +     { CCI_REG8(0x21),  0x00 },
> > +     { CCI_REG8(0xfd),  0x01 },
> > +     { CCI_REG8(0x03),  0x00 },
> > +     { CCI_REG8(0x04),  0x06 },
> > +     { CCI_REG8(0x05),  0x07 },
> > +     { CCI_REG8(0x06),  0x44 },
> > +     { CCI_REG8(0x07),  0x08 },
> > +     { CCI_REG8(0x1b),  0x01 },
> > +     { CCI_REG8(0x24),  0xff },
> > +     { CCI_REG8(0x32),  0x03 },
> > +     { CCI_REG8(0x42),  0x5d },
> > +     { CCI_REG8(0x43),  0x08 },
> > +     { CCI_REG8(0x44),  0x81 },
> > +     { CCI_REG8(0x46),  0x5f },
> > +     { CCI_REG8(0x48),  0x18 },
> > +     { CCI_REG8(0x49),  0x04 },
> > +     { CCI_REG8(0x5c),  0x18 },
> > +     { CCI_REG8(0x5e),  0x13 },
> > +     { CCI_REG8(0x70),  0x15 },
> > +     { CCI_REG8(0x77),  0x35 },
> > +     { CCI_REG8(0x79),  0x00 },
> > +     { CCI_REG8(0x7b),  0x08 },
> > +     { CCI_REG8(0x7d),  0x08 },
> > +     { CCI_REG8(0x7e),  0x08 },
> > +     { CCI_REG8(0x7f),  0x08 },
> > +     { CCI_REG8(0x90),  0x37 },
> > +     { CCI_REG8(0x91),  0x05 },
> > +     { CCI_REG8(0x92),  0x18 },
> > +     { CCI_REG8(0x93),  0x27 },
> > +     { CCI_REG8(0x94),  0x05 },
> > +     { CCI_REG8(0x95),  0x38 },
> > +     { CCI_REG8(0x9b),  0x00 },
> > +     { CCI_REG8(0x9c),  0x06 },
> > +     { CCI_REG8(0x9d),  0x28 },
> > +     { CCI_REG8(0x9e),  0x06 },
> > +     { CCI_REG8(0xb2),  0x0f },
> > +     { CCI_REG8(0xb3),  0x29 },
> > +     { CCI_REG8(0xbf),  0x3c },
> > +     { CCI_REG8(0xc2),  0x04 },
> > +     { CCI_REG8(0xc4),  0x00 },
> > +     { CCI_REG8(0xca),  0x20 },
> > +     { CCI_REG8(0xcb),  0x20 },
> > +     { CCI_REG8(0xcc),  0x28 },
> > +     { CCI_REG8(0xcd),  0x28 },
> > +     { CCI_REG8(0xce),  0x20 },
> > +     { CCI_REG8(0xcf),  0x20 },
> > +     { CCI_REG8(0xd0),  0x2a },
> > +     { CCI_REG8(0xd1),  0x2a },
> > +     { CCI_REG8(0xfd),  0x0f },
> > +     { CCI_REG8(0x00),  0x00 },
> > +     { CCI_REG8(0x01),  0xa0 },
> > +     { CCI_REG8(0x02),  0x48 },
> > +     { CCI_REG8(0x07),  0x8f },
> > +     { CCI_REG8(0x08),  0x70 },
> > +     { CCI_REG8(0x09),  0x01 },
> > +     { CCI_REG8(0x0b),  0x40 },
> > +     { CCI_REG8(0x0d),  0x07 },
> > +     { CCI_REG8(0x11),  0x33 },
> > +     { CCI_REG8(0x12),  0x77 },
> > +     { CCI_REG8(0x13),  0x66 },
> > +     { CCI_REG8(0x14),  0x65 },
> > +     { CCI_REG8(0x15),  0x37 },
> > +     { CCI_REG8(0x16),  0xbf },
> > +     { CCI_REG8(0x17),  0xff },
> > +     { CCI_REG8(0x18),  0xff },
> > +     { CCI_REG8(0x19),  0x12 },
> > +     { CCI_REG8(0x1a),  0x10 },
> > +     { CCI_REG8(0x1c),  0x77 },
> > +     { CCI_REG8(0x1d),  0x77 },
> > +     { CCI_REG8(0x20),  0x0f },
> > +     { CCI_REG8(0x21),  0x0f },
> > +     { CCI_REG8(0x22),  0x0f },
> > +     { CCI_REG8(0x23),  0x0f },
> > +     { CCI_REG8(0x2b),  0x20 },
> > +     { CCI_REG8(0x2c),  0x20 },
> > +     { CCI_REG8(0x2d),  0x04 },
> > +     { CCI_REG8(0xfd),  0x03 },
> > +     { CCI_REG8(0x9d),  0x0f },
> > +     { CCI_REG8(0x9f),  0x40 },
> > +     { CCI_REG8(0xfd),  0x00 },
> > +     { CCI_REG8(0x20),  0x1b },
> > +     { CCI_REG8(0xfd),  0x04 },
> > +     { CCI_REG8(0x19),  0x60 },
> > +     { CCI_REG8(0xfd),  0x02 },
> > +     { CCI_REG8(0x75),  0x05 },
> > +     { CCI_REG8(0x7f),  0x06 },
> > +     { CCI_REG8(0x9a),  0x03 },
> > +     { CCI_REG8(0xa2),  0x07 },
> > +     { CCI_REG8(0xa3),  0x10 },
> > +     { CCI_REG8(0xa5),  0x02 },
> > +     { CCI_REG8(0xa6),  0x0b },
> > +     { CCI_REG8(0xa7),  0x48 },
> > +     { CCI_REG8(0xfd),  0x07 },
> > +     { CCI_REG8(0x42),  0x00 },
> > +     { CCI_REG8(0x43),  0x80 },
> > +     { CCI_REG8(0x44),  0x00 },
> > +     { CCI_REG8(0x45),  0x80 },
> > +     { CCI_REG8(0x46),  0x00 },
> > +     { CCI_REG8(0x47),  0x80 },
> > +     { CCI_REG8(0x48),  0x00 },
> > +     { CCI_REG8(0x49),  0x80 },
> > +     { CCI_REG8(0x00),  0xf7 },
> > +     { CCI_REG8(0xfd),  0x00 },
> > +     { CCI_REG8(0xe7),  0x03 },
> > +     { CCI_REG8(0xe7),  0x00 },
> > +     { CCI_REG8(0xfd),  0x00 },
> > +     { CCI_REG8(0x93),  0x18 },
> > +     { CCI_REG8(0x94),  0xff },
> > +     { CCI_REG8(0x95),  0xbd },
> > +     { CCI_REG8(0x96),  0x1a },
> > +     { CCI_REG8(0x98),  0x04 },
> > +     { CCI_REG8(0x99),  0x08 },
> > +     { CCI_REG8(0x9b),  0x10 },
> > +     { CCI_REG8(0x9c),  0x3f },
> > +     { CCI_REG8(0xa1),  0x05 },
> > +     { CCI_REG8(0xa4),  0x2f },
> > +     { CCI_REG8(0xc0),  0x0c },
> > +     { CCI_REG8(0xc1),  0x08 },
> > +     { CCI_REG8(0xc2),  0x00 },
> > +     { CCI_REG8(0xb6),  0x20 },
> > +     { CCI_REG8(0xbb),  0x80 },
> > +     { CCI_REG8(0xfd),  0x00 },
> > +     { CCI_REG8(0xa0),  0x01 },
> > +     { CCI_REG8(0xfd),  0x01 },
> > +};
> > +
> > +static const struct cci_reg_sequence mode_OV05C10_stream_on_regs[] =3D=
 {

Why is the word 'mode_ in here ?

> > +     { CCI_REG8(0xfd), 0x01 },
> > +     { CCI_REG8(0x33), 0x03 },
> > +     { CCI_REG8(0x01), 0x02 },
> > +     { CCI_REG8(0xfd), 0x00 },
> > +     { CCI_REG8(0x20), 0x1f },
> > +     { CCI_REG8(0xfd), 0x01 },
> > +};
> > +
> > +static const struct cci_reg_sequence mode_OV05C10_stream_off_regs[] =
=3D {

And why are these two register tables now OV05C10 rather than ov05c10
(capital case, while everything else is lower case)


> > +     { CCI_REG8(0xfd), 0x00 },
> > +     { CCI_REG8(0x20), 0x5b },
> > +     { CCI_REG8(0xfd), 0x01 },
> > +     { CCI_REG8(0x33), 0x02 },
> > +     { CCI_REG8(0x01), 0x02 },

Are there any registers in any of the tables we can name to make the
driver more maintainable? Or extract to a directly coded function to
make it more explicit perhaps?

In both those tables 0xfd gets written in a curious manner - is that
another of the page selection type accesses ?

In fact, I can see that it is the page control register indeed - so
perhaps it would make more sense to code this through the page
accessors!



> > +};
> > +
> > +static const char * const ov05c10_test_pattern_menu[] =3D {
> > +     "Disabled",
> > +     "Vertical Color Bar Type 1",
> > +     "Vertical Color Bar Type 2",
> > +     "Vertical Color Bar Type 3",
> > +     "Vertical Color Bar Type 4"
> > +};
> > +
> > +/* Configurations for supported link frequencies */
> > +#define OV05C10_LINK_FREQ_900MHZ     (900 * HZ_PER_MHZ)
> > +
> > +/* Number of lanes supported */
> > +#define OV05C10_DATA_LANES           2
> > +
> > +/* Bits per sample of sensor output */
> > +#define OV05C10_BITS_PER_SAMPLE              10
> > +
> > +/*
> > + * pixel_rate =3D link_freq * data-rate * nr_of_lanes / bits_per_sample
> > + * data rate =3D> double data rate; number of lanes =3D> 2; bits per p=
ixel =3D> 10
> > + */
> > +static u64 link_freq_to_pixel_rate(u64 f, u32 lane_nr)
> > +{
> > +     f *=3D 2 * lane_nr;
> > +     do_div(f, OV05C10_BITS_PER_SAMPLE);
> > +
> > +     return f;
> > +}
> > +
> > +/* Menu items for LINK_FREQ V4L2 control */
> > +static const s64 ov05c10_link_freq_menu_items[] =3D {
> > +     OV05C10_LINK_FREQ_900MHZ,
> > +};
> > +
> > +/* Mode configs, currently, only support 1 mode */
> > +static const struct ov05c10_mode supported_mode =3D {
> > +     .width =3D MODE_WIDTH,
> > +     .height =3D MODE_HEIGHT,
> > +     .vts_def =3D OV05C10_VTS_30FPS,
> > +     .vts_min =3D OV05C10_VTS_30FPS,
> > +     .hts =3D 640,
> > +     .lanes =3D 2,
> > +     .reg_list =3D {
> > +             .num_of_regs =3D ARRAY_SIZE(ov05c10_2888x1808_regs),
> > +             .regs =3D ov05c10_2888x1808_regs,
> > +     },
> > +     .link_freq_index =3D OV05C10_LINK_FREQ_900MHZ_INDEX,
> > +};
> > +
> > +struct ov05c10 {
> > +     struct v4l2_subdev sd;
> > +     struct media_pad pad;
> > +
> > +     /* V4L2 control handler */
> > +     struct v4l2_ctrl_handler ctrl_handler;
> > +
> > +     /* V4L2 Controls */
> > +     struct v4l2_ctrl *link_freq;
> > +     struct v4l2_ctrl *pixel_rate;
> > +     struct v4l2_ctrl *vblank;
> > +     struct v4l2_ctrl *hblank;
> > +     struct v4l2_ctrl *exposure;
> > +
> > +     struct regmap *regmap;
> > +
> > +     /* gpio descriptor */
> > +     struct gpio_desc *enable_gpio;
> > +
> > +     /* Current page for sensor register control */
> > +     int cur_page;
> > +};
> > +
> > +#define to_ov05c10(_sd)      container_of(_sd, struct ov05c10, sd)
> > +
> > +static int ov05c10_init_state(struct v4l2_subdev *sd,
> > +                           struct v4l2_subdev_state *sd_state)
> > +{
> > +     struct v4l2_mbus_framefmt *frame_fmt;
> > +     struct v4l2_subdev_format fmt =3D {
> > +             .which =3D V4L2_SUBDEV_FORMAT_TRY,
> > +             .format =3D {
> > +                     .width =3D MODE_WIDTH,
> > +                     .height =3D MODE_HEIGHT,
> > +                     .code =3D MEDIA_BUS_FMT_SGRBG10_1X10,
> > +                     .field =3D V4L2_FIELD_NONE,
> > +             }
> > +     };
> > +
> > +     frame_fmt =3D v4l2_subdev_state_get_format(sd_state, 0);
> > +     *frame_fmt =3D fmt.format;
> > +     return 0;
> > +}
> > +
> > +static int ov05c10_switch_page(struct ov05c10 *ov05c10, u32 page, int =
*err)
>=20
> Seems nobody cares the return value of ov05c10_switch_page() or=20
> ov05c10_reg_write(), etc.. It should be better to use void return, or=20
> use return value instead of int *err.

This style probably comes from the way that the CCI helpers were
written, to allow consectuive writes to avoid having to duplicate error
checks when writing lots of registers.

Depending on how the generic page switching could be implemented, there
may still be benefit to tracking the *err and I would still keep the
return ret type - as there are times where it can still make sense to
write:

 	ret =3D ov05c10_switch_page(..)
etc...


>=20
> > +{
> > +     int ret =3D 0;
> > +
> > +     if (err && *err)
> > +             return *err;
> > +
> > +     if (page !=3D ov05c10->cur_page) {
> > +             cci_write(ov05c10->regmap, OV05C10_REG_PAGE_CTL, page, &r=
et);
> > +             if (!ret)
> > +                     ov05c10->cur_page =3D page;
> > +     }
> > +
> > +     if (err)
> > +             *err =3D ret;
> > +
> > +     return ret;
> > +}
> > +
> > +/* refer to the implementation of cci_read */
> > +static int ov05c10_reg_read(struct ov05c10 *ov05c10, u32 reg,
> > +                         u64 *val, int *err)
> > +{
> > +     u32 page;
> > +     u32 addr;
> > +     int ret =3D 0;
> > +
> > +     if (err && *err)
> > +             return *err;
> > +
> > +     page =3D OV05C10_GET_PAGE_NUM(reg);
> > +     addr =3D OV05C10_GET_REG_ADDR(reg);
> > +     ov05c10_switch_page(ov05c10, page, &ret);
> > +     cci_read(ov05c10->regmap, addr, val, &ret);
> > +     if (err)
> > +             *err =3D ret;
> > +
> > +     return ret;
> > +}
> > +
> > +/* refer to the implementation of cci_write */
> > +static int ov05c10_reg_write(struct ov05c10 *ov05c10, u32 reg,
> > +                          u64 val, int *err)
> > +{
> > +     u32 page;
> > +     u32 addr;
> > +     int ret =3D 0;
> > +
> > +     if (err && *err)
> > +             return *err;
> > +
> > +     page =3D OV05C10_GET_PAGE_NUM(reg);
> > +     addr =3D OV05C10_GET_REG_ADDR(reg);
> > +     ov05c10_switch_page(ov05c10, page, &ret);
> > +     cci_write(ov05c10->regmap, addr, val, &ret);
> > +     if (err)
> > +             *err =3D ret;
> > +
> > +     return ret;
> > +}

One of the main goals of CCI helpers was to avoid all of the custom
device accessors being duplicated in each driver, so I think extending
the CCI helpers to support page based accesses in some common way would
be beneficial.


> > +
> > +static int ov05c10_update_vblank(struct ov05c10 *ov05c10, u32 vblank)
> > +{
> > +     const struct ov05c10_mode *mode =3D &supported_mode;
> > +     u64 val;
> > +     int ret =3D 0;
> > +
> > +     val =3D mode->height + vblank;
> > +     ov05c10_reg_write(ov05c10, OV05C10_REG_VTS, val, &ret);
> > +     ov05c10_reg_write(ov05c10, OV05C10_REG_TRIGGER,
> > +                       OV05C_REG_TRIGGER_START, &ret);
> > +
> > +     return ret;
> > +}
>=20
> I remembered that the ov05c10 VTS control (P1:0x05~0x06) is a bit weird. =

> This register seems take the increment of VTS value, so direct write of=20
> VTS value will not set it properly. Does this version make AE working on =

> your platform?
>=20
> > +
> > +static int ov05c10_update_exposure(struct ov05c10 *ov05c10, u32 exposu=
re)
> > +{
> > +     int ret =3D 0;
> > +
> > +     ov05c10_reg_write(ov05c10, OV05C10_REG_EXPOSURE, exposure, &ret);
> > +     ov05c10_reg_write(ov05c10, OV05C10_REG_TRIGGER,
> > +                       OV05C_REG_TRIGGER_START, &ret);
> > +
> > +     return ret;
> > +}
> > +
> > +static int ov05c10_update_analog_gain(struct ov05c10 *ov05c10, u32 a_g=
ain)
> > +{
> > +     int ret =3D 0;
> > +
> > +     ov05c10_reg_write(ov05c10, OV05C10_REG_ANALOG_GAIN, a_gain, &ret);
> > +     ov05c10_reg_write(ov05c10, OV05C10_REG_TRIGGER,
> > +                       OV05C_REG_TRIGGER_START, &ret);
> > +
> > +     return ret;
> > +}
> > +
> > +static int ov05c10_update_digital_gain(struct ov05c10 *ov05c10, u32 d_=
gain)
> > +{
> > +     u64 val;
> > +     int ret =3D 0;
> > +
> > +     val =3D d_gain & OV05C10_DGTL_GAIN_L_MASK;
> > +     ov05c10_reg_write(ov05c10, OV05C10_REG_DGTL_GAIN_L, val, &ret);
> > +
> > +     val =3D (d_gain & OV05C10_DGTL_GAIN_H_MASK) >> OV05C10_DGTL_GAIN_=
H_SHIFT;
> > +     ov05c10_reg_write(ov05c10, OV05C10_REG_DGTL_GAIN_H, val, &ret);
> > +
> > +     ov05c10_reg_write(ov05c10, OV05C10_REG_TRIGGER,
> > +                       OV05C_REG_TRIGGER_START, &ret);
> > +
> > +     return ret;
> > +}
> > +
> > +static int ov05c10_enable_test_pattern(struct ov05c10 *ov05c10, u32 pa=
ttern)
> > +{
> > +     u64 val;
> > +     int ret =3D 0;
> > +
> > +     if (pattern) {
> > +             ov05c10_reg_read(ov05c10, OV05C10_REG_TEST_PATTERN_CTL,
> > +                              &val, &ret);
> > +             ov05c10_reg_write(ov05c10, OV05C10_REG_TEST_PATTERN_CTL,
> > +                               val | OV05C10_REG_TEST_PATTERN_XXX, &re=
t);
> > +             ov05c10_reg_read(ov05c10, OV05C10_REG_TEST_PATTERN, &val,=
 &ret);
> > +             val |=3D OV05C10_TEST_PATTERN_ENABLE;
> > +     } else {
> > +             ov05c10_reg_read(ov05c10, OV05C10_REG_TEST_PATTERN, &val,=
 &ret);
> > +             val &=3D ~OV05C10_TEST_PATTERN_ENABLE;
> > +     }
> > +
> > +     ov05c10_reg_write(ov05c10, OV05C10_REG_TEST_PATTERN, val, &ret);
> > +     ov05c10_reg_write(ov05c10, OV05C10_REG_TRIGGER,
> > +                       OV05C_REG_TRIGGER_START, &ret);
> > +
> > +     return ret;
> > +}
> > +
> > +static int ov05c10_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +     struct ov05c10 *ov05c10 =3D container_of(ctrl->handler,
> > +                                            struct ov05c10, ctrl_handl=
er);
> > +     struct i2c_client *client =3D v4l2_get_subdevdata(&ov05c10->sd);
> > +     const struct ov05c10_mode *mode =3D &supported_mode;
> > +     s64 max;
> > +     int ret =3D 0;
> > +
> > +     /* Propagate change of current control to all related controls */
> > +     if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > +             s64 cur_exp =3D ov05c10->exposure->cur.val;
> > +
> > +             /* Update max exposure while meeting expected vblanking */
> > +             max =3D mode->height + ctrl->val - OV05C10_EXPOSURE_MAX_M=
ARGIN;
> > +             cur_exp =3D clamp(cur_exp, ov05c10->exposure->minimum, ma=
x);
> > +             ret =3D __v4l2_ctrl_modify_range(ov05c10->exposure,
> > +                                            ov05c10->exposure->minimum,
> > +                                            max, ov05c10->exposure->st=
ep,
> > +                                            cur_exp);
> > +             if (!ret)
> > +                     return ret;
> > +     }
> > +
> > +     /*
> > +      * Applying V4L2 control value only happens
> > +      * when power is up for streaming
> > +      */
> > +     if (!pm_runtime_get_if_in_use(&client->dev))
> > +             return 0;
> > +
> > +     switch (ctrl->id) {
> > +     case V4L2_CID_ANALOGUE_GAIN:
> > +             ret =3D ov05c10_update_analog_gain(ov05c10, ctrl->val);
> > +             break;
> > +     case V4L2_CID_DIGITAL_GAIN:
> > +             ret =3D ov05c10_update_digital_gain(ov05c10, ctrl->val);
> > +             break;
> > +     case V4L2_CID_EXPOSURE:
> > +             ret =3D ov05c10_update_exposure(ov05c10, ctrl->val);
> > +             break;
> > +     case V4L2_CID_VBLANK:
> > +             ret =3D ov05c10_update_vblank(ov05c10, ctrl->val);
> > +             break;
> > +     case V4L2_CID_TEST_PATTERN:
> > +             ret =3D ov05c10_enable_test_pattern(ov05c10, ctrl->val);
> > +             break;
> > +     default:
> > +             ret =3D -ENOTTY;
> > +             dev_err(&client->dev,
> > +                     "ctrl(id:0x%x,val:0x%x) is not handled\n",
> > +                     ctrl->id, ctrl->val);
> > +             break;
> > +     }
> > +
> > +     pm_runtime_put(&client->dev);
> > +
> > +     return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops ov05c10_ctrl_ops =3D {
> > +     .s_ctrl =3D ov05c10_set_ctrl,
> > +};
> > +
> > +static int ov05c10_enum_mbus_code(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_state *sd_state,
> > +                               struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +     /* Only one bayer order(GRBG) is supported */
> > +     if (code->index > 0)
> > +             return -EINVAL;
> > +
> > +     code->code =3D MEDIA_BUS_FMT_SGRBG10_1X10;
> > +
> > +     return 0;
> > +}
> > +
> > +static int ov05c10_enum_frame_size(struct v4l2_subdev *sd,
> > +                                struct v4l2_subdev_state *sd_state,
> > +                                struct v4l2_subdev_frame_size_enum *fs=
e)
> > +{
> > +     /* ov05c10 driver currently only supports 1 mode*/
> > +     if (fse->index !=3D 0)
> > +             return -EINVAL;
> > +
> > +     if (fse->code !=3D MEDIA_BUS_FMT_SGRBG10_1X10)
> > +             return -EINVAL;
> > +
> > +     fse->min_width =3D supported_mode.width;
> > +     fse->max_width =3D fse->min_width;
> > +     fse->min_height =3D supported_mode.height;
> > +     fse->max_height =3D fse->min_height;
> > +
> > +     return 0;
> > +}
> > +
> > +static void ov05c10_update_pad_format(const struct ov05c10_mode *mode,
> > +                                   struct v4l2_subdev_format *fmt)
> > +{
> > +     fmt->format.width =3D mode->width;
> > +     fmt->format.height =3D mode->height;
> > +     fmt->format.code =3D MEDIA_BUS_FMT_SGRBG10_1X10;
> > +     fmt->format.field =3D V4L2_FIELD_NONE;
> > +}
> > +
> > +static int ov05c10_set_pad_format(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_state *sd_state,
> > +                               struct v4l2_subdev_format *fmt)
> > +{
> > +     struct v4l2_mbus_framefmt *framefmt;
> > +     struct ov05c10 *ov05c10 =3D to_ov05c10(sd);
> > +     const struct ov05c10_mode *mode;
> > +     s32 vblank_def;
> > +     s32 vblank_min;
> > +     s64 pixel_rate;
> > +     s64 link_freq;
> > +     s64 h_blank;
> > +
> > +     /* Only one raw bayer(GRBG) order is supported */
> > +     if (fmt->format.code !=3D MEDIA_BUS_FMT_SGRBG10_1X10)
> > +             fmt->format.code =3D MEDIA_BUS_FMT_SGRBG10_1X10;
> > +
> > +     mode =3D &supported_mode;
> > +     ov05c10_update_pad_format(mode, fmt);
> > +     if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> > +             framefmt =3D v4l2_subdev_state_get_format(sd_state, fmt->=
pad);
> > +             *framefmt =3D fmt->format;
> > +     } else {
> > +             __v4l2_ctrl_s_ctrl(ov05c10->link_freq, mode->link_freq_in=
dex);
> > +             link_freq =3D ov05c10_link_freq_menu_items[mode->link_fre=
q_index];
> > +             pixel_rate =3D link_freq_to_pixel_rate(link_freq,
> > +                                                  mode->lanes);
> > +             __v4l2_ctrl_s_ctrl_int64(ov05c10->pixel_rate, pixel_rate);
> > +
> > +             /* Update limits and set FPS to default */
> > +             vblank_def =3D mode->vts_def - mode->height;
> > +             vblank_min =3D mode->vts_min - mode->height;
> > +             __v4l2_ctrl_modify_range(ov05c10->vblank, vblank_min,
> > +                                      OV05C10_VTS_MAX - mode->height,
> > +                                      1, vblank_def);
> > +             __v4l2_ctrl_s_ctrl(ov05c10->vblank, vblank_def);
> > +             h_blank =3D mode->hts;
> > +             __v4l2_ctrl_modify_range(ov05c10->hblank, h_blank,
> > +                                      h_blank, 1, h_blank);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int ov05c10_start_streaming(struct ov05c10 *ov05c10)
> > +{
> > +     struct i2c_client *client =3D v4l2_get_subdevdata(&ov05c10->sd);
> > +     const struct ov05c10_mode *mode =3D &supported_mode;
> > +     const struct ov05c10_reg_list *reg_list;
> > +     int ret =3D 0;
> > +
> > +     /* Apply default values of current mode */
> > +     reg_list =3D &mode->reg_list;
> > +     cci_multi_reg_write(ov05c10->regmap, reg_list->regs,
> > +                         reg_list->num_of_regs, &ret);
> > +     if (ret) {
> > +             dev_err(&client->dev, "fail to set mode, ret: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     /* Apply customized values from user */
> > +     ret =3D  __v4l2_ctrl_handler_setup(ov05c10->sd.ctrl_handler);
> > +     if (ret) {
> > +             dev_err(&client->dev, "failed to setup v4l2 handler %d\n"=
, ret);
> > +             return ret;
> > +     }
> > +
> > +     cci_multi_reg_write(ov05c10->regmap, mode_OV05C10_stream_on_regs,
> > +                         ARRAY_SIZE(mode_OV05C10_stream_on_regs), &ret=
);
> > +     if (ret)
> > +             dev_err(&client->dev, "fail to start the streaming\n");
> > +
> > +     return ret;
> > +}
> > +
> > +static int ov05c10_stop_streaming(struct ov05c10 *ov05c10)
> > +{
> > +     struct i2c_client *client =3D v4l2_get_subdevdata(&ov05c10->sd);
> > +     int ret =3D 0;
> > +
> > +     cci_multi_reg_write(ov05c10->regmap, mode_OV05C10_stream_off_regs,
> > +                         ARRAY_SIZE(mode_OV05C10_stream_off_regs), &re=
t);
> > +     if (ret)
> > +             dev_err(&client->dev, "fail to stop the streaming\n");
> > +
> > +     return ret;
> > +}
> > +
> > +static void ov05c10_sensor_power_set(struct ov05c10 *ov05c10, bool on)
> > +{
> > +     if (on) {
> > +             gpiod_set_value(ov05c10->enable_gpio, 0);
> > +             usleep_range(10, 20);
> > +
> > +             gpiod_set_value(ov05c10->enable_gpio, 1);
> > +             usleep_range(1000, 2000);
>=20
> According to the datasheet, ov05c10 needs at least 8 ms to work after=20
> its XSHUTDN pin pulled to high. 1 ms maybe too quick, did you tested it? =

> Or the enable_gpio is actually not the XSHUTDN pin?
>=20
> On Intel platforms, if the sensor driver controls the module power,=20
> ususally it requires GPIO "reset", regulator "avdd" and clk "img_clk"=20
> assigned by kernel driver intel_skl_int3472_discrete. I'm not sure=20
> whether any devices on market using this power control solution, but if=20
> any, missing those resources will stop them from powering-up cameras.
>=20
> > +     } else {
> > +             gpiod_set_value(ov05c10->enable_gpio, 0);
> > +             usleep_range(10, 20);
> > +     }
> > +}
> > +
> > +static int ov05c10_enable_streams(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_state *state, u32 pa=
d,
> > +                               u64 streams_mask)
> > +{
> > +     struct i2c_client *client =3D v4l2_get_subdevdata(sd);
> > +     struct ov05c10 *ov05c10 =3D to_ov05c10(sd);
> > +     int ret =3D 0;
> > +
> > +     ret =3D pm_runtime_resume_and_get(&client->dev);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ov05c10->cur_page =3D -1;
> > +
> > +     ret =3D ov05c10_start_streaming(ov05c10);
> > +     if (ret)
> > +             goto err_rpm_put;
> > +
> > +     return 0;
> > +
> > +err_rpm_put:
> > +     pm_runtime_put(&client->dev);
> > +     return ret;
> > +}
> > +
> > +static int ov05c10_disable_streams(struct v4l2_subdev *sd,
> > +                                struct v4l2_subdev_state *state, u32 p=
ad,
> > +                                u64 streams_mask)
> > +{
> > +     struct i2c_client *client =3D v4l2_get_subdevdata(sd);
> > +     struct ov05c10 *ov05c10 =3D to_ov05c10(sd);
> > +
> > +     ov05c10_stop_streaming(ov05c10);
> > +     pm_runtime_put(&client->dev);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_video_ops ov05c10_video_ops =3D {
> > +     .s_stream =3D v4l2_subdev_s_stream_helper,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops ov05c10_pad_ops =3D {
> > +     .enum_mbus_code =3D ov05c10_enum_mbus_code,
> > +     .get_fmt =3D v4l2_subdev_get_fmt,
> > +     .set_fmt =3D ov05c10_set_pad_format,
> > +     .enum_frame_size =3D ov05c10_enum_frame_size,
> > +     .enable_streams =3D ov05c10_enable_streams,
> > +     .disable_streams =3D ov05c10_disable_streams,
> > +};
> > +
> > +static const struct v4l2_subdev_ops ov05c10_subdev_ops =3D {
> > +     .video =3D &ov05c10_video_ops,
> > +     .pad =3D &ov05c10_pad_ops,
> > +};
> > +
> > +static const struct media_entity_operations ov05c10_subdev_entity_ops =
=3D {
> > +     .link_validate =3D v4l2_subdev_link_validate,
> > +};
> > +
> > +static const struct v4l2_subdev_internal_ops ov05c10_internal_ops =3D {
> > +     .init_state =3D ov05c10_init_state,
> > +};
> > +
> > +static int ov05c10_init_controls(struct ov05c10 *ov05c10)
> > +{
> > +     struct i2c_client *client =3D v4l2_get_subdevdata(&ov05c10->sd);
> > +     const struct ov05c10_mode *mode =3D &supported_mode;
> > +     struct v4l2_fwnode_device_properties props;
> > +     struct v4l2_ctrl_handler *ctrl_hdlr;
> > +     s64 pixel_rate_max;
> > +     s64 exposure_max;
> > +     s64 vblank_def;
> > +     s64 vblank_min;
> > +     u32 max_items;
> > +     s64 hblank;
> > +     int ret;
> > +
> > +     ret =3D v4l2_ctrl_handler_init(&ov05c10->ctrl_handler, 10);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ctrl_hdlr =3D &ov05c10->ctrl_handler;
> > +
> > +     max_items =3D ARRAY_SIZE(ov05c10_link_freq_menu_items) - 1;
> > +     ov05c10->link_freq =3D
> > +             v4l2_ctrl_new_int_menu(ctrl_hdlr,
> > +                                    NULL,
> > +                                    V4L2_CID_LINK_FREQ,
> > +                                    max_items,
> > +                                    0,
> > +                                    ov05c10_link_freq_menu_items);
> > +     if (ov05c10->link_freq)
> > +             ov05c10->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +     pixel_rate_max =3D
> > +             link_freq_to_pixel_rate(ov05c10_link_freq_menu_items[0],
> > +                                     supported_mode.lanes);
> > +     ov05c10->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, NULL,
> > +                                             V4L2_CID_PIXEL_RATE,
> > +                                             0, pixel_rate_max,
> > +                                             1, pixel_rate_max);
> > +
> > +     vblank_def =3D mode->vts_def - mode->height;
> > +     vblank_min =3D mode->vts_min - mode->height;
> > +     ov05c10->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_op=
s,
> > +                                         V4L2_CID_VBLANK,
> > +                                         vblank_min,
> > +                                         OV05C10_VTS_MAX - mode->heigh=
t,
> > +                                         1, vblank_def);
> > +
> > +     hblank =3D (mode->hts > mode->width) ? (mode->hts - mode->width) =
: 0;
>=20
> Here your hts uses 640 but width is 2888, which means hblank is set to 0 =

> here. This is wrong, please fix your configuration.
>=20
> > +     ov05c10->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, NULL,
> > +                                         V4L2_CID_HBLANK,
> > +                                         hblank, hblank, 1, hblank);
> > +     if (ov05c10->hblank)
> > +             ov05c10->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +     exposure_max =3D mode->vts_def - OV05C10_EXPOSURE_MAX_MARGIN;
> > +     ov05c10->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_=
ops,
> > +                                           V4L2_CID_EXPOSURE,
> > +                                           OV05C10_EXPOSURE_MIN,
> > +                                           exposure_max,
> > +                                           OV05C10_EXPOSURE_STEP,
> > +                                           exposure_max);
> > +
> > +     v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_ops, V4L2_CID_ANALOGUE=
_GAIN,
> > +                       OV05C10_ANA_GAIN_MIN, OV05C10_ANA_GAIN_MAX,
> > +                       OV05C10_ANA_GAIN_STEP, OV05C10_ANA_GAIN_DEFAULT=
);
> > +
> > +     v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_ops, V4L2_CID_DIGITAL_=
GAIN,
> > +                       OV05C10_DGTL_GAIN_MIN, OV05C10_DGTL_GAIN_MAX,
> > +                       OV05C10_DGTL_GAIN_STEP, OV05C10_DGTL_GAIN_DEFAU=
LT);
> > +
> > +     v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov05c10_ctrl_ops,
> > +                                  V4L2_CID_TEST_PATTERN,
> > +                                  ARRAY_SIZE(ov05c10_test_pattern_menu=
) - 1,
> > +                                  0, 0, ov05c10_test_pattern_menu);
> > +
> > +     if (ctrl_hdlr->error) {
> > +             ret =3D ctrl_hdlr->error;
> > +             dev_err(&client->dev, "V4L2 control init failed (%d)\n", =
ret);
> > +             goto err_hdl_free;
> > +     }
> > +
> > +     ret =3D v4l2_fwnode_device_parse(&client->dev, &props);
> > +     if (ret)
> > +             goto err_hdl_free;
> > +
> > +     ret =3D v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov05c10_ctrl_=
ops,
> > +                                           &props);
> > +     if (ret)
> > +             goto err_hdl_free;
> > +
> > +     ov05c10->sd.ctrl_handler =3D ctrl_hdlr;
> > +
> > +     return 0;
> > +
> > +err_hdl_free:
> > +     v4l2_ctrl_handler_free(ctrl_hdlr);
> > +
> > +     return ret;
> > +}
> > +
> > +static int ov05c10_parse_endpoint(struct device *dev,
> > +                               struct fwnode_handle *fwnode)
> > +{
> > +     struct v4l2_fwnode_endpoint bus_cfg =3D {
> > +             .bus_type =3D V4L2_MBUS_CSI2_DPHY
> > +     };
> > +     struct fwnode_handle *ep;
> > +     unsigned long bitmap;
> > +     int ret;
> > +
> > +     ep =3D fwnode_graph_get_next_endpoint(fwnode, NULL);
> > +     if (!ep) {
> > +             dev_err(dev, "Failed to get next endpoint\n");
> > +             return -ENXIO;
> > +     }
> > +
> > +     ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> > +     fwnode_handle_put(ep);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (bus_cfg.bus.mipi_csi2.num_data_lanes !=3D supported_mode.lane=
s) {
> > +             dev_err(dev,
> > +                     "number of CSI2 data lanes %d is not supported\n",
> > +                     bus_cfg.bus.mipi_csi2.num_data_lanes);
> > +             ret =3D -EINVAL;
> > +             goto err_endpoint_free;
> > +     }
> > +
> > +     ret =3D v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
> > +                                    bus_cfg.nr_of_link_frequencies,
> > +                                    ov05c10_link_frequencies,
> > +                                    ARRAY_SIZE(ov05c10_link_frequencie=
s),
> > +                                    &bitmap);
> > +     if (ret)
> > +             dev_err(dev, "v4l2_link_freq_to_bitmap fail with %d\n", r=
et);
> > +err_endpoint_free:
> > +     v4l2_fwnode_endpoint_free(&bus_cfg);
> > +
> > +     return ret;
> > +}
> > +
> > +static int ov05c10_probe(struct i2c_client *client)
> > +{
> > +     struct ov05c10 *ov05c10;
> > +     u32 clkfreq;
> > +     int ret;
> > +
> > +     ov05c10 =3D devm_kzalloc(&client->dev, sizeof(*ov05c10), GFP_KERN=
EL);
> > +     if (!ov05c10)
> > +             return -ENOMEM;
> > +
> > +     struct fwnode_handle *fwnode =3D dev_fwnode(&client->dev);
> > +
> > +     ret =3D fwnode_property_read_u32(fwnode, "clock-frequency", &clkf=
req);
>=20
> Maybe it's better to separate this part fwnode and GPIO code into a=20
> standalone function?
>=20
> > +     if (ret)
> > +             return  dev_err_probe(&client->dev, -EINVAL,
> > +                                   "fail to get clock freq\n");
> > +     if (clkfreq !=3D OV05C10_REF_CLK)
> > +             return dev_err_probe(&client->dev, -EINVAL,
> > +                                  "fail invalid clock freq %u, %lu exp=
ected\n",
> > +                                  clkfreq, OV05C10_REF_CLK);
> > +
> > +     ret =3D ov05c10_parse_endpoint(&client->dev, fwnode);
> > +     if (ret)
> > +             return dev_err_probe(&client->dev, -EINVAL,
> > +                                  "fail to parse endpoint\n");
> > +
> > +     ov05c10->enable_gpio =3D devm_gpiod_get(&client->dev, "enable",
> > +                                           GPIOD_OUT_LOW);
> > +     if (IS_ERR(ov05c10->enable_gpio))
> > +             return dev_err_probe(&client->dev,
> > +                                  PTR_ERR(ov05c10->enable_gpio),
> > +                                  "fail to get enable gpio\n");
> > +
> > +     v4l2_i2c_subdev_init(&ov05c10->sd, client, &ov05c10_subdev_ops);
> > +
> > +     ov05c10->regmap =3D devm_cci_regmap_init_i2c(client, 8);
> > +     if (IS_ERR(ov05c10->regmap))
> > +             return dev_err_probe(&client->dev, PTR_ERR(ov05c10->regma=
p),
> > +                                  "fail to init cci\n");
> > +
> > +     ov05c10->cur_page =3D -1;
> > +
> > +     ret =3D ov05c10_init_controls(ov05c10);
> > +     if (ret)
> > +             return dev_err_probe(&client->dev, ret, "fail to init ctl=
\n");
> > +
> > +     ov05c10->sd.internal_ops =3D &ov05c10_internal_ops;
> > +     ov05c10->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +     ov05c10->sd.entity.ops =3D &ov05c10_subdev_entity_ops;
> > +     ov05c10->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +     ov05c10->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> > +
> > +     ret =3D media_entity_pads_init(&ov05c10->sd.entity, NUM_OF_PADS,
> > +                                  &ov05c10->pad);
> > +     if (ret)
> > +             goto err_hdl_free;
> > +
> > +     ret =3D v4l2_subdev_init_finalize(&ov05c10->sd);
> > +     if (ret < 0)
> > +             goto err_media_entity_cleanup;
> > +
> > +     ret =3D v4l2_async_register_subdev_sensor(&ov05c10->sd);
> > +     if (ret)
> > +             goto err_media_entity_cleanup;
> > +
> > +     pm_runtime_set_active(&client->dev);
> > +     pm_runtime_enable(&client->dev);
> > +     pm_runtime_idle(&client->dev);
> > +     pm_runtime_set_autosuspend_delay(&client->dev, 1000);
> > +     pm_runtime_use_autosuspend(&client->dev);
> > +     return 0;
> > +
> > +err_media_entity_cleanup:
> > +     media_entity_cleanup(&ov05c10->sd.entity);
> > +
> > +err_hdl_free:
> > +     v4l2_ctrl_handler_free(ov05c10->sd.ctrl_handler);
> > +
> > +     return ret;
> > +}
> > +
> > +static void ov05c10_remove(struct i2c_client *client)
> > +{
> > +     struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +     struct ov05c10 *ov05c10 =3D to_ov05c10(sd);
> > +
> > +     v4l2_async_unregister_subdev(sd);
> > +     media_entity_cleanup(&sd->entity);
> > +     v4l2_ctrl_handler_free(ov05c10->sd.ctrl_handler);
> > +
> > +     pm_runtime_disable(&client->dev);
> > +     pm_runtime_set_suspended(&client->dev);
> > +}
> > +
> > +static int ov05c10_runtime_resume(struct device *dev)
> > +{
> > +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +     struct ov05c10 *ov05c10 =3D to_ov05c10(sd);
> > +
> > +     ov05c10_sensor_power_set(ov05c10, true);
> > +     return 0;
> > +}
> > +
> > +static int ov05c10_runtime_suspend(struct device *dev)
> > +{
> > +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +     struct ov05c10 *ov05c10 =3D to_ov05c10(sd);
> > +
> > +     ov05c10_sensor_power_set(ov05c10, false);
> > +     return 0;
> > +}
> > +
> > +static DEFINE_RUNTIME_DEV_PM_OPS(ov05c10_pm_ops, ov05c10_runtime_suspe=
nd,
> > +                              ov05c10_runtime_resume, NULL);
> > +
> > +static const struct i2c_device_id ov05c10_i2c_ids[] =3D {
> > +     {"ov05c10", 0 },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, ov05c10_i2c_ids);
> > +
> > +static struct i2c_driver ov05c10_i2c_driver =3D {
> > +     .driver =3D {
> > +             .name =3D DRV_NAME,
> > +             .pm =3D pm_ptr(&ov05c10_pm_ops),
> > +     },
> > +     .id_table =3D ov05c10_i2c_ids,
> > +     .probe =3D ov05c10_probe,
> > +     .remove =3D ov05c10_remove,
> > +};
> > +
> > +module_i2c_driver(ov05c10_i2c_driver);
> > +
> > +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
> > +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
> > +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
> > +MODULE_DESCRIPTION("OmniVision OV05C1010 sensor driver");
>=20
> OV05C10
>=20
> > +MODULE_LICENSE("GPL");
>=20
>=20
> Hi Sakari,
>=20
> Seems there are already several camera sensors using page-based=20
> registers. Is it a good idea to add page support in CCI interface?

I think that's a good idea!

Some how maintaining the generality to keep it easy to access registers
would be nice. Perhaps the page could be embedded in the CCI_REG()
macros too to support changing the active page when a write accesses a
different one?

--
Kieran


>=20
>=20
> Best Regards,
> Hao Yao
>

