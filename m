Return-Path: <linux-media+bounces-14443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E1E91D8CE
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 09:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 108DE1C213D3
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 07:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383D06F073;
	Mon,  1 Jul 2024 07:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vr5zx4/7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E64923A0
	for <linux-media@vger.kernel.org>; Mon,  1 Jul 2024 07:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719818274; cv=none; b=nAthdF27SRb+AxFBVnbdHR7gnP7asvBgoI5OJn8TXJplwY7ZiLcZF1g2Q6Rdzg1BYptK+ECquDxmivuF5pWlkfECjM1gGkYPXo5QUyhiP4/YDRg2GNIIXRtUa5z6XRI8H3oOm54Ws2FRY9TABN3y00zGAMhbk3p71L5tOCDBZZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719818274; c=relaxed/simple;
	bh=QsTwq59s251QBjTqGfTEsp0TL9iocNanxqwZGnu7qsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gn4cbVZ0Hl2JAXBavGPxZTdsqPcloSRl5TSyHuY9hRzYG1fw6t3neI2BsdoffEAAm6feCSX4059MN2NTo8ZRgZNGvWuWRohkWV52k6U5jv4pts0Adx6YwOxcLNoYO520ChC2PxxDB2HJdqzJt1PLRacONLZevALgzLYbkHbxmqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vr5zx4/7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99C68289;
	Mon,  1 Jul 2024 09:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719818238;
	bh=QsTwq59s251QBjTqGfTEsp0TL9iocNanxqwZGnu7qsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vr5zx4/7J9f1QPakh+AWXb2T5uZFrXkDMa9DLsOiQ01k+4UPC+YJTQeiwi6iimPXu
	 Qd+jyn/wei6lQSseXIqOhQheKE9QaP3aYS9BuEm3OTDd5RhIEVoTSJu3MEiWTQKVVy
	 +mww4M0KRKNdantuawoIUbInHWOU0NUJkcetybmY=
Date: Mon, 1 Jul 2024 10:17:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Yan, Dongcheng" <dongcheng.yan@intel.com>
Cc: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
	"bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
	"dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
	"Li, Daxing" <daxing.li@intel.com>, "Yao, Hao" <hao.yao@intel.com>
Subject: Re: [PATCH v3] media: i2c: Add ar0234 camera sensor driver
Message-ID: <20240701071723.GA15391@pendragon.ideasonboard.com>
References: <20240614080941.3938212-1-dongcheng.yan@intel.com>
 <20240614142432.GA5468@pendragon.ideasonboard.com>
 <CY5PR11MB6415FADB231C59A49880BD6AF2D32@CY5PR11MB6415.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6415FADB231C59A49880BD6AF2D32@CY5PR11MB6415.namprd11.prod.outlook.com>


Hello Dongcheng,

On Mon, Jul 01, 2024 at 05:22:22AM +0000, Yan, Dongcheng wrote:
> Hi Larent,
> 
> Thanks for your review and meaningful suggestions. I have contacted
> the vendor and optimized the code related to the register settings.
> The response is as follows:

I think you forgot the response below :-)

