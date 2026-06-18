Return-Path: <linux-media+bounces-65195-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2sciNtHtM2oBJAYAu9opvQ
	(envelope-from <linux-media+bounces-65195-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 15:08:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 858746A0565
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 15:08:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=RRPB98X0;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65195-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65195-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D6B4A302A50B
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 13:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B283F7ABD;
	Thu, 18 Jun 2026 13:01:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B853F65EB;
	Thu, 18 Jun 2026 13:01:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787676; cv=none; b=ZjZXaa88nLrvxu7erjpwId12OqnpD3hOYmMJfwd7KV6HVf4DWx5bcERNCEDZ1jA59f3YiPJO9KUy6WBvawFknVKyf7MWTKLHzv2pIFkpRD5wjl38dKcvsH+rB0t2dzNf6AC8UioVk1Xh3E4vOZP2HCI4iP97SG9cA47xRfIB4no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787676; c=relaxed/simple;
	bh=Bo1ITd6K4fXu8vMAjdu/gVRpcR2tufgztgE7PnfpSYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khju27ufpCC2DLCYyj88CpFLeQGuV9w+a4aCirDDeZntXHwu5j5IoDaxji8skLdM+Gy905di1D/BB/Rqjx9aqIicpBuDWZRK8RPm8eU+unUNugh1mjIfRXVP63YPYx4i19DR0ycSIEwPsal6hI4VMukOgGVZ/j72SjrYuRQ/IH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RRPB98X0; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B6D14DC;
	Thu, 18 Jun 2026 15:00:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781787636;
	bh=Bo1ITd6K4fXu8vMAjdu/gVRpcR2tufgztgE7PnfpSYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RRPB98X0e5vXW6R+yVHG6/xNMYNAQY46FnzAd+o7l5nqC0+oJc7WstQ7RYfRu3FX4
	 A5Pt6YR9O33dmIFave3W3jheXIwNAY9uoOPbopuUD2I4/7efPj7U3YeIt4qd1KZWOS
	 FmDGCSA3k2shc3WqRXOEdRP+ZL5Ol+WLmcM+PG5Q=
Date: Thu, 18 Jun 2026 16:01:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] media: i2c: add os02g10 image sensor driver
Message-ID: <20260618130109.GE3345533@killaraus.ideasonboard.com>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
 <20260424092554.26130-3-elgin.perumbilly@siliconsignals.io>
 <ajPZ_mURqAFbk59S@kekkonen.localdomain>
 <20260618125840.GD3345533@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618125840.GD3345533@killaraus.ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65195-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:elgin.perumbilly@siliconsignals.io,m:tarang.raval@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:mehdi.djait@linux.intel.com,m:sylvain.petinot@foss.st.com,m:benjamin.mugnier@foss.st.com,m:bryan.odonoghue@linaro.org,m:himanshu.bhavani@siliconsignals.io,m:heimir.sverrisson@gmail.com,m:jingjing.xiong@intel.com,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,foss.st.com,gmail.com,intel.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,killaraus.ideasonboard.com:mid,siliconsignals.io:email,ideasonboard.com:dkim,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 858746A0565

