Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B83725088AE
	for <lists+linux-media@lfdr.de>; Wed, 20 Apr 2022 15:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378736AbiDTNE2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Apr 2022 09:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378727AbiDTNEX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Apr 2022 09:04:23 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BAA13A5D8
        for <linux-media@vger.kernel.org>; Wed, 20 Apr 2022 06:01:34 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23KArVEv031529;
        Wed, 20 Apr 2022 15:01:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : subject : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Dd5plXwFGVLNIjaLs32PMs1/lRMmBAFGFYHAv6kZdpg=;
 b=Jq2SwD5Rq0Hi2X/Ke9TC/y1KNyK1KdIVkRYQKTTZ9PbhNCyE2naDmY1NW0mzXm4oJH5R
 7svQlhQLZEPlhOQcQbO4YifDHpaSbmmNkB6USZTm+T+8dqX4imxLEiEaXAISCWjPnPMa
 CCcx0pVC2bSJEqV94RAwblpK0FhNO5esyGPLbYU8ilzB5hYZPb2GMxiwnM0hCyWWoLPE
 qmH+M63kiC9trSRtfndpwKxrkC1+aLMW19ACaFjSLomOQnshq5Aa44YXOD2I6kvCJ5lJ
 mYMR8DTb0DlrehCYfCedAdQFZqIVBxJxznMK79UUPKBjdm97oB7QbYKTP8uwC7sbuJ83 aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ffpqdw9g8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 20 Apr 2022 15:01:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0DBF8100038;
        Wed, 20 Apr 2022 15:01:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 06CC520FC96;
        Wed, 20 Apr 2022 15:01:25 +0200 (CEST)
Received: from [10.0.2.15] (10.75.127.49) by SFHDAG2NODE1.st.com (10.75.127.4)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 20 Apr 2022 15:01:24
 +0200
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: Re: [PATCH v2 5/5] media: i2c: Add driver for ST VGXY61 camera sensor
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>, <alain.volmat@foss.st.com>,
        <hugues.fruchet@foss.st.com>, <sylvain.petinot@foss.st.com>,
        <dave.stevenson@raspberrypi.com>, <sakari.ailus@linux.intel.com>,
        <kieran.bingham@ideasonboard.com>
References: <20220415111845.27130-1-benjamin.mugnier@foss.st.com>
 <20220415111845.27130-6-benjamin.mugnier@foss.st.com>
 <YlmRuM/aJkzpWwCL@pendragon.ideasonboard.com>
Message-ID: <ffab7764-8aac-61ab-2ec9-28a73f9878c7@foss.st.com>
Date:   Wed, 20 Apr 2022 15:01:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YlmRuM/aJkzpWwCL@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-20_03,2022-04-20_01,2022-02-23_01
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for your review.
Please consider everything I did not comment as agreed.

On 15/04/2022 17:39, Laurent Pinchart wrote:
> Hi Benjamin,
> 
> Thank you for the patch.
> 
> This is a partial review as I'm short on time now.
> 

No worries ;)

> On Fri, Apr 15, 2022 at 01:18:45PM +0200, Benjamin Mugnier wrote:
>> The VGXY61 has a quad lanes CSI-2 output port running at 800mbps per
>> lane, and supports RAW8, RAW10, RAW12, RAW14 and RAW16 formats.
>> The driver handles both sensor types:
>> - VG5661 and VG6661: 1.6 Mpx (1464 x 1104) 75fps.
>> - VG5761 and VG6761: 2.3 Mpx (1944 x 1204) 60 fps.
>> The driver supports:
>> - HDR linearize mode, HDR substraction mode, and no HDR
>> - GPIOs LEDs strobing
>> - Digital binning and analog subsampling
>> - Horizontal and vertical flip
>> - Manual exposure
>> - Analog and digital gains
>> - Test patterns
>>
>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>> ---
>>  drivers/media/i2c/Kconfig     |   10 +
>>  drivers/media/i2c/Makefile    |    1 +
>>  drivers/media/i2c/st-vgxy61.c | 1997 +++++++++++++++++++++++++++++++++
>>  3 files changed, 2008 insertions(+)
>>  create mode 100644 drivers/media/i2c/st-vgxy61.c
>>
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index fae2baabb773..734f3e1130b0 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -763,6 +763,16 @@ config VIDEO_VS6624
>>  	  To compile this driver as a module, choose M here: the
>>  	  module will be called vs6624.
>>  
>> +config VIDEO_ST_VGXY61
> 
> Alphabetical order please.
> 
>> +	tristate "ST VGXY61 sensor support"
>> +	depends on OF && GPIOLIB && VIDEO_DEV && I2C
>> +	select MEDIA_CONTROLLER
>> +	select VIDEO_V4L2_SUBDEV_API
>> +	select V4L2_FWNODE
>> +	help
>> +	  This is a Video4Linux2 sensor driver for the ST VGXY61
>> +	  camera sensor.
>> +
>>  source "drivers/media/i2c/ccs/Kconfig"
>>  source "drivers/media/i2c/et8ek8/Kconfig"
>>  source "drivers/media/i2c/m5mols/Kconfig"
>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>> index 3e1696963e7f..7f2362228484 100644
>> --- a/drivers/media/i2c/Makefile
>> +++ b/drivers/media/i2c/Makefile
>> @@ -116,6 +116,7 @@ obj-$(CONFIG_VIDEO_SAA7185) += saa7185.o
>>  obj-$(CONFIG_VIDEO_SONY_BTF_MPX) += sony-btf-mpx.o
>>  obj-$(CONFIG_VIDEO_SR030PC30) += sr030pc30.o
>>  obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
>> +obj-$(CONFIG_VIDEO_ST_VGXY61) += st-vgxy61.o
>>  obj-$(CONFIG_VIDEO_TC358743) += tc358743.o
>>  obj-$(CONFIG_VIDEO_TDA1997X) += tda1997x.o
>>  obj-$(CONFIG_VIDEO_TDA7432) += tda7432.o
>> diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/st-vgxy61.c
>> new file mode 100644
>> index 000000000000..1219d278e648
>> --- /dev/null
>> +++ b/drivers/media/i2c/st-vgxy61.c
>> @@ -0,0 +1,1997 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Driver for VGXY61 global shutter sensor family driver
>> + *
>> + * Copyright (C) 2022 STMicroelectronics SA
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/pm_runtime.h>
> 
> Alphabetical order in headers too please.
> 
>> +#include <linux/units.h>
>> +#include <linux/iopoll.h>
>> +#include <media/mipi-csi2.h>
>> +#include <media/v4l2-async.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-fwnode.h>
>> +#include <media/v4l2-subdev.h>
>> +
>> +#define US_PER_MS					1000
> 
> I don't think this deserves a macro, but if you want to keep it, you
> should avoid generic names that may cause namespace clashes.
> 

I don't make heavy usage of it so I will remove it.

>> +
>> +#define DEVICE_MODEL_ID_REG				0x0000
> 
> Please prefix macros with a driver-specific prefix. Many of them have a
> too generic name.
> 

I will change this to VGXY61_REG_* for registers, and simply VGXY61_* for others.

>> +#define VG5661_MODEL_ID					0x5661
>> +#define VG5761_MODEL_ID					0x5761
>> +#define VGX661_WIDTH					1464
>> +#define VGX661_HEIGHT					1104
>> +#define VGX761_WIDTH					1944
>> +#define VGX761_HEIGHT					1204
>> +#define VGX661_DEFAULT_MODE				1
>> +#define VGX761_DEFAULT_MODE				1
>> +#define VGX661_SHORT_ROT_TERM				93
>> +#define VGX761_SHORT_ROT_TERM				90
>> +#define VGXY61_EXPOS_ROT_TERM				66
>> +#define VGXY61_WRITE_MULTIPLE_CHUNK_MAX			16
>> +#define VGXY61_NB_GPIOS					4
>> +#define VGXY61_NB_POLARITIES				5
>> +#define VGXY61_MIN_FRAME_LENGTH				1288
>> +#define VGXY61_MIN_EXPOSURE				10
>> +#define VGXY61_HDR_LINEAR_RATIO				10
>> +#define VGXY61_TIMEOUT_MS				500
>> +#define VGXY61_FRAME_LENGTH_DEF				1313
>> +#define DEVICE_REVISION					0x0002
>> +#define DEVICE_FWPATCH_REVISION				0x0014
>> +#define DEVICE_FWPATCH_START_ADDR			0x2000
>> +#define DEVICE_SYSTEM_FSM				0x0020
>> +#define SW_STBY						0x03
>> +#define STREAMING					0x04
>> +#define DEVICE_NVM					0x0023
>> +#define NVM_OK						0x04
>> +#define DEVICE_THSENS1_TEMPERATURE			0x0044
>> +#define DEVICE_STBY					0x0201
>> +#define STBY_NO_REQ					0
>> +#define STBY_REQ_TMP_READ				BIT(2)
>> +#define DEVICE_STREAMING				0x0202
>> +#define REQ_NO_REQUEST					0
>> +#define REQ_STOP_STREAMING				BIT(0)
>> +#define REQ_START_STREAMING				BIT(1)
>> +#define DEVICE_EXT_CLOCK				0x0220
>> +#define DEVICE_CLK_PLL_PREDIV				0x0224
>> +#define DEVICE_CLK_SYS_PLL_MULT				0x0225
>> +#define DEVICE_GPIO_0_CTRL				0x0236
>> +#define DEVICE_GPIO_1_CTRL				0x0237
>> +#define DEVICE_GPIO_2_CTRL				0x0238
>> +#define DEVICE_GPIO_3_CTRL				0x0239
>> +#define DEVICE_SIGNALS_POLARITY_CTRL			0x023b
>> +#define DEVICE_LINE_LENGTH				0x0300
>> +#define DEVICE_ORIENTATION				0x0302
>> +#define DEVICE_VT_CTRL					0x0304
>> +#define DEVICE_FORMAT_CTRL				0x0305
>> +#define DEVICE_OIF_CTRL					0x0306
>> +#define DEVICE_OIF_ROI0_CTRL				0x030a
>> +#define DEVICE_ROI0_START_H				0x0400
>> +#define DEVICE_ROI0_START_V				0x0402
>> +#define DEVICE_ROI0_END_H				0x0404
>> +#define DEVICE_ROI0_END_V				0x0406
>> +#define DEVICE_PATGEN_CTRL				0x0440
>> +#define DEVICE_FRAME_CONTENT_CTRL			0x0478
>> +#define DEVICE_COARSE_EXPOSURE_LONG			0x0500
>> +#define DEVICE_COARSE_EXPOSURE_SHORT			0x0504
>> +#define DEVICE_ANALOG_GAIN				0x0508
>> +#define DEVICE_DIGITAL_GAIN_LONG			0x050a
>> +#define DEVICE_DIGITAL_GAIN_SHORT			0x0512
>> +#define DEVICE_FRAME_LENGTH				0x051a
>> +#define DEVICE_SIGNALS_CTRL				0x0522
>> +#define DEVICE_READOUT_CTRL				0x0530
>> +#define DEVICE_HDR_CTRL					0x0532
>> +#define DEVICE_PATGEN_LONG_DATA_GR			0x092c
>> +#define DEVICE_PATGEN_LONG_DATA_R			0x092e
>> +#define DEVICE_PATGEN_LONG_DATA_B			0x0930
>> +#define DEVICE_PATGEN_LONG_DATA_GB			0x0932
>> +#define DEVICE_PATGEN_SHORT_DATA_GR			0x0950
>> +#define DEVICE_PATGEN_SHORT_DATA_R			0x0952
>> +#define DEVICE_PATGEN_SHORT_DATA_B			0x0954
>> +#define DEVICE_PATGEN_SHORT_DATA_GB			0x0956
>> +#define DEVICE_BYPASS_CTRL				0x0a60
>> +
>> +#define V4L2_CID_HDR					(V4L2_CID_USER_STVGXY61_BASE + 0)
> 
> This macro should have a device-specific name, should be moved to a
> public header, and the control should be documented. I would split the
> control documentation and macro definition to a separate patch.
> 

I created two new files include/uapi/linux/st-vgxy61.h and Documentation/userspace-api/media/drivers/st-vgxy61.rst.
I'm not sure what you mean by separating the documentation and definition. As there is a significant amount of code dependent on the HDR mode I will keep the public header in this patch, and create a new patch for the documentation. Tell me if there is any issue with this.

