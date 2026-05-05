Return-Path: <linux-media+bounces-60454-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EW5LmAY+mlrJQMAu9opvQ
	(envelope-from <linux-media+bounces-60454-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 18:18:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9774D11D6
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 18:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 374F130DC649
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 16:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F7848B38D;
	Tue,  5 May 2026 16:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nX8+zGju"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D9548B382;
	Tue,  5 May 2026 16:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997502; cv=none; b=iJUWHhpSlv+K5ZuxYodMUbIoGbXYrUvIXgi8Ye8SLfLFnRbT8paTtZoQAWVyhYmhs+wrBUorNPnLCT9sWiKeY54PYT8Q4tm8Ha0El4Yzn2FpRJj6TwmtCrMTSDlbaUIuICswRfd+/A0oOXxt9hzIcwTMgQkX4PcKnqIc41gxhNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997502; c=relaxed/simple;
	bh=qFkYvPJqeH7Oca3GH9Nvfv7XdMsrgC+ZjWvF00ttpVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhBf5BYAquhbo2Fv2McgDkvS+wNtpdYM4MbGKmxoKoQRmfmlbld9bgYreRHsGBAdWbYQXFqSe3qtx57HZd4SoPTglKTzgF0hbfOQ5lADFituhH6APk9JqK+Zge3jQ2qyh57vMB8FUzLQkjBykRrFXowblXBlHYBrQ12kxWkgf5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nX8+zGju; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78FBF1F8;
	Tue,  5 May 2026 18:11:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777997494;
	bh=qFkYvPJqeH7Oca3GH9Nvfv7XdMsrgC+ZjWvF00ttpVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nX8+zGjuiQ825PuIDMAGQPwnNrqj8Cavb+J5+BImhACdpBoSAkfG5ljvXVRMOMo3D
	 qzXloX+vFWhQsDNP4gF6I6zeSpkX7IQUb7nrPKVqVEf3NIiQbNVJZvib8GvPE2M9Wt
	 Ac6Isz1kleXV9wG75I05nEGoVqf/EwD0Rzohg8W4=
Date: Tue, 5 May 2026 19:11:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>, devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [RFC PATCH v3 2/2] media: i2c: Add onsemi AR0234 image sensor
 driver
Message-ID: <20260505161135.GD1547435@killaraus.ideasonboard.com>
References: <20260306103614.3208182-1-eagle.alexander923@gmail.com>
 <20260306103614.3208182-3-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306103614.3208182-3-eagle.alexander923@gmail.com>
X-Rspamd-Queue-Id: EE9774D11D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60454-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[vger.kernel.org,raspberrypi.com,intel.com,kernel.org,linux.intel.com,oss.qualcomm.com,linaro.org,foss.st.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.com:url,raspberrypi.com:email,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,kurokesu.com:email]

Hi Alexander,

(Dropping recipients whose e-mail addresses bounce)

Thank you for the patch.

On Fri, Mar 06, 2026 at 01:36:14PM +0300, Alexander Shiyan wrote:
> Add driver for the onsemi AR0234 CMOS image sensor.
> 
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  drivers/media/i2c/Kconfig  |   12 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/ar0234.c | 1309 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 1322 insertions(+)
>  create mode 100644 drivers/media/i2c/ar0234.c
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 5eb1e0e0a87a..02450c89d9b0 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -51,6 +51,18 @@ config VIDEO_ALVIUM_CSI2
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called alvium-csi2.
>  
> +config VIDEO_AR0234
> +	tristate "onsemi AR0234 sensor support"
> +	depends on ACPI || OF || COMPILE_TEST
> +	select V4L2_CCI_I2C
> +	select VIDEO_CCS_PLL

I really like this :-)

> +	help
> +	  This is a Video4Linux2 sensor driver for the onsemi
> +	  AR0234 camera.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called ar0234.
> +
>  config VIDEO_AR0521
>  	tristate "ON Semiconductor AR0521 sensor support"
>  	help
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index a3a6396df3c4..89e06afaa120 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_VIDEO_AK7375) += ak7375.o
>  obj-$(CONFIG_VIDEO_AK881X) += ak881x.o
>  obj-$(CONFIG_VIDEO_ALVIUM_CSI2) += alvium-csi2.o
>  obj-$(CONFIG_VIDEO_APTINA_PLL) += aptina-pll.o
> +obj-$(CONFIG_VIDEO_AR0234) += ar0234.o
>  obj-$(CONFIG_VIDEO_AR0521) += ar0521.o
>  obj-$(CONFIG_VIDEO_BT819) += bt819.o
>  obj-$(CONFIG_VIDEO_BT856) += bt856.o
> diff --git a/drivers/media/i2c/ar0234.c b/drivers/media/i2c/ar0234.c
> new file mode 100644
> index 000000000000..f2486f5f5363
> --- /dev/null
> +++ b/drivers/media/i2c/ar0234.c
> @@ -0,0 +1,1309 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Driver for the onsemi AR0234 camera sensor
> + *
> + * Copyright (C) 2026 Alexander Shiyan <eagle.alexander923@gmail.com>
> + *
> + * Some parts of code taken from Raspberry Pi driver ar0234.c by:
> + * Copyright (C) 2021, Raspberry Pi (Trading) Ltd
> + * Copyright (C) 2025-2026, UAB Kurokesu
> + * Author: Dave Stevenson <dave.stevenson@raspberrypi.com>
> + * Author: Danius Kalvaitis <danius@kurokesu.com>
> + *
> + * Some parts of code taken from imx290.c by:
> + * Copyright (C) 2019 FRAMOS GmbH.
> + * Copyright (C) 2019 Linaro Ltd.
> + * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/gpio/consumer.h>

Please sort the headers alphabetically, gpio/consumer.h goes just after
delay.h.

> +#include <linux/regulator/consumer.h>
> +#include <media/mipi-csi2.h>
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-subdev.h>
> +
> +#include "ccs-pll.h"
> +
> +#define AR0234_REG_CHIP_VERSION				CCI_REG16(0x3000)
> +#	define AR0234_CHIP_ID				(0x0a56)

No need for parentheses. Same below where applicable.

