Return-Path: <linux-media+bounces-49853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B87FBCEF58B
	for <lists+linux-media@lfdr.de>; Fri, 02 Jan 2026 22:22:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CFF3301E1AE
	for <lists+linux-media@lfdr.de>; Fri,  2 Jan 2026 21:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92B730F55A;
	Fri,  2 Jan 2026 21:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d5tL2Dur"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76F3125A0;
	Fri,  2 Jan 2026 21:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767388958; cv=none; b=DDNgHlnwAx/von4b0z7QgnidywmaSEeRkToL4Cxx1TsppDVsQyrnBUStQjyd/aWJHw56EukGMqEojwrElUpVRm4iGaLiaq7Gm7tYrdHcg6VusApbbiamm6Mq/NvKYe8Yc78VZwi+Qnvir0Uy59Xap4susLp99oqQUTux3mvo2Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767388958; c=relaxed/simple;
	bh=2gemW1+rue0s3cm9dqW/GVpOIyGsOrxlDcTl3tCWmv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxJhv2F6W9TZCV4QZ1vplKHiyR7WeF5WeY2MNtsQFkn56c6jkFf2TGpDB0yxliku1Qe/OWJQi9ecX4gadrs0HeKCdu+09iEUF+7w8XiVcRQCLV0af/51VuOVQBARMfD4cjKL6rvltDIDfE+CuIzzGF0DVlAcPPRlERJxcmeca5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d5tL2Dur; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767388956; x=1798924956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2gemW1+rue0s3cm9dqW/GVpOIyGsOrxlDcTl3tCWmv0=;
  b=d5tL2Dur+roucTJcVAoyGe4QquxH0gzOC6xqqvBFNZGKoN4Kt4PjzgL7
   0J6EFXp01vtXAhV5MTmS4uMsaAGQSVEWt+L1fnvRGeyLmRbCfSoFwoVMg
   qDARgjWAL2ZQKQd7O1Qn4onkZjjo6gdbtQWegUfU+CFRHw224yn/puR2T
   jwZkAsWmBAJazF5TvbdBYMibjHbOWb7m7ZXPxv6Bv+9OsiAI3BSdMAURh
   D7m4T7TjvV95cAMamqfcxr3M73CIB00D0x44DyS+Eg6uO/VIdsTJkmqVK
   cN9WtnofrgDWAaJ2nephScmJyg7GF4UrWefMHF5DRxJX85dZM/+YBpgjH
   Q==;
X-CSE-ConnectionGUID: cWepnhbZQwufbAzT+CP0jA==
X-CSE-MsgGUID: vJO4IxBaT4uOubEHQjSdHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="79994983"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="79994983"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 13:22:35 -0800
X-CSE-ConnectionGUID: jpS9+jIiSwClVoT2d0YSyA==
X-CSE-MsgGUID: s9Nta6FTTTOUqgj2PwoydQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="206376458"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.62])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 13:22:31 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E2C7B11F83C;
	Fri, 02 Jan 2026 23:22:40 +0200 (EET)
Date: Fri, 2 Jan 2026 23:22:40 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: robh@kernel.org, krzk+dt@kernel.org,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] media: i2c: add os05b10 image sensor driver
Message-ID: <aVg3IFprdKIfQcOL@kekkonen.localdomain>
References: <20260101084254.20014-1-himanshu.bhavani@siliconsignals.io>
 <20260101084254.20014-3-himanshu.bhavani@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260101084254.20014-3-himanshu.bhavani@siliconsignals.io>

Hi Himanshu,

On Thu, Jan 01, 2026 at 02:12:47PM +0530, Himanshu Bhavani wrote:
> Add a v4l2 subdevice driver for the Omnivision OS05B10 sensor.
> 
> The Omnivision OS05B10 image sensor with an active
> array size of 2592 x 1944.
> 
> The following features are supported:
> - Manual exposure an gain control support
> - vblank/hblank control support
> - Supported resolution: 2592 x 1944 @ 60fps (SBGGR10)
> 
> Co-developed-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
> ---
>  MAINTAINERS                 |    1 +
>  drivers/media/i2c/Kconfig   |   10 +
>  drivers/media/i2c/Makefile  |    1 +
>  drivers/media/i2c/os05b10.c | 1109 +++++++++++++++++++++++++++++++++++
>  4 files changed, 1121 insertions(+)
>  create mode 100644 drivers/media/i2c/os05b10.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c85915d5d20e..c48d04ca38d1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19240,6 +19240,7 @@ M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
> +F:	drivers/media/i2c/os05b10.c
> 
>  OMNIVISION OV01A10 SENSOR DRIVER
>  M:	Bingbu Cao <bingbu.cao@intel.com>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 4b4db8c4f496..9800ba50b9a6 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -371,6 +371,16 @@ config VIDEO_OG0VE1B
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called og0ve1b.
> 
> +config VIDEO_OS05B10
> +        tristate "OmniVision OS05B10 sensor support"
> +        select V4L2_CCI_I2C
> +        help
> +          This is a Video4Linux2 sensor driver for Omnivision
> +          OS05B10 camera sensor.
> +
> +	  To compile this driver as a module, choose M here: the
> +          module will be called os05b10.
> +
>  config VIDEO_OV01A10
>  	tristate "OmniVision OV01A10 sensor support"
>  	help
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index c5f17602454f..561d37939875 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -84,6 +84,7 @@ obj-$(CONFIG_VIDEO_MT9V032) += mt9v032.o
>  obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
>  obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
>  obj-$(CONFIG_VIDEO_OG0VE1B) += og0ve1b.o
> +obj-$(CONFIG_VIDEO_OS05B10) += os05b10.o
>  obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
>  obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
>  obj-$(CONFIG_VIDEO_OV02C10) += ov02c10.o
> diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
> new file mode 100644
> index 000000000000..7ec6947adef8
> --- /dev/null
> +++ b/drivers/media/i2c/os05b10.c
> @@ -0,0 +1,1109 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * V4L2 Support for the os05b10
> + *
> + * Copyright (C) 2025 Silicon Signals Pvt. Ltd.
> + *
> + * Inspired from imx219, ov2735 camera drivers.
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
> +#include <linux/regulator/consumer.h>
> +#include <linux/types.h>
> +#include <linux/time.h>
> +#include <linux/units.h>
> +
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mediabus.h>
> +
> +#define OS05B10_XCLK_FREQ		(24 * HZ_PER_MHZ)
> +
> +#define OS05B10_REG_CHIP_ID		CCI_REG24(0x300a)
> +#define OS05B10_CHIP_ID			0x530641
> +
> +#define OS05B10_REG_CTRL_MODE		CCI_REG8(0x0100)
> +#define OS05B10_MODE_STANDBY		0x00
> +#define OS05B10_MODE_STREAMING		0x01
> +
> +#define OS05B10_REG_EXPOSURE		CCI_REG24(0x3500)
> +#define OS05B10_EXPOSURE_MIN		2
> +#define OS05B10_EXPOSURE_STEP		1
> +#define OS05B10_EXPOSURE_MARGIN         8
> +
> +#define OS05B10_REG_ANALOG_GAIN		CCI_REG16(0x3508)
> +#define OS05B10_ANALOG_GAIN_MIN		0x80
> +#define OS05B10_ANALOG_GAIN_MAX		0x7C0
> +#define OS05B10_ANALOG_GAIN_STEP	1
> +#define OS05B10_ANALOG_GAIN_DEFAULT     0x80

Please fix the indentation issues here.

-- 
Kind regards,

Sakari Ailus

