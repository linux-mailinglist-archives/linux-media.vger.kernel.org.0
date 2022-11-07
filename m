Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19B8261FEA4
	for <lists+linux-media@lfdr.de>; Mon,  7 Nov 2022 20:29:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbiKGT3N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 14:29:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231667AbiKGT3M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 14:29:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B7625C5F
        for <linux-media@vger.kernel.org>; Mon,  7 Nov 2022 11:29:07 -0800 (PST)
Received: from [192.168.1.104] (unknown [103.251.226.75])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79594E7B;
        Mon,  7 Nov 2022 20:29:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667849345;
        bh=i5JWAPDvLlsGIGYg/R87ALQRzNEQ+QYfgKyvzbRYxN0=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=TOtRQtxAj74mifAq4+jPpdbMpdfM0Cqp4KGdMh1QQ5OsFDZzQxgQdjbSieamCf/Zu
         uAEsYegM1zMXqqFuBOq/Rve9S7qd+jCwIHZ6lzVi1IHu5/DBvK3NWL5YmCoXb7O0jE
         K/ieih0wpJfeV28s6+10RS7JdMQFr9tXhXr01Y8c=
Message-ID: <2fabd6f3-54c4-a2fa-95d0-212529fca473@ideasonboard.com>
Date:   Tue, 8 Nov 2022 00:58:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 2/2] media: i2c: Add driver for IMX519 sensor
Content-Language: en-US
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        lee <lee@arducam.com>, linux-media@vger.kernel.org
References: <20221103111427.000061f5@arducam.com>
 <166749647604.2442643.7043909994527288745@Monstersaurus>
