Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D69E335561A
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 16:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233007AbhDFOJC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 10:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232113AbhDFOJB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Apr 2021 10:09:01 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51326C06174A;
        Tue,  6 Apr 2021 07:08:53 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id r12so22184220ejr.5;
        Tue, 06 Apr 2021 07:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=VkeqqjUAiNVCY8EGbEmFJ+nUhs9s2/rE6jia0RQWtQo=;
        b=iKFoOZBVikkfRw2vP025nzmDqEFx8i2xZeLHrJBB9lKKkjZmOSDJ3uVuVm5Er8u/lJ
         bV+2nANj5o5TmOXLAyVxeB45rOaXojb2WS+gAaCVvgNmqTGkhUKV+dgIYZhe7xoFeH5D
         IsvFS5z8vzA8LvBV/e6b1tdbBHEJev+n4YjQg/0Y5OMgfXTeutci46d4mmt1tX6xD2QD
         Fvvn0Rf4wdXmEoMf/UXraZqbKUNCHotTZgz6Qbir0HLQAqPnjyVUDDPl7BG4/M8N0cC9
         6WUMBxZ6KM/wTuaLMyDyamAa4OuYXVtk4RRp5BqE/64ObCMmrTgKkNmQKscM+DXCeYy/
         oweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=VkeqqjUAiNVCY8EGbEmFJ+nUhs9s2/rE6jia0RQWtQo=;
        b=BXyu+2OlHCuQby7gUjsPxLZ4jg4d5sTJbhqNI1Fwq6wutzveUfQyPnVSJvPinKs5bc
         8kBeHjKCBXpvjQCsQXAYzYQxjerS95zNKymYWHCx128wLqQi11seQZXvoS43N2DId7J2
         W8NKdNMS1Q3Ticjqvnoql2aSCsl3YuYTmOUDEjBbuLtWB48p2uvwO6MWaIuP6UQncFdX
         5hvIfIQrrNI/rvv8k7f5AjtF+76kVjM5/qf8My5q9HYlJTt2sh24fM52PEhNhDPKbeRc
         FB8IUZVBzwR7PomX+V2txmqAx375qrmc53oE0GpjrhX6O6nhdev3OpqtlqKpY/bx10t2
         bjqQ==
X-Gm-Message-State: AOAM533OlK9j2rCFnAnVvJQodbD1YOBEIbApkfX8D4C+KGlVap4GHKgN
        sxTwDm4+LH+H/EN6YOAV8ow=
X-Google-Smtp-Source: ABdhPJzH58IDhWpWrbsE+6xeoR/KJ2htLTtd9IGpx4PXoj63rakb2HRSXIUd4rBmwYurnRgSbwkgJA==
X-Received: by 2002:a17:906:7150:: with SMTP id z16mr33585434ejj.103.1617718131762;
        Tue, 06 Apr 2021 07:08:51 -0700 (PDT)
Received: from [192.168.1.211] ([2.29.208.21])
        by smtp.gmail.com with ESMTPSA id h24sm11139532ejl.9.2021.04.06.07.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Apr 2021 07:08:50 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] media: i2c: Add support for ov5693 sensor
To:     Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com
Cc:     tian.shu.qiu@intel.com, kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, jacopo+renesas@jmondi.org,
        dongchun.zhu@mediatek.com, niklas.soderlund+renesas@ragnatech.se,
        me@fabwu.ch, luzmaximilian@gmail.com, kitakar@gmail.com
References: <20210405225654.126916-1-djrscally@gmail.com>
 <20210405225654.126916-3-djrscally@gmail.com>
 <8de181dd-c5f4-1d7a-bbd9-21e6d0b00915@ideasonboard.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <098c22a9-2b6c-ed7a-e7c4-8fced6dbcb6b@gmail.com>
Date:   Tue, 6 Apr 2021 15:08:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8de181dd-c5f4-1d7a-bbd9-21e6d0b00915@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi JM!

