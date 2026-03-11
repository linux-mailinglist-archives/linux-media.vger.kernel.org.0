Return-Path: <linux-media+bounces-55386-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNO0MLJqsWnsugIAu9opvQ
	(envelope-from <linux-media+bounces-55386-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:14:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C66DE2643D8
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 23D69306B59E
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1852FD7BE;
	Wed, 11 Mar 2026 13:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NyzXT+Pg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9531282F01;
	Wed, 11 Mar 2026 13:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234461; cv=none; b=PKySt+jv3KwB5MI6m5wvQGmrADAnilc+NaYSaetY05S/HCRlkSOXwQLMM4gJCOMmnjzrcfe411C8F/acEp6hEmHBLVEOCPEWydIl8TFpUAjqZFQmTTy6LwiOtv752EufjYh5rb4lJHbWKVsaul37hP5Pj8E0dgP6Sm7nxuUJz3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234461; c=relaxed/simple;
	bh=ZkH42djHZBQ5Vb4aIIZLN+QDdTUgHYkwvCVo/FBBN7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFEEex8mgY69CqH7luM+GxUiMDPHNtD6C8LNUOyRlTcB7WL0ZwlBngNXXlRJhiG2FE36JA/LCP+tDQnZOWfOk50+iBVqxlhvrh+EilhKgdFEuSe30xWJesfWg+GZ2mO4YlO2J3PtsW+L/8skQArNubnGGktfNEe99xj9WozKRBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NyzXT+Pg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773234459; x=1804770459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZkH42djHZBQ5Vb4aIIZLN+QDdTUgHYkwvCVo/FBBN7Q=;
  b=NyzXT+PgZCURvjwcwMGCiPDSNS7grqDm58glGXFIb8ob1zE3rzr8QC2o
   CeOe8jYlF0g6ZYJF5BzlEqYrpUAMs1WEL6bjAkxtI0DS1d/L20kdXiD0B
   5W3NBgt/exhh0pygNAUNPmMOrtN9AcQjKle6u2mxDZiAiSAASrLk0O475
   KhgMuzekzqs0ixebymgPC2kVxN2/mOQ0JoQV0ncqyEP175AUm/tJCWgOO
   Qe4xcLQMnYn6KEU+0kC+fOBOB+rA5/VliARahgFZ+fNQKAGQ89oVSLoo0
   PC0Zr5MbVB8X3eGivP6FIe9ROpjtg9P1mPwqp+Re/+x5NMIA6mpCwF41Y
   A==;
X-CSE-ConnectionGUID: hqJ02n+yT0meBzRfmU5ccw==
X-CSE-MsgGUID: 2DwZhoDFQTqIltZsr5OOAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85387619"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="85387619"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 06:07:38 -0700
X-CSE-ConnectionGUID: DJML2bk7Q+uXfgj/mjgxrw==
X-CSE-MsgGUID: D5oMrSykRQydBU4fs157/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="217129194"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.171])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 06:07:33 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 625D412185C;
	Wed, 11 Mar 2026 15:09:28 +0200 (EET)
Date: Wed, 11 Mar 2026 15:09:28 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Walter Werner Schneider <contact@schnwalter.eu>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] media: i2c: Add ov2732 image sensor driver
Message-ID: <abFpiEwlGB6gNL3j@kekkonen.localdomain>
References: <20260105-ov2732-driver-v6-0-95c1b0b0ba7b@schnwalter.eu>
 <20260105-ov2732-driver-v6-2-95c1b0b0ba7b@schnwalter.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-ov2732-driver-v6-2-95c1b0b0ba7b@schnwalter.eu>
X-Rspamd-Queue-Id: C66DE2643D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55386-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[schnwalter.eu:email,ideasonboard.com:email,intel.com:dkim,siliconsignals.io:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,kekkonen.localdomain:mid]
X-Rspamd-Action: no action

Hi Walter,

Thanks for the update.

I have a few comments below, can you post a follow-up patch? I'll merge
this set.

