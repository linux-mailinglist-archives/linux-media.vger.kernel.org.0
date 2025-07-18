Return-Path: <linux-media+bounces-38094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA88EB0A7A4
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 17:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 839945A692A
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 15:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9EC2DEA6E;
	Fri, 18 Jul 2025 15:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m6TVGvzd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7E52DE6F4
	for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 15:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852480; cv=none; b=txnnlGo7dpUXcuwpuWV7xcpp1WV+f3cfL0MisIiENWR3RFCsVRVWq30MmOuyrudI7bC4FGCQKjaIfjALqGW24Ej4XAuN64gPLshS28yJTf9Dblkg4ScMERSzG1DW+FD7FfvCXZpdOFP683scE/xx5b7wECnMh8RP9Ddi1kJlhMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852480; c=relaxed/simple;
	bh=lBXJL8FtmF+83xK5G/Bus52DCzmyInlKAMlb1w2HL6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDNaOpsoIm7pRl3s5Gawd+c4EqExjjSjwpk++9HJPklC+fOtLHhrLi54YTUvR6TfRUn4jzCqVcOmd5ir6NsziJY3jEvmn4MAvVpkytDendQxFKBjz4UM76H6UZQ+g6pb2/2DKP+HxAHfIYQjf8kPrdyxNOBsSVt+kMwnHU9AtNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m6TVGvzd; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553cbe3e77dso428235e87.1
        for <linux-media@vger.kernel.org>; Fri, 18 Jul 2025 08:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752852476; x=1753457276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YIj6luTi8nFEawlKnQTcVUB/ZIyVieWLKbKu6ysNOLw=;
        b=m6TVGvzdgvsLR4HJRjqob9yf5UaSS3qq86lEL9E/p+KNOZP2GHkZ2fqaneReB5vhEv
         v2GPl6VuX4NhPWK40Do6DANxnI5dXTZEK4shMWlEOVUgQcyTmS/ykjM20cLpqz+zLYj2
         oC2Hl5M8x0W8SlDcyzcgaI4FYpdnyJ5u7CKwWC6CbsWsM+6dJAOIxC7h/PlkayBZY/Jc
         2JQO4sOFomBhlkcR6ZvJ9tQxFDPit9QYaCeKb39SlcwfvGkRQjicszTEI8OAdBagEQj4
         oz+RieEfj9VI39FVXas7nlhNd97pP4tJ6C115DO5eMisM9Mqupo/GsYS0rGiPUGqWqFl
         jAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852476; x=1753457276;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YIj6luTi8nFEawlKnQTcVUB/ZIyVieWLKbKu6ysNOLw=;
        b=LU4kVXNIF59Q3JehYA14Y/LvThV/yaavAqnmzfsiJhbegMRUS3BPDc0j/01wKPC/h9
         NndaIxGomCkRY1fQmftzA/MYRn7mxO51nTGLMVn1ljAUCDIi+bRbMFCPZZ4d6nt10QtT
         /WpkUz6llhqezMeUulwCa8VhjSQxVQxGdQHMv7Z+gtaIRO22/LWv5p0HgWUjHDWSJQhE
         aLFPB8RD7w5DmQhTFDp4u2C82EywxoOE/Xsjcl72th7uZMUHtP/VcXZCk/v2cR3cusqE
         ad3qADmyHgexgYK022uhxki4zbULWGAjmhXmOk4WDoSGHB+1U9VvtJBUn8LblT8beGdI
         mtdg==
X-Forwarded-Encrypted: i=1; AJvYcCW26uaVZj5YOcgE6fWbFTHVTDaU2Pb/Av8BRPcvQH/Mdh6kJdGB4O7HWgnju3BLcT/plKrPdLOioKZAgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyobqd6ourjN65We6MscS0vtMa/SwUnlw12HX+ass3fRc3KM4iP
	j9jaFBPQmm6uhBhuczirDrC8Rhv4xn2C/NptyZ/Vcxt+/BYsNm2Ww+OuhdMC0z0PCog=
