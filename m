Return-Path: <linux-media+bounces-58730-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AGjIaUP3mnRmQkAu9opvQ
	(envelope-from <linux-media+bounces-58730-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 11:57:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF023F8540
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 11:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F2C1305A10F
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 09:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 409F53CAE95;
	Tue, 14 Apr 2026 09:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1ecPtKK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5263C873B;
	Tue, 14 Apr 2026 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160642; cv=none; b=rWE4OjSKiybhG3X/IeVhlzrSmMuBbfJlM6ixFAlDroGudHzhG1bx2PtC1WyYEBUA7q/DGgP1N2tBZdnQuoSJben+0ORatV/Xz/qpSSTl0E/nMsLHAiQzum5/b9LyIvDGO4PvH45f44JEhz4Rp33mbHIXLXl+FiJnLx8JW9lViIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160642; c=relaxed/simple;
	bh=Ep3Wd5jLrvEjOkfGtx97oDzSZ/fV+TmVmKQxjgccuMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDcgMkIVEoU8yaUIUWK4yWC7sn1vmjnEXoN0pEX7DdfyNXq8hA9f8Q3emt+MWGTcAOems9fAlIkq5tgSEb1mRiFPW0zzyDD7YomiOWCt7uKRwx9Ok1QO+jTwPEWuMzE2fRLocxrEO5KrOul1Z+lttb8nKbC8yd/HnwtjR02wSSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1ecPtKK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776160640; x=1807696640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ep3Wd5jLrvEjOkfGtx97oDzSZ/fV+TmVmKQxjgccuMc=;
  b=k1ecPtKKhPfKwyRQI9wJ+/DFPwryCID0OxN82BEs3dIYaXWJeB5xnIHb
   At6F3NY1PRaIurrOuMkdhWFerpxqHhLYWGZAsBzO0vNFLibxPwmL2yaO7
   A+z2Cq+wjShP6NxM7sVt7a7/DezSTVUUg219R2cQCt/coQHVxdmB4giE+
   BXtJqzOkR7NPhFNL7qx6c4hYGudnQYedDAZDugVW3OiCBrhJ7C45jv+R7
   TQvjw2rvR8Tqz9xCaT2FiWZfoUs/wpu6b9sxaHa5QCTngUx/tlcuiHwOg
   03AJgLnXNMaIa/uYw1Ws426NguqHHIe4BtWHPN+s+vevGazU/IH1upOBo
   g==;
X-CSE-ConnectionGUID: 37EH8crPQ46JCrQyUwHhTg==
X-CSE-MsgGUID: D9JzDd8YSsmQ8SNq455cBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77293814"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77293814"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 02:57:19 -0700
X-CSE-ConnectionGUID: R06EZ0OZRtytegciWcwkFw==
X-CSE-MsgGUID: +kxlc6M0SOOB0PFQdptzKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="234980539"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.154])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 02:57:15 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F1EBE120333;
	Tue, 14 Apr 2026 12:57:32 +0300 (EEST)
Date: Tue, 14 Apr 2026 12:57:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Cc: tarang.raval@siliconsignals.io,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: add os02g10 image sensor driver
Message-ID: <ad4PjGxTpLT0Y1Je@kekkonen.localdomain>
References: <20260414084952.217215-1-elgin.perumbilly@siliconsignals.io>
 <20260414084952.217215-3-elgin.perumbilly@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414084952.217215-3-elgin.perumbilly@siliconsignals.io>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58730-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,siliconsignals.io:email]
X-Rspamd-Queue-Id: 3EF023F8540
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Elgin,

Thanks for the update.

On Tue, Apr 14, 2026 at 02:19:45PM +0530, Elgin Perumbilly wrote:
> Add a v4l2 subdevice driver for the Omnivision os02g10 sensor.
> 
> The Omnivision os02g10 is a CMOS image sensor with an active array size of
> 1920 x 1080.
> 
> The following features are supported:
> - Manual exposure an gain control support
> - vblank/hblank control support
> - vflip/hflip control support
> - Test pattern control support
> - Supported resolution: 1920 x 1080 @ 30fps (SBGGR10)
> 
> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  MAINTAINERS                 |    1 +
>  drivers/media/i2c/Kconfig   |   10 +
>  drivers/media/i2c/Makefile  |    1 +
>  drivers/media/i2c/os02g10.c | 1039 +++++++++++++++++++++++++++++++++++
>  4 files changed, 1051 insertions(+)
>  create mode 100644 drivers/media/i2c/os02g10.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 13409c71a765..28827e77ea31 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19463,6 +19463,7 @@ M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
> +F:	drivers/media/i2c/os02g10.c
> 
>  OMNIVISION OS05B10 SENSOR DRIVER
>  M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 5eb1e0e0a87a..dd6e9562acf6 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -372,6 +372,16 @@ config VIDEO_OG0VE1B
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called og0ve1b.
> 
> +config VIDEO_OS02G10
> +        tristate "OmniVision OS02G10 sensor support"
> +        select V4L2_CCI_I2C
> +        help
> +          This is a Video4Linux2 sensor driver for Omnivision
> +          OS02G10 camera sensor.
> +
> +	  To compile this driver as a module, choose M here: the
> +          module will be called os02g10.
> +
>  config VIDEO_OS05B10
>          tristate "OmniVision OS05B10 sensor support"
>          select V4L2_CCI_I2C
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index a3a6396df3c4..a7554d2eb140 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -84,6 +84,7 @@ obj-$(CONFIG_VIDEO_MT9V032) += mt9v032.o
>  obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
>  obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
>  obj-$(CONFIG_VIDEO_OG0VE1B) += og0ve1b.o
> +obj-$(CONFIG_VIDEO_OS02G10) += os02g10.o
>  obj-$(CONFIG_VIDEO_OS05B10) += os05b10.o
>  obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
>  obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
> diff --git a/drivers/media/i2c/os02g10.c b/drivers/media/i2c/os02g10.c
> new file mode 100644
> index 000000000000..b8df79162f88
> --- /dev/null
> +++ b/drivers/media/i2c/os02g10.c
> @@ -0,0 +1,1039 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * V4L2 Support for the OS02G10
> + *
> + * Copyright (C) 2026 Silicon Signals Pvt. Ltd.
> + *
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/bitops.h>
> +#include <linux/cleanup.h>
> +#include <linux/clk.h>
> +#include <linux/container_of.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/units.h>
> +#include <linux/types.h>
> +#include <linux/time.h>
> +#include <linux/regmap.h>
> +
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mediabus.h>
> +
> +#define OS02G10_XCLK_FREQ			(24 * HZ_PER_MHZ)
> +
> +/* Add page number in CCI private bits [31:28] of the register address */
> +#define OS02G10_PAGE_REG8(p, x)	 (((p) << CCI_REG_PRIVATE_SHIFT) | CCI_REG8(x))
> +#define OS02G10_PAGE_REG16(p, x) (((p) << CCI_REG_PRIVATE_SHIFT) | CCI_REG16(x))
> +#define OS02G10_PAGE_REG24(p, x) (((p) << CCI_REG_PRIVATE_SHIFT) | CCI_REG24(x))