On Mon, Jan 05, 2026 at 02:30:53PM +0200, Walter Werner Schneider wrote:
> Add a V4L2 subdevice driver for the Omnivision OV2732 sensor.
> 
> The OV2732 is a 1/4" color CMOS 1080p (1920x1080) HD image sensor with
> programmable controls like: gain, exposure, frame rate, image and windowing
> size, horizontal mirror, vertical flip, cropping.
> 
> Signed-off-by: Walter Werner Schneider <contact@schnwalter.eu>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  MAINTAINERS                |   1 +
>  drivers/media/i2c/Kconfig  |  13 +
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/ov2732.c | 794 +++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 809 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 231d5b8df21bc5f3dc6ee5d765ed4027c9772f9a..aa94dd27c9457c4f73d28a6c13baff929a816a7f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19313,6 +19313,7 @@ M:	Walter Werner Schneider <contact@schnwalter.eu>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml
> +F:	drivers/media/i2c/ov2732.c
>  
>  OMNIVISION OV2735 SENSOR DRIVER
>  M:	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 4b4db8c4f49657e19018535927eb41f7ad2a4f80..9dc60091c99b18d034d78efda4eff501dedc5d33 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -477,6 +477,19 @@ config VIDEO_OV2685
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called ov2685.
>  
> +config VIDEO_OV2732
> +	tristate "OmniVision OV2732 sensor support"
> +	depends on OF
> +	select MEDIA_CONTROLLER
> +	select V4L2_CCI_I2C
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  This is a Video4Linux2 sensor driver for the OmniVision
> +	  OV2732 camera.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called ov2732.
> +
>  config VIDEO_OV2735
>  	tristate "OmniVision OV2735 sensor support"
>  	select V4L2_CCI_I2C
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index c5f17602454ffaa698a925f508244a7ddbb60e0f..d6435ea5cc12fdada181bf3e2885ceff4d5a23fa 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -96,6 +96,7 @@ obj-$(CONFIG_VIDEO_OV2640) += ov2640.o
>  obj-$(CONFIG_VIDEO_OV2659) += ov2659.o
>  obj-$(CONFIG_VIDEO_OV2680) += ov2680.o
>  obj-$(CONFIG_VIDEO_OV2685) += ov2685.o
> +obj-$(CONFIG_VIDEO_OV2732) += ov2732.o
>  obj-$(CONFIG_VIDEO_OV2735) += ov2735.o
>  obj-$(CONFIG_VIDEO_OV2740) += ov2740.o
>  obj-$(CONFIG_VIDEO_OV4689) += ov4689.o
> diff --git a/drivers/media/i2c/ov2732.c b/drivers/media/i2c/ov2732.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..d33e7b6e3762f0e93e199f36dc2d77f95ec5b414
> --- /dev/null
> +++ b/drivers/media/i2c/ov2732.c
> @@ -0,0 +1,794 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ov2732 driver
> + *
> + * Copyright (C) 2017 Fuzhou Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2025 Walter Werner Schneider <contact@schnwalter.eu>

2026, too?

> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +
> +#define OV2732_LANES				2
> +#define OV2732_BITS_PER_SAMPLE			10
> +#define OV2732_LINK_FREQ_DEFAULT		360000000
> +#define OV2732_XVCLK_FREQ			24000000
> +#define OV2732_PIXEL_RATE			\
> +	(OV2732_LINK_FREQ_DEFAULT * 2 * OV2732_LANES / OV2732_BITS_PER_SAMPLE)
> +#define OV2732_NATIVE_WIDTH			1920U
> +#define OV2732_NATIVE_HEIGHT			1080U
> +
> +/* Delay from power up to the first SCCB transaction. */
> +#define OV2732_POWER_UP_DELAY_CYCLES		8192
> +/* Delay from the last SCCB transaction to power down. */
> +#define OV2732_POWER_DOWN_DELAY_CYCLES		512
> +#define OV2732_DELAY_US(cycles)			\
> +	(DIV_ROUND_UP((cycles), OV2732_XVCLK_FREQ / USEC_PER_SEC))
> +
> +#define OV2732_REG_CHIP_ID			CCI_REG24(0x300a)
> +#define OV2732_CHIP_ID				0x002732
> +
> +#define OV2732_REG_MODE_SELECT			CCI_REG8(0x0100)
> +#define OV2732_MODE_STANDBY			0x00
> +#define OV2732_MODE_STREAMING			0x01
> +
> +#define OV2732_REG_ANALOGUE_GAIN		CCI_REG16(0x3508)
> +#define OV2732_REG_DIGITAL_GAIN			CCI_REG16(0x350a)
> +#define OV2732_REG_EXPOSURE			CCI_REG24(0x3500)
> +#define OV2732_REG_HTS				CCI_REG16(0x380c)
> +#define OV2732_REG_VTS				CCI_REG16(0x380e)
> +#define OV2732_ANALOGUE_GAIN_MIN		0x80
> +/* Max analogue gain is documented as 0x3fff, but it overflows after 0x3ff. */
> +#define OV2732_ANALOGUE_GAIN_MAX		0x3ff
> +#define OV2732_ANALOGUE_GAIN_DEFAULT		0x80
> +#define OV2732_DIGITAL_GAIN_MIN			0x00
> +#define OV2732_DIGITAL_GAIN_MAX			0x3fff
> +#define OV2732_DIGITAL_GAIN_DEFAULT		0x0400
> +#define OV2732_EXPOSURE_DEFAULT			0x40
> +#define OV2732_EXPOSURE_MIN			0x10
> +#define OV2732_EXPOSURE_OFFSET			4
> +#define OV2732_HBLANK_DEFAULT			0x0068
> +#define OV2732_VTS_MAX				0x7fff
> +
> +#define OV2732_REG_TEST_PATTERN			CCI_REG8(0x5080)
> +#define OV2732_TEST_PATTERN_DISABLE		0x00
> +#define OV2732_TEST_PATTERN_BAR1		0x80
> +#define OV2732_TEST_PATTERN_BAR2		0x84
> +#define OV2732_TEST_PATTERN_BAR3		0x88
> +#define OV2732_TEST_PATTERN_BAR4		0x8c
> +#define OV2732_TEST_PATTERN_BAR5		0xC0
> +#define OV2732_TEST_PATTERN_RANDOM		0x81
> +#define OV2732_TEST_PATTERN_SQUARES_C		0x82
> +#define OV2732_TEST_PATTERN_SQUARES_BW		0x92
> +
> +static const char * const ov2732_supply_names[] = {
> +	"avdd", /* Analog power */
> +	"dovdd", /* Digital I/O power */
> +	"dvdd", /* Digital core power */
> +};
> +
> +static const struct cci_reg_sequence ov2732_common_regs[] = {
> +	/* PLL control, reset all registers. */
> +	{ CCI_REG8(0x0103), 0x01 },
> +
> +	/* Analog control. */
> +	{ CCI_REG8(0x3600), 0x55 },
> +	{ CCI_REG8(0x3601), 0x52 },
> +	{ CCI_REG8(0x3612), 0xb5 },
> +	{ CCI_REG8(0x3613), 0xb3 },
> +	{ CCI_REG8(0x3616), 0x83 },
> +	{ CCI_REG8(0x3621), 0x00 },
> +	{ CCI_REG8(0x3624), 0x06 },
> +	{ CCI_REG8(0x3642), 0x88 },
> +	{ CCI_REG8(0x3660), 0x00 },
> +	{ CCI_REG8(0x3661), 0x00 },
> +	{ CCI_REG8(0x366a), 0x64 },
> +	{ CCI_REG8(0x366c), 0x00 },
> +	{ CCI_REG8(0x366e), 0xff },
> +	{ CCI_REG8(0x366f), 0xff },
> +	{ CCI_REG8(0x3677), 0x11 },
> +	{ CCI_REG8(0x3678), 0x11 },
> +	{ CCI_REG8(0x3679), 0x0c },
> +	{ CCI_REG8(0x3680), 0xff },
> +	{ CCI_REG8(0x3681), 0x16 },
> +	{ CCI_REG8(0x3682), 0x16 },
> +	{ CCI_REG8(0x3683), 0x90 },
> +	{ CCI_REG8(0x3684), 0x90 },
> +
> +	/* ADC sync control. */
> +	{ CCI_REG8(0x4503), 0x00 },
> +	{ CCI_REG8(0x4508), 0x14 },
> +	{ CCI_REG8(0x450a), 0x00 },
> +	{ CCI_REG8(0x450b), 0x40 },
> +
> +	/* ISP control, enable: WIN, DPC & ISP. */
> +	{ CCI_REG8(0x5000), 0xa1 },
> +};
> +
> +struct ov2732_mode {
> +	u32 width;
> +	u32 height;
> +	u32 vts;
> +};
> +
> +static const struct ov2732_mode supported_modes[] = {
> +	{
> +		.width = 1920,
> +		.height = 1080,
> +		.vts = 1184,
> +	},
> +};
> +
> +struct ov2732 {
> +	struct device *dev;
> +	struct regmap *regmap;
> +
> +	struct media_pad pad;
> +	struct v4l2_subdev sd;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct v4l2_ctrl *hblank;
> +	struct v4l2_ctrl *vblank;
> +	struct v4l2_ctrl *exposure;
> +
> +	struct clk *xvclk;
> +	u32 xvclk_freq;
> +	struct gpio_desc *powerdown_gpio;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(ov2732_supply_names)];
> +};
> +
> +#define to_ov2732(_sd) container_of(_sd, struct ov2732, sd)
> +
> +static const s64 link_freq_menu_items[] = {
> +	OV2732_LINK_FREQ_DEFAULT,
> +};
> +
> +static const char * const ov2732_test_pattern_menu[] = {
> +	"Disabled",
> +	"Vertical Color Bar Type 1",
> +	"Vertical Color Bar Type 2",
> +	"Vertical Color Bar Type 3",
> +	"Vertical Color Bar Type 4",
> +	"Vertical Color Bar Type 5",
> +	"Random",
> +	"Color Squares",
> +	"Black and White Squares",
> +};
> +
> +static const int ov2732_test_pattern_val[] = {
> +	OV2732_TEST_PATTERN_DISABLE,
> +	OV2732_TEST_PATTERN_BAR1,
> +	OV2732_TEST_PATTERN_BAR2,
> +	OV2732_TEST_PATTERN_BAR3,
> +	OV2732_TEST_PATTERN_BAR4,
> +	OV2732_TEST_PATTERN_BAR5,
> +	OV2732_TEST_PATTERN_RANDOM,
> +	OV2732_TEST_PATTERN_SQUARES_C,
> +	OV2732_TEST_PATTERN_SQUARES_BW,
> +};
> +
> +static int ov2732_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov2732 *ov2732 = to_ov2732(sd);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ov2732_supply_names),
> +				    ov2732->supplies);
> +	if (ret) {
> +		dev_err(dev, "failed to enable regulators\n");
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(ov2732->xvclk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clock\n");
> +		goto reg_off;
> +	}
> +
> +	/* Wait 10ms before power up, as per datasheet. */
> +	fsleep(10 * USEC_PER_MSEC);
> +
> +	gpiod_set_value_cansleep(ov2732->reset_gpio, 0);
> +	gpiod_set_value_cansleep(ov2732->powerdown_gpio, 0);
> +
> +	/* Datasheet requires an 8192 cycles wait, but that isn't enough. */
> +	fsleep(OV2732_DELAY_US(OV2732_POWER_UP_DELAY_CYCLES * 2));
> +
> +	return 0;
> +
> +reg_off:
> +	regulator_bulk_disable(ARRAY_SIZE(ov2732_supply_names),
> +			       ov2732->supplies);
> +
> +	return ret;
> +}
> +
> +static int ov2732_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov2732 *ov2732 = to_ov2732(sd);
> +
> +	clk_disable_unprepare(ov2732->xvclk);
> +
> +	/* Wait for 512 cycles as per datasheet. */
> +	fsleep(OV2732_DELAY_US(OV2732_POWER_DOWN_DELAY_CYCLES));
> +
> +	gpiod_set_value_cansleep(ov2732->powerdown_gpio, 1);
> +	gpiod_set_value_cansleep(ov2732->reset_gpio, 1);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(ov2732_supply_names),
> +			       ov2732->supplies);
> +
> +	return 0;
> +}
> +
> +static int ov2732_identify_chip(struct ov2732 *ov2732)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov2732->sd);
> +	int ret;
> +	u64 val;
> +
> +	ret = cci_read(ov2732->regmap, OV2732_REG_CHIP_ID, &val, NULL);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "failed to read chip id\n");
> +
> +	if (val != OV2732_CHIP_ID)
> +		return dev_err_probe(&client->dev, -ENODEV,
> +				     "chip id mismatch: %x!=%llx\n",
> +				     OV2732_CHIP_ID, val);
> +
> +	return 0;
> +}
> +
> +static int ov2732_enum_mbus_code(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state,
> +				 struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	if (code->index != 0)
> +		return -EINVAL;
> +
> +	code->code = MEDIA_BUS_FMT_SBGGR10_1X10;
> +
> +	return 0;
> +}
> +
> +static int ov2732_enum_frame_size(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state,
> +				  struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	if (fse->index >= ARRAY_SIZE(supported_modes))
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
> +static int ov2732_set_fmt(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_state *state,
> +			  struct v4l2_subdev_format *fmt)
> +{
> +	struct ov2732 *ov2732 = to_ov2732(sd);
> +	const struct ov2732_mode *mode;
> +	s64 vblank_def;
> +	int ret;
> +
> +	mode = v4l2_find_nearest_size(supported_modes,
> +				      ARRAY_SIZE(supported_modes),
> +				      width, height,
> +				      fmt->format.width, fmt->format.height);
> +
> +	fmt->format.code = MEDIA_BUS_FMT_SBGGR10_1X10;
> +	fmt->format.width = mode->width;
> +	fmt->format.height = mode->height;
> +	fmt->format.field = V4L2_FIELD_NONE;
> +	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
> +	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_601;
> +	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
> +
> +	*v4l2_subdev_state_get_format(state, fmt->pad) = fmt->format;
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> +		return 0;
> +
> +	vblank_def = mode->vts - mode->height;
> +	ret = __v4l2_ctrl_modify_range(ov2732->vblank, vblank_def,
> +				       OV2732_VTS_MAX - mode->height, 1,
> +				       vblank_def);
> +
> +	return ret;
> +}
> +
> +static int ov2732_get_selection(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *state,
> +				struct v4l2_subdev_selection *sel)
> +{
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP:
> +		sel->r = *v4l2_subdev_state_get_crop(state, 0);
> +		return 0;
> +
> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +		sel->r.top = 0;
> +		sel->r.left = 0;
> +		sel->r.width = OV2732_NATIVE_WIDTH;
> +		sel->r.height = OV2732_NATIVE_HEIGHT;
> +
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int ov2732_enable_streams(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state, u32 pad,
> +				 u64 streams_mask)
> +{
> +	struct ov2732 *ov2732 = to_ov2732(sd);
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov2732->sd);
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(&client->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set stream off register for PLL changes. */
> +	ret = cci_write(ov2732->regmap, OV2732_REG_MODE_SELECT,
> +			OV2732_MODE_STANDBY, NULL);
> +	if (ret)
> +		goto err_put_autosuspend;
> +
> +	/* Send all registers that are common to all modes */
> +	ret = cci_multi_reg_write(ov2732->regmap, ov2732_common_regs,
> +				  ARRAY_SIZE(ov2732_common_regs), NULL);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to init registers\n");
> +		goto err_put_autosuspend;
> +	}
> +
> +	/* Apply customized values from user */
> +	ret =  __v4l2_ctrl_handler_setup(ov2732->sd.ctrl_handler);
> +	if (ret)
> +		goto err_put_autosuspend;
> +
> +	/* Set stream on register */
> +	ret = cci_write(ov2732->regmap, OV2732_REG_MODE_SELECT,
> +			OV2732_MODE_STREAMING, NULL);
> +	if (ret)
> +		goto err_put_autosuspend;
> +
> +	return 0;
> +
> +err_put_autosuspend:
> +	pm_runtime_put_autosuspend(&client->dev);
> +
> +	return ret;
> +}
> +
> +static int ov2732_disable_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state, u32 pad,
> +				  u64 streams_mask)
> +{
> +	struct ov2732 *ov2732 = to_ov2732(sd);
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov2732->sd);
> +	int ret;
> +
> +	/* set stream off register */
> +	ret = cci_write(ov2732->regmap, OV2732_REG_MODE_SELECT,
> +			OV2732_MODE_STANDBY, NULL);
> +	if (ret)
> +		dev_err(&client->dev, "%s failed to set stream\n", __func__);
> +
> +	/* Wait for 512 cycles as per datasheet. */
> +	fsleep(OV2732_DELAY_US(OV2732_POWER_DOWN_DELAY_CYCLES));
> +
> +	pm_runtime_put_autosuspend(&client->dev);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_subdev_video_ops ov2732_video_ops = {
> +	.s_stream = v4l2_subdev_s_stream_helper,
> +};
> +
> +static const struct v4l2_subdev_pad_ops ov2732_pad_ops = {
> +	.enum_mbus_code = ov2732_enum_mbus_code,
> +	.enum_frame_size = ov2732_enum_frame_size,
> +	.get_fmt = v4l2_subdev_get_fmt,
> +	.set_fmt = ov2732_set_fmt,
> +	.get_selection = ov2732_get_selection,
> +	.enable_streams = ov2732_enable_streams,
> +	.disable_streams = ov2732_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_ops ov2732_subdev_ops = {
> +	.video  = &ov2732_video_ops,
> +	.pad = &ov2732_pad_ops,
> +};
> +
> +static int ov2732_init_state(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_state *sd_state)
> +{
> +	struct v4l2_subdev_format fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_TRY,
> +		.format = {
> +			.width = 1920,
> +			.height = 1080,
> +			.code = MEDIA_BUS_FMT_SBGGR10_1X10,
> +			.colorspace = V4L2_COLORSPACE_RAW,
> +			.field = V4L2_FIELD_NONE,
> +			.quantization = V4L2_QUANTIZATION_FULL_RANGE,
> +			.xfer_func = V4L2_XFER_FUNC_NONE,
> +			.ycbcr_enc = V4L2_YCBCR_ENC_601,
> +		}
> +	};
> +
> +	return ov2732_set_fmt(sd, sd_state, &fmt);
> +}
> +
> +static const struct v4l2_subdev_internal_ops ov2732_internal_ops = {
> +	.init_state = ov2732_init_state,
> +};
> +
> +static int ov2732_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ov2732 *ov2732 =
> +		container_of(ctrl->handler, struct ov2732, ctrl_handler);
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov2732->sd);
> +	const struct v4l2_mbus_framefmt *format;
> +	struct v4l2_subdev_state *state;
> +	int ret = 0;
> +
> +	state = v4l2_subdev_get_locked_active_state(&ov2732->sd);
> +	format = v4l2_subdev_state_get_format(state, 0);
> +
> +	if (ctrl->id == V4L2_CID_VBLANK) {
> +		int exposure_max, exposure_def;
> +
> +		exposure_max = format->height + ctrl->val -
> +			       OV2732_EXPOSURE_OFFSET;
> +		exposure_def = exposure_max;
> +		ret = __v4l2_ctrl_modify_range(ov2732->exposure,
> +					       OV2732_EXPOSURE_MIN,
> +					       exposure_max,
> +					       ov2732->exposure->step,
> +					       exposure_def);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (pm_runtime_get_if_in_use(&client->dev) == 0)
> +		return 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		cci_write(ov2732->regmap, OV2732_REG_ANALOGUE_GAIN,
> +			  ctrl->val, &ret);
> +		break;
> +	case V4L2_CID_DIGITAL_GAIN:
> +		cci_write(ov2732->regmap, OV2732_REG_DIGITAL_GAIN,
> +			  ctrl->val, &ret);
> +		break;
> +	case V4L2_CID_EXPOSURE:
> +		/* Lowest 4 bits are fraction bits. */
> +		cci_write(ov2732->regmap, OV2732_REG_EXPOSURE,
> +			  ((u32)ctrl->val) << 4, &ret);

The parentheses here are redundant.

> +		break;
> +	case V4L2_CID_VBLANK:
> +		cci_write(ov2732->regmap, OV2732_REG_VTS,
> +			  (format->height + ctrl->val), &ret);

Ditto.

> +		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		cci_write(ov2732->regmap, OV2732_REG_TEST_PATTERN,
> +			  ov2732_test_pattern_val[ctrl->val], &ret);
> +		break;
> +	default:
> +		dev_info(&client->dev,
> +			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
> +			 ctrl->id, ctrl->val);
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	pm_runtime_put(&client->dev);
> +
> +	return ret;
> +};
> +
> +static const struct v4l2_ctrl_ops ov2732_ctrl_ops = {
> +	.s_ctrl = ov2732_set_ctrl,
> +};
> +
> +static int ov2732_init_controls(struct ov2732 *ov2732)
> +{
> +	const struct ov2732_mode *mode = &supported_modes[0];
> +	struct v4l2_ctrl_handler *handler;
> +	struct v4l2_ctrl *ctrl;
> +	struct v4l2_fwnode_device_properties props;
> +	s64 exposure_max, vblank_def, vblank_max;
> +	int ret;
> +
> +	handler = &ov2732->ctrl_handler;
> +	ret = v4l2_ctrl_handler_init(handler, 10);
> +
> +	v4l2_ctrl_new_std(handler, NULL, V4L2_CID_PIXEL_RATE,
> +			  OV2732_PIXEL_RATE, OV2732_PIXEL_RATE,
> +			  1, OV2732_PIXEL_RATE);
> +
> +	ctrl = v4l2_ctrl_new_int_menu(handler, &ov2732_ctrl_ops,
> +				      V4L2_CID_LINK_FREQ, 0, 0,
> +				      link_freq_menu_items);
> +	if (ctrl)
> +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	ov2732->hblank = v4l2_ctrl_new_std(handler, &ov2732_ctrl_ops,
> +					   V4L2_CID_HBLANK,
> +					   OV2732_HBLANK_DEFAULT,
> +					   OV2732_HBLANK_DEFAULT,
> +					   1, OV2732_HBLANK_DEFAULT);
> +	if (ov2732->hblank)
> +		ov2732->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	vblank_def = mode->vts - mode->height;
> +	vblank_max = OV2732_VTS_MAX - mode->height;
> +	ov2732->vblank = v4l2_ctrl_new_std(handler, &ov2732_ctrl_ops,
> +					   V4L2_CID_VBLANK,
> +					   vblank_def, vblank_max,
> +					   1, vblank_def);
> +
> +	exposure_max = mode->vts - OV2732_EXPOSURE_OFFSET;
> +	ov2732->exposure = v4l2_ctrl_new_std(handler, &ov2732_ctrl_ops,
> +					     V4L2_CID_EXPOSURE,
> +					     OV2732_EXPOSURE_MIN, exposure_max,
> +					     1, OV2732_EXPOSURE_DEFAULT);
> +
> +	v4l2_ctrl_new_std(handler, &ov2732_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> +			  OV2732_ANALOGUE_GAIN_MIN, OV2732_ANALOGUE_GAIN_MAX,
> +			  1, OV2732_ANALOGUE_GAIN_DEFAULT);
> +
> +	v4l2_ctrl_new_std(handler, &ov2732_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
> +			  OV2732_DIGITAL_GAIN_MIN, OV2732_DIGITAL_GAIN_MAX,
> +			  1, OV2732_DIGITAL_GAIN_DEFAULT);
> +
> +	v4l2_ctrl_new_std_menu_items(handler, &ov2732_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(ov2732_test_pattern_menu) - 1,
> +				     0, 0, ov2732_test_pattern_menu);
> +
> +	if (handler->error) {
> +		ret = handler->error;
> +		dev_err_probe(ov2732->dev, ret, "Control init failed\n");
> +		goto err_handler_free;
> +	}
> +
> +	ret = v4l2_fwnode_device_parse(ov2732->dev, &props);
> +	if (ret)
> +		goto err_handler_free;
> +
> +	ret = v4l2_ctrl_new_fwnode_properties(handler, &ov2732_ctrl_ops, &props);
> +	if (ret)
> +		goto err_handler_free;
> +
> +	ov2732->sd.ctrl_handler = handler;
> +
> +	return 0;
> +
> +err_handler_free:
> +	v4l2_ctrl_handler_free(handler);
> +
> +	return ret;
> +}
> +
> +static int ov2632_probe_dt(struct ov2732 *ov2732)
> +{
> +	struct fwnode_handle *ep;
> +	struct fwnode_handle *fwnode = dev_fwnode(ov2732->dev);
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};
> +	int ret;
> +
> +	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
> +	if (!ep)
> +		return dev_err_probe(ov2732->dev, -EPROBE_DEFER,
> +				     "waiting for fwnode graph endpoint\n");