X-Gm-Gg: ASbGncvpK4mxOcrXbhmCOq+hMhsUliXPSI3KlrBblz74Ni653DFTgAJTIT0RppJu8Kk
	Anj4N1zoeSap2YMj3esn1ybM/yNAvTcRDSx3y+0tDG3cqEZ5nI9o2GYMs0bX8kkztjq0QgYJwsO
	Y3iBplA6qRWbow2AKEgkiQznQUjp+Fh/Sqiq6lstELx0AeYsqXuTcq5eZjMBMlgYrPJDPiyPV8R
	L4eVz3BFoH+aIogNwI/5GwNd/aSsSYy5SL95JkgOiAQvoOuFOVIQDSqXjVvF8JBP6U+0DhFu8+C
	x7gj85zmn9UTUm5PMDt7yMhBV+yf6PYbLaxbBG3dfx3DAh/L88VSMRdez92rWEcFSlpT1wEwowp
	IgrbiWVDIRhUZgsHcVvkOjb8e/8aK3k5YYlZPXTveutr0jBjosxiweQDk5SNp3QoWguu2MMpLAF
	ys
X-Google-Smtp-Source: AGHT+IEUSKGYJ6wJ3N02bmIWBUz89ZEswG5MuDdszZXJA7SMeZMFqt8hYT8TS49730bvJ1T7SqbApw==
X-Received: by 2002:a05:651c:510:b0:32c:bc69:e931 with SMTP id 38308e7fff4ca-3308e52c4a7mr14381071fa.9.1752852476394;
        Fri, 18 Jul 2025 08:27:56 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91d994csm2473431fa.84.2025.07.18.08.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 08:27:55 -0700 (PDT)
Message-ID: <7bb16a20-166a-477d-a103-a00fe83ecb66@linaro.org>
Date: Fri, 18 Jul 2025 18:27:54 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: Add OmniVision OV6211 image sensor driver
Content-Language: ru-RU
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250717124001.108486-1-vladimir.zapolskiy@linaro.org>
 <20250717124001.108486-3-vladimir.zapolskiy@linaro.org>
 <175276139540.560048.14744394485094549778@ping.linuxembedded.co.uk>
 <CAPY8ntCiKFFdfepqW0ms_0dhCtJJCwJoT=bxmJ5i0K254i6fkA@mail.gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <CAPY8ntCiKFFdfepqW0ms_0dhCtJJCwJoT=bxmJ5i0K254i6fkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Dave.

On 7/17/25 18:07, Dave Stevenson wrote:
> Hi Vladimir and Kieran
> 
> On Thu, 17 Jul 2025 at 15:10, Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
>>
>> Quoting Vladimir Zapolskiy (2025-07-17 13:40:01)
>>> OmniVision OV6211 is a monochrome image sensor, which produces frames in
>>> 8/10-bit raw output format and supports 400x400, 200x200 and 100x100
>>> output image resolution modes.
>>>
>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> ---

<snip>

>>> +       { 0x3800, 0x00 },
>>> +       { 0x3801, 0x04 },
>>> +       { 0x3802, 0x00 },
>>> +       { 0x3803, 0x04 },
>>> +       { 0x3804, 0x01 },
>>> +       { 0x3805, 0x9b },
>>> +       { 0x3806, 0x01 },
>>> +       { 0x3807, 0x9b },
>>> +       { 0x3808, 0x01 },
>>> +       { 0x3809, 0x90 },
>>
>> 0x190 == 400;
>>
>>> +       { 0x380a, 0x01 },
>>> +       { 0x380b, 0x90 },
>>
>> So I bet these are the width and height registers.
> 
> Almost certainly as that also matches OV7251 and OV9281.
> 0x3800/1 is X_ADDR_START
> 0x3802/3 is Y_ADDR_START
> 0x3804/5 is X_ADDR_END
> 0x3806/7 is Y_ADDR_END
> 0x3808/9 is X_OUTPUT_SIZE
> 0x380a/b is Y_OUTPUT_SIZE.
> Those almost all fit here, although it does imply that it's reading
> (0x019b - 0x0004 + 1 = ) 408 x408 from the array, but only outputting
> 400x400.
> 
>> Have you got a data sheet for this ? It would be /really/ far more
>> helpful to break out the specific register updates here for the mode
>> configuration at least.
>>
>>> +       { 0x380c, 0x05 },
>>> +       { 0x380d, 0xf2 },
>>> +       { 0x380e, 0x01 },
>>> +       { 0x380f, 0xb6 },

