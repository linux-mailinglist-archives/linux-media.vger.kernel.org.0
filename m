Return-Path: <linux-media+bounces-48992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFDECC818E
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 15:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56CFF306C559
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 14:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30DA338E179;
	Wed, 17 Dec 2025 14:02:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from rmisp-mx-out1.tele.net (rmisp-mx-out1.tele.net [194.208.23.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78E3363C61;
	Wed, 17 Dec 2025 14:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.208.23.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765980131; cv=none; b=i6CPAhifMTPdcVGopXdlDL0JKkKXLqouvLHLvBmkR7UO8DJFJsj/XZYInN4u7YPoSnrGC4L1gf2k+RuTL2HRHely92k+EmveKobetyugDyjM7HWprGq0jgWnbEi1U+PtOBj92thQ5muDQfJznxOfeAx31LmdHGKk93tWJYfAdoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765980131; c=relaxed/simple;
	bh=Zm0w9AyZ0wzqaCW2DRJi/PR0LqW48OYEh36NaNUFSlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bQljHePsj9vGf6p/z4+zhTr3qEd4Vzz01h8AlSUESY0t6aGdYBUsg81mQ8xq/hdQVrrQMwMXEBBjbDTWxrpaGBBDI742sOWmrc3BGZyJn+g1kw8hz0aedcszzV8+MyC7a+G5N3kHwa1+5I546yk/YJAyZA5G9qhPkRv+qjcbyCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=fail smtp.mailfrom=emfend.at; arc=none smtp.client-ip=194.208.23.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=emfend.at
Received: from [192.168.0.207] (194-208-208-245.tele.net [194.208.208.245])
	by rmisp-mx-out1.tele.net (Postfix) with ESMTPA id C6DD310E2A86;
	Wed, 17 Dec 2025 15:02:05 +0100 (CET)
Message-ID: <4cea157c-5371-4c9c-b554-a53aaa786b6f@emfend.at>
Date: Wed, 17 Dec 2025 15:02:05 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: i2c: imx283: implement {g,s}_register
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Umang Jain <uajain@igalia.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251217-imx283-ext-v1-0-906a762f592d@emfend.at>
 <20251217-imx283-ext-v1-3-906a762f592d@emfend.at>
 <CAPY8ntCiOJb9iyFDYS_wxhteoHL7vMFpEF8gVwrf2qeFd-Fssw@mail.gmail.com>
 <2f93eda4-483e-4fa2-a765-73e8df4eeaea@emfend.at>
 <176597534567.3937789.3409848773538845012@ping.linuxembedded.co.uk>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <176597534567.3937789.3409848773538845012@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kieran,

thanks for your reply.

Am 17.12.2025 um 13:42 schrieb Kieran Bingham:
> Quoting Matthias Fend (2025-12-17 12:21:28)
>> Hi Dave,
>>
>> thanks for your comment.
>>
>> Am 17.12.2025 um 12:54 schrieb Dave Stevenson:
>>> Hi Matthias
>>>
>>> On Wed, 17 Dec 2025 at 07:41, Matthias Fend <matthias.fend@emfend.at> wrote:
>>>>
>>>> Implement {g,s}_register to support advanced V4L2 debug functionality.
>>>
>>> Is there any real benefit to providing access via {g,s}_register
>>> rather than using i2ctransfer -f ? The I2C framework ensures that each
>>> transfer is atomic as long as it is formed into one transaction
>>> request.
>>
>> This allows, for example, the registers to be changed when the image
>> sensor is actually used in streaming mode.
>>
>> IMHO, this cannot be covered by i2ctransfer, as the device is used
>> exclusively by the driver.
> 
> I frequently modify registers while the device is streaming to debug and
> investigate.
> 
> I use my colleague Tomi's rwmem tool though:
> 
>   - https://github.com/tomba/rwmem
> 
> But I don't think it does anything specifically special - it's still an
> underlying i2c-transfer operation through /dev/i2c-x ?

Thanks for the hint - I didn't know that tool yet.

With the '-f' option, it's actually possible to use i2ctransfer as well.

> 
> 
> 
>>
>>>
>>> IMHO The only place these are really needed is with devices such as
>>> the adv7180 family which have a bank and page addressing scheme, and
>>> the driver is caching the last accessed bank.
>>>
>>>> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
>>>> ---
>>>>    drivers/media/i2c/imx283.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 44 insertions(+)
>>>>
>>>> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
>>>> index 7a6ab2941ea985401b21d60163b58e980cf31ddc..d8ccde0a1587259f39a10984c517cc57d323b6bc 100644
>>>> --- a/drivers/media/i2c/imx283.c
>>>> +++ b/drivers/media/i2c/imx283.c
>>>> @@ -1295,7 +1295,51 @@ static const struct v4l2_subdev_internal_ops imx283_internal_ops = {
>>>>           .init_state = imx283_init_state,
>>>>    };
>>>>
>>>> +#ifdef CONFIG_VIDEO_ADV_DEBUG
>>>> +static int imx283_g_register(struct v4l2_subdev *sd,
>>>> +                            struct v4l2_dbg_register *reg)
>>>> +{
>>>> +       struct imx283 *imx283 = to_imx283(sd);
>>>> +       u64 val;
>>>> +       int ret;
>>>> +
>>>> +       if (!pm_runtime_get_if_active(imx283->dev))
>>>> +               return 0;
>>>
>>> Returning no error if the device is powered down feels wrong. How is
>>> the caller meant to differentiate between powered down and the
>>> register actually containing 0?
>>
>> The only other I2C drivers that use pm* in {g,s}_register seem to be
>> imx283 and tc358746. Since both return 0 when the device is inactive, I
> 
> Did you mean something other than imx283 here ?

True, the IMX283 is obviously not a good reference in this respect :)

However, if there's agreement that implementing {g,s}_register for this 
driver isn't sensible, I'll just drop this commit.

Thanks
  ~Matthias

> 
> --
> Kieran
> 
>> figured there must be a reason for this and implemented it that way as well.
>>
>> Thanks
>>    ~Matthias
>>
>>>
>>>> +
>>>> +       ret = cci_read(imx283->cci, CCI_REG8(reg->reg), &val, NULL);
>>>> +       reg->val = val;
>>>> +
>>>> +       pm_runtime_put(imx283->dev);
>>>> +
>>>> +       return ret;
>>>> +}
>>>> +
>>>> +static int imx283_s_register(struct v4l2_subdev *sd,
>>>> +                            const struct v4l2_dbg_register *reg)
>>>> +{
>>>> +       struct imx283 *imx283 = to_imx283(sd);
>>>> +       int ret;
>>>> +
>>>> +       if (!pm_runtime_get_if_active(imx283->dev))
>>>> +               return 0;
>>>
>>> Ditto here. The caller is told the value was written, but it wasn't.
>>>
>>> Thanks.
>>>     Dave
>>>
>>>> +
>>>> +       ret = cci_write(imx283->cci, CCI_REG8(reg->reg), reg->val, NULL);
>>>> +
>>>> +       pm_runtime_put(imx283->dev);
>>>> +
>>>> +       return ret;
>>>> +}
>>>> +#endif
>>>> +
>>>> +static const struct v4l2_subdev_core_ops imx283_core_ops = {
>>>> +#ifdef CONFIG_VIDEO_ADV_DEBUG
>>>> +       .g_register = imx283_g_register,
>>>> +       .s_register = imx283_s_register,
>>>> +#endif
>>>> +};
>>>> +
>>>>    static const struct v4l2_subdev_ops imx283_subdev_ops = {
>>>> +       .core = &imx283_core_ops,
>>>>           .video = &imx283_video_ops,
>>>>           .pad = &imx283_pad_ops,
>>>>    };
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>>
>>