On 06/04/2021 14:54, Jean-Michel Hautbois wrote:
> Hello Daniel !
>
> Thanks for the patch !
>
> On 06/04/2021 00:56, Daniel Scally wrote:
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
>> Changes in v2:
>>
>> 	- Removed HDR mode from the exposure configure function, as it's not
>> 	necessary and seemed to be causing frame sync errors.
>> 	- Switched from a mode based driver to use the .s_selection() API. At
>> 	the moment scaler support is lacking so .s_fmt() is limited to the crop
>> 	rectangle or those dimensions binned (separately) by 2.
>> 	- Switched to i2c_transfer() in ov5693_read_reg()
>> 	- Lots of more minor cleanup.
>>
>> Jacopo; I thought that the changes were significant enough that I should drop
>> your R-b, so I did.
>>
>>  MAINTAINERS                |    7 +
>>  drivers/media/i2c/Kconfig  |   11 +
>>  drivers/media/i2c/Makefile |    1 +
>>  drivers/media/i2c/ov5693.c | 1557 ++++++++++++++++++++++++++++++++++++
>>  4 files changed, 1576 insertions(+)
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
>> index 000000000000..da2ca99a7ad3
>> --- /dev/null
>> +++ b/drivers/media/i2c/ov5693.c
>> @@ -0,0 +1,1557 @@
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
>> +#include <asm/unaligned.h>
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
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-fwnode.h>
>> +
>> +/* System Control */
>> +#define OV5693_SW_RESET_REG			0x0103
>> +#define OV5693_SW_STREAM_REG			0x0100
>> +#define OV5693_START_STREAMING			0x01
>> +#define OV5693_STOP_STREAMING			0x00
>> +#define OV5693_SW_RESET				0x01
>> +
>> +#define OV5693_REG_CHIP_ID_H			0x300a
>> +#define OV5693_REG_CHIP_ID_L			0x300b
>> +/* Yes, this is right. The datasheet for the OV5693 gives its ID as 0x5690 */
>> +#define OV5693_CHIP_ID				0x5690
>> +
>> +/* Exposure */
>> +#define OV5693_EXPOSURE_L_CTRL_HH_REG		0x3500
>> +#define OV5693_EXPOSURE_L_CTRL_H_REG		0x3501
>> +#define OV5693_EXPOSURE_L_CTRL_L_REG		0x3502
>> +#define OV5693_EXPOSURE_CTRL_HH(v)		(((v) & GENMASK(14, 12)) >> 12)
>> +#define OV5693_EXPOSURE_CTRL_H(v)		(((v) & GENMASK(11, 4)) >> 4)
>> +#define OV5693_EXPOSURE_CTRL_L(v)		(((v) & GENMASK(3, 0)) << 4)
>> +#define OV5693_INTEGRATION_TIME_MARGIN		8
>> +#define OV5693_EXPOSURE_MIN			1
>> +#define OV5693_EXPOSURE_STEP			1
>> +
>> +/* Analogue Gain */
>> +#define OV5693_GAIN_CTRL_H_REG			0x350a
>> +#define OV5693_GAIN_CTRL_H(v)			(((v) >> 4) & GENMASK(2, 0))
>> +#define OV5693_GAIN_CTRL_L_REG			0x350b
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
>> +#define OV5693_FIXED_PPL			2688U
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
>> +#define OV5693_NATIVE_WIDTH			2624
>> +#define OV5693_NATIVE_HEIGHT			1956
>> +#define OV5693_NATIVE_START_LEFT		0
>> +#define OV5693_NATIVE_START_TOP			0
>> +#define OV5693_ACTIVE_WIDTH			2592
>> +#define OV5693_ACTIVE_HEIGHT			1944
>> +#define OV5693_ACTIVE_START_LEFT		16
>> +#define OV5693_ACTIVE_START_TOP			6
>> +#define OV5693_MIN_CROP_WIDTH			2
>> +#define OV5693_MIN_CROP_HEIGHT			2
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
> I am observing issues here on my SGo2 :
> [23001.302435] ipu3-cio2 0000:00:14.3: CSI-2 receiver port 1: escape
> mode ultra-low power state exit for clock lane
> [23123.835081] ipu3-cio2 0000:00:14.3: CSI-2 receiver port 1: escape
> mode ultra-low power state exit for clock lane
> [23193.128540] ipu3-cio2 0000:00:14.3: CSI-2 receiver port 1: escape
> mode ultra-low power state exit for clock lane
> [23372.517479] ipu3-cio2 0000:00:14.3: CSI-2 receiver port 1: escape
> mode ultra-low power state exit for clock lane
> [23372.595964] ipu3-cio2 0000:00:14.3: CSI-2 receiver port 1: escape
> mode error
> [23384.351675] ipu3-cio2 0000:00:14.3: CSI-2 receiver port 1: payload
> checksum (CRC) error
> [23384.351695] ipu3-cio2 0000:00:14.3: CSI-2 receiver port 1: escape
> mode ultra-low power state exit for clock lane
>
> Those messages appear when starting the capture.


