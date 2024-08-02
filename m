Return-Path: <linux-media+bounces-15732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFED294639D
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2024 21:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6209D282E6A
	for <lists+linux-media@lfdr.de>; Fri,  2 Aug 2024 19:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6141547CC;
	Fri,  2 Aug 2024 19:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AZOXAB31"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662D84501F
	for <linux-media@vger.kernel.org>; Fri,  2 Aug 2024 19:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722626048; cv=none; b=kG6UOga5R50tM5BWvyYoDmHCM5fHT+BqqXauRAOa7jtw1jl5NDfea4WHxRXN2bz6/DzfNNyRhIj6H3/ARMw1aLsPVB4RiJiGuhKaW19OohK6JU4UdBJ+g4Jr4O8VmbhGoXhBWtEEKpF7iVd4e1DD/t8MRmiBMUzyynio4K2SrcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722626048; c=relaxed/simple;
	bh=W5zJ0b3bV9O3oHP1a2wIeNfhgFXwyK9WJFyITjix1pE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNZNmvBlZWp4V++DZ8skSJuI31U149wsS93OzCWjSqZPbmmJ10MukstcjVHSwZ5aWJpxvPasEv20NF+MKkqQucY5EJNO8RRf7POMc3RogR5wzelbKtmTi/7mA7nkAdJz5mUNKLupqDDqt3vaOS0C7k5LHO5+M8SfMWK7s5Lm/yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AZOXAB31; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD49D524;
	Fri,  2 Aug 2024 21:13:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722625994;
	bh=W5zJ0b3bV9O3oHP1a2wIeNfhgFXwyK9WJFyITjix1pE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AZOXAB315TYjXeIuIcSrzUVCKdgBZ85ap5PqX6mqWi2R5vUbETph/82SgcWofNOAQ
	 rqtiMXR7NthnwIJ3Ce6ApqWAeSe80X+EmdtoXmGDO1WHXvqXJGVTSWDwvx3t1cScgZ
	 80tbt85qmctlcOYHi9THl7RTu1VTm97+xUaN1N9g=
Date: Fri, 2 Aug 2024 22:13:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
	"bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
	"Li, Daxing" <daxing.li@intel.com>, "Yao, Hao" <hao.yao@intel.com>
Subject: Re: [PATCH v3] media: i2c: Add ar0234 camera sensor driver
Message-ID: <20240802191340.GC21917@pendragon.ideasonboard.com>
References: <20240614080941.3938212-1-dongcheng.yan@intel.com>
 <20240614142432.GA5468@pendragon.ideasonboard.com>
 <CY5PR11MB64156F993A9718E39D8C04EEF2D32@CY5PR11MB6415.namprd11.prod.outlook.com>
 <20240701135704.GE15391@pendragon.ideasonboard.com>
 <CAPY8ntD4PCS0mpJvRDgO42x4rgN_ghKUFfkEY_kMNRN1tbQ=tg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntD4PCS0mpJvRDgO42x4rgN_ghKUFfkEY_kMNRN1tbQ=tg@mail.gmail.com>

Hi Dave,

