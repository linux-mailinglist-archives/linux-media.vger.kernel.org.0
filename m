Return-Path: <linux-media+bounces-48985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B209CC7A28
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 13:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C14B30C27FC
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 12:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D1034251A;
	Wed, 17 Dec 2025 12:30:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from rmisp-mx-out2.tele.net (rmisp-mx-out2.tele.net [194.208.23.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5C633FE2E;
	Wed, 17 Dec 2025 12:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.208.23.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765974605; cv=none; b=M7KtI52rLD3wFIlq5ySEoBf88a3XkHNLVwjoSVwtIGPb/fka5P9cqJCSADJXNjlUQhfdM02NBl4NheqUUTXDDtZrbzJWPSGu/AIlcbXeIQ6iH+hJ17Z5sDTqcVgBUk2jZz1GlCn9/r5L3Ny0OJNGTyXLB26P3k/kKkDhnsK8a0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765974605; c=relaxed/simple;
	bh=9efI+J8C0Yy9SBoVco3ChlmDPBkmh937NX/bhxYLWkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AJfEDjIDTInlkvb3AZup2tDECngdYgJttqcrXgRUz1DCnS4AKE0NkwdysK4hwt0yCoQrN3GSLIRArjr40yGwfjcUD5WZlaMr7JEuLaRlDTDisVLm359w2Wir5yz9ZZaftNngC5zNkArC4gitHUU3H3jruxtQwh+N6gq0qbsaaUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=fail smtp.mailfrom=emfend.at; arc=none smtp.client-ip=194.208.23.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=emfend.at
Received: from [192.168.0.207] (194-208-208-245.tele.net [194.208.208.245])
	by rmisp-mx-out2.tele.net (Postfix) with ESMTPA id A8E711052E61;
	Wed, 17 Dec 2025 13:21:28 +0100 (CET)
Message-ID: <2f93eda4-483e-4fa2-a765-73e8df4eeaea@emfend.at>
Date: Wed, 17 Dec 2025 13:21:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: i2c: imx283: implement {g,s}_register
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <uajain@igalia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251217-imx283-ext-v1-0-906a762f592d@emfend.at>
 <20251217-imx283-ext-v1-3-906a762f592d@emfend.at>
 <CAPY8ntCiOJb9iyFDYS_wxhteoHL7vMFpEF8gVwrf2qeFd-Fssw@mail.gmail.com>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <CAPY8ntCiOJb9iyFDYS_wxhteoHL7vMFpEF8gVwrf2qeFd-Fssw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dave,

thanks for your comment.

Am 17.12.2025 um 12:54 schrieb Dave Stevenson:
> Hi Matthias
> 
> On Wed, 17 Dec 2025 at 07:41, Matthias Fend <matthias.fend@emfend.at> wrote:
>>
>> Implement {g,s}_register to support advanced V4L2 debug functionality.
> 
> Is there any real benefit to providing access via {g,s}_register
> rather than using i2ctransfer -f ? The I2C framework ensures that each
> transfer is atomic as long as it is formed into one transaction
> request.

This allows, for example, the registers to be changed when the image 
sensor is actually used in streaming mode.

IMHO, this cannot be covered by i2ctransfer, as the device is used 
exclusively by the driver.

> 
> IMHO The only place these are really needed is with devices such as
> the adv7180 family which have a bank and page addressing scheme, and
> the driver is caching the last accessed bank.
> 
>> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
>> ---
>>   drivers/media/i2c/imx283.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>
>> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
>> index 7a6ab2941ea985401b21d60163b58e980cf31ddc..d8ccde0a1587259f39a10984c517cc57d323b6bc 100644
>> --- a/drivers/media/i2c/imx283.c
>> +++ b/drivers/media/i2c/imx283.c
>> @@ -1295,7 +1295,51 @@ static const struct v4l2_subdev_internal_ops imx283_internal_ops = {
>>          .init_state = imx283_init_state,
>>   };
>>
>> +#ifdef CONFIG_VIDEO_ADV_DEBUG
>> +static int imx283_g_register(struct v4l2_subdev *sd,
>> +                            struct v4l2_dbg_register *reg)
>> +{
>> +       struct imx283 *imx283 = to_imx283(sd);
>> +       u64 val;
>> +       int ret;
>> +
>> +       if (!pm_runtime_get_if_active(imx283->dev))
>> +               return 0;
> 
> Returning no error if the device is powered down feels wrong. How is
> the caller meant to differentiate between powered down and the
> register actually containing 0?

The only other I2C drivers that use pm* in {g,s}_register seem to be 
imx283 and tc358746. Since both return 0 when the device is inactive, I 
figured there must be a reason for this and implemented it that way as well.

Thanks
  ~Matthias

> 
>> +
>> +       ret = cci_read(imx283->cci, CCI_REG8(reg->reg), &val, NULL);
>> +       reg->val = val;
>> +
>> +       pm_runtime_put(imx283->dev);
>> +
>> +       return ret;
>> +}
>> +
>> +static int imx283_s_register(struct v4l2_subdev *sd,
>> +                            const struct v4l2_dbg_register *reg)
>> +{
>> +       struct imx283 *imx283 = to_imx283(sd);
>> +       int ret;
>> +
>> +       if (!pm_runtime_get_if_active(imx283->dev))
>> +               return 0;
> 
> Ditto here. The caller is told the value was written, but it wasn't.
> 
> Thanks.
>    Dave
> 
>> +
>> +       ret = cci_write(imx283->cci, CCI_REG8(reg->reg), reg->val, NULL);
>> +
>> +       pm_runtime_put(imx283->dev);
>> +
>> +       return ret;
>> +}
>> +#endif
>> +
>> +static const struct v4l2_subdev_core_ops imx283_core_ops = {
>> +#ifdef CONFIG_VIDEO_ADV_DEBUG
>> +       .g_register = imx283_g_register,
>> +       .s_register = imx283_s_register,
>> +#endif
>> +};
>> +
>>   static const struct v4l2_subdev_ops imx283_subdev_ops = {
>> +       .core = &imx283_core_ops,
>>          .video = &imx283_video_ops,
>>          .pad = &imx283_pad_ops,
>>   };
>>
>> --
>> 2.34.1
>>
>>


