Return-Path: <linux-media+bounces-14240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F6491A6A7
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 14:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD5D52818FD
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 12:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96B915ECE1;
	Thu, 27 Jun 2024 12:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="M+9QvEUz"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AAE13DBA8;
	Thu, 27 Jun 2024 12:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719491845; cv=none; b=JafW/yx+aUJc+6Yoy5azHMmnYaMmbz+Bo9oxfyZn3DognLR9+2iZtlwuBLLP24Tvwzms0VeMm3q4CjKF6/SYgFztKXAC4B6v5+2G/cZT170bnQ9TUf7tn5JTKg4rtD0vqcGzxxHyecAtPDHOburZ8HbWW1l0UdiOpJvByFz0E5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719491845; c=relaxed/simple;
	bh=eLk8XlJiOIs4iz0E86fFMw9/CBQ5HhjgLZ3eZ42Zjsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cis5aW4iM8wdRVhhx4nHoNoJybK/soa3ASWQFVaEEL/f2UG+jfZzi0crJWjbNlP1DW/qY46BpzoA+pOZPpX4RDLEFRs/34+S7BTsMmyRLRWfTEe4B6BgpJj21UJlL8X2QkjFfEK9GaIokC/OiedfuDe0qr2z1axWVOh8Il4u0jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=M+9QvEUz; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719491841;
	bh=eLk8XlJiOIs4iz0E86fFMw9/CBQ5HhjgLZ3eZ42Zjsg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M+9QvEUzLncpybrAFcnNov9UZdsUEsb+28TFPRJrfaEJWgqJlr0luG0uIRRB3/I7a
	 krX+ixKhyoXwap2tMnXpMC/3lLLgYk6U3OwUfAIx6YoCtLUgdWIIDtp/20sQdCVXRz
	 0T8X1mey/rzToarSxUJeg5v8nrP805icvNYZkKpCpCYGws+Wx77SqJFx39Vyf9tFNJ
	 6x+ZqJ7c32gdquQOS/zLWz5OQo0waPl3zghVHlzJdWej6fuNBmPljqSuQnNX7/XI1H
	 0mQTRTBptoAqKzesnkiaipLf+XI5OrETbQriVjTahHY+2zsHaJFjIoUjvuys5Z1T4I
	 LpNQUwmA+56ig==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 331DD37804D4;
	Thu, 27 Jun 2024 12:37:21 +0000 (UTC)
Message-ID: <2d1327fb-7301-4e8d-9ea2-07fd6c6420c3@collabora.com>
Date: Thu, 27 Jun 2024 14:37:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] media: i2c: max96717: add test pattern ctrl
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linuxfancy@googlegroups.com, sakari.ailus@linux.intel.com,
 laurent.pinchart@ideasonboard.com, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240617145958.1819069-1-tomm.merciai@gmail.com>
 <20240617145958.1819069-2-tomm.merciai@gmail.com>
 <94d58f00-ef6a-4454-b028-bc3b7dcd927d@collabora.com>
 <Znr+2WZv8rUKNiZ+@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <ZnvTQ2BwTHVJvh6o@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Content-Language: en-US
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <ZnvTQ2BwTHVJvh6o@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tommaso,