> +#	define AR0234_CHIP_ID_MONO			(0x1a56)
> +#define AR0234_REG_Y_ADDR_START				CCI_REG16(0x3002)
> +#define AR0234_REG_X_ADDR_START				CCI_REG16(0x3004)
> +#define AR0234_REG_Y_ADDR_END				CCI_REG16(0x3006)
> +#define AR0234_REG_X_ADDR_END				CCI_REG16(0x3008)
> +#define AR0234_REG_FRAME_LENGTH_LINES			CCI_REG16(0x300a)
> +#	define AR0234_FRAME_LENGTH_LINES_MIN		(16)
> +#	define AR0234_VBLANK_MAX			(0xf000)
> +#define AR0234_REG_LINE_LENGTH_PCK			CCI_REG16(0x300c)
> +#	define AR0234_LINE_LENGTH_PCK_MIN		(612)
> +#	define AR0234_HBLANK_MAX			(0xf000)
> +#define AR0234_REG_REVISION_NUMBER			CCI_REG16(0x300e)
> +#define AR0234_REG_COARSE_INTEGRATION_TIME		CCI_REG16(0x3012)
> +#	define AR0234_EXPOSURE_MIN			(2)
> +#	define AR0234_EXPOSURE_STEP			(1)
> +#define AR0234_REG_FINE_INTEGRATION_TIME		CCI_REG16(0x3014)
> +#define AR0234_REG_RESET				CCI_REG16(0x301a)
> +#define AR0234_REG_MODE_SELECT				CCI_REG8(0x301c)
> +#define AR0234_REG_IMAGE_ORIENTATION			CCI_REG8(0x301d)
> +#define AR0234_REG_GROUPED_PARAMETER_HOLD		CCI_REG8(0x3022)
> +#define AR0234_REG_VT_PIX_CLK_DIV			CCI_REG16(0x302a)
> +#define AR0234_REG_VT_SYS_CLK_DIV			CCI_REG16(0x302c)
> +#define AR0234_REG_PRE_PLL_CLK_DIV			CCI_REG16(0x302e)
> +#define AR0234_REG_PLL_MULTIPLIER			CCI_REG16(0x3030)
> +#define AR0234_REG_OP_PIX_CLK_DIV			CCI_REG16(0x3036)
> +#define AR0234_REG_OP_SYS_CLK_DIV			CCI_REG16(0x3038)
> +#define AR0234_REG_GLOBAL_GAIN				CCI_REG16(0x305e)
> +#	define AR0234_DGTL_GAIN_MIN			(0x0080)
> +#	define AR0234_DGTL_GAIN_MAX			(0x07ff)
> +#	define AR0234_DGTL_GAIN_DEFAULT			(0x0080)
> +#	define AR0234_DGTL_GAIN_STEP			(1)
> +#define AR0234_REG_ANALOG_GAIN				CCI_REG16(0x3060)
> +#	define AR0234_ANA_GAIN_BASE			(64)
> +#	define AR0234_ANA_GAIN_MIN			(AR0234_ANA_GAIN_BASE)
> +#	define AR0234_ANA_GAIN_MAX			(16 * AR0234_ANA_GAIN_BASE)
> +#	define AR0234_ANA_GAIN_STEP			(1)
> +#	define AR0234_ANA_GAIN_DEFAULT			(AR0234_ANA_GAIN_BASE)
> +#define AR0234_REG_TEST_PATTERN_MODE			CCI_REG16(0x3070)
> +#	define AR0234_TEST_PATTERN_DISABLED		(0)
> +#	define AR0234_TEST_PATTERN_SOLID_COLOR		(1)
> +#	define AR0234_TEST_PATTERN_VERTICAL_COLOR_BARS	(2)
> +#	define AR0234_TEST_PATTERN_FADE_TO_GREY		(3)
> +#	define AR0234_TEST_PATTERN_WALKING_1S		(256)
> +#define AR0234_REG_TEST_DATA_RED			CCI_REG16(0x3072)
> +#define AR0234_REG_TEST_DATA_GREENR			CCI_REG16(0x3074)
> +#define AR0234_REG_TEST_DATA_BLUE			CCI_REG16(0x3076)
> +#define AR0234_REG_TEST_DATA_GREENB			CCI_REG16(0x3078)
> +#	define AR0234_TESTP_COLOUR_MIN			(0)
> +#	define AR0234_TESTP_COLOUR_MAX			(0x3ff)
> +#	define AR0234_TESTP_COLOUR_STEP			(1)
> +#define AR0234_REG_MFR_30BA				CCI_REG16(0x30ba)
> +#	define AR0234_MFR_30BA_GAIN_BITS(x)		(0x7620 | (x))
> +#define AR0234_REG_DATA_FORMAT_BITS			CCI_REG16(0x31ac)
> +#	define DATA_FORMAT_BITS(x, y)			(((x) << 8) | (y))
> +#define AR0234_REG_SERIAL_FORMAT			CCI_REG16(0x31ae)
> +#	define DATA_FORMAT_LANES(x)			(0x200 | (x))
> +#define AR0234_REG_COMPANDING				CCI_REG16(0x31d0)
> +#	define COMPANDING_DPCM_EN			BIT(0)
> +#define AR0234_REG_MIPI_CNTRL				CCI_REG16(0x3354)
> +
> +#define AR0234_NATIVE_WIDTH				(1940U)
> +#define AR0234_NATIVE_HEIGHT				(1220U)
> +#define AR0234_PIXEL_ARRAY_LEFT				(8U)
> +#define AR0234_PIXEL_ARRAY_TOP				(8U)
> +#define AR0234_PIXEL_ARRAY_WIDTH			(1920U)
> +#define AR0234_PIXEL_ARRAY_HEIGHT			(1200U)
> +#define AR0234_MIN_CROP_WIDTH				(4U)
> +#define AR0234_MIN_CROP_HEIGHT				(2U)
> +#define AR0234_CROP_WIDTH_STEP				(4U)
> +#define AR0234_CROP_HEIGHT_STEP				(2U)

Where do those two step values come from ?

> +
> +static const struct cci_reg_sequence ar0234_common_init[] = {
> +	{ AR0234_REG_FINE_INTEGRATION_TIME, 0 },
> +};
> +
> +static const char *const ar0234_test_pattern_menu[] = {
> +	"Disabled",
> +	"Solid Color",
> +	"Vertical Color Bars",
> +	"Fade to Grey Vertical Color Bars",
> +	"Walking 1s",
> +};
> +
> +static const unsigned int ar0234_test_pattern_val[] = {
> +	AR0234_TEST_PATTERN_DISABLED,
> +	AR0234_TEST_PATTERN_SOLID_COLOR,
> +	AR0234_TEST_PATTERN_VERTICAL_COLOR_BARS,
> +	AR0234_TEST_PATTERN_FADE_TO_GREY,
> +	AR0234_TEST_PATTERN_WALKING_1S,
> +};
> +
> +static const char *const ar0234_supply_names[] = {
> +	"vaa",
> +	"vdd",
> +	"vddio",
> +};
> +
> +enum ar0234_colour_variant {
> +	AR0234_VARIANT_MONO,
> +	AR0234_VARIANT_COLOUR,
> +	AR0234_VARIANT_MAX
> +};
> +
> +enum ar0234_link_freq_index {
> +	AR0234_LINK_FREQ_IDX_BPP_8,
> +	AR0234_LINK_FREQ_IDX_BPP_10,
> +	AR0234_LINK_FREQ_IDX_MAX
> +};
> +
> +struct ar0234_mode {
> +	u8 bpp_in;
> +	u8 bpp_out;
> +	u8 dpcm;
> +	u8 mipi_dt;
> +	int link_freq_index;

I think you can drop this. The driver already uses the CCS PLL
calculator, so it should be able to deal with user-selectable link
frequencies.

This would require testing all frequencies specified in DT at probe time
to map them to bus formats, and restricting the formats accepted by the
driver based on the current link frequency. The CCS driver implements
such logic, and there's also an implementation in the ar0830 driver I'm
working on (see [1]). Note to myself (and to Sakari too): this is a good
candidate for a helper.

[1] https://gitlab.com/ideasonboard/nxp/linux/-/blob/v7.0/dev/rpi-cam/ar0830/drivers/media/i2c/ar0830.c?ref_type=heads

> +	u32 code[AR0234_VARIANT_MAX];
> +};
> +
> +static const struct ar0234_mode ar0234_modes[] = {
> +	{
> +		.bpp_in = 8,
> +		.bpp_out = 8,
> +		.dpcm = 0,
> +		.mipi_dt = MIPI_CSI2_DT_RAW8,
> +		.link_freq_index = AR0234_LINK_FREQ_IDX_BPP_8,
> +		.code = {
> +			[AR0234_VARIANT_MONO] = MEDIA_BUS_FMT_Y8_1X8,
> +			[AR0234_VARIANT_COLOUR] = MEDIA_BUS_FMT_SGRBG8_1X8,
> +		},
> +	},
> +	{
> +		.bpp_in = 10,
> +		.bpp_out = 10,
> +		.dpcm = 0,
> +		.mipi_dt = MIPI_CSI2_DT_RAW10,
> +		.link_freq_index = AR0234_LINK_FREQ_IDX_BPP_10,
> +		.code = {
> +			[AR0234_VARIANT_MONO] = MEDIA_BUS_FMT_Y10_1X10,
> +			[AR0234_VARIANT_COLOUR] = MEDIA_BUS_FMT_SGRBG10_1X10,
> +		},
> +	},
> +	{
> +		.bpp_in = 10,
> +		.bpp_out = 8,
> +		.dpcm = COMPANDING_DPCM_EN,
> +		.mipi_dt = MIPI_CSI2_DT_RAW10,
> +		.link_freq_index = AR0234_LINK_FREQ_IDX_BPP_8,
> +		.code = {
> +			[AR0234_VARIANT_COLOUR] =
> +				MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8,
> +		},
> +	},
> +};
> +
> +struct ar0234 {
> +	struct device *dev;
> +	struct clk *clk;
> +	struct regmap *regmap;
> +
> +	struct v4l2_subdev sd;
> +	struct media_pad pad;
> +
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(ar0234_supply_names)];
> +	struct gpio_desc *reset;
> +
> +	unsigned int num_data_lanes;
> +
> +	s64 link_freqs[AR0234_LINK_FREQ_IDX_MAX];
> +
> +	enum ar0234_colour_variant variant;
> +
> +	struct ccs_pll pll;
> +
> +	struct ar0234_mode const *mode;