>> +
>> +#define DEVICE_FWPATCH_REVISION_MAJOR			2
>> +#define DEVICE_FWPATCH_REVISION_MINOR			0
>> +#define DEVICE_FWPATCH_REVISION_MICRO			5
>> +
>> +static const u8 patch_array[] = {
>> +	0xbf, 0x00, 0x05, 0x20, 0x06, 0x01, 0xe0, 0xe0, 0x04, 0x80, 0xe6, 0x45,
>> +	0xed, 0x6f, 0xfe, 0xff, 0x14, 0x80, 0x1f, 0x84, 0x10, 0x42, 0x05, 0x7c,
>> +	0x01, 0xc4, 0x1e, 0x80, 0xb6, 0x42, 0x00, 0xe0, 0x1e, 0x82, 0x1e, 0xc0,
>> +	0x93, 0xdd, 0xc3, 0xc1, 0x0c, 0x04, 0x00, 0xfa, 0x86, 0x0d, 0x70, 0xe1,
>> +	0x04, 0x98, 0x15, 0x00, 0x28, 0xe0, 0x14, 0x02, 0x08, 0xfc, 0x15, 0x40,
>> +	0x28, 0xe0, 0x98, 0x58, 0xe0, 0xef, 0x04, 0x98, 0x0e, 0x04, 0x00, 0xf0,
>> +	0x15, 0x00, 0x28, 0xe0, 0x19, 0xc8, 0x15, 0x40, 0x28, 0xe0, 0xc6, 0x41,
>> +	0xfc, 0xe0, 0x14, 0x80, 0x1f, 0x84, 0x14, 0x02, 0xa0, 0xfc, 0x1e, 0x80,
>> +	0x14, 0x80, 0x14, 0x02, 0x80, 0xfb, 0x14, 0x02, 0xe0, 0xfc, 0x1e, 0x80,
>> +	0x14, 0xc0, 0x1f, 0x84, 0x14, 0x02, 0xa4, 0xfc, 0x1e, 0xc0, 0x14, 0xc0,
>> +	0x14, 0x02, 0x80, 0xfb, 0x14, 0x02, 0xe4, 0xfc, 0x1e, 0xc0, 0x0c, 0x0c,
>> +	0x00, 0xf2, 0x93, 0xdd, 0x86, 0x00, 0xf8, 0xe0, 0x04, 0x80, 0xc6, 0x03,
>> +	0x70, 0xe1, 0x0e, 0x84, 0x93, 0xdd, 0xc3, 0xc1, 0x0c, 0x04, 0x00, 0xfa,
>> +	0x6b, 0x80, 0x06, 0x40, 0x6c, 0xe1, 0x04, 0x80, 0x09, 0x00, 0xe0, 0xe0,
>> +	0x0b, 0xa1, 0x95, 0x84, 0x05, 0x0c, 0x1c, 0xe0, 0x86, 0x02, 0xf9, 0x60,
>> +	0xe0, 0xcf, 0x78, 0x6e, 0x80, 0xef, 0x25, 0x0c, 0x18, 0xe0, 0x05, 0x4c,
>> +	0x1c, 0xe0, 0x86, 0x02, 0xf9, 0x60, 0xe0, 0xcf, 0x0b, 0x84, 0xd8, 0x6d,
>> +	0x80, 0xef, 0x05, 0x4c, 0x18, 0xe0, 0x04, 0xd8, 0x0b, 0xa5, 0x95, 0x84,
>> +	0x05, 0x0c, 0x2c, 0xe0, 0x06, 0x02, 0x01, 0x60, 0xe0, 0xce, 0x18, 0x6d,
>> +	0x80, 0xef, 0x25, 0x0c, 0x30, 0xe0, 0x05, 0x4c, 0x2c, 0xe0, 0x06, 0x02,
>> +	0x01, 0x60, 0xe0, 0xce, 0x0b, 0x84, 0x78, 0x6c, 0x80, 0xef, 0x05, 0x4c,
>> +	0x30, 0xe0, 0x0c, 0x0c, 0x00, 0xf2, 0x93, 0xdd, 0x46, 0x01, 0x70, 0xe1,
>> +	0x08, 0x80, 0x0b, 0xa1, 0x08, 0x5c, 0x00, 0xda, 0x06, 0x01, 0x68, 0xe1,
>> +	0x04, 0x80, 0x4a, 0x40, 0x84, 0xe0, 0x08, 0x5c, 0x00, 0x9a, 0x06, 0x01,
>> +	0xe0, 0xe0, 0x04, 0x80, 0x15, 0x00, 0x60, 0xe0, 0x19, 0xc4, 0x15, 0x40,
>> +	0x60, 0xe0, 0x15, 0x00, 0x78, 0xe0, 0x19, 0xc4, 0x15, 0x40, 0x78, 0xe0,
>> +	0x93, 0xdd, 0xc3, 0xc1, 0x46, 0x01, 0x70, 0xe1, 0x08, 0x80, 0x0b, 0xa1,
>> +	0x08, 0x5c, 0x00, 0xda, 0x06, 0x01, 0x68, 0xe1, 0x04, 0x80, 0x4a, 0x40,
>> +	0x84, 0xe0, 0x08, 0x5c, 0x00, 0x9a, 0x06, 0x01, 0xe0, 0xe0, 0x14, 0x80,
>> +	0x25, 0x02, 0x54, 0xe0, 0x29, 0xc4, 0x25, 0x42, 0x54, 0xe0, 0x24, 0x80,
>> +	0x35, 0x04, 0x6c, 0xe0, 0x39, 0xc4, 0x35, 0x44, 0x6c, 0xe0, 0x25, 0x02,
>> +	0x64, 0xe0, 0x29, 0xc4, 0x25, 0x42, 0x64, 0xe0, 0x04, 0x80, 0x15, 0x00,
>> +	0x7c, 0xe0, 0x19, 0xc4, 0x15, 0x40, 0x7c, 0xe0, 0x93, 0xdd, 0xc3, 0xc1,
>> +	0x4c, 0x04, 0x7c, 0xfa, 0x86, 0x40, 0x98, 0xe0, 0x14, 0x80, 0x1b, 0xa1,
>> +	0x06, 0x00, 0x00, 0xc0, 0x08, 0x42, 0x38, 0xdc, 0x08, 0x64, 0xa0, 0xef,
>> +	0x86, 0x42, 0x3c, 0xe0, 0x68, 0x49, 0x80, 0xef, 0x6b, 0x80, 0x78, 0x53,
>> +	0xc8, 0xef, 0xc6, 0x54, 0x6c, 0xe1, 0x7b, 0x80, 0xb5, 0x14, 0x0c, 0xf8,
>> +	0x05, 0x14, 0x14, 0xf8, 0x1a, 0xac, 0x8a, 0x80, 0x0b, 0x90, 0x38, 0x55,
>> +	0x80, 0xef, 0x1a, 0xae, 0x17, 0xc2, 0x03, 0x82, 0x88, 0x65, 0x80, 0xef,
>> +	0x1b, 0x80, 0x0b, 0x8e, 0x68, 0x65, 0x80, 0xef, 0x9b, 0x80, 0x0b, 0x8c,
>> +	0x08, 0x65, 0x80, 0xef, 0x6b, 0x80, 0x0b, 0x92, 0x1b, 0x8c, 0x98, 0x64,
>> +	0x80, 0xef, 0x1a, 0xec, 0x9b, 0x80, 0x0b, 0x90, 0x95, 0x54, 0x10, 0xe0,
>> +	0xa8, 0x53, 0x80, 0xef, 0x1a, 0xee, 0x17, 0xc2, 0x03, 0x82, 0xf8, 0x63,
>> +	0x80, 0xef, 0x1b, 0x80, 0x0b, 0x8e, 0xd8, 0x63, 0x80, 0xef, 0x1b, 0x8c,
>> +	0x68, 0x63, 0x80, 0xef, 0x6b, 0x80, 0x0b, 0x92, 0x65, 0x54, 0x14, 0xe0,
>> +	0x08, 0x65, 0x84, 0xef, 0x68, 0x63, 0x80, 0xef, 0x7b, 0x80, 0x0b, 0x8c,
>> +	0xa8, 0x64, 0x84, 0xef, 0x08, 0x63, 0x80, 0xef, 0x14, 0xe8, 0x46, 0x44,
>> +	0x94, 0xe1, 0x24, 0x88, 0x4a, 0x4e, 0x04, 0xe0, 0x14, 0xea, 0x1a, 0x04,
>> +	0x08, 0xe0, 0x0a, 0x40, 0x84, 0xed, 0x0c, 0x04, 0x00, 0xe2, 0x4a, 0x40,
>> +	0x04, 0xe0, 0x19, 0x16, 0xc0, 0xe0, 0x0a, 0x40, 0x84, 0xed, 0x21, 0x54,
>> +	0x60, 0xe0, 0x0c, 0x04, 0x00, 0xe2, 0x1b, 0xa5, 0x0e, 0xea, 0x01, 0x89,
>> +	0x21, 0x54, 0x64, 0xe0, 0x7e, 0xe8, 0x65, 0x82, 0x1b, 0xa7, 0x26, 0x00,
>> +	0x00, 0x80, 0xa5, 0x82, 0x1b, 0xa9, 0x65, 0x82, 0x1b, 0xa3, 0x01, 0x85,
>> +	0x16, 0x00, 0x00, 0xc0, 0x01, 0x54, 0x04, 0xf8, 0x06, 0xaa, 0x01, 0x83,
>> +	0x06, 0xa8, 0x65, 0x81, 0x06, 0xa8, 0x01, 0x54, 0x04, 0xf8, 0x01, 0x83,
>> +	0x06, 0xaa, 0x09, 0x14, 0x18, 0xf8, 0x0b, 0xa1, 0x05, 0x84, 0xc6, 0x42,
>> +	0xd4, 0xe0, 0x14, 0x84, 0x01, 0x83, 0x01, 0x54, 0x60, 0xe0, 0x01, 0x54,
>> +	0x64, 0xe0, 0x0b, 0x02, 0x90, 0xe0, 0x10, 0x02, 0x90, 0xe5, 0x01, 0x54,
>> +	0x88, 0xe0, 0xb5, 0x81, 0xc6, 0x40, 0xd4, 0xe0, 0x14, 0x80, 0x0b, 0x02,
>> +	0xe0, 0xe4, 0x10, 0x02, 0x31, 0x66, 0x02, 0xc0, 0x01, 0x54, 0x88, 0xe0,
>> +	0x1a, 0x84, 0x29, 0x14, 0x10, 0xe0, 0x1c, 0xaa, 0x2b, 0xa1, 0xf5, 0x82,
>> +	0x25, 0x14, 0x10, 0xf8, 0x2b, 0x04, 0xa8, 0xe0, 0x20, 0x44, 0x0d, 0x70,
>> +	0x03, 0xc0, 0x2b, 0xa1, 0x04, 0x00, 0x80, 0x9a, 0x02, 0x40, 0x84, 0x90,
>> +	0x03, 0x54, 0x04, 0x80, 0x4c, 0x0c, 0x7c, 0xf2, 0x93, 0xdd, 0x00, 0x00,
>> +	0x02, 0xa9, 0x00, 0x00, 0x64, 0x4a, 0x40, 0x00, 0x08, 0x2d, 0x58, 0xe0,
>> +	0xa8, 0x98, 0x40, 0x00, 0x28, 0x07, 0x34, 0xe0, 0x05, 0xb9, 0x00, 0x00,
>> +	0x28, 0x00, 0x41, 0x05, 0x88, 0x00, 0x41, 0x3c, 0x98, 0x00, 0x41, 0x52,
>> +	0x04, 0x01, 0x41, 0x79, 0x3c, 0x01, 0x41, 0x6a, 0x3d, 0xfe, 0x00, 0x00,
>> +};
>> +
>> +static const char * const vgxy61_test_pattern_menu[] = {
>> +	"Disabled",
>> +	"Solid",
>> +	"Colorbar",
>> +	"Gradbar",
>> +	"Hgrey",
>> +	"Vgrey",
>> +	"Dgrey",
>> +	"PN28",
>> +};
>> +
>> +static const char * const vgxy61_hdr_modes[] = {
>> +	"HDR linearize",
>> +	"HDR substraction",
>> +	"no HDR",
>> +};
>> +
>> +/* Regulator supplies */
>> +static const char * const vgxy61_supply_name[] = {
>> +	"VCORE",
>> +	"VDDIO",
>> +	"VANA",
>> +};
>> +
>> +static const s64 link_freq[] = {
>> +	/*
>> +	 * MIPI output freq is 804Mhz / 2, as it uses both rising edge and falling edges to send
>> +	 * data
>> +	 */
>> +	402000000ULL
> 
> The link frequencies should come from DT.
> 

This is a hard requirement for this sensor. This value can not be modified and must be 402MHz.
I see the ov9734.c does something similar. Is adding this value to the device tree really mandatory?

>> +};
>> +
>> +#define VGXY61_NUM_SUPPLIES		ARRAY_SIZE(vgxy61_supply_name)
>> +
>> +enum bin_mode {
> 
> Same comment here, all enums and structures should use a driver-specific
> prefix.
> 
>> +	BIN_MODE_NORMAL,
>> +	BIN_MODE_DIGITAL_X2,
>> +	BIN_MODE_DIGITAL_X4,
>> +};
>> +
>> +enum hdr {
>> +	HDR_LINEAR,
>> +	HDR_SUB,
>> +	NO_HDR,
>> +};
>> +
>> +enum strobe_modes {
>> +	STROBE_DISABLED,
>> +	STROBE_LONG,
>> +	STROBE_ENABLED,
>> +};
>> +
>> +struct vgxy61_mode_info {
>> +	u32 width;
>> +	u32 height;
>> +	enum bin_mode bin_mode;
>> +	struct v4l2_rect crop;
>> +};
>> +
>> +static const u32 vgxy61_supported_codes[] = {
>> +	MEDIA_BUS_FMT_Y8_1X8,
>> +	MEDIA_BUS_FMT_Y10_1X10,
>> +	MEDIA_BUS_FMT_Y12_1X12,
>> +	MEDIA_BUS_FMT_Y14_1X14,
>> +	MEDIA_BUS_FMT_Y16_1X16
>> +};
>> +
>> +static const struct vgxy61_mode_info vgx661_mode_data[] = {
>> +	{
>> +		.width = VGX661_WIDTH,
>> +		.height = VGX661_HEIGHT,
>> +		.bin_mode = BIN_MODE_NORMAL,
>> +		.crop = {
>> +			.left = 0,
>> +			.top = 0,
>> +			.width = VGX661_WIDTH,
>> +			.height = VGX661_HEIGHT,
>> +		},
> 
> It's very nice to see no hardcoded register values in the modes tables
> :-) As the register values are computed by the driver, would it make
> sense to go one step further and drop the modes completely ? Analog crop
> and binning could then be selected freely from userspace.
> 

All credit goes to Dave for pointing this in the first review ;)
As for the modes, in theory we could drop them completely, but this will require some extra testing as the sensor can't really handle every single mode freely.
Could this be done in a second step?

