Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCF0133AE42
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 10:14:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhCOJN1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 05:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhCOJN1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 05:13:27 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53829C061574;
        Mon, 15 Mar 2021 02:13:26 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id d139-20020a1c1d910000b029010b895cb6f2so18966090wmd.5;
        Mon, 15 Mar 2021 02:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=2fBGu/di+34VxPvWokpCtMeAXjdavQeecygaOUmdzyU=;
        b=H2Tji7ifDfP9W4lu8Pv6wrjSPi+dEbPBqPCLT0g3037rqNc4AfcV/Xy3+cm9UfN2Ql
         l7/FDvu+98ZeHiKrzHFAxG3XS4zggKuxS5HEmrV5Y9MCkn8v3QSADjuM2shbJ7hcUdi0
         fRG/2QWKbprtey2N+cPXBQ8KRCZ68Vasoogrq+K4dj0ceKTIKIRn+VU1+qVWFymlHWu9
         q6Qd5qPrz7kV5vHHpXzYzA51WKiuAU5fZRFmZIEK3eHtzrRyeIfvdE9lRfNmwwcwBwbx
         HuP0hWFTCdjwQ6bTqn7InCLB0mVZz8f67bBIqc17ftk5pzoCrVQzBDCigrM3iGF8FrOg
         2gWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=2fBGu/di+34VxPvWokpCtMeAXjdavQeecygaOUmdzyU=;
        b=iP4fPv+V9jE78gAevqvPFp7Id66V/m+j5HVCf8JCeIjOxmigp8KSYjdFJOOk1yor4y
         5dC9umMkGWQ2Yz7+qjzHHQXNpmxrwhqb0uS3SkmEum6Dc8uG7uKATJctcTssIqllnHOi
         GUTijYlsjfaj2O6Lq14r8LHP3MUpyGwUG82fi7HBKVxjSu1VJ6FDGnNTAf7XB2Tpm5+d
         +bokTlWiaQ+HtpEhueX//iHSHvgQjSOT3MkEGr+HgdHxitRv6DnWt29OmxwZhRhwQVwv
         q6h+R94IU2eZdqNjpM9vzvCKSW0RCBdDIIkLxd+5y3f8AiSuHZcLJDsV7dfy1zCqqmOT
         waLg==
X-Gm-Message-State: AOAM533veFEA8VF7eSVkgNs8cn4gcMR5fCR/7WsinR1G1lsHXDgNCjaP
        xLkLzjp3i1NNCzopCH/Imoo=
X-Google-Smtp-Source: ABdhPJytLIHLLwwiwokOPGLYFCP5fRh3/CIfxSCmoD1B8jU4OjqJnfzXMCjRl9eZ/5HQeeJExrH5Ng==
X-Received: by 2002:a1c:f212:: with SMTP id s18mr25350186wmc.133.1615799604729;
        Mon, 15 Mar 2021 02:13:24 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.208.22])
        by smtp.gmail.com with ESMTPSA id k12sm18753929wrx.7.2021.03.15.02.13.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 02:13:23 -0700 (PDT)
Subject: Re: [PATCH 1/1] media: i2c: Add support for ov5693 sensor
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org, dongchun.zhu@mediatek.com,
        tian.shu.qiu@intel.com, luzmaximilian@gmail.com, me@fabwu.ch,
        jeanmichel.hautbois@ideasonboard.com, kitakar@gmail.com,
        jorhand@linux.microsoft.com
References: <20210312103239.279523-1-djrscally@gmail.com>
 <20210312103239.279523-2-djrscally@gmail.com>
 <YE6cSo/WvoRsu2vw@pendragon.ideasonboard.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <0e0349d7-6f0a-dae4-441b-60ea69338b0e@gmail.com>
Date:   Mon, 15 Mar 2021 09:13:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YE6cSo/WvoRsu2vw@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On 14/03/2021 23:29, Laurent Pinchart wrote:
> Hi Daniel,
>
> Thank you for the patch.
>
> On Fri, Mar 12, 2021 at 10:32:39AM +0000, Daniel Scally wrote:
>> The OV5693 is a 5 Mpx CMOS image sensor, connected via MIPI CSI-2. The
>> chip is capable of a single lane configuration, but currently only two
>> lanes are supported.
>>
>> Most of the sensor's features are supported, with the main exception
>> being the lens correction algorithm.
>>
>> The driver provides all mandatory, optional and recommended V4L2 controls
>> for maximum compatibility with libcamera.
>>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>>  MAINTAINERS                |    7 +
>>  drivers/media/i2c/Kconfig  |   11 +
>>  drivers/media/i2c/Makefile |    1 +
>>  drivers/media/i2c/ov5693.c | 1585 ++++++++++++++++++++++++++++++++++++
>>  4 files changed, 1604 insertions(+)
>>  create mode 100644 drivers/media/i2c/ov5693.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index cf44b3e77b90..34311d55b189 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -13140,6 +13140,13 @@ S:	Maintained
>>  T:	git git://linuxtv.org/media_tree.git
>>  F:	drivers/media/i2c/ov5675.c
>>  
>> +OMNIVISION OV5693 SENSOR DRIVER
>> +M:	Daniel Scally <djrscally@gmail.com>
>> +L:	linux-media@vger.kernel.org
>> +S:	Maintained
>> +T:	git git://linuxtv.org/media_tree.git
>> +F:	drivers/media/i2c/ov5693.c
>> +
>>  OMNIVISION OV5695 SENSOR DRIVER
>>  M:	Shunqian Zheng <zhengsq@rock-chips.com>
>>  L:	linux-media@vger.kernel.org
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index 4c1ae687ab10..4da2278ec84c 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -985,6 +985,17 @@ config VIDEO_OV5675
>>  	  To compile this driver as a module, choose M here: the
>>  	  module will be called ov5675.
>>  
>> +config VIDEO_OV5693
>> +	tristate "OmniVision OV5693 sensor support"
>> +	depends on I2C && VIDEO_V4L2
>> +	select V4L2_FWNODE
>> +	help
>> +	  This is a Video4Linux2 sensor driver for the OmniVision
>> +	  OV5693 camera.
>> +
>> +	  To compile this driver as a module, choose M here: the
>> +	  module will be called ov5693.
>> +
>>  config VIDEO_OV5695
>>  	tristate "OmniVision OV5695 sensor support"
>>  	depends on I2C && VIDEO_V4L2
>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>> index 65cfc94d25b6..7df680e110c9 100644
>> --- a/drivers/media/i2c/Makefile
>> +++ b/drivers/media/i2c/Makefile
>> @@ -75,6 +75,7 @@ obj-$(CONFIG_VIDEO_OV5647) += ov5647.o
>>  obj-$(CONFIG_VIDEO_OV5648) += ov5648.o
>>  obj-$(CONFIG_VIDEO_OV5670) += ov5670.o
>>  obj-$(CONFIG_VIDEO_OV5675) += ov5675.o
>> +obj-$(CONFIG_VIDEO_OV5693) += ov5693.o
>>  obj-$(CONFIG_VIDEO_OV5695) += ov5695.o
>>  obj-$(CONFIG_VIDEO_OV6650) += ov6650.o
>>  obj-$(CONFIG_VIDEO_OV7251) += ov7251.o
>> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
>> new file mode 100644
>> index 000000000000..0460371164ea
>> --- /dev/null
>> +++ b/drivers/media/i2c/ov5693.c
>> @@ -0,0 +1,1585 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
>> + *
>> + * Adapted from the atomisp-ov5693 driver, with contributions from:
>> + *
>> + * Daniel Scally
>> + * Jean-Michel Hautbois
>> + * Fabian Wuthrich
>> + * Tsuchiya Yuto
>> + * Jordan Hand
>> + * Jake Day
>> + */
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/device.h>
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/slab.h>
>> +#include <linux/types.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-fwnode.h>
>> +#include <media/v4l2-ctrls.h>
> You've nearly mastered the alphabetical order ;-)


Hah, only so long as it occurs to me to do so.


