Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE2B24E609E
	for <lists+linux-media@lfdr.de>; Thu, 24 Mar 2022 09:48:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344839AbiCXIuI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Mar 2022 04:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344084AbiCXIuH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Mar 2022 04:50:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B4762DD51
        for <linux-media@vger.kernel.org>; Thu, 24 Mar 2022 01:48:33 -0700 (PDT)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8321612E9;
        Thu, 24 Mar 2022 09:48:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1648111712;
        bh=OxyrLfyreKjMOX3OxXjyEg+0zf9RlsOGjuQ4+NRKW4M=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ZrMx5ojz04GlSs8c/7pPZZGj6fE3lwLwtXUOOqTEPFGDZiU1azupJXho25Ysv+8VC
         2jKA6I3gEcOSY/1/Jmwy6cDEoqOQH65nYMOM4NDvkIOpWrHloDVNb8DnUXUX9bHuqi
         iEQauiX1oUPDK1/6pAo9AJyKVq+IvH5sIlPWE/MU=
Message-ID: <178ed83d-8c7f-6117-067a-047db864cf99@ideasonboard.com>
Date:   Thu, 24 Mar 2022 10:48:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] media: i2c: Add OV1063x sensor driver
Content-Language: en-US
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benoit Parrot <bparrot@ti.com>, linux-media@vger.kernel.org
References: <20211206230717.5836-1-laurent.pinchart@ideasonboard.com>
 <20211206230717.5836-3-laurent.pinchart@ideasonboard.com>
 <b1a1fd6c-e203-3cab-e04b-ab67a9be40af@baylibre.com>
 <5a2b6171-e784-e40c-7142-b69d4b99fd77@baylibre.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <5a2b6171-e784-e40c-7142-b69d4b99fd77@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Neil,

