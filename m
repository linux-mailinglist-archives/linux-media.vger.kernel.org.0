Return-Path: <linux-media+bounces-28815-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E8FA72AA3
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 08:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1F9D1763A9
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 07:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA731FF7AA;
	Thu, 27 Mar 2025 07:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FnQxY3r8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2DF45C14;
	Thu, 27 Mar 2025 07:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743061025; cv=none; b=VrKdbqNDoYLHm8NS+r2MJOjTpkqZwf6Fb9rXsykcqBx7FJx3m7EojaI4w5r+0jcfwQO+r02khj+sGTzxrVmmzYwp+kxD0EV0V0X56JMrGIIpw7IxxW1xY078uVHHGpiQRqikMBBZIm/9aV06mjn04tUnAo1jXHLS+llJ0xQlGaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743061025; c=relaxed/simple;
	bh=sYB5mwVQrqSDPj2a349iIg/3EeEDcVc6OnSZUQ2aktM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owfIgIalkJZUt5h3aDL0PCsYP0TyV2n/ukiZ1mGvMAz0P5XALaUxUD1s5WjTGGjSwtQqWIRsCfKBU5UKt9qPU0nxXYhHhdWJcQvubMdSF4dlcVvx0rV9MuVcT6MIZbMl3KAZmnCxmnLBFyVPtfXGgXLRxSruC+dEmTPVJ24FrO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FnQxY3r8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743061022; x=1774597022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sYB5mwVQrqSDPj2a349iIg/3EeEDcVc6OnSZUQ2aktM=;
  b=FnQxY3r8a/U7goiJIpzFsJscz4hCbIhkZBYjkr3aIsyYL0ewPh3ny97B
   jmJfAGwyUAIYK/wOJAyam5AAANUz4S/LSc7c2hF2vFDmhL+VI2uPV0R0m
   KUKPIyQ5GKVUbQNgh+wgO96248lC3X5crnKw9bAfu0c+3jGPTsrq4hl9U
   l7siPj2VSK9bmhxo4VTt9AblVIQj7sFAc+21QaPunlZUtEKLQYnDP2VR4
   XcDjl77IpqB/N97fASFksj3dobaMVLgC9M+FntKiHI+6kJwo8FJgZw0gD
   +h0z07dV2yr55KcdzuQE7Yt04ZT83GJBt0Lv1T02cOuSKUIktaoFiLd+v
   w==;
X-CSE-ConnectionGUID: 7MB33pavT6qvJhw+fiuPOA==
X-CSE-MsgGUID: 7s/RXxG2TkiPYhIaFbJgMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55023384"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="55023384"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 00:37:01 -0700
X-CSE-ConnectionGUID: tisHvFhyR9KwHonnrWvQlQ==
X-CSE-MsgGUID: 2DhVbV9MSre+k2xV4+QOAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="156052008"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 00:36:57 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D7D1211F99F;
	Thu, 27 Mar 2025 09:36:54 +0200 (EET)
Date: Thu, 27 Mar 2025 07:36:54 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Hao Yao <hao.yao@intel.com>, Jim Lai <jim.lai@intel.com>,
	You-Sheng Yang <vicamo.yang@canonical.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: ov02e10: add OV02E10 image sensor
 driver
Message-ID: <Z-UAFkshOgeytfB4@kekkonen.localdomain>
References: <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-0-4d933ac8cff6@linaro.org>
 <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-2-4d933ac8cff6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-2-4d933ac8cff6@linaro.org>

Hi Bryan,

Thanks for the set. A few comments below.

