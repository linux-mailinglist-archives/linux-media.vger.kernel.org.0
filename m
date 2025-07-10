Return-Path: <linux-media+bounces-37427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D210FB00DB1
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 23:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CF645C1C62
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 21:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E0672FE319;
	Thu, 10 Jul 2025 21:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DUPq5W8j"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0936322338;
	Thu, 10 Jul 2025 21:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752182526; cv=none; b=CtGF+yG/EN15M/9AwtvRHIVvRwQdGL3mggNcfPc/XYEHU0OXHDByAWtp1sV8D43Rnu2c/GUZJDalnN588Lgf9nnYuwp36QmWeLIVwwBKtszspDSvwhDwckAFwZ+m1oWknli2Mh3TJddhVg8SujrVBiYTuK1v8VOzxBp5fM/zqnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752182526; c=relaxed/simple;
	bh=3Z/RazMoUwBiAi0bPR3KJLcwTV/7nnvDtM3ZFh85w10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkCsEhkUBqwfmiRDE1+oiICr0c5xnuqFL/J5/BU+BRhwmCe9WDWU1hAax4Wt9YAwQ9yDbM+fMJRqHL2pcXHHBaDvCZhpWHvxk7UFQC2y1Mz/A2nuYxn+ao7mJic+rQZIxojagsh/aaCW3Hp2W6mQENGsHvVF9V2qJB9/hI+Jra0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DUPq5W8j; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2F9C2EFE;
	Thu, 10 Jul 2025 23:21:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752182492;
	bh=3Z/RazMoUwBiAi0bPR3KJLcwTV/7nnvDtM3ZFh85w10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DUPq5W8jf8oITnRF5qt1Gzhtd+7l2SlVIwcEn/e9dycLAcVm0wvnD0IeFgfJzLwdF
	 MoP/RgXUo1+NZ1bw7ulVk3MQU9zrKJR6aMzryioSwubtMtLVX1Nsl6JShlJGNVTmR8
	 v92Tcq87caAEPOIEDJ8fnN7skSL/bRUA6OxUanKQ=
Date: Fri, 11 Jul 2025 00:21:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, krzk+dt@kernel.org,
	kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
	pratap.nirujogi@amd.com, tarang.raval@siliconsignals.io,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Matthias Fend <matthias.fend@emfend.at>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>, Hao Yao <hao.yao@intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: add ov2735 image sensor driver
Message-ID: <20250710212131.GG22436@pendragon.ideasonboard.com>
References: <20250710131107.69017-1-hardevsinh.palaniya@siliconsignals.io>
 <20250710131107.69017-3-hardevsinh.palaniya@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250710131107.69017-3-hardevsinh.palaniya@siliconsignals.io>

On Thu, Jul 10, 2025 at 06:40:59PM +0530, Hardevsinh Palaniya wrote:
> Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.
> 
> The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an
> active array size of 1920 x 1080.
> 
> The following features are supported:
> - Manual exposure an gain control support
> - vblank/hblank control support
> - Test pattern support control
> - Supported resolution: 1920 x 1080 @ 30fps (SGRBG10)
> 
> Co-developed-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> ---
>  MAINTAINERS                |   9 +
>  drivers/media/i2c/Kconfig  |  10 +
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/ov2735.c | 962 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 982 insertions(+)
>  create mode 100644 drivers/media/i2c/ov2735.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 92e9d8c7708f..058bbfd9523b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18471,6 +18471,15 @@ T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
>  F:	drivers/media/i2c/ov2685.c
>  
> +OMNIVISION OV2735 SENSOR DRIVER
> +M:	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> +M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media.git
> +F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
> +F:	drivers/media/i2c/ov2735.c
> +
>  OMNIVISION OV2740 SENSOR DRIVER
>  M:	Tianshu Qiu <tian.shu.qiu@intel.com>
>  R:	Sakari Ailus <sakari.ailus@linux.intel.com>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 4b4c199da6ea..9646eab1b177 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -446,6 +446,16 @@ config VIDEO_OV2685
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called ov2685.
>  
> +config VIDEO_OV2735
> +	tristate "OmniVision OV2735 sensor support"
> +	select V4L2_CCI_I2C
> +	help
> +	  This is a Video4Linux2 sensor driver for the Sony
> +	  OV2735 camera.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called ov2735.
> +
>  config VIDEO_OV2740
>  	tristate "OmniVision OV2740 sensor support"
>  	depends on ACPI || COMPILE_TEST
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 5873d29433ee..1adb27743fa1 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -93,6 +93,7 @@ obj-$(CONFIG_VIDEO_OV2640) += ov2640.o
>  obj-$(CONFIG_VIDEO_OV2659) += ov2659.o
>  obj-$(CONFIG_VIDEO_OV2680) += ov2680.o
>  obj-$(CONFIG_VIDEO_OV2685) += ov2685.o
> +obj-$(CONFIG_VIDEO_OV2735) += ov2735.o
>  obj-$(CONFIG_VIDEO_OV2740) += ov2740.o
>  obj-$(CONFIG_VIDEO_OV4689) += ov4689.o
>  obj-$(CONFIG_VIDEO_OV5640) += ov5640.o
> diff --git a/drivers/media/i2c/ov2735.c b/drivers/media/i2c/ov2735.c
> new file mode 100644
> index 000000000000..9cfa34aa0966
> --- /dev/null
> +++ b/drivers/media/i2c/ov2735.c
> @@ -0,0 +1,962 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * V4L2 Support for the OV2735
> + *
> + * Copyright (C) 2025 Silicon Signals Pvt. Ltd.
> + *
> + * Based on Rockchip ov2735 Camera Driver
> + * Copyright (C) 2017 Fuzhou Rockchip Electronics Co., Ltd.
> + *
> + * Inspired from ov8858, imx219, imx283 camera drivers
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/clk.h>
> +#include <linux/container_of.h>
> +#include <linux/delay.h>
> +#include <linux/device/devres.h>
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/units.h>
> +#include <linux/types.h>
> +
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mediabus.h>
> +
> +#define OV2735_XCLK_FREQ			(24 * HZ_PER_MHZ)
> +
> +/* Add page number in CCI private bits [31:28] of the register address */
> +#define CCI_PAGE_REG8(x, p)			((p << CCI_REG_PRIVATE_SHIFT) | CCI_REG8(x))