I just noticed regmap supports paging through register ranges. Could this
work for the driver as-is?

> +
> +#define OS02G10_REG_PAGE_SELECT			CCI_REG8(0xfd)
> +
> +/* Page 0 */
> +#define OS02G10_REG_CHIPID			OS02G10_PAGE_REG24(0x00, 0x02)
> +#define OS02G10_CHIPID				0x560247
> +
> +#define OS02G10_REG_PLL_DIV_CTRL		OS02G10_PAGE_REG8(0x00, 0x30)
> +#define OS02G10_REG_PLL_DCTL_BIAS_CTRL		OS02G10_PAGE_REG8(0x00, 0x35)
> +#define OS02G10_REG_GATE_EN_CTRL		OS02G10_PAGE_REG8(0x00, 0x38)
> +#define OS02G10_REG_DPLL_NC			OS02G10_PAGE_REG8(0x00, 0x41)
> +#define OS02G10_REG_MP_PHASE_CTRL		OS02G10_PAGE_REG8(0x00, 0x44)
> +
> +/* Page 1 */
> +#define OS02G10_REG_STREAM_CTRL			OS02G10_PAGE_REG8(0x01, 0xb1)
> +#define OS02G10_STREAM_CTRL_ON			0x03
> +#define OS02G10_STREAM_CTRL_OFF			0x00
> +
> +#define OS02G10_REG_FRAME_SYNC			OS02G10_PAGE_REG8(0x01, 0x01)
> +
> +#define OS02G10_REG_FRAME_LENGTH		OS02G10_PAGE_REG16(0x01, 0x0e)
> +#define OS02G10_FRAME_LENGTH_MAX		0xffff
> +#define OS02G10_REG_HBLANK			OS02G10_PAGE_REG16(0x01, 0x09)
> +
> +#define OS02G10_REG_FRAME_TEST_CTRL		OS02G10_PAGE_REG8(0x01, 0x0d)
> +#define OS02G10_FRAME_EXP_SEPERATE_EN		BIT(4)
> +#define OS02G10_TEST_PATTERN_ENABLE		BIT(0)
> +
> +#define OS02G10_REG_ULP_PWD_DUMMY_CTRL		OS02G10_PAGE_REG8(0x01, 0x3c)
> +#define OS02G10_REG_DC_LEVEL_LIMIT_EN		OS02G10_PAGE_REG8(0x01, 0x46)
> +#define OS02G10_REG_DC_LEVEL_LIMIT_L		OS02G10_PAGE_REG8(0x01, 0x47)
> +#define OS02G10_REG_BLC_DATA_LIMIT_L		OS02G10_PAGE_REG8(0x01, 0x48)
> +#define OS02G10_REG_DC_BLC_LIMIT_H		OS02G10_PAGE_REG8(0x01, 0x49)
> +
> +#define OS02G10_REG_HS_LP_CTRL			OS02G10_PAGE_REG8(0x01, 0x92)
> +#define OS02G10_REG_HS_LEVEL			OS02G10_PAGE_REG8(0x01, 0x9d)
> +#define OS02G10_REG_HS_DRV			OS02G10_PAGE_REG8(0x01, 0x9e)
> +
> +#define OS02G10_REG_GB_SUBOFFSET		OS02G10_PAGE_REG8(0x01, 0xf0)
> +#define OS02G10_REG_BLUE_SUBOFFSET		OS02G10_PAGE_REG8(0x01, 0xf1)
> +#define OS02G10_REG_RED_SUBOFFSET		OS02G10_PAGE_REG8(0x01, 0xf2)
> +#define OS02G10_REG_GR_SUBOFFSET		OS02G10_PAGE_REG8(0x01, 0xf3)
> +
> +#define OS02G10_REG_ABL_TRIGGER			OS02G10_PAGE_REG8(0x01, 0xfa)
> +#define OS02G10_REG_ABL				OS02G10_PAGE_REG8(0x01, 0xfb)
> +
> +#define OS02G10_REG_H_SIZE_MIPI			OS02G10_PAGE_REG16(0x01, 0x8e)
> +#define OS02G10_REG_V_SIZE_MIPI			OS02G10_PAGE_REG16(0x01, 0x90)
> +#define OS02G10_REG_MIPI_TX_SPEED_CTRL		OS02G10_PAGE_REG8(0x01, 0xa1)
> +
> +#define OS02G10_REG_LONG_EXPOSURE		OS02G10_PAGE_REG16(0x01, 0x03)
> +#define OS02G10_EXPOSURE_MIN			4
> +#define OS02G10_EXPOSURE_STEP			1
> +#define OS02G10_EXPOSURE_MARGIN			9
> +
> +#define OS02G10_REG_ANALOG_GAIN			OS02G10_PAGE_REG8(0x01, 0x24)
> +#define OS02G10_ANALOG_GAIN_MIN			0x10
> +#define OS02G10_ANALOG_GAIN_MAX			0xf8
> +#define OS02G10_ANALOG_GAIN_STEP		1
> +#define OS02G10_ANALOG_GAIN_DEFAULT		0x10
> +
> +#define OS02G10_REG_DIGITAL_GAIN_H		OS02G10_PAGE_REG8(0x01, 0x37)
> +#define OS02G10_REG_DIGITAL_GAIN_L		OS02G10_PAGE_REG8(0x01, 0x39)
> +#define OS02G10_DIGITAL_GAIN_MIN		0x40
> +#define OS02G10_DIGITAL_GAIN_MAX		0x800
> +#define OS02G10_DIGITAL_GAIN_STEP		64
> +#define OS02G10_DIGITAL_GAIN_DEFAULT		0x40
> +
> +#define OS02G10_REG_FLIP_MIRROR			OS02G10_PAGE_REG8(0x01, 0x3f)
> +#define OS02G10_FLIP				BIT(1)
> +#define OS02G10_MIRROR				BIT(0)
> +
> +/* Page 2 */
> +#define OS02G10_REG_V_START			OS02G10_PAGE_REG16(0x02, 0xa0)
> +#define OS02G10_REG_V_SIZE			OS02G10_PAGE_REG16(0x02, 0xa2)
> +#define OS02G10_REG_H_START			OS02G10_PAGE_REG16(0x02, 0xa4)
> +#define OS02G10_REG_H_SIZE			OS02G10_PAGE_REG16(0x02, 0xa6)
> +
> +#define OS02G10_REG_SIF_CTRL			OS02G10_PAGE_REG8(0x02, 0x5e)
> +#define OS02G10_ORIENTATION_BAYER_FIX		0x32
> +
> +#define OS02G10_LINK_FREQ_720MHZ		(720 * HZ_PER_MHZ)
> +
> +/* OS02G10 native and active pixel array size */
> +static const struct v4l2_rect os02g10_native_area = {
> +	.top = 0,
> +	.left = 0,
> +	.width = 1928,
> +	.height = 1088,
> +};
> +
> +static const struct v4l2_rect os02g10_active_area = {
> +	.top = 4,
> +	.left = 4,
> +	.width = 1920,
> +	.height = 1080,
> +};
> +
> +static const char * const os02g10_supply_name[] = {
> +	"avdd",		/* Analog power */
> +	"dovdd",	/* Digital I/O power */
> +	"dvdd",		/* Digital core power */
> +};
> +
> +struct os02g10 {
> +	struct device *dev;
> +	struct regmap *cci;
> +	struct v4l2_subdev sd;
> +	struct media_pad pad;
> +	struct clk *xclk;
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(os02g10_supply_name)];
> +
> +	/* V4L2 Controls */
> +	struct v4l2_ctrl_handler handler;
> +	struct v4l2_ctrl *link_freq;
> +	struct v4l2_ctrl *hblank;
> +	struct v4l2_ctrl *vblank;
> +	struct v4l2_ctrl *exposure;
> +	struct v4l2_ctrl *vflip;
> +	struct v4l2_ctrl *hflip;
> +
> +	u32 link_freq_index;
> +
> +	u8 current_page;
> +	struct mutex page_lock;
> +};
> +
> +struct os02g10_mode {
> +	u32 width;
> +	u32 height;
> +	u32 vts_def;
> +	u32 hts_def;
> +	u32 exp_def;
> +	u32 x_start;
> +	u32 y_start;
> +};
> +
> +static const struct cci_reg_sequence os02g10_common_regs[] = {
> +	{ OS02G10_REG_PLL_DIV_CTRL,		0x0a},
> +	{ OS02G10_REG_PLL_DCTL_BIAS_CTRL,	0x04},
> +	{ OS02G10_REG_GATE_EN_CTRL,		0x11},
> +	{ OS02G10_REG_DPLL_NC,			0x06},
> +	{ OS02G10_REG_MP_PHASE_CTRL,		0x20},
> +	{ OS02G10_PAGE_REG8(0x01, 0x19),	0x50},
> +	{ OS02G10_PAGE_REG8(0x01, 0x1a),	0x0c},
> +	{ OS02G10_PAGE_REG8(0x01, 0x1b),	0x0d},
> +	{ OS02G10_PAGE_REG8(0x01, 0x1c),	0x00},
> +	{ OS02G10_PAGE_REG8(0x01, 0x1d),	0x75},
> +	{ OS02G10_PAGE_REG8(0x01, 0x1e),	0x52},
> +	{ OS02G10_PAGE_REG8(0x01, 0x22),	0x14},
> +	{ OS02G10_PAGE_REG8(0x01, 0x25),	0x44},
> +	{ OS02G10_PAGE_REG8(0x01, 0x26),	0x0f},
> +	{ OS02G10_REG_ULP_PWD_DUMMY_CTRL,	0xca},
> +	{ OS02G10_PAGE_REG8(0x01, 0x3d),	0x4a},
> +	{ OS02G10_PAGE_REG8(0x01, 0x40),	0x0f},
> +	{ OS02G10_PAGE_REG8(0x01, 0x43),	0x38},
> +	{ OS02G10_REG_DC_LEVEL_LIMIT_EN,	0x01},
> +	{ OS02G10_REG_DC_LEVEL_LIMIT_L,		0x00},
> +	{ OS02G10_REG_DC_BLC_LIMIT_H,		0x32},
> +	{ OS02G10_PAGE_REG8(0x01, 0x50),	0x01},
> +	{ OS02G10_PAGE_REG8(0x01, 0x51),	0x28},
> +	{ OS02G10_PAGE_REG8(0x01, 0x52),	0x20},
> +	{ OS02G10_PAGE_REG8(0x01, 0x53),	0x03},
> +	{ OS02G10_PAGE_REG8(0x01, 0x57),	0x16},
> +	{ OS02G10_PAGE_REG8(0x01, 0x59),	0x01},
> +	{ OS02G10_PAGE_REG8(0x01, 0x5a),	0x01},
> +	{ OS02G10_PAGE_REG8(0x01, 0x5d),	0x04},
> +	{ OS02G10_PAGE_REG8(0x01, 0x6a),	0x04},
> +	{ OS02G10_PAGE_REG8(0x01, 0x6b),	0x03},
> +	{ OS02G10_PAGE_REG8(0x01, 0x6e),	0x28},
> +	{ OS02G10_PAGE_REG8(0x01, 0x71),	0xc2},
> +	{ OS02G10_PAGE_REG8(0x01, 0x72),	0x04},
> +	{ OS02G10_PAGE_REG8(0x01, 0x73),	0x38},
> +	{ OS02G10_PAGE_REG8(0x01, 0x74),	0x04},
> +	{ OS02G10_PAGE_REG8(0x01, 0x79),	0x00},
> +	{ OS02G10_PAGE_REG8(0x01, 0x7a),	0xb2},
> +	{ OS02G10_PAGE_REG8(0x01, 0x7b),	0x10},
> +	{ OS02G10_REG_HS_LP_CTRL,		0x02},
> +	{ OS02G10_REG_HS_LEVEL,			0x03},
> +	{ OS02G10_REG_HS_DRV,			0x55},
> +	{ OS02G10_PAGE_REG8(0x01, 0xb8),	0x70},
> +	{ OS02G10_PAGE_REG8(0x01, 0xb9),	0x70},
> +	{ OS02G10_PAGE_REG8(0x01, 0xba),	0x70},
> +	{ OS02G10_PAGE_REG8(0x01, 0xbb),	0x70},
> +	{ OS02G10_PAGE_REG8(0x01, 0xbc),	0x00},
> +	{ OS02G10_PAGE_REG8(0x01, 0xc4),	0x6d},
> +	{ OS02G10_PAGE_REG8(0x01, 0xc5),	0x6d},
> +	{ OS02G10_PAGE_REG8(0x01, 0xc6),	0x6d},
> +	{ OS02G10_PAGE_REG8(0x01, 0xc7),	0x6d},
> +	{ OS02G10_PAGE_REG8(0x01, 0xcc),	0x11},
> +	{ OS02G10_PAGE_REG8(0x01, 0xcd),	0xe0},
> +	{ OS02G10_PAGE_REG8(0x01, 0xd0),	0x1b},
> +	{ OS02G10_PAGE_REG8(0x01, 0xd2),	0x76},
> +	{ OS02G10_PAGE_REG8(0x01, 0xd3),	0x68},
> +	{ OS02G10_PAGE_REG8(0x01, 0xd4),	0x68},
> +	{ OS02G10_PAGE_REG8(0x01, 0xd5),	0x73},
> +	{ OS02G10_PAGE_REG8(0x01, 0xd6),	0x73},
> +	{ OS02G10_PAGE_REG8(0x01, 0xe8),	0x55},
> +	{ OS02G10_REG_GB_SUBOFFSET,		0x40},
> +	{ OS02G10_REG_BLUE_SUBOFFSET,		0x40},
> +	{ OS02G10_REG_RED_SUBOFFSET,		0x40},
> +	{ OS02G10_REG_GR_SUBOFFSET,		0x40},
> +	{ OS02G10_REG_ABL_TRIGGER,		0x1c},
> +	{ OS02G10_REG_ABL,			0x33},
> +	{ OS02G10_PAGE_REG8(0x01, 0xfc),	0x80},
> +	{ OS02G10_PAGE_REG8(0x01, 0xfe),	0x80},
> +	{ OS02G10_PAGE_REG8(0x03, 0x03),	0x67},
> +	{ OS02G10_PAGE_REG8(0x03, 0x00),	0x59},
> +	{ OS02G10_PAGE_REG8(0x03, 0x04),	0x11},
> +	{ OS02G10_PAGE_REG8(0x03, 0x05),	0x04},
> +	{ OS02G10_PAGE_REG8(0x03, 0x06),	0x0c},
> +	{ OS02G10_PAGE_REG8(0x03, 0x07),	0x08},
> +	{ OS02G10_PAGE_REG8(0x03, 0x08),	0x08},
> +	{ OS02G10_PAGE_REG8(0x03, 0x09),	0x4f},
> +	{ OS02G10_PAGE_REG8(0x03, 0x0b),	0x08},
> +	{ OS02G10_PAGE_REG8(0x03, 0x0d),	0x26},
> +	{ OS02G10_PAGE_REG8(0x03, 0x0f),	0x00},
> +	{ OS02G10_PAGE_REG8(0x02, 0x34),	0xfe},
> +	{ OS02G10_REG_MIPI_TX_SPEED_CTRL,	0x05},
> +};
> +
> +static const struct os02g10_mode supported_modes[] = {
> +	{
> +		.width = 1920,
> +		.height = 1080,
> +		.vts_def = 1246,
> +		.hts_def = 1082,
> +		.exp_def = 1100,
> +		.x_start = 2,
> +		.y_start = 6,
> +	},
> +};
> +
> +static const s64 link_freq_menu_items[] = {
> +	OS02G10_LINK_FREQ_720MHZ,
> +};
> +
> +static const char * const os02g10_test_pattern_menu[] = {
> +	"Disabled",
> +	"Colorbar",
> +};
> +
> +static int os02g10_page_access(struct os02g10 *os02g10, u32 reg, int *err)
> +{
> +	u8 page = (reg & CCI_REG_PRIVATE_MASK) >> CCI_REG_PRIVATE_SHIFT;
> +	int ret = 0;
> +
> +	if (err && *err)
> +		return *err;
> +
> +	guard(mutex)(&os02g10->page_lock);
> +
> +	/* Perform page access before read/write */
> +	if (os02g10->current_page == page)
> +		return ret;
> +
> +	ret = cci_write(os02g10->cci, OS02G10_REG_PAGE_SELECT, page, err);
> +	if (!ret)
> +		os02g10->current_page = page;
> +
> +	return ret;
> +}
> +
> +static int os02g10_read(struct os02g10 *os02g10, u32 reg, u64 *val, int *err)
> +{
> +	u32 addr = reg & ~CCI_REG_PRIVATE_MASK;
> +	int ret;
> +
> +	ret = os02g10_page_access(os02g10, reg, err);
> +	if (ret)
> +		return ret;
> +
> +	return cci_read(os02g10->cci, addr, val, err);
> +}
> +
> +static int os02g10_write(struct os02g10 *os02g10, u32 reg, u64 val, int *err)
> +{
> +	u32 addr = reg & ~CCI_REG_PRIVATE_MASK;
> +	int ret;
> +
> +	ret = os02g10_page_access(os02g10, reg, err);
> +	if (ret)
> +		return ret;
> +
> +	return cci_write(os02g10->cci, addr, val, err);
> +}
> +
> +static int os02g10_update_bits(struct os02g10 *os02g10, u32 reg, u64 mask,
> +			       u64 val, int *err)
> +{
> +	u32 addr = reg & ~CCI_REG_PRIVATE_MASK;
> +	int ret;
> +
> +	ret = os02g10_page_access(os02g10, reg, err);
> +	if (ret)
> +		return ret;
> +
> +	return cci_update_bits(os02g10->cci, addr, mask, val, err);
> +}
> +
> +static int os02g10_multi_reg_write(struct os02g10 *os02g10,
> +				   const struct cci_reg_sequence *regs,
> +				   unsigned int num_regs, int *err)
> +{
> +	unsigned int i;
> +	int ret;
> +
> +	for (i = 0; i < num_regs; i++) {
> +		ret = os02g10_write(os02g10, regs[i].reg, regs[i].val, err);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static inline struct os02g10 *to_os02g10(struct v4l2_subdev *_sd)
> +{
> +	return container_of_const(_sd, struct os02g10, sd);

You can call "_sd" "sd".

> +}
> +
> +static u32 os02g10_get_format_code(struct os02g10 *os02g10)
> +{
> +	static const u32 codes[2][2] = {
> +		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
> +		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
> +	};
> +

Extra newline.

> +	u32 code = codes[os02g10->vflip->val][os02g10->hflip->val];
> +
> +	return code;
> +}
> +
> +static int os02g10_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct os02g10 *os02g10 = container_of_const(ctrl->handler,
> +						     struct os02g10, handler);
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_mbus_framefmt *fmt;
> +	int ret = 0;
> +
> +	state = v4l2_subdev_get_locked_active_state(&os02g10->sd);
> +	fmt = v4l2_subdev_state_get_format(state, 0);
> +
> +	if (ctrl->id == V4L2_CID_VBLANK) {
> +		/* Honour the VBLANK limits when setting exposure */
> +		s64 max = fmt->height + ctrl->val - OS02G10_EXPOSURE_MARGIN;
> +
> +		ret = __v4l2_ctrl_modify_range(os02g10->exposure,
> +					       os02g10->exposure->minimum, max,
> +					       os02g10->exposure->step,
> +					       os02g10->exposure->default_value);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (pm_runtime_get_if_active(os02g10->dev) == 0)
> +		return 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE:
> +		os02g10_write(os02g10, OS02G10_REG_LONG_EXPOSURE, ctrl->val, &ret);
> +		break;
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		os02g10_write(os02g10, OS02G10_REG_ANALOG_GAIN, ctrl->val, &ret);
> +		break;
> +	case V4L2_CID_DIGITAL_GAIN:
> +		os02g10_write(os02g10, OS02G10_REG_DIGITAL_GAIN_L,
> +			      (ctrl->val & 0xff), &ret);
> +		os02g10_write(os02g10, OS02G10_REG_DIGITAL_GAIN_H,
> +			      ((ctrl->val >> 8) & 0x7), &ret);
> +		break;
> +	case V4L2_CID_VBLANK:
> +		u64 vts = ctrl->val + fmt->height;
> +
> +		os02g10_update_bits(os02g10, OS02G10_REG_FRAME_TEST_CTRL,
> +				    OS02G10_FRAME_EXP_SEPERATE_EN,
> +				    OS02G10_FRAME_EXP_SEPERATE_EN, &ret);
> +		os02g10_write(os02g10, OS02G10_REG_FRAME_LENGTH, vts, &ret);
> +		break;
> +	case V4L2_CID_HFLIP:
> +	case V4L2_CID_VFLIP:
> +		os02g10_write(os02g10, OS02G10_REG_FLIP_MIRROR,
> +			      os02g10->hflip->val | os02g10->vflip->val << 1,
> +			      &ret);
> +		os02g10_write(os02g10, OS02G10_REG_SIF_CTRL,
> +			      OS02G10_ORIENTATION_BAYER_FIX, &ret);
> +		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		os02g10_update_bits(os02g10,
> +				    OS02G10_REG_FRAME_TEST_CTRL,
> +				    OS02G10_TEST_PATTERN_ENABLE,
> +				    ctrl->val ? OS02G10_TEST_PATTERN_ENABLE : 0,
> +				    &ret);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +	os02g10_write(os02g10, OS02G10_REG_FRAME_SYNC, 0x01, &ret);
> +
> +	pm_runtime_put(os02g10->dev);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops os02g10_ctrl_ops = {
> +	.s_ctrl = os02g10_set_ctrl,
> +};
> +
> +static int os02g10_init_controls(struct os02g10 *os02g10)
> +{
> +	const struct os02g10_mode *mode = &supported_modes[0];
> +	u64 vblank_def, hblank_def, exp_max, pixel_rate;
> +	struct v4l2_fwnode_device_properties props;
> +	struct v4l2_ctrl_handler *ctrl_hdlr;
> +	int ret;
> +
> +	ctrl_hdlr = &os02g10->handler;
> +	v4l2_ctrl_handler_init(ctrl_hdlr, 12);
> +
> +	/* pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
> +	pixel_rate = div_u64(OS02G10_LINK_FREQ_720MHZ * 2 * 2, 10);
> +	v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops, V4L2_CID_PIXEL_RATE, 0,
> +			  pixel_rate, 1, pixel_rate);
> +
> +	os02g10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os02g10_ctrl_ops,
> +						    V4L2_CID_LINK_FREQ,
> +						    os02g10->link_freq_index,
> +						    0, link_freq_menu_items);
> +	if (os02g10->link_freq)
> +		os02g10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	/*
> +	 * Multiply by 2 to ensure positive hblank.

V4L2 controls can also have negative values, there's no need to multiply
line length in pixels for this reason.

> +	 * Datasheet does not provide information about the unit of HTS.
> +	 */
> +	hblank_def = (mode->hts_def * 2) - mode->width;
> +	os02g10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
> +					    V4L2_CID_HBLANK, hblank_def, hblank_def,
> +					    1, hblank_def);
> +	if (os02g10->hblank)
> +		os02g10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	vblank_def = mode->vts_def - mode->height;
> +	os02g10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
> +					    V4L2_CID_VBLANK, vblank_def,
> +					    OS02G10_FRAME_LENGTH_MAX - mode->height,
> +					    1, vblank_def);
> +
> +	exp_max = mode->vts_def - OS02G10_EXPOSURE_MARGIN;
> +	os02g10->exposure =
> +		v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
> +				  V4L2_CID_EXPOSURE,
> +				  OS02G10_EXPOSURE_MIN, exp_max,
> +				  OS02G10_EXPOSURE_STEP, mode->exp_def);
> +
> +	v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
> +			  V4L2_CID_ANALOGUE_GAIN, OS02G10_ANALOG_GAIN_MIN,
> +			  OS02G10_ANALOG_GAIN_MAX, OS02G10_ANALOG_GAIN_STEP,
> +			  OS02G10_ANALOG_GAIN_DEFAULT);
> +
> +	v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
> +			  V4L2_CID_DIGITAL_GAIN, OS02G10_DIGITAL_GAIN_MIN,
> +			  OS02G10_DIGITAL_GAIN_MAX, OS02G10_DIGITAL_GAIN_STEP,
> +			  OS02G10_DIGITAL_GAIN_DEFAULT);
> +
> +	os02g10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
> +					   V4L2_CID_HFLIP, 0, 1, 1, 0);
> +	if (os02g10->hflip)
> +		os02g10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +
> +	os02g10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
> +					   V4L2_CID_VFLIP, 0, 1, 1, 0);
> +	if (os02g10->vflip)
> +		os02g10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +
> +	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &os02g10_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(os02g10_test_pattern_menu) - 1,
> +				     0, 0, os02g10_test_pattern_menu);
> +	if (ctrl_hdlr->error) {

You can skip this error check; doing this after
v4l2_ctrl_new_fwnode_properties() is enough.

> +		ret = ctrl_hdlr->error;
> +		dev_err(os02g10->dev, "control init failed (%d)\n", ret);
> +		goto err_handler_free;
> +	}
> +
> +	ret = v4l2_fwnode_device_parse(os02g10->dev, &props);
> +	if (ret)
> +		goto err_handler_free;
> +
> +	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr,
> +					      &os02g10_ctrl_ops, &props);
> +	if (ret)
> +		goto err_handler_free;
> +
> +	os02g10->sd.ctrl_handler = ctrl_hdlr;
> +
> +	return 0;
> +
> +err_handler_free:
> +	v4l2_ctrl_handler_free(ctrl_hdlr);
> +
> +	return ret;
> +}
> +
> +static int os02g10_set_framefmt(struct os02g10 *os02g10,
> +				struct v4l2_subdev_state *state)
> +{
> +	const struct v4l2_mbus_framefmt *format;
> +	const struct os02g10_mode *mode;
> +	int ret = 0;
> +
> +	format = v4l2_subdev_state_get_format(state, 0);
> +	mode = v4l2_find_nearest_size(supported_modes,
> +				      ARRAY_SIZE(supported_modes), width,
> +				      height, format->width, format->height);
> +
> +	os02g10_write(os02g10, OS02G10_REG_V_START, mode->y_start, &ret);
> +	os02g10_write(os02g10, OS02G10_REG_V_SIZE, mode->height, &ret);
> +	os02g10_write(os02g10, OS02G10_REG_V_SIZE_MIPI, mode->height, &ret);
> +	os02g10_write(os02g10, OS02G10_REG_H_START, mode->x_start, &ret);
> +	os02g10_write(os02g10, OS02G10_REG_H_SIZE, mode->width, &ret);
> +	os02g10_write(os02g10, OS02G10_REG_H_SIZE_MIPI, mode->width, &ret);
> +
> +	return ret;
> +}
> +
> +static int os02g10_enable_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state, u32 pad,
> +				  u64 streams_mask)
> +{
> +	struct os02g10 *os02g10 = to_os02g10(sd);
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(os02g10->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = os02g10_multi_reg_write(os02g10, os02g10_common_regs,
> +				      ARRAY_SIZE(os02g10_common_regs), NULL);
> +	if (ret) {
> +		dev_err(os02g10->dev, "failed to write common registers\n");
> +		goto err_rpm_put;
> +	}
> +
> +	ret = os02g10_set_framefmt(os02g10, state);
> +	if (ret) {
> +		dev_err(os02g10->dev, "failed to set frame foramt\n");
> +		goto err_rpm_put;
> +	}
> +
> +	/* Apply customized values from user */
> +	ret = __v4l2_ctrl_handler_setup(os02g10->sd.ctrl_handler);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	ret = os02g10_write(os02g10, OS02G10_REG_STREAM_CTRL,
> +			    OS02G10_STREAM_CTRL_ON, NULL);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	/* vflip and hflip cannot change during streaming */
> +	__v4l2_ctrl_grab(os02g10->vflip, true);
> +	__v4l2_ctrl_grab(os02g10->hflip, true);
> +
> +	return 0;
> +
> +err_rpm_put:
> +	pm_runtime_put(os02g10->dev);
> +	return ret;
> +}
> +
> +static int os02g10_disable_streams(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state, u32 pad,
> +				   u64 streams_mask)
> +{
> +	struct os02g10 *os02g10 = to_os02g10(sd);
> +	int ret;
> +
> +	ret = os02g10_write(os02g10, OS02G10_REG_STREAM_CTRL,
> +			    OS02G10_STREAM_CTRL_OFF, NULL);
> +	if (ret)
> +		dev_err(os02g10->dev, "Failed to stop stream\n");
> +
> +	__v4l2_ctrl_grab(os02g10->vflip, false);
> +	__v4l2_ctrl_grab(os02g10->hflip, false);
> +
> +	pm_runtime_put(os02g10->dev);
> +
> +	return ret;
> +}
> +
> +static int os02g10_get_selection(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_selection *sel)
> +{
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> +		sel->r = os02g10_native_area;
> +		return 0;
> +	case V4L2_SEL_TGT_CROP:
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +		sel->r = os02g10_active_area;
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int os02g10_enum_mbus_code(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	struct os02g10 *os02g10 = to_os02g10(sd);
> +
> +	if (code->index)
> +		return -EINVAL;
> +
> +	code->code = os02g10_get_format_code(os02g10);
> +
> +	return 0;
> +}
> +
> +static int os02g10_enum_frame_size(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *sd_state,
> +				   struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	struct os02g10 *os02g10 = to_os02g10(sd);
> +
> +	if (fse->index >= ARRAY_SIZE(supported_modes))
> +		return -EINVAL;
> +
> +	if (fse->code != os02g10_get_format_code(os02g10))
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
> +static int os02g10_set_pad_format(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_format *fmt)
> +{
> +	struct os02g10 *os02g10 = to_os02g10(sd);
> +	struct v4l2_mbus_framefmt *format;
> +	const struct os02g10_mode *mode;
> +	int ret;
> +
> +	format = v4l2_subdev_state_get_format(sd_state, 0);
> +
> +	mode = v4l2_find_nearest_size(supported_modes,
> +				      ARRAY_SIZE(supported_modes),
> +				      width, height,
> +				      fmt->format.width, fmt->format.height);
> +
> +	fmt->format.code = os02g10_get_format_code(os02g10);
> +	fmt->format.width = mode->width;
> +	fmt->format.height = mode->height;
> +	fmt->format.field = V4L2_FIELD_NONE;
> +	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
> +	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
> +
> +	*format = fmt->format;
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> +		u32 vblank_def = mode->vts_def - mode->height;

You can declare ret here.

> +
> +		ret = __v4l2_ctrl_modify_range(os02g10->vblank, vblank_def,
> +					       OS02G10_FRAME_LENGTH_MAX -
> +					       mode->height, 1, vblank_def);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int os02g10_init_state(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *state)
> +{
> +	struct os02g10 *os02g10 = to_os02g10(sd);
> +	struct v4l2_subdev_format fmt = {
> +		.which = V4L2_SUBDEV_FORMAT_TRY,
> +		.format = {
> +			.code = os02g10_get_format_code(os02g10),
> +			.width = supported_modes[0].width,
> +			.height = supported_modes[0].height,
> +		},
> +	};
> +
> +	os02g10_set_pad_format(sd, state, &fmt);
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_video_ops os02g10_video_ops = {
> +	.s_stream = v4l2_subdev_s_stream_helper,
> +};
> +
> +static const struct v4l2_subdev_pad_ops os02g10_pad_ops = {
> +	.enum_mbus_code = os02g10_enum_mbus_code,
> +	.get_fmt = v4l2_subdev_get_fmt,
> +	.set_fmt = os02g10_set_pad_format,
> +	.get_selection = os02g10_get_selection,
> +	.enum_frame_size = os02g10_enum_frame_size,
> +	.enable_streams = os02g10_enable_streams,
> +	.disable_streams = os02g10_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_ops os02g10_subdev_ops = {
> +	.video = &os02g10_video_ops,
> +	.pad = &os02g10_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops os02g10_internal_ops = {
> +	.init_state = os02g10_init_state,
> +};
> +
> +static int os02g10_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct os02g10 *os02g10 = to_os02g10(sd);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(os02g10_supply_name),
> +				    os02g10->supplies);
> +	if (ret) {
> +		dev_err(os02g10->dev, "failed to enable regulators\n");
> +		return ret;
> +	}
> +
> +	/* T4: delay from DOVDD stable to MCLK on */
> +	fsleep(5 * USEC_PER_MSEC);
> +
> +	ret = clk_prepare_enable(os02g10->xclk);
> +	if (ret) {
> +		dev_err(os02g10->dev, "failed to enable clock\n");
> +		goto err_regulator_off;
> +	}
> +
> +	/* T3: delay from DVDD stable to sensor power up stable */
> +	fsleep(5 * USEC_PER_MSEC);
> +
> +	gpiod_set_value_cansleep(os02g10->reset_gpio, 0);
> +
> +	/* T5: delay from sensor power up stable to SCCB initialization */
> +	fsleep(5 * USEC_PER_MSEC);
> +
> +	return 0;
> +
> +err_regulator_off:
> +	regulator_bulk_disable(ARRAY_SIZE(os02g10_supply_name), os02g10->supplies);
> +	return ret;
> +}
> +
> +static int os02g10_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct os02g10 *os02g10 = to_os02g10(sd);
> +
> +	clk_disable_unprepare(os02g10->xclk);
> +	gpiod_set_value_cansleep(os02g10->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(os02g10_supply_name), os02g10->supplies);
> +
> +	return 0;
> +}
> +
> +static int os02g10_identify_module(struct os02g10 *os02g10)
> +{
> +	u64 chip_id;
> +	int ret;
> +
> +	ret = os02g10_read(os02g10, OS02G10_REG_CHIPID, &chip_id, NULL);
> +	if (ret)
> +		return dev_err_probe(os02g10->dev, ret,
> +				     "failed to read chip id %x\n",
> +				     OS02G10_CHIPID);
> +
> +	if (chip_id != OS02G10_CHIPID)
> +		return dev_err_probe(os02g10->dev, -EIO,
> +				     "chip id mismatch: %x!=%llx\n",
> +				     OS02G10_CHIPID, chip_id);
> +
> +	return 0;
> +}
> +
> +static int os02g10_parse_endpoint(struct os02g10 *os02g10)
> +{
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};
> +	unsigned long link_freq_bitmap;
> +	struct fwnode_handle *ep;
> +	int ret;
> +
> +	ep = fwnode_graph_get_next_endpoint(dev_fwnode(os02g10->dev), NULL);
> +	if (!ep)

You can omit this check.

> +		return dev_err_probe(os02g10->dev, -ENXIO,
> +				     "Failed to get next endpoint\n");
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;
> +
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
> +		ret = dev_err_probe(os02g10->dev, -EINVAL,
> +				    "only 2 data lanes are supported\n");
> +		goto error_out;
> +	}
> +
> +	ret = v4l2_link_freq_to_bitmap(os02g10->dev, bus_cfg.link_frequencies,
> +				       bus_cfg.nr_of_link_frequencies,
> +				       link_freq_menu_items,
> +				       ARRAY_SIZE(link_freq_menu_items),
> +				       &link_freq_bitmap);
> +	if (ret) {
> +		ret = dev_err_probe(os02g10->dev, -EINVAL,
> +				    "only 720MHz frequency is available\n");
> +		goto error_out;
> +	}
> +
> +	os02g10->link_freq_index = __ffs(link_freq_bitmap);

Could you rely on the value of the control?

> +
> +error_out:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +};
> +
> +static int os02g10_probe(struct i2c_client *client)
> +{
> +	struct os02g10 *os02g10;
> +	unsigned int xclk_freq;
> +	int ret;
> +
> +	os02g10 = devm_kzalloc(&client->dev, sizeof(*os02g10), GFP_KERNEL);
> +	if (!os02g10)
> +		return -ENOMEM;
> +
> +	os02g10->dev = &client->dev;
> +
> +	v4l2_i2c_subdev_init(&os02g10->sd, client, &os02g10_subdev_ops);
> +	os02g10->sd.internal_ops = &os02g10_internal_ops;
> +
> +	os02g10->cci = devm_cci_regmap_init_i2c(client, 8);
> +	if (IS_ERR(os02g10->cci))
> +		return dev_err_probe(os02g10->dev, PTR_ERR(os02g10->cci),
> +				     "failed to initialize CCI\n");
> +
> +	/* Set Current page to 0 */
> +	os02g10->current_page = 0;
> +
> +	ret = devm_mutex_init(os02g10->dev, &os02g10->page_lock);
> +	if (ret)
> +		return dev_err_probe(os02g10->dev, ret,
> +				     "Failed to initialize lock\n");
> +
> +	/* Get system clock (xvclk) */
> +	os02g10->xclk = devm_v4l2_sensor_clk_get(os02g10->dev, NULL);
> +	if (IS_ERR(os02g10->xclk))
> +		return dev_err_probe(os02g10->dev, PTR_ERR(os02g10->xclk),
> +				     "failed to get xclk\n");
> +
> +	xclk_freq = clk_get_rate(os02g10->xclk);
> +	if (xclk_freq != OS02G10_XCLK_FREQ)
> +		return dev_err_probe(os02g10->dev, -EINVAL,
> +				     "xclk frequency not supported: %u Hz\n",
> +				     xclk_freq);
> +
> +	for (unsigned int i = 0; i < ARRAY_SIZE(os02g10_supply_name); i++)
> +		os02g10->supplies[i].supply = os02g10_supply_name[i];
> +
> +	ret = devm_regulator_bulk_get(os02g10->dev,
> +				      ARRAY_SIZE(os02g10_supply_name),
> +				      os02g10->supplies);
> +	if (ret)
> +		return dev_err_probe(os02g10->dev, ret,
> +				     "failed to get regulators\n");
> +
> +	ret = os02g10_parse_endpoint(os02g10);

I'd do this first: in some cases driver probing ends up being done a few
times before it succeeds so getting regulators, GPIOs and clock is better
left after that.

> +	if (ret)
> +		return dev_err_probe(os02g10->dev, ret,
> +				     "failed to parse endpoint configuration\n");
> +
> +	os02g10->reset_gpio = devm_gpiod_get_optional(os02g10->dev,
> +						      "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(os02g10->reset_gpio))
> +		return dev_err_probe(os02g10->dev, PTR_ERR(os02g10->reset_gpio),
> +				     "failed to get reset GPIO\n");
> +
> +	ret = os02g10_power_on(os02g10->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = os02g10_identify_module(os02g10);
> +	if (ret)
> +		goto error_power_off;
> +
> +	ret = os02g10_init_controls(os02g10);
> +	if (ret)
> +		goto error_power_off;
> +
> +	/* Initialize subdev */
> +	os02g10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	os02g10->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	os02g10->pad.flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&os02g10->sd.entity, 1, &os02g10->pad);
> +	if (ret) {
> +		dev_err_probe(os02g10->dev, ret, "failed to init entity pads\n");
> +		goto error_handler_free;
> +	}
> +
> +	os02g10->sd.state_lock = os02g10->handler.lock;
> +	ret = v4l2_subdev_init_finalize(&os02g10->sd);
> +	if (ret) {
> +		dev_err_probe(os02g10->dev, ret, "subdev init error\n");
> +		goto error_media_entity;
> +	}
> +
> +	pm_runtime_set_active(os02g10->dev);
> +	pm_runtime_enable(os02g10->dev);
> +
> +	ret = v4l2_async_register_subdev_sensor(&os02g10->sd);
> +	if (ret) {
> +		dev_err_probe(os02g10->dev, ret,
> +			      "failed to register os02g10 sub-device\n");
> +		goto error_subdev_cleanup;
> +	}
> +
> +	pm_runtime_idle(os02g10->dev);

A newline here?

> +	return 0;
> +
> +error_subdev_cleanup:
> +	v4l2_subdev_cleanup(&os02g10->sd);
> +	pm_runtime_disable(os02g10->dev);
> +	pm_runtime_set_suspended(os02g10->dev);
> +
> +error_media_entity:
> +	media_entity_cleanup(&os02g10->sd.entity);
> +
> +error_handler_free:
> +	v4l2_ctrl_handler_free(os02g10->sd.ctrl_handler);
> +
> +error_power_off:
> +	os02g10_power_off(os02g10->dev);
> +
> +	return ret;
> +}
> +
> +static void os02g10_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct os02g10 *os02g10 = to_os02g10(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(&os02g10->sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(os02g10->sd.ctrl_handler);
> +
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev)) {
> +		os02g10_power_off(&client->dev);
> +		pm_runtime_set_suspended(&client->dev);
> +	}
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(os02g10_pm_ops,
> +				 os02g10_power_off, os02g10_power_on, NULL);
> +
> +static const struct of_device_id os02g10_id[] = {
> +	{ .compatible = "ovti,os02g10" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, os02g10_id);
> +
> +static struct i2c_driver os02g10_driver = {
> +	.driver = {
> +		.name = "os02g10",
> +		.pm = pm_ptr(&os02g10_pm_ops),
> +		.of_match_table = os02g10_id,
> +	},
> +	.probe = os02g10_probe,
> +	.remove = os02g10_remove,
> +};
> +module_i2c_driver(os02g10_driver);
> +
> +MODULE_DESCRIPTION("OS02G10 Camera Sensor Driver");
> +MODULE_AUTHOR("Tarang Raval <tarang.raval@siliconsignals.io>");
> +MODULE_AUTHOR("Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>");
> +MODULE_LICENSE("GPL");

-- 
Kind regards,

Sakari Ailus