On Tue, Mar 25, 2025 at 02:49:29PM +0000, Bryan O'Donoghue wrote:
> From: Jingjing Xiong <jingjing.xiong@intel.com>
> 
> Add in the ov02e10 driver from the Intel IPU6 repository.
> 
> Changelog to IPU6 incoming driver:
> 
> - handhake GPIO
>   The IPU6 handshake GPIO signals to the FPGA on IPU6/IPU7 laptops and as
>   such is not a sensor signal.
> 
>   Hans has a proposal for handling those GPIOs below. Dropf from the
>   incoming sensor driver.
> 
>   Link: https://lore.kernel.org/linux-media/4b87a956-a767-48dc-b98b-f80d9a44adc8@redhat.com
> 
> - Regulators
>   Change to regulator_bulk API to capture the full range of rails to the
>   o02e10 sensor.
> 
>   This will work for ACPI systems which only have the avdd rail available
>   as missing rails won't fail the regulator_bulk_* function calls.
> 
>   Convert the existing avdd single rail to regulator_bulk API.
> 
> - Clocks
> 
>   Move the MCLK validation logic to check_hwcfg() and move check_hwcfg()
>   to after devm_kzalloc() so that we can pass a struct ov02e pointer to
>   check_hwcfg() to begin to enumerate that structure.
> 
>   Reworks MCLK clock get logic to facilitate OF
> 
> - Power on/off
> 
>   Implement specification on and off delays on power-up
> 
>   The ov02e10 specification says for power-on:
> 
>   t3 = the time between dvdd stable and XSHUTDOWN deassert
>   t5 = the time between XSHUTDOWN deassert and SCCB ready
> 
>   The power-off path in the spec shows no required delays between XSHUTDOWN
>   and power-rail shut off but, if the reset GPIO is not defined no action is
>   taken to change its logical state.
> 
> - Remove dev_dbg() and extra dev_err()
> 
>   Several instances of dev_dbg() and dev_err() were removed.
>   dev_xxx() calls common in development can be stripped away for upstream.
> 
>   We have multiple on-list tests for this code on X86 and Arm so most of
>   the verbose dev_xxx() calls are redundant now.
> 
> - Add OF probe support
> 
>   Simple addition of ovti,0v02e10 compat string and associated resource
>   structure entry.
> 
> - Extend MODULE_AUTHOR list
>   Adds Hans, Alan and myself
> 
> Signed-off-by: Jingjing Xiong <jingjing.xiong@intel.com>
> Co-developed-by: Hao Yao <hao.yao@intel.com>
> Signed-off-by: Hao Yao <hao.yao@intel.com>
> Co-developed-by: Jim Lai <jim.lai@intel.com>
> Signed-off-by: Jim Lai <jim.lai@intel.com>
> Co-developed-by: You-Sheng Yang <vicamo.yang@canonical.com>
> Signed-off-by: You-Sheng Yang <vicamo.yang@canonical.com>
> Co-developed-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Co-developed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  MAINTAINERS                 |   9 +
>  drivers/media/i2c/Kconfig   |  10 +
>  drivers/media/i2c/Makefile  |   1 +
>  drivers/media/i2c/ov02e10.c | 982 ++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 1002 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 29b4471574982bf3f8d03158cd5edcb94bc9fab9..a090a8c75b7c5d3088ddc802a9192d51b1dc0c25 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17382,6 +17382,15 @@ T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
>  F:	drivers/media/i2c/ov02a10.c
>  
> +OMNIVISION OV02E10 SENSOR DRIVER
> +M:	Bryan O'Donoghue <bod@kernel.org>
> +M:	Hans de Goede <hansg@kernel.org>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media.git
> +F:	Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml
> +F:	drivers/media/i2c/ov02e10.c
> +
>  OMNIVISION OV08D10 SENSOR DRIVER
>  M:	Jimmy Su <jimmy.su@intel.com>
>  L:	linux-media@vger.kernel.org
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index e576b213084d232e90b7e556a7a855a3bb95544c..7b8af1c87a0e40c19ef8ddb9a8603a1962877163 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -356,6 +356,16 @@ config VIDEO_OV02A10
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called ov02a10.
>  
> +config VIDEO_OV02E10
> +	tristate "OmniVision OV02E10 sensor support"
> +	select V4L2_CCI_I2C
> +	help
> +	  This is a Video4Linux2 sensor driver for the OmniVision
> +	  OV02E10 camera.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called ov02e10.
> +
>  config VIDEO_OV08D10
>          tristate "OmniVision OV08D10 sensor support"
>          help
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 6c23a4463527cf762032df663bbfe26be29018c8..ed5e62fd6199d8c0ab0d3104fd353243021a11be 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -83,6 +83,7 @@ obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
>  obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
>  obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
>  obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
> +obj-$(CONFIG_VIDEO_OV02E10) += ov02e10.o
>  obj-$(CONFIG_VIDEO_OV08D10) += ov08d10.o
>  obj-$(CONFIG_VIDEO_OV08X40) += ov08x40.o
>  obj-$(CONFIG_VIDEO_OV13858) += ov13858.o
> diff --git a/drivers/media/i2c/ov02e10.c b/drivers/media/i2c/ov02e10.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..95b243766eae74e809b99cc4a8d6cdf9efbef245
> --- /dev/null
> +++ b/drivers/media/i2c/ov02e10.c
> @@ -0,0 +1,982 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2023 Intel Corporation.
> +
> +#include <linux/acpi.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +
> +#define OV02E10_LINK_FREQ_360MHZ	360000000ULL
> +#define OV02E10_SCLK			36000000LL
> +#define OV02E10_MCLK			19200000
> +#define OV02E10_DATA_LANES		2
> +#define OV02E10_RGB_DEPTH		10
> +
> +#define OV02E10_REG_PAGE_FLAG		CCI_REG8(0xfd)
> +#define OV02E10_PAGE_0			0x0
> +#define OV02E10_PAGE_1			0x1
> +#define OV02E10_PAGE_2			0x2
> +#define OV02E10_PAGE_3			0x3
> +#define OV02E10_PAGE_5			0x4
> +#define OV02E10_PAGE_7			0x5
> +#define OV02E10_PAGE_8			0x6
> +#define OV02E10_PAGE_9			0xF
> +#define OV02E10_PAGE_D			0x8
> +#define OV02E10_PAGE_E			0x9
> +#define OV02E10_PAGE_F			0xA
> +
> +#define OV02E10_REG_CHIP_ID		CCI_REG32(0x00)
> +#define OV02E10_CHIP_ID			0x45025610
> +
> +/* vertical-timings from sensor */
> +#define OV02E10_REG_VTS			CCI_REG16(0x35)
> +#define OV02E10_VTS_DEF			2244
> +#define OV02E10_VTS_MIN			2244
> +#define OV02E10_VTS_MAX			0x7fff
> +
> +/* horizontal-timings from sensor */
> +#define OV02E10_REG_HTS			CCI_REG16(0x37)
> +
> +/* Exposure controls from sensor */
> +#define OV02E10_REG_EXPOSURE		CCI_REG16(0x03)
> +#define OV02E10_EXPOSURE_MIN		1
> +#define OV02E10_EXPOSURE_MAX_MARGIN	2
> +#define OV02E10_EXPOSURE_STEP		1
> +
> +/* Analog gain controls from sensor */
> +#define OV02E10_REG_ANALOG_GAIN		CCI_REG8(0x24)
> +#define OV02E10_ANAL_GAIN_MIN		0x10
> +#define OV02E10_ANAL_GAIN_MAX		0xf8
> +#define OV02E10_ANAL_GAIN_STEP		1
> +
> +/* Digital gain controls from sensor */
> +#define OV02E10_REG_DIGITAL_GAIN	CCI_REG16(0x21)
> +#define OV02E10_DGTL_GAIN_MIN		256
> +#define OV02E10_DGTL_GAIN_MAX		1020
> +#define OV02E10_DGTL_GAIN_STEP		1
> +#define OV02E10_DGTL_GAIN_DEFAULT	256
> +
> +/* Register update control */
> +#define OV02E10_REG_COMMAND_UPDATE	CCI_REG8(0xE7)
> +#define OV02E10_COMMAND_UPDATE		0x00
> +#define OV02E10_COMMAND_HOLD		0x01
> +
> +/* Test Pattern Control */
> +#define OV02E10_REG_TEST_PATTERN	CCI_REG8(0x12)
> +#define OV02E10_TEST_PATTERN_ENABLE	BIT(0)
> +#define OV02E10_TEST_PATTERN_BAR_SHIFT	1
> +
> +enum {
> +	OV02E10_LINK_FREQ_360MHZ_INDEX,
> +};
> +
> +struct reg_sequence_list {
> +	u32 num_regs;
> +	const struct reg_sequence *regs;
> +};
> +
> +struct ov02e10_mode {
> +	/* Frame width in pixels */
> +	u32 width;
> +
> +	/* Frame height in pixels */
> +	u32 height;
> +
> +	/* Horizontal timining size */
> +	u32 hts;
> +
> +	/* Default vertical timining size */
> +	u32 vts_def;
> +
> +	/* Min vertical timining size */
> +	u32 vts_min;
> +
> +	/* Link frequency needed for this resolution */
> +	u32 link_freq_index;
> +
> +	/* Sensor register settings for this resolution */
> +	const struct reg_sequence_list reg_list;
> +};
> +
> +static const struct reg_sequence mode_1928x1088_30fps_2lane[] = {
> +	{ 0xfd, 0x00 },
> +	{ 0x20, 0x00 },
> +	{ 0x20, 0x0b },
> +	{ 0x21, 0x02 },
> +	{ 0x10, 0x23 },
> +	{ 0xc5, 0x04 },
> +	{ 0x21, 0x00 },
> +	{ 0x14, 0x96 },
> +	{ 0x17, 0x01 },
> +	{ 0xfd, 0x01 },
> +	{ 0x03, 0x00 },
> +	{ 0x04, 0x04 },
> +	{ 0x05, 0x04 },
> +	{ 0x06, 0x62 },
> +	{ 0x07, 0x01 },
> +	{ 0x22, 0x80 },
> +	{ 0x24, 0xff },
> +	{ 0x40, 0xc6 },
> +	{ 0x41, 0x18 },
> +	{ 0x45, 0x3f },
> +	{ 0x48, 0x0c },
> +	{ 0x4c, 0x08 },
> +	{ 0x51, 0x12 },
> +	{ 0x52, 0x10 },
> +	{ 0x57, 0x98 },
> +	{ 0x59, 0x06 },
> +	{ 0x5a, 0x04 },
> +	{ 0x5c, 0x38 },
> +	{ 0x5e, 0x10 },
> +	{ 0x67, 0x11 },
> +	{ 0x7b, 0x04 },
> +	{ 0x81, 0x12 },
> +	{ 0x90, 0x51 },
> +	{ 0x91, 0x09 },
> +	{ 0x92, 0x21 },
> +	{ 0x93, 0x28 },
> +	{ 0x95, 0x54 },
> +	{ 0x9d, 0x20 },
> +	{ 0x9e, 0x04 },
> +	{ 0xb1, 0x9a },
> +	{ 0xb2, 0x86 },
> +	{ 0xb6, 0x3f },
> +	{ 0xb9, 0x30 },
> +	{ 0xc1, 0x01 },
> +	{ 0xc5, 0xa0 },
> +	{ 0xc6, 0x73 },
> +	{ 0xc7, 0x04 },
> +	{ 0xc8, 0x25 },
> +	{ 0xc9, 0x05 },
> +	{ 0xca, 0x28 },
> +	{ 0xcb, 0x00 },
> +	{ 0xcf, 0x16 },
> +	{ 0xd2, 0xd0 },
> +	{ 0xd7, 0x3f },
> +	{ 0xd8, 0x40 },
> +	{ 0xd9, 0x40 },
> +	{ 0xda, 0x44 },
> +	{ 0xdb, 0x3d },
> +	{ 0xdc, 0x3d },
> +	{ 0xdd, 0x3d },
> +	{ 0xde, 0x3d },
> +	{ 0xdf, 0xf0 },
> +	{ 0xea, 0x0f },
> +	{ 0xeb, 0x04 },
> +	{ 0xec, 0x29 },
> +	{ 0xee, 0x47 },
> +	{ 0xfd, 0x01 },
> +	{ 0x31, 0x01 },
> +	{ 0x27, 0x00 },
> +	{ 0x2f, 0x41 },
> +	{ 0xfd, 0x02 },
> +	{ 0xa1, 0x01 },
> +	{ 0xfd, 0x02 },
> +	{ 0x9a, 0x03 },
> +	{ 0xfd, 0x03 },
> +	{ 0x9d, 0x0f },
> +	{ 0xfd, 0x07 },
> +	{ 0x42, 0x00 },
> +	{ 0x43, 0xad },
> +	{ 0x44, 0x00 },
> +	{ 0x45, 0xa8 },
> +	{ 0x46, 0x00 },
> +	{ 0x47, 0xa8 },
> +	{ 0x48, 0x00 },
> +	{ 0x49, 0xad },
> +	{ 0xfd, 0x00 },
> +	{ 0xc4, 0x01 },
> +	{ 0xfd, 0x01 },
> +	{ 0x33, 0x03 },
> +	{ 0xfd, 0x00 },
> +	{ 0x20, 0x1f },
> +};
> +
> +static const char *const ov02e10_test_pattern_menu[] = {
> +	"Disabled",
> +	"Color Bar",
> +};
> +
> +static const s64 link_freq_menu_items[] = {
> +	OV02E10_LINK_FREQ_360MHZ,
> +};
> +
> +static const struct ov02e10_mode supported_modes[] = {
> +	{
> +		.width = 1928,
> +		.height = 1088,
> +		.hts = 534,
> +		.vts_def = 2244,
> +		.vts_min = 2244,
> +		.reg_list = {
> +			.num_regs = ARRAY_SIZE(mode_1928x1088_30fps_2lane),
> +			.regs = mode_1928x1088_30fps_2lane,
> +		},
> +		.link_freq_index = OV02E10_LINK_FREQ_360MHZ_INDEX,
> +	},
> +};
> +
> +static const char * const ov02e10_supply_names[] = {
> +	"dovdd",	/* Digital I/O power */
> +	"avdd",		/* Analog power */
> +	"dvdd",		/* Digital core power */
> +};
> +
> +struct ov02e10 {
> +	struct regmap *regmap;
> +	struct v4l2_subdev sd;
> +	struct media_pad pad;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +
> +	/* V4L2 Controls */
> +	struct v4l2_ctrl *link_freq;
> +	struct v4l2_ctrl *pixel_rate;
> +	struct v4l2_ctrl *vblank;
> +	struct v4l2_ctrl *hblank;
> +	struct v4l2_ctrl *exposure;
> +
> +	struct clk *img_clk;
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(ov02e10_supply_names)];
> +	struct gpio_desc *reset;
> +
> +	/* Current mode */
> +	const struct ov02e10_mode *cur_mode;
> +
> +	/* To serialize asynchronous callbacks */
> +	struct mutex mutex;
> +
> +	/* Streaming on/off */
> +	bool streaming;
> +};
> +
> +static inline struct ov02e10 *to_ov02e10(struct v4l2_subdev *subdev)
> +{
> +	return container_of(subdev, struct ov02e10, sd);
> +}
> +
> +static u64 to_pixel_rate(u32 f_index)
> +{
> +	u64 pixel_rate = link_freq_menu_items[f_index] * 2 * OV02E10_DATA_LANES;
> +
> +	do_div(pixel_rate, OV02E10_RGB_DEPTH);

The pixel rate control is for the pixel rate on the pixel array, not on the
CSI-2 interface. Without binning or sub-sampling these may the same still,
but this only works in special cases really.

> +
> +	return pixel_rate;
> +}
> +
> +static u64 to_pixels_per_line(u32 hts, u32 f_index)
> +{
> +	u64 ppl = hts * to_pixel_rate(f_index);
> +
> +	do_div(ppl, OV02E10_SCLK);
> +
> +	return ppl;
> +}
> +
> +static void ov02e10_test_pattern(struct ov02e10 *ov02e10, u32 pattern, int *pret)
> +{
> +	if (pattern)
> +		pattern = pattern << OV02E10_TEST_PATTERN_BAR_SHIFT |
> +		    OV02E10_TEST_PATTERN_ENABLE;
> +
> +	cci_write(ov02e10->regmap, OV02E10_REG_TEST_PATTERN, pattern, pret);
> +}
> +
> +static int ov02e10_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ov02e10 *ov02e10 = container_of(ctrl->handler,
> +					       struct ov02e10, ctrl_handler);
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02e10->sd);
> +	s64 exposure_max;
> +	int ret;
> +
> +	/* Propagate change of current control to all related controls */
> +	if (ctrl->id == V4L2_CID_VBLANK) {
> +		/* Update max exposure while meeting expected vblanking */
> +		exposure_max = ov02e10->cur_mode->height + ctrl->val -
> +		    OV02E10_EXPOSURE_MAX_MARGIN;
> +		__v4l2_ctrl_modify_range(ov02e10->exposure,
> +					 ov02e10->exposure->minimum,
> +					 exposure_max, ov02e10->exposure->step,
> +					 exposure_max);
> +	}
> +
> +	/* V4L2 controls values will be applied only when power is already up */
> +	if (!pm_runtime_get_if_in_use(&client->dev))
> +		return 0;