>
>> +
>> +/* System Control */
>> +#define OV5693_SW_RESET_REG			0x0103
>> +#define OV5693_SW_STREAM_REG			0x0100
>> +#define OV5693_START_STREAMING			0x01
>> +#define OV5693_STOP_STREAMING			0x00
>> +#define OV5693_SW_RESET				0x01
>> +
>> +#define OV5693_REG_CHIP_ID_H			0x300A
>> +#define OV5693_REG_CHIP_ID_L			0x300B
>> +/* Yes, this is right. The datasheet for the OV5693 gives its ID as 0x5690 */
>> +#define OV5693_CHIP_ID				0x5690
>> +
>> +/* Exposure */
>> +#define OV5693_EXPOSURE_L_CTRL_HH_REG		0x3500
>> +#define OV5693_EXPOSURE_L_CTRL_H_REG		0x3501
>> +#define OV5693_EXPOSURE_L_CTRL_L_REG		0x3502
>> +#define OV5693_EXPOSURE_S_CTRL_HH_REG		0x3506
>> +#define OV5693_EXPOSURE_S_CTRL_H_REG		0x3507
>> +#define OV5693_EXPOSURE_S_CTRL_L_REG		0x3508
>> +#define OV5693_EXPOSURE_CTRL_HH(v)		(((v) & GENMASK(14, 12)) >> 12)
>> +#define OV5693_EXPOSURE_CTRL_H(v)		(((v) & GENMASK(11, 4)) >> 4)
>> +#define OV5693_EXPOSURE_CTRL_L(v)		(((v) & GENMASK(3, 0)) << 4)
>> +#define OV5693_INTEGRATION_TIME_MARGIN		8
>> +#define OV5693_EXPOSURE_MIN			1
>> +#define OV5693_EXPOSURE_STEP			1
>> +
>> +/* Analogue Gain */
>> +#define OV5693_GAIN_CTRL_H_REG			0x350A
>> +#define OV5693_GAIN_CTRL_H(v)			(((v) >> 4) & GENMASK(2, 0))
>> +#define OV5693_GAIN_CTRL_L_REG			0x350B
>> +#define OV5693_GAIN_CTRL_L(v)			(((v) << 4) & GENMASK(7, 4))
>> +#define OV5693_GAIN_MIN				1
>> +#define OV5693_GAIN_MAX				127
>> +#define OV5693_GAIN_DEF				8
>> +#define OV5693_GAIN_STEP			1
>> +
>> +/* Digital Gain */
>> +#define OV5693_MWB_RED_GAIN_H_REG		0x3400
>> +#define OV5693_MWB_RED_GAIN_L_REG		0x3401
>> +#define OV5693_MWB_GREEN_GAIN_H_REG		0x3402
>> +#define OV5693_MWB_GREEN_GAIN_L_REG		0x3403
>> +#define OV5693_MWB_BLUE_GAIN_H_REG		0x3404
>> +#define OV5693_MWB_BLUE_GAIN_L_REG		0x3405
>> +#define OV5693_MWB_GAIN_H_CTRL(v)		(((v) >> 8) & GENMASK(3, 0))
>> +#define OV5693_MWB_GAIN_L_CTRL(v)		((v) & GENMASK(7, 0))
>> +#define OV5693_MWB_GAIN_MAX			0x0fff
>> +#define OV5693_DIGITAL_GAIN_MIN			1
>> +#define OV5693_DIGITAL_GAIN_MAX			4095
>> +#define OV5693_DIGITAL_GAIN_DEF			1024
>> +#define OV5693_DIGITAL_GAIN_STEP		1
>> +
>> +/* Timing and Format */
>> +#define OV5693_CROP_START_X_H_REG		0x3800
>> +#define OV5693_CROP_START_X_H(v)		(((v) & GENMASK(12, 8)) >> 8)
>> +#define OV5693_CROP_START_X_L_REG		0x3801
>> +#define OV5693_CROP_START_X_L(v)		((v) & GENMASK(7, 0))
>> +
>> +#define OV5693_CROP_START_Y_H_REG		0x3802
>> +#define OV5693_CROP_START_Y_H(v)		(((v) & GENMASK(11, 8)) >> 8)
>> +#define OV5693_CROP_START_Y_L_REG		0x3803
>> +#define OV5693_CROP_START_Y_L(v)		((v) & GENMASK(7, 0))
>> +
>> +#define OV5693_CROP_END_X_H_REG			0x3804
>> +#define OV5693_CROP_END_X_H(v)			(((v) & GENMASK(12, 8)) >> 8)
>> +#define OV5693_CROP_END_X_L_REG			0x3805
>> +#define OV5693_CROP_END_X_L(v)			((v) & GENMASK(7, 0))
>> +
>> +#define OV5693_CROP_END_Y_H_REG			0x3806
>> +#define OV5693_CROP_END_Y_H(v)			(((v) & GENMASK(11, 8)) >> 8)
>> +#define OV5693_CROP_END_Y_L_REG			0x3807
>> +#define OV5693_CROP_END_Y_L(v)			((v) & GENMASK(7, 0))
>> +
>> +#define OV5693_OUTPUT_SIZE_X_H_REG		0x3808
>> +#define OV5693_OUTPUT_SIZE_X_H(v)		(((v) & GENMASK(15, 8)) >> 8)
>> +#define OV5693_OUTPUT_SIZE_X_L_REG		0x3809
>> +#define OV5693_OUTPUT_SIZE_X_L(v)		((v) & GENMASK(7, 0))
>> +
>> +#define OV5693_OUTPUT_SIZE_Y_H_REG		0x380a
>> +#define OV5693_OUTPUT_SIZE_Y_H(v)		(((v) & GENMASK(15, 8)) >> 8)
>> +#define OV5693_OUTPUT_SIZE_Y_L_REG		0x380b
>> +#define OV5693_OUTPUT_SIZE_Y_L(v)		((v) & GENMASK(7, 0))
>> +
>> +#define OV5693_TIMING_HTS_H_REG			0x380c
>> +#define OV5693_TIMING_HTS_H(v)			(((v) & GENMASK(15, 8)) >> 8)
>> +#define OV5693_TIMING_HTS_L_REG			0x380d
>> +#define OV5693_TIMING_HTS_L(v)			((v) & GENMASK(7, 0))
>> +
>> +#define OV5693_TIMING_VTS_H_REG			0x380e
>> +#define OV5693_TIMING_VTS_H(v)			(((v) & GENMASK(15, 8)) >> 8)
>> +#define OV5693_TIMING_VTS_L_REG			0x380f
>> +#define OV5693_TIMING_VTS_L(v)			((v) & GENMASK(7, 0))
>> +#define OV5693_TIMING_MAX_VTS			0xffff
>> +#define OV5693_TIMING_MIN_VTS			0x04
>> +
>> +#define OV5693_OFFSET_START_X_H_REG		0x3810
>> +#define OV5693_OFFSET_START_X_H(v)		(((v) & GENMASK(15, 8)) >> 8)
>> +#define OV5693_OFFSET_START_X_L_REG		0x3811
>> +#define OV5693_OFFSET_START_X_L(v)		((v) & GENMASK(7, 0))
>> +
>> +#define OV5693_OFFSET_START_Y_H_REG		0x3812
>> +#define OV5693_OFFSET_START_Y_H(v)		(((v) & GENMASK(15, 8)) >> 8)
>> +#define OV5693_OFFSET_START_Y_L_REG		0x3813
>> +#define OV5693_OFFSET_START_Y_L(v)		((v) & GENMASK(7, 0))
>> +
>> +#define OV5693_SUB_INC_X_REG			0x3814
>> +#define OV5693_SUB_INC_Y_REG			0x3815
>> +
>> +#define OV5693_FORMAT1_REG			0x3820
>> +#define OV5693_FORMAT1_FLIP_VERT_ISP_EN		BIT(2)
>> +#define OV5693_FORMAT1_FLIP_VERT_SENSOR_EN	BIT(1)
>> +#define OV5693_FORMAT1_VBIN_EN			BIT(0)
>> +#define OV5693_FORMAT2_REG			0x3821
>> +#define OV5693_FORMAT2_HDR_EN			BIT(7)
>> +#define OV5693_FORMAT2_FLIP_HORZ_ISP_EN		BIT(2)
>> +#define OV5693_FORMAT2_FLIP_HORZ_SENSOR_EN	BIT(1)
>> +#define OV5693_FORMAT2_HBIN_EN			BIT(0)
>> +
>> +#define OV5693_ISP_CTRL2_REG			0x5002
>> +#define OV5693_ISP_SCALE_ENABLE			BIT(7)
>> +
>> +/* Pixel Array */
>> +#define OV5693_NATIVE_WIDTH			2624U
>> +#define OV5693_NATIVE_HEIGHT			1956U
>> +#define OV5693_ACTIVE_START_LEFT		16U
>> +#define OV5693_ACTIVE_START_TOP			6U
>> +#define OV5693_ACTIVE_WIDTH			2592U
>> +#define OV5693_ACTIVE_HEIGHT			1944U
>> +
>> +/* Test Pattern */
>> +#define OV5693_TEST_PATTERN_REG			0x5e00
>> +#define OV5693_TEST_PATTERN_ENABLE		BIT(7)
>> +#define OV5693_TEST_PATTERN_ROLLING		BIT(6)
>> +#define OV5693_TEST_PATTERN_RANDOM		0x01
>> +#define OV5693_TEST_PATTERN_BARS		0x00
>> +
>> +/* System Frequencies */
>> +#define OV5693_XVCLK_FREQ			19200000
>> +#define OV5693_LINK_FREQ_400MHZ			400000000
>> +#define OV5693_PIXEL_RATE			160000000
>> +
>> +/* Miscellaneous */
>> +#define OV5693_NUM_MBUS_FMTS			1
>> +#define OV5693_NUM_SUPPLIES			2
>> +
>> +#define to_ov5693_sensor(x) container_of(x, struct ov5693_device, sd)
>> +
>> +struct ov5693_reg {
>> +	u16 reg;
>> +	u8 val;
>> +};
>> +
>> +struct ov5693_reg_list {
>> +	u32 num_regs;
>> +	const struct ov5693_reg *regs;
>> +};
>> +
>> +struct ov5693_resolution {
>> +	char *desc;
>> +	int fps;
>> +
>> +	struct v4l2_rect crop;
>> +
>> +	unsigned int crop_start_x;
>> +	unsigned int offset_x;
>> +	unsigned int output_size_x;
>> +	unsigned int crop_end_x;
>> +	unsigned int hts;
>> +
>> +	unsigned int crop_start_y;
>> +	unsigned int offset_y;
>> +	unsigned int output_size_y;
>> +	unsigned int crop_end_y;
>> +	unsigned int vts;
>> +
>> +	unsigned int inc_x_odd;
>> +	unsigned int inc_x_even;
>> +	unsigned int inc_y_odd;
>> +	unsigned int inc_y_even;
>> +
>> +	bool binning_x;
>> +	bool binning_y;
>> +	bool scale_enable;
>> +};
>> +
>> +struct ov5693_device {
>> +	struct i2c_client *client;
>> +	struct device *dev;
>> +
>> +	/* Protect against concurrent changes to controls */
>> +	struct mutex lock;
>> +
>> +	struct gpio_desc *reset;
>> +	struct gpio_desc *powerdown;
>> +	struct regulator_bulk_data supplies[OV5693_NUM_SUPPLIES];
>> +	struct clk *clk;
>> +
>> +	const struct ov5693_resolution *mode;
>> +	bool streaming;
>> +
>> +	struct v4l2_subdev sd;
>> +	struct media_pad pad;
>> +
>> +	struct ov5693_v4l2_ctrls {
>> +		struct v4l2_ctrl_handler handler;
>> +		struct v4l2_ctrl *link_freq;
>> +		struct v4l2_ctrl *pixel_rate;
>> +		struct v4l2_ctrl *exposure;
>> +		struct v4l2_ctrl *analogue_gain;
>> +		struct v4l2_ctrl *digital_gain;
>> +		struct v4l2_ctrl *hflip;
>> +		struct v4l2_ctrl *vflip;
>> +		struct v4l2_ctrl *hblank;
>> +		struct v4l2_ctrl *vblank;
>> +		struct v4l2_ctrl *test_pattern;
>> +	} ctrls;
>> +};
>> +
>> +static const struct ov5693_reg ov5693_global_regs[] = {
>> +	{0x0103, 0x01},
>> +	{0x3016, 0xf0},
>> +	{0x3017, 0xf0},
>> +	{0x3018, 0xf0},
>> +	{0x3022, 0x01},
>> +	{0x3028, 0x44},
>> +	{0x3098, 0x02},
>> +	{0x3099, 0x19},
>> +	{0x309a, 0x02},
>> +	{0x309b, 0x01},
>> +	{0x309c, 0x00},
>> +	{0x30a0, 0xd2},
>> +	{0x30a2, 0x01},
>> +	{0x30b2, 0x00},
>> +	{0x30b3, 0x7d},
>> +	{0x30b4, 0x03},
>> +	{0x30b5, 0x04},
>> +	{0x30b6, 0x01},
>> +	{0x3104, 0x21},
>> +	{0x3106, 0x00},
>> +	{0x3406, 0x01},
>> +	{0x3503, 0x07},
>> +	{0x350b, 0x40},
>> +	{0x3601, 0x0a},
>> +	{0x3602, 0x38},
>> +	{0x3612, 0x80},
>> +	{0x3620, 0x54},
>> +	{0x3621, 0xc7},
>> +	{0x3622, 0x0f},
>> +	{0x3625, 0x10},
>> +	{0x3630, 0x55},
>> +	{0x3631, 0xf4},
>> +	{0x3632, 0x00},
>> +	{0x3633, 0x34},
>> +	{0x3634, 0x02},
>> +	{0x364d, 0x0d},
>> +	{0x364f, 0xdd},
>> +	{0x3660, 0x04},
>> +	{0x3662, 0x10},
>> +	{0x3663, 0xf1},
>> +	{0x3665, 0x00},
>> +	{0x3666, 0x20},
>> +	{0x3667, 0x00},
>> +	{0x366a, 0x80},
>> +	{0x3680, 0xe0},
>> +	{0x3681, 0x00},
>> +	{0x3700, 0x42},
>> +	{0x3701, 0x14},
>> +	{0x3702, 0xa0},
>> +	{0x3703, 0xd8},
>> +	{0x3704, 0x78},
>> +	{0x3705, 0x02},
>> +	{0x370a, 0x00},
>> +	{0x370b, 0x20},
>> +	{0x370c, 0x0c},
>> +	{0x370d, 0x11},
>> +	{0x370e, 0x00},
>> +	{0x370f, 0x40},
>> +	{0x3710, 0x00},
>> +	{0x371a, 0x1c},
>> +	{0x371b, 0x05},
>> +	{0x371c, 0x01},
>> +	{0x371e, 0xa1},
>> +	{0x371f, 0x0c},
>> +	{0x3721, 0x00},
>> +	{0x3724, 0x10},
>> +	{0x3726, 0x00},
>> +	{0x372a, 0x01},
>> +	{0x3730, 0x10},
>> +	{0x3738, 0x22},
>> +	{0x3739, 0xe5},
>> +	{0x373a, 0x50},
>> +	{0x373b, 0x02},
>> +	{0x373c, 0x41},
>> +	{0x373f, 0x02},
>> +	{0x3740, 0x42},
>> +	{0x3741, 0x02},
>> +	{0x3742, 0x18},
>> +	{0x3743, 0x01},
>> +	{0x3744, 0x02},
>> +	{0x3747, 0x10},
>> +	{0x374c, 0x04},
>> +	{0x3751, 0xf0},
>> +	{0x3752, 0x00},
>> +	{0x3753, 0x00},
>> +	{0x3754, 0xc0},
>> +	{0x3755, 0x00},
>> +	{0x3756, 0x1a},
>> +	{0x3758, 0x00},
>> +	{0x3759, 0x0f},
>> +	{0x376b, 0x44},
>> +	{0x375c, 0x04},
>> +	{0x3774, 0x10},
>> +	{0x3776, 0x00},
>> +	{0x377f, 0x08},
>> +	{0x3780, 0x22},
>> +	{0x3781, 0x0c},
>> +	{0x3784, 0x2c},
>> +	{0x3785, 0x1e},
>> +	{0x378f, 0xf5},
>> +	{0x3791, 0xb0},
>> +	{0x3795, 0x00},
>> +	{0x3796, 0x64},
>> +	{0x3797, 0x11},
>> +	{0x3798, 0x30},
>> +	{0x3799, 0x41},
>> +	{0x379a, 0x07},
>> +	{0x379b, 0xb0},
>> +	{0x379c, 0x0c},
>> +	{0x3a04, 0x06},
>> +	{0x3a05, 0x14},
>> +	{0x3e07, 0x20},
>> +	{0x4000, 0x08},
>> +	{0x4001, 0x04},
>> +	{0x4004, 0x08},
>> +	{0x4006, 0x20},
>> +	{0x4008, 0x24},
>> +	{0x4009, 0x10},
>> +	{0x4058, 0x00},
>> +	{0x4101, 0xb2},
>> +	{0x4307, 0x31},
>> +	{0x4511, 0x05},
>> +	{0x4512, 0x01},
>> +	{0x481f, 0x30},
>> +	{0x4826, 0x2c},
>> +	{0x4d02, 0xfd},
>> +	{0x4d03, 0xf5},
>> +	{0x4d04, 0x0c},
>> +	{0x4d05, 0xcc},
>> +	{0x4837, 0x0a},
>> +	{0x5003, 0x20},
>> +	{0x5013, 0x00},
>> +	{0x5842, 0x01},
>> +	{0x5843, 0x2b},
>> +	{0x5844, 0x01},
>> +	{0x5845, 0x92},
>> +	{0x5846, 0x01},
>> +	{0x5847, 0x8f},
>> +	{0x5848, 0x01},
>> +	{0x5849, 0x0c},
>> +	{0x5e10, 0x0c},
>> +	{0x3820, 0x00},
>> +	{0x3821, 0x1e},
>> +	{0x5041, 0x14}
>> +};
>> +
>> +static const struct ov5693_reg_list ov5693_global_setting = {
>> +	.num_regs = ARRAY_SIZE(ov5693_global_regs),
>> +	.regs = ov5693_global_regs,
>> +};
>> +
>> +#define OV5693_NUM_RESOLUTIONS		ARRAY_SIZE(ov5693_resolutions)
>> +struct ov5693_resolution ov5693_resolutions[] = {
> Could we avoid making this driver mode-based, given that we program
> registers manually with the crop rectangle and binning configuration ?
> We could implement the .set_selection() operation to configure the crop
> rectangle, and control binning as the ratio between the crop rectangle
> size and the output size.


I honestly hadn't even thought about doing it that way, but I like that
idea much more than the fixed modes yes. I'll switch to that for the v2


>
>> +	{
>> +		.desc = "ov5693_2592x1944_30fps",
>> +		.fps = 30,
>> +
>> +		.crop_start_x = 16,
>> +		.offset_x = 0,
>> +		.output_size_x = 2592,
>> +		.crop_end_x = 2608,
>> +		.hts = 2688,
>> +
>> +		.crop_start_y = 6,
>> +		.offset_y = 0,
>> +		.output_size_y = 1944,
>> +		.crop_end_y = 1950,
>> +		.vts = 1984,
>> +
>> +		.inc_x_odd = 1,
>> +		.inc_x_even = 1,
>> +		.inc_y_odd = 1,
>> +		.inc_y_even = 1,
>> +
>> +		.crop = {
>> +			.left = 16,
>> +			.top = 6,
>> +			.width = 2592,
>> +			.height = 1944
>> +		},
>> +	},
>> +	{
>> +		.desc = "ov5693_1920x1080_30fps",
>> +		.fps = 30,
>> +
>> +		.crop_start_x = 16,
>> +		.offset_x = 0,
>> +		.output_size_x = 1920,
>> +		.crop_end_x = 2608,
>> +		.hts = 2688,
>> +
>> +		.crop_start_y = 249,
>> +		.offset_y = 0,
>> +		.output_size_y = 1080,
>> +		.crop_end_y = 1707,
>> +		.vts = 1984,
>> +
>> +		.scale_enable = true,
>> +
>> +		.inc_x_odd = 1,
>> +		.inc_x_even = 1,
>> +		.inc_y_odd = 1,
>> +		.inc_y_even = 1,
>> +
>> +		.crop = {
>> +			.left = 16,
>> +			.top = 249,
>> +			.width = 2592,
>> +			.height = 1458
>> +		},
>> +	},
>> +	{
>> +		.desc = "ov5693_1280x720_60fps",
>> +		.fps = 60,
>> +
>> +		.crop_start_x = 32,
>> +		.offset_x = 0,
>> +		.output_size_x = 1280,
>> +		.crop_end_x = 2592,
>> +		.binning_x = true,
>> +		.hts = 2688,
>> +
>> +		.crop_start_y = 252,
>> +		.offset_y = 0,
>> +		.output_size_y = 720,
>> +		.crop_end_y = 1692,
>> +		.binning_y = true,
>> +		.vts = 992,
>> +
>> +		.inc_x_odd = 3,
>> +		.inc_x_even = 1,
>> +		.inc_y_odd = 3,
>> +		.inc_y_even = 1,
>> +
>> +		.crop = {
>> +			.left = 32,
>> +			.top = 252,
>> +			.width = 2560,
>> +			.height = 1440
>> +		},
>> +	}
>> +};
>> +
>> +static const s64 link_freq_menu_items[] = {
>> +	OV5693_LINK_FREQ_400MHZ
>> +};
>> +
>> +static const char * const ov5693_supply_names[] = {
>> +	"avdd",
>> +	"dovdd",
>> +};
>> +
>> +static const char * const ov5693_test_pattern_menu[] = {
>> +	"Disabled",
>> +	"Random Data",
>> +	"Colour Bars",
>> +	"Colour Bars with Rolling Bar"
>> +};
>> +
>> +static const u8 ov5693_test_pattern_bits[] = {
>> +	0,
>> +	OV5693_TEST_PATTERN_ENABLE | OV5693_TEST_PATTERN_RANDOM,
>> +	OV5693_TEST_PATTERN_ENABLE | OV5693_TEST_PATTERN_BARS,
>> +	OV5693_TEST_PATTERN_ENABLE | OV5693_TEST_PATTERN_BARS |
>> +	OV5693_TEST_PATTERN_ROLLING,
>> +};
>> +
>> +/* I2C I/O Operations */
>> +
>> +static int ov5693_read_reg(struct ov5693_device *ov5693, u16 addr, u8 *value)
>> +{
>> +	unsigned char data[2] = { addr >> 8, addr & 0xff };
>> +	struct i2c_client *client = ov5693->client;
>> +	int ret;
>> +
>> +	ret = i2c_master_send(client, data, sizeof(data));
>> +	if (ret < 0) {
>> +		dev_dbg(&client->dev, "i2c send error at address 0x%04x\n",
>> +			addr);
>> +		return ret;
>> +	}
>> +
>> +	ret = i2c_master_recv(client, value, 1);
>> +	if (ret < 0) {
>> +		dev_dbg(&client->dev, "i2c recv error at address 0x%04x\n",
>> +			addr);
>> +		return ret;
>> +	}
> This would allow another bus master to access the bus between the write
> and the read. You should instead use i2c_transfer() with two messages.


Ah, thanks, that also hadn't occurred to me but now you mention it seems
obvious!

>
>> +
>> +	return 0;
>> +}
>> +
>> +static void ov5693_write_reg(struct ov5693_device *ov5693, u16 addr, u8 value,
>> +			     int *error)
>> +{
>> +	unsigned char data[3] = { addr >> 8, addr & 0xff, value };
>> +	int ret;
>> +
>> +	if (*error < 0)
>> +		return;
>> +
>> +	ret = i2c_master_send(ov5693->client, data, sizeof(data));
>> +	if (ret < 0) {
>> +		dev_dbg(ov5693->dev, "i2c send error at address 0x%04x: %d\n",
>> +			addr, ret);
>> +		*error = ret;
>> +	}
>> +}
>> +
>> +static int ov5693_write_reg_array(struct ov5693_device *ov5693,
>> +				  const struct ov5693_reg_list *reglist)
>> +{
>> +	unsigned int i;
>> +	int ret = 0;
>> +
>> +	for (i = 0; i < reglist->num_regs; i++)
>> +		ov5693_write_reg(ov5693, reglist->regs[i].reg,
>> +				 reglist->regs[i].val, &ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ov5693_update_bits(struct ov5693_device *ov5693, u16 address,
>> +			      u16 mask, u16 bits)
>> +{
>> +	u8 value = 0;
>> +	int ret;
>> +
>> +	ret = ov5693_read_reg(ov5693, address, &value);
>> +	if (ret)
>> +		return ret;
>> +
>> +	value &= ~mask;
>> +	value |= bits;
>> +
>> +	ov5693_write_reg(ov5693, address, value, &ret);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +/* V4L2 Controls Functions */
>> +
>> +static int ov5693_flip_vert_configure(struct ov5693_device *ov5693, bool enable)
>> +{
>> +	u8 bits = OV5693_FORMAT1_FLIP_VERT_ISP_EN |
>> +		  OV5693_FORMAT1_FLIP_VERT_SENSOR_EN;
>> +	int ret;
>> +
>> +	ret = ov5693_update_bits(ov5693, OV5693_FORMAT1_REG, bits,
>> +				 enable ? bits : 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov5693_flip_horz_configure(struct ov5693_device *ov5693, bool enable)
>> +{
>> +	u8 bits = OV5693_FORMAT2_FLIP_HORZ_ISP_EN |
>> +		  OV5693_FORMAT2_FLIP_HORZ_SENSOR_EN;
>> +	int ret;
>> +
>> +	ret = ov5693_update_bits(ov5693, OV5693_FORMAT2_REG, bits,
>> +				 enable ? bits : 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov5693_get_exposure(struct ov5693_device *ov5693, s32 *value)
>> +{
>> +	u8 exposure_hh = 0, exposure_h = 0, exposure_l = 0;
>> +	int ret;
>> +
>> +	ret = ov5693_read_reg(ov5693, OV5693_EXPOSURE_L_CTRL_HH_REG, &exposure_hh);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ov5693_read_reg(ov5693, OV5693_EXPOSURE_L_CTRL_H_REG, &exposure_h);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ov5693_read_reg(ov5693, OV5693_EXPOSURE_L_CTRL_L_REG, &exposure_l);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* The lowest 4 bits are unsupported fractional bits */
>> +	*value = ((exposure_hh << 16) | (exposure_h << 8) | exposure_l) >> 4;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov5693_exposure_configure(struct ov5693_device *ov5693, u32 exposure)
>> +{
>> +	int ret = 0;
>> +
>> +	/* Enable HDR Mode to access "short" exposure */
>> +
>> +	ret = ov5693_update_bits(ov5693, OV5693_FORMAT2_REG,
>> +				 OV5693_FORMAT2_HDR_EN, OV5693_FORMAT2_HDR_EN);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ov5693_write_reg(ov5693, OV5693_EXPOSURE_L_CTRL_HH_REG,
>> +			 OV5693_EXPOSURE_CTRL_HH(exposure), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_EXPOSURE_L_CTRL_H_REG,
>> +			 OV5693_EXPOSURE_CTRL_H(exposure), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_EXPOSURE_L_CTRL_L_REG,
>> +			 OV5693_EXPOSURE_CTRL_L(exposure), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_EXPOSURE_S_CTRL_HH_REG,
>> +			 OV5693_EXPOSURE_CTRL_HH(exposure), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_EXPOSURE_S_CTRL_H_REG,
>> +			 OV5693_EXPOSURE_CTRL_H(exposure), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_EXPOSURE_S_CTRL_L_REG,
>> +			 OV5693_EXPOSURE_CTRL_L(exposure), &ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ov5693_get_gain(struct ov5693_device *ov5693, u32 *gain)
>> +{
>> +	u8 gain_l = 0, gain_h = 0;
>> +	int ret;
>> +
>> +	ret = ov5693_read_reg(ov5693, OV5693_GAIN_CTRL_H_REG, &gain_h);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ov5693_read_reg(ov5693, OV5693_GAIN_CTRL_L_REG, &gain_l);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* As with exposure, the lowest 4 bits are fractional bits. */
>> +	*gain = ((gain_h << 8) | gain_l) >> 4;
>> +
>> +	return ret;
>> +}
>> +
>> +static int ov5693_digital_gain_configure(struct ov5693_device *ov5693, u32 gain)
>> +{
>> +	int ret = 0;
>> +
>> +	ov5693_write_reg(ov5693, OV5693_MWB_RED_GAIN_H_REG,
>> +			 OV5693_MWB_GAIN_H_CTRL(gain), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_MWB_RED_GAIN_L_REG,
>> +			 OV5693_MWB_GAIN_L_CTRL(gain), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_MWB_GREEN_GAIN_H_REG,
>> +			 OV5693_MWB_GAIN_H_CTRL(gain), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_MWB_GREEN_GAIN_L_REG,
>> +			 OV5693_MWB_GAIN_L_CTRL(gain), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_MWB_BLUE_GAIN_H_REG,
>> +			 OV5693_MWB_GAIN_H_CTRL(gain), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_MWB_BLUE_GAIN_L_REG,
>> +			 OV5693_MWB_GAIN_L_CTRL(gain), &ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ov5693_analog_gain_configure(struct ov5693_device *ov5693, u32 gain)
>> +{
>> +	int ret = 0;
>> +
>> +	ov5693_write_reg(ov5693, OV5693_GAIN_CTRL_L_REG,
>> +			 OV5693_GAIN_CTRL_L(gain), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_GAIN_CTRL_H_REG,
>> +			 OV5693_GAIN_CTRL_H(gain), &ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ov5693_vts_configure(struct ov5693_device *ov5693, u32 vblank)
>> +{
>> +	u16 vts = ov5693->mode->output_size_y + vblank;
>> +	int ret = 0;
>> +
>> +	ov5693_write_reg(ov5693, OV5693_TIMING_VTS_H_REG,
>> +			 OV5693_TIMING_VTS_H(vts), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_TIMING_VTS_L_REG,
>> +			 OV5693_TIMING_VTS_L(vts), &ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ov5693_test_pattern_configure(struct ov5693_device *ov5693, u32 idx)
>> +{
>> +	int ret = 0;
>> +
>> +	ov5693_write_reg(ov5693, OV5693_TEST_PATTERN_REG,
>> +			 ov5693_test_pattern_bits[idx], &ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ov5693_s_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct ov5693_device *ov5693 =
>> +	    container_of(ctrl->handler, struct ov5693_device, ctrls.handler);
>> +	int ret = 0;
>> +
>> +	/* If VBLANK is altered we need to update exposure to compensate */
>> +	if (ctrl->id == V4L2_CID_VBLANK) {
>> +		int exposure_max;
>> +
>> +		exposure_max = ov5693->mode->output_size_y + ctrl->val -
>> +			       OV5693_INTEGRATION_TIME_MARGIN;
>> +		__v4l2_ctrl_modify_range(ov5693->ctrls.exposure,
>> +					 ov5693->ctrls.exposure->minimum,
>> +					 exposure_max, ov5693->ctrls.exposure->step,
>> +					 ov5693->ctrls.exposure->val < exposure_max ?
>> +					 ov5693->ctrls.exposure->val : exposure_max);
>> +	}
>> +
>> +	/* Only apply changes to the controls if the device is powered up */
>> +	if (!pm_runtime_get_if_in_use(ov5693->dev))
>> +		return 0;
>> +
>> +	switch (ctrl->id) {
>> +	case V4L2_CID_EXPOSURE:
>> +		ret = ov5693_exposure_configure(ov5693, ctrl->val);
>> +		break;
>> +	case V4L2_CID_ANALOGUE_GAIN:
>> +		ret = ov5693_analog_gain_configure(ov5693, ctrl->val);
>> +		break;
>> +	case V4L2_CID_DIGITAL_GAIN:
>> +		ret = ov5693_digital_gain_configure(ov5693, ctrl->val);
>> +		break;
>> +	case V4L2_CID_HFLIP:
>> +		ret = ov5693_flip_horz_configure(ov5693, !!ctrl->val);
>> +		break;
>> +	case V4L2_CID_VFLIP:
>> +		ret = ov5693_flip_vert_configure(ov5693, !!ctrl->val);
>> +		break;
>> +	case V4L2_CID_VBLANK:
>> +		ret = ov5693_vts_configure(ov5693, ctrl->val);
>> +		break;
>> +	case V4L2_CID_TEST_PATTERN:
>> +		ret = ov5693_test_pattern_configure(ov5693, ctrl->val);
>> +		break;
>> +	default:
>> +		ret = -EINVAL;
>> +	}
>> +
>> +	pm_runtime_put(ov5693->dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ov5693_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct ov5693_device *ov5693 =
>> +	    container_of(ctrl->handler, struct ov5693_device, ctrls.handler);
>> +
>> +	switch (ctrl->id) {
>> +	case V4L2_CID_EXPOSURE_ABSOLUTE:
>> +		return ov5693_get_exposure(ov5693, &ctrl->val);
>> +	case V4L2_CID_AUTOGAIN:
>> +		return ov5693_get_gain(ov5693, &ctrl->val);
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
>> +
>> +static const struct v4l2_ctrl_ops ov5693_ctrl_ops = {
>> +	.s_ctrl = ov5693_s_ctrl,
>> +	.g_volatile_ctrl = ov5693_g_volatile_ctrl
>> +};
>> +
>> +/* System Control Functions */
>> +
>> +static int ov5693_mode_configure(struct ov5693_device *ov5693)
>> +{
>> +	const struct ov5693_resolution *mode = ov5693->mode;
>> +	int ret = 0;
>> +
>> +	/* Crop Start X */
>> +	ov5693_write_reg(ov5693, OV5693_CROP_START_X_H_REG,
>> +			 OV5693_CROP_START_X_H(mode->crop_start_x), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_CROP_START_X_L_REG,
>> +			 OV5693_CROP_START_X_L(mode->crop_start_x), &ret);
>> +
>> +	/* Offset X */
>> +	ov5693_write_reg(ov5693, OV5693_OFFSET_START_X_H_REG,
>> +			 OV5693_OFFSET_START_X_H(mode->offset_x), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_OFFSET_START_X_L_REG,
>> +			 OV5693_OFFSET_START_X_L(mode->offset_x), &ret);
>> +
>> +	/* Output Size X */
>> +	ov5693_write_reg(ov5693, OV5693_OUTPUT_SIZE_X_H_REG,
>> +			 OV5693_OUTPUT_SIZE_X_H(mode->output_size_x), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_OUTPUT_SIZE_X_L_REG,
>> +			 OV5693_OUTPUT_SIZE_X_L(mode->output_size_x), &ret);
>> +
>> +	/* Crop End X */
>> +	ov5693_write_reg(ov5693, OV5693_CROP_END_X_H_REG,
>> +			 OV5693_CROP_END_X_H(mode->crop_end_x), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_CROP_END_X_L_REG,
>> +			 OV5693_CROP_END_X_L(mode->crop_end_x), &ret);
>> +
>> +	/* Horizontal Total Size */
>> +	ov5693_write_reg(ov5693, OV5693_TIMING_HTS_H_REG,
>> +			 OV5693_TIMING_HTS_H(mode->hts), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_TIMING_HTS_L_REG,
>> +			 OV5693_TIMING_HTS_L(mode->hts), &ret);
>> +
>> +	/* Crop Start Y */
>> +	ov5693_write_reg(ov5693, OV5693_CROP_START_Y_H_REG,
>> +			 OV5693_CROP_START_Y_H(mode->crop_start_y), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_CROP_START_Y_L_REG,
>> +			 OV5693_CROP_START_Y_L(mode->crop_start_y), &ret);
>> +
>> +	/* Offset Y */
>> +	ov5693_write_reg(ov5693, OV5693_OFFSET_START_Y_H_REG,
>> +			 OV5693_OFFSET_START_Y_H(mode->offset_y), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_OFFSET_START_Y_L_REG,
>> +			 OV5693_OFFSET_START_Y_L(mode->offset_y), &ret);
>> +
>> +	/* Output Size Y */
>> +	ov5693_write_reg(ov5693, OV5693_OUTPUT_SIZE_Y_H_REG,
>> +			 OV5693_OUTPUT_SIZE_Y_H(mode->output_size_y), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_OUTPUT_SIZE_Y_L_REG,
>> +			 OV5693_OUTPUT_SIZE_Y_L(mode->output_size_y), &ret);
>> +
>> +	/* Crop End Y */
>> +	ov5693_write_reg(ov5693, OV5693_CROP_END_Y_H_REG,
>> +			 OV5693_CROP_END_Y_H(mode->crop_end_y), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_CROP_END_Y_L_REG,
>> +			 OV5693_CROP_END_Y_L(mode->crop_end_y), &ret);
>> +
>> +	/* Vertical Total Size */
>> +	ov5693_write_reg(ov5693, OV5693_TIMING_VTS_H_REG,
>> +			 OV5693_TIMING_VTS_H(mode->vts), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_TIMING_VTS_L_REG,
>> +			 OV5693_TIMING_VTS_L(mode->vts), &ret);
>> +
>> +	/* Subsample X increase */
>> +	ov5693_write_reg(ov5693, OV5693_SUB_INC_X_REG,
>> +			 ((mode->inc_x_odd << 4) & 0xf0) |
>> +			 (mode->inc_x_even & 0x0f), &ret);
>> +	/* Subsample Y increase */
>> +	ov5693_write_reg(ov5693, OV5693_SUB_INC_Y_REG,
>> +			 ((mode->inc_y_odd << 4) & 0xf0) |
>> +			 (mode->inc_y_even & 0x0f), &ret);
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Binning */
>> +	ret = ov5693_update_bits(ov5693, OV5693_FORMAT1_REG,
>> +				 OV5693_FORMAT1_VBIN_EN,
>> +				 mode->binning_y ? OV5693_FORMAT1_VBIN_EN : 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ov5693_update_bits(ov5693, OV5693_FORMAT2_REG,
>> +				 OV5693_FORMAT2_HBIN_EN,
>> +				 mode->binning_x ? OV5693_FORMAT2_HBIN_EN : 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Scaler */
>> +	ret = ov5693_update_bits(ov5693, OV5693_ISP_CTRL2_REG,
>> +				 OV5693_ISP_SCALE_ENABLE,
>> +				 mode->scale_enable ? OV5693_ISP_SCALE_ENABLE : 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return ret;
>> +}
>> +
>> +static int ov5693_sw_standby(struct ov5693_device *ov5693, bool standby)
>> +{
>> +	int ret = 0;
>> +
>> +	ov5693_write_reg(ov5693, OV5693_SW_STREAM_REG,
>> +			 standby ? OV5693_STOP_STREAMING : OV5693_START_STREAMING,
>> +			 &ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ov5693_sw_reset(struct ov5693_device *ov5693)
>> +{
>> +	int ret = 0;
>> +
>> +	ov5693_write_reg(ov5693, OV5693_SW_RESET_REG, OV5693_SW_RESET, &ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ov5693_sensor_init(struct ov5693_device *ov5693)
>> +{
>> +	int ret = 0;
>> +
>> +	ret = ov5693_sw_reset(ov5693);
>> +	if (ret) {
>> +		dev_err(ov5693->dev, "%s software reset error\n", __func__);
>> +		return ret;
>> +	}
>> +
>> +	ret = ov5693_write_reg_array(ov5693, &ov5693_global_setting);
>> +	if (ret) {
>> +		dev_err(ov5693->dev, "%s global settings error\n", __func__);
>> +		return ret;
>> +	}
>> +
>> +	ret = ov5693_mode_configure(ov5693);
>> +	if (ret) {
>> +		dev_err(ov5693->dev, "%s mode configure error\n", __func__);
>> +		return ret;
>> +	}
>> +
>> +	ret = ov5693_sw_standby(ov5693, true);
>> +	if (ret)
>> +		dev_err(ov5693->dev, "%s software standby error\n", __func__);
>> +
>> +	return ret;
>> +}
>> +
>> +static void ov5693_sensor_powerdown(struct ov5693_device *ov5693)
>> +{
>> +	gpiod_set_value_cansleep(ov5693->reset, 1);
>> +	gpiod_set_value_cansleep(ov5693->powerdown, 1);
>> +
>> +	regulator_bulk_disable(OV5693_NUM_SUPPLIES, ov5693->supplies);
>> +
>> +	clk_disable_unprepare(ov5693->clk);
>> +}
>> +
>> +static int ov5693_sensor_powerup(struct ov5693_device *ov5693)
>> +{
>> +	int ret = 0;
>> +
>> +	gpiod_set_value_cansleep(ov5693->reset, 1);
>> +	gpiod_set_value_cansleep(ov5693->powerdown, 1);
>> +
>> +	ret = clk_prepare_enable(ov5693->clk);
>> +	if (ret) {
>> +		dev_err(ov5693->dev, "Failed to enable clk\n");
>> +		goto fail_power;
>> +	}
>> +
>> +	ret = regulator_bulk_enable(OV5693_NUM_SUPPLIES, ov5693->supplies);
>> +	if (ret) {
>> +		dev_err(ov5693->dev, "Failed to enable regulators\n");
>> +		goto fail_power;
>> +	}
>> +
>> +	gpiod_set_value_cansleep(ov5693->reset, 0);
>> +	gpiod_set_value_cansleep(ov5693->powerdown, 0);
>> +
>> +	usleep_range(20000, 25000);
>> +
>> +	return 0;
>> +
>> +fail_power:
>> +	ov5693_sensor_powerdown(ov5693);
>> +	return ret;
>> +}
>> +
>> +static int __maybe_unused ov5693_sensor_suspend(struct device *dev)
>> +{
>> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>> +	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
>> +	int ret;
>> +
>> +	mutex_lock(&ov5693->lock);
>> +
>> +	if (ov5693->streaming) {
>> +		ret = ov5693_sw_standby(ov5693, true);
>> +		if (ret)
>> +			goto out_unlock;
>> +	}
>> +
>> +	ov5693_sensor_powerdown(ov5693);
>> +
>> +out_unlock:
>> +	mutex_unlock(&ov5693->lock);
>> +	return ret;
>> +}
>> +
>> +static int __maybe_unused ov5693_sensor_resume(struct device *dev)
>> +{
>> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>> +	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
>> +	int ret;
>> +
>> +	mutex_lock(&ov5693->lock);
>> +
>> +	ret = ov5693_sensor_powerup(ov5693);
>> +	if (ret)
>> +		goto out_unlock;
>> +
>> +	ret = ov5693_sensor_init(ov5693);
>> +	if (ret) {
>> +		dev_err(dev, "ov5693 sensor init failure\n");
>> +		goto err_power;
>> +	}
>> +
>> +	if (ov5693->streaming) {
>> +		ret = ov5693_sw_standby(ov5693, false);
>> +		if (ret)
>> +			goto err_power;
>> +	}
>> +
>> +	goto out_unlock;
>> +
>> +err_power:
>> +	ov5693_sensor_powerdown(ov5693);
>> +out_unlock:
>> +	mutex_unlock(&ov5693->lock);
>> +	return ret;
>> +}
>> +
>> +static int ov5693_detect(struct ov5693_device *ov5693)
>> +{
>> +	u8 id_l = 0, id_h = 0;
>> +	u16 id = 0;
>> +	int ret;
>> +
>> +	ret = ov5693_read_reg(ov5693, OV5693_REG_CHIP_ID_H, &id_h);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ov5693_read_reg(ov5693, OV5693_REG_CHIP_ID_L, &id_l);
>> +	if (ret)
>> +		return ret;
>> +
>> +	id = (id_h << 8) | id_l;
>> +
>> +	if (id != OV5693_CHIP_ID) {
>> +		dev_err(ov5693->dev, "sensor ID mismatch. Found 0x%04x\n", id);
>> +		return -ENODEV;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/* V4L2 Framework callbacks */
>> +
>> +static int ov5693_set_fmt(struct v4l2_subdev *sd,
>> +			  struct v4l2_subdev_pad_config *cfg,
>> +			  struct v4l2_subdev_format *format)
>> +{
>> +	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
>> +	const struct ov5693_resolution *mode;
>> +	int exposure_max;
>> +	int ret = 0;
>> +	int hblank;
>> +
>> +	if (format->pad)
>> +		return -EINVAL;
>> +
>> +	mutex_lock(&ov5693->lock);
>> +
>> +	mode = v4l2_find_nearest_size(ov5693_resolutions,
>> +				      OV5693_NUM_RESOLUTIONS, output_size_x,
>> +				      output_size_y, format->format.width,
>> +				      format->format.height);
>> +
>> +	if (!mode)
>> +		return -EINVAL;
>> +
>> +	format->format.width = mode->output_size_x;
>> +	format->format.height = mode->output_size_y;
>> +	format->format.code = MEDIA_BUS_FMT_SBGGR10_1X10;
>> +
>> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
>> +		*v4l2_subdev_get_try_format(sd, cfg, format->pad) = format->format;
>> +		goto mutex_unlock;
>> +	}
>> +
>> +	ov5693->mode = mode;
>> +
>> +	/* Update limits and set FPS to default */
>> +	__v4l2_ctrl_modify_range(ov5693->ctrls.vblank,
>> +				 OV5693_TIMING_MIN_VTS,
>> +				 OV5693_TIMING_MAX_VTS - mode->output_size_y,
>> +				 1, mode->vts - mode->output_size_y);
>> +	__v4l2_ctrl_s_ctrl(ov5693->ctrls.vblank,
>> +			   mode->vts - mode->output_size_y);
>> +
>> +	hblank = mode->hts - mode->output_size_x;
>> +	__v4l2_ctrl_modify_range(ov5693->ctrls.hblank, hblank, hblank, 1,
>> +				 hblank);
>> +
>> +	exposure_max = mode->vts - OV5693_INTEGRATION_TIME_MARGIN;
>> +	__v4l2_ctrl_modify_range(ov5693->ctrls.exposure,
>> +				 ov5693->ctrls.exposure->minimum, exposure_max,
>> +				 ov5693->ctrls.exposure->step,
>> +				 ov5693->ctrls.exposure->val < exposure_max ?
>> +				 ov5693->ctrls.exposure->val : exposure_max);
>> +
>> +mutex_unlock:
>> +	mutex_unlock(&ov5693->lock);
>> +	return ret;
>> +}
>> +
>> +static const struct v4l2_rect *
>> +__ov5693_get_pad_crop(struct ov5693_device *ov5693, struct v4l2_subdev_pad_config *cfg,
>> +		      unsigned int pad, enum v4l2_subdev_format_whence which)
>> +{
>> +	switch (which) {
>> +	case V4L2_SUBDEV_FORMAT_TRY:
>> +		return v4l2_subdev_get_try_crop(&ov5693->sd, cfg, pad);
>> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
>> +		return &ov5693->mode->crop;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static int ov5693_get_selection(struct v4l2_subdev *sd,
>> +				struct v4l2_subdev_pad_config *cfg,
>> +				struct v4l2_subdev_selection *sel)
>> +{
>> +	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
>> +
>> +	switch (sel->target) {
>> +	case V4L2_SEL_TGT_CROP:
>> +		mutex_lock(&ov5693->lock);
>> +		sel->r = *__ov5693_get_pad_crop(ov5693, cfg, sel->pad, sel->which);
>> +		mutex_unlock(&ov5693->lock);
>> +		break;
>> +	case V4L2_SEL_TGT_NATIVE_SIZE:
>> +		sel->r.top = 0;
>> +		sel->r.left = 0;
>> +		sel->r.width = OV5693_NATIVE_WIDTH;
>> +		sel->r.height = OV5693_NATIVE_HEIGHT;
>> +		break;
>> +	case V4L2_SEL_TGT_CROP_BOUNDS:
>> +	case V4L2_SEL_TGT_CROP_DEFAULT:
>> +		sel->r.top = OV5693_ACTIVE_START_TOP;
>> +		sel->r.left = OV5693_ACTIVE_START_LEFT;
>> +		sel->r.width = OV5693_ACTIVE_WIDTH;
>> +		sel->r.height = OV5693_ACTIVE_HEIGHT;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov5693_get_fmt(struct v4l2_subdev *sd,
>> +			  struct v4l2_subdev_pad_config *cfg,
>> +			  struct v4l2_subdev_format *format)
>> +{
>> +	struct v4l2_mbus_framefmt *fmt = &format->format;
>> +	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
>> +
>> +	if (format->pad)
>> +		return -EINVAL;
>> +
>> +	if (!fmt)
>> +		return -EINVAL;
>> +
>> +	fmt->width = ov5693->mode->output_size_x;
>> +	fmt->height = ov5693->mode->output_size_y;
>> +	fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
>> +{
>> +	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
>> +	int ret;
>> +
>> +	if (enable) {
>> +		ret = pm_runtime_get_sync(ov5693->dev);
>> +		if (ret < 0)
>> +			goto err_power_down;
>> +	}
>> +
>> +	ret = __v4l2_ctrl_handler_setup(&ov5693->ctrls.handler);
>> +	if (ret)
>> +		goto err_power_down;
>> +
>> +	mutex_lock(&ov5693->lock);
>> +	ret = ov5693_sw_standby(ov5693, !enable);
>> +	mutex_unlock(&ov5693->lock);
>> +
>> +	if (ret)
>> +		goto err_power_down;
>> +	ov5693->streaming = !!enable;
>> +
>> +	if (!enable)
>> +		pm_runtime_put(ov5693->dev);
>> +
>> +	return 0;
>> +err_power_down:
>> +	pm_runtime_put_noidle(ov5693->dev);
>> +	return ret;
>> +}
>> +
>> +static int ov5693_g_frame_interval(struct v4l2_subdev *sd,
>> +				   struct v4l2_subdev_frame_interval *interval)
>> +{
>> +	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
>> +
>> +	interval->interval.numerator = 1;
>> +	interval->interval.denominator = ov5693->mode->fps;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov5693_enum_mbus_code(struct v4l2_subdev *sd,
>> +				 struct v4l2_subdev_pad_config *cfg,
>> +				 struct v4l2_subdev_mbus_code_enum *code)
>> +{
>> +	if (code->index >= OV5693_NUM_MBUS_FMTS)
>> +		return -EINVAL;
>> +
>> +	code->code = MEDIA_BUS_FMT_SBGGR10_1X10;
>> +	return 0;
>> +}
>> +
>> +static int ov5693_enum_frame_size(struct v4l2_subdev *sd,
>> +				  struct v4l2_subdev_pad_config *cfg,
>> +				  struct v4l2_subdev_frame_size_enum *fse)
>> +{
>> +	int index = fse->index;
>> +
>> +	if (index >= OV5693_NUM_RESOLUTIONS)
>> +		return -EINVAL;
>> +
>> +	fse->min_width = ov5693_resolutions[index].output_size_x;
>> +	fse->min_height = ov5693_resolutions[index].output_size_y;
>> +	fse->max_width = ov5693_resolutions[index].output_size_x;
>> +	fse->max_height = ov5693_resolutions[index].output_size_y;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_subdev_video_ops ov5693_video_ops = {
>> +	.s_stream = ov5693_s_stream,
>> +	.g_frame_interval = ov5693_g_frame_interval,
>> +};
>> +
>> +static const struct v4l2_subdev_pad_ops ov5693_pad_ops = {
>> +	.enum_mbus_code = ov5693_enum_mbus_code,
>> +	.enum_frame_size = ov5693_enum_frame_size,
>> +	.get_fmt = ov5693_get_fmt,
>> +	.set_fmt = ov5693_set_fmt,
>> +	.get_selection = ov5693_get_selection,
>> +};
>> +
>> +static const struct v4l2_subdev_ops ov5693_ops = {
>> +	.video = &ov5693_video_ops,
>> +	.pad = &ov5693_pad_ops,
>> +};
>> +
>> +/* Sensor and Driver Configuration Functions */
>> +
>> +static int ov5693_init_controls(struct ov5693_device *ov5693)
>> +{
>> +	const struct v4l2_ctrl_ops *ops = &ov5693_ctrl_ops;
>> +	struct v4l2_fwnode_device_properties props;
>> +	int vblank_max, vblank_def;
>> +	int exposure_max;
>> +	int hblank;
>> +	int ret;
>> +
>> +	ret = v4l2_ctrl_handler_init(&ov5693->ctrls.handler, 14);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* link freq */
>> +	ov5693->ctrls.link_freq = v4l2_ctrl_new_int_menu(&ov5693->ctrls.handler,
>> +							 NULL, V4L2_CID_LINK_FREQ,
>> +							 0, 0, link_freq_menu_items);
>> +	if (ov5693->ctrls.link_freq)
>> +		ov5693->ctrls.link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> +
>> +	/* pixel rate */
>> +	ov5693->ctrls.pixel_rate = v4l2_ctrl_new_std(&ov5693->ctrls.handler, NULL,
>> +						     V4L2_CID_PIXEL_RATE, 0,
>> +						     OV5693_PIXEL_RATE, 1,
>> +						     OV5693_PIXEL_RATE);
>> +
>> +	/* Exposure */
>> +	exposure_max = ov5693->mode->vts - OV5693_INTEGRATION_TIME_MARGIN;
>> +	ov5693->ctrls.exposure = v4l2_ctrl_new_std(&ov5693->ctrls.handler, ops,
>> +						   V4L2_CID_EXPOSURE,
>> +						   OV5693_EXPOSURE_MIN,
>> +						   exposure_max,
>> +						   OV5693_EXPOSURE_STEP,
>> +						   exposure_max);
>> +
>> +	/* Gain */
>> +	ov5693->ctrls.analogue_gain = v4l2_ctrl_new_std(&ov5693->ctrls.handler,
>> +							ops, V4L2_CID_ANALOGUE_GAIN,
>> +							OV5693_GAIN_MIN,
>> +							OV5693_GAIN_MAX,
>> +							OV5693_GAIN_STEP,
>> +							OV5693_GAIN_DEF);
>> +	ov5693->ctrls.digital_gain = v4l2_ctrl_new_std(&ov5693->ctrls.handler, ops,
>> +						       V4L2_CID_DIGITAL_GAIN,
>> +						       OV5693_DIGITAL_GAIN_MIN,
>> +						       OV5693_DIGITAL_GAIN_MAX,
>> +						       OV5693_DIGITAL_GAIN_STEP,
>> +						       OV5693_DIGITAL_GAIN_DEF);
>> +
>> +	/* Flip */
>> +	ov5693->ctrls.hflip = v4l2_ctrl_new_std(&ov5693->ctrls.handler, ops,
>> +						V4L2_CID_HFLIP, 0, 1, 1, 0);
>> +	ov5693->ctrls.vflip = v4l2_ctrl_new_std(&ov5693->ctrls.handler, ops,
>> +						V4L2_CID_VFLIP, 0, 1, 1, 0);
>> +
>> +	hblank = ov5693->mode->hts - ov5693->mode->output_size_x;
>> +	ov5693->ctrls.hblank = v4l2_ctrl_new_std(&ov5693->ctrls.handler, ops,
>> +						 V4L2_CID_HBLANK, hblank, hblank,
>> +						 1, hblank);
>> +	if (ov5693->ctrls.hblank)
>> +		ov5693->ctrls.hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> +
>> +	vblank_max = OV5693_TIMING_MAX_VTS - ov5693->mode->output_size_y;
>> +	vblank_def = ov5693->mode->vts - ov5693->mode->output_size_y;
>> +	ov5693->ctrls.vblank = v4l2_ctrl_new_std(&ov5693->ctrls.handler, ops,
>> +						 V4L2_CID_VBLANK,
>> +						 OV5693_TIMING_MIN_VTS,
>> +						 vblank_max, 1, vblank_def);
>> +
>> +	ov5693->ctrls.test_pattern = v4l2_ctrl_new_std_menu_items(
>> +					&ov5693->ctrls.handler, ops, V4L2_CID_TEST_PATTERN,
>> +					ARRAY_SIZE(ov5693_test_pattern_menu) - 1,
>> +					0, 0, ov5693_test_pattern_menu);
>> +
>> +	if (ov5693->ctrls.handler.error) {
>> +		dev_err(ov5693->dev, "Error initialising v4l2 ctrls\n");
>> +		ret = ov5693->ctrls.handler.error;
>> +		goto err_free_handler;
>> +	}
>> +
>> +	/* set properties from fwnode (e.g. rotation, orientation) */
>> +	ret = v4l2_fwnode_device_parse(ov5693->dev, &props);
>> +	if (ret)
>> +		goto err_free_handler;
>> +
>> +	ret = v4l2_ctrl_new_fwnode_properties(&ov5693->ctrls.handler, ops,
>> +					      &props);
>> +	if (ret)
>> +		goto err_free_handler;
>> +
>> +	/* Use same lock for controls as for everything else. */
>> +	ov5693->ctrls.handler.lock = &ov5693->lock;
>> +	ov5693->sd.ctrl_handler = &ov5693->ctrls.handler;
>> +
>> +	return 0;
>> +
>> +err_free_handler:
>> +	v4l2_ctrl_handler_free(&ov5693->ctrls.handler);
>> +	return ret;
>> +}
>> +
>> +static int ov5693_configure_gpios(struct ov5693_device *ov5693)
>> +{
>> +	ov5693->reset = devm_gpiod_get_optional(ov5693->dev, "reset",
>> +						GPIOD_OUT_HIGH);
>> +	if (IS_ERR(ov5693->reset)) {
>> +		dev_err(ov5693->dev, "Error fetching reset GPIO\n");
>> +		return PTR_ERR(ov5693->reset);
>> +	}
>> +
>> +	ov5693->powerdown = devm_gpiod_get_optional(ov5693->dev, "powerdown",
>> +						    GPIOD_OUT_HIGH);
>> +	if (IS_ERR(ov5693->powerdown)) {
>> +		dev_err(ov5693->dev, "Error fetching powerdown GPIO\n");
>> +		return PTR_ERR(ov5693->powerdown);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov5693_get_regulators(struct ov5693_device *ov5693)
>> +{
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < OV5693_NUM_SUPPLIES; i++)
>> +		ov5693->supplies[i].supply = ov5693_supply_names[i];
>> +
>> +	return devm_regulator_bulk_get(ov5693->dev, OV5693_NUM_SUPPLIES,
>> +				       ov5693->supplies);
>> +}
>> +
>> +static int ov5693_probe(struct i2c_client *client)
>> +{
>> +	struct fwnode_handle *fwnode = dev_fwnode(&client->dev);
>> +	struct fwnode_handle *endpoint;
>> +	struct ov5693_device *ov5693;
>> +	u32 clk_rate;
>> +	int ret = 0;
>> +
>> +	endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
>> +	if (!endpoint && !IS_ERR_OR_NULL(fwnode->secondary))
>> +		endpoint = fwnode_graph_get_next_endpoint(fwnode->secondary, NULL);
>> +	if (!endpoint)
>> +		return -EPROBE_DEFER;
>> +
>> +	ov5693 = devm_kzalloc(&client->dev, sizeof(*ov5693), GFP_KERNEL);
>> +	if (!ov5693)
>> +		return -ENOMEM;
>> +
>> +	ov5693->client = client;
>> +	ov5693->dev = &client->dev;
>> +
>> +	mutex_init(&ov5693->lock);
>> +
>> +	v4l2_i2c_subdev_init(&ov5693->sd, client, &ov5693_ops);
>> +
>> +	ov5693->clk = devm_clk_get(&client->dev, "xvclk");
>> +	if (IS_ERR(ov5693->clk)) {
>> +		dev_err(&client->dev, "Error getting clock\n");
>> +		return PTR_ERR(ov5693->clk);
>> +	}
>> +
>> +	clk_rate = clk_get_rate(ov5693->clk);
>> +	if (clk_rate != OV5693_XVCLK_FREQ) {
>> +		dev_err(&client->dev, "Unsupported clk freq %u, expected %u\n",
>> +			clk_rate, OV5693_XVCLK_FREQ);
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = ov5693_configure_gpios(ov5693);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ov5693_get_regulators(ov5693);
>> +	if (ret) {
>> +		dev_err(&client->dev, "Error fetching regulators\n");
>> +		return ret;
>> +	}
>> +
>> +	ov5693->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +	ov5693->pad.flags = MEDIA_PAD_FL_SOURCE;
>> +	ov5693->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>> +	ov5693->mode = &ov5693_resolutions[OV5693_NUM_RESOLUTIONS - 1];
>> +
>> +	ret = ov5693_init_controls(ov5693);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = media_entity_pads_init(&ov5693->sd.entity, 1, &ov5693->pad);
>> +	if (ret)
>> +		goto err_ctrl_handler_free;
>> +
>> +	/*
>> +	 * We need the driver to work in the event that pm runtime is disable in
>> +	 * the kernel, so power up and verify the chip now. In the event that
>> +	 * runtime pm is disabled this will leave the chip on, so that streaming
>> +	 * will work.
>> +	 */
>> +
>> +	ret = ov5693_sensor_powerup(ov5693);
>> +	if (ret)
>> +		goto err_media_entity_cleanup;
>> +
>> +	ret = ov5693_detect(ov5693);
>> +	if (ret)
>> +		goto err_powerdown;
>> +
>> +	pm_runtime_set_active(&client->dev);
>> +	pm_runtime_get_noresume(&client->dev);
>> +	pm_runtime_enable(&client->dev);
>> +
>> +	ret = v4l2_async_register_subdev_sensor_common(&ov5693->sd);
>> +	if (ret) {
>> +		dev_err(&client->dev, "failed to register V4L2 subdev: %d",
>> +			ret);
>> +		goto err_pm_runtime;
>> +	}
>> +
>> +	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
>> +	pm_runtime_use_autosuspend(&client->dev);
>> +	pm_runtime_put_autosuspend(&client->dev);
>> +
>> +	return ret;
>> +
>> +err_pm_runtime:
>> +	pm_runtime_disable(&client->dev);
>> +	pm_runtime_put_noidle(&client->dev);
>> +err_powerdown:
>> +	ov5693_sensor_powerdown(ov5693);
>> +err_media_entity_cleanup:
>> +	media_entity_cleanup(&ov5693->sd.entity);
>> +err_ctrl_handler_free:
>> +	v4l2_ctrl_handler_free(&ov5693->ctrls.handler);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ov5693_remove(struct i2c_client *client)
>> +{
>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>> +	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
>> +
>> +	v4l2_async_unregister_subdev(sd);
>> +	media_entity_cleanup(&ov5693->sd.entity);
>> +	v4l2_ctrl_handler_free(&ov5693->ctrls.handler);
>> +	mutex_destroy(&ov5693->lock);
>> +
>> +	/*
>> +	 * Disable runtime PM. In case runtime PM is disabled in the kernel,
>> +	 * make sure to turn power off manually.
>> +	 */
>> +	pm_runtime_disable(&client->dev);
>> +	if (!pm_runtime_status_suspended(&client->dev))
>> +		ov5693_sensor_powerdown(ov5693);
>> +	pm_runtime_set_suspended(&client->dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct dev_pm_ops ov5693_pm_ops = {
>> +	SET_RUNTIME_PM_OPS(ov5693_sensor_suspend, ov5693_sensor_resume, NULL)
>> +};
>> +
>> +static const struct acpi_device_id ov5693_acpi_match[] = {
>> +	{"INT33BE"},
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(acpi, ov5693_acpi_match);
>> +
>> +static struct i2c_driver ov5693_driver = {
>> +	.driver = {
>> +		.name = "ov5693",
>> +		.acpi_match_table = ov5693_acpi_match,
>> +		.pm = &ov5693_pm_ops,
>> +	},
>> +	.probe_new = ov5693_probe,
>> +	.remove = ov5693_remove,
>> +};
>> +module_i2c_driver(ov5693_driver);
>> +
>> +MODULE_DESCRIPTION("A low-level driver for OmniVision 5693 sensors");
>> +MODULE_LICENSE("GPL");