You can remove the above check with this
<URL:https://lore.kernel.org/linux-media/20260310141157.1186325-1-sakari.ailus@linux.intel.com/T/#u>.
I intend to merge it with the first driver that depeds on it.

> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret) {
> +		dev_err_probe(ov2732->dev, -EINVAL, "could not parse endpoint\n");
> +		goto err_probe_dt;
> +	}
> +
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV2732_LANES) {
> +		dev_err(ov2732->dev, "only a 2-lane CSI2 config is supported\n");
> +		ret = -EINVAL;
> +	}
> +
> +err_probe_dt:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +}
> +
> +static int ov2732_get_regulators(struct ov2732 *ov2732)
> +{
> +	for (unsigned int i = 0; i < ARRAY_SIZE(ov2732_supply_names); i++)
> +		ov2732->supplies[i].supply = ov2732_supply_names[i];
> +
> +	return devm_regulator_bulk_get(ov2732->dev,
> +				       ARRAY_SIZE(ov2732_supply_names),
> +				       ov2732->supplies);
> +}
> +
> +static int ov2732_probe(struct i2c_client *client)
> +{
> +	struct ov2732 *ov2732;
> +	int ret;
> +
> +	ov2732 = devm_kzalloc(&client->dev, sizeof(*ov2732), GFP_KERNEL);
> +	if (!ov2732)
> +		return -ENOMEM;
> +
> +	ov2732->dev = &client->dev;
> +
> +	ret = ov2632_probe_dt(ov2732);
> +	if (ret)
> +		return ret;
> +
> +	ov2732->xvclk = devm_v4l2_sensor_clk_get(ov2732->dev, NULL);
> +	if (IS_ERR(ov2732->xvclk))
> +		return dev_err_probe(ov2732->dev, PTR_ERR(ov2732->xvclk),
> +				     "failed to get xvclk\n");
> +
> +	ov2732->xvclk_freq = clk_get_rate(ov2732->xvclk);
> +	if (ov2732->xvclk_freq != OV2732_XVCLK_FREQ)
> +		return dev_err_probe(ov2732->dev, -EINVAL,
> +				     "xvclk frequency not supported: %dHz\n",
> +				      ov2732->xvclk_freq);
> +
> +	ov2732->powerdown_gpio = devm_gpiod_get_optional(ov2732->dev,
> +							 "powerdown",
> +							 GPIOD_OUT_HIGH);
> +
> +	ov2732->reset_gpio = devm_gpiod_get_optional(ov2732->dev, "reset",
> +						     GPIOD_OUT_HIGH);
> +
> +	ov2732->regmap = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(ov2732->regmap))
> +		return dev_err_probe(ov2732->dev, PTR_ERR(ov2732->regmap),
> +				     "failed to init CCI\n");
> +
> +	ret = ov2732_get_regulators(ov2732);
> +	if (ret)
> +		return dev_err_probe(ov2732->dev, ret,
> +				     "failed to get regulators\n");
> +
> +	v4l2_i2c_subdev_init(&ov2732->sd, client, &ov2732_subdev_ops);
> +
> +	/* Device must be powered on for ov2732_identify_chip(). */
> +	ret = ov2732_power_on(ov2732->dev);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_set_active(ov2732->dev);
> +	pm_runtime_enable(ov2732->dev);
> +
> +	ret = ov2732_identify_chip(ov2732);
> +	if (ret)
> +		goto err_power_off;
> +
> +	ret = ov2732_init_controls(ov2732);
> +	if (ret)
> +		goto err_power_off;
> +
> +	/* Initialize subdev */
> +	ov2732->sd.internal_ops = &ov2732_internal_ops;
> +	ov2732->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	ov2732->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +	/* Initialize source pad */
> +	ov2732->pad.flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&ov2732->sd.entity, 1, &ov2732->pad);
> +	if (ret) {
> +		dev_err_probe(ov2732->dev, ret, "failed to init entity pads\n");
> +		goto error_handler_free;
> +	}
> +
> +	ov2732->sd.state_lock = ov2732->ctrl_handler.lock;
> +	ret = v4l2_subdev_init_finalize(&ov2732->sd);
> +	if (ret < 0) {
> +		dev_err_probe(ov2732->dev, ret, "subdev init error\n");
> +		goto err_media_entity;
> +	}
> +
> +	ret = v4l2_async_register_subdev_sensor(&ov2732->sd);
> +	if (ret < 0) {
> +		dev_err_probe(ov2732->dev, ret,
> +			      "failed to register sensor sub-device\n");
> +		goto err_subdev_cleanup;
> +	}
> +
> +	pm_runtime_set_autosuspend_delay(ov2732->dev, 1000);
> +	pm_runtime_use_autosuspend(ov2732->dev);
> +	pm_runtime_idle(ov2732->dev);
> +
> +	return 0;
> +
> +err_subdev_cleanup:
> +	v4l2_subdev_cleanup(&ov2732->sd);
> +
> +err_media_entity:
> +	media_entity_cleanup(&ov2732->sd.entity);
> +
> +error_handler_free:
> +	v4l2_ctrl_handler_free(&ov2732->ctrl_handler);
> +
> +err_power_off:
> +	pm_runtime_disable(ov2732->dev);
> +	pm_runtime_set_suspended(ov2732->dev);
> +	ov2732_power_off(ov2732->dev);
> +
> +	return ret;
> +}
> +
> +static void ov2732_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov2732 *ov2732 = to_ov2732(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(&ov2732->ctrl_handler);
> +
> +	pm_runtime_disable(ov2732->dev);
> +	if (!pm_runtime_status_suspended(ov2732->dev)) {
> +		ov2732_power_off(ov2732->dev);
> +		pm_runtime_set_suspended(ov2732->dev);
> +	}
> +}
> +
> +static const struct of_device_id ov2732_of_match[] = {
> +	{ .compatible = "ovti,ov2732", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, ov2732_of_match);
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(ov2732_pm_ops, ov2732_power_off,
> +				 ov2732_power_on, NULL);
> +
> +static struct i2c_driver ov2732_i2c_driver = {
> +	.driver = {
> +		.name = "ov2732",
> +		.of_match_table = ov2732_of_match,
> +		.pm = pm_sleep_ptr(&ov2732_pm_ops),
> +	},
> +	.probe = ov2732_probe,
> +	.remove = ov2732_remove,
> +};
> +module_i2c_driver(ov2732_i2c_driver);
> +
> +MODULE_DESCRIPTION("OmniVision ov2732 sensor driver");
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Walter Werner Schneider <contact@schnwalter.eu>");
> 

-- 
Kind regards,

Sakari Ailus