Ah; thanks - I had meant to mention this in the changelog; mea culpa. I
still can't replicate them unfortunately, not sure how to diagnose this
one.

> I can see you are fixing the frequency and pixel rates, but can't find
> anything related to them in the PLL configuration below ?
>
> If I am not mistaken you have the exact same PLL configuration as
> atomisp initial implementation ?


Yes; it seemed to be correct for a 19.2MHz input clock which is what we
have, so after looking through it all I left it as it was.

>> +/* Miscellaneous */
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
>> +	struct ov5693_mode {
>> +		struct v4l2_rect crop;
>> +		struct v4l2_mbus_framefmt format;
>> +		bool binning_x;
>> +		bool binning_y;
>> +		unsigned int inc_x_odd;
>> +		unsigned int inc_y_odd;
>> +		unsigned int vts;
>> +	} mode;
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
> According to the OV5693 datasheet, it would give us a MIPI_SCLK of
> 800MHz (30b6 = 0x01 => /1).
> 19,2 / 3 * 125 / 1 = 800MHz.
>
> It does not solve my issue though ;-)


Yeah; I think this is right - when I checked some other drivers they too
have the PLL outputting MIPI SCLK as double the listed link frequency,
which Laurent explained as being because the CSI link is DDR but the
internals of the chip are not. Makes sense even though it looks a bit weird.