On Mon, Jul 01, 2024 at 03:18:34PM +0100, Dave Stevenson wrote:
> On Mon, 1 Jul 2024 at 14:57, Laurent Pinchart wrote:
> > On Mon, Jul 01, 2024 at 07:53:28AM +0000, Yan, Dongcheng wrote:
> > > Hi Larent,
> > >
> > > Sorry for that I didn't check my sent items in time, a bug of outlook
> > > causes all commets after first quote to be lost. I have edited again
> > > and sorry for the delay.
> >
> > No worries. I'm sorry that you have to use outlook :-)
> >
> > > Thanks for your review and meaningful suggestions. I have contacted
> > > the vendor and optimized the code related to the register settings.
> > > The response is as follows:
> > >
> > > On Friday, June 14, 2024 10:25 PM, Laurent Pinchart wrote:
> > > >
> > > > Hi Dongcheng,
> > > >
> > > > Thank you for the patch.
> > > >
> > > > On Fri, Jun 14, 2024 at 04:09:41PM +0800, Dongcheng Yan wrote:
> > > > > The driver is implemented with V4L2 framework, and supports following
> > > > > features:
> > > > >
> > > > >     - manual exposure and analog/digital gain control
> > > > >     - vblank/hblank control
> > > > >     - vflip/hflip control
> > > > >     - runtime PM support
> > > > >     - 1280x960 at 30FPS
> > > > >
> > > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > > Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
> > > > > ---
> > > > > v2 --> v3:
> > > > >     - remove unused reg setting
> > > > >     - add vflip/hflip control
> > > > >     - add external clock check & lanes check
> > > > >
> > > > > ---
> > > > >  drivers/media/i2c/Kconfig  |   11 +
> > > > >  drivers/media/i2c/Makefile |    1 +
> > > > >  drivers/media/i2c/ar0234.c | 1077 ++++++++++++++++++++++++++++++++++++
> > > > >  3 files changed, 1089 insertions(+)
> > > > >  create mode 100644 drivers/media/i2c/ar0234.c
> > > > >
> > > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > > index c6d3ee472d81..7108d194c975 100644
> > > > > --- a/drivers/media/i2c/Kconfig
> > > > > +++ b/drivers/media/i2c/Kconfig
> > > > > @@ -51,6 +51,17 @@ config VIDEO_ALVIUM_CSI2
> > > > >     To compile this driver as a module, choose M here: the
> > > > >     module will be called alvium-csi2.
> > > > >
> > > > > +config VIDEO_AR0234
> > > > > +        tristate "ON Semiconductor AR0234 sensor support"
> > > > > +        depends on ACPI || COMPILE_TEST
> > > > > +        select V4L2_CCI_I2C
> > > > > +        help
> > > > > +          This is a Video4Linux2 sensor driver for the ON Semiconductor
> > > > > +          AR0234 camera.
> > > > > +
> > > > > +          To compile this driver as a module, choose M here: the
> > > > > +          module will be called ar0234.
> > > > > +
> > > > >  config VIDEO_AR0521
> > > > >   tristate "ON Semiconductor AR0521 sensor support"
> > > > >   help
> > > > > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > > > > index dfbe6448b549..57b4f62106d9 100644
> > > > > --- a/drivers/media/i2c/Makefile
> > > > > +++ b/drivers/media/i2c/Makefile
> > > > > @@ -19,6 +19,7 @@ obj-$(CONFIG_VIDEO_AK7375) += ak7375.o
> > > > >  obj-$(CONFIG_VIDEO_AK881X) += ak881x.o
> > > > >  obj-$(CONFIG_VIDEO_ALVIUM_CSI2) += alvium-csi2.o
> > > > >  obj-$(CONFIG_VIDEO_APTINA_PLL) += aptina-pll.o
> > > > > +obj-$(CONFIG_VIDEO_AR0234) += ar0234.o
> > > > >  obj-$(CONFIG_VIDEO_AR0521) += ar0521.o
> > > > >  obj-$(CONFIG_VIDEO_BT819) += bt819.o
> > > > >  obj-$(CONFIG_VIDEO_BT856) += bt856.o
> > > > > diff --git a/drivers/media/i2c/ar0234.c b/drivers/media/i2c/ar0234.c
> > > > > new file mode 100644 index 000000000000..80fe5ffd1c64
> > > > > --- /dev/null
> > > > > +++ b/drivers/media/i2c/ar0234.c
> > > > > @@ -0,0 +1,1077 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > +// Copyright (c) 2019 - 2024 Intel Corporation.
> > > > > +
> > > > > +#include <linux/acpi.h>
> > > > > +#include <linux/clk.h>
> > > > > +#include <linux/delay.h>
> > > > > +#include <linux/i2c.h>
> > > > > +#include <linux/module.h>
> > > > > +#include <linux/pm_runtime.h>
> > > > > +#include <asm/unaligned.h>
> > > > > +
> > > > > +#include <media/v4l2-cci.h>
> > > > > +#include <media/v4l2-ctrls.h>
> > > > > +#include <media/v4l2-event.h>
> > > > > +#include <media/v4l2-device.h>
> > > > > +#include <media/v4l2-fwnode.h>
> > > > > +
> > > > > +/* Chip ID */
> > > > > +#define AR0234_REG_CHIP_ID               CCI_REG16(0x3000)
> > > > > +#define AR0234_CHIP_ID                   0x0a56
> > > > > +
> > > > > +#define AR0234_REG_MODE_SELECT           CCI_REG16(0x301a)
> > > > > +#define AR0234_REG_VTS                   CCI_REG16(0x300a)
> > > > > +#define AR0234_REG_EXPOSURE              CCI_REG16(0x3012)
> > > > > +#define AR0234_REG_ANALOG_GAIN           CCI_REG16(0x3060)
> > > > > +#define AR0234_REG_GLOBAL_GAIN           CCI_REG16(0x305e)
> > > > > +#define AR0234_REG_ORIENTATION           CCI_REG16(0x3040)
> > > > > +#define AR0234_REG_TEST_PATTERN          CCI_REG16(0x0600)
> > > > > +
> > > > > +#define AR0234_EXPOSURE_MIN              0
> > > > > +#define AR0234_EXPOSURE_MAX_MARGIN       80
> > > > > +#define AR0234_EXPOSURE_STEP             1
> > > > > +
> > > > > +#define AR0234_ANALOG_GAIN_MIN           0
> > > > > +#define AR0234_ANALOG_GAIN_MAX           0x7f
> > > > > +#define AR0234_ANALOG_GAIN_STEP          1
> > > > > +#define AR0234_ANALOG_GAIN_DEFAULT       0xe
> > > > > +
> > > > > +#define AR0234_GLOBAL_GAIN_MIN           0
> > > > > +#define AR0234_GLOBAL_GAIN_MAX           0x7ff
> > > > > +#define AR0234_GLOBAL_GAIN_STEP          1
> > > > > +#define AR0234_GLOBAL_GAIN_DEFAULT       0x80
> > > > > +
> > > > > +#define AR0234_NATIVE_WIDTH              1920
> > > > > +#define AR0234_NATIVE_HEIGHT             1080
> > > > > +#define AR0234_COMMON_WIDTH              1280
> > > > > +#define AR0234_COMMON_HEIGHT             960
> > > > > +#define AR0234_PIXEL_ARRAY_LEFT          320
> > > > > +#define AR0234_PIXEL_ARRAY_TOP           60
> > > > > +#define AR0234_ORIENTATION_HFLIP BIT(14)
> > > > > +#define AR0234_ORIENTATION_VFLIP BIT(15)
> > > > > +
> > > > > +#define AR0234_VTS_DEFAULT               0x04c4
> > > > > +#define AR0234_VTS_MAX                   0xffff
> > > > > +#define AR0234_HTS_DEFAULT               0x04c4
> > > > > +#define AR0234_PPL_DEFAULT               3498
> > > > > +
> > > > > +#define AR0234_MODE_RESET                0x00d9
> > > > > +#define AR0234_MODE_STANDBY              0x2058
> > > > > +#define AR0234_MODE_STREAMING            0x205c
> > > > > +
> > > > > +#define AR0234_PIXEL_RATE                128000000ULL
> > > > > +#define AR0234_XCLK_FREQ         19200000ULL
> > > > > +
> > > > > +#define AR0234_TEST_PATTERN_DISABLE      0
> > > > > +#define AR0234_TEST_PATTERN_SOLID_COLOR  1
> > > > > +#define AR0234_TEST_PATTERN_COLOR_BARS   2
> > > > > +#define AR0234_TEST_PATTERN_GREY_COLOR   3
> > > > > +#define AR0234_TEST_PATTERN_WALKING      256
> > > > > +
> > > > > +#define to_ar0234(_sd)   container_of(_sd, struct ar0234, sd)
> > > > > +
> > > > > +struct ar0234_reg_list {
> > > > > + u32 num_of_regs;
> > > > > + const struct cci_reg_sequence *regs; };
> > > > > +
> > > > > +struct ar0234_mode {
> > > > > + u32 width;
> > > > > + u32 height;
> > > > > + u32 hts;
> > > > > + u32 vts_def;
> > > > > + u32 code;
> > > > > + /* Sensor register settings for this mode */
> > > > > + const struct ar0234_reg_list reg_list; };
> > > > > +
> > > > > +static const struct cci_reg_sequence mode_1280x960_10bit_2lane[] = {
> > > > > + { CCI_REG16(0x3f4c), 0x121f },
> > > > > + { CCI_REG16(0x3f4e), 0x121f },
> > > > > + { CCI_REG16(0x3f50), 0x0b81 },
> > > > > + { CCI_REG16(0x31e0), 0x0003 },
> > > > > + { CCI_REG16(0x30b0), 0x0028 },
> > > > > + /* R0x3088 specify the sequencer RAM access address. */
> > > > > + { CCI_REG16(0x3088), 0x8000 },
> > > > > + /* R0x3086 write the sequencer RAM. */
> > > > > + { CCI_REG16(0x3086), 0xc1ae },
> > > > > + { CCI_REG16(0x3086), 0x327f },
> > > > > + { CCI_REG16(0x3086), 0x5780 },
> > > > > + { CCI_REG16(0x3086), 0x272f },
> > > > > + { CCI_REG16(0x3086), 0x7416 },
> > > >
> > > > Storing the sequencer data in this table wastes lots of memory and CPU cycles.
> > > > Please move the data out to a
> > > >
> > > > static const u16 ar0234_sequencer[] = {
> > > >     0xc1ae, 0x327f, 0x5780, 0x272f, 0x7416, 0x7e13, 0x8000, 0x307e,
> > > >     ...
> > > > };
> > > >
> > > > table, and program it with
> > > >
> > > >     /* Program the sequencer. */
> > > >     cci_write(ar0234->regmap, CCI_REG16(0x3088), 0x8000, &ret);
> > > >     for (i = 0; i < ARRAY_SIZE(ar0234_sequencer); ++i)
> > > >             cci_write(ar0234->regmap, CCI_REG16(0x3086),
> > > >                       ar0234_sequencer[i], &ret);
> > > >
> > > > And please define macros for the sequencer access registers 0x3086 and
> > > > 0x3088, as well as for the bits of the 0x3088 register.
> > > >
> > > > [snip]
> > >
> > > Through communication with the vendor, we learned that this is a patch
> > > (writing to the sequencer) used to optimize the sensor's performance.
> > > It is not critical for the driver's normal operation. Therefore, I
> > > will remove this patch directly.
> >
> > I'm fine dropping it or keeping it, it's up to you. If it improves the
> > image quality I think it's useful. my only concern is that storing the
> > register address in every entry wastes space. With an optimized version
> > that only stores the data, I'm fine having the data in the driver.
> >
> > > > > + { CCI_REG16(0x302a), 0x0005 },
> > > > > + { CCI_REG16(0x302c), 0x0001 },
> > > > > + { CCI_REG16(0x302e), 0x0003 },
> > > > > + { CCI_REG16(0x3030), 0x0032 },
> > > > > + { CCI_REG16(0x3036), 0x000a },
> > > > > + { CCI_REG16(0x3038), 0x0001 },
> > > > > + { CCI_REG16(0x30b0), 0x0028 },
> > > > > + { CCI_REG16(0x31b0), 0x0082 },
> > > > > + { CCI_REG16(0x31b2), 0x005c },
> > > > > + { CCI_REG16(0x31b4), 0x5248 },
> > > > > + { CCI_REG16(0x31b6), 0x3257 },
> > > > > + { CCI_REG16(0x31b8), 0x904b },
> > > > > + { CCI_REG16(0x31ba), 0x030b },
> > > > > + { CCI_REG16(0x31bc), 0x8e09 },
> > > > > + { CCI_REG16(0x3354), 0x002b },
> > > > > + { CCI_REG16(0x31d0), 0x0000 },
> > > > > + { CCI_REG16(0x31ae), 0x0204 },
> > > > > + { CCI_REG16(0x3002), 0x0080 },
> > > > > + { CCI_REG16(0x3004), 0x0148 },
> > > > > + { CCI_REG16(0x3006), 0x043f },
> > > > > + { CCI_REG16(0x3008), 0x0647 },
> > > > > + { CCI_REG16(0x3064), 0x1802 },
> > > > > + { CCI_REG16(0x300a), 0x04c4 },
> > > > > + { CCI_REG16(0x300c), 0x04c4 },
> > > > > + { CCI_REG16(0x30a2), 0x0001 },
> > > > > + { CCI_REG16(0x30a6), 0x0001 },
> > > > > + { CCI_REG16(0x3012), 0x010c },
> > > > > + { CCI_REG16(0x3786), 0x0006 },
> > > > > + { CCI_REG16(0x31ae), 0x0202 },
> > > > > + { CCI_REG16(0x3088), 0x8050 },
> > > > > + { CCI_REG16(0x3086), 0x9237 },
> > > >
> > > > This can stay here if it needs to be programmed separately from the rest of the
> > > > sequencer data, but please use macros to replace the hardcoded register
> > > > addresses, and the value of the 0x3088 register.
> > >
> > > I will annotate each of their usages here. These are two recommended
> > > common settings provided by the vendor.
> > >
> > > > > + { CCI_REG16(0x3044), 0x0410 },
> > > > > + { CCI_REG16(0x3094), 0x03d4 },
> > > > > + { CCI_REG16(0x3096), 0x0280 },
> > > > > + { CCI_REG16(0x30ba), 0x7606 },
> > > > > + { CCI_REG16(0x30b0), 0x0028 },
> > > > > + { CCI_REG16(0x30ba), 0x7600 },
> > > > > + { CCI_REG16(0x30fe), 0x002a },
> > > > > + { CCI_REG16(0x31de), 0x0410 },
> > > > > + { CCI_REG16(0x3ed6), 0x1435 },
> > > > > + { CCI_REG16(0x3ed8), 0x9865 },
> > > > > + { CCI_REG16(0x3eda), 0x7698 },
> > > > > + { CCI_REG16(0x3edc), 0x99ff },
> > > > > + { CCI_REG16(0x3ee2), 0xbb88 },
> > > > > + { CCI_REG16(0x3ee4), 0x8836 },
> > > > > + { CCI_REG16(0x3ef0), 0x1cf0 },
> > > > > + { CCI_REG16(0x3ef2), 0x0000 },
> > > > > + { CCI_REG16(0x3ef8), 0x6166 },
> > > > > + { CCI_REG16(0x3efa), 0x3333 },
> > > > > + { CCI_REG16(0x3efc), 0x6634 },
> > > > > + { CCI_REG16(0x3088), 0x81ba },
> > > > > + { CCI_REG16(0x3086), 0x3d02 },
> > > >
> > > > Same here.
> > > >
> > > > > + { CCI_REG16(0x3276), 0x05dc },
> > > > > + { CCI_REG16(0x3f00), 0x9d05 },
> > > > > + { CCI_REG16(0x3ed2), 0xfa86 },
> > > > > + { CCI_REG16(0x3eee), 0xa4fe },
> > > > > + { CCI_REG16(0x3ecc), 0x6e42 },
> > > > > + { CCI_REG16(0x3ecc), 0x0e42 },
> > > > > + { CCI_REG16(0x3eec), 0x0c0c },
> > > > > + { CCI_REG16(0x3ee8), 0xaae4 },
> > > > > + { CCI_REG16(0x3ee6), 0x3363 },
> > > > > + { CCI_REG16(0x3ee6), 0x3363 },
> > > > > + { CCI_REG16(0x3ee8), 0xaae4 },
> > > > > + { CCI_REG16(0x3ee8), 0xaae4 },
> > > > > + { CCI_REG16(0x3180), 0xc24f },
> > > > > + { CCI_REG16(0x3102), 0x5000 },
> > > > > + { CCI_REG16(0x3060), 0x000d },
> > > > > + { CCI_REG16(0x3ed0), 0xff44 },
> > > > > + { CCI_REG16(0x3ed2), 0xaa86 },
> > > > > + { CCI_REG16(0x3ed4), 0x031f },
> > > > > + { CCI_REG16(0x3eee), 0xa4aa },
> > > >
> > > > Among all the registers above, at least the following need a macro for the
> > > > register name and register bits:
> > > >
> > > > 0x3002, 0x3004, 0x3006, 0x3008, 0x300a, 0x300c, 0x3012, 0x302a, 0x302c,
> > > > 0x302e, 0x3030, 0x3036, 0x3038, 0x3060, 0x3064, 0x30a2, 0x30a6, 0x30b0,
> > > > 0x30fe, 0x3102, 0x3180, 0x31ae, 0x31b0, 0x31b2, 0x31b4, 0x31b6, 0x31b8,
> > > > 0x31ba, 0x31bc, 0x31d0, 0x31e0, 0x3354,
> > > > 0x3786
> > > >
> > > > Some of them should also be handled programmatically, not hardcoded.
> > >
> > > Thanks for your comments, I replace all with macros now.
> > >
> > > > Ideally, the following registers should also be documented with macros:
> > > >
> > > > 0x3044, 0x3094, 0x3096, 0x30ba, 0x31de, 0x3276
> > >
> > > Most of the registers you listed cannot be found in the spec, and they
> > > work together within the recommended common settings provided by the
> > > vendor. Because the functions of these registers are not singular,
> > > defining macros not specified in the spec can cause misunderstandings.
> > > I add necessary comments to make code more readable.
> >
> > OK I'm fine with that.
> >
> > > > 0x30ba, in particular, varies depending on the analog gain and pixel
> > > > clock, so it needs to be handled programmatically.
> > >
> > > 0x30BA is independent of analog gain and pixel clock.
> >
> > Doesn't table 26 in the developer guide show otherwise (for bits [2:0]
> > at least) ?
> 
> I'll agree with you, but only if the pixel clock (not rate) is not 90MHz.