A newline would be nice here.

> +	ret = cci_write(ov02e10->regmap, OV02E10_REG_COMMAND_UPDATE,
> +			OV02E10_COMMAND_HOLD, NULL);

It's not wrong to do this, but do you need it? Additional writes do take
time and that increases the risks of the writes taking too long to make it
to the desired frame.

> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		cci_write(ov02e10->regmap, OV02E10_REG_PAGE_FLAG,
> +			  OV02E10_PAGE_1, &ret);
> +		cci_write(ov02e10->regmap, OV02E10_REG_ANALOG_GAIN,
> +			  ctrl->val, &ret);
> +		break;
> +
> +	case V4L2_CID_DIGITAL_GAIN:
> +		cci_write(ov02e10->regmap, OV02E10_REG_PAGE_FLAG,
> +			  OV02E10_PAGE_1, &ret);
> +		cci_write(ov02e10->regmap, OV02E10_REG_DIGITAL_GAIN,
> +			  ctrl->val, &ret);
> +		break;
> +
> +	case V4L2_CID_EXPOSURE:
> +		cci_write(ov02e10->regmap, OV02E10_REG_PAGE_FLAG,
> +			  OV02E10_PAGE_1, &ret);
> +		cci_write(ov02e10->regmap, OV02E10_REG_EXPOSURE,
> +			  ctrl->val, &ret);
> +		break;
> +
> +	case V4L2_CID_VBLANK:
> +		cci_write(ov02e10->regmap, OV02E10_REG_PAGE_FLAG,
> +			  OV02E10_PAGE_1, &ret);
> +		cci_write(ov02e10->regmap, OV02E10_REG_VTS,
> +			  ov02e10->cur_mode->height + ctrl->val, &ret);
> +		break;
> +
> +	case V4L2_CID_TEST_PATTERN:
> +		cci_write(ov02e10->regmap, OV02E10_REG_PAGE_FLAG,
> +			  OV02E10_PAGE_1, &ret);
> +		ov02e10_test_pattern(ov02e10, ctrl->val, &ret);
> +		break;
> +
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	cci_write(ov02e10->regmap, OV02E10_REG_COMMAND_UPDATE,
> +		  OV02E10_COMMAND_UPDATE, &ret);
> +
> +	pm_runtime_put(&client->dev);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops ov02e10_ctrl_ops = {
> +	.s_ctrl = ov02e10_set_ctrl,
> +};
> +
> +static int ov02e10_init_controls(struct ov02e10 *ov02e10)
> +{
> +	struct v4l2_ctrl_handler *ctrl_hdlr;
> +	const struct ov02e10_mode *cur_mode;
> +	s64 exposure_max, h_blank, pixel_rate;
> +	u32 vblank_min, vblank_max, vblank_default;
> +	int size;
> +	int ret;
> +
> +	ctrl_hdlr = &ov02e10->ctrl_handler;
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
> +

Extra newline.

There's no need to check for an error here either: v4l2_ctrl_handle_init()
will set the handler's error code, too.

> +	if (ret)
> +		return ret;
> +
> +	ctrl_hdlr->lock = &ov02e10->mutex;
> +	cur_mode = ov02e10->cur_mode;
> +	size = ARRAY_SIZE(link_freq_menu_items);
> +
> +	ov02e10->link_freq =
> +	    v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov02e10_ctrl_ops,

Tab, please (instead of 4 spaces).

> +				   V4L2_CID_LINK_FREQ, size - 1, 0,
> +				   link_freq_menu_items);
> +	if (ov02e10->link_freq)
> +		ov02e10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	pixel_rate = to_pixel_rate(OV02E10_LINK_FREQ_360MHZ_INDEX);
> +	ov02e10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov02e10_ctrl_ops,
> +						V4L2_CID_PIXEL_RATE, 0,
> +						pixel_rate, 1, pixel_rate);
> +
> +	vblank_min = cur_mode->vts_min - cur_mode->height;
> +	vblank_max = OV02E10_VTS_MAX - cur_mode->height;
> +	vblank_default = cur_mode->vts_def - cur_mode->height;
> +	ov02e10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov02e10_ctrl_ops,
> +					    V4L2_CID_VBLANK, vblank_min,
> +					    vblank_max, 1, vblank_default);
> +
> +	h_blank = to_pixels_per_line(cur_mode->hts, cur_mode->link_freq_index);
> +	h_blank -= cur_mode->width;
> +	ov02e10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov02e10_ctrl_ops,
> +					    V4L2_CID_HBLANK, h_blank, h_blank,
> +					    1, h_blank);
> +	if (ov02e10->hblank)
> +		ov02e10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov02e10_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> +			  OV02E10_ANAL_GAIN_MIN, OV02E10_ANAL_GAIN_MAX,
> +			  OV02E10_ANAL_GAIN_STEP, OV02E10_ANAL_GAIN_MIN);
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov02e10_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
> +			  OV02E10_DGTL_GAIN_MIN, OV02E10_DGTL_GAIN_MAX,
> +			  OV02E10_DGTL_GAIN_STEP, OV02E10_DGTL_GAIN_DEFAULT);
> +	exposure_max = cur_mode->vts_def - OV02E10_EXPOSURE_MAX_MARGIN;
> +	ov02e10->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov02e10_ctrl_ops,
> +					      V4L2_CID_EXPOSURE,
> +					      OV02E10_EXPOSURE_MIN,
> +					      exposure_max,
> +					      OV02E10_EXPOSURE_STEP,
> +					      exposure_max);
> +	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov02e10_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(ov02e10_test_pattern_menu) - 1,
> +				     0, 0, ov02e10_test_pattern_menu);
> +	if (ctrl_hdlr->error)
> +		return ctrl_hdlr->error;
> +
> +	ov02e10->sd.ctrl_handler = ctrl_hdlr;
> +
> +	return 0;
> +}
> +
> +static void ov02e10_update_pad_format(const struct ov02e10_mode *mode,
> +				      struct v4l2_mbus_framefmt *fmt)
> +{
> +	fmt->width = mode->width;
> +	fmt->height = mode->height;
> +	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +	fmt->field = V4L2_FIELD_NONE;
> +}
> +
> +static int ov02e10_set_stream_mode(struct ov02e10 *ov02e10, u8 val)
> +{
> +	int ret = 0;
> +
> +	cci_write(ov02e10->regmap, OV02E10_REG_PAGE_FLAG, OV02E10_PAGE_0, &ret);
> +	cci_write(ov02e10->regmap, CCI_REG8(0xa0), val, &ret);
> +	cci_write(ov02e10->regmap, OV02E10_REG_PAGE_FLAG, OV02E10_PAGE_1, &ret);
> +	cci_write(ov02e10->regmap, CCI_REG8(0x01), 0x02, &ret);
> +
> +	return ret;
> +}
> +
> +static int ov02e10_start_streaming(struct ov02e10 *ov02e10)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02e10->sd);
> +	const struct reg_sequence_list *reg_list;
> +	int ret;
> +
> +	reg_list = &ov02e10->cur_mode->reg_list;
> +	ret = regmap_multi_reg_write(ov02e10->regmap, reg_list->regs,
> +				     reg_list->num_regs);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to set mode\n");
> +		return ret;
> +	}
> +	ret = __v4l2_ctrl_handler_setup(ov02e10->sd.ctrl_handler);
> +	if (ret) {
> +		dev_err(&client->dev, "setup V4L2 ctrl handler fail\n");
> +		return ret;
> +	}
> +
> +	return ov02e10_set_stream_mode(ov02e10, 1);
> +}
> +
> +static inline void ov02e10_stop_streaming(struct ov02e10 *ov02e10)
> +{
> +	ov02e10_set_stream_mode(ov02e10, 0);
> +}
> +
> +static int ov02e10_set_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct ov02e10 *ov02e10 = to_ov02e10(sd);
> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +	int ret = 0;
> +
> +	if (ov02e10->streaming == enable)
> +		return 0;
> +
> +	mutex_lock(&ov02e10->mutex);
> +	if (enable) {
> +		ret = pm_runtime_get_sync(&client->dev);
> +		if (ret < 0) {
> +			pm_runtime_put_noidle(&client->dev);
> +			mutex_unlock(&ov02e10->mutex);
> +			return ret;
> +		}
> +
> +		ret = ov02e10_start_streaming(ov02e10);
> +		if (ret) {
> +			enable = 0;
> +			ov02e10_stop_streaming(ov02e10);
> +			pm_runtime_put(&client->dev);
> +		}
> +	} else {
> +		ov02e10_stop_streaming(ov02e10);
> +		pm_runtime_put(&client->dev);
> +	}
> +
> +	ov02e10->streaming = enable;
> +	mutex_unlock(&ov02e10->mutex);
> +
> +	return ret;
> +}
> +
> +/* This function tries to get power control resources */
> +static int ov02e10_get_pm_resources(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov02e10 *ov02e10 = to_ov02e10(sd);
> +	int i;
> +
> +	ov02e10->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ov02e10->reset))
> +		return dev_err_probe(dev, PTR_ERR(ov02e10->reset),
> +				     "failed to get reset gpio\n");
> +
> +	for (i = 0; i < ARRAY_SIZE(ov02e10_supply_names); i++)
> +		ov02e10->supplies[i].supply = ov02e10_supply_names[i];
> +
> +	return devm_regulator_bulk_get(dev, ARRAY_SIZE(ov02e10_supply_names),
> +				       ov02e10->supplies);
> +}
> +
> +static int ov02e10_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov02e10 *ov02e10 = to_ov02e10(sd);
> +
> +	if (ov02e10->reset)
> +		gpiod_set_value_cansleep(ov02e10->reset, 1);
> +
> +	regulator_bulk_disable(ARRAY_SIZE(ov02e10_supply_names),
> +			       ov02e10->supplies);
> +
> +	clk_disable_unprepare(ov02e10->img_clk);
> +
> +	return 0;
> +}
> +
> +static int ov02e10_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov02e10 *ov02e10 = to_ov02e10(sd);
> +	int ret;
> +
> +	ret = clk_prepare_enable(ov02e10->img_clk);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable imaging clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ov02e10_supply_names),
> +				    ov02e10->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable regulators\n");
> +		goto disable_clk;
> +	}
> +
> +	if (ov02e10->reset) {
> +		usleep_range(5000, 5100);
> +		gpiod_set_value_cansleep(ov02e10->reset, 0);
> +		usleep_range(8000, 8100);
> +	}
> +
> +	return 0;
> +
> +disable_clk:
> +	clk_disable_unprepare(ov02e10->img_clk);
> +
> +	return ret;
> +}
> +
> +static int __maybe_unused ov02e10_suspend(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov02e10 *ov02e10 = to_ov02e10(sd);
> +
> +	mutex_lock(&ov02e10->mutex);
> +	if (ov02e10->streaming)
> +		ov02e10_stop_streaming(ov02e10);
> +
> +	mutex_unlock(&ov02e10->mutex);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused ov02e10_resume(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov02e10 *ov02e10 = to_ov02e10(sd);
> +	int ret = 0;
> +
> +	mutex_lock(&ov02e10->mutex);
> +	if (!ov02e10->streaming)
> +		goto exit;
> +
> +	ret = ov02e10_start_streaming(ov02e10);
> +	if (ret) {
> +		ov02e10->streaming = false;
> +		ov02e10_stop_streaming(ov02e10);
> +	}
> +
> +exit:
> +	mutex_unlock(&ov02e10->mutex);
> +	return ret;
> +}
> +
> +static int ov02e10_set_format(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *sd_state,
> +			      struct v4l2_subdev_format *fmt)
> +{
> +	struct ov02e10 *ov02e10 = to_ov02e10(sd);
> +	const struct ov02e10_mode *mode;
> +	s32 vblank_def, h_blank;
> +
> +	mode = v4l2_find_nearest_size(supported_modes,
> +				      ARRAY_SIZE(supported_modes),
> +				      width, height, fmt->format.width,
> +				      fmt->format.height);
> +
> +	mutex_lock(&ov02e10->mutex);
> +	ov02e10_update_pad_format(mode, &fmt->format);
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		*v4l2_subdev_state_get_format(sd_state, fmt->pad) =
> +		    fmt->format;
> +	} else {
> +		ov02e10->cur_mode = mode;
> +		__v4l2_ctrl_s_ctrl(ov02e10->link_freq, mode->link_freq_index);
> +		__v4l2_ctrl_s_ctrl_int64(ov02e10->pixel_rate,
> +					 to_pixel_rate(mode->link_freq_index));
> +
> +		/* Update limits and set FPS to default */
> +		vblank_def = mode->vts_def - mode->height;
> +		__v4l2_ctrl_modify_range(ov02e10->vblank,
> +					 mode->vts_min - mode->height,
> +					 OV02E10_VTS_MAX - mode->height, 1,
> +					 vblank_def);
> +		__v4l2_ctrl_s_ctrl(ov02e10->vblank, vblank_def);
> +		h_blank = to_pixels_per_line(mode->hts, mode->link_freq_index) -
> +		    mode->width;
> +		__v4l2_ctrl_modify_range(ov02e10->hblank, h_blank, h_blank, 1,
> +					 h_blank);
> +	}
> +	mutex_unlock(&ov02e10->mutex);
> +
> +	return 0;
> +}
> +
> +static int ov02e10_get_format(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *sd_state,
> +			      struct v4l2_subdev_format *fmt)
> +{
> +	struct ov02e10 *ov02e10 = to_ov02e10(sd);
> +
> +	mutex_lock(&ov02e10->mutex);
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> +		fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad);
> +	else
> +		ov02e10_update_pad_format(ov02e10->cur_mode, &fmt->format);
> +
> +	mutex_unlock(&ov02e10->mutex);
> +
> +	return 0;
> +}
> +
> +static int ov02e10_enum_mbus_code(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	if (code->index > 0)
> +		return -EINVAL;
> +
> +	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +
> +	return 0;
> +}
> +
> +static int ov02e10_enum_frame_size(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *sd_state,
> +				   struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	if (fse->index >= ARRAY_SIZE(supported_modes))
> +		return -EINVAL;
> +
> +	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
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
> +static int ov02e10_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	struct ov02e10 *ov02e10 = to_ov02e10(sd);
> +
> +	mutex_lock(&ov02e10->mutex);
> +	ov02e10_update_pad_format(&supported_modes[0],
> +				  v4l2_subdev_state_get_format(fh->state, 0));
> +	mutex_unlock(&ov02e10->mutex);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_video_ops ov02e10_video_ops = {
> +	.s_stream = ov02e10_set_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops ov02e10_pad_ops = {
> +	.set_fmt = ov02e10_set_format,
> +	.get_fmt = ov02e10_get_format,
> +	.enum_mbus_code = ov02e10_enum_mbus_code,
> +	.enum_frame_size = ov02e10_enum_frame_size,
> +};
> +
> +static const struct v4l2_subdev_ops ov02e10_subdev_ops = {
> +	.video = &ov02e10_video_ops,
> +	.pad = &ov02e10_pad_ops,
> +};
> +
> +static const struct media_entity_operations ov02e10_subdev_entity_ops = {
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
> +static const struct v4l2_subdev_internal_ops ov02e10_internal_ops = {
> +	.open = ov02e10_open,
> +};
> +
> +static int ov02e10_identify_module(struct ov02e10 *ov02e10)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02e10->sd);
> +	int ret;
> +	u64 val;
> +
> +	ret = cci_write(ov02e10->regmap, OV02E10_REG_PAGE_FLAG,
> +			OV02E10_PAGE_0, NULL);
> +	cci_read(ov02e10->regmap, OV02E10_REG_CHIP_ID, &val, &ret);
> +	if (ret)
> +		return ret;
> +
> +	if (val != OV02E10_CHIP_ID) {
> +		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
> +			OV02E10_CHIP_ID, (u32)val);
> +		return -ENXIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ov02e10_check_hwcfg(struct device *dev, struct ov02e10 *ov02e10)
> +{
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
> +	struct fwnode_handle *ep;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +	unsigned int i, j;
> +	int ret;
> +	u32 ext_clk;
> +
> +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!ep)
> +		return dev_err_probe(dev, -EPROBE_DEFER,
> +				     "waiting for fwnode graph endpoint\n");
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "parsing endpoint failed\n");
> +
> +	ov02e10->img_clk = devm_clk_get_optional(dev, NULL);
> +	if (IS_ERR(ov02e10->img_clk)) {
> +		ret = dev_err_probe(dev, PTR_ERR(ov02e10->img_clk),
> +				    "failed to get imaging clock\n");
> +		goto out_err;
> +	}
> +
> +	if (ov02e10->img_clk) {
> +		ext_clk = clk_get_rate(ov02e10->img_clk);
> +	} else {
> +		ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> +					       &ext_clk);
> +		if (ret) {
> +			dev_err(dev, "can't get clock frequency\n");
> +			goto out_err;
> +		}
> +	}
> +
> +	if (ext_clk != OV02E10_MCLK) {
> +		dev_err(dev, "external clock %d is not supported\n",
> +			ext_clk);
> +		ret = -EINVAL;
> +		goto out_err;
> +	}
> +
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV02E10_DATA_LANES) {
> +		dev_err(dev, "number of CSI2 data lanes %d is not supported\n",
> +			bus_cfg.bus.mipi_csi2.num_data_lanes);
> +		ret = -EINVAL;
> +		goto out_err;
> +	}
> +
> +	if (!bus_cfg.nr_of_link_frequencies) {
> +		dev_err(dev, "no link frequencies defined\n");
> +		ret = -EINVAL;
> +		goto out_err;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) {
> +		for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) {
> +			if (link_freq_menu_items[i] ==
> +				bus_cfg.link_frequencies[j])
> +				break;
> +		}
> +
> +		if (j == bus_cfg.nr_of_link_frequencies) {
> +			dev_err(dev, "no link frequency %lld supported\n",
> +				link_freq_menu_items[i]);
> +			ret = -EINVAL;
> +			goto out_err;
> +		}
> +	}

