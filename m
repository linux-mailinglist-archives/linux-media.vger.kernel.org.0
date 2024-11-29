Return-Path: <linux-media+bounces-22285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8493A9DBF69
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 07:13:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72F62B2144C
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 06:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A209156C69;
	Fri, 29 Nov 2024 06:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ThGyNwkZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC25F184F
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 06:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732860825; cv=none; b=ABrY2VM+7Y+wgAYmydhnQjTppV0uYHN54KMV5ND/01geZx+EiY6cyKnsxwvtq9atNWfu3/ndNHWDJY1RZNbexC0GMNTQvImdGE4GGD8UvpzNPrneZc1hi7Q8znDvuY5hLLDfYw1eJV8Yjpd2uRcwWpzm5rWrftA3R5ens7XQARg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732860825; c=relaxed/simple;
	bh=aiviIYbOrOXwbO2NpvDLaNdS1VlNayps9QQFTyLPZC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ahm1oJyiNAh/xkXB4hLLihsTEm+Ptk+Xnd5FzRrc4T2kh3xUywZ9w8zVJU9E5NfVfAfBGfi3HyWYxRradksY1Um+v7h1NOMxeTJdqJ+xOEppG8ud8qPCrEkinzrMsy1/1POngjDjOcGqSvJwRKoGFm4/gsPvnDEURRAqnixOS0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ThGyNwkZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732860823; x=1764396823;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aiviIYbOrOXwbO2NpvDLaNdS1VlNayps9QQFTyLPZC8=;
  b=ThGyNwkZzMfp9ErVyEsZzkgsE6nXjmfQqlOj4X7j/rW3VkNKiISQBB83
   deOA9U/tP1OG11BDcxSfsAkcK4PwS4UiRsUrzjq5Aw715JXmbY/4TLflG
   tEo6vKq4dZeabb7WQOdF7SRbDa0wwDrpzFBE99EzISt3HvnKlGLo+R9wK
   +1JlDk9PbGMr+envCBGlUtkljGXHMvzT7zQdg/7ZBK1pmpnHRlW0/V3MH
   3MUva0Ped+KRebNnlg8FHWPjiodENTOWMwg8Cv0gRzJkWl3GGdrWw2dXO
   4llTI11zBZIe3NDmXCkklKzpjkf6eBJPeOux2DyFPJ48O3/9UqzwRw5iK
   Q==;
X-CSE-ConnectionGUID: Uz50Qv8PTDOvdfoBUdRRug==
X-CSE-MsgGUID: uyAOEBXFRN6Ccs7RnCbuSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33339770"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="33339770"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 22:13:42 -0800
X-CSE-ConnectionGUID: wFdQt5TDQKGW04mXCFOUJg==
X-CSE-MsgGUID: kIl4vjBbT2+1fMJ0jOpKbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="123273540"
Received: from unknown (HELO [10.238.224.208]) ([10.238.224.208])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 22:13:38 -0800
Message-ID: <a49a78f8-ddc7-45b6-9ed6-7ddf9648cc84@linux.intel.com>
Date: Fri, 29 Nov 2024 14:13:36 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: i2c: add lt6911uxe hdmi bridge driver
To: Hans Verkuil <hverkuil@xs4all.nl>, Dongcheng Yan
 <dongcheng.yan@intel.com>, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc: tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
 daxing.li@intel.com, hao.yao@intel.com, bingbu.cao@intel.com
References: <20241017030831.3248879-1-dongcheng.yan@intel.com>
 <5b42e37a-810d-45e4-8552-c9299837a16a@xs4all.nl>
 <4c2322d8-03cb-4d5d-97a8-3d9c327d3a72@linux.intel.com>
 <e0e255b6-9907-4268-acae-84467e5ec9d2@xs4all.nl>
Content-Language: en-US
From: "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>
In-Reply-To: <e0e255b6-9907-4268-acae-84467e5ec9d2@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi hans,

