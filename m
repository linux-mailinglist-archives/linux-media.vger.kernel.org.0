Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 802913E8ED7
	for <lists+linux-media@lfdr.de>; Wed, 11 Aug 2021 12:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236900AbhHKKk7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Aug 2021 06:40:59 -0400
Received: from mga05.intel.com ([192.55.52.43]:32773 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232644AbhHKKk5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Aug 2021 06:40:57 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="300688237"
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; 
   d="scan'208";a="300688237"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 03:40:33 -0700
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; 
   d="scan'208";a="571101336"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 03:40:31 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 7AA5420364;
        Wed, 11 Aug 2021 13:40:29 +0300 (EEST)
Date:   Wed, 11 Aug 2021 13:40:29 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Arec Kao <arec.kao@intel.com>
Cc:     linux-media@vger.kernel.org, andy.yeh@intel.com,
        wei.shun.chang@intel.com
Subject: Re: [PATCH] Add sensor driver support for the ov13b10 camera.
Message-ID: <20210811104029.GM3@paasikivi.fi.intel.com>
References: <20210811102402.21945-1-arec.kao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811102402.21945-1-arec.kao@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arec,

Thanks for the patch.

A few small comments below.

On Wed, Aug 11, 2021 at 06:24:02PM +0800, Arec Kao wrote:
> This driver supports following features:
> 
> - phase detection auto focus (PDAF)
> - manual exposure and analog/digital gain control
> - vblank/hblank control
> - test pattern
> - image vertical flip and horizontal mirror control
> - 4208x3120 at 30FPS
> - 2080x1170 at 60FPS
> 
> Signed-off-by: Arec Kao <arec.kao@intel.com>
> ---
>  drivers/media/i2c/Kconfig   |   10 +
>  drivers/media/i2c/Makefile  |    1 +
>  drivers/media/i2c/ov13b10.c | 1414 +++++++++++++++++++++++++++++++++++
>  3 files changed, 1425 insertions(+)
>  create mode 100644 drivers/media/i2c/ov13b10.c
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 08feb3e8c1bf..ebd90b7dafd9 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1186,6 +1186,16 @@ config VIDEO_OV13858
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV13858 camera.
>  
> +config VIDEO_OV13B10
> +	tristate "OmniVision OV13B10 sensor support"
> +	depends on I2C && VIDEO_V4L2
> +	select MEDIA_CONTROLLER
> +	select VIDEO_V4L2_SUBDEV_API
> +	select V4L2_FWNODE
> +	help
> +	  This is a Video4Linux2 sensor driver for the OmniVision
> +	  OV13B10 camera.
> +
>  config VIDEO_VS6624
>  	tristate "ST VS6624 sensor support"
>  	depends on VIDEO_V4L2 && I2C
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 83268f20aa3a..5ac8d639e5ca 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -89,6 +89,7 @@ obj-$(CONFIG_VIDEO_OV9640) += ov9640.o
>  obj-$(CONFIG_VIDEO_OV9650) += ov9650.o
>  obj-$(CONFIG_VIDEO_OV9734) += ov9734.o
>  obj-$(CONFIG_VIDEO_OV13858) += ov13858.o
> +obj-$(CONFIG_VIDEO_OV13B10) += ov13b10.o
>  obj-$(CONFIG_VIDEO_MT9M001) += mt9m001.o
>  obj-$(CONFIG_VIDEO_MT9M032) += mt9m032.o
>  obj-$(CONFIG_VIDEO_MT9M111) += mt9m111.o
> diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
> new file mode 100644
> index 000000000000..1348352ebd59
> --- /dev/null
> +++ b/drivers/media/i2c/ov13b10.c
> @@ -0,0 +1,1414 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2021 Intel Corporation.
> +
> +#include <linux/acpi.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
> +
> +#define OV13B10_REG_VALUE_08BIT		1
> +#define OV13B10_REG_VALUE_16BIT		2
> +#define OV13B10_REG_VALUE_24BIT		3
> +
> +#define OV13B10_REG_MODE_SELECT		0x0100
> +#define OV13B10_MODE_STANDBY		0x00
> +#define OV13B10_MODE_STREAMING		0x01
> +
> +#define OV13B10_REG_SOFTWARE_RST	0x0103
> +#define OV13B10_SOFTWARE_RST		0x01
> +
> +/* Chip ID */
> +#define OV13B10_REG_CHIP_ID		0x300a
> +#define OV13B10_CHIP_ID			0x560d42
> +
> +/* V_TIMING internal */
> +#define OV13B10_REG_VTS			0x380e
> +#define OV13B10_VTS_30FPS		0x0c7c
> +#define OV13B10_VTS_60FPS		0x063e
> +#define OV13B10_VTS_MAX			0x7fff
> +
> +/* HBLANK control - read only */
> +#define OV13B10_PPL_560MHZ		4704
> +
> +/* Exposure control */
> +#define OV13B10_REG_EXPOSURE		0x3500
> +#define OV13B10_EXPOSURE_MIN		4
> +#define OV13B10_EXPOSURE_STEP		1
> +#define OV13B10_EXPOSURE_DEFAULT	0x40
> +
> +/* Analog gain control */
> +#define OV13B10_REG_ANALOG_GAIN		0x3508
> +#define OV13B10_ANA_GAIN_MIN		0x80
> +#define OV13B10_ANA_GAIN_MAX		0x07c0
> +#define OV13B10_ANA_GAIN_STEP		1
> +#define OV13B10_ANA_GAIN_DEFAULT	0x80
> +
> +/* Digital gain control */
> +#define OV13B10_REG_DGTL_GAIN_H		0x350a
> +#define OV13B10_REG_DGTL_GAIN_M		0x350b
> +#define OV13B10_REG_DGTL_GAIN_L		0x350c
> +
> +#define OV13B10_DGTL_GAIN_MIN		1024		/* Min = 1 X */
> +#define OV13B10_DGTL_GAIN_MAX		(4096 - 1)	/* Max = 4 X */
> +#define OV13B10_DGTL_GAIN_DEFAULT	2560		/* Default gain = 2.5 X */
> +#define OV13B10_DGTL_GAIN_STEP		1		/* Each step = 1/1024 */
> +
> +#define OV13B10_DGTL_GAIN_L_SHIFT	6
> +#define OV13B10_DGTL_GAIN_L_MASK	0x3
> +#define OV13B10_DGTL_GAIN_M_SHIFT	2
> +#define OV13B10_DGTL_GAIN_M_MASK	0xff
> +#define OV13B10_DGTL_GAIN_H_SHIFT	10
> +#define OV13B10_DGTL_GAIN_H_MASK	0x3
> +
> +/* Test Pattern Control */
> +#define OV13B10_REG_TEST_PATTERN	0x5080
> +#define OV13B10_TEST_PATTERN_ENABLE	BIT(7)
> +#define OV13B10_TEST_PATTERN_MASK	0xf3
> +#define OV13B10_TEST_PATTERN_BAR_SHIFT	2
> +
> +/* Flip Control */
> +#define OV13B10_REG_FORMAT1		0x3820
> +#define OV13B10_REG_FORMAT2		0x3821
> +
> +/* Horizontal Window Offset */
> +#define OV13B10_REG_H_WIN_OFFSET	0x3811
> +
> +/* Vertical Window Offset */
> +#define OV13B10_REG_V_WIN_OFFSET	0x3813
> +
> +struct ov13b10_reg {
> +	u16 address;
> +	u8 val;
> +};
> +
> +struct ov13b10_reg_list {
> +	u32 num_of_regs;
> +	const struct ov13b10_reg *regs;
> +};
> +
> +/* Link frequency config */
> +struct ov13b10_link_freq_config {
> +	u32 pixels_per_line;
> +
> +	/* registers for this link frequency */
> +	struct ov13b10_reg_list reg_list;
> +};
> +
> +/* Mode : resolution and related config&values */
> +struct ov13b10_mode {
> +	/* Frame width */
> +	u32 width;
> +	/* Frame height */
> +	u32 height;
> +
> +	/* V-timing */
> +	u32 vts_def;
> +	u32 vts_min;
> +
> +	/* Index of Link frequency config to be used */
> +	u32 link_freq_index;
> +	/* Default register values */
> +	struct ov13b10_reg_list reg_list;
> +};
> +
> +/* 4208x3120 needs 1120Mbps/lane, 4 lanes */
> +static const struct ov13b10_reg mipi_data_rate_1120mbps[] = {
> +	{0x0103, 0x01},
> +	{0x0303, 0x04},
> +	{0x0305, 0xaf},
> +	{0x0321, 0x00},
> +	{0x0323, 0x04},
> +	{0x0324, 0x01},
> +	{0x0325, 0xa4},
> +	{0x0326, 0x81},
> +	{0x0327, 0x04},
> +	{0x3012, 0x07},
> +	{0x3013, 0x32},
> +	{0x3107, 0x23},
> +	{0x3501, 0x0c},
> +	{0x3502, 0x10},
> +	{0x3504, 0x08},
> +	{0x3508, 0x07},
> +	{0x3509, 0xc0},
> +	{0x3600, 0x16},
> +	{0x3601, 0x54},
> +	{0x3612, 0x4e},
> +	{0x3620, 0x00},
> +	{0x3621, 0x68},
> +	{0x3622, 0x66},
> +	{0x3623, 0x03},
> +	{0x3662, 0x92},
> +	{0x3666, 0xbb},
> +	{0x3667, 0x44},
> +	{0x366e, 0xff},
> +	{0x366f, 0xf3},
> +	{0x3675, 0x44},
> +	{0x3676, 0x00},
> +	{0x367f, 0xe9},
> +	{0x3681, 0x32},
> +	{0x3682, 0x1f},
> +	{0x3683, 0x0b},
> +	{0x3684, 0x0b},
> +	{0x3704, 0x0f},
> +	{0x3706, 0x40},
> +	{0x3708, 0x3b},
> +	{0x3709, 0x72},
> +	{0x370b, 0xa2},
> +	{0x3714, 0x24},
> +	{0x371a, 0x3e},
> +	{0x3725, 0x42},
> +	{0x3739, 0x12},
> +	{0x3767, 0x00},
> +	{0x377a, 0x0d},
> +	{0x3789, 0x18},
> +	{0x3790, 0x40},
> +	{0x3791, 0xa2},
> +	{0x37c2, 0x04},
> +	{0x37c3, 0xf1},
> +	{0x37d9, 0x0c},
> +	{0x37da, 0x02},
> +	{0x37dc, 0x02},
> +	{0x37e1, 0x04},
> +	{0x37e2, 0x0a},
> +	{0x3800, 0x00},
> +	{0x3801, 0x00},
> +	{0x3802, 0x00},
> +	{0x3803, 0x08},
> +	{0x3804, 0x10},
> +	{0x3805, 0x8f},
> +	{0x3806, 0x0c},
> +	{0x3807, 0x47},
> +	{0x3808, 0x10},
> +	{0x3809, 0x70},
> +	{0x380a, 0x0c},
> +	{0x380b, 0x30},
> +	{0x380c, 0x04},
> +	{0x380d, 0x98},
> +	{0x380e, 0x0c},
> +	{0x380f, 0x7c},
> +	{0x3811, 0x0f},
> +	{0x3813, 0x09},
> +	{0x3814, 0x01},
> +	{0x3815, 0x01},
> +	{0x3816, 0x01},
> +	{0x3817, 0x01},
> +	{0x381f, 0x08},
> +	{0x3820, 0x88},
> +	{0x3821, 0x00},
> +	{0x3822, 0x14},
> +	{0x382e, 0xe6},
> +	{0x3c80, 0x00},
> +	{0x3c87, 0x01},
> +	{0x3c8c, 0x19},
> +	{0x3c8d, 0x1c},
> +	{0x3ca0, 0x00},
> +	{0x3ca1, 0x00},
> +	{0x3ca2, 0x00},
> +	{0x3ca3, 0x00},
> +	{0x3ca4, 0x50},
> +	{0x3ca5, 0x11},
> +	{0x3ca6, 0x01},
> +	{0x3ca7, 0x00},
> +	{0x3ca8, 0x00},
> +	{0x4008, 0x02},
> +	{0x4009, 0x0f},
> +	{0x400a, 0x01},
> +	{0x400b, 0x19},
> +	{0x4011, 0x21},
> +	{0x4017, 0x08},
> +	{0x4019, 0x04},
> +	{0x401a, 0x58},
> +	{0x4032, 0x1e},
> +	{0x4050, 0x02},
> +	{0x4051, 0x09},
> +	{0x405e, 0x00},
> +	{0x4066, 0x02},
> +	{0x4501, 0x00},
> +	{0x4502, 0x10},
> +	{0x4505, 0x00},
> +	{0x4800, 0x64},
> +	{0x481b, 0x3e},
> +	{0x481f, 0x30},
> +	{0x4825, 0x34},
> +	{0x4837, 0x0e},
> +	{0x484b, 0x01},
> +	{0x4883, 0x02},
> +	{0x5000, 0xff},
> +	{0x5001, 0x0f},
> +	{0x5045, 0x20},
> +	{0x5046, 0x20},
> +	{0x5047, 0xa4},
> +	{0x5048, 0x20},
> +	{0x5049, 0xa4},
> +	{0x0100, 0x01},
> +};
> +
> +static const struct ov13b10_reg mode_4208x3120_regs[] = {
> +	{0x0305, 0xaf},
> +	{0x3501, 0x0c},
> +	{0x3662, 0x92},
> +	{0x3714, 0x24},
> +	{0x3739, 0x12},
> +	{0x37c2, 0x04},
> +	{0x37d9, 0x0c},
> +	{0x37e2, 0x0a},
> +	{0x3800, 0x00},
> +	{0x3801, 0x00},
> +	{0x3802, 0x00},
> +	{0x3803, 0x08},
> +	{0x3804, 0x10},
> +	{0x3805, 0x8f},
> +	{0x3806, 0x0c},
> +	{0x3807, 0x47},
> +	{0x3808, 0x10},
> +	{0x3809, 0x70},
> +	{0x380a, 0x0c},
> +	{0x380b, 0x30},
> +	{0x380c, 0x04},
> +	{0x380d, 0x98},
> +	{0x380e, 0x0c},
> +	{0x380f, 0x7c},
> +	{0x3810, 0x00},
> +	{0x3811, 0x0f},
> +	{0x3812, 0x00},
> +	{0x3813, 0x09},
> +	{0x3814, 0x01},
> +	{0x3816, 0x01},
> +	{0x3820, 0x88},
> +	{0x3c8c, 0x19},
> +	{0x4008, 0x02},
> +	{0x4009, 0x0f},
> +	{0x4050, 0x02},
> +	{0x4051, 0x09},
> +	{0x4501, 0x00},
> +	{0x4505, 0x00},
> +	{0x4837, 0x0e},
> +	{0x5000, 0xff},
> +	{0x5001, 0x0f},
> +};
> +
> +static const struct ov13b10_reg mode_4160x3120_regs[] = {
> +	{0x0305, 0xaf},
> +	{0x3501, 0x0c},
> +	{0x3662, 0x92},
> +	{0x3714, 0x24},
> +	{0x3739, 0x12},
> +	{0x37c2, 0x04},
> +	{0x37d9, 0x0c},
> +	{0x37e2, 0x0a},
> +	{0x3800, 0x00},
> +	{0x3801, 0x00},
> +	{0x3802, 0x00},
> +	{0x3803, 0x08},
> +	{0x3804, 0x10},
> +	{0x3805, 0x8f},
> +	{0x3806, 0x0c},
> +	{0x3807, 0x47},
> +	{0x3808, 0x10},
> +	{0x3809, 0x40},
> +	{0x380a, 0x0c},
> +	{0x380b, 0x30},
> +	{0x380c, 0x04},
> +	{0x380d, 0x98},
> +	{0x380e, 0x0c},
> +	{0x380f, 0x7c},
> +	{0x3810, 0x00},
> +	{0x3811, 0x27},
> +	{0x3812, 0x00},
> +	{0x3813, 0x09},
> +	{0x3814, 0x01},
> +	{0x3816, 0x01},
> +	{0x3820, 0x88},
> +	{0x3c8c, 0x19},
> +	{0x4008, 0x02},
> +	{0x4009, 0x0f},
> +	{0x4050, 0x02},
> +	{0x4051, 0x09},
> +	{0x4501, 0x00},
> +	{0x4505, 0x00},
> +	{0x4837, 0x0e},
> +	{0x5000, 0xff},
> +	{0x5001, 0x0f},
> +};
> +
> +static const struct ov13b10_reg mode_4160x2340_regs[] = {
> +	{0x0305, 0xaf},
> +	{0x3501, 0x0c},
> +	{0x3662, 0x92},
> +	{0x3714, 0x24},
> +	{0x3739, 0x12},
> +	{0x37c2, 0x04},
> +	{0x37d9, 0x0c},
> +	{0x37e2, 0x0a},
> +	{0x3800, 0x00},
> +	{0x3801, 0x00},
> +	{0x3802, 0x00},
> +	{0x3803, 0x08},
> +	{0x3804, 0x10},
> +	{0x3805, 0x8f},
> +	{0x3806, 0x0c},
> +	{0x3807, 0x47},
> +	{0x3808, 0x10},
> +	{0x3809, 0x40},
> +	{0x380a, 0x09},
> +	{0x380b, 0x24},
> +	{0x380c, 0x04},
> +	{0x380d, 0x98},
> +	{0x380e, 0x0c},
> +	{0x380f, 0x7c},
> +	{0x3810, 0x00},
> +	{0x3811, 0x27},
> +	{0x3812, 0x01},
> +	{0x3813, 0x8f},
> +	{0x3814, 0x01},
> +	{0x3816, 0x01},
> +	{0x3820, 0x88},
> +	{0x3c8c, 0x19},
> +	{0x4008, 0x02},
> +	{0x4009, 0x0f},
> +	{0x4050, 0x02},
> +	{0x4051, 0x09},
> +	{0x4501, 0x00},
> +	{0x4505, 0x00},
> +	{0x4837, 0x0e},
> +	{0x5000, 0xff},
> +	{0x5001, 0x0f},
> +};
> +
> +static const struct ov13b10_reg mode_2104x1560_regs[] = {
> +	{0x0305, 0xaf},
> +	{0x3501, 0x06},
> +	{0x3662, 0x88},
> +	{0x3714, 0x28},
> +	{0x3739, 0x10},
> +	{0x37c2, 0x14},
> +	{0x37d9, 0x06},
> +	{0x37e2, 0x0c},
> +	{0x3800, 0x00},
> +	{0x3801, 0x00},
> +	{0x3802, 0x00},
> +	{0x3803, 0x08},
> +	{0x3804, 0x10},
> +	{0x3805, 0x8f},
> +	{0x3806, 0x0c},
> +	{0x3807, 0x47},
> +	{0x3808, 0x08},
> +	{0x3809, 0x38},
> +	{0x380a, 0x06},
> +	{0x380b, 0x18},
> +	{0x380c, 0x04},
> +	{0x380d, 0x98},
> +	{0x380e, 0x06},
> +	{0x380f, 0x3e},
> +	{0x3810, 0x00},
> +	{0x3811, 0x07},
> +	{0x3812, 0x00},
> +	{0x3813, 0x05},
> +	{0x3814, 0x03},
> +	{0x3816, 0x03},
> +	{0x3820, 0x8b},
> +	{0x3c8c, 0x18},
> +	{0x4008, 0x00},
> +	{0x4009, 0x05},
> +	{0x4050, 0x00},
> +	{0x4051, 0x05},
> +	{0x4501, 0x08},
> +	{0x4505, 0x00},
> +	{0x4837, 0x0e},
> +	{0x5000, 0xfd},
> +	{0x5001, 0x0d},
> +};
> +
> +static const struct ov13b10_reg mode_2080x1170_regs[] = {
> +	{0x0305, 0xaf},
> +	{0x3501, 0x06},
> +	{0x3662, 0x88},
> +	{0x3714, 0x28},
> +	{0x3739, 0x10},
> +	{0x37c2, 0x14},
> +	{0x37d9, 0x06},
> +	{0x37e2, 0x0c},
> +	{0x3800, 0x00},
> +	{0x3801, 0x00},
> +	{0x3802, 0x00},
> +	{0x3803, 0x08},
> +	{0x3804, 0x10},
> +	{0x3805, 0x8f},
> +	{0x3806, 0x0c},
> +	{0x3807, 0x47},
> +	{0x3808, 0x08},
> +	{0x3809, 0x20},
> +	{0x380a, 0x04},
> +	{0x380b, 0x92},
> +	{0x380c, 0x04},
> +	{0x380d, 0x98},
> +	{0x380e, 0x06},
> +	{0x380f, 0x3e},
> +	{0x3810, 0x00},
> +	{0x3811, 0x13},
> +	{0x3812, 0x00},
> +	{0x3813, 0xc9},
> +	{0x3814, 0x03},
> +	{0x3816, 0x03},
> +	{0x3820, 0x8b},
> +	{0x3c8c, 0x18},
> +	{0x4008, 0x00},
> +	{0x4009, 0x05},
> +	{0x4050, 0x00},
> +	{0x4051, 0x05},
> +	{0x4501, 0x08},
> +	{0x4505, 0x00},
> +	{0x4837, 0x0e},
> +	{0x5000, 0xfd},
> +	{0x5001, 0x0d},
> +};
> +
> +static const char * const ov13b10_test_pattern_menu[] = {
> +	"Disabled",
> +	"Vertical Color Bar Type 1",
> +	"Vertical Color Bar Type 2",
> +	"Vertical Color Bar Type 3",
> +	"Vertical Color Bar Type 4"
> +};
> +
> +/* Configurations for supported link frequencies */
> +#define OV13B10_NUM_OF_LINK_FREQS	1
> +#define OV13B10_LINK_FREQ_560MHZ	560000000ULL
> +#define OV13B10_LINK_FREQ_INDEX_0	0
> +
> +/*
> + * pixel_rate = link_freq * data-rate * nr_of_lanes / bits_per_sample
> + * data rate => double data rate; number of lanes => 4; bits per pixel => 10
> + */
> +static u64 link_freq_to_pixel_rate(u64 f)
> +{
> +	f *= 2 * 4;
> +	do_div(f, 10);
> +
> +	return f;
> +}
> +
> +/* Menu items for LINK_FREQ V4L2 control */
> +static const s64 link_freq_menu_items[OV13B10_NUM_OF_LINK_FREQS] = {
> +	OV13B10_LINK_FREQ_560MHZ
> +};
> +
> +/* Link frequency configs */
> +static const struct ov13b10_link_freq_config
> +			link_freq_configs[OV13B10_NUM_OF_LINK_FREQS] = {
> +	{
> +		.pixels_per_line = OV13B10_PPL_560MHZ,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mipi_data_rate_1120mbps),
> +			.regs = mipi_data_rate_1120mbps,
> +		}
> +	}
> +};
> +
> +/* Mode configs */
> +static const struct ov13b10_mode supported_modes[] = {
> +	{
> +		.width = 4208,
> +		.height = 3120,
> +		.vts_def = OV13B10_VTS_30FPS,
> +		.vts_min = OV13B10_VTS_30FPS,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_4208x3120_regs),
> +			.regs = mode_4208x3120_regs,
> +		},
> +		.link_freq_index = OV13B10_LINK_FREQ_INDEX_0,
> +	},
> +	{
> +		.width = 4160,
> +		.height = 3120,
> +		.vts_def = OV13B10_VTS_30FPS,
> +		.vts_min = OV13B10_VTS_30FPS,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_4160x3120_regs),
> +			.regs = mode_4160x3120_regs,
> +		},
> +		.link_freq_index = OV13B10_LINK_FREQ_INDEX_0,
> +	},
> +	{
> +		.width = 4160,
> +		.height = 2340,
> +		.vts_def = OV13B10_VTS_30FPS,
> +		.vts_min = OV13B10_VTS_30FPS,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_4160x2340_regs),
> +			.regs = mode_4160x2340_regs,
> +		},
> +		.link_freq_index = OV13B10_LINK_FREQ_INDEX_0,
> +	},
> +	{
> +		.width = 2104,
> +		.height = 1560,
> +		.vts_def = OV13B10_VTS_60FPS,
> +		.vts_min = OV13B10_VTS_60FPS,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_2104x1560_regs),
> +			.regs = mode_2104x1560_regs,
> +		},
> +		.link_freq_index = OV13B10_LINK_FREQ_INDEX_0,
> +	},
> +		{
> +		.width = 2080,
> +		.height = 1170,
> +		.vts_def = OV13B10_VTS_60FPS,
> +		.vts_min = OV13B10_VTS_60FPS,
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_2080x1170_regs),
> +			.regs = mode_2080x1170_regs,
> +		},
> +		.link_freq_index = OV13B10_LINK_FREQ_INDEX_0,
> +	}
> +};
> +
> +struct ov13b10 {
> +	struct v4l2_subdev sd;
> +	struct media_pad pad;
> +
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	/* V4L2 Controls */
> +	struct v4l2_ctrl *link_freq;
> +	struct v4l2_ctrl *pixel_rate;
> +	struct v4l2_ctrl *vblank;
> +	struct v4l2_ctrl *hblank;
> +	struct v4l2_ctrl *exposure;
> +
> +	/* Current mode */
> +	const struct ov13b10_mode *cur_mode;
> +
> +	/* Mutex for serialized access */
> +	struct mutex mutex;
> +
> +	/* Streaming on/off */
> +	bool streaming;
> +};
> +
> +#define to_ov13b10(_sd)	container_of(_sd, struct ov13b10, sd)
> +
> +/* Read registers up to 4 at a time */
> +static int ov13b10_read_reg(struct ov13b10 *ov13b,
> +			    u16 reg, u32 len, u32 *val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov13b->sd);
> +	struct i2c_msg msgs[2];
> +	u8 *data_be_p;
> +	int ret;
> +	__be32 data_be = 0;
> +	__be16 reg_addr_be = cpu_to_be16(reg);
> +
> +	if (len > 4)
> +		return -EINVAL;
> +
> +	data_be_p = (u8 *)&data_be;
> +	/* Write register address */
> +	msgs[0].addr = client->addr;
> +	msgs[0].flags = 0;
> +	msgs[0].len = 2;
> +	msgs[0].buf = (u8 *)&reg_addr_be;
> +
> +	/* Read data from register */
> +	msgs[1].addr = client->addr;
> +	msgs[1].flags = I2C_M_RD;
> +	msgs[1].len = len;
> +	msgs[1].buf = &data_be_p[4 - len];
> +
> +	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> +	if (ret != ARRAY_SIZE(msgs))
> +		return -EIO;
> +
> +	*val = be32_to_cpu(data_be);
> +
> +	return 0;
> +}
> +
> +/* Write registers up to 4 at a time */
> +static int ov13b10_write_reg(struct ov13b10 *ov13b,
> +			     u16 reg, u32 len, u32 __val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov13b->sd);
> +	int buf_i, val_i;
> +	u8 buf[6], *val_p;
> +	__be32 val;
> +
> +	if (len > 4)
> +		return -EINVAL;
> +
> +	buf[0] = reg >> 8;
> +	buf[1] = reg & 0xff;
> +
> +	val = cpu_to_be32(__val);
> +	val_p = (u8 *)&val;
> +	buf_i = 2;
> +	val_i = 4 - len;
> +
> +	while (val_i < 4)
> +		buf[buf_i++] = val_p[val_i++];
> +
> +	if (i2c_master_send(client, buf, len + 2) != len + 2)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +/* Write a list of registers */
> +static int ov13b10_write_regs(struct ov13b10 *ov13b,
> +			      const struct ov13b10_reg *regs, u32 len)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov13b->sd);
> +	int ret;
> +	u32 i;
> +
> +	for (i = 0; i < len; i++) {
> +		ret = ov13b10_write_reg(ov13b, regs[i].address, 1,
> +					regs[i].val);
> +		if (ret) {
> +			dev_err_ratelimited(
> +				&client->dev,
> +				"Failed to write reg 0x%4.4x. error = %d\n",
> +				regs[i].address, ret);
> +
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int ov13b10_write_reg_list(struct ov13b10 *ov13b,
> +				  const struct ov13b10_reg_list *r_list)
> +{
> +	return ov13b10_write_regs(ov13b, r_list->regs, r_list->num_of_regs);
> +}
> +
> +/* Open sub-device */
> +static int ov13b10_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> +{
> +	struct ov13b10 *ov13b = to_ov13b10(sd);
> +	struct v4l2_mbus_framefmt *try_fmt = v4l2_subdev_get_try_format(sd,
> +									fh->state,
> +									0);
> +
> +	mutex_lock(&ov13b->mutex);
> +
> +	/* Initialize try_fmt */
> +	try_fmt->width = ov13b->cur_mode->width;
> +	try_fmt->height = ov13b->cur_mode->height;

These should be the defaults for the driver, not reflect the current
configuration (apart from the pixel order at least).

Does v/hflip change the pixel order with this driver btw.?

> +	try_fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +	try_fmt->field = V4L2_FIELD_NONE;
> +
> +	/* No crop or compose */
> +	mutex_unlock(&ov13b->mutex);
> +
> +	return 0;
> +}
> +
> +static int ov13b10_update_digital_gain(struct ov13b10 *ov13b, u32 d_gain)
> +{
> +	int ret;
> +	u32 val;
> +
> +	/*
> +	 * 0x350C[7:6], 0x350B[7:0], 0x350A[1:0]
> +	 */
> +
> +	val = (d_gain & OV13B10_DGTL_GAIN_L_MASK) << OV13B10_DGTL_GAIN_L_SHIFT;
> +	ret = ov13b10_write_reg(ov13b, OV13B10_REG_DGTL_GAIN_L,
> +				OV13B10_REG_VALUE_08BIT, val);
> +	if (ret)
> +		return ret;
> +
> +	val = (d_gain >> OV13B10_DGTL_GAIN_M_SHIFT) & OV13B10_DGTL_GAIN_M_MASK;
> +	ret = ov13b10_write_reg(ov13b, OV13B10_REG_DGTL_GAIN_M,
> +				OV13B10_REG_VALUE_08BIT, val);
> +	if (ret)
> +		return ret;
> +
> +	val = (d_gain >> OV13B10_DGTL_GAIN_H_SHIFT) & OV13B10_DGTL_GAIN_H_MASK;
> +	ret = ov13b10_write_reg(ov13b, OV13B10_REG_DGTL_GAIN_H,
> +				OV13B10_REG_VALUE_08BIT, val);
> +
> +	return ret;
> +}
> +
> +static int ov13b10_enable_test_pattern(struct ov13b10 *ov13b, u32 pattern)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = ov13b10_read_reg(ov13b, OV13B10_REG_TEST_PATTERN,
> +			       OV13B10_REG_VALUE_08BIT, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (pattern) {
> +		val &= OV13B10_TEST_PATTERN_MASK;
> +		val |= ((pattern - 1) << OV13B10_TEST_PATTERN_BAR_SHIFT) |
> +		     OV13B10_TEST_PATTERN_ENABLE;
> +	} else {
> +		val &= ~OV13B10_TEST_PATTERN_ENABLE;
> +	}
> +
> +	return ov13b10_write_reg(ov13b, OV13B10_REG_TEST_PATTERN,
> +				 OV13B10_REG_VALUE_08BIT, val);
> +}
> +
> +static int ov13b10_set_ctrl_hflip(struct ov13b10 *ov13b, u32 ctrl_val)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = ov13b10_read_reg(ov13b, OV13B10_REG_FORMAT1,
> +			       OV13B10_REG_VALUE_08BIT, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = ov13b10_write_reg(ov13b, OV13B10_REG_FORMAT1,
> +				OV13B10_REG_VALUE_08BIT,
> +				ctrl_val ? val & ~BIT(3) : val);
> +
> +	if (ret)
> +		return ret;
> +
> +	ret = ov13b10_read_reg(ov13b, OV13B10_REG_H_WIN_OFFSET,
> +			       OV13B10_REG_VALUE_08BIT, &val);
> +	if (ret)
> +		return ret;
> +
> +	return ov13b10_write_reg(ov13b, OV13B10_REG_H_WIN_OFFSET,
> +				 OV13B10_REG_VALUE_08BIT,
> +				 ctrl_val ? ++val : val);
> +}
> +
> +static int ov13b10_set_ctrl_vflip(struct ov13b10 *ov13b, u32 ctrl_val)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = ov13b10_read_reg(ov13b, OV13B10_REG_FORMAT1,
> +			       OV13B10_REG_VALUE_08BIT, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = ov13b10_write_reg(ov13b, OV13B10_REG_FORMAT1,
> +				OV13B10_REG_VALUE_08BIT,
> +				ctrl_val ? val | BIT(4) | BIT(5)  : val);
> +
> +	if (ret)
> +		return ret;
> +
> +	ret = ov13b10_read_reg(ov13b, OV13B10_REG_V_WIN_OFFSET,
> +			       OV13B10_REG_VALUE_08BIT, &val);
> +	if (ret)
> +		return ret;
> +
> +	return ov13b10_write_reg(ov13b, OV13B10_REG_V_WIN_OFFSET,
> +				 OV13B10_REG_VALUE_08BIT,
> +				 ctrl_val ? --val : val);
> +}
> +
> +static int ov13b10_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct ov13b10 *ov13b = container_of(ctrl->handler,
> +					     struct ov13b10, ctrl_handler);
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov13b->sd);
> +	s64 max;
> +	int ret;
> +
> +	/* Propagate change of current control to all related controls */
> +	switch (ctrl->id) {
> +	case V4L2_CID_VBLANK:
> +		/* Update max exposure while meeting expected vblanking */
> +		max = ov13b->cur_mode->height + ctrl->val - 8;
> +		__v4l2_ctrl_modify_range(ov13b->exposure,
> +					 ov13b->exposure->minimum,
> +					 max, ov13b->exposure->step, max);
> +		break;
> +	}
> +
> +	/*
> +	 * Applying V4L2 control value only happens
> +	 * when power is up for streaming
> +	 */
> +	if (!pm_runtime_get_if_in_use(&client->dev))
> +		return 0;
> +
> +	ret = 0;
> +	switch (ctrl->id) {
> +	case V4L2_CID_ANALOGUE_GAIN:
> +		ret = ov13b10_write_reg(ov13b, OV13B10_REG_ANALOG_GAIN,
> +					OV13B10_REG_VALUE_16BIT,
> +					ctrl->val << 1);
> +		break;
> +	case V4L2_CID_DIGITAL_GAIN:
> +		ret = ov13b10_update_digital_gain(ov13b, ctrl->val);
> +		break;
> +	case V4L2_CID_EXPOSURE:
> +		ret = ov13b10_write_reg(ov13b, OV13B10_REG_EXPOSURE,
> +					OV13B10_REG_VALUE_24BIT,
> +					ctrl->val);
> +		break;
> +	case V4L2_CID_VBLANK:
> +		ret = ov13b10_write_reg(ov13b, OV13B10_REG_VTS,
> +					OV13B10_REG_VALUE_16BIT,
> +					ov13b->cur_mode->height
> +					  + ctrl->val);

Fits on previous line.

> +		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = ov13b10_enable_test_pattern(ov13b, ctrl->val);
> +		break;
> +	case V4L2_CID_HFLIP:
> +		ov13b10_set_ctrl_hflip(ov13b, ctrl->val);
> +		break;
> +	case V4L2_CID_VFLIP:
> +		ov13b10_set_ctrl_vflip(ov13b, ctrl->val);
> +		break;
> +	default:
> +		dev_info(&client->dev,
> +			 "ctrl(id:0x%x,val:0x%x) is not handled\n",
> +			 ctrl->id, ctrl->val);
> +		break;
> +	}
> +
> +	pm_runtime_put(&client->dev);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_ctrl_ops ov13b10_ctrl_ops = {
> +	.s_ctrl = ov13b10_set_ctrl,
> +};
> +
> +static int ov13b10_enum_mbus_code(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	/* Only one bayer order(GRBG) is supported */
> +	if (code->index > 0)
> +		return -EINVAL;
> +
> +	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +
> +	return 0;
> +}
> +
> +static int ov13b10_enum_frame_size(struct v4l2_subdev *sd,
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
> +static void ov13b10_update_pad_format(const struct ov13b10_mode *mode,
> +				      struct v4l2_subdev_format *fmt)
> +{
> +	fmt->format.width = mode->width;
> +	fmt->format.height = mode->height;
> +	fmt->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +	fmt->format.field = V4L2_FIELD_NONE;
> +}
> +
> +static int ov13b10_do_get_pad_format(struct ov13b10 *ov13b,
> +				     struct v4l2_subdev_state *sd_state,
> +				     struct v4l2_subdev_format *fmt)
> +{
> +	struct v4l2_mbus_framefmt *framefmt;
> +	struct v4l2_subdev *sd = &ov13b->sd;
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
> +		fmt->format = *framefmt;
> +	} else {
> +		ov13b10_update_pad_format(ov13b->cur_mode, fmt);
> +	}
> +
> +	return 0;
> +}
> +
> +static int ov13b10_get_pad_format(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *sd_state,
> +				  struct v4l2_subdev_format *fmt)
> +{
> +	struct ov13b10 *ov13b = to_ov13b10(sd);
> +	int ret;
> +
> +	mutex_lock(&ov13b->mutex);
> +	ret = ov13b10_do_get_pad_format(ov13b, sd_state, fmt);
> +	mutex_unlock(&ov13b->mutex);
> +
> +	return ret;
> +}
> +
> +static int
> +ov13b10_set_pad_format(struct v4l2_subdev *sd,
> +		       struct v4l2_subdev_state *sd_state,
> +		       struct v4l2_subdev_format *fmt)
> +{
> +	struct ov13b10 *ov13b = to_ov13b10(sd);
> +	const struct ov13b10_mode *mode;
> +	struct v4l2_mbus_framefmt *framefmt;
> +	s32 vblank_def;
> +	s32 vblank_min;
> +	s64 h_blank;
> +	s64 pixel_rate;
> +	s64 link_freq;
> +
> +	mutex_lock(&ov13b->mutex);
> +
> +	/* Only one raw bayer(GRBG) order is supported */
> +	if (fmt->format.code != MEDIA_BUS_FMT_SGRBG10_1X10)
> +		fmt->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
> +
> +	mode = v4l2_find_nearest_size(supported_modes,
> +				      ARRAY_SIZE(supported_modes),
> +				      width, height,
> +				      fmt->format.width, fmt->format.height);
> +	ov13b10_update_pad_format(mode, fmt);
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
> +		*framefmt = fmt->format;
> +	} else {
> +		ov13b->cur_mode = mode;
> +		__v4l2_ctrl_s_ctrl(ov13b->link_freq, mode->link_freq_index);
> +		link_freq = link_freq_menu_items[mode->link_freq_index];
> +		pixel_rate = link_freq_to_pixel_rate(link_freq);
> +		__v4l2_ctrl_s_ctrl_int64(ov13b->pixel_rate, pixel_rate);
> +
> +		/* Update limits and set FPS to default */
> +		vblank_def = ov13b->cur_mode->vts_def -
> +			     ov13b->cur_mode->height;
> +		vblank_min = ov13b->cur_mode->vts_min -
> +			     ov13b->cur_mode->height;
> +		__v4l2_ctrl_modify_range(

Could you still run this through scripts/checkpatch.pl? In particular,
lines shouldn't end in an opening parenthesis.

There are also lines over 80 chars for no apparent reason.

> +			ov13b->vblank, vblank_min,
> +			OV13B10_VTS_MAX - ov13b->cur_mode->height, 1,
> +			vblank_def);
> +		__v4l2_ctrl_s_ctrl(ov13b->vblank, vblank_def);
> +		h_blank =
> +			link_freq_configs[mode->link_freq_index].pixels_per_line
> +			 - ov13b->cur_mode->width;
> +		__v4l2_ctrl_modify_range(ov13b->hblank, h_blank,
> +					 h_blank, 1, h_blank);
> +	}
> +
> +	mutex_unlock(&ov13b->mutex);
> +
> +	return 0;
> +}
> +
> +static int ov13b10_start_streaming(struct ov13b10 *ov13b)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov13b->sd);
> +	const struct ov13b10_reg_list *reg_list;
> +	int ret, link_freq_index;
> +
> +	/* Get out of from software reset */
> +	ret = ov13b10_write_reg(ov13b, OV13B10_REG_SOFTWARE_RST,
> +				OV13B10_REG_VALUE_08BIT, OV13B10_SOFTWARE_RST);
> +	if (ret) {
> +		dev_err(&client->dev, "%s failed to set powerup registers\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	link_freq_index = ov13b->cur_mode->link_freq_index;
> +	reg_list = &link_freq_configs[link_freq_index].reg_list;
> +	ret = ov13b10_write_reg_list(ov13b, reg_list);
> +	if (ret) {
> +		dev_err(&client->dev, "%s failed to set plls\n", __func__);
> +		return ret;
> +	}
> +
> +	/* Apply default values of current mode */
> +	reg_list = &ov13b->cur_mode->reg_list;
> +	ret = ov13b10_write_reg_list(ov13b, reg_list);
> +	if (ret) {
> +		dev_err(&client->dev, "%s failed to set mode\n", __func__);
> +		return ret;
> +	}
> +
> +	/* Apply customized values from user */
> +	ret =  __v4l2_ctrl_handler_setup(ov13b->sd.ctrl_handler);
> +	if (ret)
> +		return ret;
> +
> +	return ov13b10_write_reg(ov13b, OV13B10_REG_MODE_SELECT,
> +				 OV13B10_REG_VALUE_08BIT,
> +				 OV13B10_MODE_STREAMING);
> +}
> +
> +/* Stop streaming */
> +static int ov13b10_stop_streaming(struct ov13b10 *ov13b)
> +{
> +	return ov13b10_write_reg(ov13b, OV13B10_REG_MODE_SELECT,
> +				 OV13B10_REG_VALUE_08BIT, OV13B10_MODE_STANDBY);
> +}
> +
> +static int ov13b10_set_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	struct ov13b10 *ov13b = to_ov13b10(sd);
> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +	int ret = 0;
> +
> +	mutex_lock(&ov13b->mutex);
> +	if (ov13b->streaming == enable) {
> +		mutex_unlock(&ov13b->mutex);
> +		return 0;
> +	}
> +
> +	if (enable) {
> +		ret = pm_runtime_resume_and_get(&client->dev);
> +		if (ret < 0)
> +			goto err_unlock;
> +
> +		/*
> +		 * Apply default & customized values
> +		 * and then start streaming.
> +		 */
> +		ret = ov13b10_start_streaming(ov13b);
> +		if (ret)
> +			goto err_rpm_put;
> +	} else {
> +		ov13b10_stop_streaming(ov13b);
> +		pm_runtime_put(&client->dev);
> +	}
> +
> +	ov13b->streaming = enable;
> +	mutex_unlock(&ov13b->mutex);
> +
> +	return ret;
> +
> +err_rpm_put:
> +	pm_runtime_put(&client->dev);
> +err_unlock:
> +	mutex_unlock(&ov13b->mutex);
> +
> +	return ret;
> +}
> +
> +static int __maybe_unused ov13b10_suspend(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov13b10 *ov13b = to_ov13b10(sd);
> +
> +	if (ov13b->streaming)
> +		ov13b10_stop_streaming(ov13b);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused ov13b10_resume(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov13b10 *ov13b = to_ov13b10(sd);
> +	int ret;
> +
> +	if (ov13b->streaming) {
> +		ret = ov13b10_start_streaming(ov13b);
> +		if (ret)
> +			goto error;
> +	}
> +
> +	return 0;
> +
> +error:
> +	ov13b10_stop_streaming(ov13b);
> +	ov13b->streaming = false;
> +	return ret;
> +}
> +
> +/* Verify chip ID */
> +static int ov13b10_identify_module(struct ov13b10 *ov13b)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov13b->sd);
> +	int ret;
> +	u32 val;
> +
> +	ret = ov13b10_read_reg(ov13b, OV13B10_REG_CHIP_ID,
> +			       OV13B10_REG_VALUE_24BIT, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val != OV13B10_CHIP_ID) {
> +		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
> +			OV13B10_CHIP_ID, val);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_video_ops ov13b10_video_ops = {
> +	.s_stream = ov13b10_set_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops ov13b10_pad_ops = {
> +	.enum_mbus_code = ov13b10_enum_mbus_code,
> +	.get_fmt = ov13b10_get_pad_format,
> +	.set_fmt = ov13b10_set_pad_format,
> +	.enum_frame_size = ov13b10_enum_frame_size,
> +};
> +
> +static const struct v4l2_subdev_ops ov13b10_subdev_ops = {
> +	.video = &ov13b10_video_ops,
> +	.pad = &ov13b10_pad_ops,
> +};
> +
> +static const struct media_entity_operations ov13b10_subdev_entity_ops = {
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
> +static const struct v4l2_subdev_internal_ops ov13b10_internal_ops = {
> +	.open = ov13b10_open,
> +};
> +
> +/* Initialize control handlers */
> +static int ov13b10_init_controls(struct ov13b10 *ov13b)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov13b->sd);
> +	struct v4l2_fwnode_device_properties props;
> +	struct v4l2_ctrl_handler *ctrl_hdlr;
> +	s64 exposure_max;
> +	s64 vblank_def;
> +	s64 vblank_min;
> +	s64 hblank;
> +	s64 pixel_rate_min;
> +	s64 pixel_rate_max;
> +	const struct ov13b10_mode *mode;
> +	int ret;
> +
> +	ctrl_hdlr = &ov13b->ctrl_handler;
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
> +	if (ret)
> +		return ret;
> +
> +	mutex_init(&ov13b->mutex);
> +	ctrl_hdlr->lock = &ov13b->mutex;
> +	ov13b->link_freq = v4l2_ctrl_new_int_menu(
> +				ctrl_hdlr,
> +				&ov13b10_ctrl_ops,
> +				V4L2_CID_LINK_FREQ,
> +				OV13B10_NUM_OF_LINK_FREQS - 1,
> +				0,
> +				link_freq_menu_items);
> +	if (ov13b->link_freq)
> +		ov13b->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	pixel_rate_max = link_freq_to_pixel_rate(link_freq_menu_items[0]);
> +	pixel_rate_min = 0;
> +	/* By default, PIXEL_RATE is read only */
> +	ov13b->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov13b10_ctrl_ops,
> +					      V4L2_CID_PIXEL_RATE,
> +					      pixel_rate_min, pixel_rate_max,
> +					      1, pixel_rate_max);
> +
> +	mode = ov13b->cur_mode;
> +	vblank_def = mode->vts_def - mode->height;
> +	vblank_min = mode->vts_min - mode->height;
> +	ov13b->vblank = v4l2_ctrl_new_std(
> +				ctrl_hdlr, &ov13b10_ctrl_ops, V4L2_CID_VBLANK,
> +				vblank_min, OV13B10_VTS_MAX - mode->height, 1,
> +				vblank_def);
> +
> +	hblank = link_freq_configs[mode->link_freq_index].pixels_per_line -
> +		 mode->width;
> +	ov13b->hblank = v4l2_ctrl_new_std(
> +				ctrl_hdlr, &ov13b10_ctrl_ops, V4L2_CID_HBLANK,
> +				hblank, hblank, 1, hblank);
> +	if (ov13b->hblank)
> +		ov13b->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	exposure_max = mode->vts_def - 8;
> +	ov13b->exposure = v4l2_ctrl_new_std(
> +				ctrl_hdlr, &ov13b10_ctrl_ops,
> +				V4L2_CID_EXPOSURE, OV13B10_EXPOSURE_MIN,
> +				exposure_max, OV13B10_EXPOSURE_STEP,
> +				exposure_max);
> +
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov13b10_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> +			  OV13B10_ANA_GAIN_MIN, OV13B10_ANA_GAIN_MAX,
> +			  OV13B10_ANA_GAIN_STEP, OV13B10_ANA_GAIN_DEFAULT);
> +
> +	/* Digital gain */
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov13b10_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
> +			  OV13B10_DGTL_GAIN_MIN, OV13B10_DGTL_GAIN_MAX,
> +			  OV13B10_DGTL_GAIN_STEP, OV13B10_DGTL_GAIN_DEFAULT);
> +
> +	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov13b10_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(ov13b10_test_pattern_menu) - 1,
> +				     0, 0, ov13b10_test_pattern_menu);
> +
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov13b10_ctrl_ops,
> +			  V4L2_CID_HFLIP, 0, 1, 1, 0);
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov13b10_ctrl_ops,
> +			  V4L2_CID_VFLIP, 0, 1, 1, 0);
> +
> +	if (ctrl_hdlr->error) {
> +		ret = ctrl_hdlr->error;
> +		dev_err(&client->dev, "%s control init failed (%d)\n",
> +			__func__, ret);
> +		goto error;
> +	}
> +
> +	ret = v4l2_fwnode_device_parse(&client->dev, &props);
> +	if (ret)
> +		goto error;
> +
> +	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov13b10_ctrl_ops,
> +					      &props);
> +	if (ret)
> +		goto error;
> +
> +	ov13b->sd.ctrl_handler = ctrl_hdlr;
> +
> +	return 0;
> +
> +error:
> +	v4l2_ctrl_handler_free(ctrl_hdlr);
> +	mutex_destroy(&ov13b->mutex);
> +
> +	return ret;
> +}
> +
> +static void ov13b10_free_controls(struct ov13b10 *ov13b)
> +{
> +	v4l2_ctrl_handler_free(ov13b->sd.ctrl_handler);
> +	mutex_destroy(&ov13b->mutex);
> +}
> +
> +static int ov13b10_probe(struct i2c_client *client)
> +{
> +	struct ov13b10 *ov13b;
> +	int ret;
> +	u32 val = 0;
> +
> +	device_property_read_u32(&client->dev, "clock-frequency", &val);
> +	if (val != 19200000)
> +		return -EINVAL;
> +
> +	ov13b = devm_kzalloc(&client->dev, sizeof(*ov13b), GFP_KERNEL);
> +	if (!ov13b)
> +		return -ENOMEM;
> +
> +	/* Initialize subdev */
> +	v4l2_i2c_subdev_init(&ov13b->sd, client, &ov13b10_subdev_ops);
> +
> +	/* Check module identity */
> +	ret = ov13b10_identify_module(ov13b);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to find sensor: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Set default mode to max resolution */
> +	ov13b->cur_mode = &supported_modes[0];
> +
> +	ret = ov13b10_init_controls(ov13b);
> +	if (ret)
> +		return ret;
> +
> +	/* Initialize subdev */
> +	ov13b->sd.internal_ops = &ov13b10_internal_ops;
> +	ov13b->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	ov13b->sd.entity.ops = &ov13b10_subdev_entity_ops;
> +	ov13b->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +	/* Initialize source pad */
> +	ov13b->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&ov13b->sd.entity, 1, &ov13b->pad);
> +	if (ret) {
> +		dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
> +		goto error_handler_free;
> +	}
> +
> +	ret = v4l2_async_register_subdev_sensor(&ov13b->sd);
> +	if (ret < 0)
> +		goto error_media_entity;
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
> +error_media_entity:
> +	media_entity_cleanup(&ov13b->sd.entity);
> +
> +error_handler_free:
> +	ov13b10_free_controls(ov13b);
> +	dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
> +
> +	return ret;
> +}
> +
> +static int ov13b10_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov13b10 *ov13b = to_ov13b10(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	media_entity_cleanup(&sd->entity);
> +	ov13b10_free_controls(ov13b);
> +
> +	pm_runtime_disable(&client->dev);
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id ov13b10_id_table[] = {
> +	{"ov13b10", 0},
> +	{},
> +};

You can drop this table.

> +
> +MODULE_DEVICE_TABLE(i2c, ov13b10_id_table);
> +
> +static const struct dev_pm_ops ov13b10_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(ov13b10_suspend, ov13b10_resume)
> +};
> +
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id ov13b10_acpi_ids[] = {
> +	{"OVTIDB10"},
> +	{ /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(acpi, ov13b10_acpi_ids);
> +#endif
> +
> +static struct i2c_driver ov13b10_i2c_driver = {
> +	.driver = {
> +		.name = "ov13b10",
> +		.pm = &ov13b10_pm_ops,
> +		.acpi_match_table = ACPI_PTR(ov13b10_acpi_ids),
> +	},
> +	.probe_new = ov13b10_probe,
> +	.remove = ov13b10_remove,
> +	.id_table = ov13b10_id_table,
> +};
> +
> +module_i2c_driver(ov13b10_i2c_driver);
> +
> +MODULE_AUTHOR("Kao, Arec <arec.kao@intel.com>");
> +MODULE_DESCRIPTION("Omnivision ov13b10 sensor driver");
> +MODULE_LICENSE("GPL v2");

-- 
Kind regards,

Sakari Ailus