#define CCI_PAGE_REG8(x, p)			(((p) << CCI_REG_PRIVATE_SHIFT) | CCI_REG8(x))

But name the macro with an OV2735_ prefix, it's not a generic CCI macro.

> +#define CCI_PAGE_REG16(x, p)			((p << CCI_REG_PRIVATE_SHIFT) | CCI_REG16(x))

Same here.

Could you swap the x and p arguments ? It's more readable to have the
page before the address.

> +
> +#define OV2735_REG_PAGE_SELECT			CCI_REG8(0xfd)
> +
> +/* Page 0 */
> +#define OV2735_REG_CHIPID			CCI_PAGE_REG16(0x02, 0x00)
> +#define OV2735_CHIPID				0x2735
> +
> +#define OV2735_REG_SOFT_REST			CCI_PAGE_REG8(0x20, 0x00)
> +
> +/* Clock Settings */
> +#define OV2735_REG_PLL_CTRL			CCI_PAGE_REG8(0x2f, 0x00)
> +#define OV2735_REG_PLL_OUTDIV			CCI_PAGE_REG8(0x34, 0x00)
> +#define OV2735_REG_CLK_MODE			CCI_PAGE_REG8(0x30, 0x00)
> +#define OV2735_REG_CLOCK_REG1			CCI_PAGE_REG8(0x33, 0x00)
> +#define OV2735_REG_CLOCK_REG2			CCI_PAGE_REG8(0x35, 0x00)
> +
> +/* Page 1 */
> +#define OV2735_REG_STREAM_CTRL			CCI_PAGE_REG8(0xa0, 0x01)
> +#define OV2735_STREAM_ON			0x01
> +#define OV2735_STREAM_OFF			0x00
> +
> +#define OV2735_REG_UPDOWN_MIRROR		CCI_PAGE_REG8(0x3f, 0x01)
> +#define OV2735_REG_BINNING_DAC_CODE_MODE	CCI_PAGE_REG8(0x30, 0x01)
> +#define OV2735_REG_FRAME_LENGTH			CCI_PAGE_REG16(0x0e, 0x01)
> +#define OV2735_VTS_MAX				0x0fff
> +#define OV2735_REG_FRAME_EXP_SEPERATE_EN	CCI_PAGE_REG8(0x0d, 0x01)
> +#define OV2735_FRAME_EXP_SEPERATE_EN		0x10
> +#define OV2735_REG_FRAME_SYNC			CCI_PAGE_REG8(0x01, 0x01)
> +
> +#define OV2735_REG_HBLANK			CCI_PAGE_REG16(0x09, 0x01)
> +
> +#define OV2735_REG_HS_MIPI			CCI_PAGE_REG8(0xb1, 0x01)
> +#define OV2735_REG_MIPI_CTRL1			CCI_PAGE_REG8(0x92, 0x01)
> +#define OV2735_REG_MIPI_CTRL2			CCI_PAGE_REG8(0x94, 0x01)
> +#define OV2735_REG_MIPI_CTRL3			CCI_PAGE_REG8(0xa1, 0x01)
> +#define OV2735_REG_MIPI_CTRL4			CCI_PAGE_REG8(0xb2, 0x01)
> +#define OV2735_REG_MIPI_CTRL5			CCI_PAGE_REG8(0xb3, 0x01)
> +#define OV2735_REG_MIPI_CTRL6			CCI_PAGE_REG8(0xb4, 0x01)
> +#define OV2735_REG_MIPI_CTRL7			CCI_PAGE_REG8(0xb5, 0x01)
> +#define OV2735_REG_PREPARE			CCI_PAGE_REG8(0x95, 0x01)
> +#define OV2735_REG_R_HS_ZERO			CCI_PAGE_REG8(0x96, 0x01)
> +#define OV2735_REG_TRAIL			CCI_PAGE_REG8(0x98, 0x01)
> +#define OV2735_REG_R_CLK_ZERO			CCI_PAGE_REG8(0x9c, 0x01)
> +#define OV2735_REG_MIPI_V_SIZE			CCI_PAGE_REG16(0x8e, 0x01)
> +#define OV2735_REG_MIPI_H_SIZE			CCI_PAGE_REG16(0x90, 0x01)
> +
> +#define OV2735_REG_ANALOG_CTRL3			CCI_PAGE_REG8(0x25, 0x01)
> +#define OV2735_REG_VNCP				CCI_PAGE_REG8(0x20, 0x01)
> +
> +/* BLC registers */
> +#define OV2735_REG_BLC_GAIN_BLUE		CCI_PAGE_REG8(0x86, 0x01)
> +#define OV2735_REG_BLC_GAIN_RED			CCI_PAGE_REG8(0x87, 0x01)
> +#define OV2735_REG_BLC_GAIN_GR			CCI_PAGE_REG8(0x88, 0x01)
> +#define OV2735_REG_BLC_GAIN_GB			CCI_PAGE_REG8(0x89, 0x01)
> +#define OV2735_REG_GB_SUBOFFSET			CCI_PAGE_REG8(0xf0, 0x01)
> +#define OV2735_REG_BLUE_SUBOFFSET		CCI_PAGE_REG8(0xf1, 0x01)
> +#define OV2735_REG_RED_SUBOFFSET		CCI_PAGE_REG8(0xf2, 0x01)
> +#define OV2735_REG_GR_SUBOFFSET			CCI_PAGE_REG8(0xf3, 0x01)
> +#define OV2735_REG_BLC_BPC_TH_P			CCI_PAGE_REG8(0xfc, 0x01)
> +#define OV2735_REG_BLC_BPC_TH_N			CCI_PAGE_REG8(0xfe, 0x01)
> +
> +#define OV2735_REG_TEST_PATTERN			CCI_PAGE_REG8(0xb2, 0x01)
> +#define OV2735_TEST_PATTERN_ENABLE		0x01
> +#define OV2735_TEST_PATTERN_DISABLE		0xfe
> +
> +#define OV2735_REG_LONG_EXPOSURE		CCI_PAGE_REG16(0x03, 0x01)
> +#define	OV2735_EXPOSURE_MIN			4
> +#define	OV2735_EXPOSURE_STEP			1
> +
> +#define OV2735_REG_ANALOG_GAIN                  CCI_PAGE_REG8(0x24, 0x01)
> +#define	OV2735_ANALOG_GAIN_MIN			0x10
> +#define	OV2735_ANALOG_GAIN_MAX			0xff
> +#define	OV2735_ANALOG_GAIN_STEP			1
> +#define	OV2735_ANALOG_GAIN_DEFAULT		0x10
> +
> +/* Page 2 */
> +#define OV2735_REG_V_START			CCI_PAGE_REG16(0xa0, 0x02)
> +#define OV2735_REG_V_SIZE			CCI_PAGE_REG16(0xa2, 0x02)
> +#define OV2735_REG_H_START			CCI_PAGE_REG16(0xa4, 0x02)
> +#define OV2735_REG_H_SIZE			CCI_PAGE_REG16(0xa6, 0x02)
> +
> +#define OV2735_LINK_FREQ_420MHZ			(420 * HZ_PER_MHZ)