On 10/25/2024 2:58 PM, Hans Verkuil wrote:
> On 25/10/2024 06:06, Yan, Dongcheng wrote:
>> Hi Hans,
>>
>> On 10/23/2024 8:28 PM, Hans Verkuil wrote:
>>> Hi Dongcheng,
>>>
>>> Since this is an HDMI receiver, you need to implement the DV Timings API.
>>>
>>> drivers/media/i2c/tc358743.c is a good example of this.
>>>
>>> The LINK_FREQ/PIXEL_RATE controls do not apply to HDMI receivers, instead
>>> the dv timings pad ops must be used.
>>
>>
>> This is a HDMI to CSI2 bridge, more like a CSI-2 receiver rather than an HDMI receiver.
>>
>> I will implement DV timing API and refer to tc358743, thx for your suggestion.
>>
>> But LINK_FREQ/PIXEL_RATE is still needed in MIPI config programing. Do you think so?
> 
> The other HDMI to CSI bridges do not need this, take a look how the  tc358743
> driver handles it.
> 
>>
>>> I'm also missing EDID support.
>>
>>
>> Since it is a MIPI CSI-2 receiver, I don't know EDID before, I think you may have
>>
>> misunderstood LT6911UXE, it does not need this support in my sight.
> 
> Yes, it does. I think it comes with a default EDID, but you want to be able to change
> it. Often the EDID capabilities are not only defined by the capabilities of the
> receiver, but also by the capabilities of the device as a whole. E.g., does the
> video pipeline support interlaced formats or not?
> 
> So for a proper driver you need to support it. I worked with this bridge myself and
> I know there is documentation on how to read/write the EDID.
> 
"lt6911uxe provides editable EDID for customers, and edited like 
updating flash", we tend to used .bin file written to flash in the past.
Also I have never been involved in an EDID-related project, can you 
provide me some documentations or add this {get/set_edid} api to this 
driver patch directly? Since you have a lot of experience with 
lt6911uxe, I believe you can implement this API more accurately and 
co-delop for lt6911uxe.

Thanks,
Dongcheng