On Thu, Jun 18, 2026 at 03:58:42PM +0300, Laurent Pinchart wrote:
> On Thu, Jun 18, 2026 at 02:43:58PM +0300, Sakari Ailus wrote:
> > Hi Elgin,
> > 
> > Thanks for the update. A few minor comments below...
> > 
> > On Fri, Apr 24, 2026 at 02:55:46PM +0530, Elgin Perumbilly wrote:
> > > Add a v4l2 subdevice driver for the Omnivision os02g10 sensor.
> > > 
> > > The Omnivision os02g10 is a CMOS image sensor with an active array size of
> > > 1920 x 1080.
> > > 
> > > The following features are supported:
> > > - Manual exposure an gain control support
> > > - vblank/hblank control support
> > > - vflip/hflip control support
> > > - Test pattern control support
> > > - Supported resolution: 1920 x 1080 @ 30fps (SBGGR10)
> > > 
> > > Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> > > Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
> > > ---
> > >  MAINTAINERS                 |   1 +
> > >  drivers/media/i2c/Kconfig   |  10 +
> > >  drivers/media/i2c/Makefile  |   1 +
> > >  drivers/media/i2c/os02g10.c | 949 ++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 961 insertions(+)
> > >  create mode 100644 drivers/media/i2c/os02g10.c
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 8a0a55073c30..693e71b51926 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -19449,6 +19449,7 @@ M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> > >  L:	linux-media@vger.kernel.org
> > >  S:	Maintained
> > >  F:	Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
> > > +F:	drivers/media/i2c/os02g10.c
> > >  
> > >  OMNIVISION OS05B10 SENSOR DRIVER
> > >  M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > index 5eb1e0e0a87a..dd6e9562acf6 100644
> > > --- a/drivers/media/i2c/Kconfig
> > > +++ b/drivers/media/i2c/Kconfig
> > > @@ -372,6 +372,16 @@ config VIDEO_OG0VE1B
> > >  	  To compile this driver as a module, choose M here: the
> > >  	  module will be called og0ve1b.
> > >  
> > > +config VIDEO_OS02G10
> > > +        tristate "OmniVision OS02G10 sensor support"
> > > +        select V4L2_CCI_I2C
> > > +        help
> > > +          This is a Video4Linux2 sensor driver for Omnivision
> > > +          OS02G10 camera sensor.
> > > +
> > > +	  To compile this driver as a module, choose M here: the
> > > +          module will be called os02g10.
> > > +
> > >  config VIDEO_OS05B10
> > >          tristate "OmniVision OS05B10 sensor support"
> > >          select V4L2_CCI_I2C
> > > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > > index a3a6396df3c4..a7554d2eb140 100644
> > > --- a/drivers/media/i2c/Makefile
> > > +++ b/drivers/media/i2c/Makefile
> > > @@ -84,6 +84,7 @@ obj-$(CONFIG_VIDEO_MT9V032) += mt9v032.o
> > >  obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
> > >  obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
> > >  obj-$(CONFIG_VIDEO_OG0VE1B) += og0ve1b.o
> > > +obj-$(CONFIG_VIDEO_OS02G10) += os02g10.o
> > >  obj-$(CONFIG_VIDEO_OS05B10) += os05b10.o
> > >  obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
> > >  obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
> > > diff --git a/drivers/media/i2c/os02g10.c b/drivers/media/i2c/os02g10.c
> > > new file mode 100644
> > > index 000000000000..fad2dd0ad7aa
> > > --- /dev/null
> > > +++ b/drivers/media/i2c/os02g10.c
> > > @@ -0,0 +1,949 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * V4L2 Support for the OS02G10
> > > + *
> > > + * Copyright (C) 2026 Silicon Signals Pvt. Ltd.
> > > + *
> > > + */
> > > +
> > > +#include <linux/array_size.h>
> > > +#include <linux/bitops.h>
> > > +#include <linux/cleanup.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/container_of.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/err.h>
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/property.h>
> > > +#include <linux/regulator/consumer.h>
> > > +#include <linux/units.h>
> > > +#include <linux/types.h>
> > > +#include <linux/time.h>
> > > +#include <linux/regmap.h>
> > > +
> > > +#include <media/v4l2-cci.h>
> > > +#include <media/v4l2-ctrls.h>
> > > +#include <media/v4l2-device.h>
> > > +#include <media/v4l2-fwnode.h>
> > > +#include <media/v4l2-mediabus.h>
> > > +
> > > +#define OS02G10_XCLK_FREQ			(24 * HZ_PER_MHZ)
> > > +
> > > +/* Page 0 */
> > > +#define OS02G10_REG_CHIPID			CCI_REG24(0x002)
> > > +#define OS02G10_CHIPID				0x560247
> > > +
> > > +#define OS02G10_REG_PLL_DIV_CTRL		CCI_REG8(0x030)
> > > +#define OS02G10_REG_PLL_DCTL_BIAS_CTRL		CCI_REG8(0x035)
> > > +#define OS02G10_REG_GATE_EN_CTRL		CCI_REG8(0x038)
> > > +#define OS02G10_REG_DPLL_NC			CCI_REG8(0x041)
> > > +#define OS02G10_REG_MP_PHASE_CTRL		CCI_REG8(0x044)
> > > +
> > > +/* Page 1 */
> > > +#define OS02G10_REG_STREAM_CTRL			CCI_REG8(0x1b1)
> > > +#define OS02G10_STREAM_CTRL_ON			0x03
> > > +#define OS02G10_STREAM_CTRL_OFF			0x00
> > > +
> > > +#define OS02G10_REG_FRAME_SYNC			CCI_REG8(0x101)
> > > +
> > > +#define OS02G10_REG_FRAME_LENGTH		CCI_REG16(0x10e)
> > > +#define OS02G10_FRAME_LENGTH_MAX		0xffff
> > > +#define OS02G10_REG_HBLANK			CCI_REG16(0x109)
> > > +
> > > +#define OS02G10_REG_FRAME_TEST_CTRL		CCI_REG8(0x10d)
> > > +#define OS02G10_FRAME_EXP_SEPERATE_EN		BIT(4)
> > > +#define OS02G10_TEST_PATTERN_ENABLE		BIT(0)
> > > +
> > > +#define OS02G10_REG_ULP_PWD_DUMMY_CTRL		CCI_REG8(0x13c)
> > > +#define OS02G10_REG_DC_LEVEL_LIMIT_EN		CCI_REG8(0x146)
> > > +#define OS02G10_REG_DC_LEVEL_LIMIT_L		CCI_REG8(0x147)
> > > +#define OS02G10_REG_BLC_DATA_LIMIT_L		CCI_REG8(0x148)
> > > +#define OS02G10_REG_DC_BLC_LIMIT_H		CCI_REG8(0x149)
> > > +
> > > +#define OS02G10_REG_HS_LP_CTRL			CCI_REG8(0x192)
> > > +#define OS02G10_REG_HS_LEVEL			CCI_REG8(0x19d)
> > > +#define OS02G10_REG_HS_DRV			CCI_REG8(0x19e)
> > > +
> > > +#define OS02G10_REG_GB_SUBOFFSET		CCI_REG8(0x1f0)
> > > +#define OS02G10_REG_BLUE_SUBOFFSET		CCI_REG8(0x1f1)
> > > +#define OS02G10_REG_RED_SUBOFFSET		CCI_REG8(0x1f2)
> > > +#define OS02G10_REG_GR_SUBOFFSET		CCI_REG8(0x1f3)
> > > +
> > > +#define OS02G10_REG_ABL_TRIGGER			CCI_REG8(0x1fa)
> > > +#define OS02G10_REG_ABL				CCI_REG8(0x1fb)
> > > +
> > > +#define OS02G10_REG_H_SIZE_MIPI			CCI_REG16(0x18e)
> > > +#define OS02G10_REG_V_SIZE_MIPI			CCI_REG16(0x190)
> > > +#define OS02G10_REG_MIPI_TX_SPEED_CTRL		CCI_REG8(0x1a1)
> > > +
> > > +#define OS02G10_REG_LONG_EXPOSURE		CCI_REG16(0x103)
> > > +#define OS02G10_EXPOSURE_MIN			4
> > > +#define OS02G10_EXPOSURE_STEP			1
> > > +#define OS02G10_EXPOSURE_MARGIN			9
> > > +
> > > +#define OS02G10_REG_ANALOG_GAIN			CCI_REG8(0x124)
> > > +#define OS02G10_ANALOG_GAIN_MIN			0x10
> > > +#define OS02G10_ANALOG_GAIN_MAX			0xf8
> > > +#define OS02G10_ANALOG_GAIN_STEP		1
> > > +#define OS02G10_ANALOG_GAIN_DEFAULT		0x10
> > > +
> > > +#define OS02G10_REG_DIGITAL_GAIN_H		CCI_REG8(0x137)
> > > +#define OS02G10_REG_DIGITAL_GAIN_L		CCI_REG8(0x139)
> > > +#define OS02G10_DIGITAL_GAIN_MIN		0x40
> > > +#define OS02G10_DIGITAL_GAIN_MAX		0x800
> > > +#define OS02G10_DIGITAL_GAIN_STEP		64
> > > +#define OS02G10_DIGITAL_GAIN_DEFAULT		0x40
> > > +
> > > +#define OS02G10_REG_FLIP_MIRROR			CCI_REG8(0x13f)
> > > +#define OS02G10_FLIP				BIT(1)
> > > +#define OS02G10_MIRROR				BIT(0)
> > > +
> > > +/* Page 2 */
> > > +#define OS02G10_REG_V_START			CCI_REG16(0x2a0)
> > > +#define OS02G10_REG_V_SIZE			CCI_REG16(0x2a2)
> > > +#define OS02G10_REG_H_START			CCI_REG16(0x2a4)
> > > +#define OS02G10_REG_H_SIZE			CCI_REG16(0x2a6)
> > > +
> > > +#define OS02G10_REG_SIF_CTRL			CCI_REG8(0x25e)
> > > +#define OS02G10_ORIENTATION_BAYER_FIX		0x32
> > > +
> > > +#define OS02G10_LINK_FREQ_720MHZ		(720 * HZ_PER_MHZ)
> > > +
> > > +/* OS02G10 native and active pixel array size */
> > > +static const struct v4l2_rect os02g10_native_area = {
> > > +	.top = 0,
> > > +	.left = 0,
> > > +	.width = 1928,
> > > +	.height = 1088,
> > > +};
> > > +
> > > +static const struct v4l2_rect os02g10_active_area = {
> > > +	.top = 4,
> > > +	.left = 4,
> > > +	.width = 1920,
> > > +	.height = 1080,
> > > +};
> > > +
> > > +static const char * const os02g10_supply_name[] = {
> > > +	"avdd",		/* Analog power */
> > > +	"dovdd",	/* Digital I/O power */
> > > +	"dvdd",		/* Digital core power */
> > > +};
> > > +
> > > +struct os02g10 {
> > > +	struct device *dev;
> > > +	struct regmap *cci;
> > > +	struct v4l2_subdev sd;
> > > +	struct media_pad pad;
> > > +	struct clk *xclk;
> > > +	struct gpio_desc *reset_gpio;
> > > +	struct regulator_bulk_data supplies[ARRAY_SIZE(os02g10_supply_name)];
> > > +
> > > +	/* V4L2 Controls */
> > > +	struct v4l2_ctrl_handler handler;
> > > +	struct v4l2_ctrl *link_freq;
> > > +	struct v4l2_ctrl *vblank;
> > > +	struct v4l2_ctrl *exposure;
> > > +	struct v4l2_ctrl *vflip;
> > > +	struct v4l2_ctrl *hflip;
> > > +};
> > > +
> > > +struct os02g10_mode {
> > > +	u32 width;
> > > +	u32 height;
> > > +	u32 vts_def;
> > > +	u32 exp_def;
> > > +	u32 x_start;
> > > +	u32 y_start;
> > > +};
> > > +
> > > +static const struct cci_reg_sequence os02g10_common_regs[] = {
> > > +	{ OS02G10_REG_PLL_DIV_CTRL,		0x0a},
> > > +	{ OS02G10_REG_PLL_DCTL_BIAS_CTRL,	0x04},
> > > +	{ OS02G10_REG_GATE_EN_CTRL,		0x11},
> > > +	{ OS02G10_REG_DPLL_NC,			0x06},
> > > +	{ OS02G10_REG_MP_PHASE_CTRL,		0x20},
> > > +	{ CCI_REG8(0x119),			0x50},
> > > +	{ CCI_REG8(0x11a),			0x0c},
> > > +	{ CCI_REG8(0x11b),			0x0d},
> > > +	{ CCI_REG8(0x11c),			0x00},
> > > +	{ CCI_REG8(0x11d),			0x75},
> > > +	{ CCI_REG8(0x11e),			0x52},
> > > +	{ CCI_REG8(0x122),			0x14},
> > > +	{ CCI_REG8(0x125),			0x44},
> > > +	{ CCI_REG8(0x126),			0x0f},
> > > +	{ OS02G10_REG_ULP_PWD_DUMMY_CTRL,	0xca},
> > > +	{ CCI_REG8(0x13d),			0x4a},
> > > +	{ CCI_REG8(0x140),			0x0f},
> > > +	{ CCI_REG8(0x143),			0x38},
> > > +	{ OS02G10_REG_DC_LEVEL_LIMIT_EN,	0x01},
> > > +	{ OS02G10_REG_DC_LEVEL_LIMIT_L,		0x00},
> > > +	{ OS02G10_REG_DC_BLC_LIMIT_H,		0x32},
> > > +	{ CCI_REG8(0x150),			0x01},
> > > +	{ CCI_REG8(0x151),			0x28},
> > > +	{ CCI_REG8(0x152),			0x20},
> > > +	{ CCI_REG8(0x153),			0x03},
> > > +	{ CCI_REG8(0x157),			0x16},
> > > +	{ CCI_REG8(0x159),			0x01},
> > > +	{ CCI_REG8(0x15a),			0x01},
> > > +	{ CCI_REG8(0x15d),			0x04},
> > > +	{ CCI_REG8(0x16a),			0x04},
> > > +	{ CCI_REG8(0x16b),			0x03},
> > > +	{ CCI_REG8(0x16e),			0x28},
> > > +	{ CCI_REG8(0x171),			0xc2},
> > > +	{ CCI_REG8(0x172),			0x04},
> > > +	{ CCI_REG8(0x173),			0x38},
> > > +	{ CCI_REG8(0x174),			0x04},
> > > +	{ CCI_REG8(0x179),			0x00},
> > > +	{ CCI_REG8(0x17a),			0xb2},
> > > +	{ CCI_REG8(0x17b),			0x10},
> > > +	{ OS02G10_REG_HS_LP_CTRL,		0x02},
> > > +	{ OS02G10_REG_HS_LEVEL,			0x03},
> > > +	{ OS02G10_REG_HS_DRV,			0x55},
> > > +	{ CCI_REG8(0x1b8),			0x70},
> > > +	{ CCI_REG8(0x1b9),			0x70},
> > > +	{ CCI_REG8(0x1ba),			0x70},
> > > +	{ CCI_REG8(0x1bb),			0x70},
> > > +	{ CCI_REG8(0x1bc),			0x00},
> > > +	{ CCI_REG8(0x1c4),			0x6d},
> > > +	{ CCI_REG8(0x1c5),			0x6d},
> > > +	{ CCI_REG8(0x1c6),			0x6d},
> > > +	{ CCI_REG8(0x1c7),			0x6d},
> > > +	{ CCI_REG8(0x1cc),			0x11},
> > > +	{ CCI_REG8(0x1cd),			0xe0},
> > > +	{ CCI_REG8(0x1d0),			0x1b},
> > > +	{ CCI_REG8(0x1d2),			0x76},
> > > +	{ CCI_REG8(0x1d3),			0x68},
> > > +	{ CCI_REG8(0x1d4),			0x68},
> > > +	{ CCI_REG8(0x1d5),			0x73},
> > > +	{ CCI_REG8(0x1d6),			0x73},
> > > +	{ CCI_REG8(0x1e8),			0x55},
> > > +	{ OS02G10_REG_GB_SUBOFFSET,		0x40},
> > > +	{ OS02G10_REG_BLUE_SUBOFFSET,		0x40},
> > > +	{ OS02G10_REG_RED_SUBOFFSET,		0x40},
> > > +	{ OS02G10_REG_GR_SUBOFFSET,		0x40},
> > > +	{ OS02G10_REG_ABL_TRIGGER,		0x1c},
> > > +	{ OS02G10_REG_ABL,			0x33},
> > > +	{ CCI_REG8(0x1fc),			0x80},
> > > +	{ CCI_REG8(0x1fe),			0x80},
> > > +	{ CCI_REG8(0x303),			0x67},
> > > +	{ CCI_REG8(0x300),			0x59},
> > > +	{ CCI_REG8(0x304),			0x11},
> > > +	{ CCI_REG8(0x305),			0x04},
> > > +	{ CCI_REG8(0x306),			0x0c},
> > > +	{ CCI_REG8(0x307),			0x08},
> > > +	{ CCI_REG8(0x308),			0x08},
> > > +	{ CCI_REG8(0x309),			0x4f},
> > > +	{ CCI_REG8(0x30b),			0x08},
> > > +	{ CCI_REG8(0x30d),			0x26},
> > > +	{ CCI_REG8(0x30f),			0x00},
> > > +	{ CCI_REG8(0x234),			0xfe},
> > > +	{ OS02G10_REG_MIPI_TX_SPEED_CTRL,	0x05},
> > > +};
> > > +
> > > +static const struct os02g10_mode supported_modes[] = {
> > > +	{
> > > +		.width = 1920,
> > > +		.height = 1080,
> > > +		.vts_def = 1246,
> > > +		.exp_def = 1100,
> > > +		.x_start = 2,
> > > +		.y_start = 6,
> > > +	},
> > > +};
> > > +
> > > +static const s64 link_freq_menu_items[] = {
> > > +	OS02G10_LINK_FREQ_720MHZ,
> > > +};
> > > +
> > > +static const char * const os02g10_test_pattern_menu[] = {
> > > +	"Disabled",
> > > +	"Colorbar",
> > > +};
> > > +
> > > +static inline struct os02g10 *to_os02g10(struct v4l2_subdev *sd)
> > > +{
> > > +	return container_of_const(sd, struct os02g10, sd);
> > > +}
> > > +
> > > +static u32 os02g10_get_format_code(struct os02g10 *os02g10)
> > > +{
> > > +	static const u32 codes[2][2] = {
> > > +		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
> > > +		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
> > > +	};
> > > +	u32 code = codes[os02g10->vflip->val][os02g10->hflip->val];
> > 
> > No need for a local variable for this.
> > 
> > > +
> > > +	return code;
> > > +}
> > > +
> > > +static int os02g10_set_ctrl(struct v4l2_ctrl *ctrl)
> > > +{
> > > +	struct os02g10 *os02g10 = container_of_const(ctrl->handler,
> > > +						     struct os02g10, handler);
> > > +	struct v4l2_subdev_state *state;
> > > +	struct v4l2_mbus_framefmt *fmt;
> > > +	int ret = 0;
> > > +
> > > +	state = v4l2_subdev_get_locked_active_state(&os02g10->sd);
> > > +	fmt = v4l2_subdev_state_get_format(state, 0);
> > > +
> > > +	if (ctrl->id == V4L2_CID_VBLANK) {
> > > +		/* Honour the VBLANK limits when setting exposure */
> > > +		s64 max = fmt->height + ctrl->val - OS02G10_EXPOSURE_MARGIN;
> > > +
> > > +		ret = __v4l2_ctrl_modify_range(os02g10->exposure,
> > > +					       os02g10->exposure->minimum, max,
> > > +					       os02g10->exposure->step,
> > > +					       os02g10->exposure->default_value);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	if (pm_runtime_get_if_active(os02g10->dev) == 0)
> > > +		return 0;
> > > +
> > > +	switch (ctrl->id) {
> > > +	case V4L2_CID_EXPOSURE:
> > > +		cci_write(os02g10->cci, OS02G10_REG_LONG_EXPOSURE,
> > > +			  ctrl->val, &ret);
> > > +		break;
> > > +	case V4L2_CID_ANALOGUE_GAIN:
> > > +		cci_write(os02g10->cci, OS02G10_REG_ANALOG_GAIN,
> > > +			  ctrl->val, &ret);
> > > +		break;
> > > +	case V4L2_CID_DIGITAL_GAIN:
> > > +		cci_write(os02g10->cci, OS02G10_REG_DIGITAL_GAIN_L,
> > > +			  (ctrl->val & 0xff), &ret);
> > > +		cci_write(os02g10->cci, OS02G10_REG_DIGITAL_GAIN_H,
> > > +			  ((ctrl->val >> 8) & 0x7), &ret);
> > > +		break;
> > > +	case V4L2_CID_VBLANK:
> > > +		u64 vts = ctrl->val + fmt->height;
> > > +
> > > +		cci_update_bits(os02g10->cci, OS02G10_REG_FRAME_TEST_CTRL,
> > > +				OS02G10_FRAME_EXP_SEPERATE_EN,
> > > +				OS02G10_FRAME_EXP_SEPERATE_EN, &ret);
> > > +		cci_write(os02g10->cci, OS02G10_REG_FRAME_LENGTH, vts, &ret);
> > > +		break;
> > > +	case V4L2_CID_HFLIP:
> > > +	case V4L2_CID_VFLIP:
> > > +		cci_write(os02g10->cci, OS02G10_REG_FLIP_MIRROR,
> > > +			  os02g10->hflip->val | os02g10->vflip->val << 1,
> > > +			      &ret);
> > 
> > Fits on previous line.
> > 
> > > +		cci_write(os02g10->cci, OS02G10_REG_SIF_CTRL,
> > > +			  OS02G10_ORIENTATION_BAYER_FIX, &ret);
> > > +		break;
> > > +	case V4L2_CID_TEST_PATTERN:
> > > +		cci_update_bits(os02g10->cci,
> > > +				OS02G10_REG_FRAME_TEST_CTRL,
> > > +				OS02G10_TEST_PATTERN_ENABLE,
> > > +				ctrl->val ? OS02G10_TEST_PATTERN_ENABLE : 0,
> > > +				&ret);
> > > +		break;
> > > +	default:
> > > +		ret = -EINVAL;
> > > +		break;
> > > +	}
> > > +	cci_write(os02g10->cci, OS02G10_REG_FRAME_SYNC, 0x01, &ret);
> > > +
> > > +	pm_runtime_put(os02g10->dev);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static const struct v4l2_ctrl_ops os02g10_ctrl_ops = {
> > > +	.s_ctrl = os02g10_set_ctrl,
> > > +};
> > > +
> > > +static int os02g10_init_controls(struct os02g10 *os02g10)
> > > +{
> > > +	const struct os02g10_mode *mode = &supported_modes[0];
> > > +	struct v4l2_fwnode_device_properties props;
> > > +	u64 vblank_def, exp_max, pixel_rate;
> > > +	struct v4l2_ctrl_handler *ctrl_hdlr;
> > > +	int ret;
> > > +
> > > +	ctrl_hdlr = &os02g10->handler;
> > > +	v4l2_ctrl_handler_init(ctrl_hdlr, 11);
> > > +
> > > +	/* pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
> > > +	pixel_rate = div_u64(OS02G10_LINK_FREQ_720MHZ * 2 * 2, 10);
> > > +	v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops, V4L2_CID_PIXEL_RATE, 0,
> > > +			  pixel_rate, 1, pixel_rate);
> > > +
> > > +	os02g10->link_freq =
> > > +		v4l2_ctrl_new_int_menu(ctrl_hdlr, &os02g10_ctrl_ops,
> > > +				       V4L2_CID_LINK_FREQ,
> > > +				       ARRAY_SIZE(link_freq_menu_items) - 1,
> > > +				       0, link_freq_menu_items);
> > > +	if (os02g10->link_freq)
> > > +		os02g10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > +
> > > +	vblank_def = mode->vts_def - mode->height;
> > > +	os02g10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
> > > +					    V4L2_CID_VBLANK, vblank_def,
> > > +					    OS02G10_FRAME_LENGTH_MAX - mode->height,
> > > +					    1, vblank_def);
> > > +
> > > +	exp_max = mode->vts_def - OS02G10_EXPOSURE_MARGIN;
> > > +	os02g10->exposure =
> > > +		v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
> > > +				  V4L2_CID_EXPOSURE,
> > > +				  OS02G10_EXPOSURE_MIN, exp_max,
> > > +				  OS02G10_EXPOSURE_STEP, mode->exp_def);
> > > +
> > > +	v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
> > > +			  V4L2_CID_ANALOGUE_GAIN, OS02G10_ANALOG_GAIN_MIN,
> > > +			  OS02G10_ANALOG_GAIN_MAX, OS02G10_ANALOG_GAIN_STEP,
> > > +			  OS02G10_ANALOG_GAIN_DEFAULT);
> > > +
> > > +	v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
> > > +			  V4L2_CID_DIGITAL_GAIN, OS02G10_DIGITAL_GAIN_MIN,
> > > +			  OS02G10_DIGITAL_GAIN_MAX, OS02G10_DIGITAL_GAIN_STEP,
> > > +			  OS02G10_DIGITAL_GAIN_DEFAULT);
> > > +
> > > +	os02g10->hflip = v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
> > > +					   V4L2_CID_HFLIP, 0, 1, 1, 0);
> > > +	if (os02g10->hflip)
> > > +		os02g10->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > > +
> > > +	os02g10->vflip = v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
> > > +					   V4L2_CID_VFLIP, 0, 1, 1, 0);
> > > +	if (os02g10->vflip)
> > > +		os02g10->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> > 
> > There are quite a few flags being modified in the function.
> > 
> > You can drop the checks if you do this after the control handler's error
> > check.
> 
> That's an interesting pattern I never thought of, I'll remember it.
> 
> > > +
> > > +	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &os02g10_ctrl_ops,
> > > +				     V4L2_CID_TEST_PATTERN,
> > > +				     ARRAY_SIZE(os02g10_test_pattern_menu) - 1,
> > > +				     0, 0, os02g10_test_pattern_menu);
> > > +
> > > +	ret = v4l2_fwnode_device_parse(os02g10->dev, &props);
> > > +	if (ret)
> > > +		goto err_handler_free;
> > 
> > Do this first in the function and error handling is simplified. You can
> > rely on the handler's error value only, for instance (apart from the above
> > call).
> > 
> > > +
> > > +	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr,
> > > +					      &os02g10_ctrl_ops, &props);
> > > +	if (ret)
> > > +		goto err_handler_free;
> > > +
> > > +	os02g10->sd.ctrl_handler = ctrl_hdlr;
> > > +
> > > +	return 0;
> > > +
> > > +err_handler_free:
> > > +	v4l2_ctrl_handler_free(ctrl_hdlr);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int os02g10_set_framefmt(struct os02g10 *os02g10,
> > > +				struct v4l2_subdev_state *state)
> > > +{
> > > +	const struct v4l2_mbus_framefmt *format;
> > > +	const struct os02g10_mode *mode;
> > > +	int ret = 0;
> > > +
> > > +	format = v4l2_subdev_state_get_format(state, 0);
> > > +	mode = v4l2_find_nearest_size(supported_modes,
> > > +				      ARRAY_SIZE(supported_modes), width,
> > > +				      height, format->width, format->height);
> > > +
> > > +	cci_write(os02g10->cci, OS02G10_REG_V_START, mode->y_start, &ret);
> > > +	cci_write(os02g10->cci, OS02G10_REG_V_SIZE, mode->height, &ret);
> > > +	cci_write(os02g10->cci, OS02G10_REG_V_SIZE_MIPI, mode->height, &ret);
> > > +	cci_write(os02g10->cci, OS02G10_REG_H_START, mode->x_start, &ret);
> > > +	cci_write(os02g10->cci, OS02G10_REG_H_SIZE, mode->width, &ret);
> > > +	cci_write(os02g10->cci, OS02G10_REG_H_SIZE_MIPI, mode->width, &ret);
> 
> As the sensor supports analog crop, let's implement that and get rid of
> supported_modes. You can delay implementation of binning.

My bad, I replied without noticing patch 3/3. I think 3/3 should be
squashed with this patch, it's hard to review and assess 2/3 given that
parts of it are then changed.

> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int os02g10_enable_streams(struct v4l2_subdev *sd,
> > > +				  struct v4l2_subdev_state *state, u32 pad,
> > > +				  u64 streams_mask)
> > > +{
> > > +	struct os02g10 *os02g10 = to_os02g10(sd);
> > > +	int ret;
> > > +
> > > +	ret = pm_runtime_resume_and_get(os02g10->dev);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ret = cci_multi_reg_write(os02g10->cci, os02g10_common_regs,
> > > +				  ARRAY_SIZE(os02g10_common_regs), NULL);
> > > +	if (ret) {
> > > +		dev_err(os02g10->dev, "failed to write common registers\n");
> > > +		goto err_rpm_put;
> > > +	}
> > > +
> > > +	ret = os02g10_set_framefmt(os02g10, state);
> > > +	if (ret) {
> > > +		dev_err(os02g10->dev, "failed to set frame foramt\n");
> > > +		goto err_rpm_put;
> > > +	}
> > > +
> > > +	/* Apply customized values from user */
> > > +	ret = __v4l2_ctrl_handler_setup(os02g10->sd.ctrl_handler);
> > > +	if (ret)
> > > +		goto err_rpm_put;
> > > +
> > > +	ret = cci_write(os02g10->cci, OS02G10_REG_STREAM_CTRL,
> > > +			OS02G10_STREAM_CTRL_ON, NULL);
> > > +	if (ret)
> > > +		goto err_rpm_put;
> > > +
> > > +	/* vflip and hflip cannot change during streaming */
> > > +	__v4l2_ctrl_grab(os02g10->vflip, true);
> > > +	__v4l2_ctrl_grab(os02g10->hflip, true);
> > > +
> > > +	return 0;
> > > +
> > > +err_rpm_put:
> > > +	pm_runtime_put(os02g10->dev);
> > > +	return ret;
> > > +}
> > > +
> > > +static int os02g10_disable_streams(struct v4l2_subdev *sd,
> > > +				   struct v4l2_subdev_state *state, u32 pad,
> > > +				   u64 streams_mask)
> > > +{
> > > +	struct os02g10 *os02g10 = to_os02g10(sd);
> > > +	int ret;
> > > +
> > > +	ret = cci_write(os02g10->cci, OS02G10_REG_STREAM_CTRL,
> > > +			OS02G10_STREAM_CTRL_OFF, NULL);
> > > +	if (ret)
> > > +		dev_err(os02g10->dev, "Failed to stop stream\n");
> > > +
> > > +	__v4l2_ctrl_grab(os02g10->vflip, false);
> > > +	__v4l2_ctrl_grab(os02g10->hflip, false);
> > > +
> > > +	pm_runtime_put(os02g10->dev);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int os02g10_get_selection(struct v4l2_subdev *sd,
> > > +				 struct v4l2_subdev_state *sd_state,
> > > +				 struct v4l2_subdev_selection *sel)
> > > +{
> > > +	switch (sel->target) {
> > > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > > +	case V4L2_SEL_TGT_NATIVE_SIZE:
> > > +		sel->r = os02g10_native_area;
> > > +		return 0;
> > > +	case V4L2_SEL_TGT_CROP:
> > > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > > +		sel->r = os02g10_active_area;
> > > +		return 0;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +}
> > > +
> > > +static int os02g10_enum_mbus_code(struct v4l2_subdev *sd,
> > > +				  struct v4l2_subdev_state *sd_state,
> > > +				  struct v4l2_subdev_mbus_code_enum *code)
> > > +{
> > > +	struct os02g10 *os02g10 = to_os02g10(sd);
> > > +
> > > +	if (code->index)
> > > +		return -EINVAL;
> > > +
> > > +	code->code = os02g10_get_format_code(os02g10);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int os02g10_enum_frame_size(struct v4l2_subdev *sd,
> > > +				   struct v4l2_subdev_state *sd_state,
> > > +				   struct v4l2_subdev_frame_size_enum *fse)
> > > +{
> > > +	struct os02g10 *os02g10 = to_os02g10(sd);
> > > +
> > > +	if (fse->index >= ARRAY_SIZE(supported_modes))
> > > +		return -EINVAL;
> > > +
> > > +	if (fse->code != os02g10_get_format_code(os02g10))
> > > +		return -EINVAL;
> > > +
> > > +	fse->min_width = supported_modes[fse->index].width;
> > > +	fse->max_width = fse->min_width;
> > > +	fse->min_height = supported_modes[fse->index].height;
> > > +	fse->max_height = fse->min_height;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int os02g10_set_pad_format(struct v4l2_subdev *sd,
> > > +				  struct v4l2_subdev_state *sd_state,
> > > +				  struct v4l2_subdev_format *fmt)
> > > +{
> > > +	struct os02g10 *os02g10 = to_os02g10(sd);
> > > +	struct v4l2_mbus_framefmt *format;
> > > +	const struct os02g10_mode *mode;
> > > +
> > > +	format = v4l2_subdev_state_get_format(sd_state, 0);
> > > +
> > > +	mode = v4l2_find_nearest_size(supported_modes,
> > > +				      ARRAY_SIZE(supported_modes),
> > > +				      width, height,
> > > +				      fmt->format.width, fmt->format.height);
> > > +
> > > +	fmt->format.code = os02g10_get_format_code(os02g10);
> > > +	fmt->format.width = mode->width;
> > > +	fmt->format.height = mode->height;
> > > +	fmt->format.field = V4L2_FIELD_NONE;
> > > +	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
> > > +	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
> > > +	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
> > > +
> > > +	*format = fmt->format;
> > > +
> > > +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > > +		u32 vblank_def = mode->vts_def - mode->height;
> > > +
> > > +		int ret = __v4l2_ctrl_modify_range(os02g10->vblank, vblank_def,
> > > +						   OS02G10_FRAME_LENGTH_MAX -
> > > +						   mode->height, 1, vblank_def);
> > 
> > 		return ...;
> > 
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int os02g10_init_state(struct v4l2_subdev *sd,
> > > +			      struct v4l2_subdev_state *state)
> > > +{
> > > +	struct os02g10 *os02g10 = to_os02g10(sd);
> > > +	struct v4l2_subdev_format fmt = {
> > > +		.which = V4L2_SUBDEV_FORMAT_TRY,
> > > +		.format = {
> > > +			.code = os02g10_get_format_code(os02g10),
> > > +			.width = supported_modes[0].width,
> > > +			.height = supported_modes[0].height,
> > > +		},
> > > +	};
> > > +
> > > +	os02g10_set_pad_format(sd, state, &fmt);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct v4l2_subdev_video_ops os02g10_video_ops = {
> > > +	.s_stream = v4l2_subdev_s_stream_helper,
> > > +};
> > > +
> > > +static const struct v4l2_subdev_pad_ops os02g10_pad_ops = {
> > > +	.enum_mbus_code = os02g10_enum_mbus_code,
> > > +	.get_fmt = v4l2_subdev_get_fmt,
> > > +	.set_fmt = os02g10_set_pad_format,
> > > +	.get_selection = os02g10_get_selection,
> > > +	.enum_frame_size = os02g10_enum_frame_size,
> > > +	.enable_streams = os02g10_enable_streams,
> > > +	.disable_streams = os02g10_disable_streams,
> > > +};
> > > +
> > > +static const struct v4l2_subdev_ops os02g10_subdev_ops = {
> > > +	.video = &os02g10_video_ops,
> > > +	.pad = &os02g10_pad_ops,
> > > +};
> > > +
> > > +static const struct v4l2_subdev_internal_ops os02g10_internal_ops = {
> > > +	.init_state = os02g10_init_state,
> > > +};
> > > +
> > > +static int os02g10_power_on(struct device *dev)
> > > +{
> > > +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > > +	struct os02g10 *os02g10 = to_os02g10(sd);
> > > +	int ret;
> > > +
> > > +	ret = regulator_bulk_enable(ARRAY_SIZE(os02g10_supply_name),
> > > +				    os02g10->supplies);
> > > +	if (ret) {
> > > +		dev_err(os02g10->dev, "failed to enable regulators\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	/* T4: delay from DOVDD stable to MCLK on */
> > > +	fsleep(5 * USEC_PER_MSEC);
> > 
> > Does the sensor really require this? Typically no delays are required
> > before lifting xshutdown.
> > 
> > > +
> > > +	ret = clk_prepare_enable(os02g10->xclk);
> > > +	if (ret) {
> > > +		dev_err(os02g10->dev, "failed to enable clock\n");
> > > +		goto err_regulator_off;
> > > +	}
> > > +
> > > +	/* T3: delay from DVDD stable to sensor power up stable */
> > > +	fsleep(5 * USEC_PER_MSEC);
> > 
> > The supplies were enabled before the clock so right now there's already 5
> > ms delay here. Consider with the above comment.
> > 
> > > +
> > > +	gpiod_set_value_cansleep(os02g10->reset_gpio, 0);
> > > +
> > > +	/* T5: delay from sensor power up stable to SCCB initialization */
> > > +	fsleep(5 * USEC_PER_MSEC);
> > > +
> > > +	return 0;
> > > +
> > > +err_regulator_off:
> > > +	regulator_bulk_disable(ARRAY_SIZE(os02g10_supply_name), os02g10->supplies);
> > 
> > A newline here would be nice.
> > 
> > > +	return ret;
> > > +}
> > > +
> > > +static int os02g10_power_off(struct device *dev)
> > > +{
> > > +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > > +	struct os02g10 *os02g10 = to_os02g10(sd);
> > > +
> > > +	clk_disable_unprepare(os02g10->xclk);
> > > +	gpiod_set_value_cansleep(os02g10->reset_gpio, 1);
> > > +	regulator_bulk_disable(ARRAY_SIZE(os02g10_supply_name), os02g10->supplies);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int os02g10_identify_module(struct os02g10 *os02g10)
> > > +{
> > > +	u64 chip_id;
> > > +	int ret;
> > > +
> > > +	ret = cci_read(os02g10->cci, OS02G10_REG_CHIPID, &chip_id, NULL);
> > > +	if (ret)
> > > +		return dev_err_probe(os02g10->dev, ret,
> > > +				     "failed to read chip id %x\n",
> > > +				     OS02G10_CHIPID);
> > > +
> > > +	if (chip_id != OS02G10_CHIPID)
> > > +		return dev_err_probe(os02g10->dev, -EIO,
> > > +				     "chip id mismatch: %x!=%llx\n",
> > > +				     OS02G10_CHIPID, chip_id);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int os02g10_parse_endpoint(struct os02g10 *os02g10)
> > > +{
> > > +	struct v4l2_fwnode_endpoint bus_cfg = {
> > > +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> > > +	};
> > > +	unsigned long link_freq_bitmap;
> > > +	struct fwnode_handle *ep;
> > > +	int ret;
> > > +
> > > +	ep = fwnode_graph_get_next_endpoint(dev_fwnode(os02g10->dev), NULL);
> > > +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> > > +	fwnode_handle_put(ep);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2) {
> > > +		ret = dev_err_probe(os02g10->dev, -EINVAL,
> > > +				    "only 2 data lanes are supported\n");
> > > +		goto error_out;
> > > +	}
> > > +
> > > +	ret = v4l2_link_freq_to_bitmap(os02g10->dev, bus_cfg.link_frequencies,
> > > +				       bus_cfg.nr_of_link_frequencies,
> > > +				       link_freq_menu_items,
> > > +				       ARRAY_SIZE(link_freq_menu_items),
> > > +				       &link_freq_bitmap);
> > > +	if (ret) {
> > > +		ret = dev_err_probe(os02g10->dev, -EINVAL,
> > > +				    "only 720MHz frequency is available\n");
> > > +		goto error_out;
> > > +	}
> > > +
> > > +error_out:
> > > +	v4l2_fwnode_endpoint_free(&bus_cfg);
> > > +
> > > +	return ret;
> > > +};
> > > +
> > > +static const struct regmap_range_cfg os02g10_ranges[] = {
> > > +	{
> > > +		.range_min      = 0x0000,
> > > +		.range_max      = 0x03ff,
> > > +		.selector_reg   = 0xfd,
> > > +		.selector_mask  = 0x03,
> > > +		.selector_shift = 0,
> > > +		.window_start   = 0x00,
> > > +		.window_len     = 0x100,
> > > +	},
> > > +};
> > > +
> > > +static const struct regmap_config os02g10_regmap_config = {
> > > +	.reg_bits = 8,
> > > +	.val_bits = 8,
> > > +	.reg_format_endian = REGMAP_ENDIAN_BIG,
> > > +	.max_register = 0x3ff,
> > > +	.ranges = os02g10_ranges,
> > > +	.num_ranges = ARRAY_SIZE(os02g10_ranges),
> > > +	.disable_locking = true,
> > > +};
> > 
> > Nice!
> > 
> > > +
> > > +static int os02g10_probe(struct i2c_client *client)
> > > +{
> > > +	struct os02g10 *os02g10;
> > > +	unsigned int xclk_freq;
> > > +	int ret;
> > > +
> > > +	os02g10 = devm_kzalloc(&client->dev, sizeof(*os02g10), GFP_KERNEL);
> > > +	if (!os02g10)
> > > +		return -ENOMEM;
> > > +
> > > +	os02g10->dev = &client->dev;
> > > +
> > > +	v4l2_i2c_subdev_init(&os02g10->sd, client, &os02g10_subdev_ops);
> > > +	os02g10->sd.internal_ops = &os02g10_internal_ops;
> > > +
> > > +	/*
> > > +	 * This is not using devm_cci_regmap_init_i2c(), because the driver
> > > +	 * makes use of regmap's pagination feature. The chosen settings are
> > > +	 * compatible with the CCI helpers.
> > > +	 */
> > > +	os02g10->cci = devm_regmap_init_i2c(client, &os02g10_regmap_config);
> > > +	if (IS_ERR(os02g10->cci))
> > > +		return dev_err_probe(os02g10->dev, PTR_ERR(os02g10->cci),
> > > +				     "failed to initialize CCI\n");
> > > +
> > > +	ret = os02g10_parse_endpoint(os02g10);
> > > +	if (ret)
> > > +		return dev_err_probe(os02g10->dev, ret,
> > > +				     "failed to parse endpoint configuration\n");
> > > +
> > > +	/* Get system clock (xvclk) */
> > > +	os02g10->xclk = devm_v4l2_sensor_clk_get(os02g10->dev, NULL);
> > > +	if (IS_ERR(os02g10->xclk))
> > > +		return dev_err_probe(os02g10->dev, PTR_ERR(os02g10->xclk),
> > > +				     "failed to get xclk\n");
> > > +
> > > +	xclk_freq = clk_get_rate(os02g10->xclk);
> > > +	if (xclk_freq != OS02G10_XCLK_FREQ)
> > > +		return dev_err_probe(os02g10->dev, -EINVAL,
> > > +				     "xclk frequency not supported: %u Hz\n",
> > > +				     xclk_freq);
> > > +
> > > +	for (unsigned int i = 0; i < ARRAY_SIZE(os02g10_supply_name); i++)
> > > +		os02g10->supplies[i].supply = os02g10_supply_name[i];
> > > +
> > > +	ret = devm_regulator_bulk_get(os02g10->dev,
> > > +				      ARRAY_SIZE(os02g10_supply_name),
> > > +				      os02g10->supplies);
> > > +	if (ret)
> > > +		return dev_err_probe(os02g10->dev, ret,
> > > +				     "failed to get regulators\n");
> > > +
> > > +	os02g10->reset_gpio = devm_gpiod_get_optional(os02g10->dev,
> > > +						      "reset", GPIOD_OUT_HIGH);
> > > +	if (IS_ERR(os02g10->reset_gpio))
> > > +		return dev_err_probe(os02g10->dev, PTR_ERR(os02g10->reset_gpio),
> > > +				     "failed to get reset GPIO\n");
> > > +
> > > +	ret = os02g10_power_on(os02g10->dev);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = os02g10_identify_module(os02g10);
> > > +	if (ret)
> > > +		goto error_power_off;
> > > +
> > > +	ret = os02g10_init_controls(os02g10);
> > > +	if (ret)
> > > +		goto error_power_off;
> > > +
> > > +	/* Initialize subdev */
> > > +	os02g10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > +	os02g10->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > > +	os02g10->pad.flags = MEDIA_PAD_FL_SOURCE;
> > > +
> > > +	ret = media_entity_pads_init(&os02g10->sd.entity, 1, &os02g10->pad);
> > > +	if (ret) {
> > > +		dev_err_probe(os02g10->dev, ret, "failed to init entity pads\n");
> > > +		goto error_handler_free;
> > > +	}
> > > +
> > > +	os02g10->sd.state_lock = os02g10->handler.lock;
> > > +	ret = v4l2_subdev_init_finalize(&os02g10->sd);
> > > +	if (ret) {
> > > +		dev_err_probe(os02g10->dev, ret, "subdev init error\n");
> > > +		goto error_media_entity;
> > > +	}
> > > +
> > > +	pm_runtime_set_active(os02g10->dev);
> > > +	pm_runtime_enable(os02g10->dev);
> > > +
> > > +	ret = v4l2_async_register_subdev_sensor(&os02g10->sd);
> > > +	if (ret) {
> > > +		dev_err_probe(os02g10->dev, ret,
> > > +			      "failed to register os02g10 sub-device\n");
> > > +		goto error_subdev_cleanup;
> > > +	}
> > > +
> > > +	pm_runtime_idle(os02g10->dev);
> > > +
> > > +	return 0;
> > > +
> > > +error_subdev_cleanup:
> > > +	v4l2_subdev_cleanup(&os02g10->sd);
> > > +	pm_runtime_disable(os02g10->dev);
> > > +	pm_runtime_set_suspended(os02g10->dev);
> > > +
> > > +error_media_entity:
> > > +	media_entity_cleanup(&os02g10->sd.entity);
> > > +
> > > +error_handler_free:
> > > +	v4l2_ctrl_handler_free(os02g10->sd.ctrl_handler);
> > > +
> > > +error_power_off:
> > > +	os02g10_power_off(os02g10->dev);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void os02g10_remove(struct i2c_client *client)
> > > +{
> > > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +	struct os02g10 *os02g10 = to_os02g10(sd);
> > > +
> > > +	v4l2_async_unregister_subdev(sd);
> > > +	v4l2_subdev_cleanup(&os02g10->sd);
> > > +	media_entity_cleanup(&sd->entity);
> > > +	v4l2_ctrl_handler_free(os02g10->sd.ctrl_handler);
> > > +
> > > +	pm_runtime_disable(&client->dev);
> > > +	if (!pm_runtime_status_suspended(&client->dev)) {
> > > +		os02g10_power_off(&client->dev);
> > > +		pm_runtime_set_suspended(&client->dev);
> > > +	}
> > > +}
> > > +
> > > +static DEFINE_RUNTIME_DEV_PM_OPS(os02g10_pm_ops,
> > > +				 os02g10_power_off, os02g10_power_on, NULL);
> > > +
> > > +static const struct of_device_id os02g10_id[] = {
> > > +	{ .compatible = "ovti,os02g10" },
> > > +	{ /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, os02g10_id);
> > > +
> > > +static struct i2c_driver os02g10_driver = {
> > > +	.driver = {
> > > +		.name = "os02g10",
> > > +		.pm = pm_ptr(&os02g10_pm_ops),
> > > +		.of_match_table = os02g10_id,
> > > +	},
> > > +	.probe = os02g10_probe,
> > > +	.remove = os02g10_remove,
> > > +};
> > > +module_i2c_driver(os02g10_driver);
> > > +
> > > +MODULE_DESCRIPTION("OS02G10 Camera Sensor Driver");
> > > +MODULE_AUTHOR("Tarang Raval <tarang.raval@siliconsignals.io>");
> > > +MODULE_AUTHOR("Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>");
> > > +MODULE_LICENSE("GPL");
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Regards,

Laurent Pinchart