>
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
>> +static const struct v4l2_rect ov5693_default_crop = {
>> +	.left = OV5693_ACTIVE_START_LEFT,
>> +	.top = OV5693_ACTIVE_START_TOP,
>> +	.width = OV5693_ACTIVE_WIDTH,
>> +	.height = OV5693_ACTIVE_HEIGHT,
>> +};
>> +
>> +static const struct v4l2_mbus_framefmt ov5693_default_fmt = {
>> +	.width = OV5693_ACTIVE_WIDTH,
>> +	.height = OV5693_ACTIVE_HEIGHT,
>> +	.code = MEDIA_BUS_FMT_SBGGR10_1X10,
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
>> +	struct i2c_client *client = ov5693->client;
>> +	struct i2c_msg msgs[2];
>> +	u8 addr_buf[2];
>> +	u8 data_buf;
>> +	int ret;
>> +
>> +	put_unaligned_be16(addr, addr_buf);
>> +
>> +	/* Write register address */
>> +	msgs[0].addr = client->addr;
>> +	msgs[0].flags = 0;
>> +	msgs[0].len = ARRAY_SIZE(addr_buf);
>> +	msgs[0].buf = addr_buf;
>> +
>> +	/* Read register value */
>> +	msgs[1].addr = client->addr;
>> +	msgs[1].flags = I2C_M_RD;
>> +	msgs[1].len = 1;
>> +	msgs[1].buf = &data_buf;
>> +
>> +	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
>> +	if (ret != ARRAY_SIZE(msgs))
>> +		return -EIO;
>> +
>> +	*value = data_buf;
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
>> +
>> +	return ret;
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
>> +	ov5693_write_reg(ov5693, OV5693_EXPOSURE_L_CTRL_HH_REG,
>> +			 OV5693_EXPOSURE_CTRL_HH(exposure), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_EXPOSURE_L_CTRL_H_REG,
>> +			 OV5693_EXPOSURE_CTRL_H(exposure), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_EXPOSURE_L_CTRL_L_REG,
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
>> +	u16 vts = ov5693->mode.format.height + vblank;
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
>> +		exposure_max = ov5693->mode.format.height + ctrl->val -
>> +			       OV5693_INTEGRATION_TIME_MARGIN;
>> +		__v4l2_ctrl_modify_range(ov5693->ctrls.exposure,
>> +					 ov5693->ctrls.exposure->minimum,
>> +					 exposure_max,
>> +					 ov5693->ctrls.exposure->step,
>> +					 min(ov5693->ctrls.exposure->val, exposure_max));
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
>> +	const struct ov5693_mode *mode = &ov5693->mode;
>> +	int ret = 0;
>> +
>> +	/* Crop Start X */
>> +	ov5693_write_reg(ov5693, OV5693_CROP_START_X_H_REG,
>> +			 OV5693_CROP_START_X_H(mode->crop.left), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_CROP_START_X_L_REG,
>> +			 OV5693_CROP_START_X_L(mode->crop.left), &ret);
>> +
>> +	/* Offset X */
>> +	ov5693_write_reg(ov5693, OV5693_OFFSET_START_X_H_REG,
>> +			 OV5693_OFFSET_START_X_H(0), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_OFFSET_START_X_L_REG,
>> +			 OV5693_OFFSET_START_X_L(0), &ret);
>> +
>> +	/* Output Size X */
>> +	ov5693_write_reg(ov5693, OV5693_OUTPUT_SIZE_X_H_REG,
>> +			 OV5693_OUTPUT_SIZE_X_H(mode->format.width), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_OUTPUT_SIZE_X_L_REG,
>> +			 OV5693_OUTPUT_SIZE_X_L(mode->format.width), &ret);
>> +
>> +	/* Crop End X */
>> +	ov5693_write_reg(ov5693, OV5693_CROP_END_X_H_REG,
>> +			 OV5693_CROP_END_X_H(mode->crop.left + mode->crop.width),
>> +			 &ret);
>> +	ov5693_write_reg(ov5693, OV5693_CROP_END_X_L_REG,
>> +			 OV5693_CROP_END_X_L(mode->crop.left + mode->crop.width),
>> +			 &ret);
>> +
>> +	/* Horizontal Total Size */
>> +	ov5693_write_reg(ov5693, OV5693_TIMING_HTS_H_REG,
>> +			 OV5693_TIMING_HTS_H(OV5693_FIXED_PPL), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_TIMING_HTS_L_REG,
>> +			 OV5693_TIMING_HTS_L(OV5693_FIXED_PPL), &ret);
>> +
>> +	/* Crop Start Y */
>> +	ov5693_write_reg(ov5693, OV5693_CROP_START_Y_H_REG,
>> +			 OV5693_CROP_START_Y_H(mode->crop.top), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_CROP_START_Y_L_REG,
>> +			 OV5693_CROP_START_Y_L(mode->crop.top), &ret);
>> +
>> +	/* Offset Y */
>> +	ov5693_write_reg(ov5693, OV5693_OFFSET_START_Y_H_REG,
>> +			 OV5693_OFFSET_START_Y_H(0), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_OFFSET_START_Y_L_REG,
>> +			 OV5693_OFFSET_START_Y_L(0), &ret);
>> +
>> +	/* Output Size Y */
>> +	ov5693_write_reg(ov5693, OV5693_OUTPUT_SIZE_Y_H_REG,
>> +			 OV5693_OUTPUT_SIZE_Y_H(mode->format.height), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_OUTPUT_SIZE_Y_L_REG,
>> +			 OV5693_OUTPUT_SIZE_Y_L(mode->format.height), &ret);
>> +
>> +	/* Crop End Y */
>> +	ov5693_write_reg(ov5693, OV5693_CROP_END_Y_H_REG,
>> +			 OV5693_CROP_END_Y_H(mode->crop.top + mode->crop.height),
>> +			 &ret);
>> +	ov5693_write_reg(ov5693, OV5693_CROP_END_Y_L_REG,
>> +			 OV5693_CROP_END_Y_L(mode->crop.top + mode->crop.height),
>> +			 &ret);
>> +
>> +	/* Vertical Total Size */
>> +	ov5693_write_reg(ov5693, OV5693_TIMING_VTS_H_REG,
>> +			 OV5693_TIMING_VTS_H(mode->vts), &ret);
>> +	ov5693_write_reg(ov5693, OV5693_TIMING_VTS_L_REG,
>> +			 OV5693_TIMING_VTS_L(mode->vts), &ret);
>> +
>> +	/* Subsample X increase */
>> +	ov5693_write_reg(ov5693, OV5693_SUB_INC_X_REG,
>> +			 ((mode->inc_x_odd << 4) & 0xf0) | 0x01, &ret);
>> +	/* Subsample Y increase */
>> +	ov5693_write_reg(ov5693, OV5693_SUB_INC_Y_REG,
>> +			 ((mode->inc_y_odd << 4) & 0xf0) | 0x01, &ret);
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
>> +	int ret;
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
>> +	gpiod_set_value_cansleep(ov5693->powerdown, 0);
>> +	gpiod_set_value_cansleep(ov5693->reset, 0);
>> +
>> +	usleep_range(5000, 7500);
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
>> +
>> +	ov5693_sensor_powerdown(ov5693);
>> +
>> +	return 0;
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
>> +static unsigned int __ov5693_calc_vts(u32 height)
>> +{
>> +	/*
>> +	 * We need to set a sensible default VTS for whatever format height we
>> +	 * happen to be given from set_fmt(). This function just targets
>> +	 * an even multiple of 30fps.
>> +	 */
>> +
>> +	unsigned int tgt_fps;
>> +
>> +	tgt_fps = rounddown(OV5693_PIXEL_RATE / OV5693_FIXED_PPL / height, 30);
>> +
>> +	return ALIGN_DOWN(OV5693_PIXEL_RATE / OV5693_FIXED_PPL / tgt_fps, 2);
>> +}
>> +
>> +static struct v4l2_mbus_framefmt *
>> +__ov5693_get_pad_format(struct ov5693_device *ov5693,
>> +			struct v4l2_subdev_pad_config *cfg,
>> +			unsigned int pad, enum v4l2_subdev_format_whence which)
>> +{
>> +	switch (which) {
>> +	case V4L2_SUBDEV_FORMAT_TRY:
>> +		return v4l2_subdev_get_try_format(&ov5693->sd, cfg, pad);
>> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
>> +		return &ov5693->mode.format;
>> +	default:
>> +		return NULL;
>> +	}
>> +}
>> +
>> +static struct v4l2_rect *
>> +__ov5693_get_pad_crop(struct ov5693_device *ov5693,
>> +		      struct v4l2_subdev_pad_config *cfg,
>> +		      unsigned int pad, enum v4l2_subdev_format_whence which)
>> +{
>> +	switch (which) {
>> +	case V4L2_SUBDEV_FORMAT_TRY:
>> +		return v4l2_subdev_get_try_crop(&ov5693->sd, cfg, pad);
>> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
>> +		return &ov5693->mode.crop;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static int ov5693_get_fmt(struct v4l2_subdev *sd,
>> +			  struct v4l2_subdev_pad_config *cfg,
>> +			  struct v4l2_subdev_format *format)
>> +{
>> +	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
>> +
>> +	format->format = ov5693->mode.format;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov5693_set_fmt(struct v4l2_subdev *sd,
>> +			  struct v4l2_subdev_pad_config *cfg,
>> +			  struct v4l2_subdev_format *format)
>> +{
>> +	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
>> +	const struct v4l2_rect *crop;
>> +	struct v4l2_mbus_framefmt *fmt;
>> +	unsigned int hratio, vratio;
>> +	unsigned int width, height;
>> +	unsigned int hblank;
>> +	int exposure_max;
>> +	int ret = 0;
>> +
>> +	crop = __ov5693_get_pad_crop(ov5693, cfg, format->pad, format->which);
>> +
>> +	/*
>> +	 * Align to two to simplify the binning calculations below, and clamp
>> +	 * the requested format at the crop rectangle
>> +	 */
>> +	width = clamp_t(unsigned int, ALIGN(format->format.width, 2),
>> +			OV5693_MIN_CROP_WIDTH, crop->width);
>> +	height = clamp_t(unsigned int, ALIGN(format->format.height, 2),
>> +			 OV5693_MIN_CROP_HEIGHT, crop->height);
>> +
>> +	/*
>> +	 * We can only support setting either the dimensions of the crop rect
>> +	 * or those dimensions binned (separately) by a factor of two.
>> +	 */
>> +	hratio = clamp_t(unsigned int, DIV_ROUND_CLOSEST(crop->width, width), 1, 2);
>> +	vratio = clamp_t(unsigned int, DIV_ROUND_CLOSEST(crop->height, height), 1, 2);
>> +
>> +	fmt = __ov5693_get_pad_format(ov5693, cfg, format->pad, format->which);
>> +
>> +	fmt->width = crop->width / hratio;
>> +	fmt->height = crop->height / vratio;
>> +	fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
>> +
>> +	format->format = *fmt;
>> +
>> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
>> +		return ret;
>> +
>> +	mutex_lock(&ov5693->lock);
>> +
>> +	ov5693->mode.binning_x = hratio > 1 ? true : false;
>> +	ov5693->mode.inc_x_odd = hratio > 1 ? 3 : 1;
>> +	ov5693->mode.binning_y = vratio > 1 ? true : false;
>> +	ov5693->mode.inc_y_odd = vratio > 1 ? 3 : 1;
>> +
>> +	ov5693->mode.vts = __ov5693_calc_vts(fmt->height);
>> +
>> +	__v4l2_ctrl_modify_range(ov5693->ctrls.vblank,
>> +				 OV5693_TIMING_MIN_VTS,
>> +				 OV5693_TIMING_MAX_VTS - fmt->height,
>> +				 1, ov5693->mode.vts - fmt->height);
>> +	__v4l2_ctrl_s_ctrl(ov5693->ctrls.vblank,
>> +			   ov5693->mode.vts - fmt->height);
>> +
>> +	hblank = OV5693_FIXED_PPL - fmt->width;
>> +	__v4l2_ctrl_modify_range(ov5693->ctrls.hblank, hblank, hblank, 1,
>> +				 hblank);
>> +
>> +	exposure_max = ov5693->mode.vts - OV5693_INTEGRATION_TIME_MARGIN;
>> +	__v4l2_ctrl_modify_range(ov5693->ctrls.exposure,
>> +				 ov5693->ctrls.exposure->minimum, exposure_max,
>> +				 ov5693->ctrls.exposure->step,
>> +				 min(ov5693->ctrls.exposure->val, exposure_max));
>> +
>> +	mutex_unlock(&ov5693->lock);
>> +	return ret;
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
>> +		sel->r = *__ov5693_get_pad_crop(ov5693, cfg, sel->pad,
>> +						sel->which);
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
>> +static int ov5693_set_selection(struct v4l2_subdev *sd,
>> +				struct v4l2_subdev_pad_config *cfg,
>> +				struct v4l2_subdev_selection *sel)
>> +{
>> +	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
>> +	struct v4l2_mbus_framefmt *format;
>> +	struct v4l2_rect *__crop;
>> +	struct v4l2_rect rect;
>> +
>> +	if (sel->target != V4L2_SEL_TGT_CROP)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * Clamp the boundaries of the crop rectangle to the size of the sensor
>> +	 * pixel array. Align to multiples of 2 to ensure Bayer pattern isn't
>> +	 * disrupted.
>> +	 */
>> +	rect.left = clamp(ALIGN(sel->r.left, 2), OV5693_NATIVE_START_LEFT,
>> +			  OV5693_NATIVE_WIDTH);
>> +	rect.top = clamp(ALIGN(sel->r.top, 2), OV5693_NATIVE_START_TOP,
>> +			 OV5693_NATIVE_HEIGHT);
>> +	rect.width = clamp_t(unsigned int, ALIGN(sel->r.width, 2),
>> +			     OV5693_MIN_CROP_WIDTH, OV5693_NATIVE_WIDTH);
>> +	rect.height = clamp_t(unsigned int, ALIGN(sel->r.height, 2),
>> +			      OV5693_MIN_CROP_HEIGHT, OV5693_NATIVE_HEIGHT);
>> +
>> +	/* Make sure the crop rectangle isn't outside the bounds of the array */
>> +	rect.width = min_t(unsigned int, rect.width,
>> +			   OV5693_NATIVE_WIDTH - rect.left);
>> +	rect.height = min_t(unsigned int, rect.height,
>> +			    OV5693_NATIVE_HEIGHT - rect.top);
>> +
>> +	__crop = __ov5693_get_pad_crop(ov5693, cfg, sel->pad, sel->which);
>> +
>> +	if (rect.width != __crop->width || rect.height != __crop->height) {
>> +		/*
>> +		 * Reset the output image size if the crop rectangle size has
>> +		 * been modified.
>> +		 */
>> +		format = __ov5693_get_pad_format(ov5693, cfg, sel->pad, sel->which);
>> +		format->width = rect.width;
>> +		format->height = rect.height;
>> +	}
>> +
>> +	*__crop = rect;
>> +	sel->r = rect;
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
>> +
>> +		ret = __v4l2_ctrl_handler_setup(&ov5693->ctrls.handler);
>> +		if (ret)
>> +			goto err_power_down;
>> +	}
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
>> +	unsigned int framesize = OV5693_FIXED_PPL * (ov5693->mode.format.height +
>> +				 ov5693->ctrls.vblank->val);
>> +	unsigned int fps = DIV_ROUND_CLOSEST(OV5693_PIXEL_RATE, framesize);
>> +
>> +	interval->interval.numerator = 1;
>> +	interval->interval.denominator = fps;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov5693_enum_mbus_code(struct v4l2_subdev *sd,
>> +				 struct v4l2_subdev_pad_config *cfg,
>> +				 struct v4l2_subdev_mbus_code_enum *code)
>> +{
>> +	/* Only a single mbus format is supported */
>> +	if (code->index > 0)
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
>> +	struct ov5693_device *ov5693 = to_ov5693_sensor(sd);
>> +	struct v4l2_rect *__crop;
>> +
>> +	if (fse->index > 1 || fse->code != MEDIA_BUS_FMT_SBGGR10_1X10)
>> +		return -EINVAL;
>> +
>> +	__crop = __ov5693_get_pad_crop(ov5693, cfg, fse->pad, fse->which);
>> +	if (!__crop)
>> +		return -EINVAL;
>> +
>> +	fse->min_width = __crop->width / (fse->index + 1);
>> +	fse->min_height = __crop->height / (fse->index + 1);
>> +	fse->max_width = fse->min_width;
>> +	fse->max_height = fse->min_height;
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
>> +	.set_selection = ov5693_set_selection,
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
>> +	ret = v4l2_ctrl_handler_init(&ov5693->ctrls.handler, 12);
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
>> +	exposure_max = ov5693->mode.vts - OV5693_INTEGRATION_TIME_MARGIN;
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
>> +
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
>> +
>> +	ov5693->ctrls.vflip = v4l2_ctrl_new_std(&ov5693->ctrls.handler, ops,
>> +						V4L2_CID_VFLIP, 0, 1, 1, 0);
>> +
>> +	hblank = OV5693_FIXED_PPL - ov5693->mode.format.width;
>> +	ov5693->ctrls.hblank = v4l2_ctrl_new_std(&ov5693->ctrls.handler, ops,
>> +						 V4L2_CID_HBLANK, hblank,
>> +						 hblank, 1, hblank);
>> +
>> +	if (ov5693->ctrls.hblank)
>> +		ov5693->ctrls.hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> +
>> +	vblank_max = OV5693_TIMING_MAX_VTS - ov5693->mode.format.height;
>> +	vblank_def = ov5693->mode.vts - ov5693->mode.format.height;
>> +	ov5693->ctrls.vblank = v4l2_ctrl_new_std(&ov5693->ctrls.handler, ops,
>> +						 V4L2_CID_VBLANK,
>> +						 OV5693_TIMING_MIN_VTS,
>> +						 vblank_max, 1, vblank_def);
>> +
>> +	ov5693->ctrls.test_pattern = v4l2_ctrl_new_std_menu_items(
>> +					&ov5693->ctrls.handler, ops,
>> +					V4L2_CID_TEST_PATTERN,
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
>> +
>> +	ov5693->mode.crop = ov5693_default_crop;
>> +	ov5693->mode.format = ov5693_default_fmt;
>> +	ov5693->mode.vts = __ov5693_calc_vts(ov5693->mode.format.height);
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
>>