> Regards,
> 
> 	Hans
> 
>>
>>
>>> So this needs quite a bit more work, I'm afraid.
>>>
>>> How are you testing this device? Connected to a Raspberry Pi or something like that?
>>
>>
>> Yes, I used it in my poject based on IPU6 which is an ISP engine, this driver has been applied in many products.
>>
>> IPU6 driver is also upstreamed and you can find it in "/drivers/media/pci/intel/ipu6/".
>>
>>
>> Thanks,
>>
>> Dongcheng
>>
>>> Regards,
>>>
>>> 	Hans
>>>
>>> On 17/10/2024 05:08, Dongcheng Yan wrote:
>>>> Lontium LT9611UXE is a HDMI to MIPI CSI-2 bridge,
>>>> It supports modes up to 4k60fps, switches current mode when
>>>> plugging HDMI or changing the source active signal mode.
>>>>
>>>> Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
>>>> ---
>>>> v1 -> v2: replaced mutex with state_lock
>>>> v2 -> v3: fixed some pm_runtime err handlings
>>>>
>>>> ---
>>>>   drivers/media/i2c/Kconfig     |  12 +
>>>>   drivers/media/i2c/Makefile    |   1 +
>>>>   drivers/media/i2c/lt6911uxe.c | 627 ++++++++++++++++++++++++++++++++++
>>>>   3 files changed, 640 insertions(+)
>>>>   create mode 100644 drivers/media/i2c/lt6911uxe.c
>>>>
>>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>>> index 8ba096b8ebca..fbe3d0fe4ce6 100644
>>>> --- a/drivers/media/i2c/Kconfig
>>>> +++ b/drivers/media/i2c/Kconfig
>>>> @@ -1526,6 +1526,18 @@ config VIDEO_I2C
>>>>   	  To compile this driver as a module, choose M here: the
>>>>   	  module will be called video-i2c
>>>>   
>>>> +config VIDEO_LT6911UXE
>>>> +        tristate "Lontium LT6911UXE decoder"
>>>> +        depends on ACPI && VIDEO_DEV
>>>> +        select V4L2_FWNODE
>>>> +        select V4L2_CCI_I2C
>>>> +        help
>>>> +          This is a Video4Linux2 sensor-level driver for the Lontium
>>>> +          LT6911UXE HDMI to MIPI CSI-2 bridge.
>>>> +
>>>> +          To compile this driver as a module, choose M here: the
>>>> +          module will be called lt6911uxe.
>>>> +
>>>>   config VIDEO_M52790
>>>>   	tristate "Mitsubishi M52790 A/V switch"
>>>>   	depends on VIDEO_DEV && I2C
>>>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>>>> index fbb988bd067a..6c23a4463527 100644
>>>> --- a/drivers/media/i2c/Makefile
>>>> +++ b/drivers/media/i2c/Makefile
>>>> @@ -64,6 +64,7 @@ obj-$(CONFIG_VIDEO_ISL7998X) += isl7998x.o
>>>>   obj-$(CONFIG_VIDEO_KS0127) += ks0127.o
>>>>   obj-$(CONFIG_VIDEO_LM3560) += lm3560.o
>>>>   obj-$(CONFIG_VIDEO_LM3646) += lm3646.o
>>>> +obj-$(CONFIG_VIDEO_LT6911UXE) += lt6911uxe.o
>>>>   obj-$(CONFIG_VIDEO_M52790) += m52790.o
>>>>   obj-$(CONFIG_VIDEO_MAX9271_LIB) += max9271.o
>>>>   obj-$(CONFIG_VIDEO_MAX9286) += max9286.o
>>>> diff --git a/drivers/media/i2c/lt6911uxe.c b/drivers/media/i2c/lt6911uxe.c
>>>> new file mode 100644
>>>> index 000000000000..61115b2bb92f
>>>> --- /dev/null
>>>> +++ b/drivers/media/i2c/lt6911uxe.c
>>>> @@ -0,0 +1,627 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +// Copyright (c) 2023 - 2024 Intel Corporation.
>>>> +
>>>> +#include <linux/acpi.h>
>>>> +#include <linux/delay.h>
>>>> +#include <linux/gpio/consumer.h>
>>>> +#include <linux/i2c.h>
>>>> +#include <linux/interrupt.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/pm_runtime.h>
>>>> +#include <linux/regmap.h>
>>>> +#include <media/v4l2-cci.h>
>>>> +#include <media/v4l2-ctrls.h>
>>>> +#include <media/v4l2-device.h>
>>>> +#include <media/v4l2-event.h>
>>>> +#include <media/v4l2-fwnode.h>
>>>> +
>>>> +#define LT6911UXE_CHIP_ID		0x2102
>>>> +#define REG_CHIP_ID			CCI_REG16(0xe100)
>>>> +
>>>> +#define REG_ENABLE_I2C			CCI_REG8(0xe0ee)
>>>> +#define REG_PIX_CLK			CCI_REG24(0xe085)
>>>> +#define REG_BYTE_CLK			CCI_REG24(0xe092)
>>>> +#define REG_H_TOTAL			CCI_REG16(0xe088)
>>>> +#define REG_V_TOTAL			CCI_REG16(0xe08a)
>>>> +#define REG_HALF_H_ACTIVE		CCI_REG16(0xe08c)
>>>> +#define REG_V_ACTIVE			CCI_REG16(0xe08e)
>>>> +#define REG_MIPI_FORMAT			CCI_REG8(0xe096)
>>>> +#define REG_MIPI_TX_CTRL		CCI_REG8(0xe0b0)
>>>> +
>>>> +/* Interrupts */
>>>> +#define REG_INT_HDMI			CCI_REG8(0xe084)
>>>> +#define INT_VIDEO_DISAPPEAR		0x0
>>>> +#define INT_VIDEO_READY			0x1
>>>> +
>>>> +#define LT6911UXE_DEFAULT_WIDTH		3840
>>>> +#define LT6911UXE_DEFAULT_HEIGHT	2160
>>>> +#define LT6911UXE_DEFAULT_LANES		4
>>>> +#define LT6911UXE_DEFAULT_FPS		30
>>>> +#define LT6911UXE_MAX_LINK_FREQ		297000000
>>>> +#define LT9611_PAGE_CONTROL		0xff
>>>> +#define YUV422_8_BIT			0x7
>>>> +
>>>> +static const struct regmap_range_cfg lt9611uxe_ranges[] = {
>>>> +	{
>>>> +		.name = "register_range",
>>>> +		.range_min =  0,
>>>> +		.range_max = 0xffff,
>>>> +		.selector_reg = LT9611_PAGE_CONTROL,
>>>> +		.selector_mask = 0xff,
>>>> +		.selector_shift = 0,
>>>> +		.window_start = 0,
>>>> +		.window_len = 0x100,
>>>> +	},
>>>> +};
>>>> +
>>>> +static const struct regmap_config lt9611uxe_regmap_config = {
>>>> +	.reg_bits = 8,
>>>> +	.val_bits = 8,
>>>> +	.max_register = 0xffff,
>>>> +	.ranges = lt9611uxe_ranges,
>>>> +	.num_ranges = ARRAY_SIZE(lt9611uxe_ranges),
>>>> +};
>>>> +
>>>> +struct lt6911uxe_mode {
>>>> +	u32 width;
>>>> +	u32 height;
>>>> +	u32 code;
>>>> +	u32 fps;
>>>> +	u32 lanes;
>>>> +	s64 link_freq;
>>>> +};
>>>> +
>>>> +struct lt6911uxe {
>>>> +	struct v4l2_subdev sd;
>>>> +	struct media_pad pad;
>>>> +	struct v4l2_ctrl_handler ctrl_handler;
>>>> +	struct v4l2_ctrl *pixel_rate;
>>>> +	struct v4l2_ctrl *link_freq;
>>>> +
>>>> +	struct lt6911uxe_mode cur_mode;
>>>> +	struct regmap *regmap;
>>>> +	struct gpio_desc *reset_gpio;
>>>> +	struct gpio_desc *irq_gpio;
>>>> +};
>>>> +
>>>> +static const struct v4l2_event lt6911uxe_ev_source_change = {
>>>> +	.type = V4L2_EVENT_SOURCE_CHANGE,
>>>> +	.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
>>>> +};
>>>> +
>>>> +static const struct v4l2_event lt6911uxe_ev_stream_end = {
>>>> +	.type = V4L2_EVENT_EOS,
>>>> +};
>>>> +
>>>> +static inline struct lt6911uxe *to_lt6911uxe(struct v4l2_subdev *sd)
>>>> +{
>>>> +	return container_of(sd, struct lt6911uxe, sd);
>>>> +}
>>>> +
>>>> +static const struct lt6911uxe_mode default_mode = {
>>>> +	.width = LT6911UXE_DEFAULT_WIDTH,
>>>> +	.height = LT6911UXE_DEFAULT_HEIGHT,
>>>> +	.code = MEDIA_BUS_FMT_UYVY8_1X16,
>>>> +	.fps = LT6911UXE_DEFAULT_FPS,
>>>> +	.lanes = LT6911UXE_DEFAULT_LANES,
>>>> +	.link_freq = LT6911UXE_MAX_LINK_FREQ,
>>>> +};
>>>> +
>>>> +static s64 get_pixel_rate(struct lt6911uxe *lt6911uxe)
>>>> +{
>>>> +	s64 pixel_rate;
>>>> +
>>>> +	pixel_rate = (s64)lt6911uxe->cur_mode.width *
>>>> +		     lt6911uxe->cur_mode.height *
>>>> +		     lt6911uxe->cur_mode.fps * 16;
>>>> +	do_div(pixel_rate, lt6911uxe->cur_mode.lanes);
>>>> +
>>>> +	return pixel_rate;
>>>> +}
>>>> +
>>>> +static int lt6911uxe_status_update(struct lt6911uxe *lt6911uxe)
>>>> +{
>>>> +	struct i2c_client *client = v4l2_get_subdevdata(&lt6911uxe->sd);
>>>> +	u64 int_event;
>>>> +	u64 byte_clk, pixel_clk, fps, format;
>>>> +	u64 htotal, vtotal, half_width, height;
>>>> +	int ret = 0;
>>>> +
>>>> +	/* Read interrupt event */
>>>> +	cci_read(lt6911uxe->regmap, REG_INT_HDMI, &int_event, &ret);
>>>> +	if (ret)
>>>> +		return dev_err_probe(&client->dev, ret,
>>>> +				     "failed to read interrupt event\n");
>>>> +
>>>> +	switch (int_event) {
>>>> +	case INT_VIDEO_READY:
>>>> +		cci_read(lt6911uxe->regmap, REG_BYTE_CLK, &byte_clk, &ret);
>>>> +		byte_clk *= 1000;
>>>> +		cci_read(lt6911uxe->regmap, REG_PIX_CLK, &pixel_clk, &ret);
>>>> +		pixel_clk *= 1000;
>>>> +
>>>> +		if (ret || byte_clk == 0 || pixel_clk == 0) {
>>>> +			dev_err(&client->dev,
>>>> +				"invalid ByteClock or PixelClock\n");
>>>> +			return -EINVAL;
>>>> +		}
>>>> +
>>>> +		cci_read(lt6911uxe->regmap, REG_H_TOTAL, &htotal, &ret);
>>>> +		cci_read(lt6911uxe->regmap, REG_V_TOTAL, &vtotal, &ret);
>>>> +		if (ret || htotal == 0 || vtotal == 0) {
>>>> +			dev_err(&client->dev, "invalid htotal or vtotal\n");
>>>> +			return -EINVAL;
>>>> +		}
>>>> +
>>>> +		fps = div_u64(pixel_clk, htotal * vtotal);
>>>> +		if (fps > 60) {
>>>> +			dev_err(&client->dev,
>>>> +				"max fps is 60, current fps: %llu\n", fps);
>>>> +			return -EINVAL;
>>>> +		}
>>>> +
>>>> +		cci_read(lt6911uxe->regmap, REG_HALF_H_ACTIVE,
>>>> +			 &half_width, &ret);
>>>> +		cci_read(lt6911uxe->regmap, REG_V_ACTIVE, &height, &ret);
>>>> +		if (ret || half_width == 0 || half_width * 2 > 3840 ||
>>>> +		    height == 0 || height > 2160) {
>>>> +			dev_err(&client->dev, "invalid width or height\n");
>>>> +			return -EINVAL;
>>>> +		}
>>>> +
>>>> +		/*
>>>> +		 * Get MIPI format, YUV422_8_BIT is expected in lt6911uxe
>>>> +		 */
>>>> +		cci_read(lt6911uxe->regmap, REG_MIPI_FORMAT, &format, &ret);
>>>> +		if (format != YUV422_8_BIT) {
>>>> +			dev_err(&client->dev, "invalid MIPI format\n");
>>>> +			return -EINVAL;
>>>> +		}
>>>> +
>>>> +		lt6911uxe->cur_mode.height = height;
>>>> +		lt6911uxe->cur_mode.width = half_width * 2;
>>>> +		lt6911uxe->cur_mode.fps = fps;
>>>> +		/* MIPI Clock Rate = ByteClock × 4, defined in lt6911uxe spec */
>>>> +		lt6911uxe->cur_mode.link_freq = byte_clk * 4;
>>>> +		v4l2_subdev_notify_event(&lt6911uxe->sd,
>>>> +					 &lt6911uxe_ev_source_change);
>>>> +		break;
>>>> +
>>>> +	case INT_VIDEO_DISAPPEAR:
>>>> +		cci_write(lt6911uxe->regmap, REG_MIPI_TX_CTRL, 0x0, NULL);
>>>> +		lt6911uxe->cur_mode.height = 0;
>>>> +		lt6911uxe->cur_mode.width = 0;
>>>> +		lt6911uxe->cur_mode.fps = 0;
>>>> +		lt6911uxe->cur_mode.link_freq = 0;
>>>> +		v4l2_subdev_notify_event(&lt6911uxe->sd,
>>>> +					 &lt6911uxe_ev_stream_end);
>>>> +		break;
>>>> +
>>>> +	default:
>>>> +		return  -ENOLINK;
>>>> +	}
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int lt6911uxe_init_controls(struct lt6911uxe *lt6911uxe)
>>>> +{
>>>> +	struct v4l2_ctrl_handler *ctrl_hdlr;
>>>> +	s64 pixel_rate;
>>>> +	int ret;
>>>> +
>>>> +	ctrl_hdlr = &lt6911uxe->ctrl_handler;
>>>> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	lt6911uxe->link_freq = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
>>>> +						 V4L2_CID_CUR_LINK_FREQ, 0,
>>>> +						 LT6911UXE_MAX_LINK_FREQ, 1,
>>>> +						 lt6911uxe->cur_mode.link_freq);
>>>> +
>>>> +	pixel_rate = get_pixel_rate(lt6911uxe);
>>>> +	lt6911uxe->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
>>>> +						  V4L2_CID_PIXEL_RATE,
>>>> +						  pixel_rate, pixel_rate, 1,
>>>> +						  pixel_rate);
>>>> +
>>>> +	if (ctrl_hdlr->error) {
>>>> +		ret = ctrl_hdlr->error;
>>>> +		goto hdlr_free;
>>>> +	}
>>>> +	lt6911uxe->sd.ctrl_handler = ctrl_hdlr;
>>>> +
>>>> +	return 0;
>>>> +
>>>> +hdlr_free:
>>>> +	v4l2_ctrl_handler_free(ctrl_hdlr);
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static void lt6911uxe_update_pad_format(const struct lt6911uxe_mode *mode,
>>>> +					struct v4l2_mbus_framefmt *fmt)
>>>> +{
>>>> +	fmt->width = mode->width;
>>>> +	fmt->height = mode->height;
>>>> +	fmt->code = mode->code;
>>>> +	fmt->field = V4L2_FIELD_NONE;
>>>> +}
>>>> +
>>>> +static int lt6911uxe_enable_streams(struct v4l2_subdev *sd,
>>>> +				    struct v4l2_subdev_state *state,
>>>> +				    u32 pad, u64 streams_mask)
>>>> +{
>>>> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
>>>> +	struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
>>>> +	int ret;
>>>> +
>>>> +	ret = pm_runtime_resume_and_get(&client->dev);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	cci_write(lt6911uxe->regmap, REG_MIPI_TX_CTRL, 0x1, &ret);
>>>> +	if (ret) {
>>>> +		dev_err(&client->dev, "failed to start stream: %d\n", ret);
>>>> +		goto err_rpm_put;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +
>>>> +err_rpm_put:
>>>> +	pm_runtime_put(&client->dev);
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int lt6911uxe_disable_streams(struct v4l2_subdev *sd,
>>>> +				     struct v4l2_subdev_state *state,
>>>> +				     u32 pad, u64 streams_mask)
>>>> +{
>>>> +	struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
>>>> +	struct i2c_client *client = v4l2_get_subdevdata(&lt6911uxe->sd);
>>>> +	int ret;
>>>> +
>>>> +	ret = cci_write(lt6911uxe->regmap, REG_MIPI_TX_CTRL, 0x0, NULL);
>>>> +	if (ret)
>>>> +		dev_err(&client->dev, "failed to stop stream: %d\n", ret);
>>>> +
>>>> +	pm_runtime_put(&client->dev);
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int lt6911uxe_set_format(struct v4l2_subdev *sd,
>>>> +				struct v4l2_subdev_state *sd_state,
>>>> +				struct v4l2_subdev_format *fmt)
>>>> +{
>>>> +	struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
>>>> +	u64 pixel_rate, link_freq;
>>>> +
>>>> +	lt6911uxe_update_pad_format(&lt6911uxe->cur_mode, &fmt->format);
>>>> +	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
>>>> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
>>>> +		return 0;
>>>> +
>>>> +	pixel_rate = get_pixel_rate(lt6911uxe);
>>>> +	__v4l2_ctrl_modify_range(lt6911uxe->pixel_rate, pixel_rate,
>>>> +				 pixel_rate, 1, pixel_rate);
>>>> +
>>>> +	link_freq = lt6911uxe->cur_mode.link_freq;
>>>> +	__v4l2_ctrl_modify_range(lt6911uxe->link_freq, link_freq,
>>>> +				 link_freq, 1, link_freq);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int lt6911uxe_enum_mbus_code(struct v4l2_subdev *sd,
>>>> +				    struct v4l2_subdev_state *sd_state,
>>>> +				    struct v4l2_subdev_mbus_code_enum *code)
>>>> +{
>>>> +	struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
>>>> +
>>>> +	if (code->index)
>>>> +		return -EINVAL;
>>>> +
>>>> +	code->code = lt6911uxe->cur_mode.code;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int lt6911uxe_enum_frame_size(struct v4l2_subdev *sd,
>>>> +				     struct v4l2_subdev_state *sd_state,
>>>> +				     struct v4l2_subdev_frame_size_enum *fse)
>>>> +{
>>>> +	struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
>>>> +
>>>> +	if (fse->index != 0)
>>>> +		return -EINVAL;
>>>> +
>>>> +	if (fse->code != MEDIA_BUS_FMT_UYVY8_1X16)
>>>> +		return -EINVAL;
>>>> +
>>>> +	fse->min_width = lt6911uxe->cur_mode.width;
>>>> +	fse->max_width = fse->min_width;
>>>> +	fse->min_height = lt6911uxe->cur_mode.height;
>>>> +	fse->max_height = fse->min_height;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int lt6911uxe_enum_frame_interval(struct v4l2_subdev *sd,
>>>> +		struct v4l2_subdev_state *sd_state,
>>>> +		struct v4l2_subdev_frame_interval_enum *fie)
>>>> +{
>>>> +	struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
>>>> +
>>>> +	if (fie->index != 0)
>>>> +		return -EINVAL;
>>>> +
>>>> +	fie->interval.numerator = 1;
>>>> +	fie->interval.denominator = lt6911uxe->cur_mode.fps;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int lt6911uxe_init_state(struct v4l2_subdev *sd,
>>>> +				struct v4l2_subdev_state *sd_state)
>>>> +{
>>>> +	struct v4l2_subdev_format fmt = {
>>>> +		.which = V4L2_SUBDEV_FORMAT_TRY,
>>>> +		.pad = 0,
>>>> +		.format = {
>>>> +			.code = MEDIA_BUS_FMT_UYVY8_1X16,
>>>> +			.width = LT6911UXE_DEFAULT_WIDTH,
>>>> +			.height = LT6911UXE_DEFAULT_HEIGHT,
>>>> +		},
>>>> +	};
>>>> +
>>>> +	return lt6911uxe_set_format(sd, sd_state, &fmt);
>>>> +}
>>>> +
>>>> +static const struct v4l2_subdev_video_ops lt6911uxe_video_ops = {
>>>> +	.s_stream = v4l2_subdev_s_stream_helper,
>>>> +};
>>>> +
>>>> +static const struct v4l2_subdev_pad_ops lt6911uxe_pad_ops = {
>>>> +	.set_fmt = lt6911uxe_set_format,
>>>> +	.get_fmt = v4l2_subdev_get_fmt,
>>>> +	.enable_streams = lt6911uxe_enable_streams,
>>>> +	.disable_streams = lt6911uxe_disable_streams,
>>>> +	.enum_mbus_code = lt6911uxe_enum_mbus_code,
>>>> +	.enum_frame_size = lt6911uxe_enum_frame_size,
>>>> +	.enum_frame_interval = lt6911uxe_enum_frame_interval,
>>>> +};
>>>> +
>>>> +static const struct v4l2_subdev_core_ops lt6911uxe_subdev_core_ops = {
>>>> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
>>>> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
>>>> +};
>>>> +
>>>> +static const struct v4l2_subdev_ops lt6911uxe_subdev_ops = {
>>>> +	.core = &lt6911uxe_subdev_core_ops,
>>>> +	.video = &lt6911uxe_video_ops,
>>>> +	.pad = &lt6911uxe_pad_ops,
>>>> +};
>>>> +
>>>> +static const struct media_entity_operations lt6911uxe_subdev_entity_ops = {
>>>> +	.link_validate = v4l2_subdev_link_validate,
>>>> +};
>>>> +
>>>> +static const struct v4l2_subdev_internal_ops lt6911uxe_internal_ops = {
>>>> +	.init_state = lt6911uxe_init_state,
>>>> +};
>>>> +
>>>> +static int lt6911uxe_fwnode_parse(struct lt6911uxe *lt6911uxe,
>>>> +				  struct device *dev)
>>>> +{
>>>> +	struct fwnode_handle *endpoint;
>>>> +	struct v4l2_fwnode_endpoint bus_cfg = {
>>>> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
>>>> +	};
>>>> +	int ret;
>>>> +
>>>> +	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
>>>> +						   FWNODE_GRAPH_ENDPOINT_NEXT);
>>>> +	if (!endpoint)
>>>> +		return dev_err_probe(dev, -EPROBE_DEFER,
>>>> +				     "endpoint node not found\n");
>>>> +
>>>> +	ret = v4l2_fwnode_endpoint_parse(endpoint, &bus_cfg);
>>>> +	fwnode_handle_put(endpoint);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "failed to parse endpoint node: %d\n", ret);
>>>> +		goto out_err;
>>>> +	}
>>>> +
>>>> +	/*
>>>> +	 * Check the number of MIPI CSI2 data lanes,
>>>> +	 * lt6911uxe only support 4 lanes.
>>>> +	 */
>>>> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != LT6911UXE_DEFAULT_LANES) {
>>>> +		dev_err(dev, "only 4 data lanes are currently supported\n");
>>>> +		goto out_err;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +
>>>> +out_err:
>>>> +	v4l2_fwnode_endpoint_free(&bus_cfg);
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int lt6911uxe_identify_module(struct lt6911uxe *lt6911uxe,
>>>> +				     struct device *dev)
>>>> +{
>>>> +	u64 val;
>>>> +	int ret = 0;
>>>> +
>>>> +	/* Chip ID should be confirmed when the I2C slave is active */
>>>> +	cci_write(lt6911uxe->regmap, REG_ENABLE_I2C, 0x1, &ret);
>>>> +	cci_read(lt6911uxe->regmap, REG_CHIP_ID, &val, &ret);
>>>> +	cci_write(lt6911uxe->regmap, REG_ENABLE_I2C, 0x0, &ret);
>>>> +	if (ret)
>>>> +		return dev_err_probe(dev, ret, "fail to read chip id\n");
>>>> +
>>>> +	if (val != LT6911UXE_CHIP_ID) {
>>>> +		return dev_err_probe(dev, -ENXIO, "chip id mismatch: %x!=%x\n",
>>>> +				     LT6911UXE_CHIP_ID, (u16)val);
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static irqreturn_t lt6911uxe_threaded_irq_fn(int irq, void *dev_id)
>>>> +{
>>>> +	struct v4l2_subdev *sd = dev_id;
>>>> +	struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
>>>> +	struct v4l2_subdev_state *state;
>>>> +
>>>> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>>>> +	lt6911uxe_status_update(lt6911uxe);
>>>> +	v4l2_subdev_unlock_state(state);
>>>> +
>>>> +	return IRQ_HANDLED;
>>>> +}
>>>> +
>>>> +static void lt6911uxe_remove(struct i2c_client *client)
>>>> +{
>>>> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>>>> +	struct lt6911uxe *lt6911uxe = to_lt6911uxe(sd);
>>>> +
>>>> +	free_irq(gpiod_to_irq(lt6911uxe->irq_gpio), lt6911uxe);
>>>> +	v4l2_async_unregister_subdev(sd);
>>>> +	v4l2_subdev_cleanup(sd);
>>>> +	media_entity_cleanup(&sd->entity);
>>>> +	v4l2_ctrl_handler_free(&lt6911uxe->ctrl_handler);
>>>> +	pm_runtime_disable(&client->dev);
>>>> +	pm_runtime_set_suspended(&client->dev);
>>>> +}
>>>> +
>>>> +static int lt6911uxe_probe(struct i2c_client *client)
>>>> +{
>>>> +	struct lt6911uxe *lt6911uxe;
>>>> +	struct device *dev = &client->dev;
>>>> +	u64 irq_pin_flags;
>>>> +	int ret;
>>>> +
>>>> +	lt6911uxe = devm_kzalloc(dev, sizeof(*lt6911uxe), GFP_KERNEL);
>>>> +	if (!lt6911uxe)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	/* define default mode: 4k@60fps, changed when interrupt occurs. */
>>>> +	lt6911uxe->cur_mode = default_mode;
>>>> +
>>>> +	lt6911uxe->regmap = devm_regmap_init_i2c(client,
>>>> +						 &lt9611uxe_regmap_config);
>>>> +	if (IS_ERR(lt6911uxe->regmap))
>>>> +		return dev_err_probe(dev, PTR_ERR(lt6911uxe->regmap),
>>>> +				     "failed to init CCI\n");
>>>> +
>>>> +	v4l2_i2c_subdev_init(&lt6911uxe->sd, client, &lt6911uxe_subdev_ops);
>>>> +
>>>> +	lt6911uxe->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_IN);
>>>> +	if (IS_ERR(lt6911uxe->reset_gpio))
>>>> +		return dev_err_probe(dev, PTR_ERR(lt6911uxe->reset_gpio),
>>>> +				     "failed to get reset gpio\n");
>>>> +
>>>> +	lt6911uxe->irq_gpio = devm_gpiod_get(dev, "readystat", GPIOD_IN);
>>>> +	if (IS_ERR(lt6911uxe->irq_gpio))
>>>> +		return dev_err_probe(dev, PTR_ERR(lt6911uxe->irq_gpio),
>>>> +				     "failed to get ready_stat gpio\n");
>>>> +
>>>> +	ret = lt6911uxe_fwnode_parse(lt6911uxe, dev);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	usleep_range(10000, 10500);
>>>> +
>>>> +	ret = lt6911uxe_identify_module(lt6911uxe, dev);
>>>> +	if (ret)
>>>> +		return dev_err_probe(dev, ret, "failed to find chip\n");
>>>> +
>>>> +	ret = lt6911uxe_init_controls(lt6911uxe);
>>>> +	if (ret)
>>>> +		return dev_err_probe(dev, ret, "failed to init control\n");
>>>> +
>>>> +	lt6911uxe->sd.dev = dev;
>>>> +	lt6911uxe->sd.internal_ops = &lt6911uxe_internal_ops;
>>>> +	lt6911uxe->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
>>>> +			       V4L2_SUBDEV_FL_HAS_EVENTS;
>>>> +	lt6911uxe->sd.entity.ops = &lt6911uxe_subdev_entity_ops;
>>>> +	lt6911uxe->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>>>> +	lt6911uxe->pad.flags = MEDIA_PAD_FL_SOURCE;
>>>> +	ret = media_entity_pads_init(&lt6911uxe->sd.entity, 1, &lt6911uxe->pad);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "failed to init entity pads: %d\n", ret);
>>>> +		goto v4l2_ctrl_handler_free;
>>>> +	}
>>>> +
>>>> +	/*
>>>> +	 * Device is already turned on by i2c-core with ACPI domain PM.
>>>> +	 * Enable runtime PM and turn off the device.
>>>> +	 */
>>>> +	pm_runtime_set_active(dev);
>>>> +	pm_runtime_enable(dev);
>>>> +	pm_runtime_idle(dev);
>>>> +
>>>> +	ret = v4l2_subdev_init_finalize(&lt6911uxe->sd);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "failed to init v4l2 subdev: %d\n", ret);
>>>> +		goto media_entity_cleanup;
>>>> +	}
>>>> +
>>>> +	/* Setting irq */
>>>> +	irq_pin_flags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING |
>>>> +			IRQF_ONESHOT;
>>>> +
>>>> +	ret = request_threaded_irq(gpiod_to_irq(lt6911uxe->irq_gpio), NULL,
>>>> +				   lt6911uxe_threaded_irq_fn,
>>>> +				   irq_pin_flags, NULL, lt6911uxe);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "failed to request IRQ: %d\n", ret);
>>>> +		goto subdev_cleanup;
>>>> +	}
>>>> +
>>>> +	ret = v4l2_async_register_subdev_sensor(&lt6911uxe->sd);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "failed to register V4L2 subdev: %d\n", ret);
>>>> +		goto free_irq;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +
>>>> +free_irq:
>>>> +	free_irq(gpiod_to_irq(lt6911uxe->irq_gpio), lt6911uxe);
>>>> +
>>>> +subdev_cleanup:
>>>> +	v4l2_subdev_cleanup(&lt6911uxe->sd);
>>>> +
>>>> +media_entity_cleanup:
>>>> +	pm_runtime_disable(dev);
>>>> +	pm_runtime_set_suspended(dev);
>>>> +	media_entity_cleanup(&lt6911uxe->sd.entity);
>>>> +
>>>> +v4l2_ctrl_handler_free:
>>>> +	v4l2_ctrl_handler_free(lt6911uxe->sd.ctrl_handler);
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static const struct acpi_device_id lt6911uxe_acpi_ids[] = {
>>>> +	{ "INTC10C5" },
>>>> +	{}
>>>> +};
>>>> +MODULE_DEVICE_TABLE(acpi, lt6911uxe_acpi_ids);
>>>> +
>>>> +static struct i2c_driver lt6911uxe_i2c_driver = {
>>>> +	.driver = {
>>>> +		.name = "lt6911uxe",
>>>> +		.acpi_match_table = ACPI_PTR(lt6911uxe_acpi_ids),
>>>> +	},
>>>> +	.probe = lt6911uxe_probe,
>>>> +	.remove = lt6911uxe_remove,
>>>> +};
>>>> +
>>>> +module_i2c_driver(lt6911uxe_i2c_driver);
>>>> +
>>>> +MODULE_AUTHOR("Yan Dongcheng <dongcheng.yan@intel.com>");
>>>> +MODULE_DESCRIPTION("Lontium lt6911uxe HDMI to MIPI Bridge Driver");
>>>> +MODULE_LICENSE("GPL");
>>>>
>>>> base-commit: 2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2
> 
> 


