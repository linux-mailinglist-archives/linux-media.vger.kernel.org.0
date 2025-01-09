Return-Path: <linux-media+bounces-24491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B13A071B7
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 10:39:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A15116408A
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 09:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8453021576C;
	Thu,  9 Jan 2025 09:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vff6I4Cn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0F72153E0
	for <linux-media@vger.kernel.org>; Thu,  9 Jan 2025 09:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736415574; cv=none; b=A4dkidkrd7irw28x0GZ968OHPoZAhnKFtkijSzgtC7B4TLUJQbeAEbx8M7Qi86jg7RgZKWeO3D2XoSZfQVTFTyDIzkGMLoHSRgHPCPFfrHEH7ZrWZep3JJrk9KGFYEqPuOvKCu/eNuMrNogMrrdVvSH3aI0byfNKs5XsNT+IH1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736415574; c=relaxed/simple;
	bh=uzIVtb31SXjT+08q2MyHrub98Iv2pGUnZ/89LnNhx1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQ6uV4fMfo9FFJtWCWACV4LaWF8B4b/B80tXKBhxW3jTvH/3prbdwn+WzXSSC4CY1uN60kZI80CowySzRCKfUcSioANehhSa1Ae8C9QULmvfzkWZv2e+7tugYTByuIex+XRuVskdGS3lq2Ht2mndnOkUr9US4SAzUfjdrixDMeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vff6I4Cn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736415571; x=1767951571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uzIVtb31SXjT+08q2MyHrub98Iv2pGUnZ/89LnNhx1U=;
  b=Vff6I4Cn6cVWfc/8hzftZgsW7wh1XsnzKwFLc/sMS6EjhIDVJtNgZQ1f
   msZlvETVE0xQY3JqibPfo3xDItNngrrGV6eOkv4gu9nIC+8uoNruABWDP
   63WjIpCsSEpWyNzjmp71RsLRsTC+UnNKWIjvFc4HoTu6Ly/cvi0F0VQFd
   ZHI21hxLL6oyrRjFnlK5pcPZ1gF2pdTLkSzyUwHK3nxYXz5v18643GAU8
   gHNj2FqWRehR9ohJBHDijcsPMG/YLOm7kLzXjZ/muIboNoLbIGkOTHt6E
   x3jGLMwESJiqBLEsK9NbEkOOxJpYPynbnygiwMtyEtE3izSPJ0XHCYGqM
   Q==;
X-CSE-ConnectionGUID: BlT39+R9TIm9/8aslpyjXw==
X-CSE-MsgGUID: 366UcCiBS9+k8REtPjdq7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36896891"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36896891"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 01:39:08 -0800
X-CSE-ConnectionGUID: dIRI/Se7Qou2IPG+08U3Dw==
X-CSE-MsgGUID: rFQllKSqToGLCwNEyx6RgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="103557270"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.118.67])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 01:38:58 -0800
Date: Thu, 9 Jan 2025 10:38:54 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
Cc: sakari.ailus@linux.intel.com, hao.yao@intel.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, hdegoede@redhat.com,
	joachim.reichel@posteo.de, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH v6] media: i2c: Add Omnivision OV02C10 sensor driver
Message-ID: <Z3+ZLrzyQgPXkrA0@linux.intel.com>
References: <20241219175128.40871-1-heimir.sverrisson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219175128.40871-1-heimir.sverrisson@gmail.com>

Hello,

On Thu, Dec 19, 2024 at 10:51:28AM -0700, Heimir Thor Sverrisson wrote:
> Add a new driver for the Omnivision OV02C10 camera sensor. This is based
> on the out of tree driver by Hao Yao <hao.yao@intel.com> from:
> https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov02c10.c
> 
> This has been tested on a Dell XPS 9440 together with the IPU6 isys CSI
> driver and the libcamera software ISP code.

I tested the patch on Dell XPS 9430. I have problem with GPIO's on this
machine.

[   16.306896] acpi OVTI02C1:00: GPIO: looking up gpios
[   16.306902] acpi OVTI02C1:00: GPIO: looking up gpio
[   16.306904] acpi OVTI02C1:00: GPIO: looking up 0 in _CRS
[   16.307176] ov02c10 i2c-OVTI02C1:00: using ACPI '\_SB.PC00.LNK1' for 'reset' GPIO lookup
[   16.307183] acpi OVTI02C1:00: GPIO: looking up reset-gpios
[   16.307185] acpi OVTI02C1:00: GPIO: looking up reset-gpio
[   16.307187] ov02c10 i2c-OVTI02C1:00: using lookup tables for GPIO lookup
[   16.307189] ov02c10 i2c-OVTI02C1:00: No GPIO consumer reset found
[   16.307191] ov02c10 i2c-OVTI02C1:00: using ACPI '\_SB.PC00.LNK1' for 'handshake' GPIO lookup
[   16.307194] acpi OVTI02C1:00: GPIO: looking up handshake-gpios
[   16.307195] acpi OVTI02C1:00: GPIO: looking up handshake-gpio
[   16.307197] ov02c10 i2c-OVTI02C1:00: using lookup tables for GPIO lookup
[   16.307198] ov02c10 i2c-OVTI02C1:00: No GPIO consumer handshake found

But this is also issue for other GPIO's on this system, for example:

[    1.902089] mdio_bus fixed-0: using lookup tables for GPIO lookup
[    1.902094] mdio_bus fixed-0: No GPIO consumer reset found

[    1.950427] rtc_cmos 00:01: using lookup tables for GPIO lookup
[    1.950428] rtc_cmos 00:01: No GPIO consumer wp found

And for ov02c10 GPIO's are used for runtime PM.
Hence despite those errors camera works.

Tested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com> # Dell XPS 9430