From:   Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <166749647604.2442643.7043909994527288745@Monstersaurus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 11/3/22 10:57 PM, Kieran Bingham wrote:
> Hi Lee,
>
> Quoting lee (2022-11-03 03:14:27)
>> Adds a driver for the 16MPix IMX519 CSI2 sensor.
>> Whilst the sensor supports 2 or 4 CSI2 data lanes, this driver
>> currently only supports 2 lanes.
>>
>> The following Bayer modes are currently available:
>>
>> 4656x3496 10-bit @ 10fps
>> 3840x2160 10-bit (cropped) @ 21fps
>> 2328x1748 10-bit (binned) @ 30fps
>> 1920x1080 10-bit (cropped/binned) @ 60fps
>> 1280x720 10-bit (cropped/binned) @ 120fps
>>
>> Signed-off-by: Lee Jackson <lee@arducam.com>
>> ---
>>   drivers/media/i2c/Kconfig  |   13 +
>>   drivers/media/i2c/Makefile |    1 +
>>   drivers/media/i2c/imx519.c | 2024 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 2038 insertions(+)
>>   create mode 100644 drivers/media/i2c/imx519.c
>>
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index 7806d4b81716..f7f55099552c 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -228,6 +228,19 @@ config VIDEO_IMX412
>>            To compile this driver as a module, choose M here: the
>>            module will be called imx412.
>>   
>> +config VIDEO_IMX519
>> +       tristate "Sony IMX519 sensor support"
>> +       depends on I2C && VIDEO_DEV
>> +       select MEDIA_CONTROLLER
>> +       select VIDEO_V4L2_SUBDEV_API
>> +       select V4L2_FWNODE
>> +       help
>> +         This is a Video4Linux2 sensor driver for the Sony
>> +         IMX519 camera.
>> +
>> +         To compile this driver as a module, choose M here: the
>> +         module will be called IMX519.
>> +
>>   config VIDEO_MAX9271_LIB
>>          tristate
>>   
>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>> index 0a2933103dd9..26d1ec51e88b 100644
>> --- a/drivers/media/i2c/Makefile
>> +++ b/drivers/media/i2c/Makefile
>> @@ -48,6 +48,7 @@ obj-$(CONFIG_VIDEO_IMX334) += imx334.o
>>   obj-$(CONFIG_VIDEO_IMX335) += imx335.o
>>   obj-$(CONFIG_VIDEO_IMX355) += imx355.o
>>   obj-$(CONFIG_VIDEO_IMX412) += imx412.o
>> +obj-$(CONFIG_VIDEO_IMX519) += imx519.o
>>   obj-$(CONFIG_VIDEO_IR_I2C) += ir-kbd-i2c.o
>>   obj-$(CONFIG_VIDEO_ISL7998X) += isl7998x.o
>>   obj-$(CONFIG_VIDEO_KS0127) += ks0127.o
>> diff --git a/drivers/media/i2c/imx519.c b/drivers/media/i2c/imx519.c
>> new file mode 100644
>> index 000000000000..4d6645ead184
>> --- /dev/null
>> +++ b/drivers/media/i2c/imx519.c
>> @@ -0,0 +1,2024 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * A V4L2 driver for Sony IMX519 cameras.
>> + * Copyright (C) 2022 Arducam Technology co., Ltd.
>> + *
>> + * Based on Sony IMX477 camera driver
>> + * Copyright (C) 2020 Raspberry Pi (Trading) Ltd
>> + */
>> +#include <asm/unaligned.h>
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-event.h>
>> +#include <media/v4l2-fwnode.h>
>> +#include <media/v4l2-mediabus.h>
>> +
>> +#define IMX519_REG_VALUE_08BIT         1
>> +#define IMX519_REG_VALUE_16BIT         2
>> +
>> +/* Chip ID */
>> +#define IMX519_REG_CHIP_ID             0x0016
>> +#define IMX519_CHIP_ID                 0x0519
>> +
>> +#define IMX519_REG_MODE_SELECT         0x0100
>> +#define IMX519_MODE_STANDBY            0x00
>> +#define IMX519_MODE_STREAMING          0x01
>> +
>> +#define IMX519_REG_ORIENTATION         0x101
>> +
>> +#define IMX519_XCLK_FREQ               24000000
>> +
>> +#define IMX519_DEFAULT_LINK_FREQ       493500000
>> +
>> +/* Pixel rate is fixed at 686MHz for all the modes */
>> +#define IMX519_PIXEL_RATE              686000000
>> +
>> +/* V_TIMING internal */
>> +#define IMX519_REG_FRAME_LENGTH                0x0340
>> +#define IMX519_FRAME_LENGTH_MAX                0xffdc
>> +
>> +/* Long exposure multiplier */
>> +#define IMX519_LONG_EXP_SHIFT_MAX      7
>> +#define IMX519_LONG_EXP_SHIFT_REG      0x3100
>> +
>> +/* Exposure control */
>> +#define IMX519_REG_EXPOSURE            0x0202
>> +#define IMX519_EXPOSURE_OFFSET         32
>> +#define IMX519_EXPOSURE_MIN            20
>> +#define IMX519_EXPOSURE_STEP           1
>> +#define IMX519_EXPOSURE_DEFAULT                0x3e8
>> +#define IMX519_EXPOSURE_MAX            (IMX519_FRAME_LENGTH_MAX - \
>> +                                        IMX519_EXPOSURE_OFFSET)
>> +
>> +/* Analog gain control */
>> +#define IMX519_REG_ANALOG_GAIN         0x0204
>> +#define IMX519_ANA_GAIN_MIN            0
>> +#define IMX519_ANA_GAIN_MAX            960
>> +#define IMX519_ANA_GAIN_STEP           1
>> +#define IMX519_ANA_GAIN_DEFAULT                0x0
>> +
>> +/* Digital gain control */
>> +#define IMX519_REG_DIGITAL_GAIN                0x020e
>> +#define IMX519_DGTL_GAIN_MIN           0x0100
>> +#define IMX519_DGTL_GAIN_MAX           0xffff
>> +#define IMX519_DGTL_GAIN_DEFAULT       0x0100
>> +#define IMX519_DGTL_GAIN_STEP          1
>> +
>> +/* Test Pattern Control */
>> +#define IMX519_REG_TEST_PATTERN                0x0600
>> +#define IMX519_TEST_PATTERN_DISABLE    0
>> +#define IMX519_TEST_PATTERN_SOLID_COLOR        1
>> +#define IMX519_TEST_PATTERN_COLOR_BARS 2
>> +#define IMX519_TEST_PATTERN_GREY_COLOR 3
>> +#define IMX519_TEST_PATTERN_PN9                4
>> +
>> +/* Test pattern colour components */
>> +#define IMX519_REG_TEST_PATTERN_R      0x0602
>> +#define IMX519_REG_TEST_PATTERN_GR     0x0604
>> +#define IMX519_REG_TEST_PATTERN_B      0x0606
>> +#define IMX519_REG_TEST_PATTERN_GB     0x0608
>> +#define IMX519_TEST_PATTERN_COLOUR_MIN 0
>> +#define IMX519_TEST_PATTERN_COLOUR_MAX 0x0fff
>> +#define IMX519_TEST_PATTERN_COLOUR_STEP        1
>> +#define IMX519_TEST_PATTERN_R_DEFAULT  IMX519_TEST_PATTERN_COLOUR_MAX
>> +#define IMX519_TEST_PATTERN_GR_DEFAULT 0
>> +#define IMX519_TEST_PATTERN_B_DEFAULT  0
>> +#define IMX519_TEST_PATTERN_GB_DEFAULT 0
>> +
>> +/* IMX519 native and active pixel array size. */
>> +#define IMX519_NATIVE_WIDTH            4672U
>> +#define IMX519_NATIVE_HEIGHT           3648U
>> +#define IMX519_PIXEL_ARRAY_LEFT                8U
>> +#define IMX519_PIXEL_ARRAY_TOP         48U
>> +#define IMX519_PIXEL_ARRAY_WIDTH       4656U
>> +#define IMX519_PIXEL_ARRAY_HEIGHT      3496U
>> +
>> +struct imx519_reg {
>> +       u16 address;
>> +       u8 val;
>> +};
>> +
>> +struct imx519_reg_list {
>> +       unsigned int num_of_regs;
>> +       const struct imx519_reg *regs;
>> +};
>> +
>> +/* Mode : resolution and related config&values */
>> +struct imx519_mode {
>> +       /* Frame width */
>> +       unsigned int width;
>> +
>> +       /* Frame height */
>> +       unsigned int height;
>> +
>> +       /* H-timing in pixels */
>> +       unsigned int line_length_pix;
>> +
>> +       /* Analog crop rectangle. */
>> +       struct v4l2_rect crop;
>> +
>> +       /* Highest possible framerate. */
>> +       struct v4l2_fract timeperframe_min;
>> +
>> +       /* Default framerate. */
>> +       struct v4l2_fract timeperframe_default;
>> +
>> +       /* Default register values */
>> +       struct imx519_reg_list reg_list;
>> +};
>> +
>> +static const struct imx519_reg mode_common_regs[] = {
>> +       {0x0136, 0x18},
>> +       {0x0137, 0x00},
>> +       {0x3c7e, 0x01},
>> +       {0x3c7f, 0x07},
>> +       {0x3020, 0x00},
>> +       {0x3e35, 0x01},
>> +       {0x3f7f, 0x01},
>> +       {0x5609, 0x57},
>> +       {0x5613, 0x51},
>> +       {0x561f, 0x5e},
>> +       {0x5623, 0xd2},
>> +       {0x5637, 0x11},
>> +       {0x5657, 0x11},
>> +       {0x5659, 0x12},
>> +       {0x5733, 0x60},
>> +       {0x5905, 0x57},
>> +       {0x590f, 0x51},
>> +       {0x591b, 0x5e},
>> +       {0x591f, 0xd2},
>> +       {0x5933, 0x11},
>> +       {0x5953, 0x11},
>> +       {0x5955, 0x12},
>> +       {0x5a2f, 0x60},
>> +       {0x5a85, 0x57},
>> +       {0x5a8f, 0x51},
>> +       {0x5a9b, 0x5e},
>> +       {0x5a9f, 0xd2},
>> +       {0x5ab3, 0x11},
>> +       {0x5ad3, 0x11},
>> +       {0x5ad5, 0x12},
>> +       {0x5baf, 0x60},
>> +       {0x5c15, 0x2a},
>> +       {0x5c17, 0x80},
>> +       {0x5c19, 0x31},
>> +       {0x5c1b, 0x87},
>> +       {0x5c25, 0x25},
>> +       {0x5c27, 0x7b},
>> +       {0x5c29, 0x2a},
>> +       {0x5c2b, 0x80},
>> +       {0x5c2d, 0x31},
>> +       {0x5c2f, 0x87},
>> +       {0x5c35, 0x2b},
>> +       {0x5c37, 0x81},
>> +       {0x5c39, 0x31},
>> +       {0x5c3b, 0x87},
>> +       {0x5c45, 0x25},
>> +       {0x5c47, 0x7b},
>> +       {0x5c49, 0x2a},
>> +       {0x5c4b, 0x80},
>> +       {0x5c4d, 0x31},
>> +       {0x5c4f, 0x87},
>> +       {0x5c55, 0x2d},
>> +       {0x5c57, 0x83},
>> +       {0x5c59, 0x32},
>> +       {0x5c5b, 0x88},
>> +       {0x5c65, 0x29},
>> +       {0x5c67, 0x7f},
>> +       {0x5c69, 0x2e},
>> +       {0x5c6b, 0x84},
>> +       {0x5c6d, 0x32},
>> +       {0x5c6f, 0x88},
>> +       {0x5e69, 0x04},
>> +       {0x5e9d, 0x00},
>> +       {0x5f18, 0x10},
>> +       {0x5f1a, 0x0e},
>> +       {0x5f20, 0x12},
>> +       {0x5f22, 0x10},
>> +       {0x5f24, 0x0e},
>> +       {0x5f28, 0x10},
>> +       {0x5f2a, 0x0e},
>> +       {0x5f30, 0x12},
>> +       {0x5f32, 0x10},
>> +       {0x5f34, 0x0e},
>> +       {0x5f38, 0x0f},
>> +       {0x5f39, 0x0d},
>> +       {0x5f3c, 0x11},
>> +       {0x5f3d, 0x0f},
>> +       {0x5f3e, 0x0d},
>> +       {0x5f61, 0x07},
>> +       {0x5f64, 0x05},
>> +       {0x5f67, 0x03},
>> +       {0x5f6a, 0x03},
>> +       {0x5f6d, 0x07},
>> +       {0x5f70, 0x07},
>> +       {0x5f73, 0x05},
>> +       {0x5f76, 0x02},
>> +       {0x5f79, 0x07},
>> +       {0x5f7c, 0x07},
>> +       {0x5f7f, 0x07},
>> +       {0x5f82, 0x07},
>> +       {0x5f85, 0x03},
>> +       {0x5f88, 0x02},
>> +       {0x5f8b, 0x01},
>> +       {0x5f8e, 0x01},
>> +       {0x5f91, 0x04},
>> +       {0x5f94, 0x05},
>> +       {0x5f97, 0x02},
>> +       {0x5f9d, 0x07},
>> +       {0x5fa0, 0x07},
>> +       {0x5fa3, 0x07},
>> +       {0x5fa6, 0x07},
>> +       {0x5fa9, 0x03},
>> +       {0x5fac, 0x01},
>> +       {0x5faf, 0x01},
>> +       {0x5fb5, 0x03},
>> +       {0x5fb8, 0x02},
>> +       {0x5fbb, 0x01},
>> +       {0x5fc1, 0x07},
>> +       {0x5fc4, 0x07},
>> +       {0x5fc7, 0x07},
>> +       {0x5fd1, 0x00},
>> +       {0x6302, 0x79},
>> +       {0x6305, 0x78},
>> +       {0x6306, 0xa5},
>> +       {0x6308, 0x03},
>> +       {0x6309, 0x20},
>> +       {0x630b, 0x0a},
>> +       {0x630d, 0x48},
>> +       {0x630f, 0x06},
>> +       {0x6311, 0xa4},
>> +       {0x6313, 0x03},
>> +       {0x6314, 0x20},
>> +       {0x6316, 0x0a},
>> +       {0x6317, 0x31},
>> +       {0x6318, 0x4a},
>> +       {0x631a, 0x06},
>> +       {0x631b, 0x40},
>> +       {0x631c, 0xa4},
>> +       {0x631e, 0x03},
>> +       {0x631f, 0x20},
>> +       {0x6321, 0x0a},
>> +       {0x6323, 0x4a},
>> +       {0x6328, 0x80},
>> +       {0x6329, 0x01},
>> +       {0x632a, 0x30},
>> +       {0x632b, 0x02},
>> +       {0x632c, 0x20},
>> +       {0x632d, 0x02},
>> +       {0x632e, 0x30},
>> +       {0x6330, 0x60},
>> +       {0x6332, 0x90},
>> +       {0x6333, 0x01},
>> +       {0x6334, 0x30},
>> +       {0x6335, 0x02},
>> +       {0x6336, 0x20},
>> +       {0x6338, 0x80},
>> +       {0x633a, 0xa0},
>> +       {0x633b, 0x01},
>> +       {0x633c, 0x60},
>> +       {0x633d, 0x02},
>> +       {0x633e, 0x60},
>> +       {0x633f, 0x01},
>> +       {0x6340, 0x30},
>> +       {0x6341, 0x02},
>> +       {0x6342, 0x20},
>> +       {0x6343, 0x03},
>> +       {0x6344, 0x80},
>> +       {0x6345, 0x03},
>> +       {0x6346, 0x90},
>> +       {0x6348, 0xf0},
>> +       {0x6349, 0x01},
>> +       {0x634a, 0x20},
>> +       {0x634b, 0x02},
>> +       {0x634c, 0x10},
>> +       {0x634d, 0x03},
>> +       {0x634e, 0x60},
>> +       {0x6350, 0xa0},
>> +       {0x6351, 0x01},
>> +       {0x6352, 0x60},
>> +       {0x6353, 0x02},
>> +       {0x6354, 0x50},
>> +       {0x6355, 0x02},
>> +       {0x6356, 0x60},
>> +       {0x6357, 0x01},
>> +       {0x6358, 0x30},
>> +       {0x6359, 0x02},
>> +       {0x635a, 0x30},
>> +       {0x635b, 0x03},
>> +       {0x635c, 0x90},
>> +       {0x635f, 0x01},
>> +       {0x6360, 0x10},
>> +       {0x6361, 0x01},
>> +       {0x6362, 0x40},
>> +       {0x6363, 0x02},
>> +       {0x6364, 0x50},
>> +       {0x6368, 0x70},
>> +       {0x636a, 0xa0},
>> +       {0x636b, 0x01},
>> +       {0x636c, 0x50},
>> +       {0x637d, 0xe4},
>> +       {0x637e, 0xb4},
>> +       {0x638c, 0x8e},
>> +       {0x638d, 0x38},
>> +       {0x638e, 0xe3},
>> +       {0x638f, 0x4c},
>> +       {0x6390, 0x30},
>> +       {0x6391, 0xc3},
>> +       {0x6392, 0xae},
>> +       {0x6393, 0xba},
>> +       {0x6394, 0xeb},
>> +       {0x6395, 0x6e},
>> +       {0x6396, 0x34},
>> +       {0x6397, 0xe3},
>> +       {0x6398, 0xcf},
>> +       {0x6399, 0x3c},
>> +       {0x639a, 0xf3},
>> +       {0x639b, 0x0c},
>> +       {0x639c, 0x30},
>> +       {0x639d, 0xc1},
>> +       {0x63b9, 0xa3},
>> +       {0x63ba, 0xfe},
>> +       {0x7600, 0x01},
>> +       {0x79a0, 0x01},
>> +       {0x79a1, 0x01},
>> +       {0x79a2, 0x01},
>> +       {0x79a3, 0x01},
>> +       {0x79a4, 0x01},
>> +       {0x79a5, 0x20},
>> +       {0x79a9, 0x00},
>> +       {0x79aa, 0x01},
>> +       {0x79ad, 0x00},
>> +       {0x79af, 0x00},
>> +       {0x8173, 0x01},
>> +       {0x835c, 0x01},
>> +       {0x8a74, 0x01},
>> +       {0x8c1f, 0x00},
>> +       {0x8c27, 0x00},
>> +       {0x8c3b, 0x03},
>> +       {0x9004, 0x0b},
>> +       {0x920c, 0x6a},
>> +       {0x920d, 0x22},
>> +       {0x920e, 0x6a},
>> +       {0x920f, 0x23},
>> +       {0x9214, 0x6a},
>> +       {0x9215, 0x20},
>> +       {0x9216, 0x6a},
>> +       {0x9217, 0x21},
>> +       {0x9385, 0x3e},
>> +       {0x9387, 0x1b},
>> +       {0x938d, 0x4d},
>> +       {0x938f, 0x43},
>> +       {0x9391, 0x1b},
>> +       {0x9395, 0x4d},
>> +       {0x9397, 0x43},
>> +       {0x9399, 0x1b},
>> +       {0x939d, 0x3e},
>> +       {0x939f, 0x2f},
>> +       {0x93a5, 0x43},
>> +       {0x93a7, 0x2f},
>> +       {0x93a9, 0x2f},
>> +       {0x93ad, 0x34},
>> +       {0x93af, 0x2f},
>> +       {0x93b5, 0x3e},
>> +       {0x93b7, 0x2f},
>> +       {0x93bd, 0x4d},
>> +       {0x93bf, 0x43},
>> +       {0x93c1, 0x2f},
>> +       {0x93c5, 0x4d},
>> +       {0x93c7, 0x43},
>> +       {0x93c9, 0x2f},
>> +       {0x974b, 0x02},
>> +       {0x995c, 0x8c},
>> +       {0x995d, 0x00},
>> +       {0x995e, 0x00},
>> +       {0x9963, 0x64},
>> +       {0x9964, 0x50},
>> +       {0xaa0a, 0x26},
>> +       {0xae03, 0x04},
>> +       {0xae04, 0x03},
>> +       {0xae05, 0x03},
>> +       {0xbc1c, 0x08},
>> +       {0xbcf1, 0x02},
>> +};
>> +
>> +/* 16 mpix 10fps */
>> +static const struct imx519_reg mode_4656x3496_regs[] = {
>> +       {0x0111, 0x02},
>> +       {0x0112, 0x0a},
>> +       {0x0113, 0x0a},
>> +       {0x0114, 0x01},
>> +       {0x0342, 0x42},
>> +       {0x0343, 0x00},
>> +       {0x0340, 0x0d},
>> +       {0x0341, 0xf4},
>> +       {0x0344, 0x00},
>> +       {0x0345, 0x00},
>> +       {0x0346, 0x00},
>> +       {0x0347, 0x00},
>> +       {0x0348, 0x12},
>> +       {0x0349, 0x2f},
>> +       {0x034a, 0x0d},
>> +       {0x034b, 0xa7},
>> +       {0x0220, 0x00},
>> +       {0x0221, 0x11},
>> +       {0x0222, 0x01},
>> +       {0x0900, 0x00},
>> +       {0x0901, 0x11},
>> +       {0x0902, 0x0a},
>> +       {0x3f4c, 0x01},
>> +       {0x3f4d, 0x01},
>> +       {0x4254, 0x7f},
>> +       {0x0401, 0x00},
>> +       {0x0404, 0x00},
>> +       {0x0405, 0x10},
>> +       {0x0408, 0x00},
>> +       {0x0409, 0x00},
>> +       {0x040a, 0x00},
>> +       {0x040b, 0x00},
>> +       {0x040c, 0x12},
>> +       {0x040d, 0x30},
>> +       {0x040e, 0x0d},
>> +       {0x040f, 0xa8},
>> +       {0x034c, 0x12},
>> +       {0x034d, 0x30},
>> +       {0x034e, 0x0d},
>> +       {0x034f, 0xa8},
>> +       {0x0301, 0x06},
>> +       {0x0303, 0x04},
>> +       {0x0305, 0x04},
>> +       {0x0306, 0x01},
>> +       {0x0307, 0x57},
>> +       {0x0309, 0x0a},
>> +       {0x030b, 0x02},
>> +       {0x030d, 0x04},
>> +       {0x030e, 0x01},
>> +       {0x030f, 0x49},
>> +       {0x0310, 0x01},
>> +       {0x0820, 0x07},
>> +       {0x0821, 0xb6},
>> +       {0x0822, 0x00},
>> +       {0x0823, 0x00},
>> +       {0x3e20, 0x01},
>> +       {0x3e37, 0x00},
>> +       {0x3e3b, 0x00},
>> +       {0x0106, 0x00},
>> +       {0x0b00, 0x00},
>> +       {0x3230, 0x00},
>> +       {0x3f14, 0x01},
>> +       {0x3f3c, 0x01},
>> +       {0x3f0d, 0x0a},
>> +       {0x3fbc, 0x00},
>> +       {0x3c06, 0x00},
>> +       {0x3c07, 0x48},
>> +       {0x3c0a, 0x00},
>> +       {0x3c0b, 0x00},
>> +       {0x3f78, 0x00},
>> +       {0x3f79, 0x40},
>> +       {0x3f7c, 0x00},
>> +       {0x3f7d, 0x00},
>> +};
>> +
>> +/* 4k 21fps mode */
>> +static const struct imx519_reg mode_3840x2160_regs[] = {
>> +       {0x0111, 0x02},
>> +       {0x0112, 0x0a},
>> +       {0x0113, 0x0a},
>> +       {0x0114, 0x01},
>> +       {0x0342, 0x38},
>> +       {0x0343, 0x70},
>> +       {0x0340, 0x08},
>> +       {0x0341, 0xd4},
>> +       {0x0344, 0x01},
>> +       {0x0345, 0x98},
>> +       {0x0346, 0x02},
>> +       {0x0347, 0xa0},
>> +       {0x0348, 0x10},
>> +       {0x0349, 0x97},
>> +       {0x034a, 0x0b},
>> +       {0x034b, 0x17},
>> +       {0x0220, 0x00},
>> +       {0x0221, 0x11},
>> +       {0x0222, 0x01},
>> +       {0x0900, 0x00},
>> +       {0x0901, 0x11},
>> +       {0x0902, 0x0a},
>> +       {0x3f4c, 0x01},
>> +       {0x3f4d, 0x01},
>> +       {0x4254, 0x7f},
>> +       {0x0401, 0x00},
>> +       {0x0404, 0x00},
>> +       {0x0405, 0x10},
>> +       {0x0408, 0x00},
>> +       {0x0409, 0x00},
>> +       {0x040a, 0x00},
>> +       {0x040b, 0x00},
>> +       {0x040c, 0x0f},
>> +       {0x040d, 0x00},
>> +       {0x040e, 0x08},
>> +       {0x040f, 0x70},
>> +       {0x034c, 0x0f},
>> +       {0x034d, 0x00},
>> +       {0x034e, 0x08},
>> +       {0x034f, 0x70},
>> +       {0x0301, 0x06},
>> +       {0x0303, 0x04},
>> +       {0x0305, 0x04},
>> +       {0x0306, 0x01},
>> +       {0x0307, 0x57},
>> +       {0x0309, 0x0a},
>> +       {0x030b, 0x02},
>> +       {0x030d, 0x04},
>> +       {0x030e, 0x01},
>> +       {0x030f, 0x49},
>> +       {0x0310, 0x01},
>> +       {0x0820, 0x07},
>> +       {0x0821, 0xb6},
>> +       {0x0822, 0x00},
>> +       {0x0823, 0x00},
>> +       {0x3e20, 0x01},
>> +       {0x3e37, 0x00},
>> +       {0x3e3b, 0x00},
>> +       {0x0106, 0x00},
>> +       {0x0b00, 0x00},
>> +       {0x3230, 0x00},
>> +       {0x3f14, 0x01},
>> +       {0x3f3c, 0x01},
>> +       {0x3f0d, 0x0a},
>> +       {0x3fbc, 0x00},
>> +       {0x3c06, 0x00},
>> +       {0x3c07, 0x48},
>> +       {0x3c0a, 0x00},
>> +       {0x3c0b, 0x00},
>> +       {0x3f78, 0x00},
>> +       {0x3f79, 0x40},
>> +       {0x3f7c, 0x00},
>> +       {0x3f7d, 0x00},
>> +};
>> +
>> +/* 2x2 binned 30fps mode */
>> +static const struct imx519_reg mode_2328x1748_regs[] = {
>> +       {0x0111, 0x02},
>> +       {0x0112, 0x0a},
>> +       {0x0113, 0x0a},
>> +       {0x0114, 0x01},
>> +       {0x0342, 0x24},
>> +       {0x0343, 0x12},
>> +       {0x0340, 0x09},
>> +       {0x0341, 0xac},
>> +       {0x0344, 0x00},
>> +       {0x0345, 0x00},
>> +       {0x0346, 0x00},
>> +       {0x0347, 0x00},
>> +       {0x0348, 0x12},
>> +       {0x0349, 0x2f},
>> +       {0x034a, 0x0d},
>> +       {0x034b, 0xa7},
>> +       {0x0220, 0x00},
>> +       {0x0221, 0x11},
>> +       {0x0222, 0x01},
>> +       {0x0900, 0x01},
>> +       {0x0901, 0x22},
>> +       {0x0902, 0x0a},
>> +       {0x3f4c, 0x01},
>> +       {0x3f4d, 0x01},
>> +       {0x4254, 0x7f},
>> +       {0x0401, 0x00},
>> +       {0x0404, 0x00},
>> +       {0x0405, 0x10},
>> +       {0x0408, 0x00},
>> +       {0x0409, 0x00},
>> +       {0x040a, 0x00},
>> +       {0x040b, 0x00},
>> +       {0x040c, 0x09},
>> +       {0x040d, 0x18},
>> +       {0x040e, 0x06},
>> +       {0x040f, 0xd4},
>> +       {0x034c, 0x09},
>> +       {0x034d, 0x18},
>> +       {0x034e, 0x06},
>> +       {0x034f, 0xd4},
>> +       {0x0301, 0x06},
>> +       {0x0303, 0x04},
>> +       {0x0305, 0x04},
>> +       {0x0306, 0x01},
>> +       {0x0307, 0x57},
>> +       {0x0309, 0x0a},
>> +       {0x030b, 0x02},
>> +       {0x030d, 0x04},
>> +       {0x030e, 0x01},
>> +       {0x030f, 0x49},
>> +       {0x0310, 0x01},
>> +       {0x0820, 0x07},
>> +       {0x0821, 0xb6},
>> +       {0x0822, 0x00},
>> +       {0x0823, 0x00},
>> +       {0x3e20, 0x01},
>> +       {0x3e37, 0x00},
>> +       {0x3e3b, 0x00},
>> +       {0x0106, 0x00},
>> +       {0x0b00, 0x00},
>> +       {0x3230, 0x00},
>> +       {0x3f14, 0x01},
>> +       {0x3f3c, 0x01},
>> +       {0x3f0d, 0x0a},
>> +       {0x3fbc, 0x00},
>> +       {0x3c06, 0x00},
>> +       {0x3c07, 0x48},
>> +       {0x3c0a, 0x00},
>> +       {0x3c0b, 0x00},
>> +       {0x3f78, 0x00},
>> +       {0x3f79, 0x40},
>> +       {0x3f7c, 0x00},
>> +       {0x3f7d, 0x00},
>> +};
>> +
>> +/* 1080p 60fps mode */
>> +static const struct imx519_reg mode_1920x1080_regs[] = {
>> +       {0x0111, 0x02},
>> +       {0x0112, 0x0a},
>> +       {0x0113, 0x0a},
>> +       {0x0114, 0x01},
>> +       {0x0342, 0x25},
>> +       {0x0343, 0xd9},
>> +       {0x0340, 0x04},
>> +       {0x0341, 0x9c},
>> +       {0x0344, 0x01},
>> +       {0x0345, 0x98},
>> +       {0x0346, 0x02},
>> +       {0x0347, 0xa2},
>> +       {0x0348, 0x10},
>> +       {0x0349, 0x97},
>> +       {0x034a, 0x0b},
>> +       {0x034b, 0x15},
>> +       {0x0220, 0x00},
>> +       {0x0221, 0x11},
>> +       {0x0222, 0x01},
>> +       {0x0900, 0x01},
>> +       {0x0901, 0x22},
>> +       {0x0902, 0x0a},
>> +       {0x3f4c, 0x01},
>> +       {0x3f4d, 0x01},
>> +       {0x4254, 0x7f},
>> +       {0x0401, 0x00},
>> +       {0x0404, 0x00},
>> +       {0x0405, 0x10},
>> +       {0x0408, 0x00},
>> +       {0x0409, 0x00},
>> +       {0x040a, 0x00},
>> +       {0x040b, 0x00},
>> +       {0x040c, 0x07},
>> +       {0x040d, 0x80},
>> +       {0x040e, 0x04},
>> +       {0x040f, 0x38},
>> +       {0x034c, 0x07},
>> +       {0x034d, 0x80},
>> +       {0x034e, 0x04},
>> +       {0x034f, 0x38},
>> +       {0x0301, 0x06},
>> +       {0x0303, 0x04},
>> +       {0x0305, 0x04},
>> +       {0x0306, 0x01},
>> +       {0x0307, 0x57},
>> +       {0x0309, 0x0a},
>> +       {0x030b, 0x02},
>> +       {0x030d, 0x04},
>> +       {0x030e, 0x01},
>> +       {0x030f, 0x49},
>> +       {0x0310, 0x01},
>> +       {0x0820, 0x07},
>> +       {0x0821, 0xb6},
>> +       {0x0822, 0x00},
>> +       {0x0823, 0x00},
>> +       {0x3e20, 0x01},
>> +       {0x3e37, 0x00},
>> +       {0x3e3b, 0x00},
>> +       {0x0106, 0x00},
>> +       {0x0b00, 0x00},
>> +       {0x3230, 0x00},
>> +       {0x3f14, 0x01},
>> +       {0x3f3c, 0x01},
>> +       {0x3f0d, 0x0a},
>> +       {0x3fbc, 0x00},
>> +       {0x3c06, 0x00},
>> +       {0x3c07, 0x48},
>> +       {0x3c0a, 0x00},
>> +       {0x3c0b, 0x00},
>> +       {0x3f78, 0x00},
>> +       {0x3f79, 0x40},
>> +       {0x3f7c, 0x00},
>> +       {0x3f7d, 0x00},
>> +};
>> +
>> +/* 720p 120fps mode */
>> +static const struct imx519_reg mode_1280x720_regs[] = {
>> +       {0x0111, 0x02},
>> +       {0x0112, 0x0a},
>> +       {0x0113, 0x0a},
>> +       {0x0114, 0x01},
>> +       {0x0342, 0x1b},
>> +       {0x0343, 0x3b},
>> +       {0x0340, 0x03},
>> +       {0x0341, 0x34},
>> +       {0x0344, 0x04},
>> +       {0x0345, 0x18},
>> +       {0x0346, 0x04},
>> +       {0x0347, 0x12},
>> +       {0x0348, 0x0e},
>> +       {0x0349, 0x17},
>> +       {0x034a, 0x09},
>> +       {0x034b, 0xb6},
>> +       {0x0220, 0x00},
>> +       {0x0221, 0x11},
>> +       {0x0222, 0x01},
>> +       {0x0900, 0x01},
>> +       {0x0901, 0x22},
>> +       {0x0902, 0x0a},
>> +       {0x3f4c, 0x01},
>> +       {0x3f4d, 0x01},
>> +       {0x4254, 0x7f},
>> +       {0x0401, 0x00},
>> +       {0x0404, 0x00},
>> +       {0x0405, 0x10},
>> +       {0x0408, 0x00},
>> +       {0x0409, 0x00},
>> +       {0x040a, 0x00},
>> +       {0x040b, 0x00},
>> +       {0x040c, 0x05},
>> +       {0x040d, 0x00},
>> +       {0x040e, 0x02},
>> +       {0x040f, 0xd0},
>> +       {0x034c, 0x05},
>> +       {0x034d, 0x00},
>> +       {0x034e, 0x02},
>> +       {0x034f, 0xd0},
>> +       {0x0301, 0x06},
>> +       {0x0303, 0x04},
>> +       {0x0305, 0x04},
>> +       {0x0306, 0x01},
>> +       {0x0307, 0x57},
>> +       {0x0309, 0x0a},
>> +       {0x030b, 0x02},
>> +       {0x030d, 0x04},
>> +       {0x030e, 0x01},
>> +       {0x030f, 0x49},
>> +       {0x0310, 0x01},
>> +       {0x0820, 0x07},
>> +       {0x0821, 0xb6},
>> +       {0x0822, 0x00},
>> +       {0x0823, 0x00},
>> +       {0x3e20, 0x01},
>> +       {0x3e37, 0x00},
>> +       {0x3e3b, 0x00},
>> +       {0x0106, 0x00},
>> +       {0x0b00, 0x00},
>> +       {0x3230, 0x00},
>> +       {0x3f14, 0x01},
>> +       {0x3f3c, 0x01},
>> +       {0x3f0d, 0x0a},
>> +       {0x3fbc, 0x00},
>> +       {0x3c06, 0x00},
>> +       {0x3c07, 0x48},
>> +       {0x3c0a, 0x00},
>> +       {0x3c0b, 0x00},
>> +       {0x3f78, 0x00},
>> +       {0x3f79, 0x40},
>> +       {0x3f7c, 0x00},
>> +       {0x3f7d, 0x00},
>> +};
>> +
>> +/* Mode configs */
>> +static const struct imx519_mode supported_modes_10bit[] = {
>> +       {
>> +               .width = 4656,
>> +               .height = 3496,
>> +               .line_length_pix = 0x4200,
>> +               .crop = {
>> +                       .left = IMX519_PIXEL_ARRAY_LEFT,
>> +                       .top = IMX519_PIXEL_ARRAY_TOP,
>> +                       .width = 4656,
>> +                       .height = 3496,
>> +               },
>> +               .timeperframe_min = {
>> +                       .numerator = 100,
>> +                       .denominator = 1000
>> +               },
>> +               .timeperframe_default = {
>> +                       .numerator = 100,
>> +                       .denominator = 1000
>> +               },
>> +               .reg_list = {
>> +                       .num_of_regs = ARRAY_SIZE(mode_4656x3496_regs),
>> +                       .regs = mode_4656x3496_regs,
>> +               }
>> +       },
>> +       {
>> +               .width = 3840,
>> +               .height = 2160,
>> +               .line_length_pix = 0x3870,
>> +               .crop = {
>> +                       .left = IMX519_PIXEL_ARRAY_LEFT + 408,
>> +                       .top = IMX519_PIXEL_ARRAY_TOP + 672,
>> +                       .width = 3840,
>> +                       .height = 2160,
>> +               },
>> +               .timeperframe_min = {
>> +                       .numerator = 100,
>> +                       .denominator = 2100
>> +               },
>> +               .timeperframe_default = {
>> +                       .numerator = 100,
>> +                       .denominator = 2100
>> +               },
>> +               .reg_list = {
>> +                       .num_of_regs = ARRAY_SIZE(mode_3840x2160_regs),
>> +                       .regs = mode_3840x2160_regs,
>> +               }
>> +       },
>> +       {
>> +               .width = 2328,
>> +               .height = 1748,
>> +               .line_length_pix = 0x2412,
>> +               .crop = {
>> +                       .left = IMX519_PIXEL_ARRAY_LEFT,
>> +                       .top = IMX519_PIXEL_ARRAY_TOP,
>> +                       .width = 4656,
>> +                       .height = 3496,
>> +               },
>> +               .timeperframe_min = {
>> +                       .numerator = 100,
>> +                       .denominator = 3000
>> +               },
>> +               .timeperframe_default = {
>> +                       .numerator = 100,
>> +                       .denominator = 3000
>> +               },
>> +               .reg_list = {
>> +                       .num_of_regs = ARRAY_SIZE(mode_2328x1748_regs),
>> +                       .regs = mode_2328x1748_regs,
>> +               }
>> +       },
>> +       {
>> +               .width = 1920,
>> +               .height = 1080,
>> +               .line_length_pix = 0x25D9,
>> +               .crop = {
>> +                       .left = IMX519_PIXEL_ARRAY_LEFT + 408,
>> +                       .top = IMX519_PIXEL_ARRAY_TOP + 674,
>> +                       .width = 3840,
>> +                       .height = 2160,
>> +               },
>> +               .timeperframe_min = {
>> +                       .numerator = 100,
>> +                       .denominator = 6000
>> +               },
>> +               .timeperframe_default = {
>> +                       .numerator = 100,
>> +                       .denominator = 6000
>> +               },
>> +               .reg_list = {
>> +                       .num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
>> +                       .regs = mode_1920x1080_regs,
>> +               }
>> +       },
>> +       {
>> +               .width = 1280,
>> +               .height = 720,
>> +               .line_length_pix = 0x1B3B,
>> +               .crop = {
>> +                       .left = IMX519_PIXEL_ARRAY_LEFT + 1048,
>> +                       .top = IMX519_PIXEL_ARRAY_TOP + 1042,
>> +                       .width = 2560,
>> +                       .height = 1440,
>> +               },
>> +               .timeperframe_min = {
>> +                       .numerator = 100,
>> +                       .denominator = 12000
>> +               },
>> +               .timeperframe_default = {
>> +                       .numerator = 100,
>> +                       .denominator = 12000
>> +               },
>> +               .reg_list = {
>> +                       .num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
>> +                       .regs = mode_1280x720_regs,
>> +               }
>> +       }
>> +};
>> +
>> +/*
>> + * The supported formats.
>> + * This table MUST contain 4 entries per format, to cover the various flip
>> + * combinations in the order
>> + * - no flip
>> + * - h flip
>> + * - v flip
>> + * - h&v flips
>> + */
>> +static const u32 codes[] = {
>> +       /* 10-bit modes. */
>> +       MEDIA_BUS_FMT_SRGGB10_1X10,
>> +       MEDIA_BUS_FMT_SGRBG10_1X10,
>> +       MEDIA_BUS_FMT_SGBRG10_1X10,
>> +       MEDIA_BUS_FMT_SBGGR10_1X10,
>> +};
>> +
>> +static const char * const imx519_test_pattern_menu[] = {
>> +       "Disabled",
>> +       "Color Bars",
>> +       "Solid Color",
>> +       "Grey Color Bars",
>> +       "PN9"
>> +};
>> +
>> +static const int imx519_test_pattern_val[] = {
>> +       IMX519_TEST_PATTERN_DISABLE,
>> +       IMX519_TEST_PATTERN_COLOR_BARS,
>> +       IMX519_TEST_PATTERN_SOLID_COLOR,
>> +       IMX519_TEST_PATTERN_GREY_COLOR,
>> +       IMX519_TEST_PATTERN_PN9,
>> +};
>> +
>> +/* regulator supplies */
>> +static const char * const imx519_supply_name[] = {
>> +       /* Supplies can be enabled in any order */
>> +       "VANA",  /* Analog (2.8V) supply */
>> +       "VDIG",  /* Digital Core (1.05V) supply */
>> +       "VDDL",  /* IF (1.8V) supply */
>> +};
>> +
>> +#define IMX519_NUM_SUPPLIES ARRAY_SIZE(imx519_supply_name)
>> +
>> +/*
>> + * Initialisation delay between XCLR low->high and the moment when the sensor
>> + * can start capture (i.e. can leave software standby), given by T7 in the
>> + * datasheet is 8ms.  This does include I2C setup time as well.
>> + *
>> + * Note, that delay between XCLR low->high and reading the CCI ID register (T6
>> + * in the datasheet) is much smaller - 600us.
>> + */
>> +#define IMX519_XCLR_MIN_DELAY_US       8000
>> +#define IMX519_XCLR_DELAY_RANGE_US     1000
>> +
>> +struct imx519 {
>> +       struct v4l2_subdev sd;
>> +       struct media_pad pad;
>> +
>> +       unsigned int fmt_code;
>> +
>> +       struct clk *xclk;
>> +
>> +       struct gpio_desc *reset_gpio;
>> +       struct regulator_bulk_data supplies[IMX519_NUM_SUPPLIES];
>> +
>> +       struct v4l2_ctrl_handler ctrl_handler;
>> +       /* V4L2 Controls */
>> +       struct v4l2_ctrl *exposure;
>> +       struct v4l2_ctrl *vflip;
>> +       struct v4l2_ctrl *hflip;
>> +       struct v4l2_ctrl *vblank;
>> +       struct v4l2_ctrl *hblank;
>> +
>> +       /* Current mode */
>> +       const struct imx519_mode *mode;
>> +
>> +       /*
>> +        * Mutex for serialized access:
>> +        * Protect sensor module set pad format and start/stop streaming safely.
>> +        */
>> +       struct mutex mutex;
>> +
>> +       /* Streaming on/off */
>> +       bool streaming;
>> +
>> +       /* Rewrite common registers on stream on? */
>> +       bool common_regs_written;
>> +
>> +       /* Current long exposure factor in use. Set through V4L2_CID_VBLANK */
>> +       unsigned int long_exp_shift;
>> +};
>> +
>> +static inline struct imx519 *to_imx519(struct v4l2_subdev *_sd)
>> +{
>> +       return container_of(_sd, struct imx519, sd);
>> +}
>> +
>> +/* Read registers up to 2 at a time */
>> +static int imx519_read_reg(struct imx519 *imx519, u16 reg, u32 len, u32 *val)
>> +{
>> +       struct i2c_client *client = v4l2_get_subdevdata(&imx519->sd);
>> +       struct i2c_msg msgs[2];
>> +       u8 addr_buf[2] = { reg >> 8, reg & 0xff };
>> +       u8 data_buf[4] = { 0, };
>> +       int ret;
>> +
>> +       if (len > 4)
>> +               return -EINVAL;
>> +
>> +       /* Write register address */
>> +       msgs[0].addr = client->addr;
>> +       msgs[0].flags = 0;
>> +       msgs[0].len = ARRAY_SIZE(addr_buf);
>> +       msgs[0].buf = addr_buf;
>> +
>> +       /* Read data from register */
>> +       msgs[1].addr = client->addr;
>> +       msgs[1].flags = I2C_M_RD;
>> +       msgs[1].len = len;
>> +       msgs[1].buf = &data_buf[4 - len];
>> +
>> +       ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
>> +       if (ret != ARRAY_SIZE(msgs))
>> +               return -EIO;
>> +
>> +       *val = get_unaligned_be32(data_buf);
>> +
>> +       return 0;
>> +}
>> +
>> +/* Write registers up to 2 at a time */
>> +static int imx519_write_reg(struct imx519 *imx519, u16 reg, u32 len, u32 val)
>> +{
>> +       struct i2c_client *client = v4l2_get_subdevdata(&imx519->sd);
>> +       u8 buf[6];
>> +
>> +       if (len > 4)
>> +               return -EINVAL;
>> +
>> +       put_unaligned_be16(reg, buf);
>> +       put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
>> +       if (i2c_master_send(client, buf, len + 2) != len + 2)
>> +               return -EIO;
>> +
>> +       return 0;
>> +}
>> +
>> +/* Write a list of registers */
>> +static int imx519_write_regs(struct imx519 *imx519,
>> +                            const struct imx519_reg *regs, u32 len)
>> +{
>> +       struct i2c_client *client = v4l2_get_subdevdata(&imx519->sd);
>> +       unsigned int i;
>> +       int ret;
>> +
>> +       for (i = 0; i < len; i++) {
>> +               ret = imx519_write_reg(imx519, regs[i].address, 1, regs[i].val);
>> +               if (ret) {
>> +                       dev_err_ratelimited(&client->dev,
>> +                                           "Failed to write reg 0x%4.4x. error = %d\n",
>> +                                           regs[i].address, ret);
>> +
>> +                       return ret;
>> +               }
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +/* Get bayer order based on flip setting. */
>> +static u32 imx519_get_format_code(struct imx519 *imx519)
>> +{
>> +       unsigned int i;
>> +
>> +       lockdep_assert_held(&imx519->mutex);
>> +
>> +       i = (imx519->vflip->val ? 2 : 0) |
>> +           (imx519->hflip->val ? 1 : 0);
>> +
>> +       return codes[i];
>> +}
>> +
>> +static int imx519_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>> +{
>> +       struct imx519 *imx519 = to_imx519(sd);
>> +       struct v4l2_mbus_framefmt *try_fmt_img =
>> +               v4l2_subdev_get_try_format(sd, fh->state, 0);
>> +       struct v4l2_rect *try_crop =
>> +               v4l2_subdev_get_try_crop(sd, fh->state, 0);
>> +
>> +       mutex_lock(&imx519->mutex);
>> +
>> +       /* Initialize try_fmt for the image pad */
>> +       try_fmt_img->width = supported_modes_10bit[0].width;
>> +       try_fmt_img->height = supported_modes_10bit[0].height;
>> +       try_fmt_img->code = imx519_get_format_code(imx519);
>> +       try_fmt_img->field = V4L2_FIELD_NONE;
>> +
>> +       /* Initialize try_crop */
>> +       try_crop->left = IMX519_PIXEL_ARRAY_LEFT;
>> +       try_crop->top = IMX519_PIXEL_ARRAY_TOP;
>> +       try_crop->width = IMX519_PIXEL_ARRAY_WIDTH;
>> +       try_crop->height = IMX519_PIXEL_ARRAY_HEIGHT;
>> +
>> +       mutex_unlock(&imx519->mutex);
>> +
>> +       return 0;
>> +}
>> +
>> +static void imx519_adjust_exposure_range(struct imx519 *imx519)
>> +{
>> +       int exposure_max, exposure_def;
>> +
>> +       /* Honour the VBLANK limits when setting exposure. */
>> +       exposure_max = imx519->mode->height + imx519->vblank->val -
>> +                      IMX519_EXPOSURE_OFFSET;
>> +       exposure_def = min(exposure_max, imx519->exposure->val);
>> +       __v4l2_ctrl_modify_range(imx519->exposure, imx519->exposure->minimum,
>> +                                exposure_max, imx519->exposure->step,
>> +                                exposure_def);
>> +}
>> +
>> +static int imx519_set_frame_length(struct imx519 *imx519, unsigned int val)
>> +{
>> +       int ret = 0;
>> +
>> +       imx519->long_exp_shift = 0;
>> +
>> +       while (val > IMX519_FRAME_LENGTH_MAX) {
>> +               imx519->long_exp_shift++;
>> +               val >>= 1;
>> +       }
>> +
>> +       ret = imx519_write_reg(imx519, IMX519_REG_FRAME_LENGTH,
>> +                              IMX519_REG_VALUE_16BIT, val);
>> +       if (ret)
>> +               return ret;
>> +
>> +       return imx519_write_reg(imx519, IMX519_LONG_EXP_SHIFT_REG,
>> +                               IMX519_REG_VALUE_08BIT, imx519->long_exp_shift);
>> +}
>> +
>> +static int imx519_set_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +       struct imx519 *imx519 =
>> +               container_of(ctrl->handler, struct imx519, ctrl_handler);
>> +       struct i2c_client *client = v4l2_get_subdevdata(&imx519->sd);
>> +       int ret = 0;
>> +
>> +       /*
>> +        * The VBLANK control may change the limits of usable exposure, so check
>> +        * and adjust if necessary.
>> +        */
>> +       if (ctrl->id == V4L2_CID_VBLANK)
>> +               imx519_adjust_exposure_range(imx519);
>> +
>> +       /*
>> +        * Applying V4L2 control value only happens
>> +        * when power is up for streaming
>> +        */
>> +       if (pm_runtime_get_if_in_use(&client->dev) == 0)
>> +               return 0;
>> +
>> +       switch (ctrl->id) {
>> +       case V4L2_CID_ANALOGUE_GAIN:
>> +               ret = imx519_write_reg(imx519, IMX519_REG_ANALOG_GAIN,
>> +                                      IMX519_REG_VALUE_16BIT, ctrl->val);
>> +               break;
>> +       case V4L2_CID_EXPOSURE:
>> +               ret = imx519_write_reg(imx519, IMX519_REG_EXPOSURE,
>> +                                      IMX519_REG_VALUE_16BIT, ctrl->val >>
>> +                                                       imx519->long_exp_shift);
>> +               break;
>> +       case V4L2_CID_DIGITAL_GAIN:
>> +               ret = imx519_write_reg(imx519, IMX519_REG_DIGITAL_GAIN,
>> +                                      IMX519_REG_VALUE_16BIT, ctrl->val);
>> +               break;
>> +       case V4L2_CID_TEST_PATTERN:
>> +               ret = imx519_write_reg(imx519, IMX519_REG_TEST_PATTERN,
>> +                                      IMX519_REG_VALUE_16BIT,
>> +                                      imx519_test_pattern_val[ctrl->val]);
>> +               break;
>> +       case V4L2_CID_TEST_PATTERN_RED:
>> +               ret = imx519_write_reg(imx519, IMX519_REG_TEST_PATTERN_R,
>> +                                      IMX519_REG_VALUE_16BIT, ctrl->val);
>> +               break;
>> +       case V4L2_CID_TEST_PATTERN_GREENR:
>> +               ret = imx519_write_reg(imx519, IMX519_REG_TEST_PATTERN_GR,
>> +                                      IMX519_REG_VALUE_16BIT, ctrl->val);
>> +               break;
>> +       case V4L2_CID_TEST_PATTERN_BLUE:
>> +               ret = imx519_write_reg(imx519, IMX519_REG_TEST_PATTERN_B,
>> +                                      IMX519_REG_VALUE_16BIT, ctrl->val);
>> +               break;
>> +       case V4L2_CID_TEST_PATTERN_GREENB:
>> +               ret = imx519_write_reg(imx519, IMX519_REG_TEST_PATTERN_GB,
>> +                                      IMX519_REG_VALUE_16BIT, ctrl->val);
>> +               break;
>> +       case V4L2_CID_HFLIP:
>> +       case V4L2_CID_VFLIP:
>> +               ret = imx519_write_reg(imx519, IMX519_REG_ORIENTATION, 1,
>> +                                      imx519->hflip->val |
>> +                                      imx519->vflip->val << 1);
>> +               break;
>> +       case V4L2_CID_VBLANK:
>> +               ret = imx519_set_frame_length(imx519,
>> +                                             imx519->mode->height + ctrl->val);
>> +               break;
>> +       default:
>> +               dev_info(&client->dev,
>> +                        "ctrl(id:0x%x,val:0x%x) is not handled\n",
>> +                        ctrl->id, ctrl->val);
>> +               ret = -EINVAL;
>> +               break;
>> +       }
>> +
>> +       pm_runtime_put(&client->dev);
>> +
>> +       return ret;
>> +}
>> +
>> +static const struct v4l2_ctrl_ops imx519_ctrl_ops = {
>> +       .s_ctrl = imx519_set_ctrl,
>> +};
>> +
>> +static int imx519_enum_mbus_code(struct v4l2_subdev *sd,
>> +                                struct v4l2_subdev_state *sd_state,
>> +                                struct v4l2_subdev_mbus_code_enum *code)
>> +{
>> +       struct imx519 *imx519 = to_imx519(sd);
>> +
>> +       mutex_lock(&imx519->mutex);
>> +
>> +       if (code->index > 0)
>> +               return -EINVAL;
>> +
>> +       code->code = imx519_get_format_code(imx519);
>> +
>> +       mutex_unlock(&imx519->mutex);
>> +
>> +       return 0;
>> +}
>> +
>> +static int imx519_enum_frame_size(struct v4l2_subdev *sd,
>> +                                 struct v4l2_subdev_state *sd_state,
>> +                                 struct v4l2_subdev_frame_size_enum *fse)
>> +{
>> +       struct imx519 *imx519 = to_imx519(sd);
>> +
>> +       mutex_lock(&imx519->mutex);
> I've hit a deadlock here.
>
> [  139.389907] other info that might help us debug this:
> [  139.396435]  Possible unsafe locking scenario:
> [  139.396435]
> [  139.402353]        CPU0
> [  139.404797]        ----
> [  139.407243]   lock(&imx519->mutex);
> [  139.410737]   lock(&imx519->mutex);
> [  139.414230]
> [  139.414230]  *** DEADLOCK ***
> [  139.414230]
> [  139.420148]  May be due to missing lock nesting notation
> [  139.420148]
> [  139.426936] 1 lock held by cam/924:
> [  139.430425]  #0: ffff000003feb460 (&imx519->mutex){+.+.}-{3:3}, at: imx519_enum_mbus_code+0x3
> 4/0x70
> [  139.439490]
> [  139.439490] stack backtrace:
> [  139.443847] CPU: 3 PID: 924 Comm: cam Not tainted 6.1.0-rc2-14364-g9c47c8d45623 #41
> [  139.451505] Hardware name: Polyhex Debix Model A i.MX8MPlus board (DT)
> [  139.458033] Call trace:
> [  139.460479]  dump_backtrace+0xe4/0x140
> [  139.464234]  show_stack+0x20/0x50
> [  139.467555]  dump_stack_lvl+0x9c/0xd8
> [  139.471223]  dump_stack+0x18/0x34
> [  139.474544]  __lock_acquire+0x103c/0x1920
> [  139.478556]  lock_acquire.part.0+0xf0/0x26c
> [  139.482743]  lock_acquire+0x68/0x84
> [  139.486234]  __mutex_lock+0x8c/0x414
> [  139.489815]  mutex_lock_nested+0x34/0x40
> [  139.493741]  imx519_enum_frame_size+0x34/0xa4
> [  139.498101]  call_enum_frame_size_state+0x8c/0x130
> [  139.502895]  subdev_do_ioctl+0x910/0xdf0
> [  139.506823]  subdev_do_ioctl_lock+0x164/0x220
> [  139.511183]  video_usercopy+0x2ec/0x86c
> [  139.515021]  subdev_ioctl+0x20/0x30
> [  139.518512]  v4l2_ioctl+0x48/0x6c
> [  139.521835]  __arm64_sys_ioctl+0x44c/0xd70
> [  139.525936]  invoke_syscall.constprop.0+0x58/0xf0
> [  139.530645]  do_el0_svc+0x74/0x1a0
> [  139.534052]  el0_svc+0x54/0x124
> [  139.537198]  el0t_64_sync_handler+0xbc/0x13c
> [  139.541470]  el0t_64_sync+0x18c/0x190

Can confirm that I am hitting this as well - with RPi running mainline 
kernel branch v6.1-rc1
>
>> +
>> +       if (fse->index >= ARRAY_SIZE(supported_modes_10bit))
>> +               return -EINVAL;
>> +
>> +       if (fse->code != imx519_get_format_code(imx519))
>> +               return -EINVAL;
>> +
>> +       fse->min_width = supported_modes_10bit[fse->index].width;
>> +       fse->max_width = fse->min_width;
>> +       fse->min_height = supported_modes_10bit[fse->index].height;
>> +       fse->max_height = fse->min_height;
>> +
>> +       mutex_unlock(&imx519->mutex);
>> +
>> +       return 0;
>> +}
>> +
>> +static void imx519_reset_colorspace(struct v4l2_mbus_framefmt *fmt)
>> +{
>> +       fmt->colorspace = V4L2_COLORSPACE_SRGB;

Also, shouldn't this report V4L2_COLORSPACE_RAW ?

<snip>

Regards,
uajain