>> +	},
>> +	{
>> +		.width = 1280,
>> +		.height = 720,
>> +		.bin_mode = BIN_MODE_NORMAL,
>> +		.crop = {
>> +			.left = 92,
>> +			.top = 192,
>> +			.width = 1280,
>> +			.height = 720,
>> +		},
>> +	},
>> +	{
>> +		.width = 640,
>> +		.height = 480,
>> +		.bin_mode = BIN_MODE_DIGITAL_X2,
>> +		.crop = {
>> +			.left = 92,
>> +			.top = 72,
>> +			.width = 1280,
>> +			.height = 960,
>> +		},
>> +	},
>> +	{
>> +		.width = 320,
>> +		.height = 240,
>> +		.bin_mode = BIN_MODE_DIGITAL_X4,
> 
> Can the bin mode computed by dividing the crop width by the output width
> instead of being stored here ?
> 

The sensor also supports analog subsampling on top of digital binning. I did not implement it in the driver but I made the choice to explicitly set the bin_mode for further development. For example the line above could be:
  .bin_mode = BIN_MODE_ANALOG_X4
I can compute the factor (X2/X4), but not the analog/digital mode. Hope this make sense.

>> +		.crop = {
>> +			.left = 92,
>> +			.top = 72,
>> +			.width = 1280,
>> +			.height = 960,
>> +		},
>> +	},
>> +};
>> +
>> +static const struct vgxy61_mode_info vgx761_mode_data[] = {
>> +	{
>> +		.width = VGX761_WIDTH,
>> +		.height = VGX761_HEIGHT,
>> +		.bin_mode = BIN_MODE_NORMAL,
>> +		.crop = {
>> +			.left = 0,
>> +			.top = 0,
>> +			.width = VGX761_WIDTH,
>> +			.height = VGX761_HEIGHT,
>> +		},
>> +	},
>> +	{
>> +		.width = 1920,
>> +		.height = 1080,
>> +		.bin_mode = BIN_MODE_NORMAL,
>> +		.crop = {
>> +			.left = 12,
>> +			.top = 62,
>> +			.width = 1920,
>> +			.height = 1080,
>> +		},
>> +	},
>> +	{
>> +		.width = 1280,
>> +		.height = 720,
>> +		.bin_mode = BIN_MODE_NORMAL,
>> +		.crop = {
>> +			.left = 332,
>> +			.top = 242,
>> +			.width = 1280,
>> +			.height = 720,
>> +		},
>> +	},
>> +	{
>> +		.width = 640,
>> +		.height = 480,
>> +		.bin_mode = BIN_MODE_DIGITAL_X2,
>> +		.crop = {
>> +			.left = 332,
>> +			.top = 122,
>> +			.width = 1280,
>> +			.height = 960,
>> +		},
>> +	},
>> +	{
>> +		.width = 320,
>> +		.height = 240,
>> +		.bin_mode = BIN_MODE_DIGITAL_X4,
>> +		.crop = {
>> +			.left = 332,
>> +			.top = 122,
>> +			.width = 1280,
>> +			.height = 960,
>> +		},
>> +	},
>> +};
>> +
>> +struct vgxy61_dev {
>> +	struct i2c_client *i2c_client;
>> +	struct v4l2_subdev sd;
>> +	struct media_pad pad;
>> +	struct regulator_bulk_data supplies[VGXY61_NUM_SUPPLIES];
>> +	struct gpio_desc *reset_gpio;
>> +	struct clk *xclk;
>> +	u32 clk_freq;
>> +	int id;
>> +	int sensor_width;
>> +	int sensor_height;
>> +	u16 oif_ctrl;
>> +	int nb_of_lane;
>> +	int data_rate_in_mbps;
>> +	int pclk;
>> +	u16 line_length;
>> +	int rot_term;
>> +	bool gpios_polarity;
>> +	bool slave_mode;
>> +	/* Lock to protect all members below */
>> +	struct mutex lock;
>> +	struct v4l2_ctrl_handler ctrl_handler;
>> +	struct v4l2_ctrl *pixel_rate_ctrl;
>> +	struct v4l2_ctrl *expo_ctrl;
>> +	struct v4l2_ctrl *vblank_ctrl;
>> +	struct v4l2_ctrl *vflip_ctrl;
>> +	struct v4l2_ctrl *hflip_ctrl;
>> +	bool streaming;
>> +	struct v4l2_mbus_framefmt fmt;
>> +	const struct vgxy61_mode_info *sensor_modes;
>> +	int sensor_modes_nb;
>> +	const struct vgxy61_mode_info *current_mode;
>> +	struct v4l2_fract frame_interval;
> 
> This is not used. Please check all other fields too.
> 
>> +	bool hflip;
>> +	bool vflip;
>> +	enum hdr hdr;
>> +	int expo_long;
>> +	int expo_short;
>> +	int expo_max;
>> +	int expo_min;
>> +	int vblank;
>> +	int vblank_min;
>> +	u16 frame_length;
>> +};
>> +
>> +static u8 get_bpp_by_code(__u32 code)
>> +{
>> +	switch (code) {
>> +	case MEDIA_BUS_FMT_Y8_1X8:
>> +		return 8;
>> +	case MEDIA_BUS_FMT_Y10_1X10:
>> +		return 10;
>> +	case MEDIA_BUS_FMT_Y12_1X12:
>> +		return 12;
>> +	case MEDIA_BUS_FMT_Y14_1X14:
>> +		return 14;
>> +	case MEDIA_BUS_FMT_Y16_1X16:
>> +		return 16;
>> +	default:
>> +		/* Should never happen */
>> +		WARN(1, "Unsupported code %d. default to 8 bpp", code);
>> +		return 8;
>> +	}
>> +}
>> +
>> +static u8 get_data_type_by_code(__u32 code)
>> +{
>> +	switch (code) {
>> +	case MEDIA_BUS_FMT_Y8_1X8:
>> +		return MIPI_CSI2_DT_RAW8;
>> +	case MEDIA_BUS_FMT_Y10_1X10:
>> +		return MIPI_CSI2_DT_RAW10;
>> +	case MEDIA_BUS_FMT_Y12_1X12:
>> +		return MIPI_CSI2_DT_RAW12;
>> +	case MEDIA_BUS_FMT_Y14_1X14:
>> +		return MIPI_CSI2_DT_RAW14;
>> +	case MEDIA_BUS_FMT_Y16_1X16:
>> +		return MIPI_CSI2_DT_RAW16;
>> +	default:
>> +		/* Should never happen */
>> +		WARN(1, "Unsupported code %d. default to MIPI_CSI2_DT_RAW8 data type", code);
>> +		return MIPI_CSI2_DT_RAW8;
>> +	}
>> +}
> 
> I'd put all this data in a format description structure, and store that
> in the vgxy61_supported_codes array.
> 
>> +
>> +static void compute_pll_parameters_by_freq(u32 freq, unsigned int *prediv, unsigned int *mult)
>> +{
>> +	const unsigned int predivs[] = {1, 2, 4};
>> +	int i;
>> +
>> +	/*
>> +	 * Freq range is [6Mhz-27Mhz] already checked.
>> +	 * Output of divider should be in [6Mhz-12Mhz[.
>> +	 */
>> +	for (i = 0; i < ARRAY_SIZE(predivs); i++) {
>> +		*prediv = predivs[i];
>> +		if (freq / *prediv < 12 * HZ_PER_MHZ)
>> +			break;
>> +	}
>> +	WARN_ON(i == ARRAY_SIZE(predivs));
>> +
>> +	/*
>> +	 * Target freq is 804Mhz. Don't change this as it will impact image quality.
>> +	 */
>> +	*mult = ((804 * HZ_PER_MHZ) * (*prediv) + freq / 2) / freq;
>> +}
>> +
>> +static s32 get_pixel_rate(struct vgxy61_dev *sensor)
>> +{
>> +	return div64_u64((u64)sensor->data_rate_in_mbps * sensor->nb_of_lane,
>> +			 get_bpp_by_code(sensor->fmt.code));
>> +}
>> +
>> +static inline struct vgxy61_dev *to_vgxy61_dev(struct v4l2_subdev *sd)
>> +{
>> +	return container_of(sd, struct vgxy61_dev, sd);
>> +}
>> +
>> +static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
>> +{
>> +	return &container_of(ctrl->handler, struct vgxy61_dev, ctrl_handler)->sd;
>> +}
>> +
>> +static int get_chunk_size(struct vgxy61_dev *sensor)
>> +{
>> +	struct i2c_adapter *adapter = sensor->i2c_client->adapter;
>> +	int max_write_len = VGXY61_WRITE_MULTIPLE_CHUNK_MAX;
>> +
>> +	if (adapter->quirks && adapter->quirks->max_write_len)
>> +		max_write_len = adapter->quirks->max_write_len - 2;
>> +
>> +	max_write_len = min(max_write_len, VGXY61_WRITE_MULTIPLE_CHUNK_MAX);
>> +
>> +	return max(max_write_len, 1);
>> +}
>> +
>> +static int vgxy61_read_multiple(struct vgxy61_dev *sensor, u16 reg, u8 *val, int len)
>> +{
>> +	struct i2c_client *client = sensor->i2c_client;
>> +	struct i2c_msg msg[2];
>> +	u8 buf[2];
>> +	int ret;
>> +
>> +	buf[0] = reg >> 8;
>> +	buf[1] = reg & 0xff;
>> +
>> +	msg[0].addr = client->addr;
>> +	msg[0].flags = client->flags;
>> +	msg[0].buf = buf;
>> +	msg[0].len = sizeof(buf);
>> +
>> +	msg[1].addr = client->addr;
>> +	msg[1].flags = client->flags | I2C_M_RD;
>> +	msg[1].buf = val;
>> +	msg[1].len = len;
>> +
>> +	ret = i2c_transfer(client->adapter, msg, 2);
>> +	if (ret < 0) {
>> +		dev_dbg(&client->dev, "%s: %x i2c_transfer, reg: %x => %d\n", __func__,
>> +			client->addr, reg, ret);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static inline int vgxy61_read_reg(struct vgxy61_dev *sensor, u16 reg, u8 *val)
>> +{
>> +	return vgxy61_read_multiple(sensor, reg, val, sizeof(*val));
>> +}
>> +
>> +static inline int vgxy61_read_reg16(struct vgxy61_dev *sensor, u16 reg, u16 *val)
>> +{
>> +	return vgxy61_read_multiple(sensor, reg, (u8 *)val, sizeof(*val));
>> +}
>> +
>> +static int vgxy61_write_multiple(struct vgxy61_dev *sensor, u16 reg, const u8 *data, int len)
>> +{
>> +	struct i2c_client *client = sensor->i2c_client;
>> +	struct i2c_msg msg;
>> +	u8 buf[VGXY61_WRITE_MULTIPLE_CHUNK_MAX + 2];
>> +	int i;
>> +	int ret;
>> +
>> +	if (len > VGXY61_WRITE_MULTIPLE_CHUNK_MAX)
>> +		return -EINVAL;
>> +	buf[0] = reg >> 8;
>> +	buf[1] = reg & 0xff;
>> +	for (i = 0; i < len; i++)
>> +		buf[i + 2] = data[i];
>> +
>> +	msg.addr = client->addr;
>> +	msg.flags = client->flags;
>> +	msg.buf = buf;
>> +	msg.len = len + 2;
>> +
>> +	ret = i2c_transfer(client->adapter, &msg, 1);
>> +	if (ret < 0) {
>> +		dev_dbg(&client->dev, "%s: i2c_transfer, reg: %x => %d\n", __func__, reg, ret);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int vgxy61_write_array(struct vgxy61_dev *sensor, u16 reg, int nb, const u8 *array)
>> +{
>> +	const int chunk_size = get_chunk_size(sensor);
>> +	int ret;
>> +	int sz;
>> +
>> +	while (nb) {
>> +		sz = min(nb, chunk_size);
>> +		ret = vgxy61_write_multiple(sensor, reg, array, sz);
>> +		if (ret < 0)
>> +			return ret;
>> +		nb -= sz;
>> +		reg += sz;
>> +		array += sz;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static inline int vgxy61_write_reg(struct vgxy61_dev *sensor, u16 reg, u8 val)
>> +{
>> +	return vgxy61_write_multiple(sensor, reg, &val, sizeof(val));
>> +}
>> +
>> +static inline int vgxy61_write_reg16(struct vgxy61_dev *sensor, u16 reg, u16 val)
>> +{
>> +	return vgxy61_write_multiple(sensor, reg, (u8 *)&val, sizeof(val));
>> +}
>> +
>> +static inline int vgxy61_write_reg32(struct vgxy61_dev *sensor, u16 reg, u32 val)
>> +{
>> +	return vgxy61_write_multiple(sensor, reg, (u8 *)&val, sizeof(val));
>> +}
> 
> You could possibly simplify handling of registers of different sizes by
> encoding the size in the register address macros. See
> https://gitlab.com/ideasonboard/nxp/linux/-/blob/pinchartl/v5.18/sensors/imx/drivers/media/i2c/imx296.c
> for an example.
> 

That sounds good, thank you. I will look into this.

>> +
>> +static int vgxy61_poll_reg(struct vgxy61_dev *sensor, u16 reg, u8 poll_val, int timeout_ms)
>> +{
>> +	const int loop_delay_ms = 10;
>> +	u8 val;
>> +	int ret, timeout;
>> +
>> +	timeout = read_poll_timeout(vgxy61_read_reg, ret, ((ret != 0) || (val == poll_val)),
>> +				    loop_delay_ms * US_PER_MS, timeout_ms * US_PER_MS, false,
>> +				    sensor, reg, &val);
>> +	if (timeout)
>> +		return timeout;
>> +
>> +	return ret;
>> +}
>> +
>> +static int vgxy61_wait_state(struct vgxy61_dev *sensor, int state, int timeout_ms)
>> +{
>> +	return vgxy61_poll_reg(sensor, DEVICE_SYSTEM_FSM, state, timeout_ms);
>> +}
>> +
>> +static int vgxy61_check_bw(struct vgxy61_dev *sensor)
>> +{
>> +	struct i2c_client *client = sensor->i2c_client;
>> +	/* Correction factor for time required between 2 lines */
>> +	const int mipi_margin = 1056;
>> +	int binning_scale = sensor->current_mode->crop.height / sensor->current_mode->height;
>> +	int bpp = get_bpp_by_code(sensor->fmt.code);
>> +	int max_bit_per_line;
>> +	int bit_per_line;
>> +	u64 line_rate;
>> +
>> +	line_rate = sensor->nb_of_lane * (u64)sensor->data_rate_in_mbps * sensor->line_length;
>> +	max_bit_per_line = div64_u64(line_rate, sensor->pclk) - mipi_margin;
>> +	bit_per_line = (bpp * sensor->current_mode->width) / binning_scale;
>> +
>> +	dev_dbg(&client->dev, "max_bit_per_line = %d\n", max_bit_per_line);
>> +	dev_dbg(&client->dev, "required bit_per_line = %d\n", bit_per_line);
>> +
>> +	return bit_per_line > max_bit_per_line ? -EINVAL : 0;
>> +}
>> +
>> +static int apply_exposure(struct vgxy61_dev *sensor)
>> +{
>> +	struct i2c_client *client = sensor->i2c_client;
>> +	int ret;
>> +
>> +	 /* We first set expo to zero to avoid forbidden parameters couple */
>> +	ret = vgxy61_write_reg16(sensor, DEVICE_COARSE_EXPOSURE_SHORT, 0);
>> +	if (ret)
>> +		return ret;
>> +	ret = vgxy61_write_reg16(sensor, DEVICE_COARSE_EXPOSURE_LONG, sensor->expo_long);
>> +	if (ret)
>> +		return ret;
>> +	ret = vgxy61_write_reg16(sensor, DEVICE_COARSE_EXPOSURE_SHORT, sensor->expo_short);
>> +	if (ret)
>> +		return ret;
> 
> Is there a risk those writes may be applied to different frames ?
> 

Yes, but it does not matter for the sensor. Are you thinking of an issue about user space applications for instance?

>> +
>> +	dev_dbg(&client->dev, "%s applied expo %d (short: %d)\n", __func__,
>> +		sensor->expo_long, sensor->expo_short);
>> +
>> +	return 0;
>> +}
>> +
>> +static int set_frame_rate(struct vgxy61_dev *sensor)
> 
> The function sets the frame length, not the frame rate.
> 
>> +{
>> +	return vgxy61_write_reg16(sensor, DEVICE_FRAME_LENGTH, sensor->frame_length);
>> +}
>> +
>> +static int vgxy61_get_regulators(struct vgxy61_dev *sensor)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < VGXY61_NUM_SUPPLIES; i++)
>> +		sensor->supplies[i].supply = vgxy61_supply_name[i];
>> +
>> +	return devm_regulator_bulk_get(&sensor->i2c_client->dev, VGXY61_NUM_SUPPLIES,
>> +				       sensor->supplies);
>> +}
>> +
>> +static int vgxy61_apply_reset(struct vgxy61_dev *sensor)
>> +{
>> +	struct i2c_client *client = sensor->i2c_client;
>> +
>> +	dev_dbg(&client->dev, "%s applied reset\n", __func__);
>> +	gpiod_set_value_cansleep(sensor->reset_gpio, 0);
>> +	usleep_range(5000, 10000);
>> +	gpiod_set_value_cansleep(sensor->reset_gpio, 1);
>> +	usleep_range(5000, 10000);
>> +	gpiod_set_value_cansleep(sensor->reset_gpio, 0);
>> +	usleep_range(40000, 100000);
>> +	return vgxy61_wait_state(sensor, SW_STBY, VGXY61_TIMEOUT_MS);
>> +}
>> +
>> +static int vgxy61_try_fmt_internal(struct v4l2_subdev *sd, struct v4l2_mbus_framefmt *fmt,
>> +				   const struct vgxy61_mode_info **new_mode)
>> +{
>> +	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
>> +	const struct vgxy61_mode_info *mode = sensor->sensor_modes;
>> +	unsigned int index;
>> +
>> +	/* Select code */
>> +	for (index = 0; index < ARRAY_SIZE(vgxy61_supported_codes); index++) {
>> +		if (vgxy61_supported_codes[index] == fmt->code)
>> +			break;
>> +	}
>> +	if (index == ARRAY_SIZE(vgxy61_supported_codes))
>> +		index = 0;
>> +
>> +	/* Select size */
>> +	mode = v4l2_find_nearest_size(sensor->sensor_modes, sensor->sensor_modes_nb,
>> +				      width, height, fmt->width, fmt->height);
>> +	if (new_mode)
>> +		*new_mode = mode;
>> +
>> +	fmt->code = vgxy61_supported_codes[index];
>> +	fmt->width = mode->width;
>> +	fmt->height = mode->height;
>> +	fmt->colorspace = V4L2_COLORSPACE_RAW;
>> +	fmt->field = V4L2_FIELD_NONE;
>> +	fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>> +	fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
>> +	fmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;
>> +
>> +	return 0;
>> +}
>> +
>> +static int vgxy61_get_selection(struct v4l2_subdev *sd,
>> +				struct v4l2_subdev_state *sd_state,
>> +				struct v4l2_subdev_selection *sel)
>> +{
>> +	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
>> +
>> +	switch (sel->target) {
>> +	case V4L2_SEL_TGT_CROP:
>> +		sel->r = sensor->current_mode->crop;
>> +		return 0;
>> +	case V4L2_SEL_TGT_NATIVE_SIZE:
>> +	case V4L2_SEL_TGT_CROP_DEFAULT:
>> +	case V4L2_SEL_TGT_CROP_BOUNDS:
>> +		sel->r.top = 0;
>> +		sel->r.left = 0;
>> +		sel->r.width = sensor->sensor_width;
>> +		sel->r.height = sensor->sensor_height;
>> +		return 0;
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static int vgxy61_stream_enable(struct vgxy61_dev *sensor)
>> +{
>> +	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
>> +	const struct v4l2_rect *crop = &sensor->current_mode->crop;
>> +	int ret;
>> +
>> +	ret = vgxy61_check_bw(sensor);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = pm_runtime_get_sync(&client->dev);
>> +	if (ret < 0) {
>> +		pm_runtime_put_noidle(&client->dev);
>> +		return ret;
>> +	}
>> +
>> +	/* Configure sensor */
>> +	ret = vgxy61_write_reg(sensor, DEVICE_FORMAT_CTRL, get_bpp_by_code(sensor->fmt.code));
>> +	if (ret)
>> +		goto err_rpm_put;
>> +	ret = vgxy61_write_reg(sensor, DEVICE_OIF_ROI0_CTRL,
>> +			       get_data_type_by_code(sensor->fmt.code));
>> +	if (ret)
>> +		goto err_rpm_put;
>> +
>> +	ret = vgxy61_write_reg(sensor, DEVICE_READOUT_CTRL, sensor->current_mode->bin_mode);
>> +	if (ret)
>> +		goto err_rpm_put;
>> +	ret = vgxy61_write_reg16(sensor, DEVICE_ROI0_START_H, crop->left);
>> +	if (ret)
>> +		goto err_rpm_put;
>> +	ret = vgxy61_write_reg16(sensor, DEVICE_ROI0_END_H, crop->left + crop->width - 1);
>> +	if (ret)
>> +		goto err_rpm_put;
>> +	ret = vgxy61_write_reg16(sensor, DEVICE_ROI0_START_V, crop->top);
>> +	if (ret)
>> +		goto err_rpm_put;
>> +	ret = vgxy61_write_reg16(sensor, DEVICE_ROI0_END_V, crop->top + crop->height - 1);
>> +	if (ret)
>> +		goto err_rpm_put;
>> +
>> +	ret = set_frame_rate(sensor);
>> +	if (ret)
>> +		goto err_rpm_put;
>> +
>> +	ret = apply_exposure(sensor);
>> +	if (ret)
>> +		goto err_rpm_put;
>> +
>> +	/* Start streaming */
>> +	ret = vgxy61_write_reg(sensor, DEVICE_STREAMING, REQ_START_STREAMING);
>> +	if (ret)
>> +		goto err_rpm_put;
>> +
>> +	ret = vgxy61_poll_reg(sensor, DEVICE_STREAMING, REQ_NO_REQUEST, VGXY61_TIMEOUT_MS);
>> +	if (ret)
>> +		goto err_rpm_put;
>> +
>> +	ret = vgxy61_wait_state(sensor, STREAMING, VGXY61_TIMEOUT_MS);
>> +	if (ret)
>> +		goto err_rpm_put;
>> +
>> +	/* vflip and hflip cannot change during streaming */
>> +	__v4l2_ctrl_grab(sensor->vflip_ctrl, true);
>> +	__v4l2_ctrl_grab(sensor->hflip_ctrl, true);
>> +
>> +	return 0;
>> +
>> +err_rpm_put:
>> +	pm_runtime_put(&client->dev);
>> +	return ret;
>> +}
>> +
>> +static int vgxy61_stream_disable(struct vgxy61_dev *sensor)
>> +{
>> +	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
>> +	int ret;
>> +
>> +	ret = vgxy61_write_reg(sensor, DEVICE_STREAMING, REQ_STOP_STREAMING);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = vgxy61_poll_reg(sensor, DEVICE_STREAMING, REQ_NO_REQUEST, 2000);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = vgxy61_wait_state(sensor, SW_STBY, VGXY61_TIMEOUT_MS);
>> +	if (ret)
>> +		return ret;
>> +
>> +	__v4l2_ctrl_grab(sensor->vflip_ctrl, true);
>> +	__v4l2_ctrl_grab(sensor->hflip_ctrl, true);
>> +
>> +	pm_runtime_put(&client->dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static int vgxy61_s_stream(struct v4l2_subdev *sd, int enable)
>> +{
>> +	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
>> +	struct i2c_client *client = sensor->i2c_client;
>> +	int ret = 0;
>> +
>> +	mutex_lock(&sensor->lock);
>> +	dev_dbg(&client->dev, "%s : requested %d / current = %d\n", __func__, enable,
>> +		sensor->streaming);
>> +	if (sensor->streaming == enable)
>> +		goto out;
> 
> This should never happen. If you want to be on the safe side and keep
> the check, I'd turn it into a WARN_ON().
> 

You are right, I will remove this.

>> +
>> +	ret = enable ? vgxy61_stream_enable(sensor) : vgxy61_stream_disable(sensor);
>> +	if (!ret)
>> +		sensor->streaming = enable;
>> +
>> +out:
>> +	dev_dbg(&client->dev, "%s current now = %d / %d\n", __func__, sensor->streaming, ret);
>> +	mutex_unlock(&sensor->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int vgxy61_enum_mbus_code(struct v4l2_subdev *sd,
>> +				 struct v4l2_subdev_state *sd_state,
>> +				 struct v4l2_subdev_mbus_code_enum *code)
>> +{
>> +	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
>> +	struct i2c_client *client = sensor->i2c_client;
>> +
>> +	dev_dbg(&client->dev, "%s probe index %d\n", __func__, code->index);
>> +	if (code->index >= ARRAY_SIZE(vgxy61_supported_codes))
>> +		return -EINVAL;
>> +
>> +	code->code = vgxy61_supported_codes[code->index];
>> +
>> +	return 0;
>> +}
>> +
>> +static int vgxy61_get_fmt(struct v4l2_subdev *sd,
>> +			  struct v4l2_subdev_state *sd_state,
>> +			  struct v4l2_subdev_format *format)
>> +{
>> +	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
>> +	struct i2c_client *client = sensor->i2c_client;
>> +	struct v4l2_mbus_framefmt *fmt;
>> +
>> +	dev_dbg(&client->dev, "%s probe %d\n", __func__, format->pad);
>> +	dev_dbg(&client->dev, "%s %dx%d\n", __func__, format->format.width, format->format.height);
>> +
>> +	mutex_lock(&sensor->lock);
>> +
>> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
>> +		fmt = v4l2_subdev_get_try_format(&sensor->sd, sd_state, format->pad);
>> +	else
>> +		fmt = &sensor->fmt;
>> +
>> +	format->format = *fmt;
>> +
>> +	mutex_unlock(&sensor->lock);q
>> +
>> +	return 0;
>> +}
>> +
>> +static int vgxy61_get_vblank_min(struct vgxy61_dev *sensor, enum hdr hdr)
>> +{
>> +	int min_vblank =  VGXY61_MIN_FRAME_LENGTH - sensor->current_mode->crop.height;
>> +	/* Ensure the first tule of thumb can't be negative */
>> +	int min_vblank_hdr =  VGXY61_MIN_EXPOSURE + sensor->rot_term + 1;
>> +
>> +	if (hdr != NO_HDR)
>> +		return max(min_vblank, min_vblank_hdr);
>> +	return min_vblank;
>> +}
>> +
>> +static int vgxy61_enum_frame_size(struct v4l2_subdev *sd, struct v4l2_subdev_state *sd_state,
>> +				  struct v4l2_subdev_frame_size_enum *fse)
>> +{
>> +	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
>> +	struct i2c_client *client = sensor->i2c_client;
>> +
>> +	dev_dbg(&client->dev, "%s for index %d\n", __func__, fse->index);
>> +	if (fse->index >= sensor->sensor_modes_nb)
>> +		return -EINVAL;
>> +
>> +	fse->min_width = sensor->sensor_modes[fse->index].width;
>> +	fse->max_width = fse->min_width;
>> +	fse->min_height = sensor->sensor_modes[fse->index].height;
>> +	fse->max_height = fse->min_height;
>> +
>> +	return 0;
>> +}
>> +
>> +static int vgxy61_update_analog_gain(struct vgxy61_dev *sensor, u32 target)
>> +{
>> +	struct i2c_client *client = sensor->i2c_client;
>> +	int ret;
>> +
>> +	/* Apply gain */
>> +	ret = vgxy61_write_reg(sensor, DEVICE_ANALOG_GAIN, target);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dev_dbg(&client->dev, "Set analog gain: 0x%04x\n", target);
>> +
>> +	return 0;
>> +}
>> +
>> +static int vgxy61_update_digital_gain(struct vgxy61_dev *sensor, u32 target)
>> +{
>> +	struct i2c_client *client = sensor->i2c_client;
>> +	int ret;
>> +
>> +	/*
>> +	 * For a monochrome version, configuring DIGITAL_GAIN_LONG_CH0 and
>> +	 * DIGITAL_GAIN_SHORT_CH0 is enough to configure the gain of all
>> +	 * four sub pixels.
>> +	 */
>> +	ret = vgxy61_write_reg16(sensor, DEVICE_DIGITAL_GAIN_LONG, target);
>> +	if (ret)
>> +		return ret;
>> +	ret = vgxy61_write_reg16(sensor, DEVICE_DIGITAL_GAIN_SHORT, target);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dev_dbg(&client->dev, "Set digital gain: 0x%04x\n", target);
>> +
>> +	return 0;
>> +}
>> +
>> +static int vgxy61_update_patgen(struct vgxy61_dev *sensor, u32 index)
>> +{
>> +	u32 pattern = index <= 3 ? index : index + 12;
>> +	u32 reg;
>> +
>> +	reg = (pattern << 18) | (pattern << 4);
>> +	if (index)
>> +		reg |= (1 << 16) | 1;
> 
> Macros would be nice instead of magic numbers. Same where applicable
> below.
> 
>> +	return vgxy61_write_reg32(sensor, DEVICE_PATGEN_CTRL, reg);
>> +}
>> +
>> +static int vgxy61_update_gpiox_strobe_mode(struct vgxy61_dev *sensor, enum strobe_modes mode,
>> +					   int idx)
>> +{
>> +	const u8 index2val[] = {0x0, 0x1, 0x3};
> 
> Make this static const.
> 
>> +	u16 reg;
>> +	int ret;
>> +
>> +	ret = vgxy61_read_reg16(sensor, DEVICE_SIGNALS_CTRL, &reg);
>> +	if (ret)
>> +		return ret;
>> +	reg &= ~(0xf << (idx * 4));
>> +	reg |= index2val[mode] << (idx * 4);
>> +
>> +	return vgxy61_write_reg16(sensor, DEVICE_SIGNALS_CTRL, reg);
>> +}
>> +
>> +static int vgxy61_update_gpios_strobe_mode(struct vgxy61_dev *sensor, enum hdr hdr)
>> +{
>> +	enum strobe_modes strobe_mode;
>> +	int i, ret;
>> +
>> +	switch (hdr) {
>> +	case HDR_LINEAR:
>> +		strobe_mode = STROBE_ENABLED;
>> +		break;
>> +	case HDR_SUB:
>> +	case NO_HDR:
>> +		strobe_mode = STROBE_LONG;
>> +		break;
>> +	default:
>> +		/* Should never happen */
>> +		WARN_ON(true);
>> +		break;
>> +	}
>> +
>> +	for (i = 0; i < VGXY61_NB_GPIOS; i++) {
>> +		ret = vgxy61_update_gpiox_strobe_mode(sensor, strobe_mode, i);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int vgxy61_update_gpios_strobe_polarity(struct vgxy61_dev *sensor, int polarity)
>> +{
>> +	struct i2c_client *client = sensor->i2c_client;
>> +	int ret;
>> +
>> +	if (sensor->streaming)
>> +		return -EBUSY;
>> +
>> +	dev_dbg(&client->dev, "setting gpios polarity: %d\n", polarity);
>> +
>> +	ret = vgxy61_write_reg(sensor, DEVICE_GPIO_0_CTRL, polarity << 1);
>> +	if (ret)
>> +		return ret;
>> +	ret = vgxy61_write_reg(sensor, DEVICE_GPIO_1_CTRL, polarity << 1);
>> +	if (ret)
>> +		return ret;
>> +	ret = vgxy61_write_reg(sensor, DEVICE_GPIO_2_CTRL, polarity << 1);
>> +	if (ret)
>> +		return ret;
>> +	ret = vgxy61_write_reg(sensor, DEVICE_GPIO_3_CTRL, polarity << 1);
>> +	if (ret)
>> +		return ret;
>> +	return vgxy61_write_reg(sensor, DEVICE_SIGNALS_POLARITY_CTRL, polarity);
>> +}
>> +
>> +static int vgxy61_get_expo_long_max(struct vgxy61_dev *sensor, int short_expo_ratio)
>> +{
>> +	int first_rot_max_expo, second_rot_max_expo, third_rot_max_expo;
>> +
>> +	/* Apply sensor rule of thumbs */
>> +	/* Avoid bad pixel line at the botom of the image */
>> +	first_rot_max_expo =
>> +		((sensor->frame_length - sensor->current_mode->crop.height - sensor->rot_term) *
>> +		short_expo_ratio) - 1;
>> +
>> +	/* Avoid sensor crash */
> 
> How so ?
> 

This specific rule guarantees the framelength < expo_time. If this is not the case then the sensor will crash.
I will add a bit more comment for this, and for other rules also.

>> +	second_rot_max_expo =
>> +		(((sensor->frame_length - VGXY61_EXPOS_ROT_TERM) * short_expo_ratio) /
>> +		(short_expo_ratio + 1)) - 1;
>> +
>> +	/* Avoid sensor crash */
>> +	third_rot_max_expo = (sensor->frame_length / 71) * short_expo_ratio;
>> +
>> +	/* Take the minimum from all rules */
>> +	return min(min(first_rot_max_expo, second_rot_max_expo), third_rot_max_expo);
>> +}
>> +
>> +static int vgxy61_update_exposure(struct vgxy61_dev *sensor, int new_expo_long, enum hdr hdr)
>> +{
>> +	struct i2c_client *client = sensor->i2c_client;
>> +	int new_expo_short = 0;
>> +	int expo_short_max = 0;
>> +	int expo_long_min = VGXY61_MIN_EXPOSURE;
>> +	int expo_long_max;
>> +
>> +	/* Compute short exposure according to hdr mode and long exposure */
>> +	switch (hdr) {
>> +	case HDR_LINEAR:
>> +		/* Take ratio into account for minimal exposures in HDR_LINEAR */
>> +		expo_long_min = VGXY61_MIN_EXPOSURE * VGXY61_HDR_LINEAR_RATIO;
>> +		new_expo_long = max(expo_long_min, new_expo_long);
>> +
>> +		expo_long_max = vgxy61_get_expo_long_max(sensor, VGXY61_HDR_LINEAR_RATIO);
>> +		expo_short_max =
>> +			(expo_long_max + (VGXY61_HDR_LINEAR_RATIO / 2)) / VGXY61_HDR_LINEAR_RATIO;
>> +		new_expo_short =
>> +			(new_expo_long + (VGXY61_HDR_LINEAR_RATIO / 2)) / VGXY61_HDR_LINEAR_RATIO;
>> +		break;
>> +	case HDR_SUB:
>> +		new_expo_long = max(expo_long_min, new_expo_long);
>> +
>> +		expo_long_max = vgxy61_get_expo_long_max(sensor, 1);
>> +		/* Short and long are the same in HDR_SUB */
>> +		expo_short_max = expo_long_max;
>> +		new_expo_short = new_expo_long;
>> +		break;
>> +	case NO_HDR:
>> +		new_expo_long = max(expo_long_min, new_expo_long);
>> +
>> +		/*
>> +		 * As short expo is 0 here, only the second rule of thumb applies, see
>> +		 * vgxy61_get_expo_long_max for more
>> +		 */
>> +		expo_long_max = sensor->frame_length - VGXY61_EXPOS_ROT_TERM;
>> +		break;
>> +	default:
>> +		/* Should never happen */
>> +		WARN_ON(true);
>> +		break;
>> +	}
>> +
>> +	/* If this happens, something is wrong with formulas */
>> +	WARN_ON(expo_long_min > expo_long_max);
>> +
>> +	if (new_expo_long > expo_long_max) {
>> +		dev_warn(&client->dev, "Exposure %d too high, clamping to %d\n",
>> +			 new_expo_long, expo_long_max);
>> +		new_expo_long = expo_long_max;
>> +		new_expo_short = expo_short_max;
>> +	}
>> +
>> +	dev_dbg(&client->dev, "frame_length %d, new_expo_long %d, new_expo_short %d\n",
>> +		sensor->frame_length, new_expo_long, new_expo_short);
>> +	dev_dbg(&client->dev, "expo_long_min %d, expo_long_max %d\n",
>> +		expo_long_min, expo_long_max);
>> +
>> +	/* Apply exposure */
>> +	sensor->expo_long = new_expo_long;
>> +	sensor->expo_short = new_expo_short;
>> +	sensor->expo_max = expo_long_max;
>> +	sensor->expo_min = expo_long_min;
>> +
>> +	if (sensor->streaming)
>> +		return apply_exposure(sensor);
>> +	return 0;
>> +}
>> +
>> +static int vgxy61_update_vblank(struct vgxy61_dev *sensor, int vblank, int hdr)
>> +{
>> +	int ret;
>> +
>> +	sensor->vblank_min = vgxy61_get_vblank_min(sensor, hdr);
>> +	sensor->vblank = max(sensor->vblank_min, vblank);
>> +	sensor->frame_length = sensor->current_mode->crop.height + sensor->vblank;
>> +
>> +	/* Update exposure according to vblank */
>> +	ret = vgxy61_update_exposure(sensor, sensor->expo_long, hdr);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (sensor->streaming)
>> +		return set_frame_rate(sensor);
>> +	return 0;
>> +}
>> +
>> +static int vgxy61_update_hdr(struct vgxy61_dev *sensor, u32 index)
>> +{
>> +	const u8 index2val[] = {0x1, 0x4, 0xa};
>> +	int ret;
>> +
>> +	/*
>> +	 * vblank and short exposure change according to HDR mode, do it first as it can
>> +	 * violate sensors 'rule of thumbs' and therefore will require to change the long exposure
>> +	 */
>> +	ret = vgxy61_update_vblank(sensor, sensor->vblank, index);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Update strobe mode according to HDR */
>> +	ret = vgxy61_update_gpios_strobe_mode(sensor, index);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = vgxy61_write_reg(sensor, DEVICE_HDR_CTRL, index2val[index]);
>> +	if (ret)
>> +		return ret;
>> +	sensor->hdr = index;
>> +
>> +	return 0;
>> +}
>> +
>> +static int vgxy61_set_fmt(struct v4l2_subdev *sd,
>> +			  struct v4l2_subdev_state *sd_state,
>> +			  struct v4l2_subdev_format *format)
>> +{
>> +	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
>> +	struct i2c_client *client = sensor->i2c_client;
>> +	const struct vgxy61_mode_info *new_mode;
>> +	struct v4l2_mbus_framefmt *fmt;
>> +	int ret;
>> +
>> +	dev_dbg(&client->dev, "%s probe %d\n", __func__, format->pad);
>> +	dev_dbg(&client->dev, "%s %dx%d\n", __func__, format->format.width, format->format.height);
>> +
>> +	mutex_lock(&sensor->lock);
>> +
>> +	if (sensor->streaming) {
>> +		ret = -EBUSY;
>> +		goto out;
>> +	}
>> +
>> +	/* Find best format */
>> +	ret = vgxy61_try_fmt_internal(sd, &format->format, &new_mode);
>> +	if (ret)
>> +		goto out;
>> +
>> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
>> +		fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
>> +		*fmt = format->format;
>> +	} else if (sensor->current_mode != new_mode || sensor->fmt.code != format->format.code) {
>> +		fmt = &sensor->fmt;
>> +		*fmt = format->format;
>> +
>> +		sensor->current_mode = new_mode;
>> +
>> +		/* Reset vblank and framelength to default */
>> +		ret = vgxy61_update_vblank(sensor,
>> +					   VGXY61_FRAME_LENGTH_DEF -
>> +					   sensor->current_mode->crop.height,
>> +					   sensor->hdr);
>> +
>> +		/* Update controls to reflect new mode */
>> +		__v4l2_ctrl_s_ctrl_int64(sensor->pixel_rate_ctrl, get_pixel_rate(sensor));
>> +		__v4l2_ctrl_modify_range(sensor->vblank_ctrl, sensor->vblank_min,
>> +					 0xffff - sensor->current_mode->crop.height, 1,
>> +					 sensor->vblank);
>> +		__v4l2_ctrl_s_ctrl(sensor->vblank_ctrl, sensor->vblank);
>> +		__v4l2_ctrl_modify_range(sensor->expo_ctrl, sensor->expo_min,
>> +					 sensor->expo_max, 1,
>> +					 sensor->expo_long);
>> +	}
>> +
>> +out:
>> +	mutex_unlock(&sensor->lock);
>> +
>> +	return ret;
>> +}
>> +
>> +static int vgxy61_get_temp_stream_enabled(struct vgxy61_dev *sensor, int *temp)
>> +{
>> +	int ret;
>> +	u16 temperature;
>> +
>> +	ret = vgxy61_read_reg16(sensor, DEVICE_THSENS1_TEMPERATURE, &temperature);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Temperature is expressed in Kelvin in Q10.2 fixed point format*/
>> +	temperature = (temperature & 0x0fff) >> 2;
>> +	temperature = kelvin_to_celsius(temperature);
>> +
>> +	*temp = temperature;
>> +
>> +	return 0;
>> +}
>> +
>> +static int vgxy61_get_temp_stream_disabled(struct vgxy61_dev *sensor, int *temp)
>> +{
>> +	int ret;
>> +
>> +	/* Device needs to be in standby mode if streaming is off */
>> +	ret = vgxy61_write_reg(sensor, DEVICE_STBY, STBY_REQ_TMP_READ);
> 
> Can't runtime PM be disabled here ?
> 

You're absolutely right. This works as of now because I guess my regulators are used for something else and therefore do not go down, but should not.
This is tricky as I don't want to power up (and therefore patch) the sensor every time I want to see the temperature, but maybe I won't have the choice.
For example every time I stop streaming in qv4l2, the temperature is read. This would result in this:
	power off -> get_temp -> power on (+patch) -> read temp -> power off
Maybe I can just remove the temperature reading while off? Any other idea?

Anyway this will depend on the 2/5 patch discussion thread result.

>> +	if (ret)
>> +		return ret;
>> +	ret = vgxy61_poll_reg(sensor, DEVICE_STBY, STBY_NO_REQ, VGXY61_TIMEOUT_MS);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return vgxy61_get_temp_stream_enabled(sensor, temp);
>> +}
>> +
>> +static int vgxy61_get_temp(struct vgxy61_dev *sensor, int *temp)
>> +{
>> +	*temp = 0;
>> +	if (sensor->streaming)
>> +		return vgxy61_get_temp_stream_enabled(sensor, temp);
>> +	else
>> +		return vgxy61_get_temp_stream_disabled(sensor, temp);
>> +}
>> +
>> +static int vgxy61_s_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
>> +	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
>> +	int ret;
>> +
>> +	switch (ctrl->id) {
>> +	case V4L2_CID_EXPOSURE:
>> +		ret = vgxy61_update_exposure(sensor, ctrl->val, sensor->hdr);
>> +		ctrl->val = sensor->expo_long;
>> +		break;
>> +	case V4L2_CID_ANALOGUE_GAIN:
>> +		ret = vgxy61_update_analog_gain(sensor, ctrl->val);
>> +		break;
>> +	case V4L2_CID_DIGITAL_GAIN:
>> +		ret = vgxy61_update_digital_gain(sensor, ctrl->val);
>> +		break;
>> +	case V4L2_CID_VFLIP:
>> +	case V4L2_CID_HFLIP:
>> +		if (sensor->streaming) {
>> +			ret = -EBUSY;
>> +			break;
>> +		}
>> +		if (ctrl->id == V4L2_CID_VFLIP)
>> +			sensor->vflip = ctrl->val;
>> +		if (ctrl->id == V4L2_CID_HFLIP)
>> +			sensor->hflip = ctrl->val;
>> +		ret = vgxy61_write_reg(sensor, DEVICE_ORIENTATION,
>> +				       sensor->hflip | (sensor->vflip << 1));
>> +		break;
>> +	case V4L2_CID_TEST_PATTERN:
>> +		ret = vgxy61_update_patgen(sensor, ctrl->val);
>> +		break;
>> +	case V4L2_CID_HDR:
>> +		ret = vgxy61_update_hdr(sensor, ctrl->val);
>> +		/* Update vblank and exposure controls to match new hdr */
>> +		__v4l2_ctrl_modify_range(sensor->vblank_ctrl, sensor->vblank_min,
>> +					 0xffff - sensor->current_mode->crop.height, 1,
>> +					 sensor->vblank);
>> +		__v4l2_ctrl_modify_range(sensor->expo_ctrl, sensor->expo_min,
>> +					 sensor->expo_max, 1, sensor->expo_long);
>> +		break;
>> +	case V4L2_CID_VBLANK:
>> +		ret = vgxy61_update_vblank(sensor, ctrl->val, sensor->hdr);
>> +		/* Update exposure control to match new vblank */
>> +		__v4l2_ctrl_modify_range(sensor->expo_ctrl, sensor->expo_min,
>> +					 sensor->expo_max, 1, sensor->expo_long);
>> +		break;
>> +	default:
>> +		ret = -EINVAL;
>> +		break;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int vgxy61_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
>> +	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
>> +	int ret;
>> +
>> +	switch (ctrl->id) {
>> +	case V4L2_CID_TEMPERATURE:
>> +		ret = vgxy61_get_temp(sensor, &ctrl->val);
>> +		break;
>> +	default:
>> +		ret = -EINVAL;
>> +		break;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct v4l2_ctrl_ops vgxy61_ctrl_ops = {
>> +	.g_volatile_ctrl = vgxy61_g_volatile_ctrl,
>> +	.s_ctrl = vgxy61_s_ctrl,
>> +};
>> +
>> +static const struct v4l2_ctrl_config vgxy61_hdr_ctrl = {
>> +	.ops		= &vgxy61_ctrl_ops,
>> +	.id		= V4L2_CID_HDR,
>> +	.name		= "HDR mode",
>> +	.type		= V4L2_CTRL_TYPE_MENU,
>> +	.min		= 0,
>> +	.max		= ARRAY_SIZE(vgxy61_hdr_modes) - 1,
>> +	.def		= NO_HDR,
>> +	.qmenu		= vgxy61_hdr_modes,
>> +};
>> +
>> +static int vgxy61_init_controls(struct vgxy61_dev *sensor)
>> +{
>> +	const struct v4l2_ctrl_ops *ops = &vgxy61_ctrl_ops;
>> +	struct v4l2_ctrl_handler *hdl = &sensor->ctrl_handler;
>> +	struct v4l2_ctrl *ctrl;
>> +	int ret;
>> +
>> +	v4l2_ctrl_handler_init(hdl, 16);
>> +	mutex_init(&sensor->lock);
> 
> This should be initialized in probe(), it doesn't belong here.
> 
>> +	/* We can use our own mutex for the ctrl lock */
>> +	hdl->lock = &sensor->lock;
>> +	/* Standard controls */
>> +	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN, 0, 0x1c, 1, 0x0);
>> +	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_DIGITAL_GAIN, 0, 0xfff, 1, 256);
>> +	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_TEMPERATURE, -128, 128, 1, 0);
>> +	v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_TEST_PATTERN,
>> +				     ARRAY_SIZE(vgxy61_test_pattern_menu) - 1, 0, 0,
>> +				     vgxy61_test_pattern_menu);
>> +	v4l2_ctrl_new_custom(hdl, &vgxy61_hdr_ctrl, NULL);
>> +	ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK, 0, sensor->line_length, 1,
>> +				 sensor->line_length - sensor->current_mode->width);
>> +	ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> +	/* Custom controls */
>> +	ctrl = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ, ARRAY_SIZE(link_freq) - 1, 0,
>> +				      link_freq);
>> +	ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> +	/* Keep a pointer to these controls as we need to update them when setting the format */
>> +	sensor->pixel_rate_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PIXEL_RATE, 1, INT_MAX, 1,
>> +						    get_pixel_rate(sensor));
>> +	sensor->pixel_rate_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> +	sensor->expo_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE, sensor->expo_min,
>> +					      sensor->expo_max, 1, sensor->expo_long);
>> +	sensor->vblank_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK, sensor->vblank_min,
>> +						0xffff - sensor->current_mode->crop.height, 1,
>> +						sensor->vblank);
>> +	sensor->vflip_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP, 0, 1, 1, sensor->vflip);
>> +	sensor->hflip_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP, 0, 1, 1, sensor->hflip);
>> +
>> +	if (hdl->error) {
>> +		ret = hdl->error;
>> +		goto free_ctrls;
>> +	}
>> +
>> +	sensor->sd.ctrl_handler = hdl;
>> +	return 0;
>> +
>> +free_ctrls:
>> +	v4l2_ctrl_handler_free(hdl);
>> +	mutex_destroy(&sensor->lock);
>> +	return ret;
>> +}
>> +
>> +static const struct v4l2_subdev_core_ops vgxy61_core_ops = {
>> +};
> 
> You can drop this.
> 
>> +
>> +static const struct v4l2_subdev_video_ops vgxy61_video_ops = {
>> +	.s_stream = vgxy61_s_stream,
>> +};
>> +
>> +static const struct v4l2_subdev_pad_ops vgxy61_pad_ops = {
>> +	.enum_mbus_code = vgxy61_enum_mbus_code,
>> +	.get_fmt = vgxy61_get_fmt,
>> +	.set_fmt = vgxy61_set_fmt,
>> +	.get_selection = vgxy61_get_selection,
>> +	.enum_frame_size = vgxy61_enum_frame_size,
>> +};
>> +
>> +static const struct v4l2_subdev_ops vgxy61_subdev_ops = {
>> +	.core = &vgxy61_core_ops,
>> +	.video = &vgxy61_video_ops,
>> +	.pad = &vgxy61_pad_ops,
>> +};
>> +
>> +static const struct media_entity_operations vgxy61_subdev_entity_ops = {
>> +	.link_validate = v4l2_subdev_link_validate,
>> +};
>> +
>> +/* Set phy polarities */
>> +static int vgxy61_tx_from_ep(struct vgxy61_dev *sensor, struct fwnode_handle *endpoint)
>> +{
>> +	struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
>> +	struct i2c_client *client = sensor->i2c_client;
>> +	u32 log2phy[VGXY61_NB_POLARITIES] = {~0, ~0, ~0, ~0, ~0};
>> +	u32 phy2log[VGXY61_NB_POLARITIES] = {~0, ~0, ~0, ~0, ~0};
>> +	int polarities[VGXY61_NB_POLARITIES] = {0, 0, 0, 0, 0};
>> +	int l_nb;
>> +	int p, l;
>> +	int ret;
>> +	int i;
>> +
>> +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
>> +	if (ret)
>> +		goto error_alloc;
>> +
>> +	l_nb = ep.bus.mipi_csi2.num_data_lanes;
>> +	if (l_nb != 1 && l_nb != 2 && l_nb != 4) {
>> +		dev_err(&client->dev, "invalid data lane number %d\n", l_nb);
>> +		goto error_ep;
>> +	}
>> +
>> +	/* Build log2phy, phy2log and polarities from ep info */
>> +	log2phy[0] = ep.bus.mipi_csi2.clock_lane;
>> +	phy2log[log2phy[0]] = 0;
>> +	for (l = 1; l < l_nb + 1; l++) {
>> +		log2phy[l] = ep.bus.mipi_csi2.data_lanes[l - 1];
>> +		phy2log[log2phy[l]] = l;
>> +	}
>> +	/*
>> +	 * Then fill remaining slots for every physical slot to have something valid for hardware
>> +	 * stuff.
>> +	 */
>> +	for (p = 0; p < VGXY61_NB_POLARITIES; p++) {
>> +		if (phy2log[p] != ~0)
>> +			continue;
>> +		phy2log[p] = l;
>> +		log2phy[l] = p;
>> +		l++;
>> +	}
>> +	for (l = 0; l < l_nb + 1; l++)
>> +		polarities[l] = ep.bus.mipi_csi2.lane_polarities[l];
>> +
>> +	if (log2phy[0] != 0) {
>> +		dev_err(&client->dev, "clk lane must be map to physical lane 0\n");
>> +		goto error_ep;
>> +	}
>> +	sensor->oif_ctrl = (polarities[4] << 15) + ((phy2log[4] - 1) << 13) +
>> +			   (polarities[3] << 12) + ((phy2log[3] - 1) << 10) +
>> +			   (polarities[2] <<  9) + ((phy2log[2] - 1) <<  7) +
>> +			   (polarities[1] <<  6) + ((phy2log[1] - 1) <<  4) +
>> +			   (polarities[0] <<  3) +
>> +			   l_nb;
>> +	sensor->nb_of_lane = l_nb;
>> +
>> +	dev_dbg(&client->dev, "tx uses %d lanes", l_nb);
>> +	for (i = 0; i < 5; i++) {
>> +		dev_dbg(&client->dev, "log2phy[%d] = %d\n", i, log2phy[i]);
>> +		dev_dbg(&client->dev, "phy2log[%d] = %d\n", i, phy2log[i]);
>> +		dev_dbg(&client->dev, "polarity[%d] = %d\n", i, polarities[i]);
>> +	}
>> +	dev_dbg(&client->dev, "oif_ctrl = 0x%04x\n", sensor->oif_ctrl);
>> +
>> +	v4l2_fwnode_endpoint_free(&ep);
>> +
>> +	return 0;
>> +
>> +error_ep:
>> +	v4l2_fwnode_endpoint_free(&ep);
>> +error_alloc:
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static int vgxy61_configure(struct vgxy61_dev *sensor)
>> +{
>> +	struct i2c_client *client = sensor->i2c_client;
>> +	int sensor_freq;
>> +	unsigned int prediv;
>> +	unsigned int mult;
>> +	int ret;
>> +
>> +	compute_pll_parameters_by_freq(sensor->clk_freq, &prediv, &mult);
>> +	sensor_freq = (mult * sensor->clk_freq) / prediv;
>> +	/* Frequency to data rate is 1:1 ratio for MIPI */
>> +	sensor->data_rate_in_mbps = sensor_freq;
>> +	/* Video timing ISP path (pixel clock)  requires 804/5 mhz = 160 mhz */
>> +	sensor->pclk = sensor_freq / 5;
>> +
>> +	/* Cache line_length value */
>> +	ret = vgxy61_read_reg16(sensor, DEVICE_LINE_LENGTH, &sensor->line_length);
>> +	if (ret)
>> +		return ret;
>> +	/* Configure clocks */
>> +	ret = vgxy61_write_reg32(sensor, DEVICE_EXT_CLOCK, sensor->clk_freq);
>> +	if (ret)
>> +		return ret;
>> +	ret = vgxy61_write_reg(sensor, DEVICE_CLK_PLL_PREDIV, prediv);
>> +	if (ret)
>> +		return ret;
>> +	ret = vgxy61_write_reg(sensor, DEVICE_CLK_SYS_PLL_MULT, mult);
>> +	if (ret)
>> +		return ret;
>> +	/* Configure interface */
>> +	ret = vgxy61_write_reg16(sensor, DEVICE_OIF_CTRL, sensor->oif_ctrl);
>> +	if (ret)
>> +		return ret;
>> +	/* Disable pwm compression */
>> +	ret = vgxy61_write_reg(sensor, DEVICE_FRAME_CONTENT_CTRL, 0);
>> +	if (ret)
>> +		return ret;
>> +	/* Disable asil lines */
>> +	ret = vgxy61_write_reg(sensor, DEVICE_BYPASS_CTRL, 4);
>> +	if (ret)
>> +		return ret;
>> +	/* Set gpios polarity according to device tree value */
>> +	ret = vgxy61_update_gpios_strobe_polarity(sensor, sensor->gpios_polarity);
>> +	if (ret)
>> +		return ret;
>> +	/* Slave mode */
>> +	ret = vgxy61_write_reg(sensor, DEVICE_VT_CTRL, sensor->slave_mode);
>> +	if (ret)
>> +		return ret;
>> +	/* Set pattern generator solid to middle value */
>> +	ret = vgxy61_write_reg16(sensor, DEVICE_PATGEN_LONG_DATA_GR, 0x800);
>> +	if (ret)
>> +		return ret;
>> +	ret = vgxy61_write_reg16(sensor, DEVICE_PATGEN_LONG_DATA_R, 0x800);
>> +	if (ret)
>> +		return ret;
>> +	ret = vgxy61_write_reg16(sensor, DEVICE_PATGEN_LONG_DATA_B, 0x800);
>> +	if (ret)
>> +		return ret;
>> +	ret = vgxy61_write_reg16(sensor, DEVICE_PATGEN_LONG_DATA_GB, 0x800);
>> +	if (ret)
>> +		return ret;
>> +	ret = vgxy61_write_reg16(sensor, DEVICE_PATGEN_SHORT_DATA_GR, 0x800);
>> +	if (ret)
>> +		return ret;
>> +	ret = vgxy61_write_reg16(sensor, DEVICE_PATGEN_SHORT_DATA_R, 0x800);
>> +	if (ret)
>> +		return ret;
>> +	ret = vgxy61_write_reg16(sensor, DEVICE_PATGEN_SHORT_DATA_B, 0x800);
>> +	if (ret)
>> +		return ret;
>> +	ret = vgxy61_write_reg16(sensor, DEVICE_PATGEN_SHORT_DATA_GB, 0x800);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dev_dbg(&client->dev, "clock prediv = %d\n", prediv);
>> +	dev_dbg(&client->dev, "clock mult = %d\n", mult);
>> +	dev_dbg(&client->dev, "data rate = %d mbps\n",
>> +		sensor->data_rate_in_mbps);
>> +
>> +	return 0;
>> +}
>> +
>> +static int vgxy61_patch(struct vgxy61_dev *sensor)
>> +{
>> +	struct i2c_client *client = sensor->i2c_client;
>> +	u16 patch;
>> +	int ret;
>> +
>> +	ret = vgxy61_write_array(sensor, DEVICE_FWPATCH_START_ADDR, sizeof(patch_array),
>> +				 patch_array);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = vgxy61_write_reg(sensor, DEVICE_STBY, 0x10);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = vgxy61_poll_reg(sensor, DEVICE_STBY, 0, VGXY61_TIMEOUT_MS);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = vgxy61_read_reg16(sensor, DEVICE_FWPATCH_REVISION, &patch);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (patch != (DEVICE_FWPATCH_REVISION_MAJOR << 12) +
>> +		     (DEVICE_FWPATCH_REVISION_MINOR << 8) +
>> +		     DEVICE_FWPATCH_REVISION_MICRO) {
>> +		dev_err(&client->dev, "bad patch version expected %d.%d.%d got %d.%d.%d\n",
>> +			DEVICE_FWPATCH_REVISION_MAJOR,
>> +			DEVICE_FWPATCH_REVISION_MINOR,
>> +			DEVICE_FWPATCH_REVISION_MICRO,
>> +			patch >> 12, (patch >> 8) & 0x0f, patch & 0xff);
>> +		return -ENODEV;
>> +	}
>> +	dev_dbg(&client->dev, "patch %d.%d.%d applied\n",
>> +		patch >> 12, (patch >> 8) & 0x0f, patch & 0xff);
>> +
>> +	return 0;
>> +}
>> +
>> +static int vgxy61_detect_cut_version(struct vgxy61_dev *sensor)
>> +{
>> +	struct i2c_client *client = sensor->i2c_client;
>> +	u16 device_rev;
>> +	int ret;
>> +
>> +	ret = vgxy61_read_reg16(sensor, DEVICE_REVISION, &device_rev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	switch (device_rev >> 8) {
>> +	case 0xA:
>> +		dev_dbg(&client->dev, "Cut1 detected\n");
>> +		dev_err(&client->dev, "Cut1 not supported by this driver\n");
>> +		return -ENODEV;
>> +	case 0xB:
>> +		dev_dbg(&client->dev, "Cut2 detected\n");
>> +		return 0;
>> +	case 0xC:
>> +		dev_dbg(&client->dev, "Cut3 detected\n");
>> +		return 0;
>> +	default:
>> +		dev_err(&client->dev, "Unable to detect cut version\n");
>> +		return -ENODEV;
>> +	}
>> +}
>> +
>> +static int vgxy61_detect(struct vgxy61_dev *sensor)
>> +{
>> +	struct i2c_client *client = sensor->i2c_client;
>> +	u16 id = 0;
>> +	int ret;
>> +	u8 st;
>> +
>> +	ret = vgxy61_read_reg16(sensor, DEVICE_MODEL_ID_REG, &id);
>> +	if (ret)
>> +		return ret;
>> +	if (id != VG5661_MODEL_ID && id != VG5761_MODEL_ID) {
>> +		dev_warn(&client->dev, "Unsupported sensor id %x\n", id);
>> +		return -ENODEV;
>> +	}
>> +	dev_dbg(&client->dev, "detected sensor id = 0x%04x\n", id);
>> +	sensor->id = id;
>> +
>> +	ret = vgxy61_wait_state(sensor, SW_STBY, VGXY61_TIMEOUT_MS);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = vgxy61_read_reg(sensor, DEVICE_NVM, &st);
>> +	if (ret)
>> +		return ret;
>> +	if (st != NVM_OK)
>> +		dev_warn(&client->dev, "Bad nvm state got %d\n", st);
>> +
>> +	/* Detect cut version */
>> +	ret = vgxy61_detect_cut_version(sensor);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +/* Power/clock management functions */
>> +static int vgxy61_power_on(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>> +	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
>> +	int ret;
>> +
>> +	ret = vgxy61_get_regulators(sensor);
>> +	if (ret) {
>> +		dev_err(&client->dev, "failed to get regulators %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = regulator_bulk_enable(VGXY61_NUM_SUPPLIES, sensor->supplies);
>> +	if (ret) {
>> +		dev_err(&client->dev, "failed to enable regulators %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = clk_prepare_enable(sensor->xclk);
>> +	if (ret) {
>> +		dev_err(&client->dev, "failed to enable clock %d\n", ret);
>> +		goto disable_bulk;
>> +	}
>> +
>> +	/* Apply reset sequence */
>> +	if (sensor->reset_gpio) {
>> +		ret = vgxy61_apply_reset(sensor);
>> +		if (ret) {
>> +			dev_err(&client->dev, "sensor reset failed %d\n", ret);
>> +			goto disable_clock;
>> +		}
>> +	}
>> +
>> +	ret = vgxy61_detect(sensor);
> 
> Do we really need to run detection every time the sensor is powered on ?
> 

Surely not, I will add a if (sensor->already_detected) guard for this call to make it runs only once.

>> +	if (ret) {
>> +		dev_err(&client->dev, "sensor detect failed %d\n", ret);
>> +		goto disable_clock;
>> +	}
>> +
>> +	ret = vgxy61_patch(sensor);
>> +	if (ret) {
>> +		dev_err(&client->dev, "sensor patch failed %d\n", ret);
>> +		goto disable_clock;
>> +	}
>> +
>> +	ret = vgxy61_configure(sensor);
>> +	if (ret) {
>> +		dev_err(&client->dev, "sensor configuration failed %d\n", ret);
>> +		goto disable_clock;
>> +	}
>> +
>> +	return 0;
>> +
>> +disable_clock:
>> +	clk_disable_unprepare(sensor->xclk);
>> +disable_bulk:
>> +	regulator_bulk_disable(VGXY61_NUM_SUPPLIES, sensor->supplies);
>> +
>> +	return ret;
>> +}
>> +
>> +static int vgxy61_power_off(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>> +	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
>> +
>> +	clk_disable_unprepare(sensor->xclk);
>> +	regulator_bulk_disable(VGXY61_NUM_SUPPLIES, sensor->supplies);
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused vgxy61_suspend(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>> +	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
>> +
>> +	if (sensor->streaming)
>> +		vgxy61_stream_disable(sensor);
> 
> This shoudn't happen. The sensor should be stopped by the driver on the
> receiver side during system suspend. Same for resume.
> 

Sorry I'm still learning the pm_runtime API and I'm not sure I got your point.
If the sensor is already stopped then I could just remove the whole suspend function? Same for resume.
I'm not sure when the suspend function is called by the framework.

>> +
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused vgxy61_resume(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>> +	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
>> +	int ret;
>> +
>> +	if (sensor->streaming) {
>> +		ret = vgxy61_stream_enable(sensor);
>> +		if (ret)
>> +			goto error;
>> +	}
>> +
>> +	return 0;
>> +
>> +error:
>> +	vgxy61_stream_disable(sensor);
>> +	sensor->streaming = false;
>> +
>> +	return ret;
>> +}
>> +
>> +static void vgxy61_set_default_format(struct vgxy61_dev *sensor)
>> +{
>> +	if (sensor->id == VG5761_MODEL_ID) {
> 
> Would it make sense to have different compatible strings instead of
> detecting the version automatically ? Not only could it speed up probe
> if we could skip the detection, it would also allow not powering the
> sensor up at probe time, which may be required in some cases (for
> instance when a privacy LED is connected to the sensor power supply,
> flashing the LED at probe time can be very confusing for users).
> 

Your flashing LED example is a very good concern.
The idea behind this is to ease the user life as he does not have to know what model he is using.
For example we have several boards with either the VG5761 or VG5661 and are interchangeable without changing the device tree, which is also better for us as it shrinks the device tree number to maintain.
Also as a company we treat them the same way, hence the same driver.
I'm not hardly commited to keep this, but it indeed makes my life easier.

>> +		sensor->sensor_width = VGX761_WIDTH;
>> +		sensor->sensor_height = VGX761_HEIGHT;
>> +		sensor->sensor_modes = vgx761_mode_data;
>> +		sensor->sensor_modes_nb = ARRAY_SIZE(vgx761_mode_data);
>> +		sensor->current_mode = &vgx761_mode_data[VGX761_DEFAULT_MODE];
>> +		sensor->rot_term = VGX761_SHORT_ROT_TERM;
>> +	} else if (sensor->id == VG5661_MODEL_ID) {
>> +		sensor->sensor_width = VGX661_WIDTH;
>> +		sensor->sensor_height = VGX661_HEIGHT;
>> +		sensor->sensor_modes = vgx661_mode_data;
>> +		sensor->sensor_modes_nb = ARRAY_SIZE(vgx661_mode_data);
>> +		sensor->current_mode = &vgx661_mode_data[VGX661_DEFAULT_MODE];
>> +		sensor->rot_term = VGX661_SHORT_ROT_TERM;
>> +	} else {
>> +		/* Should never happen */
>> +		WARN_ON(true);
>> +	}
>> +	sensor->fmt.width = sensor->current_mode->width;
>> +	sensor->fmt.height = sensor->current_mode->height;
>> +	sensor->vblank = sensor->frame_length - sensor->current_mode->crop.height;
>> +}
>> +
>> +static int vgxy61_probe(struct i2c_client *client)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct fwnode_handle *endpoint;
>> +	struct vgxy61_dev *sensor;
>> +	int ret;
>> +
>> +	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
>> +	if (!sensor)
>> +		return -ENOMEM;
>> +
>> +	sensor->i2c_client = client;
>> +	sensor->streaming = false;
>> +	sensor->fmt.code = MEDIA_BUS_FMT_Y8_1X8;
>> +	sensor->fmt.colorspace = V4L2_COLORSPACE_RAW;
>> +	sensor->fmt.field = V4L2_FIELD_NONE;
>> +	sensor->fmt.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>> +	sensor->fmt.quantization = V4L2_QUANTIZATION_DEFAULT;
>> +	sensor->fmt.xfer_func = V4L2_XFER_FUNC_DEFAULT;
> 
> Please implement the subdev .init_cfg() operation, and call it here.
> There are several examples in existing drivers.
> 
>> +	sensor->frame_interval.numerator = 1;
>> +	sensor->frame_interval.denominator = 60;
>> +	sensor->hdr = NO_HDR;
>> +	sensor->expo_long = 200;
>> +	sensor->expo_short = 0;
>> +	sensor->hflip = false;
>> +	sensor->vflip = false;
>> +	sensor->frame_length = VGXY61_FRAME_LENGTH_DEF;
>> +
>> +	endpoint = fwnode_graph_get_next_endpoint(of_fwnode_handle(dev->of_node), NULL);
>> +	if (!endpoint) {
>> +		dev_err(dev, "endpoint node not found\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = vgxy61_tx_from_ep(sensor, endpoint);
>> +	fwnode_handle_put(endpoint);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to parse endpoint %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	sensor->xclk = devm_clk_get(dev, NULL);
>> +	if (IS_ERR(sensor->xclk)) {
>> +		dev_err(dev, "failed to get xclk\n");
>> +		return PTR_ERR(sensor->xclk);
>> +	}
>> +	sensor->clk_freq = clk_get_rate(sensor->xclk);
>> +	if (sensor->clk_freq < 6 * HZ_PER_MHZ || sensor->clk_freq > 27 * HZ_PER_MHZ) {
>> +		dev_err(dev, "Only 6Mhz-27Mhz clock range supported. provide %lu MHz\n",
>> +			sensor->clk_freq / HZ_PER_MHZ);
>> +		return -EINVAL;
>> +	}
>> +	sensor->gpios_polarity = of_property_read_bool(dev->of_node, "invert-gpios-polarity");
>> +	sensor->slave_mode = of_property_read_bool(dev->of_node, "slave-mode");
>> +
>> +	v4l2_i2c_subdev_init(&sensor->sd, client, &vgxy61_subdev_ops);
>> +	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
>> +	sensor->sd.entity.ops = &vgxy61_subdev_entity_ops;
>> +	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>> +
>> +	/* Request optional reset pin */
>> +	sensor->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>> +
>> +	ret = vgxy61_power_on(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	vgxy61_set_default_format(sensor);
>> +
>> +	/* HDR mode */
>> +	ret = vgxy61_update_hdr(sensor, sensor->hdr);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = vgxy61_init_controls(sensor);
>> +	if (ret) {
>> +		dev_err(&client->dev, "controls initialization failed %d\n", ret);
>> +		goto error_power_off;
>> +	}
>> +
>> +	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
>> +	if (ret) {
>> +		dev_err(&client->dev, "pads init failed %d\n", ret);
>> +		goto error_handler_free;
>> +	}
>> +
>> +	ret = v4l2_async_register_subdev(&sensor->sd);
>> +	if (ret) {
>> +		dev_err(&client->dev, "async subdev register failed %d\n", ret);
>> +		goto error_media_entity;
>> +	}
>> +
>> +	/* Enable runtime PM and turn off the device */
>> +	pm_runtime_set_active(dev);
>> +	pm_runtime_enable(dev);
>> +	pm_runtime_idle(dev);
> 
> You should do this before registering the subdev, as it can be accessed
> from userspace right after being registered.
> 
> Please also use auto-suspend to avoid long delays when stopping and
> restarting streaming quickly.
> 

I was not aware of autosuspend. Thanks a lot, I will look into this.

>> +
>> +	dev_info(&client->dev, "vgxy61 probe successfully\n");
> 
> I'd drop this, or turn it into a debug message.
> 
>> +
>> +	return 0;
>> +
>> +error_media_entity:
>> +	media_entity_cleanup(&sensor->sd.entity);
>> +error_handler_free:
>> +	v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
>> +	mutex_destroy(&sensor->lock);
>> +error_power_off:
>> +	vgxy61_power_off(dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static int vgxy61_remove(struct i2c_client *client)
>> +{
>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>> +	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
>> +
>> +	v4l2_async_unregister_subdev(&sensor->sd);
>> +	mutex_destroy(&sensor->lock);
>> +	media_entity_cleanup(&sensor->sd.entity);
>> +
>> +	pm_runtime_disable(&client->dev);
>> +	if (!pm_runtime_status_suspended(&client->dev))
>> +		vgxy61_power_off(&client->dev);
>> +	pm_runtime_set_suspended(&client->dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id vgxy61_dt_ids[] = {
>> +	{ .compatible = "st,st-vgxy61" },
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, vgxy61_dt_ids);
>> +
>> +static const struct dev_pm_ops vgxy61_pm_ops = {
>> +	SET_SYSTEM_SLEEP_PM_OPS(vgxy61_suspend, vgxy61_resume)
>> +	SET_RUNTIME_PM_OPS(vgxy61_power_off, vgxy61_power_on, NULL)
>> +};
>> +
>> +static struct i2c_driver vgxy61_i2c_driver = {
>> +	.driver = {
>> +		.name  = "st-vgxy61",
>> +		.of_match_table = vgxy61_dt_ids,
>> +		.pm = &vgxy61_pm_ops,
>> +	},
>> +	.probe_new = vgxy61_probe,
>> +	.remove = vgxy61_remove,
>> +};
>> +
>> +module_i2c_driver(vgxy61_i2c_driver);
>> +
>> +MODULE_AUTHOR("Benjamin Mugnier <benjamin.mugnier@foss.st.com>");
>> +MODULE_AUTHOR("Mickael Guene <mickael.guene@st.com>");
>> +MODULE_AUTHOR("Sylvain Petinot <sylvain.petinot@foss.st.com>");
>> +MODULE_DESCRIPTION("VGXY61 camera subdev driver");
>> +MODULE_LICENSE("GPL v2");
> 