It would be nice to drop this, and access the information through the
state. As far as I can tell, it will involve

- Looking up the mode by media bus code in .enable_streams()

- Passing the mode as a function argument to ar0234_set_link_limits().
  One of the callers already has the mode pointer, the other one
  (ar0234_ctrls_init()) can use the default ar0234_modes[0].

- Using the default ar0234_modes[0] in ar0234_init_state(), which is a
  good thing to do anyway as the state should be initialized to static
  values that don't depend on the active configuration.

> +	struct v4l2_rect crop;

The crop rectangle should be accessed through the active state only.

> +
> +	bool streaming;

This could also possibly be replaced by v4l2_subdev_is_streaming().

> +
> +	struct v4l2_ctrl_handler ctrls;
> +
> +	struct v4l2_ctrl *hblank;
> +	struct v4l2_ctrl *vblank;
> +	struct v4l2_ctrl *exposure;
> +	struct v4l2_ctrl *pixel_rate;
> +	struct v4l2_ctrl *link_freq;
> +	struct v4l2_ctrl *a_gain;
> +	struct {
> +		struct v4l2_ctrl *hflip;
> +		struct v4l2_ctrl *vflip;
> +	};
> +};
> +
> +static inline struct ar0234 *to_ar0234(struct v4l2_subdev *_sd)
> +{
> +	return container_of(_sd, struct ar0234, sd);
> +}
> +
> +static const struct ccs_pll_limits ar0234_pll_limits = {
> +	.min_ext_clk_freq_hz = 6000000,
> +	.max_ext_clk_freq_hz = 54000000,
> +	.vt_fr = {
> +		.min_pre_pll_clk_div = 1,
> +		.max_pre_pll_clk_div = 63,
> +		.min_pll_ip_clk_freq_hz = 6000000,
> +		.max_pll_ip_clk_freq_hz = 12000000,
> +		.min_pll_multiplier = 2,
> +		.max_pll_multiplier = 254,
> +		.min_pll_op_clk_freq_hz = 384000000,
> +		.max_pll_op_clk_freq_hz = 768000000,
> +	},
> +	.vt_bk = {
> +		.min_sys_clk_div = 1,
> +		.max_sys_clk_div = 31,
> +		.min_sys_clk_freq_hz = 6000000,
> +		.max_sys_clk_freq_hz = 768000000,
> +		.min_pix_clk_div = 1,
> +		.max_pix_clk_div = 31,
> +		.min_pix_clk_freq_hz = 6000000,
> +		.max_pix_clk_freq_hz = 90000000,
> +	},
> +	.op_bk = {
> +		.min_sys_clk_div = 1,
> +		.max_sys_clk_div = 31,
> +		.min_sys_clk_freq_hz = 6000000,
> +		.max_sys_clk_freq_hz = 768000000,
> +		.min_pix_clk_div = 1,
> +		.max_pix_clk_div = 31,
> +		.min_pix_clk_freq_hz = 6000000,
> +		.max_pix_clk_freq_hz = 90000000,
> +	},
> +};
> +
> +static int ar0234_calculate_pll(struct ar0234 *ar0234,
> +				const struct ar0234_mode *mode)
> +{
> +	struct ccs_pll pll = { 0 };
> +	int ret;
> +
> +	pll.bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
> +	pll.op_lanes = ar0234->num_data_lanes;
> +	pll.vt_lanes = 1;
> +	pll.csi2.lanes = ar0234->num_data_lanes;
> +	pll.binning_horizontal = 1;
> +	pll.binning_vertical = 1;
> +	pll.scale_m = 1;
> +	pll.scale_n = 1;
> +	pll.bits_per_pixel = mode->bpp_out;
> +	pll.flags = CCS_PLL_FLAG_LANE_SPEED_MODEL |
> +		    CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER |
> +		    CCS_PLL_FLAG_FIFO_DERATING |
> +		    CCS_PLL_FLAG_FIFO_OVERRATING |
> +		    CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER;
> +	pll.link_freq = ar0234->link_freqs[mode->link_freq_index] / 2;
> +	pll.ext_clk_freq_hz = clk_get_rate(ar0234->clk);
> +
> +	ret = ccs_pll_calculate(ar0234->dev, &ar0234_pll_limits, &pll);
> +	if (!ret)
> +		ar0234->pll = pll;
> +
> +	return ret;
> +}
> +
> +static u32 ar0234_calc_analog_gain(u32 req_gain_q6, u32 *reg_val)
> +{
> +	u32 s, t;
> +	u32 best_gain = 0;
> +	u32 best_reg = 0;
> +	u32 min_diff = U32_MAX;
> +	u32 coarse_mult, fine_gain_q6, total_gain_q6, diff;
> +
> +	for (s = 0; s <= 4; s++) {
> +		coarse_mult = (1 << s) * AR0234_ANA_GAIN_BASE;
> +
> +		for (t = 0; t <= 15; t++) {
> +			if (s == 0 || s == 2) {
> +				fine_gain_q6 =
> +					(AR0234_ANA_GAIN_BASE * 32) / (32 - t);
> +			} else if (s == 1 || s == 3) {
> +				fine_gain_q6 = (AR0234_ANA_GAIN_BASE * 16) /
> +					       (16 - (t / 2));
> +			} else {
> +				fine_gain_q6 = (AR0234_ANA_GAIN_BASE * 8) /
> +					       (8 - (t / 4));
> +			}
> +
> +			total_gain_q6 = (coarse_mult * fine_gain_q6) /
> +					AR0234_ANA_GAIN_BASE;
> +
> +			if (req_gain_q6 > total_gain_q6)
> +				diff = req_gain_q6 - total_gain_q6;
> +			else
> +				diff = total_gain_q6 - req_gain_q6;
> +
> +			if (diff < min_diff) {
> +				min_diff = diff;
> +				best_gain = total_gain_q6;
> +				best_reg = (s << 4) | t;
> +			}
> +		}
> +	}

It would be better to expose the ANALOG_GAIN register directly to
userspace (or, to be precise, bits [6:0] for context A). There's no need
to linearize the gain in the kernel.

> +
> +	*reg_val = best_reg;
> +
> +	return best_gain;
> +}
> +
> +static int ar0234_set_mfr_30ba(struct ar0234 *ar0234, u32 analog_reg_val)
> +{
> +	u16 mfr_30ba_val;
> +	u32 coarse_idx = (analog_reg_val >> 4) & 0x7;
> +
> +	if (ar0234->pll.pixel_rate_pixel_array <= 45000000) {
> +		if (coarse_idx < 3)
> +			mfr_30ba_val = AR0234_MFR_30BA_GAIN_BITS(6);
> +		else
> +			mfr_30ba_val = AR0234_MFR_30BA_GAIN_BITS(0);

Doesn't the cut off point also depend on the fine gain ? For 22.5 MHz I
see MFR 0x30ba documented as always equal to 6, while for 45 MHz I see
it as 6 util ANALOG_GAIN=0x0034 and 0 above that value.

> +	} else {
> +		if (coarse_idx == 0)
> +			mfr_30ba_val = AR0234_MFR_30BA_GAIN_BITS(2);
> +		else if (coarse_idx == 1)
> +			mfr_30ba_val = AR0234_MFR_30BA_GAIN_BITS(1);
> +		else
> +			mfr_30ba_val = AR0234_MFR_30BA_GAIN_BITS(0);

Same here, the cut off point seems to 1 up to ANALOG_GAIN=0x0038 and 0
above that value.

I think you can simplify the code by checking analog_reg_val instead of
calculating coarse_idx.

> +	}
> +
> +	return cci_write(ar0234->regmap, AR0234_REG_MFR_30BA,
> +			 mfr_30ba_val, NULL);
> +}
> +
> +static int ar0234_set_analog_gain(struct ar0234 *ar0234, u64 val)
> +{
> +	u32 reg_val, actual_gain;
> +	int ret;
> +
> +	actual_gain = ar0234_calc_analog_gain(val, &reg_val);
> +
> +	if (actual_gain != val) {
> +		__v4l2_ctrl_modify_range(ar0234->a_gain, AR0234_ANA_GAIN_MIN,
> +					 AR0234_ANA_GAIN_MAX,
> +					 AR0234_ANA_GAIN_STEP, actual_gain);
> +		__v4l2_ctrl_s_ctrl(ar0234->a_gain, actual_gain);

Why do you need this ?

> +	}
> +
> +	ret = cci_write(ar0234->regmap, AR0234_REG_GROUPED_PARAMETER_HOLD,
> +			1, NULL);
> +	if (ret)
> +		return ret;
> +
> +	ret = ar0234_set_mfr_30ba(ar0234, reg_val);
> +
> +	cci_write(ar0234->regmap, AR0234_REG_ANALOG_GAIN, reg_val, &ret);
> +
> +	cci_write(ar0234->regmap, AR0234_REG_GROUPED_PARAMETER_HOLD, 0, NULL);
> +
> +	return ret;
> +}
> +
> +static int ar0234_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ar0234 *ar0234 = container_of(ctrl->handler,
> +					     struct ar0234, ctrls);
> +	int ret = 0;
> +
> +	if (ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY)
> +		return 0;
> +
> +	if (ctrl->id == V4L2_CID_VBLANK) {
> +		int exposure_max = ar0234->crop.height + ctrl->val - 1;
> +		int exposure_val = clamp(ar0234->exposure->val,
> +					 AR0234_EXPOSURE_MIN, exposure_max);
> +
> +		ret = __v4l2_ctrl_modify_range(ar0234->exposure,
> +					       AR0234_EXPOSURE_MIN,
> +					       exposure_max,
> +					       AR0234_EXPOSURE_STEP,
> +					       exposure_val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (pm_runtime_get_if_in_use(ar0234->dev) == 0)

You should use pm_runtime_get_if_active() (see
https://lore.kernel.org/linux-media/20260505130258.GA1601351@killaraus.ideasonboard.com/T/#t).

> +		return 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_HBLANK:
> +		cci_write(ar0234->regmap, AR0234_REG_LINE_LENGTH_PCK,
> +			  (ar0234->crop.width / 4) + ctrl->val, &ret);
> +		break;
> +	case V4L2_CID_VBLANK:
> +		cci_write(ar0234->regmap, AR0234_REG_FRAME_LENGTH_LINES,
> +			  ar0234->crop.height + ctrl->val, &ret);
> +		if (ret)
> +			break;
> +		ctrl = ar0234->exposure;
> +		fallthrough;

I'd like Sakari's opinion on this.

> +	case V4L2_CID_EXPOSURE:
> +		cci_write(ar0234->regmap, AR0234_REG_COARSE_INTEGRATION_TIME,
> +			  ctrl->val, &ret);
> +		break;
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		ret = ar0234_set_analog_gain(ar0234, ctrl->val);
> +		break;
> +	case V4L2_CID_DIGITAL_GAIN:
> +		cci_write(ar0234->regmap, AR0234_REG_GLOBAL_GAIN,
> +			  ctrl->val, &ret);
> +		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		cci_write(ar0234->regmap, AR0234_REG_TEST_PATTERN_MODE,
> +			  ar0234_test_pattern_val[ctrl->val], &ret);
> +		break;
> +	case V4L2_CID_HFLIP:
> +	case V4L2_CID_VFLIP:
> +		cci_write(ar0234->regmap, AR0234_REG_IMAGE_ORIENTATION,
> +			  (ar0234->vflip->val << 1) | ar0234->hflip->val, &ret);
> +		break;
> +	case V4L2_CID_TEST_PATTERN_RED:
> +		cci_write(ar0234->regmap, AR0234_REG_TEST_DATA_RED,
> +			  ctrl->val, &ret);
> +		break;
> +	case V4L2_CID_TEST_PATTERN_GREENR:
> +		cci_write(ar0234->regmap, AR0234_REG_TEST_DATA_GREENR,
> +			  ctrl->val, &ret);
> +		break;
> +	case V4L2_CID_TEST_PATTERN_BLUE:
> +		cci_write(ar0234->regmap, AR0234_REG_TEST_DATA_BLUE,
> +			  ctrl->val, &ret);
> +		break;
> +	case V4L2_CID_TEST_PATTERN_GREENB:
> +		cci_write(ar0234->regmap, AR0234_REG_TEST_DATA_GREENB,
> +			  ctrl->val, &ret);
> +		break;
> +	default:
> +		dev_err(ar0234->dev, "Invalid control %d\n", ctrl->id);
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	pm_runtime_put_autosuspend(ar0234->dev);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops ar0234_ctrl_ops = {
> +	.s_ctrl = ar0234_set_ctrl,
> +};
> +
> +static int ar0234_enum_mbus_code(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct ar0234 *ar0234 = to_ar0234(sd);
> +
> +	if (code->index >= ARRAY_SIZE(ar0234_modes))
> +		return -EINVAL;
> +
> +	if (!ar0234_modes[code->index].code[ar0234->variant])
> +		return -EINVAL;
> +
> +	code->code = ar0234_modes[code->index].code[ar0234->variant];
> +
> +	return 0;
> +}
> +
> +static int ar0234_enum_frame_size(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	if (fse->index >= ARRAY_SIZE(ar0234_modes))
> +		return -EINVAL;

You also need to validate that fse->code is valid. I think
v4l2-compliance checks for that, please include the v4l2-compliance
report in the cover letter of the next version.

> +
> +	fse->min_width = AR0234_MIN_CROP_WIDTH;
> +	fse->max_width = AR0234_PIXEL_ARRAY_WIDTH;
> +	fse->min_height = AR0234_MIN_CROP_HEIGHT;
> +	fse->max_height = AR0234_PIXEL_ARRAY_HEIGHT;
> +
> +	return 0;
> +}
> +
> +static void ar0234_set_link_limits(struct ar0234 *ar0234)
> +{
> +	u64 pixel_rate = ar0234->link_freqs[ar0234->mode->link_freq_index] * 2;
> +
> +	pixel_rate *= ar0234->num_data_lanes;
> +	do_div(pixel_rate, ar0234->mode->bpp_out);
> +
> +	__v4l2_ctrl_s_ctrl_int64(ar0234->pixel_rate, pixel_rate);
> +
> +	__v4l2_ctrl_s_ctrl(ar0234->link_freq, ar0234->mode->link_freq_index);
> +}
> +
> +static void ar0234_set_framing_limits(struct ar0234 *ar0234)
> +{
> +	unsigned int width = ar0234->crop.width;
> +	int hblank, hblank_min;
> +
> +	__v4l2_ctrl_modify_range(ar0234->vblank, AR0234_FRAME_LENGTH_LINES_MIN,
> +				 AR0234_VBLANK_MAX, 1,
> +				 AR0234_FRAME_LENGTH_LINES_MIN);
> +	__v4l2_ctrl_s_ctrl(ar0234->vblank, AR0234_FRAME_LENGTH_LINES_MIN);
> +
> +	hblank = AR0234_LINE_LENGTH_PCK_MIN - width / 4;
> +	hblank_min = AR0234_LINE_LENGTH_PCK_MIN - AR0234_PIXEL_ARRAY_WIDTH / 4;
> +	__v4l2_ctrl_modify_range(ar0234->hblank, hblank_min,
> +				 AR0234_HBLANK_MAX, 2, hblank);
> +	__v4l2_ctrl_s_ctrl(ar0234->hblank, hblank);
> +}
> +
> +static int ar0234_set_pad_format(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_format *fmt)
> +{
> +	struct ar0234 *ar0234 = to_ar0234(sd);
> +	struct ar0234_mode const *mode = NULL;
> +	unsigned int width, height;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(ar0234_modes); i++) {
> +		if (ar0234_modes[i].code[ar0234->variant] == fmt->format.code) {
> +			mode = &ar0234_modes[i];
> +			break;
> +		}
> +	}
> +	if (!mode)
> +		return -EINVAL;

If the requested media bus code is not valid you should pick a default,
not return an error.

> +
> +	width = clamp_t(unsigned int, round_down(fmt->format.width,
> +						 AR0234_CROP_WIDTH_STEP),
> +			AR0234_MIN_CROP_WIDTH, AR0234_PIXEL_ARRAY_WIDTH);
> +	height = clamp_t(unsigned int, round_down(fmt->format.height,
> +						  AR0234_CROP_HEIGHT_STEP),
> +			 AR0234_MIN_CROP_HEIGHT, AR0234_PIXEL_ARRAY_HEIGHT);
> +
> +	fmt->format.width = width;
> +	fmt->format.height = height;
> +	fmt->format.field = V4L2_FIELD_NONE;
> +	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
> +	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> +	fmt->format.quantization = V4L2_QUANTIZATION_DEFAULT;
> +	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
> +		return 0;
> +	}
> +
> +	if (ar0234->mode != mode) {
> +		int ret = ar0234_calculate_pll(ar0234, mode);

I'd recommend moving this to .enable_streams().

> +
> +		if (ret) {
> +			dev_err(ar0234->dev,
> +				"PLL recalculations failed: %d\n", ret);
> +			return ret;
> +		}
> +
> +		ar0234->mode = mode;
> +
> +		ar0234_set_link_limits(ar0234);

And this too.

> +	}

Mode changes shouldn't be allowed when streaming.

> +
> +	if (ar0234->crop.width != width || ar0234->crop.height != height) {
> +		ar0234->crop.width = width;
> +		ar0234->crop.height = height;
> +		ar0234->crop.left =
> +			min_t(u32, ar0234->crop.left, AR0234_PIXEL_ARRAY_LEFT +
> +			      AR0234_PIXEL_ARRAY_WIDTH - width);
> +		ar0234->crop.top =
> +			min_t(u32, ar0234->crop.top, AR0234_PIXEL_ARRAY_TOP +
> +			      AR0234_PIXEL_ARRAY_HEIGHT - height);
> +		ar0234->crop.left =
> +			max(ar0234->crop.left, AR0234_PIXEL_ARRAY_LEFT);
> +		ar0234->crop.top =
> +			max(ar0234->crop.top, AR0234_PIXEL_ARRAY_TOP);

Propagration to the crop rectangle should be performed on the TRY format
too (propagating, in that case, to the TRY crop rectangle of course).

> +
> +		ar0234_set_framing_limits(ar0234);
> +	}
> +
> +	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
> +
> +	return 0;
> +}
> +
> +static int ar0234_init_state(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_state *state)
> +{
> +	struct ar0234 *ar0234 = to_ar0234(sd);
> +	struct v4l2_subdev_format format = {
> +		.which = V4L2_SUBDEV_FORMAT_TRY,
> +		.format = {
> +			.width = ar0234->crop.width,
> +			.height = ar0234->crop.height,
> +			.code = ar0234->mode->code[ar0234->variant],
> +		},
> +	};
> +	int ret;
> +
> +	ret = ar0234_set_pad_format(sd, state, &format);
> +	if (ret)
> +		return ret;
> +
> +	*v4l2_subdev_state_get_crop(state, 0) = ar0234->crop;
> +
> +	return 0;
> +}
> +
> +static int ar0234_get_selection(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *sd_state,
> +				struct v4l2_subdev_selection *sel)
> +{
> +	struct ar0234 *ar0234 = to_ar0234(sd);
> +
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP:
> +		if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
> +			sel->r =
> +				*v4l2_subdev_state_get_crop(sd_state, sel->pad);
> +		else
> +			sel->r = ar0234->crop;

Always store the crop rectangle in the state.

> +
> +		return 0;
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +		sel->r.left = AR0234_PIXEL_ARRAY_LEFT;
> +		sel->r.top = AR0234_PIXEL_ARRAY_TOP;
> +		sel->r.width = AR0234_PIXEL_ARRAY_WIDTH;
> +		sel->r.height = AR0234_PIXEL_ARRAY_HEIGHT;
> +
> +		return 0;
> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> +		sel->r.top = 0;
> +		sel->r.left = 0;
> +		sel->r.width = AR0234_NATIVE_WIDTH;
> +		sel->r.height = AR0234_NATIVE_HEIGHT;
> +
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int ar0234_set_selection(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *sd_state,
> +				struct v4l2_subdev_selection *sel)
> +{
> +	struct ar0234 *ar0234 = to_ar0234(sd);
> +	struct v4l2_rect rect = sel->r;
> +	struct v4l2_rect *try_crop;
> +	struct v4l2_mbus_framefmt *try_fmt;
> +	u32 max_left, max_top;
> +
> +	if (sel->target != V4L2_SEL_TGT_CROP)
> +		return -EINVAL;
> +
> +	max_left = AR0234_PIXEL_ARRAY_LEFT + AR0234_PIXEL_ARRAY_WIDTH -
> +		   AR0234_MIN_CROP_WIDTH;
> +	max_top = AR0234_PIXEL_ARRAY_TOP + AR0234_PIXEL_ARRAY_HEIGHT -
> +		  AR0234_MIN_CROP_HEIGHT;
> +
> +	rect.left = clamp_t(u32, rect.left, AR0234_PIXEL_ARRAY_LEFT, max_left);
> +	rect.top = clamp_t(u32, rect.top, AR0234_PIXEL_ARRAY_TOP, max_top);
> +
> +	rect.width =
> +		clamp_t(u32, round_down(rect.width, AR0234_CROP_WIDTH_STEP),
> +			AR0234_MIN_CROP_WIDTH, AR0234_PIXEL_ARRAY_WIDTH);
> +	rect.height =
> +		clamp_t(u32, round_down(rect.height, AR0234_CROP_HEIGHT_STEP),
> +			AR0234_MIN_CROP_HEIGHT, AR0234_PIXEL_ARRAY_HEIGHT);
> +
> +	if (rect.left + rect.width - 1 >
> +	    AR0234_PIXEL_ARRAY_LEFT + AR0234_PIXEL_ARRAY_WIDTH - 1)
> +		rect.left = AR0234_PIXEL_ARRAY_LEFT +
> +			    AR0234_PIXEL_ARRAY_WIDTH - rect.width;
> +	if (rect.top + rect.height - 1 >
> +	    AR0234_PIXEL_ARRAY_TOP + AR0234_PIXEL_ARRAY_HEIGHT - 1)
> +		rect.top = AR0234_PIXEL_ARRAY_TOP +
> +			   AR0234_PIXEL_ARRAY_HEIGHT - rect.height;
> +
> +	if (sel->flags & V4L2_SEL_FLAG_GE) {
> +		if (rect.width < sel->r.width) {
> +			u32 new_width = rect.width + AR0234_CROP_WIDTH_STEP;
> +
> +			if (new_width <= AR0234_PIXEL_ARRAY_WIDTH)
> +				rect.width = new_width;
> +		}
> +
> +		if (rect.height < sel->r.height) {
> +			u32 new_height = rect.height + AR0234_CROP_HEIGHT_STEP;
> +
> +			if (new_height <= AR0234_PIXEL_ARRAY_HEIGHT)
> +				rect.height = new_height;
> +		}
> +	}
> +
> +	if (sel->flags & V4L2_SEL_FLAG_LE) {
> +		if (rect.width > sel->r.width && rect.width >=
> +		    AR0234_MIN_CROP_WIDTH + AR0234_CROP_WIDTH_STEP)
> +			rect.width -= AR0234_CROP_WIDTH_STEP;
> +
> +		if (rect.height > sel->r.height && rect.height >=
> +		    AR0234_MIN_CROP_HEIGHT + AR0234_CROP_HEIGHT_STEP)
> +			rect.height -= AR0234_CROP_HEIGHT_STEP;
> +	}
> +
> +	if (rect.width < AR0234_MIN_CROP_WIDTH ||
> +	    rect.height < AR0234_MIN_CROP_HEIGHT)
> +		return -EINVAL;

The crop rectangle should be adjusted, invalid values should never
return an error.

> +
> +	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		try_crop = v4l2_subdev_state_get_crop(sd_state, sel->pad);
> +		*try_crop = rect;
> +
> +		try_fmt = v4l2_subdev_state_get_format(sd_state, sel->pad);
> +		if (try_fmt) {
> +			try_fmt->width = rect.width;
> +			try_fmt->height = rect.height;
> +		}

Here you propagate from the crop rectangle to the format for TRY, while
above you propagate from the format to the crop rectangle for ACTIVE.
Propagation should always operate in the same direction, for both the
TRY and ACTIVE formats.

There's an effort to design a better (and better documented) crop API
(see https://lore.kernel.org/linux-media/20260409201501.975242-1-sakari.ailus@linux.intel.com).
This is work in progress, so I don't want to delay this driver by
waiting for the API, but it may be a good idea to look at it.

> +
> +		return 0;
> +	}
> +
> +	if (ar0234->streaming)
> +		return -EBUSY;
> +
> +	if (ar0234->crop.left == rect.left && ar0234->crop.top == rect.top &&
> +	    ar0234->crop.width == rect.width &&
> +	    ar0234->crop.height == rect.height) {
> +		sel->r = rect;
> +
> +		return 0;
> +	}
> +
> +	ar0234->crop = rect;
> +
> +	try_fmt = v4l2_subdev_state_get_format(sd_state, sel->pad);
> +	if (try_fmt) {
> +		try_fmt->width = rect.width;
> +		try_fmt->height = rect.height;
> +	}
> +
> +	ar0234_set_framing_limits(ar0234);

Except for this call, the function should operate exactly the same way
for TRY and ACTIVE.

> +
> +	sel->r = rect;
> +
> +	return 0;
> +}
> +
> +static int ar0234_enable_streams(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state, u32 pad,
> +				 u64 streams_mask)
> +{
> +	struct ar0234 *ar0234 = to_ar0234(sd);
> +	int x_addr_start, x_addr_end, y_addr_start, y_addr_end, ret;
> +
> +	ret = pm_runtime_resume_and_get(ar0234->dev);
> +	if (ret)
> +		return ret;
> +
> +	cci_write(ar0234->regmap, AR0234_REG_PRE_PLL_CLK_DIV,
> +		  ar0234->pll.vt_fr.pre_pll_clk_div, &ret);
> +	cci_write(ar0234->regmap, AR0234_REG_PLL_MULTIPLIER,
> +		  ar0234->pll.vt_fr.pll_multiplier, &ret);
> +	cci_write(ar0234->regmap, AR0234_REG_VT_SYS_CLK_DIV,
> +		  ar0234->pll.vt_bk.sys_clk_div, &ret);
> +	cci_write(ar0234->regmap, AR0234_REG_VT_PIX_CLK_DIV,
> +		  ar0234->pll.vt_bk.pix_clk_div, &ret);
> +	cci_write(ar0234->regmap, AR0234_REG_OP_SYS_CLK_DIV,
> +		  ar0234->pll.op_bk.sys_clk_div, &ret);
> +	cci_write(ar0234->regmap, AR0234_REG_OP_PIX_CLK_DIV,
> +		  ar0234->pll.op_bk.pix_clk_div, &ret);
> +	if (ret) {
> +		dev_err(ar0234->dev, "Failed to setup PLL\n");
> +		goto start_err;
> +	}

I'd drop this error check, and only eep the last one before
__v4l2_ctrl_handler_setup().

> +
> +	cci_multi_reg_write(ar0234->regmap, ar0234_common_init,
> +			    ARRAY_SIZE(ar0234_common_init), &ret);
> +
> +	cci_write(ar0234->regmap, AR0234_REG_COMPANDING,
> +		  ar0234->mode->dpcm, &ret);
> +
> +	cci_write(ar0234->regmap, AR0234_REG_DATA_FORMAT_BITS,
> +		  DATA_FORMAT_BITS(ar0234->mode->bpp_in, ar0234->mode->bpp_out),
> +		  &ret);
> +
> +	cci_write(ar0234->regmap, AR0234_REG_SERIAL_FORMAT,
> +		  DATA_FORMAT_LANES(ar0234->num_data_lanes), &ret);
> +
> +	cci_write(ar0234->regmap, AR0234_REG_MIPI_CNTRL,
> +		  ar0234->mode->mipi_dt, &ret);
> +
> +	x_addr_start = ar0234->crop.left;
> +	y_addr_start = ar0234->crop.top;
> +	x_addr_end = ar0234->crop.left + ar0234->crop.width - 1;
> +	y_addr_end = ar0234->crop.top + ar0234->crop.height - 1;
> +
> +	cci_write(ar0234->regmap, AR0234_REG_X_ADDR_START, x_addr_start, &ret);
> +	cci_write(ar0234->regmap, AR0234_REG_Y_ADDR_START, y_addr_start, &ret);
> +	cci_write(ar0234->regmap, AR0234_REG_X_ADDR_END, x_addr_end, &ret);
> +	cci_write(ar0234->regmap, AR0234_REG_Y_ADDR_END, y_addr_end, &ret);
> +
> +	if (ret) {
> +		dev_err(ar0234->dev, "Failed to setup sensor\n");
> +		goto start_err;
> +	}
> +
> +	ret = __v4l2_ctrl_handler_setup(ar0234->sd.ctrl_handler);
> +
> +	cci_write(ar0234->regmap, AR0234_REG_MODE_SELECT, 1, &ret);
> +	if (!ret) {
> +		ar0234->streaming = true;
> +		return 0;
> +	}
> +
> +start_err:
> +	pm_runtime_put_autosuspend(ar0234->dev);
> +
> +	return ret;
> +}
> +
> +static int ar0234_disable_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state, u32 pad,
> +				  u64 streams_mask)
> +{
> +	struct ar0234 *ar0234 = to_ar0234(sd);
> +	int ret;
> +
> +	ret = cci_write(ar0234->regmap, AR0234_REG_MODE_SELECT, 0, NULL);
> +
> +	ar0234->streaming = false;
> +
> +	pm_runtime_put_autosuspend(ar0234->dev);
> +
> +	return ret;
> +}
> +
> +static int ar0234_g_mbus_config(struct v4l2_subdev *sd, unsigned int pad_id,
> +				struct v4l2_mbus_config *config)
> +{
> +	struct ar0234 *ar0234 = to_ar0234(sd);
> +
> +	config->type = V4L2_MBUS_CSI2_DPHY;
> +	config->bus.mipi_csi2.flags = V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
> +	config->bus.mipi_csi2.num_data_lanes = ar0234->num_data_lanes;
> +
> +	return 0;
> +}

Please also implement .get_frame_desc().

> +
> +static const struct v4l2_subdev_video_ops ar0234_video_ops = {
> +	.s_stream = v4l2_subdev_s_stream_helper,
> +};
> +
> +static const struct v4l2_subdev_pad_ops ar0234_pad_ops = {
> +	.enum_mbus_code = ar0234_enum_mbus_code,
> +	.enum_frame_size = ar0234_enum_frame_size,
> +	.get_fmt = v4l2_subdev_get_fmt,
> +	.set_fmt = ar0234_set_pad_format,
> +	.get_selection = ar0234_get_selection,
> +	.set_selection = ar0234_set_selection,
> +	.enable_streams = ar0234_enable_streams,
> +	.disable_streams = ar0234_disable_streams,
> +	.get_mbus_config = ar0234_g_mbus_config,
> +};
> +
> +static const struct v4l2_subdev_core_ops ar0234_core_ops = {
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_ops ar0234_subdev_ops = {
> +	.core = &ar0234_core_ops,
> +	.video = &ar0234_video_ops,
> +	.pad = &ar0234_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops ar0234_internal_ops = {
> +	.init_state = ar0234_init_state,
> +};
> +
> +static const struct media_entity_operations ar0234_subdev_entity_ops = {
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
> +static int ar0234_ctrls_init(struct ar0234 *ar0234)
> +{
> +	struct v4l2_fwnode_device_properties props;
> +	int i, ret;

i is never negative, it can be an unsigned int.

> +
> +	ret = v4l2_fwnode_device_parse(ar0234->dev, &props);
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l2_ctrl_handler_init(&ar0234->ctrls, 14);

16 to account for the controls created by
v4l2_ctrl_new_fwnode_properties() ?

> +	if (ret)
> +		return ret;
> +
> +	ar0234->hblank = v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops,
> +					   V4L2_CID_HBLANK, 0,
> +					   AR0234_HBLANK_MAX, 2, 0);
> +
> +	ar0234->vblank = v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops,
> +					   V4L2_CID_VBLANK, 0,
> +					   AR0234_VBLANK_MAX, 1, 0);
> +
> +	ar0234->exposure = v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops,
> +					     V4L2_CID_EXPOSURE,
> +					     AR0234_EXPOSURE_MIN, U16_MAX,
> +					     AR0234_EXPOSURE_STEP, 200);
> +
> +	ar0234->pixel_rate = v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops,
> +					       V4L2_CID_PIXEL_RATE, 1,
> +					       INT_MAX, 1, 1);
> +
> +	ar0234->a_gain = v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops,
> +					   V4L2_CID_ANALOGUE_GAIN,
> +					   AR0234_ANA_GAIN_MIN,
> +					   AR0234_ANA_GAIN_MAX,
> +					   AR0234_ANA_GAIN_STEP,
> +					   AR0234_ANA_GAIN_DEFAULT);
> +
> +	v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops,
> +			  V4L2_CID_DIGITAL_GAIN, AR0234_DGTL_GAIN_MIN,
> +			  AR0234_DGTL_GAIN_MAX, AR0234_DGTL_GAIN_STEP,
> +			  AR0234_DGTL_GAIN_DEFAULT);
> +
> +	ar0234->hflip = v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops,
> +					  V4L2_CID_HFLIP, 0, 1, 1, 0);
> +	ar0234->vflip = v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops,
> +					  V4L2_CID_VFLIP, 0, 1, 1, 0);
> +	v4l2_ctrl_cluster(2, &ar0234->hflip);
> +
> +	v4l2_ctrl_new_std_menu_items(&ar0234->ctrls, &ar0234_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(ar0234_test_pattern_menu) - 1,
> +				     0, 0, ar0234_test_pattern_menu);
> +
> +	for (i = 0; i < 4; i++) {
> +		v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops,
> +				  V4L2_CID_TEST_PATTERN_RED + i,
> +				  AR0234_TESTP_COLOUR_MIN,
> +				  AR0234_TESTP_COLOUR_MAX,
> +				  AR0234_TESTP_COLOUR_STEP,
> +				  AR0234_TESTP_COLOUR_MAX);
> +	}
> +
> +	ar0234->link_freq =
> +		v4l2_ctrl_new_int_menu(&ar0234->ctrls, &ar0234_ctrl_ops,
> +				       V4L2_CID_LINK_FREQ,
> +				       AR0234_LINK_FREQ_IDX_MAX - 1, 0,
> +				       ar0234->link_freqs);
> +	if (ar0234->link_freq)
> +		ar0234->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	ret = v4l2_ctrl_new_fwnode_properties(&ar0234->ctrls, &ar0234_ctrl_ops,
> +					      &props);
> +
> +	if (ret)
> +		return dev_err_probe(ar0234->dev, ret,
> +				     "Failed to add controls\n");
> +
> +	ar0234->sd.ctrl_handler = &ar0234->ctrls;
> +
> +	ar0234_set_link_limits(ar0234);
> +	ar0234_set_framing_limits(ar0234);
> +
> +	return 0;
> +}
> +
> +static int ar0234_parse_hw_config(struct ar0234 *ar0234)
> +{
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};
> +	struct fwnode_handle *ep;
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(ar0234->supplies); i++)
> +		ar0234->supplies[i].supply = ar0234_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(ar0234->dev,
> +				      ARRAY_SIZE(ar0234->supplies),
> +				      ar0234->supplies);
> +	if (ret)
> +		return dev_err_probe(ar0234->dev, ret,
> +				     "Failed to get supplies\n");
> +
> +	ar0234->reset = devm_gpiod_get_optional(ar0234->dev, "reset",
> +						GPIOD_OUT_HIGH);
> +	if (IS_ERR(ar0234->reset))
> +		return dev_err_probe(ar0234->dev, PTR_ERR(ar0234->reset),
> +				     "Failed to get reset GPIO\n");
> +
> +	ar0234->clk = devm_v4l2_sensor_clk_get(ar0234->dev, NULL);
> +	if (IS_ERR(ar0234->clk))
> +		return dev_err_probe(ar0234->dev, PTR_ERR(ar0234->clk),
> +				     "Failed to get clock\n");
> +
> +	ep = fwnode_graph_get_next_endpoint(dev_fwnode(ar0234->dev), NULL);
> +	if (!ep)
> +		return -ENXIO;
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;
> +
> +	switch (bus_cfg.bus.mipi_csi2.num_data_lanes) {
> +	case 2:
> +	case 4:
> +		ar0234->num_data_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
> +		break;
> +	default:
> +		ret = dev_err_probe(ar0234->dev, -EINVAL,
> +				    "Invalid number of CSI2 data lanes %d\n",
> +		      bus_cfg.bus.mipi_csi2.num_data_lanes);
> +		goto done_endpoint_free;
> +	}
> +
> +	if (bus_cfg.nr_of_link_frequencies != AR0234_LINK_FREQ_IDX_MAX) {
> +		ret = dev_err_probe(ar0234->dev, -EINVAL,
> +				    "Invalid number of link freq items %d\n",
> +				    bus_cfg.nr_of_link_frequencies);
> +		goto done_endpoint_free;
> +	}
> +
> +	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
> +		s64 freq = bus_cfg.link_frequencies[i];
> +
> +		if (freq < 360000000LL || freq > 450000000LL) {
> +			ret = dev_err_probe(ar0234->dev, -EINVAL,
> +					    "Invalid link frequency %lli\n",
> +					    freq);
> +			goto done_endpoint_free;
> +		}
> +
> +		ar0234->link_freqs[i] = freq;
> +	}
> +
> +done_endpoint_free:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +}
> +
> +static int ar0234_identify_module(struct ar0234 *ar0234)
> +{
> +	u64 id, rev;
> +	int ret;
> +
> +	ret = cci_read(ar0234->regmap, AR0234_REG_CHIP_VERSION, &id, NULL);
> +	ret = cci_read(ar0234->regmap, AR0234_REG_REVISION_NUMBER, &rev, &ret);
> +	if (ret)
> +		return dev_err_probe(ar0234->dev, ret,
> +				     "Failed to read chip id\n");
> +
> +	if (id == AR0234_CHIP_ID_MONO)
> +		ar0234->variant = AR0234_VARIANT_MONO;
> +	else if (id == AR0234_CHIP_ID)
> +		ar0234->variant = AR0234_VARIANT_COLOUR;
> +	else
> +		return dev_err_probe(ar0234->dev, -ENODEV,
> +				     "Invalid chip id: 0x%04x\n", (u16)id);
> +
> +	dev_info(ar0234->dev, "Success reading chip id: 0x%04x, Rev.%lld\n",
> +		 (u16)id, (rev >> 12) & 0xf);
> +
> +	return ret;
> +}
> +
> +static int ar0234_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ar0234 *ar0234 = to_ar0234(sd);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ar0234->supplies),
> +				    ar0234->supplies);
> +	if (ret) {
> +		dev_err(ar0234->dev, "Failed to enable regulators\n");
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(ar0234->clk);
> +	if (ret) {
> +		dev_err(ar0234->dev, "Failed to enable clock\n");
> +		regulator_bulk_disable(ARRAY_SIZE(ar0234->supplies),
> +				       ar0234->supplies);
> +		return ret;
> +	}
> +
> +	gpiod_set_value_cansleep(ar0234->reset, 1);

The GPIO should be set to 0 to deassert reset. Polarity inversion should
be handled in DT.

> +	/* ~160000 EXTCLKs */
> +	usleep_range(27000, 28000);

fsleep() seems a good candidate here.

> +
> +	return 0;
> +}
> +
> +static int ar0234_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ar0234 *ar0234 = to_ar0234(sd);
> +
> +	gpiod_set_value_cansleep(ar0234->reset, 0);
> +	regulator_bulk_disable(ARRAY_SIZE(ar0234->supplies), ar0234->supplies);
> +	clk_disable_unprepare(ar0234->clk);
> +	/* 100ms PwrDown until next PwrUp */
> +	usleep_range(100000, 110000);