<snip>

>>> +};
>>> +
>>> +static const struct ov6211_mode supported_modes[] = {
>>> +       {
>>> +               .width = 400,
>>> +               .height = 400,
>>> +               .hts = 1522,
>>> +               .vts = 438,
> 
> This implies we do have the blanking values, but don't expose them.
> The values don't appear to be used for anything though.
> 

0x380c and 0x380e registers are to set hts/vts, for reference I've
added a human readable representation over here, however the values
are formally unused anywhere in the driver, they could be removed,
or left as is.

>>> +               .reg_list = {
>>> +                       .regs = mode_400x400_regs,
>>> +                       .num_of_regs = ARRAY_SIZE(mode_400x400_regs),
>>> +               },
>>> +       },
>>> +};

<snip>

>>> +static int ov6211_set_ctrl(struct v4l2_ctrl *ctrl)
>>> +{
>>> +       struct ov6211 *ov6211 = container_of(ctrl->handler, struct ov6211,
>>> +                                            ctrl_handler);
>>> +       struct i2c_client *client = v4l2_get_subdevdata(&ov6211->sd);
>>> +       int ret;
>>> +
>>> +       /* V4L2 controls values will be applied only when power is already up */
>>> +       if (!pm_runtime_get_if_in_use(&client->dev))
>>> +               return 0;
>>> +
>>> +       switch (ctrl->id) {
>>> +       case V4L2_CID_ANALOGUE_GAIN:
>>> +               ret = ov6211_write_reg(ov6211, OV6211_REG_ANALOGUE_GAIN,
>>> +                                      OV6211_REG_VALUE_16BIT, ctrl->val);
>>> +               break;
>>> +       case V4L2_CID_EXPOSURE:
>>> +               ret = ov6211_write_reg(ov6211, OV6211_REG_EXPOSURE,
>>> +                                      OV6211_REG_VALUE_24BIT, ctrl->val << 4);
>>> +               break;
>>
>> What about V4L2_CID_HBLANK and V4L2_CID_VBLANK ?
> 
> It's also missing V4L2_CID_PIXEL_RATE, so even with the blanking
> values you can't control frame rate.
> 

The single given sensor configuration setting above sets 120fps.

I may add it with a V4L2_CTRL_FLAG_READ_ONLY control though.

>>> +       default:
>>> +               ret = -EINVAL;
>>> +               break;
>>> +       }
>>> +
>>> +       pm_runtime_put(&client->dev);
>>> +
>>> +       return ret;
>>> +}
>>> +
>>> +static const struct v4l2_ctrl_ops ov6211_ctrl_ops = {
>>> +       .s_ctrl = ov6211_set_ctrl,
>>> +};
>>> +
>>> +static int ov6211_init_controls(struct ov6211 *ov6211)
>>> +{
>>> +       struct v4l2_ctrl_handler *ctrl_hdlr;
>>> +       s64 exposure_max;
>>> +       int ret;
>>> +
>>> +       ctrl_hdlr = &ov6211->ctrl_handler;
>>> +       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 3);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       ctrl_hdlr->lock = &ov6211->mutex;
>>> +
>>> +       ov6211->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov6211_ctrl_ops,
>>> +                                       V4L2_CID_LINK_FREQ,
>>> +                                       ARRAY_SIZE(link_freq_menu_items) - 1,
>>> +                                       0, link_freq_menu_items);
>>> +       if (ov6211->link_freq)
>>> +               ov6211->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>> +
>>> +       v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
>>> +                         OV6211_ANALOGUE_GAIN_MIN, OV6211_ANALOGUE_GAIN_MAX,
>>> +                         OV6211_ANALOGUE_GAIN_STEP,
>>> +                         OV6211_ANALOGUE_GAIN_DEFAULT);
>>> +
>>> +       exposure_max = (ov6211->cur_mode->vts - OV6211_EXPOSURE_MAX_MARGIN);
>>> +       ov6211->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov6211_ctrl_ops,
>>> +                                            V4L2_CID_EXPOSURE,
>>> +                                            OV6211_EXPOSURE_MIN, exposure_max,
>>> +                                            OV6211_EXPOSURE_STEP,
>>> +                                            OV6211_EXPOSURE_DEFAULT);
>>> +
>>
>> As well as the blanking - I think this driver is missing reporting the
>> crop selection implementation to report the sensor crops.
> 
> A call to v4l2_fwnode_device_parse and v4l2_ctrl_new_fwnode_properties
> wouldn't go amiss to provide the standard orientation and rotation
> properties wouldn't go amiss either.
> 