On 23/03/2022 18:12, Neil Armstrong wrote:
> On 23/03/2022 15:01, Neil Armstrong wrote:
>> Hi Laurent,
>>
>>
>> On 07/12/2021 00:07, Laurent Pinchart wrote:
>>> Add a new V4L2 subdev driver for the OmniVision OV10633 and OV10635
>>> camera sensors. The work is based on the driver from the TI BSP, itself
>>> based on original work by Phil Edworthy posted to the linux-media
>>> mailing list ([1]). This version of the code is a large rewrite of many
>>> parts.
>>>
>>> [1] http://www.spinics.net/lists/linux-media/msg64347.html
>>>
>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>> Signed-off-by: Benoit Parrot <bparrot@ti.com>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> ---
>>> Changes since v1:
>>>
>>> - Drop unneeded debug message
>>> - Fix MODULE_LICENSE
>>> - Fix priv pointer retrieval in remove()
>>> - Add more registers macros
>>> - Fix PLL calculation
>>> - Update to subdev state API
>>> - Fix test pattern when starting streaming
>>> ---
>>>   MAINTAINERS                      |    2 +
>>>   drivers/media/i2c/Kconfig        |   12 +
>>>   drivers/media/i2c/Makefile       |    1 +
>>>   drivers/media/i2c/ov1063x.c      | 1716 ++++++++++++++++++++++++++++++
>>>   drivers/media/i2c/ov1063x_regs.h |  627 +++++++++++
>>>   5 files changed, 2358 insertions(+)
>>>   create mode 100644 drivers/media/i2c/ov1063x.c
>>>   create mode 100644 drivers/media/i2c/ov1063x_regs.h
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 9c7748b160dd..eb24dc54e046 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -14044,6 +14044,8 @@ L:    linux-media@vger.kernel.org
>>>   S:    Maintained
>>>   T:    git git://linuxtv.org/media_tree.git
>>>   F:    Documentation/devicetree/bindings/media/i2c/ov1063x.yaml
>>> +F:    drivers/media/i2c/ov1063x.c
>>> +F:    drivers/media/i2c/ov1063x_regs.h
>>>   OMNIVISION OV13858 SENSOR DRIVER
>>>   M:    Sakari Ailus <sakari.ailus@linux.intel.com>
>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>> index d6a5d4ca439a..7a0d7bd17a3c 100644
>>> --- a/drivers/media/i2c/Kconfig
>>> +++ b/drivers/media/i2c/Kconfig
>>> @@ -1192,6 +1192,18 @@ config VIDEO_OV9734
>>>         To compile this driver as a module, choose M here: the
>>>         module's name is ov9734.
>>> +config VIDEO_OV10633
>>> +    tristate "OmniVision OV10633/OV10635 sensor support"
>>> +    depends on I2C && VIDEO_V4L2
>>> +    depends on GPIOLIB && OF
>>> +    select MEDIA_CONTROLLER
>>> +    select REGMAP_I2C
>>> +    select V4L2_FWNODE
>>> +    select VIDEO_V4L2_SUBDEV_API
>>> +    help
>>> +      This is a Video4Linux2 driver for the OmniVision
>>> +      OV10633 and OV10635 camera sensors.
>>> +
>>>   config VIDEO_OV13858
>>>       tristate "OmniVision OV13858 sensor support"
>>>       depends on I2C && VIDEO_V4L2
>>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>>> index 4d4fe08d7a6a..a16299de56c0 100644
>>> --- a/drivers/media/i2c/Makefile
>>> +++ b/drivers/media/i2c/Makefile
>>> @@ -88,6 +88,7 @@ obj-$(CONFIG_VIDEO_OV9282) += ov9282.o
>>>   obj-$(CONFIG_VIDEO_OV9640) += ov9640.o
>>>   obj-$(CONFIG_VIDEO_OV9650) += ov9650.o
>>>   obj-$(CONFIG_VIDEO_OV9734) += ov9734.o
>>> +obj-$(CONFIG_VIDEO_OV10633) += ov1063x.o
>>>   obj-$(CONFIG_VIDEO_OV13858) += ov13858.o
>>>   obj-$(CONFIG_VIDEO_OV13B10) += ov13b10.o
>>>   obj-$(CONFIG_VIDEO_MT9M001) += mt9m001.o
>>> diff --git a/drivers/media/i2c/ov1063x.c b/drivers/media/i2c/ov1063x.c
>>> new file mode 100644
>>> index 000000000000..fb4ef5ea9a9f
>>> --- /dev/null
>>> +++ b/drivers/media/i2c/ov1063x.c
>>> @@ -0,0 +1,1716 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * OmniVision OV10633/OV10635 Camera Driver
>>> + *
>>> + * Based on the original driver written by Phil Edworthy.
>>> + * Copyright (C) 2013 Phil Edworthy
>>> + * Copyright (C) 2013 Renesas Electronics
>>> + * Copyright (C) 2018 Texas Instruments Incorporated - 
>>> http://www.ti.com/
>>> + * Copyright (C) 2020 Laurent Pinchart 
>>> <laurent.pinchart@ideasonboard.com>
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/gpio/consumer.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/init.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/v4l2-mediabus.h>
>>> +#include <linux/videodev2.h>
>>> +
>>> +#include <media/v4l2-common.h>
>>> +#include <media/v4l2-ctrls.h>
>>> +#include <media/v4l2-event.h>
>>> +#include <media/v4l2-fwnode.h>
>>> +#include <media/v4l2-subdev.h>
>>> +
>>> +/* Register definitions */
>>> +#define OV1063X_REG_8BIT(n)            ((1 << 16) | (n))
>>> +#define OV1063X_REG_16BIT(n)            ((2 << 16) | (n))
>>> +#define OV1063X_REG_24BIT(n)            ((3 << 16) | (n))
>>> +#define OV1063X_REG_32BIT(n)            ((4 << 16) | (n))
>>> +#define OV1063X_REG_SIZE_SHIFT            16
>>> +#define OV1063X_REG_ADDR_MASK            0xffff
>>> +
>>> +#define OV1063X_STREAM_MODE            OV1063X_REG_8BIT(0x0100)
>>> +#define OV1063X_STREAM_MODE_ON            BIT(0)
>>> +#define OV1063X_SOFTWARE_RESET            OV1063X_REG_8BIT(0x0103)
>>> +
>>> +#define OV1063X_SC_CMMN_PLL_CTRL0        OV1063X_REG_8BIT(0x3003)
>>> +#define OV1063X_SC_CMMN_PLL_SCLK_CP(n)        ((n) << 6)
>>> +#define OV1063X_SC_CMMN_PLL_SCLK_MULTI(n)    ((n) << 0)
>>> +#define OV1063X_SC_CMMN_PLL_CTRL1        OV1063X_REG_8BIT(0x3004)
>>> +#define OV1063X_SC_CMMN_PLL_SCLK_BYPASS        BIT(7)
>>> +#define OV1063X_SC_CMMN_PLL_SCLK_PRE_DIV(n)    ((n) << 4)    /* /1, 
>>> /1.5, /2, /3, /4, /5, /6, /7 */
>>> +#define OV1063X_SC_CMMN_PLL_SCLK_CP2(n)        ((n) << 3)
>>> +#define OV1063X_SC_CMMN_PLL_SCLK_DIV(n)        ((n) << 0)    /* 
>>> Divider = 2 * (1 + n) */
>>> +#define OV1063X_SC_CMMN_PLL_CTRL2        OV1063X_REG_8BIT(0x3005)
>>> +#define OV1063X_SC_CMMN_PLL_PCLK_CP(n)        ((n) << 6)
>>> +#define OV1063X_SC_CMMN_PLL_PCLK_MULTI(n)    ((n) << 0)
>>> +#define OV1063X_SC_CMMN_PLL_CTRL3        OV1063X_REG_8BIT(0x3006)
>>> +#define OV1063X_SC_CMMN_PLL_PCLK_BYPASS        BIT(7)
>>> +#define OV1063X_SC_CMMN_PLL_PCLK_PRE_DIV(n)    ((n) << 4)    /* /1, 
>>> /1.5, /2, /3, /4, /5, /6, /7 */
>>> +#define OV1063X_SC_CMMN_PLL_PCLK_CP2(n)        ((n) << 3)
>>> +#define OV1063X_SC_CMMN_PLL_PCLK_DIV(n)        ((n) << 0)    /* 
>>> Divider = 2 * (1 + n) */
>>> +#define OV1063X_SC_CMMN_PCLK_DIV_CTRL        OV1063X_REG_8BIT(0x3007)
>>> +#define OV1063X_PID                OV1063X_REG_16BIT(0x300a)
>>> +#define OV1063X_SC_CMMN_SCCB_ID            OV1063X_REG_8BIT(0x300c)
>>> +#define OV1063X_SC_CMMN_SCCB_ID_ADDR(n)        ((n) << 1)
>>> +#define OV1063X_SC_CMMN_SCCB_ID_SEL        BIT(0)
>>> +#define OV1063X_SC_CMMN_PAD            OV1063X_REG_8BIT(0x3011)
>>> +#define OV1063X_SC_CMMN_PAD_DRIVE(n)        ((n) << 6)
>>> +#define OV1063X_SC_CMMN_CLKRST0            OV1063X_REG_8BIT(0x301a)
>>> +#define OV1063X_SC_CMMN_CLKRST0_SCLK        GENMASK(7, 4)
>>> +#define OV1063X_SC_CMMN_CLKRST0_RST        GENMASK(3, 0)
>>> +#define OV1063X_SC_CMMN_CLKRST1            OV1063X_REG_8BIT(0x301b)
>>> +#define OV1063X_SC_CMMN_CLKRST1_SCLK        GENMASK(7, 4)
>>> +#define OV1063X_SC_CMMN_CLKRST1_RST        GENMASK(3, 0)
>>> +#define OV1063X_SC_CMMN_CLKRST2            OV1063X_REG_8BIT(0x301c)
>>> +#define OV1063X_SC_CMMN_CLKRST2_PCLK_DVP    BIT(7)
>>> +#define OV1063X_SC_CMMN_CLKRST2_SCLK        GENMASK(6, 4)
>>> +#define OV1063X_SC_CMMN_CLKRST2_RST_DVP        BIT(3)
>>> +#define OV1063X_SC_CMMN_CLKRST2_RST        GENMASK(2, 0)
>>> +#define OV1063X_SC_CMMN_CLOCK_SEL        OV1063X_REG_8BIT(0x3020)
>>> +#define OV1063X_SC_CMMN_CLOCK_SEL_SCLK2X    BIT(0)
>>> +#define OV1063X_SC_CMMN_MISC_CTRL        OV1063X_REG_8BIT(0x3021)
>>> +#define OV1063X_SC_CMMN_MISC_CTRL_PCLK_INV    BIT(7)
>>> +#define OV1063X_SC_CMMN_MISC_CTRL_SCLK_INV    BIT(6)
>>> +#define OV1063X_SC_CMMN_MISC_CTRL_SCLK2X_INV    BIT(5)
>>> +#define OV1063X_SC_CMMN_MISC_CTRL_CEN_GLOBAL_O    BIT(0)
>>> +#define OV1063X_SC_CMMN_CORE_CTRL_1        OV1063X_REG_8BIT(0x3022)
>>> +#define OV1063X_SC_CMMN_CORE_CTRL_2        OV1063X_REG_8BIT(0x3023)
>>> +#define OV1063X_SC_CMMN_CORE_CTRL_BIST_EN    BIT(5)
>>> +#define OV1063X_SC_CMMN_CORE_CTRL_CLK_SWITCH    BIT(4)
>>> +#define OV1063X_SC_CMMN_CORE_CTRL_3        OV1063X_REG_8BIT(0x3024)
>>> +#define OV1063X_SC_CMMN_CORE_CTRL_RAW_LONG    (0U << 4)
>>> +#define OV1063X_SC_CMMN_CORE_CTRL_RAW_SHORT    (1U << 4)
>>> +#define OV1063X_SC_CMMN_CORE_CTRL_RAW_LONG_SHORT    (2U << 4)
>>> +#define OV1063X_SC_CMMN_CORE_CTRL_RAW_COMBINED    (0U << 4)
>>> +#define OV1063X_SC_CMMN_CORE_CTRL_YUV_LONG    (1U << 1)
>>> +#define OV1063X_SC_CMMN_CORE_CTRL_YUV_SHORT    (2U << 1)
>>> +#define OV1063X_SC_CMMN_CORE_CTRL_PCLK_SYS    (0U << 0)    /* PCLK 
>>> from system PLL */
>>> +#define OV1063X_SC_CMMN_CORE_CTRL_PCLK_SEC    (1U << 0)    /* PCLK 
>>> from secondary PLL */
>>> +#define OV1063X_SC_CMMN_CORE_CTRL1        OV1063X_REG_8BIT(0x3025)
>>> +#define OV1063X_SC_CMMN_PWDN_CTRL2        OV1063X_REG_8BIT(0x302d)
>>> +#define OV1063X_SC_CMMN_PWDN_CTRL2_RST_DIG1    BIT(3)
>>> +#define OV1063X_SC_CMMN_PWDN_CTRL2_RST_DIG2    BIT(2)
>>> +#define OV1063X_SC_CMMN_PWDN_CTRL2_RST_ISP    BIT(1)
>>> +#define OV1063X_SC_CMMN_PWDN_CTRL2_SEQUENCE    BIT(0)
>>> +#define OV1063X_SC_CMMN_SCLK2X_SEL        OV1063X_REG_8BIT(0x3033)
>>> +#define OV1063X_SC_CMMN_SCLK2X_SEL_DIV2        (1U << 2)
>>> +#define OV1063X_SC_CMMN_SCLK2X_SEL_DIV4        (2U << 2)
>>> +#define OV1063X_SC_SOC_CLKRST7            OV1063X_REG_8BIT(0x3042)
>>> +#define OV1063X_SC_SOC_CLKRST7_SCLK        GENMASK(7, 4)
>>> +#define OV1063X_SC_SOC_CLKRST7_RST        GENMASK(3, 0)
>>> +
>>> +#define OV1063X_AEC_PK_MANUAL            OV1063X_REG_8BIT(0x3503)
>>> +#define OV1063X_AEC_PK_MANUAL_GAIN_DELAY    BIT(5)
>>> +#define OV1063X_AEC_PK_MANUAL_DELAY        BIT(4)
>>> +#define OV1063X_AEC_PK_MAN_DONE            OV1063X_REG_8BIT(0x3504)
>>> +#define OV1063X_AEC_PK_MAN_DONE_AEC_DONE    BIT(0)
>>> +
>>> +#define OV1063X_ANA_ADC1            OV1063X_REG_8BIT(0x3600)
>>> +#define OV1063X_ANA_ADC2            OV1063X_REG_8BIT(0x3601)
>>> +#define OV1063X_ANA_ADC3            OV1063X_REG_8BIT(0x3602)
>>> +#define OV1063X_ANA_ADC4            OV1063X_REG_8BIT(0x3603)
>>> +#define OV1063X_ANA_ANALOG1            OV1063X_REG_8BIT(0x3610)
>>> +#define OV1063X_ANA_ANALOG2            OV1063X_REG_8BIT(0x3611)
>>> +#define OV1063X_ANA_ANALOG3            OV1063X_REG_8BIT(0x3612)
>>> +#define OV1063X_ANA_ARRAY1            OV1063X_REG_8BIT(0x3621)
>>> +#define OV1063X_ANA_ARRAY1_FULL            (0 << 3)
>>> +#define OV1063X_ANA_ARRAY1_CROP_768        (1 << 3)
>>> +#define OV1063X_ANA_ARRAY1_CROP_656        (2 << 3)
>>> +#define OV1063X_ANA_ARRAY1_DELAY(n)        ((n) << 0)
>>> +#define OV1063X_ANA_PWC1            OV1063X_REG_8BIT(0x3630)
>>> +#define OV1063X_ANA_PWC2            OV1063X_REG_8BIT(0x3631)
>>> +#define OV1063X_ANA_PWC3            OV1063X_REG_8BIT(0x3632)
>>> +#define OV1063X_ANA_PWC4            OV1063X_REG_8BIT(0x3633)
>>> +
>>> +#define OV1063X_SENSOR_RSTGOLOW            OV1063X_REG_8BIT(0x3702)
>>> +#define OV1063X_SENSOR_HLDWIDTH            OV1063X_REG_8BIT(0x3703)
>>> +#define OV1063X_SENSOR_TXWIDTH            OV1063X_REG_8BIT(0x3704)
>>> +#define OV1063X_SENSOR_REG9            OV1063X_REG_8BIT(0x3709)
>>> +#define OV1063X_SENSOR_REGD            OV1063X_REG_8BIT(0x370d)
>>> +#define OV1063X_SENSOR_RSTYZ_GOLOW        OV1063X_REG_16BIT(0x3712)
>>> +#define OV1063X_SENSOR_EQ_GOLOW            OV1063X_REG_8BIT(0x3714)
>>> +#define OV1063X_SENSOR_REG15            OV1063X_REG_8BIT(0x3715)
>>> +#define OV1063X_SENSOR_BITSW_GO            OV1063X_REG_16BIT(0x371c)
>>> +
>>> +#define OV1063X_TIMING_X_START_ADDR        OV1063X_REG_16BIT(0x3800)
>>> +#define OV1063X_TIMING_Y_START_ADDR        OV1063X_REG_16BIT(0x3802)
>>> +#define OV1063X_TIMING_X_END_ADDR        OV1063X_REG_16BIT(0x3804)
>>> +#define OV1063X_TIMING_Y_END_ADDR        OV1063X_REG_16BIT(0x3806)
>>> +#define OV1063X_TIMING_X_OUTPUT_SIZE        OV1063X_REG_16BIT(0x3808)
>>> +#define OV1063X_TIMING_Y_OUTPUT_SIZE        OV1063X_REG_16BIT(0x380a)
>>> +#define OV1063X_TIMING_HTS            OV1063X_REG_16BIT(0x380c)
>>> +#define OV1063X_TIMING_VTS            OV1063X_REG_16BIT(0x380e)
>>> +#define OV1063X_TIMING_ISP_X_WIN        OV1063X_REG_16BIT(0x3810)
>>> +#define OV1063X_TIMING_ISP_Y_WIN        OV1063X_REG_16BIT(0x3812)
>>> +#define OV1063X_TIMING_CTRL15            OV1063X_REG_8BIT(0x3815)
>>> +#define OV1063X_TIMING_CTRL15_BLACK_LINE_HREF    BIT(7)
>>> +#define OV1063X_TIMING_CTRL15_RIP_SOF        BIT(5)
>>> +#define OV1063X_TIMING_CTRL15_BLACK_LINES(n)    ((n) << 0)
>>> +#define OV1063X_TIMING_CTRL1C            OV1063X_REG_8BIT(0x381c)
>>> +#define OV1063X_TIMING_CTRL1C_VFLIP_DIG        BIT(7)
>>> +#define OV1063X_TIMING_CTRL1C_VFLIP_ARRAY    BIT(6)
>>> +#define OV1063X_TIMING_CTRL1C_VSUB4        BIT(1)
>>> +#define OV1063X_TIMING_CTRL1C_VSUB2        BIT(0)
>>> +#define OV1063X_TIMING_CTRL1D            OV1063X_REG_8BIT(0x381d)
>>> +#define OV1063X_TIMING_CTRL1D_VFLIP_BLACK_LINE    BIT(7)
>>> +#define OV1063X_TIMING_CTRL1D_WDR        BIT(6)
>>> +#define OV1063X_TIMING_CTRL1D_HFLIP_DIG        BIT(1)
>>> +#define OV1063X_TIMING_CTRL1D_HFLIP_ARRAY    BIT(0)
>>> +#define OV1063X_TIMING_CTRL24            OV1063X_REG_8BIT(0x3824)
>>> +#define OV1063X_VSTART_OFFSET            OV1063X_REG_16BIT(0x381e)
>>> +#define OV1063X_TIMING_TC_CS_RST        OV1063X_REG_16BIT(0x3832)
>>> +#define OV1063X_TIMING_TC_R_RST            OV1063X_REG_16BIT(0x3834)
>>> +
>>> +#define OV1063X_START_LINE            OV1063X_REG_8BIT(0x4001)
>>> +#define OV1063X_LINE_NUM            OV1063X_REG_8BIT(0x4004)    /* 
>>> Black lines */
>>> +#define OV1063X_BLC_CTRL05            OV1063X_REG_8BIT(0x4005)
>>> +#define OV1063X_BLC_CTRL05_ONE_LINE_MODE    BIT(5)
>>> +#define OV1063X_BLC_CTRL05_REMOVE_BLACK_LINE    BIT(4)
>>> +#define OV1063X_BLC_CTRL05_ONE_MAN_OFFSET_MODE    BIT(3)
>>> +#define OV1063X_BLC_CTRL05_BL_RBLUE_RVS        BIT(2)
>>> +#define OV1063X_BLC_CTRL05_BLC_ALWAYS_DO    BIT(1)
>>> +#define OV1063X_BLC_AVG_CTRL1            OV1063X_REG_8BIT(0x4050)
>>> +#define OV1063X_BLC_AVG_CTRL2            OV1063X_REG_8BIT(0x4051)
>>> +#define OV1063X_BLC_OFFSET_TOP_LIMIT        OV1063X_REG_16BIT(0x4056)
>>> +#define OV1063X_BLC_OFFSET_BOT_LIMIT        OV1063X_REG_16BIT(0x4058)
>>> +#define OV1063X_BLC_CTRL5A            OV1063X_REG_8BIT(0x405a)
>>> +
>>> +#define OV1063X_FC_R2                OV1063X_REG_8BIT(0x4202)
>>> +
>>> +#define OV1063X_FORMAT_CTRL00            OV1063X_REG_8BIT(0x4300)
>>> +#define OV1063X_FORMAT_YUYV            0x38
>>> +#define OV1063X_FORMAT_YYYU            0x39
>>> +#define OV1063X_FORMAT_UYVY            0x3a
>>> +#define OV1063X_FORMAT_VYUY            0x3b
>>> +#define OV1063X_FORMAT_YMAX            OV1063X_REG_16BIT(0x4302)
>>> +#define OV1063X_FORMAT_YMIN            OV1063X_REG_16BIT(0x4304)
>>> +#define OV1063X_FORMAT_UMAX            OV1063X_REG_16BIT(0x4306)
>>> +#define OV1063X_FORMAT_UMIN            OV1063X_REG_16BIT(0x4308)
>>> +
>>> +#define OV1063X_VFIFO_LLEN_FIRS1_SEL        OV1063X_REG_8BIT(0x4605)
>>> +#define OV1063X_VFIFO_LLEN_FIRS1_SEL_8B_YUV    BIT(3)
>>> +#define OV1063X_VFIFO_LINE_LENGTH_MAN        OV1063X_REG_16BIT(0x4606)
>>> +#define OV1063X_VFIFO_READ_START        OV1063X_REG_16BIT(0x4608)
>>> +#define OV1063X_VFIFO_HSYNC_START_POSITION    OV1063X_REG_16BIT(0x460a)
>>> +#define OV1063X_VFIFO_HSYNC_CTRL        OV1063X_REG_8BIT(0x460c)
>>> +#define OV1063X_VFIFO_HSYNC_CTRL_HEADER_WIDTH(n)    ((n) << 4)
>>> +#define OV1063X_VFIFO_HSYNC_CTRL_TRAILER_WIDTH(n)    ((n) << 0)
>>> +#define OV1063X_VFIFO_EMBD_LINE_CTRL        OV1063X_REG_8BIT(0x460e)
>>> +#define OV1063X_VFIFO_EMBD_LINE_CTRL_SOF_CLR_RAM    BIT(3)
>>> +#define OV1063X_VFIFO_EMBD_LINE_CTRL_ST_MOD    BIT(2)
>>> +#define OV1063X_VFIFO_EMBD_LINE_CTRL_EMBD_ROM    BIT(1)
>>> +#define OV1063X_VFIFO_EMBD_LINE_CTRL_EMBD_EN    BIT(0)
>>> +#define OV1063X_VFIFO_EMBD_LINE_NUM        OV1063X_REG_8BIT(0x460f)
>>> +#define OV1063X_EMB_START_PCNT            OV1063X_REG_16BIT(0x4610)
>>> +#define OV1063X_EMB_START_LCNT            OV1063X_REG_16BIT(0x4612)
>>> +#define OV1063X_ROI_CTRL0            OV1063X_REG_8BIT(0x4620)
>>> +#define OV1063X_ROI_CTRL0_SYNC_BYP        BIT(7)
>>> +#define OV1063X_ROI_CTRL0_FR_COMP        BIT(6)
>>> +#define OV1063X_ROI_CTRL0_FULL_DAT_MOD        BIT(5)
>>> +#define OV1063X_ROI_CTRL0_EN_3            BIT(3)
>>> +#define OV1063X_ROI_CTRL0_EN_2            BIT(2)
>>> +#define OV1063X_ROI_CTRL0_EN_1            BIT(1)
>>> +#define OV1063X_ROI_CTRL0_FUNC_E        BIT(0)
>>> +
>>> +#define OV1063X_DVP_MOD_SEL            OV1063X_REG_8BIT(0x4700)
>>> +#define OV1063X_DVP_MOD_SEL_CCIR_V        BIT(3)
>>> +#define OV1063X_DVP_MOD_SEL_CCIR_F        BIT(2)
>>> +#define OV1063X_DVP_MOD_SEL_CCIR_656        BIT(1)
>>> +#define OV1063X_DVP_MOD_SEL_HSYNC        BIT(0)
>>> +#define OV1063X_DVP_VSYNC_WIDTH            OV1063X_REG_8BIT(0x4701)
>>> +#define OV1063X_DVP_HSYVSY_NEG_WIDTH        OV1063X_REG_16BIT(0x4702)
>>> +#define OV1063X_DVP_VSYNC_MODE            OV1063X_REG_8BIT(0x4704)
>>> +#define OV1063X_DVP_VSYNC_MODE_VSYNCOUT_SEL(n)    ((n) << 2)
>>> +#define OV1063X_DVP_VSYNC_MODE_VSYNC3_MOD    BIT(1)
>>> +#define OV1063X_DVP_VSYNC_MODE_VSYNC2_MOD    BIT(0)
>>> +#define OV1063X_DVP_EOF_VSYNC_DELAY        OV1063X_REG_24BIT(0x4705)
>>> +
>>> +#define OV1063X_ISP_RW00            OV1063X_REG_8BIT(0x5000)
>>> +#define OV1063X_ISP_RW00_COLOR_MATRIX_EN    BIT(7)
>>> +#define OV1063X_ISP_RW00_COLOR_INTERP_EN    BIT(6)
>>> +#define OV1063X_ISP_RW00_DENOISE_EN        BIT(5)
>>> +#define OV1063X_ISP_RW00_WHITE_DPC_EN        BIT(4)    /* White 
>>> defect pixel correction enable */
>>> +#define OV1063X_ISP_RW00_BLACK_DPC_EN        BIT(3)    /* Black 
>>> defect pixel connection enable */
>>> +#define OV1063X_ISP_RW00_AWB_STATS_EN        BIT(2)
>>> +#define OV1063X_ISP_RW00_AWB_GAIN_EN        BIT(1)
>>> +#define OV1063X_ISP_RW00_LSC_EN            BIT(0)
>>> +#define OV1063X_ISP_RW01            OV1063X_REG_8BIT(0x5001)
>>> +#define OV1063X_ISP_RW01_DATA_WEIGHT_SYNC_EN    BIT(7)
>>> +#define OV1063X_ISP_RW01_BLACK_WHITE_MODE_EN    BIT(6)
>>> +#define OV1063X_ISP_RW01_DARK_LEVEL_FILTER_EN    BIT(5)
>>> +#define OV1063X_ISP_RW01_BUFFER_CONTROL_EN    BIT(4)
>>> +#define OV1063X_ISP_RW01_AEC_EN            BIT(3)
>>> +#define OV1063X_ISP_RW01_TONE_MAPPING_EN    BIT(2)
>>> +#define OV1063X_ISP_RW01_NORMALIZE_EN        BIT(1)
>>> +#define OV1063X_ISP_RW01_LONG_SHORT_COMB_EN    BIT(0)
>>> +#define OV1063X_ISP_RW02            OV1063X_REG_8BIT(0x5002)
>>> +#define OV1063X_ISP_RW02_OTP_MANUAL_OFFSET_EN    BIT(7)
>>> +#define OV1063X_ISP_RW02_OTP_EN            BIT(6)
>>> +#define OV1063X_ISP_RW02_INTER_FRAME_CALC    BIT(5)
>>> +#define OV1063X_ISP_RW02_CT_AWB_EN        BIT(4)
>>> +#define OV1063X_ISP_RW02_DIGITAL_GAIN_EN    BIT(3)
>>> +#define OV1063X_ISP_RW02_WINDOW_BORDER_CUT_EN    BIT(2)
>>> +#define OV1063X_ISP_RW02_DITHERING_EN        BIT(1)
>>> +#define OV1063X_ISP_RW02_LSLS            (0U << 0)
>>> +#define OV1063X_ISP_RW02_SLSL            (1U << 0)
>>> +#define OV1063X_ISP_RW05            OV1063X_REG_8BIT(0x5005)
>>> +#define OV1063X_ISP_RW05_VERT_SUB_EN        BIT(7)    /* Enable 
>>> vertical subsampling */
>>> +#define OV1063X_ISP_RW05_LSC_CENTER_AUTO    BIT(6)    /* Set LSC 
>>> center automatically based on image window */
>>> +#define OV1063X_ISP_RW05_SUB_OUT_ROW_2ND    BIT(5)    /* Output 2nd 
>>> (1) or 1st (0) row when skipping */
>>> +#define OV1063X_ISP_RW05_SUB_OUT_COL_2ND    BIT(4)    /* Output 2nd 
>>> (1) or 1st (0) column when skipping */
>>> +#define OV1063X_ISP_RW05_SUB_AVG        BIT(3)    /* Average (1) or 
>>> sum (0) when binning */
>>> +#define OV1063X_ISP_RW05_SUB_G_DROP        BIT(2)    /* Skip (1) or 
>>> bin (0) Green / Y */
>>> +#define OV1063X_ISP_RW05_SUB_RB_DROP        BIT(1)    /* Skip (1) or 
>>> bin (0) Red Blue / UV */
>>> +#define OV1063X_ISP_RW05_SUB_ENABLE        BIT(0)    /* Enable 
>>> sub-sampling */
>>> +#define OV1063X_ISP_RW06            OV1063X_REG_8BIT(0x5006)
>>> +#define OV1063X_ISP_RW06_RAW_MODE_MAN(n)    ((n) << 6)
>>> +#define OV1063X_ISP_RW06_YUV_MODE_MAN(n)    ((n) << 4)
>>> +#define OV1063X_ISP_RW06_RAW_MODE_MAN_EN    BIT(3)
>>> +#define OV1063X_ISP_RW06_YUV_MODE_MAN_EN    BIT(2)
>>> +#define OV1063X_ISP_CTRL3D            OV1063X_REG_8BIT(0x503d)
>>> +#define OV1063X_ISP_CTRL3D_TEST_PATTERN_EN    BIT(7)
>>> +#define OV1063X_ISP_CTRL3D_COLOR_BAR(n)        ((n) << 4)
>>> +#define OV1063X_ISP_CTRL3D_ROLLING_BAR_EN    BIT(2)
>>> +#define OV1063X_ISP_CTRL3E            OV1063X_REG_8BIT(0x503e)
>>> +#define OV1063X_ISP_CTRL3E_SQUARE_BW        BIT(3)
>>> +#define OV1063X_ISP_CTRL3E_TRANSPARENT_EN    BIT(2)
>>> +#define OV1063X_ISP_CTRL3E_PATTERN_BARS        (0U << 0)
>>> +#define OV1063X_ISP_CTRL3E_PATTERN_RANDOM    (1U << 0)
>>> +#define OV1063X_ISP_CTRL3E_PATTERN_SQUARES    (2U << 0)
>>> +
>>> +#define OV1063X_GAIN_AWB_MAN_GAIN_B_LONG    OV1063X_REG_16BIT(0x5100)
>>> +#define OV1063X_GAIN_AWB_MAN_GAIN_GB_LONG    OV1063X_REG_16BIT(0x5102)
>>> +#define OV1063X_GAIN_AWB_MAN_GAIN_GR_LONG    OV1063X_REG_16BIT(0x5104)
>>> +#define OV1063X_GAIN_AWB_MAN_GAIN_R_LONG    OV1063X_REG_16BIT(0x5106)
>>> +#define OV1063X_GAIN_AWB_MAN_OFFSET_B_LONG    OV1063X_REG_16BIT(0x5108)
>>> +#define OV1063X_GAIN_AWB_MAN_OFFSET_GB_LONG    
>>> OV1063X_REG_16BIT(0x510a)
>>> +#define OV1063X_GAIN_AWB_MAN_OFFSET_GR_LONG    
>>> OV1063X_REG_16BIT(0x510c)
>>> +#define OV1063X_GAIN_AWB_MAN_OFFSET_R_LONG    OV1063X_REG_16BIT(0x510e)
>>> +#define OV1063X_GAIN_AWB_MAN_GAIN_B_SHORT    OV1063X_REG_16BIT(0x5110)
>>> +#define OV1063X_GAIN_AWB_MAN_GAIN_GB_SHORT    OV1063X_REG_16BIT(0x5112)
>>> +#define OV1063X_GAIN_AWB_MAN_GAIN_GR_SHORT    OV1063X_REG_16BIT(0x5114)
>>> +#define OV1063X_GAIN_AWB_MAN_GAIN_R_SHORT    OV1063X_REG_16BIT(0x5116)
>>> +#define OV1063X_GAIN_AWB_MAN_OFFSET_B_SHORT    
>>> OV1063X_REG_16BIT(0x5118)
>>> +#define OV1063X_GAIN_AWB_MAN_OFFSET_GB_SHORT    
>>> OV1063X_REG_16BIT(0x511a)
>>> +#define OV1063X_GAIN_AWB_MAN_OFFSET_GR_SHORT    
>>> OV1063X_REG_16BIT(0x511c)
>>> +#define OV1063X_GAIN_AWB_MAN_OFFSET_R_SHORT    
>>> OV1063X_REG_16BIT(0x511e)
>>> +#define OV1063X_GAIN_AWB_CTRL32            OV1063X_REG_8BIT(0x5120)
>>> +#define OV1063X_GAIN_AWB_CTRL32_MANUAL_EN    BIT(0)
>>> +
>>> +#define OV1063X_DNS_NOISE_Y_LIST_LONG(n)    OV1063X_REG_8BIT(0x521a 
>>> + (n))
>>> +#define OV1063X_DNS_NOISE_UV_LIST_LONG(n)    
>>> OV1063X_REG_16BIT(0x5222 + (n) * 2)
>>> +#define OV1063X_DNS_GBGR_EXTRA_SHORT        OV1063X_REG_8BIT(0x5241)
>>> +#define OV1063X_DNS_NOISE_Y_LIST_SHORT(n)    OV1063X_REG_8BIT(0x5242 
>>> + (n))
>>> +#define OV1063X_DNS_NOISE_UV_LIST_SHORT(n)    
>>> OV1063X_REG_16BIT(0x5249 + (n) * 2)
>>> +#define OV1063X_CIP_UNSHARPEN_MASK_LONG(n)    
>>> OV1063X_REG_8BIT(0x5288 + (n))
>>> +#define OV1063X_CIP_MAX_SHARPEN_LONG        OV1063X_REG_8BIT(0x528d)
>>> +#define OV1063X_CIP_SHARPEN_ALPHA_LONG        OV1063X_REG_8BIT(0x5293)
>>> +#define OV1063X_CIP_UNSHARPEN_MASK_SHORT(n)    
>>> OV1063X_REG_8BIT(0x52c8 + (n))
>>> +#define OV1063X_CIP_MAX_SHARPEN_SHORT        OV1063X_REG_8BIT(0x52cd)
>>> +#define OV1063X_CIP_SHARPEN_ALPHA_SHORT        OV1063X_REG_8BIT(0x52d3)
>>> +#define OV1063X_CIP_HFREQ_COEF_SHORT        OV1063X_REG_8BIT(0x52d7)
>>> +
>>> +#define OV1063X_LLF_MAX_LOW_LEVEL        OV1063X_REG_16BIT(0x5381)
>>> +
>>> +#define OV1063X_AWB_CT_CTRL1            OV1063X_REG_8BIT(0x5581)
>>> +#define OV1063X_AWB_CT_CTRL1_GAIN_STEP_NORMAL(n)    ((n) << 6)
>>> +#define OV1063X_AWB_CT_CTRL1_GAIN_STEP_FAST(n)    ((n) << 4)
>>> +#define OV1063X_AWB_CT_CTRL1_SCALE_LONG_2X    (0 << 2)
>>> +#define OV1063X_AWB_CT_CTRL1_SCALE_LONG_4X    (1 << 2)
>>> +#define OV1063X_AWB_CT_CTRL1_SCALE_LONG_8X    (2 << 2)
>>> +#define OV1063X_AWB_M_RNG_LONG            OV1063X_REG_8BIT(0x5586)
>>> +#define OV1063X_AWB_L_XRNG_LONG            OV1063X_REG_8BIT(0x5587)
>>> +#define OV1063X_AWB_H_YRNG_LONG            OV1063X_REG_8BIT(0x5588)
>>> +#define OV1063X_AWB_M_X_LONG            OV1063X_REG_8BIT(0x5589)
>>> +#define OV1063X_AWB_M_Y_LONG            OV1063X_REG_8BIT(0x558a)
>>> +#define OV1063X_AWB_L_K_LONG            OV1063X_REG_8BIT(0x558b)
>>> +#define OV1063X_AWB_H_K_LONG            OV1063X_REG_8BIT(0x558c)
>>> +#define OV1063X_AWB_H_LMT_LONG            OV1063X_REG_8BIT(0x558d)
>>> +#define OV1063X_AWB_L_LMT_LONG            OV1063X_REG_8BIT(0x558e)
>>> +#define OV1063X_AWB_DATA_ULMT_LONG        OV1063X_REG_8BIT(0x5591)
>>> +#define OV1063X_AWB_DATA_LLMT_LONG        OV1063X_REG_8BIT(0x5592)
>>> +#define OV1063X_AWB_M_RNG_SHORT            OV1063X_REG_8BIT(0x559f)
>>> +#define OV1063X_AWB_L_XRNG_SHORT        OV1063X_REG_8BIT(0x55a0)
>>> +#define OV1063X_AWB_H_YRNG_SHORT        OV1063X_REG_8BIT(0x55a1)
>>> +#define OV1063X_AWB_M_X_SHORT            OV1063X_REG_8BIT(0x55a2)
>>> +#define OV1063X_AWB_M_Y_SHORT            OV1063X_REG_8BIT(0x55a3)
>>> +#define OV1063X_AWB_L_K_SHORT            OV1063X_REG_8BIT(0x55a4)
>>> +#define OV1063X_AWB_H_K_SHORT            OV1063X_REG_8BIT(0x55a5)
>>> +#define OV1063X_AWB_H_LMT_SHORT            OV1063X_REG_8BIT(0x55a6)
>>> +#define OV1063X_AWB_L_LMT_SHORT            OV1063X_REG_8BIT(0x55a7)
>>> +#define OV1063X_AWB_DATA_ULMT_SHORT        OV1063X_REG_8BIT(0x55aa)
>>> +#define OV1063X_AWB_DATA_LLMT_SHORT        OV1063X_REG_8BIT(0x55ab)
>>> +
>>> +#define OV1063X_AEC_CTRL07            OV1063X_REG_16BIT(0x5607)
>>> +#define OV1063X_AEC_WIN_LEFT_LONG        OV1063X_REG_16BIT(0x5609)
>>> +#define OV1063X_AEC_WIN_LEFT_SHORT        OV1063X_REG_16BIT(0x560b)
>>> +#define OV1063X_AEC_WIN_TOP_LONG        OV1063X_REG_16BIT(0x560d)
>>> +#define OV1063X_AEC_WIN_TOP_SHORT        OV1063X_REG_16BIT(0x560f)
>>> +#define OV1063X_AEC_WIN_WIDTH_LONG        OV1063X_REG_16BIT(0x5611)
>>> +#define OV1063X_AEC_WIN_WIDTH_SHORT        OV1063X_REG_16BIT(0x5613)
>>> +#define OV1063X_AEC_WIN_HEIGHT_LONG        OV1063X_REG_16BIT(0x5615)
>>> +#define OV1063X_AEC_WIN_HEIGHT_SHORT        OV1063X_REG_16BIT(0x5617)
>>> +#define OV1063X_AEC_WEIGHT_SHORT(n)        OV1063X_REG_8BIT(0x563b + 
>>> (n))
>>> +#define OV1063X_AEC_FINAL_SATURATE_THRESH    OV1063X_REG_16BIT(0x5651)
>>> +#define OV1063X_AEC_CTRLD0            OV1063X_REG_8BIT(0x56d0)
>>> +#define OV1063X_AEC_CTRLD0_R_MAN_EN(n)        ((n) << 0)
>>> +#define OV1063X_AEC_CTRLD5            OV1063X_REG_32BIT(0x56d5)    
>>> /* r_exp_l_m */
>>> +#define OV1063X_AEC_CTRLD9            OV1063X_REG_32BIT(0x56d9)    
>>> /* r_exp_s_m */
>>> +#define OV1063X_AEC_CTRLE8            OV1063X_REG_16BIT(0x56e8)    
>>> /* r_snrgain_l_m */
>>> +#define OV1063X_AEC_CTRLEA            OV1063X_REG_16BIT(0x56ea)    
>>> /* r_snrgain_s_m */
>>> +
>>> +#define OV1063X_TPM_SLOPE(n)            OV1063X_REG_8BIT(0x6700 + (n))
>>> +#define OV1063X_TPM_OFFSET(n)            OV1063X_REG_8BIT(0x6702 + (n))
>>> +#define OV1063X_TPM_CTRL6            OV1063X_REG_8BIT(0x6706)
>>> +#define OV1063X_TPM_CTRL6_CLK_DIV(n)        ((n) << 0)
>>> +
>>> +#define OV1063X_GROUP_WRITER_COMMAND        OV1063X_REG_8BIT(0x6f00)
>>> +#define OV1063X_GROUP_WRITER_COMMAND_OP(n)    ((n) << 6)
>>> +#define OV1063X_GROUP_WRITER_COMMAND_ID(n)    ((n) << 4)
>>> +#define OV1063X_GROUP_WRITER_COMMAND_EN        (3U << 0)
>>> +#define OV1063X_PARI_ADDR_MIN            OV1063X_REG_16BIT(0x6f06)
>>> +#define OV1063X_PARI_ADDR_MAX            OV1063X_REG_16BIT(0x6f0a)
>>> +
>>> +#define OV1063X_EMB_LINE_EN            OV1063X_REG_8BIT(0x6800)
>>> +#define OV1063X_EMB_LINE_EN_ENABLE        BIT(0)
>>> +#define OV1063X_EMB_SIZE_MANU_EN        OV1063X_REG_8BIT(0x6804)
>>> +#define OV1063X_EMB_SIZE_EN_ENABLE        BIT(0)
>>> +#define OV1063X_EMB_SIZE_MANU            OV1063X_REG_16BIT(0x6805)
>>> +
>>> +#define OV1063X_HORIZ_COLORCORRECT        OV1063X_REG_8BIT(0x6900)
>>> +#define OV1063X_HORIZ_COLORCORRECT_ON        BIT(0)
>>> +
>>> +#define OV1063X_AEC_TARGET_NUM            OV1063X_REG_8BIT(0xc450)
>>> +#define OV1063X_AEC_TARGET_NUM_AA_MODE        (1U << 0)
>>> +#define OV1063X_AEC_TARGET_NUM_AB_MODE        (2U << 0)
>>> +#define OV1063X_AEC_TARGET_NUM_ABC_MODE        (3U << 0)
>>> +#define OV1063X_AEC_LS_SENS_RATIO        OV1063X_REG_16BIT(0xc452)
>>> +#define OV1063X_AEC_NONWDR_EN            OV1063X_REG_8BIT(0xc454)
>>> +#define OV1063X_AEC_NONWDR_SWITCH        OV1063X_REG_8BIT(0xc455)
>>> +#define OV1063X_AEC_FIXED_RATIO_EN        OV1063X_REG_8BIT(0xc456)
>>> +#define OV1063X_AEC_GP_MODE_EN            OV1063X_REG_8BIT(0xc457)
>>> +#define OV1063X_AEC_NIGHT_MODE_EN        OV1063X_REG_8BIT(0xc458)
>>> +#define OV1063X_AEC_NIGHT_MODE_CTRL        OV1063X_REG_8BIT(0xc459)
>>> +#define OV1063X_AEC_NIGHT_MODE_CTRL_INSERT    BIT(0)
>>> +#define OV1063X_AEC_FRACTAL_EXP_EN        OV1063X_REG_8BIT(0xc45a)
>>> +#define OV1063X_AEC_NONLINEAR_GAIN_EN        OV1063X_REG_8BIT(0xc45b)
>>> +#define OV1063X_AEC_MANU_GAMMA_EN        OV1063X_REG_8BIT(0xc45c)
>>> +#define OV1063X_AEC_HOLD_BAND_EN        OV1063X_REG_8BIT(0xc45d)
>>> +#define OV1063X_AEC_BAND_FILTER_FLAG        OV1063X_REG_8BIT(0xc45e)
>>> +#define OV1063X_AEC_BAND_FILTER_FLAG_0HZ    (0U << 0)
>>> +#define OV1063X_AEC_BAND_FILTER_FLAG_60HZ    (1U << 0)
>>> +#define OV1063X_AEC_BAND_FILTER_FLAG_50HZ    (2U << 0)
>>> +#define OV1063X_AEC_BAND_FILTER_EN        OV1063X_REG_8BIT(0xc45f)
>>> +#define OV1063X_AEC_BAND_FILTER_SHORT        OV1063X_REG_8BIT(0xc460)
>>> +#define OV1063X_AEC_LESS_1BAND_EN        OV1063X_REG_8BIT(0xc461)
>>> +#define OV1063X_AEC_LESS_1BAND_SHORT        OV1063X_REG_8BIT(0xc462)
>>> +#define OV1063X_AEC_WDR_GAIN_LIMIT_EN        OV1063X_REG_8BIT(0xc463)
>>> +#define OV1063X_AEC_LOG_TARGET(n)        OV1063X_REG_16BIT(0xc464 + 
>>> (n) * 2)
>>> +#define OV1063X_AEC_TARGET_LONG(n)        OV1063X_REG_8BIT(0xc46a + 
>>> (n))
>>> +#define OV1063X_AEC_TARGET_SHORT(n)        OV1063X_REG_8BIT(0xc46d + 
>>> (n))
>>> +#define OV1063X_AEC_MAX_SHORT_LE        OV1063X_REG_32BIT(0xc47c)
>>> +#define OV1063X_AEC_MAX_GAIN_LONG        OV1063X_REG_16BIT(0xc480)
>>> +#define OV1063X_AEC_MAX_GAIN_SHORT        OV1063X_REG_16BIT(0xc482)
>>> +#define OV1063X_AEC_MIN_GAIN_LONG        OV1063X_REG_16BIT(0xc484)
>>> +#define OV1063X_AEC_MIN_GAIN_SHORT        OV1063X_REG_16BIT(0xc486)
>>> +#define OV1063X_AEC_MAX_EXP_LONG        OV1063X_REG_16BIT(0xc488)
>>> +#define OV1063X_AEC_MAX_EXP_SHORT        OV1063X_REG_16BIT(0xc48a)
>>> +#define OV1063X_AEC_MIN_EXP_LONG        OV1063X_REG_16BIT(0xc48c)
>>> +#define OV1063X_AEC_MIN_EXP_SHORT        OV1063X_REG_16BIT(0xc48e)
>>> +#define OV1063X_AEC_FIXED_RATIO            OV1063X_REG_8BIT(0xc490)
>>> +#define OV1063X_AEC_GP_MODE_RATIO_B2A        OV1063X_REG_8BIT(0xc492)
>>> +#define OV1063X_AEC_GP_MODE_RATIO_C2A        OV1063X_REG_8BIT(0xc493)
>>> +#define OV1063X_AEC_MIN_GAMMA_LIST(n)        
>>> OV1063X_REG_16BIT(0xc498 + (n) * 2)
>>> +#define OV1063X_AEC_MAX_GAMMA_LIST(n)        
>>> OV1063X_REG_16BIT(0xc49e + (n) * 2)
>>> +#define OV1063X_AEC_DR_LIST(n)            OV1063X_REG_16BIT(0xc4a4 + 
>>> (n) * 2)
>>> +#define OV1063X_AEC_BAND_VALUE_60HZ        OV1063X_REG_16BIT(0xc4aa)
>>> +#define OV1063X_AEC_BAND_VALUE_50HZ        OV1063X_REG_16BIT(0xc4ac)
>>> +
>>> +#define OV1063X_AWB_SIMPLE_MIN_NUM        OV1063X_REG_16BIT(0xc4cc)
>>> +#define OV1063X_AWB_CT_MIN_NUM            OV1063X_REG_16BIT(0xc4ce)
>>> +
>>> +#define OV1063X_VTS_ADDR            OV1063X_REG_16BIT(0xc518)
>>> +#define OV1063X_HTS_ADDR            OV1063X_REG_16BIT(0xc51a)
>>> +
>>> +#include "ov1063x_regs.h"
>>> +
>>> +/* IDs */
>>> +#define OV10633_VERSION_REG            0xa630
>>> +#define OV10635_VERSION_REG            0xa635
>>> +
>>> +enum ov1063x_model {
>>> +    SENSOR_OV10633,
>>> +    SENSOR_OV10635,
>>> +};
>>> +
>>> +enum ov1063x_streaming_state {
>>> +    OV1063X_STREAM_OFF = 0,
>>> +    OV1063X_STREAM_STARTING,
>>> +    OV1063X_STREAM_ON,
>>> +};
>>> +
>>> +#define OV1063X_SENSOR_WIDTH            1312
>>> +#define OV1063X_SENSOR_HEIGHT            814
>>> +
>>> +struct ov1063x_priv {
>>> +    struct device            *dev;
>>> +
>>> +    struct regmap            *regmap;
>>> +    struct clk            *clk;
>>> +    struct gpio_desc        *reset_gpio;
>>> +    struct gpio_desc        *pwdn_gpio;
>>> +
>>> +    int                model;
>>> +    const char            *name;
>>> +    unsigned long            clk_rate;
>>> +
>>> +    struct v4l2_subdev        subdev;
>>> +    struct media_pad        pad;
>>> +
>>> +    struct v4l2_ctrl_handler    hdl;
>>> +
>>> +    /*
>>> +     * The streaming and format fields are protected by the control 
>>> handler
>>> +     * lock.
>>> +     */
>>> +    enum ov1063x_streaming_state    streaming;
>>> +    struct v4l2_rect        analog_crop;
>>> +    struct v4l2_rect        digital_crop;
>>> +    struct v4l2_mbus_framefmt    format;
>>> +
>>> +    unsigned int            fps_numerator;
>>> +    unsigned int            fps_denominator;
>>> +};
>>> +
>>> +/*
>>> + * TODO: Expose multiple subdevs to control cropping and subsampling 
>>> separately
>>> + * from userspace instead of hardcoding resolutions.
>>> + *
>>> + * TODO: Resolutions with an analog crop rectangle width equal to 
>>> 768 or higher
>>> + * don't work properly.
>>> + */
>>> +static const struct v4l2_area ov1063x_framesizes[] = {
>>> +    {
>>> +        .width        = 1280,
>>> +        .height        = 800,
>>> +    }, {
>>> +        .width        = 1280,
>>> +        .height        = 720,
>>> +    }, {
>>> +        .width        = 752,
>>> +        .height        = 480,
>>> +    }, {
>>> +        .width        = 640,
>>> +        .height        = 480,
>>> +    }, {
>>> +        .width        = 600,
>>> +        .height        = 400,
>>> +    }, {
>>
>> I have an issue when 600x400 is requested on the ov10635 from the TI 
>> tree VIP
>> driver, on the am57xx-evm platform.
>>
>> With this resolution (any bus format), output is very dark, we only 
>> see very
>> bright objects (light bulbs). It seems IPS doesn't drive exposure 
>> correctly
>> or ISP doesn't have the right parameters.
>>
>> But while testing the colorbars, the output is also wrong:
>>
>> Command:
>> # v4l2-ctl -d1 --set-ctrl test_pattern=1 
>> --set-fmt-video=pixelformat=YUYV,width=600,height=400 
>> --stream-to=out.raw --stream-count=10 --stream-poll --stream-mmap=20
>>
>> https://people.freedesktop.org/~narmstrong/ov1065x-600-400-YUYV-colorbar.png 
>>
>>
>> VIP log is:
>> [12324.323181] vin3a: vip_init_port: g_mbus_fmt subdev mbus_code: 2006 
>> fourcc:NV12 size: 600x400
>> [12324.323211] vin3a: calc_format_size: fourcc:NV12 size: 600x400 
>> bpl:608 img_size:364800
>> [12324.323211] vin3a-0: init_stream fourcc:NV12 size: 600x400 bpl:608 
>> img_size:364800
>> [12324.323211] vin3a-0: init_stream vpdma data type: 0x02
>> [12324.323242] vin3a-0: vip_init_stream: stream instance 
>> 0x00000000c267b000
>> [12324.323455] vin3a-0: g_fmt fourcc:NV12 code: 2006 size: 600x400 
>> bpl:608 img_size:364800
>> [12324.323455] vin3a-0: g_fmt vpdma data type: 0x02
>> [12324.323486] vin3a-0: enum_fmt index:0
>> [12324.323486] vin3a-0: enum_fmt fourcc:NV12
>> [12324.323486] vin3a-0: enum_fmt index:1
>> [12324.323516] vin3a-0: enum_fmt fourcc:UYVY
>> [12324.323516] vin3a-0: enum_fmt index:2
>> [12324.323516] vin3a-0: enum_fmt fourcc:YUYV
>> [12324.323547] vin3a-0: s_fmt input fourcc:YUYV size: 600x400 bpl:0 
>> img_size:364800
>> [12324.323547] vin3a-0: try_fmt fourcc:YUYV size: 600x400
>> [12324.323547] vin3a-0: try_fmt loop:0 fourcc:YUYV size: 1280x800
>> [12324.323577] vin3a-0: try_fmt loop:0 found new larger: 1280x800
>> [12324.323577] vin3a-0: try_fmt loop:0 found at least larger: 1280x800
>> [12324.323577] vin3a-0: try_fmt loop:0 found new best: 1280x800
>> [12324.323577] vin3a-0: try_fmt loop:1 fourcc:YUYV size: 1280x720
>> [12324.323608] vin3a-0: try_fmt loop:1 found at least larger: 1280x720
>> [12324.323608] vin3a-0: try_fmt loop:1 found new best: 1280x720
>> [12324.323608] vin3a-0: try_fmt loop:2 fourcc:YUYV size: 752x480
>> [12324.323608] vin3a-0: try_fmt loop:2 found at least larger: 752x480
>> [12324.323638] vin3a-0: try_fmt loop:2 found new best: 752x480
>> [12324.323638] vin3a-0: try_fmt loop:3 fourcc:YUYV size: 640x480
>> [12324.323638] vin3a-0: try_fmt loop:3 found at least larger: 640x480
>> [12324.323638] vin3a-0: try_fmt loop:3 found new best: 640x480
>> [12324.323669] vin3a-0: try_fmt loop:4 fourcc:YUYV size: 600x400
>> [12324.323669] vin3a-0: try_fmt loop:4 found at least larger: 600x400
>> [12324.323669] vin3a-0: try_fmt loop:4 found new best: 600x400
>> [12324.323669] vin3a-0: try_fmt loop:4 found direct match: 600x400
>> [12324.323699] vin3a: calc_format_size: fourcc:YUYV size: 600x400 
>> bpl:1200 img_size:480000
>> [12324.323699] vin3a-0: s_fmt try_fmt fourcc:YUYV size: 600x400 
>> bpl:1200 img_size:480000
>> [12324.323699] vin3a-0: s_fmt fourcc:YUYV size: 600x400 bpl:1200 
>> img_size:480000
>> [12324.323730] vin3a-0: s_fmt pix_to_mbus mbus_code: 2006 size: 600x400
>> [12324.323730] vin3a-0: s_fmt subdev fmt mbus_code: 2006 size: 600x400
>> [12324.323730] vin3a-0: s_fmt vpdma data type: 0x07
>>
>> ov10635 is correctly set with 600x400 and VIP is pass-throught.
>>
>> The image & colorbar is OK with any other framesizes requested to 
>> ov10635.
>>
>> Is this a known issue ?
>>
>> Neil
>>
>>> +        .width        = 352,
>>> +        .height        = 288,
>>> +    }, {
>>> +        .width        = 320,
>>> +        .height        = 240,
>>> +    },
>>> +};
>>> +
>>> +static const u32 ov1063x_mbus_formats[] = {
>>> +    MEDIA_BUS_FMT_YUYV8_2X8,
>>> +    MEDIA_BUS_FMT_UYVY8_2X8,
>>> +    MEDIA_BUS_FMT_VYUY8_2X8,
>>> +    MEDIA_BUS_FMT_YVYU8_2X8,
>>> +};
>>> +
>>> +static inline struct ov1063x_priv *to_ov1063x(struct v4l2_subdev *sd)
>>> +{
>>> +    return container_of(sd, struct ov1063x_priv, subdev);
>>> +}
>>> +
>>> +/* 
>>> ----------------------------------------------------------------------------- 
>>>
>>> + * Read/Write Helpers
>>> + */
>>> +
>>> +static int ov1063x_read(struct ov1063x_priv *priv, u32 reg, u32 *val)
>>> +{
>>> +    unsigned int len = (reg >> OV1063X_REG_SIZE_SHIFT) & 3;
>>> +    u16 addr = reg & OV1063X_REG_ADDR_MASK;
>>> +    unsigned int i;
>>> +    int ret;
>>> +
>>> +    *val = 0;
>>> +
>>> +    for (i = 0; i < len; ++i) {
>>> +        u32 byte;
>>> +
>>> +        ret = regmap_read(priv->regmap, addr, &byte);
>>> +        if (ret)
>>> +            return ret;
>>> +
>>> +        *val = (*val << 8) | byte;
>>> +        addr++;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int ov1063x_write(struct ov1063x_priv *priv, u32 reg, u32 
>>> val, int *err)
>>> +{
>>> +    unsigned int len = (reg >> OV1063X_REG_SIZE_SHIFT) & 7;
>>> +    u16 addr = reg & OV1063X_REG_ADDR_MASK;
>>> +    unsigned int shift = (len - 1) * 8;
>>> +    unsigned int i;
>>> +    int ret;
>>> +
>>> +    if (err && *err)
>>> +        return *err;
>>> +
>>> +    for (i = 0; i < len; ++i) {
>>> +        ret = regmap_write(priv->regmap, addr, (val >> shift) & 0xff);
>>> +        if (ret) {
>>> +            if (err)
>>> +                *err = ret;
>>> +            return ret;
>>> +        }
>>> +
>>> +        shift -= 8;
>>> +        addr++;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int ov1063x_write_array(struct ov1063x_priv *priv,
>>> +                   const struct ov1063x_reg *regs,
>>> +                   unsigned int nr_regs)
>>> +{
>>> +    unsigned int i;
>>> +    int ret;
>>> +
>>> +    for (i = 0; i < nr_regs; i++) {
>>> +        ret = ov1063x_write(priv, regs[i].reg, regs[i].val, NULL);
>>> +        if (ret)
>>> +            return ret;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int ov1063x_update(struct ov1063x_priv *priv, u32 reg, u32 
>>> mask, u32 val,
>>> +              int *err)
>>> +{
>>> +    unsigned int len = (reg >> OV1063X_REG_SIZE_SHIFT) & 7;
>>> +    u16 addr = reg & OV1063X_REG_ADDR_MASK;
>>> +    unsigned int shift = (len - 1) * 8;
>>> +    unsigned int i;
>>> +    int ret;
>>> +
>>> +    if (err && *err)
>>> +        return *err;
>>> +
>>> +    for (i = 0; i < len; ++i) {
>>> +        ret = regmap_update_bits(priv->regmap, addr,
>>> +                     (mask >> shift) & 0xff,
>>> +                     (val >> shift) & 0xff);
>>> +        if (ret) {
>>> +            if (err)
>>> +                *err = ret;
>>> +            return ret;
>>> +        }
>>> +
>>> +        shift -= 8;
>>> +        addr++;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +/* 
>>> ----------------------------------------------------------------------------- 
>>>
>>> + * Hardware Configuration
>>> + */
>>> +
>>> +struct ov1063x_pll_config {
>>> +    unsigned int pre_div;
>>> +    unsigned int mult;
>>> +    unsigned int div;
>>> +    unsigned int clk_out;
>>> +};
>>> +
>>> +static int ov1063x_pll_setup(unsigned int clk_rate,
>>> +                 unsigned int *htsmin, unsigned int vts,
>>> +                 unsigned int fps_numerator,
>>> +                 unsigned int fps_denominator,
>>> +                 struct ov1063x_pll_config *cfg)
>>> +{
>>> +    unsigned int best_pclk = UINT_MAX;
>>> +    unsigned int best_pre_div_x2;
>>> +    unsigned int best_mult;
>>> +    unsigned int best_div;
>>> +    unsigned int best_hts;
>>> +    unsigned int max_pre_div_x2;
>>> +    unsigned int pre_div_x2;
>>> +    unsigned int hts;
>>> +
>>> +    /*
>>> +     *  XVCLK --> pre-div -------> mult ----------> div --> output
>>> +     * 6-27 MHz           3-27 MHz      200-500 MHz       Max 96 MHz
>>> +     *
>>> +     * Valid pre-divider values are 1, 1.5, 2, 3, 4, 5, 6 and 7, 
>>> stored in
>>> +     * registers as the index in this list of values.
>>> +     *
>>> +     * Valid multiplier values are [1, 63], stored as-is in registers.
>>> +     *
>>> +     * Valid divider values are 2 to 16 with a step of 2, stored in
>>> +     * registers as (div / 2) - 1.
>>> +     */
>>> +
>>> +    if (clk_rate < 6 * 1000 * 1000 || clk_rate > 27 * 1000 * 1000)
>>> +        return -EINVAL;
>>> +
>>> +    /*
>>> +     * We try all valid combinations of settings for the 3 blocks to 
>>> get
>>> +     * the pixel clock, and from that calculate the actual hts/vts 
>>> to use.
>>> +     * The vts is extended so as to achieve the required frame rate.
>>> +     */
>>> +
>>> +    /*
>>> +     * The pre_div_x2 variable stores the pre-div value multiplied 
>>> by 2, to
>>> +     * support the fractional divider 1.5.
>>> +     */
>>> +    max_pre_div_x2 = min(clk_rate * 2 / (3 * 1000 * 1000), 14U);
>>> +
>>> +    for (pre_div_x2 = 2; pre_div_x2 <= max_pre_div_x2;
>>> +         pre_div_x2 += (pre_div_x2 < 4 ? 1 : 2)) {
>>> +        unsigned int clk1 = clk_rate * 2 / pre_div_x2;
>>> +        unsigned int min_mult;
>>> +        unsigned int max_mult;
>>> +        unsigned int mult;
>>> +
>>> +        if (clk1 < 3 * 1000 * 1000 || clk1 > 27 * 1000 * 1000)
>>> +            continue;
>>> +
>>> +        min_mult = DIV_ROUND_UP(200 * 1000 * 1000, clk1);
>>> +        max_mult = min(500 * 1000 * 1000 / clk1, 63U);
>>> +
>>> +        for (mult = min_mult; mult <= max_mult; mult++) {
>>> +            unsigned int clk2 = clk1 * mult;
>>> +            unsigned int min_div;
>>> +            unsigned int div;
>>> +
>>> +            min_div = DIV_ROUND_UP(clk2, 96 * 1000 * 1000);
>>> +            min_div = round_up(min_div, 2);
>>> +
>>> +            for (div = min_div; div <= 16; div += 2) {
>>> +                unsigned int pclk = clk2 / div;
>>> +                unsigned int min_pclk;
>>> +
>>> +                /*
>>> +                 * TODO: HTS calculation should ideally be split
>>> +                 * from the PLL calculations. This requires
>>> +                 * figuring out where the pclk / 300000 comes
>>> +                 * from.
>>> +                 */
>>> +                hts = *htsmin + pclk / (300*1000);
>>> +
>>> +                /* 2 clock cycles for every YUV422 pixel. */
>>> +                min_pclk = hts * vts / fps_denominator
>>> +                     * fps_numerator * 2;
>>> +                if (pclk < min_pclk)
>>> +                    continue;
>>> +
>>> +                if (pclk < best_pclk) {
>>> +                    best_pclk = pclk;
>>> +                    best_hts = hts;
>>> +                    best_pre_div_x2 = pre_div_x2;
>>> +                    best_mult = mult;
>>> +                    best_div = div;
>>> +                }
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    if (best_pclk == UINT_MAX)
>>> +        return -EINVAL;
>>> +
>>> +    /* Store the mult, pre_div and div as register values. */
>>> +    cfg->mult = best_mult;
>>> +    cfg->pre_div = best_pre_div_x2 < 4 ? best_pre_div_x2 - 2
>>> +             : best_pre_div_x2 / 2;
>>> +    cfg->div = (best_div / 2) - 1;
>>> +    cfg->clk_out = best_pclk;
>>> +
>>> +    *htsmin = best_hts;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int ov1063x_isp_reset(struct ov1063x_priv *priv, bool reset)
>>> +{
>>> +    unsigned int i;
>>> +    int ret = 0;
>>> +
>>> +    if (!reset) {
>>> +        /*
>>> +         * Enable ISP blocks. Why OV1063X_SC_SOC_CLKRST7 needs to be
>>> +         * written 26 times is unknown.
>>> +         */
>>> +        for (i = 0; i < 26; ++i)
>>> +            ov1063x_write(priv, OV1063X_SC_SOC_CLKRST7,
>>> +                      OV1063X_SC_SOC_CLKRST7_SCLK, &ret);
>>> +
>>> +        ov1063x_write(priv, OV1063X_SC_CMMN_CLKRST1,
>>> +                  OV1063X_SC_CMMN_CLKRST1_SCLK, &ret);
>>> +        ov1063x_write(priv, OV1063X_SC_CMMN_CLKRST2,
>>> +                  OV1063X_SC_CMMN_CLKRST2_PCLK_DVP |
>>> +                  OV1063X_SC_CMMN_CLKRST2_SCLK, &ret);
>>> +        ov1063x_write(priv, OV1063X_SC_CMMN_CLKRST0,
>>> +                  OV1063X_SC_CMMN_CLKRST0_SCLK, &ret);
>>> +    } else {
>>> +        /* Reset the ISP. */
>>> +        ov1063x_write(priv, OV1063X_SC_CMMN_CLKRST1,
>>> +                  OV1063X_SC_CMMN_CLKRST1_SCLK |
>>> +                  OV1063X_SC_CMMN_CLKRST1_RST, &ret);
>>> +        ov1063x_write(priv, OV1063X_SC_CMMN_CLKRST2,
>>> +                  OV1063X_SC_CMMN_CLKRST2_PCLK_DVP |
>>> +                  OV1063X_SC_CMMN_CLKRST2_SCLK |
>>> +                  OV1063X_SC_CMMN_CLKRST2_RST_DVP |
>>> +                  OV1063X_SC_CMMN_CLKRST2_RST, &ret);
>>> +        ov1063x_write(priv, OV1063X_SC_CMMN_CLKRST0,
>>> +                  OV1063X_SC_CMMN_CLKRST0_SCLK |
>>> +                  OV1063X_SC_CMMN_CLKRST0_RST, &ret);
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int ov1063x_configure(struct ov1063x_priv *priv)
>>> +{
>>> +    struct ov1063x_pll_config pll_cfg;
>>> +    unsigned int width_pre_subsample;
>>> +    unsigned int nr_isp_pixels;
>>> +    unsigned int hts, vts;
>>> +    u32 val;
>>> +    int ret;
>>> +
>>> +    /* Minimum values for HTS anv VTS. */
>>> +    hts = priv->analog_crop.width + 200;
>>> +    vts = priv->analog_crop.height + 50;
> 
> HTS calculation seems fishy, with the following change:
> 
> =====><======================================================================== 
> 
> --- a/drivers/media/i2c/ov1063x.c
> +++ b/drivers/media/i2c/ov1063x.c
> @@ -799,7 +799,7 @@ static int ov1063x_configure(struct ov1063x_priv *priv)
>          int ret;
> 
>          /* Minimum values for HTS anv VTS. */
> -       hts = priv->analog_crop.width + 200;
> +       hts = priv->analog_crop.width + 210;
> =====><======================================================================== 
> 
> 
> I get functional 600x400 framesize.
> 
> I got the change from [1], thus not related to the same frame size.
> 
> Neil
> 
> [1] 
> https://github.com/slawr/linux-stable/commit/8509859572e0f333850f45dd0c1529bed09da051 

With a quick test, this helps with both 600x400 and 1280x800 for me. 
Thanks for pointing this out! I'll add this change to my branch. I guess 
this is one of those "this number works better that the other number 
according to my testing, but I don't know why" fixes...

I have stated working on converting VIP to media-controller. That will 
allow us to more easily test different VIP & OV10635 configurations, 
although I fear we'll just find out that there are a lot of problems... 
I can already see that whenever VIP scaling is enabled, I get nothing out.

  Tomi