If that's the only supported value, you need to validate that the link
frequencies specified in DT match. Better, you should calculate the PLL
parameters dynamically based on the input frequency and the link
frequency.

> +#define OV2735_PIXEL_RATE			(168 * HZ_PER_MHZ)
> +
> +static const char * const ov2735_supply_name[] = {
> +	"avdd",		/* Analog power */
> +	"dovdd",	/* Digital I/O power */
> +	"dvdd",		/* Digital core power */
> +};
> +
> +struct ov2735 {
> +	struct device *dev;
> +	struct regmap *cci;
> +	struct v4l2_subdev sd;
> +	struct media_pad pad;
> +	struct i2c_client *client;
> +	struct clk *xclk;
> +	struct gpio_desc *reset_gpio;
> +	struct gpio_desc *enable_gpio;
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(ov2735_supply_name)];
> +
> +	/* V4L2 Controls */
> +	struct v4l2_ctrl_handler handler;
> +	struct v4l2_ctrl *link_freq;
> +	struct v4l2_ctrl *pixel_rate;
> +	struct v4l2_ctrl *hblank;
> +	struct v4l2_ctrl *vblank;
> +	struct v4l2_ctrl *gain;
> +	struct v4l2_ctrl *exposure;
> +	struct v4l2_ctrl *test_pattern;
> +
> +	u8 current_page;
> +	struct mutex page_lock;
> +};
> +
> +struct ov2735_reglist {
> +	unsigned int num_regs;
> +	const struct cci_reg_sequence *regvals;
> +};
> +
> +struct ov2735_mode {
> +	u32 width;
> +	u32 height;
> +	u32 hts_def;
> +	u32 vts_def;
> +	u32 exp_def;
> +	struct ov2735_reglist reg_list;
> +};
> +
> +static struct cci_reg_sequence ov2735_1920_1080_30fps[] = {
> +	{ OV2735_REG_PLL_CTRL,			0x10 },
> +	{ OV2735_REG_PLL_OUTDIV,		0x00 },
> +	{ OV2735_REG_CLK_MODE,			0x15 },
> +	{ OV2735_REG_CLOCK_REG1,		0x01 },
> +	{ OV2735_REG_CLOCK_REG2,		0x20 },
> +	{ OV2735_REG_BINNING_DAC_CODE_MODE,	0x00 },
> +	{ CCI_PAGE_REG8(0xfb, 0x01),		0x73 },
> +	{ OV2735_REG_FRAME_SYNC,		0x01 },
> +
> +	/* Timing ctrl */
> +	{ CCI_PAGE_REG8(0x1a, 0x01),	0x6b },
> +	{ CCI_PAGE_REG8(0x1c, 0x01),	0xea },
> +	{ CCI_PAGE_REG8(0x16, 0x01),	0x0c },
> +	{ CCI_PAGE_REG8(0x21, 0x01),	0x00 },
> +	{ CCI_PAGE_REG8(0x11, 0x01),	0x63 },
> +	{ CCI_PAGE_REG8(0x19, 0x01),	0xc3 },
> +
> +	/* Analog ctrl */
> +	{ CCI_PAGE_REG8(0x26, 0x01),	0x5a },
> +	{ CCI_PAGE_REG8(0x29, 0x01),	0x01 },
> +	{ CCI_PAGE_REG8(0x33, 0x01),	0x6f },
> +	{ CCI_PAGE_REG8(0x2a, 0x01),	0xd2 },
> +	{ CCI_PAGE_REG8(0x2c, 0x01),	0x40 },
> +	{ CCI_PAGE_REG8(0xd0, 0x01),	0x02 },
> +	{ CCI_PAGE_REG8(0xd1, 0x01),	0x01 },
> +	{ CCI_PAGE_REG8(0xd2, 0x01),	0x20 },
> +	{ CCI_PAGE_REG8(0xd3, 0x01),	0x04 },
> +	{ CCI_PAGE_REG8(0xd4, 0x01),	0x2a },
> +	{ CCI_PAGE_REG8(0x50, 0x01),	0x00 },
> +	{ CCI_PAGE_REG8(0x51, 0x01),	0x2c },
> +	{ CCI_PAGE_REG8(0x52, 0x01),	0x29 },
> +	{ CCI_PAGE_REG8(0x53, 0x01),	0x00 },
> +	{ CCI_PAGE_REG8(0x55, 0x01),	0x44 },
> +	{ CCI_PAGE_REG8(0x58, 0x01),	0x29 },
> +	{ CCI_PAGE_REG8(0x5a, 0x01),	0x00 },
> +	{ CCI_PAGE_REG8(0x5b, 0x01),	0x00 },
> +	{ CCI_PAGE_REG8(0x5d, 0x01),	0x00 },
> +	{ CCI_PAGE_REG8(0x64, 0x01),	0x2f },
> +	{ CCI_PAGE_REG8(0x66, 0x01),	0x62 },
> +	{ CCI_PAGE_REG8(0x68, 0x01),	0x5b },
> +	{ CCI_PAGE_REG8(0x75, 0x01),	0x46 },
> +	{ CCI_PAGE_REG8(0x76, 0x01),	0x36 },
> +	{ CCI_PAGE_REG8(0x77, 0x01),	0x4f },
> +	{ CCI_PAGE_REG8(0x78, 0x01),	0xef },
> +	{ CCI_PAGE_REG8(0x72, 0x01),	0xcf },
> +	{ CCI_PAGE_REG8(0x73, 0x01),	0x36 },
> +	{ CCI_PAGE_REG8(0x7d, 0x01),	0x0d },
> +	{ CCI_PAGE_REG8(0x7e, 0x01),	0x0d },
> +	{ CCI_PAGE_REG8(0x8a, 0x01),	0x77 },
> +	{ CCI_PAGE_REG8(0x8b, 0x01),	0x77 },
> +
> +	{ OV2735_REG_HS_MIPI,		0x83 },
> +	{ OV2735_REG_MIPI_CTRL5,	0x0b },
> +	{ OV2735_REG_MIPI_CTRL6,	0x14 },
> +	{ CCI_PAGE_REG8(0x9d, 0x01),	0x40 },
> +	{ OV2735_REG_MIPI_CTRL3,	0x05 },
> +	{ OV2735_REG_MIPI_CTRL2,	0x44 },
> +	{ OV2735_REG_PREPARE,		0x33 },
> +	{ OV2735_REG_R_HS_ZERO,		0x1f },
> +	{ OV2735_REG_TRAIL,		0x45 },
> +	{ OV2735_REG_R_CLK_ZERO,	0x10 },
> +	{ OV2735_REG_MIPI_CTRL7,	0x70 },
> +	{ OV2735_REG_ANALOG_CTRL3,	0xe0 },
> +	{ OV2735_REG_VNCP,		0x7b },
> +
> +	/* BLC */
> +	{ OV2735_REG_BLC_GAIN_BLUE,	0x77 },
> +	{ OV2735_REG_BLC_GAIN_GB,	0x77 },
> +	{ OV2735_REG_BLC_GAIN_RED,	0x74 },
> +	{ OV2735_REG_BLC_GAIN_GR,	0x74 },
> +	{ OV2735_REG_BLC_BPC_TH_P,	0xe0 },
> +	{ OV2735_REG_BLC_BPC_TH_N,	0xe0 },
> +	{ OV2735_REG_GB_SUBOFFSET,	0x40 },
> +	{ OV2735_REG_BLUE_SUBOFFSET,	0x40 },
> +	{ OV2735_REG_RED_SUBOFFSET,	0x40 },
> +	{ OV2735_REG_GR_SUBOFFSET,	0x40 },

A lot of those registers are unrelated to the mode. Split the table in
two, with a list of common registers, and then per-mode registers (if
any).

> +
> +	/* 1920x1080 */
> +	{ OV2735_REG_V_START,		0x0008 },
> +	{ OV2735_REG_V_SIZE,		0x0438 },
> +	{ OV2735_REG_H_START,		0x0008 },
> +	{ OV2735_REG_H_SIZE,		0x03c0 },
> +	{ OV2735_REG_MIPI_V_SIZE,	0x0780 },
> +	{ OV2735_REG_MIPI_H_SIZE,	0x0438 },

Don't hardcode those registers, program them based on the format (and
possibly selection rectangles.

> +};
> +
> +static const struct ov2735_mode supported_modes[] = {
> +	{
> +		.width = 1920,
> +		.height = 1080,
> +		.exp_def = 399,
> +		.hts_def = 2200,
> +		.vts_def = 2545,
> +		.reg_list = {
> +			.num_regs = ARRAY_SIZE(ov2735_1920_1080_30fps),
> +			.regvals = ov2735_1920_1080_30fps,
> +		},
> +	},
> +};
> +
> +static const s64 link_freq_menu_items[] = {
> +	OV2735_LINK_FREQ_420MHZ,
> +};
> +
> +static const char * const ov2735_test_pattern_menu[] = {
> +	"Disabled",
> +	"Vertical Color",
> +};
> +
> +static int ov2735_cci_access(struct ov2735 *ov2735,
> +			     u32 reg, void *val, int *err, bool is_read)
> +{
> +	u8 page = (reg >> CCI_REG_PRIVATE_SHIFT) & 0xff;
> +	u32 addr = reg & ~CCI_REG_PRIVATE_MASK;
> +	int ret = 0;
> +
> +	if (err && *err)
> +		return *err;
> +
> +	mutex_lock(&ov2735->page_lock);
> +
> +	/* Perform page access before read/write */
> +	if (ov2735->current_page != page) {
> +		ret = cci_write(ov2735->cci, OV2735_REG_PAGE_SELECT, page, &ret);
> +		if (ret)
> +			goto err_mutex_unlock;
> +		ov2735->current_page = page;
> +	}
> +
> +	if (is_read)
> +		cci_read(ov2735->cci, addr, (u64 *)val, &ret);
> +	else
> +		cci_write(ov2735->cci, addr, *(u64 *)val, &ret);
> +
> +	if (!ret && err)
> +		*err = ret;
> +
> +err_mutex_unlock:
> +	mutex_unlock(&ov2735->page_lock);
> +	return ret;
> +}
> +
> +static int ov2735_cci_read(struct ov2735 *ov2735, u32 reg, u64 *val, int *err)