To my knowledge the sensor does not support orientation or rotation
configuration.

>>> +}
>>> +
>>> +static int ov6211_check_hwcfg(struct ov6211 *ov6211)
>>> +{
>>> +       struct i2c_client *client = v4l2_get_subdevdata(&ov6211->sd);
>>> +       struct device *dev = &client->dev;
>>> +       struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
>>> +       struct v4l2_fwnode_endpoint bus_cfg = {
>>> +               .bus_type = V4L2_MBUS_CSI2_DPHY
>>> +       };
>>> +       int ret;
>>> +
>>> +       if (!fwnode)
>>> +               return -ENXIO;
>>> +
>>> +       ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
>>> +       if (!ep)
>>> +               return -ENXIO;
>>> +
>>> +       ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
>>> +       fwnode_handle_put(ep);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       if (bus_cfg.bus.mipi_csi2.num_data_lanes &&
> 
> Is it permitted to omit the data-lanes configuration?
> 

That's a question to linux-media maintainers.

This sensor does not have configurable data-lanes, it's a single lane
sensor, so adding a constant 'data-lanes' property does not help in any
way to describe a hardware wiring, the property becomes a redundant one.

There are some MIPI CSI2 sensors, which does not have 'data-lanes'
property, for instance ovti,ov2680.

<snip>

>>> +
>>> +       ov6211->xvclk = devm_clk_get_optional(&client->dev, NULL);
>>> +       if (IS_ERR(ov6211->xvclk)) {
>>> +               ret = PTR_ERR(ov6211->xvclk);
>>> +               dev_err(&client->dev, "failed to get XVCLK clock: %d\n", ret);
>>> +               return ret;
>>> +       }
>>> +
>>> +       freq = clk_get_rate(ov6211->xvclk);
>>> +       if (freq && freq != OV6211_MCLK_FREQ_24MHZ)
>>> +               return dev_err_probe(&client->dev, -EINVAL,
>>> +                               "XVCLK clock frequency %lu is not supported\n",
>>> +                               freq);
> 
> This would be nicer to make use of the cleanups that have just been
> implemented in
> https://lore.kernel.org/linux-media/cover.1750942967.git.mehdi.djait@linux.intel.com/
> and
> https://lore.kernel.org/linux-media/20250710174808.5361-1-laurent.pinchart@ideasonboard.com/T/
> 

Actually I've already checked it before publishing the code, as a summary:

1. to my understanding the introduced API is still under review, I didn't
find it in media/master or linux-next,

2. the only needed change to get support of the new helper is to replace
the single line of devm_clk_get_optional() with devm_v4l2_sensor_clk_get(),
no more than that,

3. the internal complexity of devm_v4l2_sensor_clk_get() seems excessive
right over here, what's worse I can not test devm_v4l2_sensor_clk_get()
in this driver on any ACPI platform...

To sum up and to minimize the overall complexity, I'd rather prefer to
stick to devm_clk_get_optional() at the moment, the switch to the new
proposed API can be done, when it's ready.

-- 
Best wishes,
Vladimir