> Tested-by: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
> Signed-off-by: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
> ---
>  drivers/media/i2c/Kconfig   |   10 +
>  drivers/media/i2c/Makefile  |    1 +
>  drivers/media/i2c/ov02c10.c | 1322 +++++++++++++++++++++++++++++++++++
>  3 files changed, 1333 insertions(+)
>  create mode 100644 drivers/media/i2c/ov02c10.c
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 8ba096b8ebca..9bca187d89af 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -355,6 +355,16 @@ config VIDEO_OV02A10
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called ov02a10.
>  
> +config VIDEO_OV02C10
> +	tristate "OmniVision OV02C10 sensor support"
> +	select V4L2_CCI_I2C
> +	help
> +	  This is a Video4Linux2 sensor driver for the OmniVision
> +	  OV02C10 camera.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called ov02c10.
> +
>  config VIDEO_OV08D10
>          tristate "OmniVision OV08D10 sensor support"
>          help
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index fbb988bd067a..5842346c220d 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -82,6 +82,7 @@ obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
>  obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
>  obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
>  obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
> +obj-$(CONFIG_VIDEO_OV02C10) += ov02c10.o
>  obj-$(CONFIG_VIDEO_OV08D10) += ov08d10.o
>  obj-$(CONFIG_VIDEO_OV08X40) += ov08x40.o
>  obj-$(CONFIG_VIDEO_OV13858) += ov13858.o
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> new file mode 100644
> index 000000000000..03646cabed15
> --- /dev/null
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -0,0 +1,1322 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2022 Intel Corporation.
> +
> +#include <linux/acpi.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/version.h>
> +#include <media/v4l2-cci.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +
> +#define OV02C10_LINK_FREQ_400MHZ	400000000ULL
> +#define OV02C10_SCLK			80000000LL
> +#define OV02C10_MCLK			19200000
> +#define OV02C10_DATA_LANES		1
> +#define OV02C10_RGB_DEPTH		10
> +
> +#define OV02C10_REG_CHIP_ID		CCI_REG16(0x300a)
> +#define OV02C10_CHIP_ID			0x5602
> +
> +#define OV02C10_REG_STREAM_CONTROL	CCI_REG8(0x0100)
> +
> +/* vertical-timings from sensor */
> +#define OV02C10_REG_VTS			CCI_REG16(0x380e)
> +#define OV02C10_VTS_MAX			0xffff
> +
> +/* Exposure controls from sensor */
> +#define OV02C10_REG_EXPOSURE		CCI_REG16(0x3501)
> +#define OV02C10_EXPOSURE_MIN		4
> +#define OV02C10_EXPOSURE_MAX_MARGIN	8
> +#define OV02C10_EXPOSURE_STEP		1
> +
> +/* Analog gain controls from sensor */
> +#define OV02C10_REG_ANALOG_GAIN		CCI_REG16(0x3508)
> +#define OV02C10_ANAL_GAIN_MIN		0x10
> +#define OV02C10_ANAL_GAIN_MAX		0xf8
> +#define OV02C10_ANAL_GAIN_STEP		1
> +#define OV02C10_ANAL_GAIN_DEFAULT	0x10
> +
> +/* Digital gain controls from sensor */
> +#define OV02C10_REG_DIGITAL_GAIN	CCI_REG24(0x350a)
> +#define OV02C10_DGTL_GAIN_MIN		0x0400
> +#define OV02C10_DGTL_GAIN_MAX		0x3fff
> +#define OV02C10_DGTL_GAIN_STEP		1
> +#define OV02C10_DGTL_GAIN_DEFAULT	0x0400
> +
> +/* Rotate */
> +#define OV02C10_ROTATE_CONTROL		CCI_REG8(0x3820)
> +#define OV02C10_ISP_X_WIN_CONTROL	CCI_REG16(0x3810)
> +#define OV02C10_ISP_Y_WIN_CONTROL	CCI_REG16(0x3812)
> +#define OV02C10_CONFIG_ROTATE		0x18
> +
> +/* Test Pattern Control */
> +#define OV02C10_REG_TEST_PATTERN		CCI_REG8(0x4503)
> +#define OV02C10_TEST_PATTERN_ENABLE		BIT(7)
> +
> +struct ov02c10_mode {
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
> +	/* MIPI lanes used */
> +	u8 mipi_lanes;
> +
> +	/* Sensor register settings for this resolution */
> +	const struct reg_sequence *reg_sequence;
> +	const int sequence_length;
> +};
> +
> +static const struct reg_sequence sensor_1928x1092_1lane_30fps_setting[] = {
> +	{0x0301, 0x08},
> +	{0x0303, 0x06},
> +	{0x0304, 0x01},
> +	{0x0305, 0xe0},
> +	{0x0313, 0x40},
> +	{0x031c, 0x4f},
> +	{0x301b, 0xd2},
> +	{0x3020, 0x97},
> +	{0x3022, 0x01},
> +	{0x3026, 0xb4},
> +	{0x3027, 0xe1},
> +	{0x303b, 0x00},
> +	{0x303c, 0x4f},
> +	{0x303d, 0xe6},
> +	{0x303e, 0x00},
> +	{0x303f, 0x03},
> +	{0x3021, 0x23},
> +	{0x3501, 0x04},
> +	{0x3502, 0x6c},
> +	{0x3504, 0x0c},
> +	{0x3507, 0x00},
> +	{0x3508, 0x08},
> +	{0x3509, 0x00},
> +	{0x350a, 0x01},
> +	{0x350b, 0x00},
> +	{0x350c, 0x41},
> +	{0x3600, 0x84},
> +	{0x3603, 0x08},
> +	{0x3610, 0x57},
> +	{0x3611, 0x1b},
> +	{0x3613, 0x78},
> +	{0x3623, 0x00},
> +	{0x3632, 0xa0},
> +	{0x3642, 0xe8},
> +	{0x364c, 0x70},
> +	{0x365f, 0x0f},
> +	{0x3708, 0x30},
> +	{0x3714, 0x24},
> +	{0x3725, 0x02},
> +	{0x3737, 0x08},
> +	{0x3739, 0x28},
> +	{0x3749, 0x32},
> +	{0x374a, 0x32},
> +	{0x374b, 0x32},
> +	{0x374c, 0x32},
> +	{0x374d, 0x81},
> +	{0x374e, 0x81},
> +	{0x374f, 0x81},
> +	{0x3752, 0x36},
> +	{0x3753, 0x36},
> +	{0x3754, 0x36},
> +	{0x3761, 0x00},
> +	{0x376c, 0x81},
> +	{0x3774, 0x18},
> +	{0x3776, 0x08},
> +	{0x377c, 0x81},
> +	{0x377d, 0x81},
> +	{0x377e, 0x81},
> +	{0x37a0, 0x44},
> +	{0x37a6, 0x44},
> +	{0x37aa, 0x0d},
> +	{0x37ae, 0x00},
> +	{0x37cb, 0x03},
> +	{0x37cc, 0x01},
> +	{0x37d8, 0x02},
> +	{0x37d9, 0x10},
> +	{0x37e1, 0x10},
> +	{0x37e2, 0x18},
> +	{0x37e3, 0x08},
> +	{0x37e4, 0x08},
> +	{0x37e5, 0x02},
> +	{0x37e6, 0x08},
> +
> +	/* 1928x1092 */
> +	{0x3800, 0x00},
> +	{0x3801, 0x00},
> +	{0x3802, 0x00},
> +	{0x3803, 0x00},
> +	{0x3804, 0x07},
> +	{0x3805, 0x8f},
> +	{0x3806, 0x04},
> +	{0x3807, 0x47},
> +	{0x3808, 0x07},
> +	{0x3809, 0x88},
> +	{0x380a, 0x04},
> +	{0x380b, 0x44},
> +	{0x380c, 0x08},
> +	{0x380d, 0xe8},
> +	{0x380e, 0x04},
> +	{0x380f, 0x8c},
> +	{0x3810, 0x00},
> +	{0x3811, 0x02},
> +	{0x3812, 0x00},
> +	{0x3813, 0x02},
> +	{0x3814, 0x01},
> +	{0x3815, 0x01},
> +	{0x3816, 0x01},
> +	{0x3817, 0x01},
> +
> +	{0x3820, 0xb0},
> +	{0x3821, 0x00},
> +	{0x3822, 0x80},
> +	{0x3823, 0x08},
> +	{0x3824, 0x00},
> +	{0x3825, 0x20},
> +	{0x3826, 0x00},
> +	{0x3827, 0x08},
> +	{0x382a, 0x00},
> +	{0x382b, 0x08},
> +	{0x382d, 0x00},
> +	{0x382e, 0x00},
> +	{0x382f, 0x23},
> +	{0x3834, 0x00},
> +	{0x3839, 0x00},
> +	{0x383a, 0xd1},
> +	{0x383e, 0x03},
> +	{0x393d, 0x29},
> +	{0x393f, 0x6e},
> +	{0x394b, 0x06},
> +	{0x394c, 0x06},
> +	{0x394d, 0x08},
> +	{0x394e, 0x0b},
> +	{0x394f, 0x01},
> +	{0x3950, 0x01},
> +	{0x3951, 0x01},
> +	{0x3952, 0x01},
> +	{0x3953, 0x01},
> +	{0x3954, 0x01},
> +	{0x3955, 0x01},
> +	{0x3956, 0x01},
> +	{0x3957, 0x0e},
> +	{0x3958, 0x08},
> +	{0x3959, 0x08},
> +	{0x395a, 0x08},
> +	{0x395b, 0x13},
> +	{0x395c, 0x09},
> +	{0x395d, 0x05},
> +	{0x395e, 0x02},
> +	{0x395f, 0x00},
> +	{0x395f, 0x00},
> +	{0x3960, 0x00},
> +	{0x3961, 0x00},
> +	{0x3962, 0x00},
> +	{0x3963, 0x00},
> +	{0x3964, 0x00},
> +	{0x3965, 0x00},
> +	{0x3966, 0x00},
> +	{0x3967, 0x00},
> +	{0x3968, 0x01},
> +	{0x3969, 0x01},
> +	{0x396a, 0x01},
> +	{0x396b, 0x01},
> +	{0x396c, 0x10},
> +	{0x396d, 0xf0},
> +	{0x396e, 0x11},
> +	{0x396f, 0x00},
> +	{0x3970, 0x37},
> +	{0x3971, 0x37},
> +	{0x3972, 0x37},
> +	{0x3973, 0x37},
> +	{0x3974, 0x00},
> +	{0x3975, 0x3c},
> +	{0x3976, 0x3c},
> +	{0x3977, 0x3c},
> +	{0x3978, 0x3c},
> +	{0x3c00, 0x0f},
> +	{0x3c20, 0x01},
> +	{0x3c21, 0x08},
> +	{0x3f00, 0x8b},
> +	{0x3f02, 0x0f},
> +	{0x4000, 0xc3},
> +	{0x4001, 0xe0},
> +	{0x4002, 0x00},
> +	{0x4003, 0x40},
> +	{0x4008, 0x04},
> +	{0x4009, 0x23},
> +	{0x400a, 0x04},
> +	{0x400b, 0x01},
> +	{0x4077, 0x06},
> +	{0x4078, 0x00},
> +	{0x4079, 0x1a},
> +	{0x407a, 0x7f},
> +	{0x407b, 0x01},
> +	{0x4080, 0x03},
> +	{0x4081, 0x84},
> +	{0x4308, 0x03},
> +	{0x4309, 0xff},
> +	{0x430d, 0x00},
> +	{0x4806, 0x00},
> +	{0x4813, 0x00},
> +	{0x4837, 0x10},
> +	{0x4857, 0x05},
> +	{0x4500, 0x07},
> +	{0x4501, 0x00},
> +	{0x4503, 0x00},
> +	{0x450a, 0x04},
> +	{0x450e, 0x00},
> +	{0x450f, 0x00},
> +	{0x4800, 0x24},
> +	{0x4900, 0x00},
> +	{0x4901, 0x00},
> +	{0x4902, 0x01},
> +	{0x5000, 0xf5},
> +	{0x5001, 0x50},
> +	{0x5006, 0x00},
> +	{0x5080, 0x40},
> +	{0x5181, 0x2b},
> +	{0x5202, 0xa3},
> +	{0x5206, 0x01},
> +	{0x5207, 0x00},
> +	{0x520a, 0x01},
> +	{0x520b, 0x00},
> +	{0x365d, 0x00},
> +	{0x4815, 0x40},
> +	{0x4816, 0x12},
> +	{0x4f00, 0x01},
> +	/* plls */
> +	{0x0303, 0x05},
> +	{0x0305, 0x90},
> +	{0x0316, 0x90},
> +	{0x3016, 0x12},
> +};
> +
> +static const struct reg_sequence sensor_1928x1092_2lane_30fps_setting[] = {
> +	{0x0301, 0x08},
> +	{0x0303, 0x06},
> +	{0x0304, 0x01},
> +	{0x0305, 0xe0},
> +	{0x0313, 0x40},
> +	{0x031c, 0x4f},
> +	{0x301b, 0xf0},
> +	{0x3020, 0x97},
> +	{0x3022, 0x01},
> +	{0x3026, 0xb4},
> +	{0x3027, 0xf1},
> +	{0x303b, 0x00},
> +	{0x303c, 0x4f},
> +	{0x303d, 0xe6},
> +	{0x303e, 0x00},
> +	{0x303f, 0x03},
> +	{0x3021, 0x23},
> +	{0x3501, 0x04},
> +	{0x3502, 0x6c},
> +	{0x3504, 0x0c},
> +	{0x3507, 0x00},
> +	{0x3508, 0x08},
> +	{0x3509, 0x00},
> +	{0x350a, 0x01},
> +	{0x350b, 0x00},
> +	{0x350c, 0x41},
> +	{0x3600, 0x84},
> +	{0x3603, 0x08},
> +	{0x3610, 0x57},
> +	{0x3611, 0x1b},
> +	{0x3613, 0x78},
> +	{0x3623, 0x00},
> +	{0x3632, 0xa0},
> +	{0x3642, 0xe8},
> +	{0x364c, 0x70},
> +	{0x365f, 0x0f},
> +	{0x3708, 0x30},
> +	{0x3714, 0x24},
> +	{0x3725, 0x02},
> +	{0x3737, 0x08},
> +	{0x3739, 0x28},
> +	{0x3749, 0x32},
> +	{0x374a, 0x32},
> +	{0x374b, 0x32},
> +	{0x374c, 0x32},
> +	{0x374d, 0x81},
> +	{0x374e, 0x81},
> +	{0x374f, 0x81},
> +	{0x3752, 0x36},
> +	{0x3753, 0x36},
> +	{0x3754, 0x36},
> +	{0x3761, 0x00},
> +	{0x376c, 0x81},
> +	{0x3774, 0x18},
> +	{0x3776, 0x08},
> +	{0x377c, 0x81},
> +	{0x377d, 0x81},
> +	{0x377e, 0x81},
> +	{0x37a0, 0x44},
> +	{0x37a6, 0x44},
> +	{0x37aa, 0x0d},
> +	{0x37ae, 0x00},
> +	{0x37cb, 0x03},
> +	{0x37cc, 0x01},
> +	{0x37d8, 0x02},
> +	{0x37d9, 0x10},
> +	{0x37e1, 0x10},
> +	{0x37e2, 0x18},
> +	{0x37e3, 0x08},
> +	{0x37e4, 0x08},
> +	{0x37e5, 0x02},
> +	{0x37e6, 0x08},
> +
> +	/* 1928x1092 */
> +	{0x3800, 0x00},
> +	{0x3801, 0x00},
> +	{0x3802, 0x00},
> +	{0x3803, 0x00},
> +	{0x3804, 0x07},
> +	{0x3805, 0x8f},
> +	{0x3806, 0x04},
> +	{0x3807, 0x47},
> +	{0x3808, 0x07},
> +	{0x3809, 0x88},
> +	{0x380a, 0x04},
> +	{0x380b, 0x44},
> +	{0x380c, 0x04},
> +	{0x380d, 0x74},
> +	{0x380e, 0x09},
> +	{0x380f, 0x18},
> +	{0x3810, 0x00},
> +	{0x3811, 0x02},
> +	{0x3812, 0x00},
> +	{0x3813, 0x02},
> +	{0x3814, 0x01},
> +	{0x3815, 0x01},
> +	{0x3816, 0x01},
> +	{0x3817, 0x01},
> +
> +	{0x3820, 0xb0},
> +	{0x3821, 0x00},
> +	{0x3822, 0x80},
> +	{0x3823, 0x08},
> +	{0x3824, 0x00},
> +	{0x3825, 0x20},
> +	{0x3826, 0x00},
> +	{0x3827, 0x08},
> +	{0x382a, 0x00},
> +	{0x382b, 0x08},
> +	{0x382d, 0x00},
> +	{0x382e, 0x00},
> +	{0x382f, 0x23},
> +	{0x3834, 0x00},
> +	{0x3839, 0x00},
> +	{0x383a, 0xd1},
> +	{0x383e, 0x03},
> +	{0x393d, 0x29},
> +	{0x393f, 0x6e},
> +	{0x394b, 0x06},
> +	{0x394c, 0x06},
> +	{0x394d, 0x08},
> +	{0x394e, 0x0a},
> +	{0x394f, 0x01},
> +	{0x3950, 0x01},
> +	{0x3951, 0x01},
> +	{0x3952, 0x01},
> +	{0x3953, 0x01},
> +	{0x3954, 0x01},
> +	{0x3955, 0x01},
> +	{0x3956, 0x01},
> +	{0x3957, 0x0e},
> +	{0x3958, 0x08},
> +	{0x3959, 0x08},
> +	{0x395a, 0x08},
> +	{0x395b, 0x13},
> +	{0x395c, 0x09},
> +	{0x395d, 0x05},
> +	{0x395e, 0x02},
> +	{0x395f, 0x00},
> +	{0x395f, 0x00},
> +	{0x3960, 0x00},
> +	{0x3961, 0x00},
> +	{0x3962, 0x00},
> +	{0x3963, 0x00},
> +	{0x3964, 0x00},
> +	{0x3965, 0x00},
> +	{0x3966, 0x00},
> +	{0x3967, 0x00},
> +	{0x3968, 0x01},
> +	{0x3969, 0x01},
> +	{0x396a, 0x01},
> +	{0x396b, 0x01},
> +	{0x396c, 0x10},
> +	{0x396d, 0xf0},
> +	{0x396e, 0x11},
> +	{0x396f, 0x00},
> +	{0x3970, 0x37},
> +	{0x3971, 0x37},
> +	{0x3972, 0x37},
> +	{0x3973, 0x37},
> +	{0x3974, 0x00},
> +	{0x3975, 0x3c},
> +	{0x3976, 0x3c},
> +	{0x3977, 0x3c},
> +	{0x3978, 0x3c},
> +	{0x3c00, 0x0f},
> +	{0x3c20, 0x01},
> +	{0x3c21, 0x08},
> +	{0x3f00, 0x8b},
> +	{0x3f02, 0x0f},
> +	{0x4000, 0xc3},
> +	{0x4001, 0xe0},
> +	{0x4002, 0x00},
> +	{0x4003, 0x40},
> +	{0x4008, 0x04},
> +	{0x4009, 0x23},
> +	{0x400a, 0x04},
> +	{0x400b, 0x01},
> +	{0x4041, 0x20},
> +	{0x4077, 0x06},
> +	{0x4078, 0x00},
> +	{0x4079, 0x1a},
> +	{0x407a, 0x7f},
> +	{0x407b, 0x01},
> +	{0x4080, 0x03},
> +	{0x4081, 0x84},
> +	{0x4308, 0x03},
> +	{0x4309, 0xff},
> +	{0x430d, 0x00},
> +	{0x4806, 0x00},
> +	{0x4813, 0x00},
> +	{0x4837, 0x10},
> +	{0x4857, 0x05},
> +	{0x4884, 0x04},
> +	{0x4500, 0x07},
> +	{0x4501, 0x00},
> +	{0x4503, 0x00},
> +	{0x450a, 0x04},
> +	{0x450e, 0x00},
> +	{0x450f, 0x00},
> +	{0x4800, 0x64},
> +	{0x4900, 0x00},
> +	{0x4901, 0x00},
> +	{0x4902, 0x01},
> +	{0x4d00, 0x03},
> +	{0x4d01, 0xd8},
> +	{0x4d02, 0xba},
> +	{0x4d03, 0xa0},
> +	{0x4d04, 0xb7},
> +	{0x4d05, 0x34},
> +	{0x4d0d, 0x00},
> +	{0x5000, 0xfd},
> +	{0x5001, 0x50},
> +	{0x5006, 0x00},
> +	{0x5080, 0x40},
> +	{0x5181, 0x2b},
> +	{0x5202, 0xa3},
> +	{0x5206, 0x01},
> +	{0x5207, 0x00},
> +	{0x520a, 0x01},
> +	{0x520b, 0x00},
> +	{0x365d, 0x00},
> +	{0x4815, 0x40},
> +	{0x4816, 0x12},
> +	{0x481f, 0x30},
> +	{0x4f00, 0x01},
> +	/* plls */
> +	{0x0303, 0x05},
> +	{0x0305, 0x90},
> +	{0x0316, 0x90},
> +	{0x3016, 0x32},
> +};
> +
> +static const char * const ov02c10_test_pattern_menu[] = {
> +	"Disabled",
> +	"Color Bar",
> +	"Top-Bottom Darker Color Bar",
> +	"Right-Left Darker Color Bar",
> +	"Color Bar type 4",
> +};
> +
> +static const s64 link_freq_menu_items[] = {
> +	OV02C10_LINK_FREQ_400MHZ,
> +};
> +
> +static const struct ov02c10_mode supported_modes[] = {
> +	{
> +		.width = 1928,
> +		.height = 1092,
> +		.hts = 2280,
> +		.vts_def = 1164,
> +		.vts_min = 1164,
> +		.mipi_lanes = 1,
> +		.reg_sequence = sensor_1928x1092_1lane_30fps_setting,
> +		.sequence_length = ARRAY_SIZE(sensor_1928x1092_1lane_30fps_setting),
> +	},
> +	{
> +		.width = 1928,
> +		.height = 1092,
> +		.hts = 1140,
> +		.vts_def = 2328,
> +		.vts_min = 2328,
> +		.mipi_lanes = 2,
> +		.reg_sequence = sensor_1928x1092_2lane_30fps_setting,
> +		.sequence_length = ARRAY_SIZE(sensor_1928x1092_2lane_30fps_setting),
> +	},
> +};
> +
> +struct ov02c10 {
> +	struct v4l2_subdev sd;
> +	struct media_pad pad;
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct regmap *regmap;
> +
> +	/* V4L2 Controls */
> +	struct v4l2_ctrl *link_freq;
> +	struct v4l2_ctrl *pixel_rate;
> +	struct v4l2_ctrl *vblank;
> +	struct v4l2_ctrl *hblank;
> +	struct v4l2_ctrl *exposure;
> +
> +	struct clk *img_clk;
> +	struct regulator *avdd;
> +	struct gpio_desc *reset;
> +	struct gpio_desc *handshake;
> +
> +	/* Current mode */
> +	const struct ov02c10_mode *cur_mode;
> +
> +	/* To serialize asynchronous callbacks */
> +	struct mutex mutex;
> +
> +	/* MIPI lanes used */
> +	u8 mipi_lanes;
> +
> +	/* Streaming on/off */
> +	bool streaming;
> +};
> +
> +static inline struct ov02c10 *to_ov02c10(struct v4l2_subdev *subdev)
> +{
> +	return container_of(subdev, struct ov02c10, sd);
> +}
> +
> +static int ov02c10_test_pattern(struct ov02c10 *ov02c10, int pattern)
> +{
> +	int ret = 0;
> +
> +	if (!pattern)
> +		return cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
> +			BIT(7), 0, NULL);
> +
> +	cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
> +			0x03, pattern - 1, &ret);
> +	if (ret)
> +		return ret;
> +
> +	cci_update_bits(ov02c10->regmap, OV02C10_REG_TEST_PATTERN,
> +			BIT(7), OV02C10_TEST_PATTERN_ENABLE, &ret);
> +
> +	return ret;
> +}
> +
> +static int ov02c10_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ov02c10 *ov02c10 = container_of(ctrl->handler,
> +					     struct ov02c10, ctrl_handler);
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02c10->sd);
> +	s64 exposure_max;
> +	int ret = 0;
> +
> +	/* Propagate change of current control to all related controls */
> +	if (ctrl->id == V4L2_CID_VBLANK) {
> +		/* Update max exposure while meeting expected vblanking */
> +		exposure_max = ov02c10->cur_mode->height + ctrl->val -
> +			       OV02C10_EXPOSURE_MAX_MARGIN;
> +		__v4l2_ctrl_modify_range(ov02c10->exposure,
> +					 ov02c10->exposure->minimum,
> +					 exposure_max, ov02c10->exposure->step,
> +					 exposure_max);
> +	}
> +
> +	/* V4L2 controls values will be applied only when power is already up */
> +	if (!pm_runtime_get_if_in_use(&client->dev))
> +		return 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		cci_write(ov02c10->regmap, OV02C10_REG_ANALOG_GAIN,
> +			  ctrl->val << 4, &ret);
> +		break;
> +
> +	case V4L2_CID_DIGITAL_GAIN:
> +		cci_write(ov02c10->regmap, OV02C10_REG_DIGITAL_GAIN,
> +			  ctrl->val << 6, &ret);
> +		break;
> +
> +	case V4L2_CID_EXPOSURE:
> +		cci_write(ov02c10->regmap, OV02C10_REG_EXPOSURE,
> +			  ctrl->val, &ret);
> +		break;
> +
> +	case V4L2_CID_VBLANK:
> +		cci_write(ov02c10->regmap, OV02C10_REG_VTS,
> +			  ov02c10->cur_mode->height + ctrl->val, &ret);
> +		break;
> +
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = ov02c10_test_pattern(ov02c10, ctrl->val);
> +		break;
> +
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	pm_runtime_put(&client->dev);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops ov02c10_ctrl_ops = {
> +	.s_ctrl = ov02c10_set_ctrl,
> +};
> +
> +static int ov02c10_init_controls(struct ov02c10 *ov02c10)
> +{
> +	struct v4l2_ctrl_handler *ctrl_hdlr;
> +	const struct ov02c10_mode *cur_mode;
> +	s64 exposure_max, h_blank;
> +	u32 vblank_min, vblank_max, vblank_default;
> +	int size;
> +	int ret = 0;
> +
> +	ctrl_hdlr = &ov02c10->ctrl_handler;
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
> +	if (ret)
> +		return ret;
> +
> +	ctrl_hdlr->lock = &ov02c10->mutex;
> +	cur_mode = ov02c10->cur_mode;
> +	size = ARRAY_SIZE(link_freq_menu_items);
> +
> +	ov02c10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
> +						    &ov02c10_ctrl_ops,
> +						    V4L2_CID_LINK_FREQ,
> +						    size - 1, 0,
> +						    link_freq_menu_items);
> +	if (ov02c10->link_freq)
> +		ov02c10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	ov02c10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
> +						V4L2_CID_PIXEL_RATE, 0,
> +						OV02C10_SCLK, 1, OV02C10_SCLK);
> +
> +	vblank_min = cur_mode->vts_min - cur_mode->height;
> +	vblank_max = OV02C10_VTS_MAX - cur_mode->height;
> +	vblank_default = cur_mode->vts_def - cur_mode->height;
> +	ov02c10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
> +					    V4L2_CID_VBLANK, vblank_min,
> +					    vblank_max, 1, vblank_default);
> +
> +	h_blank = cur_mode->hts - cur_mode->width;
> +	ov02c10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
> +					    V4L2_CID_HBLANK, h_blank, h_blank,
> +					    1, h_blank);
> +	if (ov02c10->hblank)
> +		ov02c10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> +			  OV02C10_ANAL_GAIN_MIN, OV02C10_ANAL_GAIN_MAX,
> +			  OV02C10_ANAL_GAIN_STEP, OV02C10_ANAL_GAIN_DEFAULT);
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
> +			  OV02C10_DGTL_GAIN_MIN, OV02C10_DGTL_GAIN_MAX,
> +			  OV02C10_DGTL_GAIN_STEP, OV02C10_DGTL_GAIN_DEFAULT);
> +	exposure_max = cur_mode->vts_def - OV02C10_EXPOSURE_MAX_MARGIN;
> +	ov02c10->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
> +					      V4L2_CID_EXPOSURE,
> +					      OV02C10_EXPOSURE_MIN,
> +					      exposure_max,
> +					      OV02C10_EXPOSURE_STEP,
> +					      exposure_max);
> +	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov02c10_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(ov02c10_test_pattern_menu) - 1,
> +				     0, 0, ov02c10_test_pattern_menu);
> +	if (ctrl_hdlr->error)
> +		return ctrl_hdlr->error;
> +
> +	ov02c10->sd.ctrl_handler = ctrl_hdlr;
> +
> +	return 0;
> +}
> +
> +static void ov02c10_update_pad_format(const struct ov02c10_mode *mode,
> +				      struct v4l2_mbus_framefmt *fmt)
> +{
> +	fmt->width = mode->width;
> +	fmt->height = mode->height;
> +	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +	fmt->field = V4L2_FIELD_NONE;
> +}
> +
> +static int ov02c10_start_streaming(struct ov02c10 *ov02c10)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02c10->sd);
> +	const struct reg_sequence *reg_sequence;
> +	int sequence_length;
> +	int ret = 0;
> +
> +	reg_sequence = ov02c10->cur_mode->reg_sequence;
> +	sequence_length = ov02c10->cur_mode->sequence_length;
> +	ret = regmap_multi_reg_write(ov02c10->regmap,
> +				     reg_sequence, sequence_length);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to set mode");
> +		return ret;
> +	}
> +
> +	ret = __v4l2_ctrl_handler_setup(ov02c10->sd.ctrl_handler);
> +	if (ret)
> +		return ret;
> +
> +	ret = cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 1, NULL);
> +	if (ret)
> +		dev_err(&client->dev, "failed to start streaming");
> +
> +	return ret;
> +}
> +
> +static void ov02c10_stop_streaming(struct ov02c10 *ov02c10)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02c10->sd);
> +	int ret = 0;
> +
> +	ret = cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 0, NULL);
> +	if (ret)
> +		dev_err(&client->dev, "failed to stop streaming");
> +}
> +
> +static int ov02c10_set_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +	int ret = 0;
> +
> +	if (ov02c10->streaming == enable)
> +		return 0;
> +
> +	mutex_lock(&ov02c10->mutex);
> +	if (enable) {
> +		ret = pm_runtime_get_sync(&client->dev);
> +		if (ret < 0) {
> +			pm_runtime_put_noidle(&client->dev);
> +			mutex_unlock(&ov02c10->mutex);
> +			return ret;
> +		}
> +
> +		ret = ov02c10_start_streaming(ov02c10);
> +		if (ret) {
> +			enable = 0;
> +			ov02c10_stop_streaming(ov02c10);
> +			pm_runtime_put(&client->dev);
> +		}
> +	} else {
> +		ov02c10_stop_streaming(ov02c10);
> +		pm_runtime_put(&client->dev);
> +	}
> +
> +	ov02c10->streaming = enable;
> +	mutex_unlock(&ov02c10->mutex);
> +
> +	return ret;
> +}
> +
> +/* This function tries to get power control resources */
> +static int ov02c10_get_pm_resources(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
> +	int ret;
> +
> +	ov02c10->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ov02c10->reset))
> +		return dev_err_probe(dev, PTR_ERR(ov02c10->reset),
> +				     "failed to get reset gpio\n");
> +
> +	ov02c10->handshake = devm_gpiod_get_optional(dev, "handshake",
> +						     GPIOD_OUT_LOW);
> +	if (IS_ERR(ov02c10->handshake))
> +		return dev_err_probe(dev, PTR_ERR(ov02c10->handshake),
> +				     "failed to get handshake gpio\n");
> +
> +	ov02c10->img_clk = devm_clk_get_optional(dev, NULL);
> +	if (IS_ERR(ov02c10->img_clk))
> +		return dev_err_probe(dev, PTR_ERR(ov02c10->img_clk),
> +				     "failed to get imaging clock\n");
> +
> +	ov02c10->avdd = devm_regulator_get_optional(dev, "avdd");
> +	if (IS_ERR(ov02c10->avdd)) {
> +		ret = PTR_ERR(ov02c10->avdd);
> +		ov02c10->avdd = NULL;
> +		if (ret != -ENODEV)
> +			return dev_err_probe(dev, ret,
> +					     "failed to get avdd regulator\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static int ov02c10_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
> +	int ret = 0;
> +
> +	gpiod_set_value_cansleep(ov02c10->reset, 1);
> +	gpiod_set_value_cansleep(ov02c10->handshake, 0);
> +
> +	if (ov02c10->avdd)
> +		ret = regulator_disable(ov02c10->avdd);
> +
> +	clk_disable_unprepare(ov02c10->img_clk);
> +
> +	return ret;
> +}
> +
> +static int ov02c10_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
> +	int ret;
> +
> +	ret = clk_prepare_enable(ov02c10->img_clk);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable imaging clock: %d", ret);
> +		return ret;
> +	}
> +
> +	if (ov02c10->avdd) {
> +		ret = regulator_enable(ov02c10->avdd);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to enable avdd: %d", ret);
> +			clk_disable_unprepare(ov02c10->img_clk);
> +			return ret;
> +		}
> +	}
> +	gpiod_set_value_cansleep(ov02c10->handshake, 1);
> +	gpiod_set_value_cansleep(ov02c10->reset, 0);
> +
> +	/* Lattice MIPI aggregator with some version FW needs longer delay
> +	 * after handshake triggered. We set 25ms as a safe value and wait
> +	 * for a stable version FW.
> +	 */
> +	msleep_interruptible(25);
> +
> +	return ret;
> +}
> +
> +static int __maybe_unused ov02c10_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
> +
> +	mutex_lock(&ov02c10->mutex);
> +	if (ov02c10->streaming)
> +		ov02c10_stop_streaming(ov02c10);
> +
> +	mutex_unlock(&ov02c10->mutex);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused ov02c10_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
> +	int ret = 0;
> +
> +	mutex_lock(&ov02c10->mutex);
> +	if (!ov02c10->streaming)
> +		goto exit;
> +
> +	ret = ov02c10_start_streaming(ov02c10);
> +	if (ret) {
> +		ov02c10->streaming = false;
> +		ov02c10_stop_streaming(ov02c10);
> +	}
> +
> +exit:
> +	mutex_unlock(&ov02c10->mutex);
> +	return ret;
> +}
> +
> +static int ov02c10_set_format(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *sd_state,
> +			      struct v4l2_subdev_format *fmt)
> +{
> +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
> +	const struct ov02c10_mode *mode;
> +	s32 vblank_def, h_blank;
> +
> +	if (ov02c10->mipi_lanes == 1)
> +		mode = &supported_modes[0];
> +	else
> +		mode = &supported_modes[1];
> +
> +	mutex_lock(&ov02c10->mutex);
> +	ov02c10_update_pad_format(mode, &fmt->format);
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
> +	} else {
> +		ov02c10->cur_mode = mode;
> +		__v4l2_ctrl_s_ctrl(ov02c10->link_freq, mode->link_freq_index);
> +		__v4l2_ctrl_s_ctrl_int64(ov02c10->pixel_rate, OV02C10_SCLK);
> +
> +		/* Update limits and set FPS to default */
> +		vblank_def = mode->vts_def - mode->height;
> +		__v4l2_ctrl_modify_range(ov02c10->vblank,
> +					 mode->vts_min - mode->height,
> +					 OV02C10_VTS_MAX - mode->height, 1,
> +					 vblank_def);
> +		__v4l2_ctrl_s_ctrl(ov02c10->vblank, vblank_def);
> +		h_blank = mode->hts - mode->width;
> +		__v4l2_ctrl_modify_range(ov02c10->hblank, h_blank, h_blank, 1,
> +					 h_blank);
> +	}
> +	mutex_unlock(&ov02c10->mutex);
> +
> +	return 0;
> +}
> +
> +static int ov02c10_get_format(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *sd_state,
> +			      struct v4l2_subdev_format *fmt)
> +{
> +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
> +
> +	mutex_lock(&ov02c10->mutex);
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> +		fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad);
> +	else
> +		ov02c10_update_pad_format(ov02c10->cur_mode, &fmt->format);
> +
> +	mutex_unlock(&ov02c10->mutex);
> +
> +	return 0;
> +}
> +
> +static int ov02c10_enum_mbus_code(struct v4l2_subdev *sd,
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
> +static int ov02c10_enum_frame_size(struct v4l2_subdev *sd,
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
> +static int ov02c10_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
> +
> +	mutex_lock(&ov02c10->mutex);
> +	ov02c10_update_pad_format(&supported_modes[0],
> +				  v4l2_subdev_state_get_format(fh->state, 0));
> +	mutex_unlock(&ov02c10->mutex);
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_video_ops ov02c10_video_ops = {
> +	.s_stream = ov02c10_set_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops ov02c10_pad_ops = {
> +	.set_fmt = ov02c10_set_format,
> +	.get_fmt = ov02c10_get_format,
> +	.enum_mbus_code = ov02c10_enum_mbus_code,
> +	.enum_frame_size = ov02c10_enum_frame_size,
> +};
> +
> +static const struct v4l2_subdev_ops ov02c10_subdev_ops = {
> +	.video = &ov02c10_video_ops,
> +	.pad = &ov02c10_pad_ops,
> +};
> +
> +static const struct media_entity_operations ov02c10_subdev_entity_ops = {
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
> +static const struct v4l2_subdev_internal_ops ov02c10_internal_ops = {
> +	.open = ov02c10_open,
> +};
> +
> +static int ov02c10_read_mipi_lanes(struct ov02c10 *ov02c10, struct device *dev)
> +{
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
> +	struct fwnode_handle *ep;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +	int ret = 0;
> +
> +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!ep)
> +		return -ENXIO;
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;
> +
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2 &&
> +	    bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
> +		dev_err(dev, "number of CSI2 data lanes %d is not supported",
> +			bus_cfg.bus.mipi_csi2.num_data_lanes);
> +		return(-EINVAL);
> +	}
> +	ov02c10->mipi_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
> +	return ret;
> +}
> +
> +static int ov02c10_identify_module(struct ov02c10 *ov02c10)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02c10->sd);
> +	u64 chip_id;
> +	u32 ret = 0;
> +
> +	ov02c10->regmap = devm_cci_regmap_init_i2c(client, 16);
> +	cci_read(ov02c10->regmap, OV02C10_REG_CHIP_ID, &chip_id, &ret);
> +	if (ret)
> +		return ret;
> +
> +	if (chip_id != OV02C10_CHIP_ID) {
> +		dev_err(&client->dev, "chip id mismatch: %x!=%llx",
> +			OV02C10_CHIP_ID, chip_id);
> +		return -ENXIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ov02c10_check_hwcfg(struct device *dev)
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
> +	if (!fwnode)
> +		return -ENXIO;
> +
> +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!ep)
> +		return -EPROBE_DEFER;
> +
> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> +				       &ext_clk);
> +	if (ret) {
> +		dev_err(dev, "can't get clock frequency");
> +		return ret;
> +	}
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;
> +
> +	if (!bus_cfg.nr_of_link_frequencies) {
> +		dev_err(dev, "no link frequencies defined");
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
> +			dev_err(dev, "no link frequency %lld supported",
> +				link_freq_menu_items[i]);
> +			ret = -EINVAL;
> +			goto out_err;
> +		}
> +	}
> +
> +out_err:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +}
> +
> +static void ov02c10_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov02c10 *ov02c10 = to_ov02c10(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(sd->ctrl_handler);
> +	pm_runtime_disable(&client->dev);
> +	mutex_destroy(&ov02c10->mutex);
> +}
> +
> +static int ov02c10_probe(struct i2c_client *client)
> +{
> +	struct ov02c10 *ov02c10;
> +	int ret = 0;
> +
> +	/* Check HW config */
> +	ret = ov02c10_check_hwcfg(&client->dev);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to check hwcfg: %d", ret);
> +		return ret;
> +	}
> +
> +	ov02c10 = devm_kzalloc(&client->dev, sizeof(*ov02c10), GFP_KERNEL);
> +	if (!ov02c10)
> +		return -ENOMEM;
> +
> +	v4l2_i2c_subdev_init(&ov02c10->sd, client, &ov02c10_subdev_ops);
> +	ov02c10_get_pm_resources(&client->dev);
> +
> +	ret = ov02c10_power_on(&client->dev);
> +	if (ret) {
> +		dev_err_probe(&client->dev, ret, "failed to power on\n");
> +		return ret;
> +	}
> +
> +	ret = ov02c10_identify_module(ov02c10);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to find sensor: %d", ret);
> +		goto probe_error_ret;
> +	}
> +
> +	ret = ov02c10_read_mipi_lanes(ov02c10, &client->dev);
> +	if (ret)
> +		goto probe_error_ret;
> +
> +	mutex_init(&ov02c10->mutex);
> +	ov02c10->cur_mode = &supported_modes[0];
> +	if (ov02c10->mipi_lanes == 2)
> +		ov02c10->cur_mode = &supported_modes[1];
> +	ret = ov02c10_init_controls(ov02c10);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to init controls: %d", ret);
> +		goto probe_error_v4l2_ctrl_handler_free;
> +	}
> +
> +	ov02c10->sd.internal_ops = &ov02c10_internal_ops;
> +	ov02c10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	ov02c10->sd.entity.ops = &ov02c10_subdev_entity_ops;
> +	ov02c10->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	ov02c10->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&ov02c10->sd.entity, 1, &ov02c10->pad);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to init entity pads: %d", ret);
> +		goto probe_error_v4l2_ctrl_handler_free;
> +	}
> +
> +	ret = v4l2_async_register_subdev_sensor(&ov02c10->sd);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
> +			ret);
> +		goto probe_error_media_entity_cleanup;
> +	}
> +
> +	/*
> +	 * Device is already turned on by i2c-core with ACPI domain PM.
> +	 * Enable runtime PM and turn off the device.
> +	 */
> +	pm_runtime_set_active(&client->dev);
> +	pm_runtime_enable(&client->dev);
> +	pm_runtime_idle(&client->dev);
> +
> +	return 0;
> +
> +probe_error_media_entity_cleanup:
> +	media_entity_cleanup(&ov02c10->sd.entity);
> +
> +probe_error_v4l2_ctrl_handler_free:
> +	v4l2_ctrl_handler_free(ov02c10->sd.ctrl_handler);
> +	mutex_destroy(&ov02c10->mutex);
> +
> +probe_error_ret:
> +	ov02c10_power_off(&client->dev);
> +
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops ov02c10_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(ov02c10_suspend, ov02c10_resume)
> +	SET_RUNTIME_PM_OPS(ov02c10_power_off, ov02c10_power_on, NULL)
> +};
> +
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id ov02c10_acpi_ids[] = {
> +	{"OVTI02C1"},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(acpi, ov02c10_acpi_ids);
> +#endif
> +
> +static struct i2c_driver ov02c10_i2c_driver = {
> +	.driver = {
> +		.name = "ov02c10",
> +		.pm = &ov02c10_pm_ops,
> +		.acpi_match_table = ACPI_PTR(ov02c10_acpi_ids),
> +	},
> +	.probe = ov02c10_probe,
> +	.remove = ov02c10_remove,
> +};
> +
> +module_i2c_driver(ov02c10_i2c_driver);
> +
> +MODULE_AUTHOR("Hao Yao <hao.yao@intel.com>");
> +MODULE_DESCRIPTION("OmniVision OV02C10 sensor driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.47.1
> 