Please use v4l2_link_freq_to_bitmap() instead.

> +
> +out_err:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +}
> +
> +static void ov02e10_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov02e10 *ov02e10 = to_ov02e10(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(sd->ctrl_handler);
> +	pm_runtime_disable(&client->dev);

	pm_runtime_set_suspended(&client->dev);

> +	mutex_destroy(&ov02e10->mutex);
> +}
> +
> +static int ov02e10_probe(struct i2c_client *client)
> +{
> +	struct ov02e10 *ov02e;
> +	int ret;
> +
> +	ov02e = devm_kzalloc(&client->dev, sizeof(*ov02e), GFP_KERNEL);
> +	if (!ov02e)
> +		return -ENOMEM;
> +
> +	/* Check HW config */
> +	ret = ov02e10_check_hwcfg(&client->dev, ov02e);
> +	if (ret)
> +		return ret;
> +
> +	/* Initialize subdev */
> +	ov02e->regmap = devm_cci_regmap_init_i2c(client, 8);
> +	if (IS_ERR(ov02e->regmap))
> +		return PTR_ERR(ov02e->regmap);
> +
> +	v4l2_i2c_subdev_init(&ov02e->sd, client, &ov02e10_subdev_ops);
> +	ov02e10_get_pm_resources(&client->dev);
> +
> +	ret = ov02e10_power_on(&client->dev);
> +	if (ret) {
> +		dev_err_probe(&client->dev, ret, "failed to power on\n");
> +		goto error_power_off;

Really?

> +	}
> +
> +	/* Check module identity */
> +	ret = ov02e10_identify_module(ov02e);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to find sensor: %d\n", ret);
> +		goto error_power_off;
> +	}
> +
> +	/* Set default mode to max resolution */
> +	ov02e->cur_mode = &supported_modes[0];
> +
> +	ret = ov02e10_init_controls(ov02e);
> +	if (ret)
> +		return ret;