You can drop "cci_" in the function name. Same below.

> +{
> +	return ov2735_cci_access(ov2735, reg, val, err, true);
> +}
> +
> +static int ov2735_cci_write(struct ov2735 *ov2735, u32 reg, u64 val, int *err)
> +{
> +	return ov2735_cci_access(ov2735, reg, (void *)&val, err, false);
> +}
> +
> +static int ov2735_cci_multi_reg_write(struct ov2735 *ov2735,
> +				      const struct cci_reg_sequence *regs,
> +				      unsigned int num_regs, int *err)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < num_regs; i++) {
> +		ret = ov2735_cci_write(ov2735, regs[i].reg, regs[i].val, err);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static inline struct ov2735 *to_ov2735(struct v4l2_subdev *_sd)
> +{
> +	return container_of(_sd, struct ov2735, sd);
> +}
> +
> +static int ov2735_enable_test_pattern(struct ov2735 *ov2735, u32 pattern)
> +{
> +	int ret = 0;
> +	u64 val;
> +
> +	ov2735_cci_read(ov2735, OV2735_REG_TEST_PATTERN, &val, &ret);
> +	if (ret)
> +		return ret;
> +
> +	switch (pattern) {
> +	case 0:
> +		val &= ~OV2735_TEST_PATTERN_ENABLE;
> +		break;
> +	case 1:
> +		val |= OV2735_TEST_PATTERN_ENABLE;
> +		break;
> +	}
> +
> +	return ov2735_cci_write(ov2735, OV2735_REG_TEST_PATTERN, val, NULL);
> +}
> +
> +static int ov2735_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ov2735 *ov2735 = container_of(ctrl->handler, struct ov2735,
> +					     handler);
> +	const struct ov2735_mode *mode;
> +	struct v4l2_mbus_framefmt *fmt;
> +	struct v4l2_subdev_state *state;
> +	u64 vts;
> +	int ret = 0;
> +
> +	state = v4l2_subdev_get_locked_active_state(&ov2735->sd);
> +	fmt = v4l2_subdev_state_get_format(state, 0);
> +
> +	mode = v4l2_find_nearest_size(supported_modes,
> +				      ARRAY_SIZE(supported_modes),
> +				      width, height,
> +				      fmt->width, fmt->height);

The format has to match one of the modes, so you can drop this and use
fmt->height below.

> +
> +	if (ctrl->id == V4L2_CID_VBLANK) {
> +		/* Honour the VBLANK limits when setting exposure. */
> +		s64 max = mode->height + ctrl->val - 4;
> +
> +		ret = __v4l2_ctrl_modify_range(ov2735->exposure,
> +					       ov2735->exposure->minimum, max,
> +					       ov2735->exposure->step,
> +					       ov2735->exposure->default_value);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/*
> +	 * Applying V4L2 control value only happens
> +	 * when power is up for streaming.
> +	 */
> +	if (pm_runtime_get_if_in_use(ov2735->dev) == 0)
> +		return 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE:
> +		ov2735_cci_write(ov2735, OV2735_REG_LONG_EXPOSURE, ctrl->val, &ret);
> +		break;
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		ov2735_cci_write(ov2735, OV2735_REG_ANALOG_GAIN, ctrl->val, &ret);
> +		break;
> +	case V4L2_CID_HBLANK:
> +		ov2735_cci_write(ov2735, OV2735_REG_HBLANK, ctrl->val, &ret);
> +		break;
> +	case V4L2_CID_VBLANK:
> +		vts = ctrl->val + mode->height;
> +		ov2735_cci_write(ov2735, OV2735_REG_FRAME_EXP_SEPERATE_EN,
> +				 OV2735_FRAME_EXP_SEPERATE_EN, &ret);
> +		ov2735_cci_write(ov2735, OV2735_REG_FRAME_LENGTH, vts, &ret);
> +		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = ov2735_enable_test_pattern(ov2735, ctrl->val);
> +		break;
> +	default:
> +		dev_err(ov2735->dev, "ctrl(id:0x%x, val:0x%x) is not handled\n",
> +			ctrl->id, ctrl->val);
> +		break;
> +	}
> +	ov2735_cci_write(ov2735, OV2735_REG_FRAME_SYNC, 0x01, &ret);
> +
> +	pm_runtime_put(ov2735->dev);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops ov2735_ctrl_ops = {
> +	.s_ctrl = ov2735_set_ctrl,
> +};
> +
> +static int ov2735_init_controls(struct ov2735 *ov2735)
> +{
> +	struct v4l2_ctrl_handler *ctrl_hdlr;
> +	struct v4l2_fwnode_device_properties props;
> +	const struct ov2735_mode *mode = &supported_modes[0];
> +	u64 hblank_def, vblank_def, exp_max;
> +	int ret;
> +
> +	ctrl_hdlr = &ov2735->handler;
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 9);
> +	if (ret)
> +		return ret;
> +
> +	ov2735->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_ctrl_ops,
> +					       V4L2_CID_PIXEL_RATE, 0, OV2735_PIXEL_RATE,
> +					       1, OV2735_PIXEL_RATE);
> +
> +	ov2735->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov2735_ctrl_ops,
> +						   V4L2_CID_LINK_FREQ,
> +						   0, 0, link_freq_menu_items);
> +	if (ov2735->link_freq)
> +		ov2735->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	hblank_def = mode->hts_def - mode->width;
> +	ov2735->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_ctrl_ops, V4L2_CID_HBLANK,
> +					   hblank_def, hblank_def, 1, hblank_def);
> +
> +	vblank_def = mode->vts_def - mode->height;
> +	ov2735->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_ctrl_ops,
> +					   V4L2_CID_VBLANK, vblank_def,
> +					   OV2735_VTS_MAX - mode->height,
> +					   1, vblank_def);
> +
> +	exp_max = mode->vts_def - 4;
> +	ov2735->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_ctrl_ops,
> +					     V4L2_CID_EXPOSURE, OV2735_EXPOSURE_MIN,
> +					     exp_max, OV2735_EXPOSURE_STEP, mode->exp_def);
> +
> +	ov2735->gain = v4l2_ctrl_new_std(ctrl_hdlr, &ov2735_ctrl_ops,
> +					 V4L2_CID_ANALOGUE_GAIN, OV2735_ANALOG_GAIN_MIN,
> +					 OV2735_ANALOG_GAIN_MAX, OV2735_ANALOG_GAIN_STEP,
> +					 OV2735_ANALOG_GAIN_DEFAULT);
> +
> +	ov2735->test_pattern = v4l2_ctrl_new_std_menu_items(ctrl_hdlr,
> +						&ov2735_ctrl_ops, V4L2_CID_TEST_PATTERN,
> +						ARRAY_SIZE(ov2735_test_pattern_menu) - 1,
> +						0, 0, ov2735_test_pattern_menu);
> +	if (ctrl_hdlr->error) {
> +		ret = ctrl_hdlr->error;
> +		dev_err(ov2735->dev, "control init failed (%d)\n", ret);
> +		goto err_handler_free;
> +	}
> +
> +	ret = v4l2_fwnode_device_parse(ov2735->dev, &props);
> +	if (ret)
> +		goto err_handler_free;
> +
> +	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov2735_ctrl_ops,
> +					      &props);
> +	if (ret)
> +		goto err_handler_free;
> +
> +	ov2735->sd.ctrl_handler = ctrl_hdlr;
> +
> +	return 0;
> +
> +err_handler_free:
> +	v4l2_ctrl_handler_free(ctrl_hdlr);
> +
> +	return ret;
> +}
> +
> +static int ov2735_enable_streams(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state, u32 pad,
> +				 u64 streams_mask)
> +{
> +	struct ov2735 *ov2735 = to_ov2735(sd);
> +	const struct ov2735_mode *mode;
> +	const struct ov2735_reglist *reg_list;
> +	const struct v4l2_mbus_framefmt *fmt;
> +	int ret;
> +
> +	fmt = v4l2_subdev_state_get_format(state, 0);
> +	mode = v4l2_find_nearest_size(supported_modes,
> +				      ARRAY_SIZE(supported_modes),
> +				      width, height,
> +				      fmt->width, fmt->height);
> +
> +	ret = pm_runtime_resume_and_get(ov2735->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	reg_list = &mode->reg_list;
> +	ov2735_cci_multi_reg_write(ov2735, reg_list->regvals, reg_list->num_regs, &ret);
> +	if (ret) {
> +		dev_err(ov2735->dev, "%s failed to send mfg header\n", __func__);
> +		goto err_rpm_put;
> +	}
> +
> +	/* Apply customized values from user */
> +	ret = __v4l2_ctrl_handler_setup(ov2735->sd.ctrl_handler);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	/* set stream on register */
> +	ov2735_cci_write(ov2735, OV2735_REG_STREAM_CTRL, OV2735_STREAM_ON, &ret);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	return 0;
> +
> +err_rpm_put:
> +	pm_runtime_put(ov2735->dev);
> +	return ret;
> +}
> +
> +static int ov2735_disable_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state, u32 pad,
> +				  u64 streams_mask)
> +{
> +	struct ov2735 *ov2735 = to_ov2735(sd);
> +	int ret = 0;
> +
> +	/* set stream off register */
> +	ov2735_cci_write(ov2735, OV2735_REG_STREAM_CTRL, OV2735_STREAM_OFF, &ret);
> +	if (ret)
> +		dev_err(ov2735->dev, "%s failed to set stream\n", __func__);
> +
> +	pm_runtime_put(ov2735->dev);
> +
> +	return ret;
> +}
> +
> +static int ov2735_enum_mbus_code(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	if (code->index >= 0)
> +		return -EINVAL;
> +
> +	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +
> +	return 0;
> +}
> +
> +static int ov2735_enum_frame_size(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	u32 code;
> +
> +	if (fse->index >= ARRAY_SIZE(supported_modes))
> +		return -EINVAL;
> +
> +	code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +	if (fse->code != code)
> +		return -EINVAL;
> +
> +	fse->min_width = supported_modes[fse->index].width;
> +	fse->max_width = fse->min_width;
> +	fse->min_height = supported_modes[fse->index].height;
> +	fse->max_height = fse->min_height;
> +
> +	return 0;
> +}
> +
> +static void ov2735_set_framing_limits(struct ov2735 *ov2735,
> +				      const struct ov2735_mode *mode)
> +{
> +	u32 hblank, vblank_def;
> +
> +	hblank = mode->hts_def - mode->width;
> +	__v4l2_ctrl_modify_range(ov2735->hblank, hblank, hblank, 1, hblank);
> +
> +	vblank_def = mode->vts_def - mode->height;
> +	__v4l2_ctrl_modify_range(ov2735->vblank, vblank_def, OV2735_VTS_MAX - mode->height,
> +				 1, vblank_def);
> +}
> +
> +static int ov2735_set_pad_format(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_format *fmt)
> +{
> +	struct v4l2_mbus_framefmt *format;
> +	const struct ov2735_mode *mode;
> +	struct ov2735 *ov2735 = to_ov2735(sd);
> +
> +	format = v4l2_subdev_state_get_format(sd_state, 0);
> +
> +	mode = v4l2_find_nearest_size(supported_modes,
> +				      ARRAY_SIZE(supported_modes),
> +				      width, height,
> +				      fmt->format.width, fmt->format.height);
> +
> +	fmt->format.width = mode->width;
> +	fmt->format.height = mode->height;
> +	fmt->format.field = V4L2_FIELD_NONE;
> +	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
> +	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
> +
> +	format = v4l2_subdev_state_get_format(sd_state, 0);
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
> +		ov2735_set_framing_limits(ov2735, mode);
> +
> +	*format = fmt->format;
> +
> +	return 0;
> +}
> +
> +static int ov2735_init_state(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_subdev_format fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_TRY,
> +		.pad = 0,
> +		.format = {
> +			.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> +			.width = supported_modes[0].width,
> +			.height = supported_modes[0].height,
> +		},
> +	};
> +
> +	ov2735_set_pad_format(sd, state, &fmt);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_video_ops ov2735_video_ops = {
> +	.s_stream = v4l2_subdev_s_stream_helper,
> +};
> +
> +static const struct v4l2_subdev_pad_ops ov2735_pad_ops = {
> +	.enum_mbus_code = ov2735_enum_mbus_code,
> +	.get_fmt = v4l2_subdev_get_fmt,
> +	.set_fmt = ov2735_set_pad_format,
> +	.enum_frame_size = ov2735_enum_frame_size,
> +	.enable_streams = ov2735_enable_streams,
> +	.disable_streams = ov2735_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_ops ov2735_subdev_ops = {
> +	.video = &ov2735_video_ops,
> +	.pad = &ov2735_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops ov2735_internal_ops = {
> +	.init_state = ov2735_init_state,
> +};
> +
> +static int ov2735_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov2735 *ov2735 = to_ov2735(sd);
> +	unsigned long delay_us;
> +	int ret;
> +
> +	gpiod_set_value_cansleep(ov2735->enable_gpio, 0);
> +	fsleep(3000);
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ov2735_supply_name),
> +				    ov2735->supplies);
> +	if (ret) {
> +		dev_err(ov2735->dev, "failed to enable regulators\n");
> +		return ret;
> +	}
> +
> +	gpiod_set_value_cansleep(ov2735->enable_gpio, 1);
> +	fsleep(3000);
> +
> +	gpiod_set_value_cansleep(ov2735->reset_gpio, 0);
> +	fsleep(3000);
> +
> +	ret = clk_prepare_enable(ov2735->xclk);
> +	if (ret) {
> +		dev_err(ov2735->dev, "failed to enable clock\n");
> +		goto err_regulator_off;
> +	}
> +
> +	/* 8192 cycles prior to first SCCB transaction */
> +	delay_us = DIV_ROUND_UP(8192, OV2735_XCLK_FREQ / 1000 / 1000);
> +	fsleep(delay_us);
> +
> +	return 0;
> +
> +err_regulator_off:
> +	regulator_bulk_disable(ARRAY_SIZE(ov2735_supply_name), ov2735->supplies);
> +	return ret;
> +}
> +
> +static int ov2735_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov2735 *ov2735 = to_ov2735(sd);
> +
> +	gpiod_set_value_cansleep(ov2735->enable_gpio, 1);
> +	clk_disable_unprepare(ov2735->xclk);
> +	gpiod_set_value_cansleep(ov2735->reset_gpio, 0);
> +	regulator_bulk_disable(ARRAY_SIZE(ov2735_supply_name), ov2735->supplies);
> +
> +	return 0;
> +}
> +
> +static int ov2735_get_regulators(struct ov2735 *ov2735)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(ov2735_supply_name); i++)
> +		ov2735->supplies[i].supply = ov2735_supply_name[i];
> +
> +	return devm_regulator_bulk_get(ov2735->dev,
> +				       ARRAY_SIZE(ov2735_supply_name),
> +				       ov2735->supplies);
> +}
> +
> +static int ov2735_identify_module(struct ov2735 *ov2735)
> +{
> +	u64 chip_id;
> +	int ret = 0;
> +
> +	ov2735_cci_read(ov2735, OV2735_REG_CHIPID, &chip_id, &ret);
> +	if (ret)
> +		return dev_err_probe(ov2735->dev, ret, "failed to read chip id %x\n",
> +				     OV2735_CHIPID);
> +
> +	if (chip_id != OV2735_CHIPID)
> +		return dev_err_probe(ov2735->dev, -EIO, "chip id mismatch: %x!=%llx\n",
> +				     OV2735_CHIPID, chip_id);
> +
> +	return 0;
> +}
> +
> +static int ov2735_parse_endpoint(struct ov2735 *ov2735)
> +{
> +	struct fwnode_handle *fwnode;
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};
> +	struct fwnode_handle *ep;
> +	int ret;
> +
> +	fwnode = dev_fwnode(ov2735->dev);
> +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!ep) {
> +		dev_err(ov2735->dev, "Failed to get next endpoint\n");
> +		return -ENXIO;
> +	}
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;
> +
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
> +		dev_err_probe(ov2735->dev, -EINVAL, "only 2 data lanes are supported\n");
> +		goto error_out;
> +	}