On 6/26/24 10:37 AM, Tommaso Merciai wrote:
> On Tue, Jun 25, 2024 at 07:31:05PM +0200, Tommaso Merciai wrote:
>> On Tue, Jun 25, 2024 at 09:54:18AM +0200, Julien Massot wrote:
>>
>> Hi Julien,
>>
>>> Hi Tommaso,
>>>
>>> Thanks for your patch.
>>>
>>> I tested it on my setup and can capture frames. Here's a link to an example:
>>> https://pasteboard.co/j8yHuE4YdYDV.jpg.
>>
>> Nice! Thanks for sharing and testing.
>>
>>>
>>> I had some trouble with link validation because my sensor doesn't support
>>> the RGB format. Once we have internal pad support, we won't need to worry
>>> about the serializer creating an incompatible video stream for the sensor.
>>>
>>> In the future, it would be great if we could support the serializer without
>>> needing a connected sensor. This way, we can use it as a pattern generator
>>> with this patch. However, not all GMSL2 serializers work this way. For
>>> example, the MAX9295A can't generate an internal PCLK and relies on the
>>> sensor to provide the video stream.
>>
>> Fully agree.
>>
>>>
>>> Overall, this patch is very useful as it lets us receive a pattern from the
>>> serializer, which helps validate the GMSL2 connection.
>>>
>>> It also handles issues related to generator timing, bits per pixel (bpp),
>>> and tunnel mode that users might encounter.
>>
>> Fully agree, in my case enabling this test pattern help me a lot on
>> validating the gmsl2 pipe.
>>
>>>
>>> On 6/17/24 4:59 PM, Tommaso Merciai wrote:
>>>> Add v4l2 test pattern control.
>>>>
>>>> Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
>>>> ---
>>>>    drivers/media/i2c/max96717.c | 210 ++++++++++++++++++++++++++++++++---
>>>>    1 file changed, 194 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
>>>> index 949306485873..c263bbca7318 100644
>>>> --- a/drivers/media/i2c/max96717.c
>>>> +++ b/drivers/media/i2c/max96717.c
>>>> @@ -16,6 +16,7 @@
>>>>    #include <linux/regmap.h>
>>>>    #include <media/v4l2-cci.h>
>>>> +#include <media/v4l2-ctrls.h>
>>>>    #include <media/v4l2-fwnode.h>
>>>>    #include <media/v4l2-subdev.h>
>>>> @@ -36,11 +37,37 @@
>>>>    #define MAX96717_DEV_ID  CCI_REG8(0xd)
>>>>    #define MAX96717_DEV_REV CCI_REG8(0xe)
>>>>    #define MAX96717_DEV_REV_MASK GENMASK(3, 0)
>>>> +#define MAX96717_IO_CHK0 CCI_REG8(0x24f)
>>> In MAX96717 datasheet this register is named VTX1.
>>> Can you also move these definitions to the VTX section?
>>>> +#define MAX96717_PATTERN_CLK_FREQ GENMASK(3, 1)
>>>>    /* VID_TX Z */
>>>> +#define MAX96717_VIDEO_TX0 CCI_REG8(0x110)
>>>> +#define MAX96717_VIDEO_AUTO_BPP BIT(3)
>>>>    #define MAX96717_VIDEO_TX2 CCI_REG8(0x112)
>>>>    #define MAX96717_VIDEO_PCLKDET BIT(7)
>>>> +/* VRX_PATGEN_0 */
>>> For serializer these registers are named VTX_Z instead of VRX.
>>>
>>>> +#define MAX96717_PATGEN_0              CCI_REG8(0x24e)
>>> #define MAX96717_VTX_0              CCI_REG8(0x24e)
>>>> +#define MAX96717_PATGEN_1              CCI_REG8(0x26b)
>>> Can you keep this define ordered by address?
>>>> +#define MAX96717_PATGEN_MODE           GENMASK(1, 0)
>>>> +#define MAX96717_PATGEN_VS_DLY         CCI_REG24(0x250)
>>> #define MAX96717_VTX_VS_DLY
>>>> +#define MAX96717_PATGEN_VS_HIGH        CCI_REG24(0x253)
>>>> +#define MAX96717_PATGEN_VS_LOW         CCI_REG24(0x256)
>>>> +#define MAX96717_PATGEN_V2H            CCI_REG24(0x259)
>>>> +#define MAX96717_PATGEN_HS_HIGH        CCI_REG16(0x25c)
>>>> +#define MAX96717_PATGEN_HS_LOW         CCI_REG16(0x25e)
>>>> +#define MAX96717_PATGEN_HS_CNT         CCI_REG16(0x260)
>>>> +#define MAX96717_PATGEN_V2D            CCI_REG24(0x262)
>>>> +#define MAX96717_PATGEN_DE_HIGH        CCI_REG16(0x265)
>>>> +#define MAX96717_PATGEN_DE_LOW         CCI_REG16(0x267)
>>>> +#define MAX96717_PATGEN_DE_CNT         CCI_REG16(0x269)
>>>> +#define MAX96717_PATGEN_GRAD_INC       CCI_REG8(0x26c)
>>>> +#define MAX96717_PATGEN_CHKB_COLOR_A   CCI_REG24(0x26d)
>>>> +#define MAX96717_PATGEN_CHKB_COLOR_B   CCI_REG24(0x270)
>>>> +#define MAX96717_PATGEN_CHKB_RPT_CNT_A CCI_REG8(0x273)
>>>> +#define MAX96717_PATGEN_CHKB_RPT_CNT_B CCI_REG8(0x274)
>>>> +#define MAX96717_PATGEN_CHKB_ALT       CCI_REG8(0x275)
>>>> +
>>
>> So your plan is to move all this stuff here:
>>
>>
>> /* VTX_Z */
>> #define MAX96717_VTX0                  CCI_REG8(0x24e)
>> #define MAX96717_VTX1                  CCI_REG8(0x24f)
>> #define MAX96717_PATTERN_CLK_FREQ      GENMASK(3, 1)
>> #define MAX96717_VTX_VS_DLY            CCI_REG24(0x250)
>> #define MAX96717_VTX_VS_HIGH           CCI_REG24(0x253)
>> #define MAX96717_VTX_VS_LOW            CCI_REG24(0x256)
>> #define MAX96717_VTX_V2H               CCI_REG24(0x259)
>> #define MAX96717_VTX_HS_HIGH           CCI_REG16(0x25c)
>> #define MAX96717_VTX_HS_LOW            CCI_REG16(0x25e)
>> #define MAX96717_VTX_HS_CNT            CCI_REG16(0x260)
>> #define MAX96717_VTX_V2D               CCI_REG24(0x262)
>> #define MAX96717_VTX_DE_HIGH           CCI_REG16(0x265)
>> #define MAX96717_VTX_DE_LOW            CCI_REG16(0x267)
>> #define MAX96717_VTX_DE_CNT            CCI_REG16(0x269)
>> #define MAX96717_VTX29                 CCI_REG8(0x26b)
>> #define MAX96717_VTX_MODE              GENMASK(1, 0)
>> #define MAX96717_VTX_GRAD_INC          CCI_REG8(0x26c)
>> #define MAX96717_VTX_CHKB_COLOR_A      CCI_REG24(0x26d)
>> #define MAX96717_VTX_CHKB_COLOR_B      CCI_REG24(0x270)
>> #define MAX96717_VTX_CHKB_RPT_CNT_A    CCI_REG8(0x273)
>> #define MAX96717_VTX_CHKB_RPT_CNT_B    CCI_REG8(0x274)
>> #define MAX96717_VTX_CHKB_ALT          CCI_REG8(0x275)
>>
>> In a fixed order right? :-)
Yes sounds good to me
>>
>>
>>
>>>>    /* GPIO */
>>>>    #define MAX96717_NUM_GPIO         11
>>>>    #define MAX96717_GPIO_REG_A(gpio) CCI_REG8(0x2be + (gpio) * 3)
>>>> @@ -82,6 +109,12 @@
>>>>    /* MISC */
>>>>    #define PIO_SLEW_1 CCI_REG8(0x570)
>>>> +enum max96717_vpg_mode {
>>>> +	MAX96717_VPG_DISABLED = 0,
>>>> +	MAX96717_VPG_CHECKERBOARD = 1,
>>>> +	MAX96717_VPG_GRADIENT = 2,
>>>> +};
>>>> +
>>>>    struct max96717_priv {
>>>>    	struct i2c_client		  *client;
>>>>    	struct regmap			  *regmap;
>>>> @@ -89,6 +122,7 @@ struct max96717_priv {
>>>>    	struct v4l2_mbus_config_mipi_csi2 mipi_csi2;
>>>>    	struct v4l2_subdev                sd;
>>>>    	struct media_pad                  pads[MAX96717_PORTS];
>>>> +	struct v4l2_ctrl_handler          ctrl_handler;
>>>>    	struct v4l2_async_notifier        notifier;
>>>>    	struct v4l2_subdev                *source_sd;
>>>>    	u16                               source_sd_pad;
>>>> @@ -96,6 +130,7 @@ struct max96717_priv {
>>>>    	u8                                pll_predef_index;
>>>>    	struct clk_hw                     clk_hw;
>>>>    	struct gpio_chip                  gpio_chip;
>>>> +	enum max96717_vpg_mode            pattern;
>>>>    };
>>>>    static inline struct max96717_priv *sd_to_max96717(struct v4l2_subdev *sd)
>>>> @@ -131,6 +166,115 @@ static inline int max96717_start_csi(struct max96717_priv *priv, bool start)
>>>>    			       start ? MAX96717_START_PORT_B : 0, NULL);
>>>>    }
>>>> +static int max96717_apply_patgen_timing(struct max96717_priv *priv,
>>>> +					struct v4l2_subdev_state *state)
>>>> +{
>>>> +	struct v4l2_mbus_framefmt *fmt =
>>>> +		v4l2_subdev_state_get_format(state, MAX96717_PAD_SOURCE);
>>>> +	const u32 h_active = fmt->width;
>>>> +	const u32 h_fp = 88;
>>>> +	const u32 h_sw = 44;
>>>> +	const u32 h_bp = 148;
>>>> +	u32 h_tot;
>>>> +	const u32 v_active = fmt->height;
>>>> +	const u32 v_fp = 4;
>>>> +	const u32 v_sw = 5;
>>>> +	const u32 v_bp = 36;
>>>> +	u32 v_tot;
>>>> +	int ret = 0;
>>>> +
>>>> +	h_tot = h_active + h_fp + h_sw + h_bp;
>>>> +	v_tot = v_active + v_fp + v_sw + v_bp;
>>>> +
>>>> +	/* 75 Mhz pixel clock */
>>>> +	cci_update_bits(priv->regmap, MAX96717_IO_CHK0,
>>>> +			MAX96717_PATTERN_CLK_FREQ, 0xa, &ret);
>>>> +
>>>> +	dev_info(&priv->client->dev, "height: %d width: %d\n", fmt->height,
>>>> +		 fmt->width);
>>>> +
>>>> +	cci_write(priv->regmap, MAX96717_PATGEN_VS_DLY, 0, &ret);
>>>> +	cci_write(priv->regmap, MAX96717_PATGEN_VS_HIGH, v_sw * h_tot, &ret);
>>>> +	cci_write(priv->regmap, MAX96717_PATGEN_VS_LOW,
>>>> +		  (v_active + v_fp + v_bp) * h_tot, &ret);
>>>> +	cci_write(priv->regmap, MAX96717_PATGEN_HS_HIGH, h_sw, &ret);
>>>> +	cci_write(priv->regmap, MAX96717_PATGEN_HS_LOW, h_active + h_fp + h_bp,
>>>> +		  &ret);
>>>> +	cci_write(priv->regmap, MAX96717_PATGEN_V2D,
>>>> +		  h_tot * (v_sw + v_bp) + (h_sw + h_bp), &ret);
>>>> +	cci_write(priv->regmap, MAX96717_PATGEN_HS_CNT, v_tot, &ret);
>>>> +	cci_write(priv->regmap, MAX96717_PATGEN_DE_HIGH, h_active, &ret);
>>>> +	cci_write(priv->regmap, MAX96717_PATGEN_DE_LOW, h_fp + h_sw + h_bp,
>>>> +		  &ret);
>>>> +	cci_write(priv->regmap, MAX96717_PATGEN_DE_CNT, v_active, &ret);
>>>> +	/* B G R */
>>>> +	cci_write(priv->regmap, MAX96717_PATGEN_CHKB_COLOR_A, 0xfecc00, &ret);
>>>> +	/* B G R */
>>>> +	cci_write(priv->regmap, MAX96717_PATGEN_CHKB_COLOR_B, 0x006aa7, &ret);
>>>> +	cci_write(priv->regmap, MAX96717_PATGEN_CHKB_RPT_CNT_A, 0x3c, &ret);
>>>> +	cci_write(priv->regmap, MAX96717_PATGEN_CHKB_RPT_CNT_B, 0x3c, &ret);
>>>> +	cci_write(priv->regmap, MAX96717_PATGEN_CHKB_ALT, 0x3c, &ret);
>>>> +	cci_write(priv->regmap, MAX96717_PATGEN_GRAD_INC, 0x10, &ret);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int max96717_apply_patgen(struct max96717_priv *priv,
>>>> +				 struct v4l2_subdev_state *state)
>>>> +{
>>>> +	unsigned int val;
>>>> +	int ret = 0;
>>>> +
>>>> +	if (priv->pattern)
>>>> +		ret = max96717_apply_patgen_timing(priv, state);
>>>> +
>>>> +	cci_write(priv->regmap, MAX96717_PATGEN_0, priv->pattern ? 0xfb : 0,
>>>> +		  &ret);
>>>> +
>>>> +	val = FIELD_PREP(MAX96717_PATGEN_MODE, priv->pattern);
>>>> +	cci_update_bits(priv->regmap, MAX96717_PATGEN_1, MAX96717_PATGEN_MODE,
>>>> +			val, &ret);
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int max96717_s_ctrl(struct v4l2_ctrl *ctrl)
>>>> +{
>>>> +	struct max96717_priv *priv =
>>>> +		container_of(ctrl->handler, struct max96717_priv, ctrl_handler);
>>>> +	int ret;
>>>> +
>>>> +	switch (ctrl->id) {
>>>> +	case V4L2_CID_TEST_PATTERN:
>>>> +		if (priv->enabled_source_streams)
>>>> +			return -EBUSY;
>>>> +		priv->pattern = ctrl->val;
>>>> +		break;
>>>> +	default:
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	/* Use bpp from bpp register */
>>>> +	ret = cci_update_bits(priv->regmap, MAX96717_VIDEO_TX0,
>>>> +			      MAX96717_VIDEO_AUTO_BPP,
>>>> +			      priv->pattern ? 0 : MAX96717_VIDEO_AUTO_BPP,
>>>> +			      NULL);
>>>> +
>>>> +	/* Pattern generator doesn't work with tunnel mode */
>>> Can you add a comment saying that the deserializer should manage the link in
>>> pixel mode as well.
>>
>> Something like:
>> 	/* Pattern generator doesn't work with tunnel mode.
>> 	   Is mandatory to put also the deserializer into pixel mode.
>>          */
> 
> Actually I plan to add to add the following comment:
> 
> 	/*
> 	 * Pattern generator doesn't work with tunnel mode.
> 	 * Needs RGB color format and deserializer tunnel mode must be disabled.
> 	 */
> 	return cci_update_bits(priv->regmap, MAX96717_MIPI_RX_EXT11,
> 			       MAX96717_TUN_MODE,
> 			       priv->pattern ? 0 : MAX96717_TUN_MODE, &ret);
> 
> Let me know if this can be ok for you.
Yes perfect

Regards,

-- 
Julien