Indeed, it's dependent on the pixel clock. I wonder what this register
value controls.

> I haven't read through this version of the patch set to work out what
> the pixel clock is configured as. I'd queried all the clock setup and
> timing values in v2 as they looked odd.
> 
> > > Under the current pixel clock settings, 0x30BA is fixed in spec and
> > > set to 0x7606.
> 
> The bottom 3 bits being fixed at 0x6 is fine if the pixel clock is 45
> or 22.5MHz according to table 26.
> 
> > Right. I've looked at the clock speed, AR0234_XCLK_FREQ is set to 19.2
> > MHz. That's a pretty unusual value.
> 
> Not that unusual.
> If you check the mainline drivers, you'll find imx258, imx319, imx355,
> og01a1b, ov08x40, ov5670, ov5675, ov5693, and a number of others all
> use 19.2MHz clock inputs.

Thanks for pointing it out.

> There's a common element in which company submitted all those drivers....
> 
> > Given that the sensor uses a quite
> > standard PLL model, I think you can use the ccs-pll helper to calculate
> > the PLL parameters dynamically at runtime. See for instance
> > https://lore.kernel.org/linux-media/20240630141802.15830-3-laurent.pinchart@ideasonboard.com/
> > for an example of how to do so, for a sensor that has a very similar (if
> > not identical) PLL topology. Sakari can also help if you have issues
> > with the ccs-pll helper.
> >
> > > It would be better to configure it to the recommended value but not
> > > crucial (the vendor did not provide a clear explanation whether this
> > > is for image quality or performance). handling it should be considered
> > > an optimization patch if using more pxlclk configurations in the
> > > future.
> > >
> > > > > +};
> > > > > +
> > > > > +static const char * const ar0234_test_pattern_menu[] = {
> > > > > + "Disabled",
> > > > > + "Color Bars",
> > > > > + "Solid Color",
> > > > > + "Grey Color Bars",
> > > > > + "Walking 1s",
> > > > > +};
> > > > > +
> > > > > +static const int ar0234_test_pattern_val[] = {
> > > > > + AR0234_TEST_PATTERN_DISABLE,
> > > > > + AR0234_TEST_PATTERN_COLOR_BARS,
> > > > > + AR0234_TEST_PATTERN_SOLID_COLOR,
> > > > > + AR0234_TEST_PATTERN_GREY_COLOR,
> > > > > + AR0234_TEST_PATTERN_WALKING,
> > > > > +};
> > > > > +
> > > > > +static const s64 link_freq_menu_items[] = {
> > > > > + 360000000ULL,
> > > > > +};
> > > > > +
> > > > > +static const struct ar0234_mode supported_modes[] = {
> > > > > + {
> > > > > +         .width = AR0234_COMMON_WIDTH,
> > > > > +         .height = AR0234_COMMON_HEIGHT,
> > > > > +         .hts = AR0234_HTS_DEFAULT,
> > > > > +         .vts_def = AR0234_VTS_DEFAULT,
> > > > > +         .code = MEDIA_BUS_FMT_SGRBG10_1X10,
> > > > > +         .reg_list = {
> > > > > +                 .num_of_regs = ARRAY_SIZE(mode_1280x960_10bit_2lane),
> > > > > +                 .regs = mode_1280x960_10bit_2lane,
> > > > > +         },
> > > > > + },
> > > > > +};
> > > > > +
> > > > > +struct ar0234 {
> > > > > + struct v4l2_subdev sd;
> > > > > + struct media_pad pad;
> > > > > + struct v4l2_ctrl_handler ctrl_handler;
> > > > > +
> > > > > + /* V4L2 Controls */
> > > > > + struct v4l2_ctrl *link_freq;
> > > > > + struct v4l2_ctrl *exposure;
> > > > > + struct v4l2_ctrl *hblank;
> > > > > + struct v4l2_ctrl *vblank;
> > > > > + struct v4l2_ctrl *vflip;
> > > > > + struct v4l2_ctrl *hflip;
> > > > > + struct regmap *regmap;
> > > > > + unsigned long link_freq_bitmap;
> > > > > + const struct ar0234_mode *cur_mode;
> > > > > +};
> > > > > +
> > > > > +static int ar0234_set_ctrl(struct v4l2_ctrl *ctrl) {
> > > > > + struct ar0234 *ar0234 =
> > > > > +         container_of(ctrl->handler, struct ar0234, ctrl_handler);
> > > > > + struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
> > > > > + s64 exposure_max, exposure_def;
> > > > > + struct v4l2_subdev_state *state;
> > > > > + const struct v4l2_mbus_framefmt *format;
> > > > > + int ret;
> > > > > +
> > > > > + state = v4l2_subdev_get_locked_active_state(&ar0234->sd);
> > > > > + format = v4l2_subdev_state_get_format(state, 0);
> > > > > +
> > > > > + /* Propagate change of current control to all related controls */
> > > > > + if (ctrl->id == V4L2_CID_VBLANK) {
> > > > > +         /* Update max exposure while meeting expected vblanking */
> > > > > +         exposure_max = format->height + ctrl->val -
> > > > > +                        AR0234_EXPOSURE_MAX_MARGIN;
> > > > > +         exposure_def = format->height - AR0234_EXPOSURE_MAX_MARGIN;
> > > > > +         __v4l2_ctrl_modify_range(ar0234->exposure,
> > > > > +                                  ar0234->exposure->minimum,
> > > > > +                                  exposure_max, ar0234->exposure->step,
> > > > > +                                  exposure_def);
> > > > > + }
> > > > > +
> > > > > + /* V4L2 controls values will be applied only when power is already up */
> > > > > + if (!pm_runtime_get_if_in_use(&client->dev))
> > > > > +         return 0;
> > > > > +
> > > > > + switch (ctrl->id) {
> > > > > + case V4L2_CID_ANALOGUE_GAIN:
> > > > > +         ret = cci_write(ar0234->regmap, AR0234_REG_ANALOG_GAIN,
> > > > > +                         ctrl->val, NULL);
> > > > > +         break;
> > > > > +
> > > > > + case V4L2_CID_DIGITAL_GAIN:
> > > > > +         ret = cci_write(ar0234->regmap, AR0234_REG_GLOBAL_GAIN,
> > > > > +                         ctrl->val, NULL);
> > > > > +         break;
> > > > > +
> > > > > + case V4L2_CID_EXPOSURE:
> > > > > +         ret = cci_write(ar0234->regmap, AR0234_REG_EXPOSURE,
> > > > > +                         ctrl->val, NULL);
> > > > > +         break;
> > > > > +
> > > > > + case V4L2_CID_VBLANK:
> > > > > +         ret = cci_write(ar0234->regmap, AR0234_REG_VTS,
> > > > > +                         ar0234->cur_mode->height + ctrl->val, NULL);
> > > > > +         break;
> > > > > +
> > > > > + case V4L2_CID_HFLIP:
> > > > > + case V4L2_CID_VFLIP:
> > > > > +         u64 reg;
> > > > > +
> > > > > +         ret = cci_read(ar0234->regmap, AR0234_REG_ORIENTATION,
> > > > > +                        &reg, NULL);
> > > > > +         if (ret)
> > > > > +                 break;
> > > > > +
> > > > > +         reg &= ~(AR0234_ORIENTATION_HFLIP |
> > > > > +                  AR0234_ORIENTATION_VFLIP);
> > > > > +         if (ar0234->hflip->val)
> > > > > +                 reg |= AR0234_ORIENTATION_HFLIP;
> > > > > +         if (ar0234->vflip->val)
> > > > > +                 reg |= AR0234_ORIENTATION_VFLIP;
> > > > > +
> > > > > +         ret = cci_write(ar0234->regmap, AR0234_REG_ORIENTATION,
> > > > > +                         reg, NULL);
> > > > > +         break;
> > > > > +
> > > > > + case V4L2_CID_TEST_PATTERN:
> > > > > +         ret = cci_write(ar0234->regmap, AR0234_REG_TEST_PATTERN,
> > > > > +                         ar0234_test_pattern_val[ctrl->val], NULL);
> > > > > +         break;
> > > > > +
> > > > > + default:
> > > > > +         ret = -EINVAL;
> > > > > +         break;
> > > > > + }
> > > > > +
> > > > > + pm_runtime_put(&client->dev);
> > > > > +
> > > > > + return ret;
> > > > > +}
> > > > > +
> > > > > +static const struct v4l2_ctrl_ops ar0234_ctrl_ops = {
> > > > > + .s_ctrl = ar0234_set_ctrl,
> > > > > +};
> > > > > +
> > > > > +static int ar0234_init_controls(struct ar0234 *ar0234) {
> > > > > + struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
> > > > > + struct v4l2_fwnode_device_properties props;
> > > > > + struct v4l2_ctrl_handler *ctrl_hdlr;
> > > > > + s64 exposure_max, vblank_max, vblank_def, hblank;
> > > > > + u32 link_freq_size;
> > > > > + int ret;
> > > > > +
> > > > > + ctrl_hdlr = &ar0234->ctrl_handler;
> > > > > + ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
> > > > > + if (ret)
> > > > > +         return ret;
> > > > > +
> > > > > + link_freq_size = ARRAY_SIZE(link_freq_menu_items) - 1;
> > > > > + ar0234->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
> > > > > +                                            &ar0234_ctrl_ops,
> > > > > +                                            V4L2_CID_LINK_FREQ,
> > > > > +                                            link_freq_size, 0,
> > > > > +                                            link_freq_menu_items);
> > > > > + if (ar0234->link_freq)
> > > > > +         ar0234->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > > > +
> > > > > + v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops,
> > > > V4L2_CID_ANALOGUE_GAIN,
> > > > > +                   AR0234_ANALOG_GAIN_MIN, AR0234_ANALOG_GAIN_MAX,
> > > > > +                   AR0234_ANALOG_GAIN_STEP,
> > > > AR0234_ANALOG_GAIN_DEFAULT);
> > > > > + v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
> > > > > +                   AR0234_GLOBAL_GAIN_MIN, AR0234_GLOBAL_GAIN_MAX,
> > > > > +                   AR0234_GLOBAL_GAIN_STEP,
> > > > AR0234_GLOBAL_GAIN_DEFAULT);
> > > > > +
> > > > > + exposure_max = ar0234->cur_mode->vts_def -
> > > > AR0234_EXPOSURE_MAX_MARGIN;
> > > > > + ar0234->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops,
> > > > > +                                      V4L2_CID_EXPOSURE,
> > > > > +                                      AR0234_EXPOSURE_MIN, exposure_max,
> > > > > +                                      AR0234_EXPOSURE_STEP,
> > > > > +                                      exposure_max);
> > > > > +
> > > > > + v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops, V4L2_CID_PIXEL_RATE,
> > > > > +                   AR0234_PIXEL_RATE, AR0234_PIXEL_RATE, 1,
> > > > > +                   AR0234_PIXEL_RATE);
> > > > > +
> > > > > + vblank_max = AR0234_VTS_MAX - ar0234->cur_mode->height;
> > > > > + vblank_def = ar0234->cur_mode->vts_def - ar0234->cur_mode->height;
> > > > > + ar0234->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops,
> > > > > +                                    V4L2_CID_VBLANK, 0, vblank_max, 1,
> > > > > +                                    vblank_def);
> > > > > + hblank = AR0234_PPL_DEFAULT - ar0234->cur_mode->width;
> > > > > + ar0234->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops,
> > > > > +                                    V4L2_CID_HBLANK, hblank, hblank, 1,
> > > > > +                                    hblank);
> > > > > + if (ar0234->hblank)
> > > > > +         ar0234->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > > > +
> > > > > + ar0234->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops,
> > > > > +                                   V4L2_CID_HFLIP, 0, 1, 1, 0);
> > > > > + ar0234->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &ar0234_ctrl_ops,
> > > > > +                                   V4L2_CID_VFLIP, 0, 1, 1, 0);
> > > > > +
> > > > > + v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ar0234_ctrl_ops,
> > > > > +                              V4L2_CID_TEST_PATTERN,
> > > > > +                              ARRAY_SIZE(ar0234_test_pattern_menu) - 1,
> > > > > +                              0, 0, ar0234_test_pattern_menu);
> > > > > +
> > > > > + if (ctrl_hdlr->error)
> > > > > +         return ctrl_hdlr->error;
> > > > > +
> > > > > + ret = v4l2_fwnode_device_parse(&client->dev, &props);
> > > > > + if (ret)
> > > > > +         return ret;
> > > > > +
> > > > > + ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ar0234_ctrl_ops,
> > > > > +                                       &props);
> > > > > + if (ret)
> > > > > +         return ret;
> > > > > +
> > > > > + ar0234->sd.ctrl_handler = ctrl_hdlr;
> > > > > +
> > > > > + return 0;
> > > > > +}
> > > > > +
> > > > > +static void ar0234_update_pad_format(const struct ar0234_mode *mode,
> > > > > +                              struct v4l2_mbus_framefmt *fmt) {
> > > > > + fmt->width = mode->width;
> > > > > + fmt->height = mode->height;
> > > > > + fmt->code = mode->code;
> > > > > + fmt->field = V4L2_FIELD_NONE;
> > > > > +}
> > > > > +
> > > > > +static int ar0234_start_streaming(struct ar0234 *ar0234) {
> > > > > + struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
> > > > > + const struct ar0234_reg_list *reg_list;
> > > > > + int ret;
> > > > > +
> > > > > + ret = pm_runtime_resume_and_get(&client->dev);
> > > > > + if (ret < 0)
> > > > > +         return ret;
> > > > > +
> > > > > + /*
> > > > > +  * Setting 0x301A.bit[0] will initiate a reset sequence:
> > > > > +  * the frame being generated will be truncated.
> > > > > +  */
> > > > > + ret = cci_write(ar0234->regmap, AR0234_REG_MODE_SELECT,
> > > > > +                 AR0234_MODE_RESET, NULL);
> > > > > + if (ret) {
> > > > > +         dev_err(&client->dev, "failed to reset");
> > > > > +         goto err_rpm_put;
> > > > > + }
> > > > > +
> > > > > + usleep_range(1000, 1500);
> > > > > +
> > > > > + reg_list = &ar0234->cur_mode->reg_list;
> > > > > + ret = cci_multi_reg_write(ar0234->regmap, reg_list->regs,
> > > > > +                           reg_list->num_of_regs, NULL);
> > > > > + if (ret) {
> > > > > +         dev_err(&client->dev, "failed to set mode");
> > > > > +         goto err_rpm_put;
> > > > > + }
> > > > > +
> > > > > + ret = __v4l2_ctrl_handler_setup(ar0234->sd.ctrl_handler);
> > > > > + if (ret)
> > > > > +         goto err_rpm_put;
> > > > > +
> > > > > + ret = cci_write(ar0234->regmap, AR0234_REG_MODE_SELECT,
> > > > > +                 AR0234_MODE_STREAMING, NULL);
> > > > > + if (ret) {
> > > > > +         dev_err(&client->dev, "failed to start stream");
> > > > > +         goto err_rpm_put;
> > > > > + }
> > > > > +
> > > > > + return 0;
> > > > > +
> > > > > +err_rpm_put:
> > > > > + pm_runtime_put(&client->dev);
> > > > > + return ret;
> > > > > +}
> > > > > +
> > > > > +static int ar0234_stop_streaming(struct ar0234 *ar0234) {
> > > > > + int ret;
> > > > > + struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
> > > > > +
> > > > > + ret = cci_write(ar0234->regmap, AR0234_REG_MODE_SELECT,
> > > > > +                 AR0234_MODE_STANDBY, NULL);
> > > > > + if (ret < 0)
> > > > > +         dev_err(&client->dev, "failed to stop stream");
> > > > > +
> > > > > + pm_runtime_put(&client->dev);
> > > > > + return ret;
> > > > > +}
> > > > > +
> > > > > +static int ar0234_set_stream(struct v4l2_subdev *sd, int enable) {
> > > > > + struct ar0234 *ar0234 = to_ar0234(sd);
> > > > > + struct v4l2_subdev_state *state;
> > > > > + int ret = 0;
> > > > > +
> > > > > + state = v4l2_subdev_lock_and_get_active_state(sd);
> > > > > +
> > > > > + if (enable)
> > > > > +         ret = ar0234_start_streaming(ar0234);
> > > > > + else
> > > > > +         ret = ar0234_stop_streaming(ar0234);
> > > > > +
> > > > > + /* vflip and hflip cannot change during streaming */
> > > > > + __v4l2_ctrl_grab(ar0234->vflip, enable);
> > > > > + __v4l2_ctrl_grab(ar0234->hflip, enable);
> > > > > + v4l2_subdev_unlock_state(state);
> > > > > +
> > > > > + return ret;
> > > > > +}
> > > > > +
> > > > > +static int ar0234_set_format(struct v4l2_subdev *sd,
> > > > > +                      struct v4l2_subdev_state *sd_state,
> > > > > +                      struct v4l2_subdev_format *fmt) {
> > > > > + struct ar0234 *ar0234 = to_ar0234(sd);
> > > > > + struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
> > > > > + struct v4l2_rect *crop;
> > > > > + const struct ar0234_mode *mode;
> > > > > + s64 hblank;
> > > > > + int ret;
> > > > > +
> > > > > + mode = v4l2_find_nearest_size(supported_modes,
> > > > > +                               ARRAY_SIZE(supported_modes),
> > > > > +                               width, height,
> > > > > +                               fmt->format.width,
> > > > > +                               fmt->format.height);
> > > > > +
> > > > > + crop = v4l2_subdev_state_get_crop(sd_state, fmt->pad);
> > > > > + crop->width = mode->width;
> > > > > + crop->height = mode->height;
> > > > > +
> > > > > + ar0234_update_pad_format(mode, &fmt->format);
> > > > > + *v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
> > > > > +
> > > > > + if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > > > > +         return 0;
> > > > > +
> > > > > + ar0234->cur_mode = mode;
> > > > > +
> > > > > + hblank = AR0234_PPL_DEFAULT - mode->width;
> > > > > + ret = __v4l2_ctrl_modify_range(ar0234->hblank, hblank, hblank,
> > > > > +                                1, hblank);
> > > > > + if (ret) {
> > > > > +         dev_err(&client->dev, "HB ctrl range update failed");
> > > > > +         return ret;
> > > > > + }
> > > > > +
> > > > > + /* Update limits and set FPS to default */
> > > > > + ret = __v4l2_ctrl_modify_range(ar0234->vblank, 0,
> > > > > +                                AR0234_VTS_MAX - mode->height, 1,
> > > > > +                                mode->vts_def - mode->height);
> > > > > + if (ret) {
> > > > > +         dev_err(&client->dev, "VB ctrl range update failed");
> > > > > +         return ret;
> > > > > + }
> > > > > +
> > > > > + ret = __v4l2_ctrl_s_ctrl(ar0234->vblank, mode->vts_def - mode->height);
> > > > > + if (ret) {
> > > > > +         dev_err(&client->dev, "VB ctrl set failed");
> > > > > +         return ret;
> > > > > + }
> > > > > +
> > > > > + return 0;
> > > > > +}
> > > > > +
> > > > > +static int ar0234_enum_mbus_code(struct v4l2_subdev *sd,
> > > > > +                          struct v4l2_subdev_state *sd_state,
> > > > > +                          struct v4l2_subdev_mbus_code_enum *code) {
> > > > > + if (code->index > 0)
> > > > > +         return -EINVAL;
> > > > > +
> > > > > + code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> > > > > +
> > > > > + return 0;
> > > > > +}
> > > > > +
> > > > > +static int ar0234_enum_frame_size(struct v4l2_subdev *sd,
> > > > > +                           struct v4l2_subdev_state *sd_state,
> > > > > +                           struct v4l2_subdev_frame_size_enum *fse) {
> > > > > + if (fse->index >= ARRAY_SIZE(supported_modes))
> > > > > +         return -EINVAL;
> > > > > +
> > > > > + if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
> > > > > +         return -EINVAL;
> > > > > +
> > > > > + fse->min_width = supported_modes[fse->index].width;
> > > > > + fse->max_width = fse->min_width;
> > > > > + fse->min_height = supported_modes[fse->index].height;
> > > > > + fse->max_height = fse->min_height;
> > > > > +
> > > > > + return 0;
> > > > > +}
> > > > > +
> > > > > +static int ar0234_get_selection(struct v4l2_subdev *sd,
> > > > > +                         struct v4l2_subdev_state *state,
> > > > > +                         struct v4l2_subdev_selection *sel) {
> > > > > + switch (sel->target) {
> > > > > + case V4L2_SEL_TGT_CROP_DEFAULT:
> > > > > + case V4L2_SEL_TGT_CROP_BOUNDS:
> > > > > +         sel->r.top = AR0234_PIXEL_ARRAY_TOP;
> > > > > +         sel->r.left = AR0234_PIXEL_ARRAY_LEFT;
> > > > > +         sel->r.width = AR0234_COMMON_WIDTH;
> > > > > +         sel->r.height = AR0234_COMMON_HEIGHT;
> > > > > +         break;
> > > > > +
> > > > > + case V4L2_SEL_TGT_CROP:
> > > > > +         sel->r = *v4l2_subdev_state_get_crop(state, 0);
> > > > > +         break;
> > > > > +
> > > > > + case V4L2_SEL_TGT_NATIVE_SIZE:
> > > > > +         sel->r.top = 0;
> > > > > +         sel->r.left = 0;
> > > > > +         sel->r.width = AR0234_NATIVE_WIDTH;
> > > > > +         sel->r.height = AR0234_NATIVE_HEIGHT;
> > > > > +         break;
> > > > > +
> > > > > + default:
> > > > > +         return -EINVAL;
> > > > > + }
> > > > > +
> > > > > + return 0;
> > > > > +}
> > > > > +
> > > > > +static int ar0234_init_state(struct v4l2_subdev *sd,
> > > > > +                      struct v4l2_subdev_state *sd_state) {
> > > > > + struct v4l2_subdev_format fmt = {
> > > > > +         .which = V4L2_SUBDEV_FORMAT_TRY,
> > > > > +         .pad = 0,
> > > > > +         .format = {
> > > > > +                 .code = MEDIA_BUS_FMT_SGRBG10_1X10,
> > > > > +                 .width = AR0234_COMMON_WIDTH,
> > > > > +                 .height = AR0234_COMMON_HEIGHT,
> > > > > +         },
> > > > > + };
> > > > > +
> > > > > + ar0234_set_format(sd, sd_state, &fmt);
> > > > > +
> > > > > + return 0;
> > > > > +}
> > > > > +
> > > > > +static const struct v4l2_subdev_video_ops ar0234_video_ops = {
> > > > > + .s_stream = ar0234_set_stream,
> > > > > +};
> > > > > +
> > > > > +static const struct v4l2_subdev_pad_ops ar0234_pad_ops = {
> > > > > + .set_fmt = ar0234_set_format,
> > > > > + .get_fmt = v4l2_subdev_get_fmt,
> > > > > + .enum_mbus_code = ar0234_enum_mbus_code,
> > > > > + .enum_frame_size = ar0234_enum_frame_size,
> > > > > + .get_selection = ar0234_get_selection, };
> > > > > +
> > > > > +static const struct v4l2_subdev_core_ops ar0234_core_ops = {
> > > > > + .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> > > > > + .unsubscribe_event = v4l2_event_subdev_unsubscribe, };
> > > > > +
> > > > > +static const struct v4l2_subdev_ops ar0234_subdev_ops = {
> > > > > + .core = &ar0234_core_ops,
> > > > > + .video = &ar0234_video_ops,
> > > > > + .pad = &ar0234_pad_ops,
> > > > > +};
> > > > > +
> > > > > +static const struct media_entity_operations ar0234_subdev_entity_ops = {
> > > > > + .link_validate = v4l2_subdev_link_validate, };
> > > > > +
> > > > > +static const struct v4l2_subdev_internal_ops ar0234_internal_ops = {
> > > > > + .init_state = ar0234_init_state,
> > > > > +};
> > > > > +
> > > > > +static int ar0234_parse_fwnode(struct ar0234 *ar0234, struct device
> > > > > +*dev) {
> > > > > + struct fwnode_handle *endpoint;
> > > > > + struct v4l2_fwnode_endpoint bus_cfg = {
> > > > > +         .bus_type = V4L2_MBUS_CSI2_DPHY,
> > > > > + };
> > > > > + int ret;
> > > > > +
> > > > > + endpoint =
> > > > > +         fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> > > > > +                                         FWNODE_GRAPH_ENDPOINT_NEXT);
> > > > > + if (!endpoint) {
> > > > > +         dev_err(dev, "endpoint node not found");
> > > > > +         return -EPROBE_DEFER;
> > > > > + }
> > > > > +
> > > > > + ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
> > > > > + if (ret) {
> > > > > +         dev_err(dev, "parsing endpoint node failed");
> > > > > +         goto out_err;
> > > > > + }
> > > > > +
> > > > > + /* Check the number of MIPI CSI2 data lanes */
> > > > > + if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2 &&
> > > > > +     bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
> > > > > +         dev_err(dev, "only 2 or 4 data lanes are currently supported");
> > > > > +         goto out_err;
> > > > > + }
> > > > > +
> > > > > + ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
> > > > > +                                bus_cfg.nr_of_link_frequencies,
> > > > > +                                link_freq_menu_items,
> > > > > +                                ARRAY_SIZE(link_freq_menu_items),
> > > > > +                                &ar0234->link_freq_bitmap);
> > > > > + if (ret)
> > > > > +         goto out_err;
> > > > > +
> > > > > +out_err:
> > > > > + v4l2_fwnode_endpoint_free(&bus_cfg);
> > > > > + fwnode_handle_put(endpoint);
> > > > > + return ret;
> > > > > +}
> > > > > +
> > > > > +static int ar0234_identify_module(struct ar0234 *ar0234) {
> > > > > + struct i2c_client *client = v4l2_get_subdevdata(&ar0234->sd);
> > > > > + int ret;
> > > > > + u64 val;
> > > > > +
> > > > > + ret = cci_read(ar0234->regmap, AR0234_REG_CHIP_ID, &val, NULL);
> > > > > + if (ret)
> > > > > +         return ret;
> > > > > +
> > > > > + if (val != AR0234_CHIP_ID) {
> > > > > +         dev_err(&client->dev, "chip id mismatch: %x!=%llx",
> > > > > +                 AR0234_CHIP_ID, val);
> > > > > +         return -ENXIO;
> > > > > + }
> > > > > +
> > > > > + return 0;
> > > > > +}
> > > > > +
> > > > > +static void ar0234_remove(struct i2c_client *client) {
> > > > > + struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > > > + struct ar0234 *ar0234 = to_ar0234(sd);
> > > > > +
> > > > > + v4l2_async_unregister_subdev(&ar0234->sd);
> > > > > + v4l2_subdev_cleanup(sd);
> > > > > + media_entity_cleanup(&ar0234->sd.entity);
> > > > > + v4l2_ctrl_handler_free(&ar0234->ctrl_handler);
> > > > > + pm_runtime_disable(&client->dev);
> > > > > + pm_runtime_set_suspended(&client->dev);
> > > > > +}
> > > > > +
> > > > > +static int ar0234_probe(struct i2c_client *client) {
> > > > > + struct device *dev = &client->dev;
> > > > > + struct ar0234 *ar0234;
> > > > > + struct clk *xclk;
> > > > > + u32 xclk_freq;
> > > > > + int ret;
> > > > > +
> > > > > + ar0234 = devm_kzalloc(&client->dev, sizeof(*ar0234), GFP_KERNEL);
> > > > > + if (!ar0234)
> > > > > +         return -ENOMEM;
> > > > > +
> > > > > + ret = ar0234_parse_fwnode(ar0234, dev);
> > > > > + if (ret)
> > > > > +         return ret;
> > > > > +
> > > > > + ar0234->regmap = devm_cci_regmap_init_i2c(client, 16);
> > > > > + if (IS_ERR(ar0234->regmap))
> > > > > +         return dev_err_probe(dev, PTR_ERR(ar0234->regmap),
> > > > > +                              "failed to init CCI");
> > > > > +
> > > > > + v4l2_i2c_subdev_init(&ar0234->sd, client, &ar0234_subdev_ops);
> > > > > +
> > > > > + xclk = devm_clk_get(dev, NULL);
> > > > > + if (IS_ERR(xclk)) {
> > > > > +         if (PTR_ERR(xclk) != -EPROBE_DEFER)
> > > > > +                 dev_err(dev, "failed to get xclk %ld", PTR_ERR(xclk));
> > > > > +         return PTR_ERR(xclk);
> > > > > + }
> > > > > +
> > > > > + xclk_freq = clk_get_rate(xclk);
> > > > > + if (xclk_freq != AR0234_XCLK_FREQ) {
> > > > > +         dev_err(dev, "xclk frequency not supported: %d Hz", xclk_freq);
> > > > > +         return -EINVAL;
> > > > > + }
> > > > > +
> > > > > + /* Check module identity */
> > > > > + ret = ar0234_identify_module(ar0234);
> > > > > + if (ret) {
> > > > > +         dev_err(dev, "failed to find sensor: %d", ret);
> > > > > +         return ret;
> > > > > + }
> > > > > +
> > > > > + ar0234->cur_mode = &supported_modes[0];
> > > > > + ret = ar0234_init_controls(ar0234);
> > > > > + if (ret) {
> > > > > +         dev_err(&client->dev, "failed to init controls: %d", ret);
> > > > > +         goto probe_error_v4l2_ctrl_handler_free;
> > > > > + }
> > > > > +
> > > > > + ar0234->sd.internal_ops = &ar0234_internal_ops;
> > > > > + ar0234->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> > > > > +                     V4L2_SUBDEV_FL_HAS_EVENTS;
> > > > > + ar0234->sd.entity.ops = &ar0234_subdev_entity_ops;
> > > > > + ar0234->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > > > > +
> > > > > + ar0234->pad.flags = MEDIA_PAD_FL_SOURCE;
> > > > > + ret = media_entity_pads_init(&ar0234->sd.entity, 1, &ar0234->pad);
> > > > > + if (ret) {
> > > > > +         dev_err(&client->dev, "failed to init entity pads: %d", ret);
> > > > > +         goto probe_error_v4l2_ctrl_handler_free;
> > > > > + }
> > > > > +
> > > > > + ar0234->sd.state_lock = ar0234->ctrl_handler.lock;
> > > > > + ret = v4l2_subdev_init_finalize(&ar0234->sd);
> > > > > + if (ret < 0) {
> > > > > +         dev_err(dev, "v4l2 subdev init error: %d", ret);
> > > > > +         goto probe_error_media_entity_cleanup;
> > > > > + }
> > > > > +
> > > > > + /*
> > > > > +  * Device is already turned on by i2c-core with ACPI domain PM.
> > > > > +  * Enable runtime PM and turn off the device.
> > > > > +  */
> > > > > + pm_runtime_set_active(&client->dev);
> > > > > + pm_runtime_enable(&client->dev);
> > > > > + pm_runtime_idle(&client->dev);
> > > > > +
> > > > > + ret = v4l2_async_register_subdev_sensor(&ar0234->sd);
> > > > > + if (ret < 0) {
> > > > > +         dev_err(&client->dev, "failed to register V4L2 subdev: %d",
> > > > > +                 ret);
> > > > > +         goto probe_error_rpm;
> > > > > + }
> > > > > +
> > > > > + return 0;
> > > > > +probe_error_rpm:
> > > > > + pm_runtime_disable(&client->dev);
> > > > > + v4l2_subdev_cleanup(&ar0234->sd);
> > > > > +
> > > > > +probe_error_media_entity_cleanup:
> > > > > + media_entity_cleanup(&ar0234->sd.entity);
> > > > > +
> > > > > +probe_error_v4l2_ctrl_handler_free:
> > > > > + v4l2_ctrl_handler_free(ar0234->sd.ctrl_handler);
> > > > > +
> > > > > + return ret;
> > > > > +}
> > > > > +
> > > > > +static const struct acpi_device_id ar0234_acpi_ids[] = {
> > > > > + { "INTC10C0" },
> > > > > + {}
> > > > > +};
> > > > > +MODULE_DEVICE_TABLE(acpi, ar0234_acpi_ids);
> > > > > +
> > > > > +static struct i2c_driver ar0234_i2c_driver = {
> > > > > + .driver = {
> > > > > +         .name = "ar0234",
> > > > > +         .acpi_match_table = ACPI_PTR(ar0234_acpi_ids),
> > > > > + },
> > > > > + .probe = ar0234_probe,
> > > > > + .remove = ar0234_remove,
> > > > > +};
> > > > > +
> > > > > +module_i2c_driver(ar0234_i2c_driver);
> > > > > +
> > > > > +MODULE_DESCRIPTION("ON Semiconductor ar0234 sensor driver");
> > > > > +MODULE_AUTHOR("Dongcheng Yan <dongcheng.yan@intel.com>");
> > > > > +MODULE_AUTHOR("Hao Yao <hao.yao@intel.com>");
> > > > MODULE_LICENSE("GPL");

-- 
Regards,

Laurent Pinchart