You leak the memory allocated by v4l2_fwnode_endpoint_alloc_parse()
here.

> +
> +	return 0;
> +
> +error_out:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +};
> +
> +static int ov2735_probe(struct i2c_client *client)
> +{
> +	struct ov2735 *ov2735;
> +	unsigned int xclk_freq;
> +	int ret;
> +
> +	ov2735 = devm_kzalloc(&client->dev, sizeof(*ov2735), GFP_KERNEL);
> +	if (!ov2735)
> +		return -ENOMEM;
> +
> +	ov2735->client = client;
> +	ov2735->dev = &client->dev;
> +
> +	v4l2_i2c_subdev_init(&ov2735->sd, client, &ov2735_subdev_ops);
> +	ov2735->sd.internal_ops = &ov2735_internal_ops;
> +
> +	ov2735->cci = devm_cci_regmap_init_i2c(client, 8);
> +	if (IS_ERR(ov2735->cci)) {
> +		ret = PTR_ERR(ov2735->cci);
> +		return dev_err_probe(ov2735->dev, ret, "failed to initialize CCI\n");
> +	}
> +
> +	/* Set Current page to 0 */
> +	ov2735->current_page = 0;
> +	mutex_init(&ov2735->page_lock);
> +
> +	/* Get system clock (xvclk) */
> +	ov2735->xclk = devm_v4l2_sensor_clk_get(ov2735->dev, NULL);
> +	if (IS_ERR(ov2735->xclk)) {
> +		return dev_err_probe(ov2735->dev, PTR_ERR(ov2735->xclk),
> +				     "failed to get xclk\n");
> +	}
> +
> +	xclk_freq = clk_get_rate(ov2735->xclk);
> +	if (xclk_freq != OV2735_XCLK_FREQ)
> +		return dev_err_probe(ov2735->dev, -EINVAL,
> +				     "xclk frequency not supported: %d Hz\n",
> +				     xclk_freq);
> +
> +	ret = ov2735_get_regulators(ov2735);
> +	if (ret)
> +		return dev_err_probe(ov2735->dev, ret, "failed to get regulators\n");
> +
> +	ret = ov2735_parse_endpoint(ov2735);
> +	if (ret) {
> +		dev_err(ov2735->dev, "failed to parse endpoint configuration\n");
> +		return ret;
> +	}
> +
> +	ov2735->reset_gpio = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ov2735->reset_gpio))
> +		return dev_err_probe(ov2735->dev, PTR_ERR(ov2735->reset_gpio),
> +				     "failed to get reset GPIO\n");
> +
> +	ov2735->enable_gpio = devm_gpiod_get(&client->dev, "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(ov2735->enable_gpio))
> +		return dev_err_probe(ov2735->dev, PTR_ERR(ov2735->enable_gpio),
> +				     "failed to get enable GPIO\n");
> +
> +	ret = ov2735_power_on(ov2735->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = ov2735_identify_module(ov2735);
> +	if (ret)
> +		goto error_power_off;
> +
> +	/* This needs the pm runtime to be registered. */
> +	ret = ov2735_init_controls(ov2735);
> +	if (ret)
> +		goto error_power_off;
> +
> +	/* Initialize subdev */
> +	ov2735->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	ov2735->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	ov2735->pad.flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&ov2735->sd.entity, 1, &ov2735->pad);
> +	if (ret) {
> +		dev_err_probe(ov2735->dev, ret, "failed to init entity pads\n");
> +		goto error_handler_free;
> +	}
> +
> +	ov2735->sd.state_lock = ov2735->handler.lock;
> +	ret = v4l2_subdev_init_finalize(&ov2735->sd);
> +	if (ret < 0) {
> +		dev_err_probe(ov2735->dev, ret, "subdev init error\n");
> +		goto error_media_entity;
> +	}
> +
> +	pm_runtime_set_active(ov2735->dev);
> +	pm_runtime_enable(ov2735->dev);
> +
> +	ret = v4l2_async_register_subdev_sensor(&ov2735->sd);
> +	if (ret < 0) {
> +		dev_err_probe(ov2735->dev, ret,
> +			      "failed to register ov2735 sub-device\n");
> +		goto error_subdev_cleanup;
> +	}
> +
> +	pm_runtime_idle(ov2735->dev);
> +
> +	return 0;
> +
> +error_subdev_cleanup:
> +	v4l2_subdev_cleanup(&ov2735->sd);
> +	pm_runtime_disable(ov2735->dev);
> +	pm_runtime_set_suspended(ov2735->dev);
> +
> +error_media_entity:
> +	media_entity_cleanup(&ov2735->sd.entity);
> +
> +error_handler_free:
> +	v4l2_ctrl_handler_free(ov2735->sd.ctrl_handler);
> +
> +error_power_off:
> +	ov2735_power_off(ov2735->dev);
> +
> +	return ret;
> +}
> +
> +static void ov2735_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov2735 *ov2735 = to_ov2735(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(&ov2735->sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(ov2735->sd.ctrl_handler);
> +
> +	pm_runtime_disable(ov2735->dev);
> +	if (!pm_runtime_status_suspended(ov2735->dev))
> +		ov2735_power_off(ov2735->dev);
> +	pm_runtime_set_suspended(ov2735->dev);
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(ov2735_pm_ops,
> +				 ov2735_power_off, ov2735_power_on, NULL);
> +
> +static const struct of_device_id ov2735_id[] = {
> +	{ .compatible = "ovti,ov2735" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ov2735_id);
> +
> +static struct i2c_driver ov2735_driver = {
> +	.driver = {
> +		.name = "ov2735",
> +		.pm = pm_ptr(&ov2735_pm_ops),
> +		.of_match_table = ov2735_id,
> +	},
> +	.probe = ov2735_probe,
> +	.remove = ov2735_remove,
> +};
> +module_i2c_driver(ov2735_driver);
> +
> +MODULE_DESCRIPTION("OV2735 Camera Sensor Driver");
> +MODULE_AUTHOR("Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>");
> +MODULE_AUTHOR("Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>");
> +MODULE_LICENSE("GPL");

-- 
Regards,

Laurent Pinchart