I think you're missing releasing the control handler here. Also the sensor
will remain powered on.

> +
> +	/* Initialize subdev */
> +	ov02e->sd.internal_ops = &ov02e10_internal_ops;
> +	ov02e->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	ov02e->sd.entity.ops = &ov02e10_subdev_entity_ops;
> +	ov02e->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +	/* Initialize source pad */
> +	ov02e->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&ov02e->sd.entity, 1, &ov02e->pad);
> +	if (ret)
> +		goto error_handler_free;
> +
> +	ret = v4l2_async_register_subdev_sensor(&ov02e->sd);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "async reg subdev error\n");
> +		goto error_media_entity;
> +	}
> +
> +	/*
> +	 * Device is already turned on by i2c-core with ACPI domain PM.
> +	 * Enable runtime PM and turn off the device.
> +	 */
> +	pm_runtime_set_active(&client->dev);
> +	pm_runtime_enable(&client->dev);

Note that Runtime PM must be enabled before registering the async
sub-device (for further sensor access may immediately follow).

> +	pm_runtime_idle(&client->dev);
> +
> +	return 0;
> +
> +error_media_entity:
> +	media_entity_cleanup(&ov02e->sd.entity);
> +
> +error_handler_free:
> +	v4l2_ctrl_handler_free(ov02e->sd.ctrl_handler);
> +	mutex_destroy(&ov02e->mutex);
> +
> +error_power_off:
> +	ov02e10_power_off(&client->dev);
> +
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops ov02e10_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(ov02e10_suspend, ov02e10_resume)
> +	SET_RUNTIME_PM_OPS(ov02e10_power_off, ov02e10_power_on, NULL)
> +};
> +
> +static const struct acpi_device_id ov02e10_acpi_ids[] = {
> +	{ "OVTI02E1" },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(acpi, ov02e10_acpi_ids);
> +
> +static const struct of_device_id ov02e10_of_match[] = {
> +	{ .compatible = "ovti,ov02e10" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ov02e10_of_match);
> +
> +static struct i2c_driver ov02e10_i2c_driver = {
> +	.driver = {
> +		.name = "ov02e10",
> +		.pm = &ov02e10_pm_ops,
> +		.acpi_match_table = ov02e10_acpi_ids,
> +		.of_match_table = ov02e10_of_match,
> +	},
> +	.probe = ov02e10_probe,
> +	.remove = ov02e10_remove,
> +};
> +
> +module_i2c_driver(ov02e10_i2c_driver);
> +
> +MODULE_AUTHOR("Jingjing Xiong <jingjing.xiong@intel.com>");
> +MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
> +MODULE_AUTHOR("Alan Stern <stern@rowland.harvard.edu>");
> +MODULE_AUTHOR("Bryan O'Donoghue <bryan.odonoghue@linaro.org>");
> +MODULE_DESCRIPTION("OmniVision OV02E10 sensor driver");
> +MODULE_LICENSE("GPL v2");

-- 
Kind regards,

Sakari Ailus

