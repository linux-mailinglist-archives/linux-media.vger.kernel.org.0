Return-Path: <linux-media+bounces-49734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19709CE9D09
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 14:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FF773021FA9
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 13:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4448523EAA0;
	Tue, 30 Dec 2025 13:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FYnlxltm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9856D4594A;
	Tue, 30 Dec 2025 13:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767102577; cv=none; b=dceSpLFcPzIMSvbUMBEswk1GgroohDhQ53GZOWiPVjTLaPC+dfOANDjG3aBThwys+MgKcPI0HJ16GO3MvSg7ufSN+QSd9F2o9jxZMMEqxOq3gg/h79soUVnec9wb0P5Nuh06EgEl0vJlCTBSaRoeDLVShG6Hgl8jBPtwZj9us6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767102577; c=relaxed/simple;
	bh=BMKckrcJbKgUB3ATuX/quQBrW8laOEYXTE5aHAQjjEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YpR4AHY6jA3uWy5VerUlDsiXI5ng/UUbGkHwPPcWAnJqyWZZFzm0aq7ipd/P5FP9jIeybZPauj6HlPriR1CMphRQOCOUJjY9bt4PSau8MBU/CATycrPUOGYG0IiV7Lu5xYLXXxR9r/ugEjhHHYeAxLSh+udayxqedO768eEL/1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FYnlxltm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B60C4CEFB;
	Tue, 30 Dec 2025 13:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767102577;
	bh=BMKckrcJbKgUB3ATuX/quQBrW8laOEYXTE5aHAQjjEY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FYnlxltmcpkwxi34H9EuwqNkHpjYwFVroTW9HN2CHYF4AorIOWwuuQijkYDRph0Fn
	 nFDIz24rrrdFdI0Ygb0iDOekJVoxzRMr7+zYcAo0XJfSObdauZPNLJ/TyLa5z+djh2
	 sGd5g8T1oPhaAsiCjI/1A1E9aQ8fCOSkScXfClnA2LtWhijDnbtrvmVohv/bm4a/KQ
	 +a7WFhWPXELeCOvGuN6RLuGR0COcdnj8MxDKA9rmlYVsT+jKpbwcLG7XYHkV96Y1RA
	 jBsTOkIGvHTJ3VfN3ja2bI/ulskTCH/jzmjdMmPAQcMF4ysByRrEyD7EBQWcbZAVPe
	 rM/4Zthdg1WUg==
Message-ID: <954ecfcb-3d5f-4b65-9d59-4a5bdb067803@kernel.org>
Date: Tue, 30 Dec 2025 14:49:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] media: i2c: ov9282: Fix reset-gpio logical state
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
 dave.stevenson@raspberrypi.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com
References: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
 <20251114133822.434171-2-loic.poulain@oss.qualcomm.com>
 <aRtbwK0Afo50Lh0B@kekkonen.localdomain>
 <CAFEp6-1zoU2cfVU06MoeOtAwMYN+XAxCwc0ebwaQyo78VNBf2Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAFEp6-1zoU2cfVU06MoeOtAwMYN+XAxCwc0ebwaQyo78VNBf2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/12/2025 11:00, Loic Poulain wrote:
> Hi Laurent,
> 
> On Mon, Nov 17, 2025 at 6:30 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
>>
>> Hi Loic,
>>
>> On Fri, Nov 14, 2025 at 02:38:19PM +0100, Loic Poulain wrote:
>>> Ensure reset state is low in the power-on state and high in the
>>> power-off state (assert reset). Note that the polarity is abstracted
>>> by the GPIO subsystem, so the logic level reflects the intended reset
>>> behavior.
>>
>> That's an interesting approach to fix DTS gone systematically wrong.
>>
>> I was thinking of the drivers that have this issue, too, but I would have
>> introduced a new GPIO under a different name (many sensors use "enable",
>> too). Any thoughts?
>>
>> Cc Laurent.
> 
> Do you have any feedback on this change?
> 
>>
>>>
>>> To maintain backward compatibility with DTS files that use an incorrect
>>> flag, we implement a mechanism similar to:
>>>   commit 738455858a2d ("ASoC: codecs: wsa881x: Use proper shutdown GPIO polarity")
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> ---
>>>  drivers/media/i2c/ov9282.c | 26 ++++++++++++++++++++++----
>>>  1 file changed, 22 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
>>> index a9f6176e9729..e79b326cdd94 100644
>>> --- a/drivers/media/i2c/ov9282.c
>>> +++ b/drivers/media/i2c/ov9282.c
>>> @@ -160,6 +160,7 @@ struct ov9282_mode {
>>>   * @sd: V4L2 sub-device
>>>   * @pad: Media pad. Only one pad supported
>>>   * @reset_gpio: Sensor reset gpio
>>> + * @reset_gpio_val: Logical value to reset the sensor
>>>   * @inclk: Sensor input clock
>>>   * @supplies: Regulator supplies for the sensor
>>>   * @ctrl_handler: V4L2 control handler
>>> @@ -180,6 +181,7 @@ struct ov9282 {
>>>       struct v4l2_subdev sd;
>>>       struct media_pad pad;
>>>       struct gpio_desc *reset_gpio;
>>> +     unsigned int reset_gpio_val;
>>>       struct clk *inclk;
>>>       struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];
>>>       struct v4l2_ctrl_handler ctrl_handler;
>>> @@ -1127,13 +1129,29 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
>>>
>>>       /* Request optional reset pin */
>>>       ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
>>> -                                                  GPIOD_OUT_LOW);
>>> +                                                  GPIOD_OUT_HIGH);
>>>       if (IS_ERR(ov9282->reset_gpio)) {
>>>               dev_err(ov9282->dev, "failed to get reset gpio %ld",
>>>                       PTR_ERR(ov9282->reset_gpio));
>>>               return PTR_ERR(ov9282->reset_gpio);
>>>       }
>>>
>>> +     /*
>>> +      * Backwards compatibility work-around.
>>> +      *
>>> +      * The reset GPIO is active-low, but the driver has always used the
>>> +      * gpiod API with inverted logic. As a result, the DTS had to
>>> +      * incorrectly mark the GPIO as active-high to compensate for this
>>> +      * behavior. Changing the flag in the driver now would break backward
>>> +      * compatibility with existing DTS configurations. To address this,
>>> +      * we add a simple value inversion so the driver works with both old
>>> +      * and new DTS.

This obviously is not true - driver will fail to work with some of old DTS.

I am surprised that it is second approach last weeks duplicating the
same problem and claiming the same - the change is backwards compatible,
while it is not - instead of taking my old explanation from WSA drivers
and admit the actual case of broken DTS.

With proper description I could agree, but with incorrect claims - no,
it's wrong.

Best regards,
Krzysztof