fsleep() here too. A possibly better option would be to record the time,
and add a delay at power on time if it's too clsoe to power odown.

> +
> +	return 0;
> +}
> +
> +static void ar0234_subdev_cleanup(struct ar0234 *ar0234)
> +{
> +	media_entity_cleanup(&ar0234->sd.entity);
> +	v4l2_ctrl_handler_free(&ar0234->ctrls);
> +}
> +
> +static int ar0234_soft_reset(struct ar0234 *ar0234)
> +{
> +	int ret;
> +
> +	ret = cci_write(ar0234->regmap, AR0234_REG_RESET, 0x0001, NULL);
> +	usleep_range(2000, 2100);
> +	cci_write(ar0234->regmap, AR0234_REG_RESET, 0x2018, &ret);
> +	usleep_range(2000, 2100);
> +
> +	return ret;
> +}
> +
> +static int ar0234_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct ar0234 *ar0234;
> +	int ret;
> +
> +	ar0234 = devm_kzalloc(dev, sizeof(*ar0234), GFP_KERNEL);
> +	if (!ar0234)
> +		return -ENOMEM;
> +
> +	ar0234->dev = dev;
> +
> +	ar0234->regmap = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(ar0234->regmap))
> +		return PTR_ERR(ar0234->regmap);
> +
> +	ret = ar0234_parse_hw_config(ar0234);
> +	if (ret)
> +		return ret;
> +
> +	v4l2_i2c_subdev_init(&ar0234->sd, client, &ar0234_subdev_ops);
> +
> +	ret = ar0234_power_on(dev);
> +	if (ret)
> +		goto err_subdev;
> +
> +	pm_runtime_set_active(dev);
> +	pm_runtime_get_noresume(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +
> +	ret = ar0234_soft_reset(ar0234);
> +	if (ret)
> +		goto error_pm;
> +
> +	ret = ar0234_identify_module(ar0234);
> +	if (ret)
> +		goto error_pm;
> +
> +	ar0234->crop.left = AR0234_PIXEL_ARRAY_LEFT;
> +	ar0234->crop.top = AR0234_PIXEL_ARRAY_TOP;
> +	ar0234->crop.width = AR0234_PIXEL_ARRAY_WIDTH;
> +	ar0234->crop.height = AR0234_PIXEL_ARRAY_HEIGHT;
> +
> +	ar0234->mode = &ar0234_modes[0];
> +
> +	ret = ar0234_calculate_pll(ar0234, ar0234->mode);
> +	if (ret) {
> +		dev_err(ar0234->dev, "PLL calculations failed: %d\n", ret);
> +		goto error_pm;
> +	}
> +
> +	ret = ar0234_ctrls_init(ar0234);
> +	if (ret)
> +		goto error_pm;
> +
> +	ar0234->sd.internal_ops = &ar0234_internal_ops;
> +	ar0234->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +			    V4L2_SUBDEV_FL_HAS_EVENTS;
> +	ar0234->sd.entity.ops = &ar0234_subdev_entity_ops;
> +	ar0234->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +	ar0234->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&ar0234->sd.entity, 1, &ar0234->pad);
> +	if (ret) {
> +		dev_err(dev, "Failed to init entity pads: %d\n", ret);
> +		goto error_pm;
> +	}
> +
> +	ar0234->sd.state_lock = ar0234->ctrls.lock;
> +
> +	ret = v4l2_subdev_init_finalize(&ar0234->sd);
> +	if (ret) {
> +		dev_err(ar0234->dev, "Subdev init error\n");
> +		goto error_media;
> +	}
> +
> +	ret = v4l2_async_register_subdev_sensor(&ar0234->sd);
> +	if (ret) {
> +		dev_err(dev, "Failed to register sensor sub-device: %d\n", ret);
> +		goto error_media;
> +	}
> +
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return 0;
> +
> +error_media:
> +	media_entity_cleanup(&ar0234->sd.entity);
> +
> +error_pm:
> +	pm_runtime_disable(ar0234->dev);
> +	pm_runtime_put_noidle(ar0234->dev);
> +	ar0234_power_off(ar0234->dev);
> +
> +err_subdev:
> +	ar0234_subdev_cleanup(ar0234);
> +
> +	return ret;
> +}
> +
> +static void ar0234_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ar0234 *ar0234 = to_ar0234(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	ar0234_subdev_cleanup(ar0234);
> +
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		ar0234_power_off(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);
> +}
> +
> +static const struct acpi_device_id ar0234_acpi_ids[] __maybe_unused = {

Is __maybe_unused needed given thatar0234_acpi_ids is referenced from
+MODULE_DEVICE_TABLE() ?

> +	{ "INTC10C0" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, ar0234_acpi_ids);
> +
> +static const struct of_device_id ar0234_dt_ids[] __maybe_unused = {

Same here.

> +	{ .compatible = "onnn,ar0234cs" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ar0234_dt_ids);
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(ar0234_pm_ops, ar0234_power_off,
> +				 ar0234_power_on, NULL);
> +
> +static struct i2c_driver ar0234_i2c_driver = {
> +	.driver = {
> +		.name = "ar0234",
> +		.acpi_match_table = ACPI_PTR(ar0234_acpi_ids),
> +		.of_match_table	= of_match_ptr(ar0234_dt_ids),
> +		.pm = pm_ptr(&ar0234_pm_ops),
> +	},
> +	.probe = ar0234_probe,
> +	.remove = ar0234_remove,
> +};
> +module_i2c_driver(ar0234_i2c_driver);
> +
> +MODULE_DESCRIPTION("onsemi AR0234 Camera Sensor Driver");
> +MODULE_AUTHOR("Alexander Shiyan <eagle.alexander923@gmail.com>");
> +MODULE_LICENSE("GPL");

-- 
Regards,

Laurent Pinchart