> > -----Original Message-----
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Sent: Friday, June 14, 2024 10:25 PM
> > To: Yan, Dongcheng <dongcheng.yan@intel.com>
> > Cc: sakari.ailus@linux.intel.com; linux-media@vger.kernel.org;
> > tomi.valkeinen@ideasonboard.com; jacopo.mondi@ideasonboard.com;
> > bingbu.cao@linux.intel.com; dave.stevenson@raspberrypi.com; Li, Daxing
> > <daxing.li@intel.com>; Yao, Hao <hao.yao@intel.com>
> > Subject: Re: [PATCH v3] media: i2c: Add ar0234 camera sensor driver
> > 
> > Hi Dongcheng,
> > 
> > Thank you for the patch.
> > 
> > On Fri, Jun 14, 2024 at 04:09:41PM +0800, Dongcheng Yan wrote:
> > > The driver is implemented with V4L2 framework, and supports following
> > > features:
> > >
> > >     - manual exposure and analog/digital gain control
> > >     - vblank/hblank control
> > >     - vflip/hflip control
> > >     - runtime PM support
> > >     - 1280x960 at 30FPS
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
> > > ---
> > > v2 --> v3:
> > >     - remove unused reg setting
> > >     - add vflip/hflip control
> > >     - add external clock check & lanes check
> > >
> > > ---
> > >  drivers/media/i2c/Kconfig  |   11 +
> > >  drivers/media/i2c/Makefile |    1 +
> > >  drivers/media/i2c/ar0234.c | 1077
> > > ++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 1089 insertions(+)
> > >  create mode 100644 drivers/media/i2c/ar0234.c
> > >
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > index c6d3ee472d81..7108d194c975 100644
> > > --- a/drivers/media/i2c/Kconfig
> > > +++ b/drivers/media/i2c/Kconfig
> > > @@ -51,6 +51,17 @@ config VIDEO_ALVIUM_CSI2
> > >  	  To compile this driver as a module, choose M here: the
> > >  	  module will be called alvium-csi2.
> > >
> > > +config VIDEO_AR0234
> > > +        tristate "ON Semiconductor AR0234 sensor support"
> > > +        depends on ACPI || COMPILE_TEST
> > > +        select V4L2_CCI_I2C
> > > +        help
> > > +          This is a Video4Linux2 sensor driver for the ON Semiconductor
> > > +          AR0234 camera.
> > > +
> > > +          To compile this driver as a module, choose M here: the
> > > +          module will be called ar0234.
> > > +
> > >  config VIDEO_AR0521
> > >  	tristate "ON Semiconductor AR0521 sensor support"
> > >  	help
> > > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > > index dfbe6448b549..57b4f62106d9 100644
> > > --- a/drivers/media/i2c/Makefile
> > > +++ b/drivers/media/i2c/Makefile
> > > @@ -19,6 +19,7 @@ obj-$(CONFIG_VIDEO_AK7375) += ak7375.o
> > >  obj-$(CONFIG_VIDEO_AK881X) += ak881x.o
> > >  obj-$(CONFIG_VIDEO_ALVIUM_CSI2) += alvium-csi2.o
> > >  obj-$(CONFIG_VIDEO_APTINA_PLL) += aptina-pll.o
> > > +obj-$(CONFIG_VIDEO_AR0234) += ar0234.o
> > >  obj-$(CONFIG_VIDEO_AR0521) += ar0521.o
> > >  obj-$(CONFIG_VIDEO_BT819) += bt819.o
> > >  obj-$(CONFIG_VIDEO_BT856) += bt856.o
> > > diff --git a/drivers/media/i2c/ar0234.c b/drivers/media/i2c/ar0234.c
> > > new file mode 100644 index 000000000000..80fe5ffd1c64
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/ar0234.c
> > > @@ -0,0 +1,1077 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +// Copyright (c) 2019 - 2024 Intel Corporation.
> > > +
> > > +#include <linux/acpi.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/module.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <asm/unaligned.h>
> > > +
> > > +#include <media/v4l2-cci.h>
> > > +#include <media/v4l2-ctrls.h>
> > > +#include <media/v4l2-event.h>
> > > +#include <media/v4l2-device.h>
> > > +#include <media/v4l2-fwnode.h>
> > > +
> > > +/* Chip ID */
> > > +#define AR0234_REG_CHIP_ID		CCI_REG16(0x3000)
> > > +#define AR0234_CHIP_ID			0x0a56
> > > +
> > > +#define AR0234_REG_MODE_SELECT		CCI_REG16(0x301a)
> > > +#define AR0234_REG_VTS			CCI_REG16(0x300a)
> > > +#define AR0234_REG_EXPOSURE		CCI_REG16(0x3012)
> > > +#define AR0234_REG_ANALOG_GAIN		CCI_REG16(0x3060)
> > > +#define AR0234_REG_GLOBAL_GAIN		CCI_REG16(0x305e)
> > > +#define AR0234_REG_ORIENTATION		CCI_REG16(0x3040)
> > > +#define AR0234_REG_TEST_PATTERN		CCI_REG16(0x0600)
> > > +
> > > +#define AR0234_EXPOSURE_MIN		0
> > > +#define AR0234_EXPOSURE_MAX_MARGIN	80
> > > +#define AR0234_EXPOSURE_STEP		1
> > > +
> > > +#define AR0234_ANALOG_GAIN_MIN		0
> > > +#define AR0234_ANALOG_GAIN_MAX		0x7f
> > > +#define AR0234_ANALOG_GAIN_STEP		1
> > > +#define AR0234_ANALOG_GAIN_DEFAULT	0xe
> > > +
> > > +#define AR0234_GLOBAL_GAIN_MIN		0
> > > +#define AR0234_GLOBAL_GAIN_MAX		0x7ff
> > > +#define AR0234_GLOBAL_GAIN_STEP		1
> > > +#define AR0234_GLOBAL_GAIN_DEFAULT	0x80
> > > +
> > > +#define AR0234_NATIVE_WIDTH		1920
> > > +#define AR0234_NATIVE_HEIGHT		1080
> > > +#define AR0234_COMMON_WIDTH		1280
> > > +#define AR0234_COMMON_HEIGHT		960
> > > +#define AR0234_PIXEL_ARRAY_LEFT		320
> > > +#define AR0234_PIXEL_ARRAY_TOP		60
> > > +#define AR0234_ORIENTATION_HFLIP	BIT(14)
> > > +#define AR0234_ORIENTATION_VFLIP	BIT(15)
> > > +
> > > +#define AR0234_VTS_DEFAULT		0x04c4
> > > +#define AR0234_VTS_MAX			0xffff
> > > +#define AR0234_HTS_DEFAULT		0x04c4
> > > +#define AR0234_PPL_DEFAULT		3498
> > > +
> > > +#define AR0234_MODE_RESET		0x00d9
> > > +#define AR0234_MODE_STANDBY		0x2058
> > > +#define AR0234_MODE_STREAMING		0x205c
> > > +
> > > +#define AR0234_PIXEL_RATE		128000000ULL
> > > +#define AR0234_XCLK_FREQ		19200000ULL
> > > +
> > > +#define AR0234_TEST_PATTERN_DISABLE	0
> > > +#define AR0234_TEST_PATTERN_SOLID_COLOR	1
> > > +#define AR0234_TEST_PATTERN_COLOR_BARS	2
> > > +#define AR0234_TEST_PATTERN_GREY_COLOR	3
> > > +#define AR0234_TEST_PATTERN_WALKING	256
> > > +
> > > +#define to_ar0234(_sd)	container_of(_sd, struct ar0234, sd)
> > > +
> > > +struct ar0234_reg_list {
> > > +	u32 num_of_regs;
> > > +	const struct cci_reg_sequence *regs; };
> > > +
> > > +struct ar0234_mode {
> > > +	u32 width;
> > > +	u32 height;
> > > +	u32 hts;
> > > +	u32 vts_def;
> > > +	u32 code;
> > > +	/* Sensor register settings for this mode */
> > > +	const struct ar0234_reg_list reg_list; };
> > > +
> > > +static const struct cci_reg_sequence mode_1280x960_10bit_2lane[] = {
> > > +	{ CCI_REG16(0x3f4c), 0x121f },
> > > +	{ CCI_REG16(0x3f4e), 0x121f },
> > > +	{ CCI_REG16(0x3f50), 0x0b81 },
> > > +	{ CCI_REG16(0x31e0), 0x0003 },
> > > +	{ CCI_REG16(0x30b0), 0x0028 },
> > > +	/* R0x3088 specify the sequencer RAM access address. */
> > > +	{ CCI_REG16(0x3088), 0x8000 },
> > > +	/* R0x3086 write the sequencer RAM. */
> > > +	{ CCI_REG16(0x3086), 0xc1ae },
> > > +	{ CCI_REG16(0x3086), 0x327f },
> > > +	{ CCI_REG16(0x3086), 0x5780 },
> > > +	{ CCI_REG16(0x3086), 0x272f },
> > > +	{ CCI_REG16(0x3086), 0x7416 },
> > 
> > Storing the sequencer data in this table wastes lots of memory and CPU cycles.
> > Please move the data out to a
> > 
> > static const u16 ar0234_sequencer[] = {
> > 	0xc1ae, 0x327f, 0x5780, 0x272f, 0x7416, 0x7e13, 0x8000, 0x307e,
> > 	...
> > };
> > 
> > table, and program it with
> > 
> > 	/* Program the sequencer. */
> > 	cci_write(ar0234->regmap, CCI_REG16(0x3088), 0x8000, &ret);
> > 	for (i = 0; i < ARRAY_SIZE(ar0234_sequencer); ++i)
> > 		cci_write(ar0234->regmap, CCI_REG16(0x3086),
> > 			  ar0234_sequencer[i], &ret);
> > 
> > And please define macros for the sequencer access registers 0x3086 and
> > 0x3088, as well as for the bits of the 0x3088 register.
> > 
> > [snip]
>
> [Yan, Dongcheng

-- 
Regards,

Laurent Pinchart

