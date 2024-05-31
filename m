Return-Path: <linux-media+bounces-12318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B258D5B68
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 09:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21F651C20F35
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 07:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7864981205;
	Fri, 31 May 2024 07:28:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F23A2B9AB;
	Fri, 31 May 2024 07:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717140509; cv=none; b=awE7y0Uyo1mLPJOXO76UcF6fh59TVj/KBTjKj9ybUTFPkuhHO60lN5xmT4jBrP8nzxKmkackvonAoH/Amnucz6p3LND+JCQ32db0JXDztMbv2mzZt4AG2jppKUwYlcFcAjclIF72liLoN10XNxItxLpSAUSkXJYt4sYXJ3BghiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717140509; c=relaxed/simple;
	bh=EI4hkwsMyjIOrKijWoxSrNOs2BHfED4YcSoEJWEI2Ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PNmx3Yt4CJCAorkz/uQi+Hd68Z+i7KyvUPa5nJ+ns4AO0Rh09jW7XNceGbsVb2Z+fEOGIQeo5ka8hW9j7puWZqSjszVpf4JPHa1fk+OfrO+clIBourIG7cYCjrLYNHgxxa+wM5Z3sM2YkqAfq51l0uZOoXnrqclu2Hf27o9IImE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AB8C116B1;
	Fri, 31 May 2024 07:28:27 +0000 (UTC)
Message-ID: <b7c585ae-88e7-403b-97b9-a13597c667c8@xs4all.nl>
Date: Fri, 31 May 2024 09:28:25 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE
 condition
To: Nas Chung <nas.chung@chipsnmedia.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
 "m.tretter@pengutronix.de" <m.tretter@pengutronix.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240528020425.4994-1-nas.chung@chipsnmedia.com>
 <a962e94f-a669-40e1-8b28-9ef077cf69be@xs4all.nl>
 <SL2P216MB1246D6779BDDA2C03333D549FBFC2@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <SL2P216MB1246D6779BDDA2C03333D549FBFC2@SL2P216MB1246.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/05/2024 09:03, Nas Chung wrote:
> Hi, Hans.
> 
>> -----Original Message-----
>> From: Hans Verkuil <hverkuil@xs4all.nl>
>> Sent: Thursday, May 30, 2024 7:32 PM
>> To: Nas Chung <nas.chung@chipsnmedia.com>; mchehab@kernel.org; linux-
>> media@vger.kernel.org; sebastian.fricke@collabora.com;
>> m.tretter@pengutronix.de
>> Cc: linux-kernel@vger.kernel.org
>> Subject: Re: [PATCH v2] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE
>> condition
>>
>> On 28/05/2024 04:04, Nas Chung wrote:
>>> Explicitly compare a buffer type only with valid buffer types,
>>> to avoid matching the buffer type outside of valid buffer
>>> type set.
>>>
>>> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
>>> ---
>>>  include/uapi/linux/videodev2.h | 7 ++++++-
>>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/uapi/linux/videodev2.h
>> b/include/uapi/linux/videodev2.h
>>> index fe6b67e83751..fa2b7086e480 100644
>>> --- a/include/uapi/linux/videodev2.h
>>> +++ b/include/uapi/linux/videodev2.h
>>> @@ -157,6 +157,10 @@ enum v4l2_buf_type {
>>>  	V4L2_BUF_TYPE_PRIVATE              = 0x80,
>>>  };
>>>
>>> +#define V4L2_TYPE_IS_VALID(type)		\
>>> +	((type) >= V4L2_BUF_TYPE_VIDEO_CAPTURE	\
>>> +	 && (type) <= V4L2_BUF_TYPE_META_OUTPUT)
>>> +
>>>  #define V4L2_TYPE_IS_MULTIPLANAR(type)			\
>>>  	((type) == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE	\
>>>  	 || (type) == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>>> @@ -171,7 +175,8 @@ enum v4l2_buf_type {
>>>  	 || (type) == V4L2_BUF_TYPE_SDR_OUTPUT			\
>>>  	 || (type) == V4L2_BUF_TYPE_META_OUTPUT)
>>>
>>> -#define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
>>> +#define V4L2_TYPE_IS_CAPTURE(type)	\
>>> +	(V4L2_TYPE_IS_VALID(type) && !V4L2_TYPE_IS_OUTPUT(type))
>>>
>>>  enum v4l2_tuner_type {
>>>  	V4L2_TUNER_RADIO	     = 1,
>>
>> This patch introduced this warning:
>>
>> In function 'find_format_by_index',
>>    inlined from 'vdec_enum_fmt' at
>> drivers/media/platform/qcom/venus/vdec.c:452:8:
>> drivers/media/platform/qcom/venus/vdec.c:172:32: warning: 'valid' may be
>> used uninitialized [-Wmaybe-uninitialized]
>>  172 |                 if (k == index && valid)
>>      |                     ~~~~~~~~~~~^~~~~~~~
>> drivers/media/platform/qcom/venus/vdec.c: In function 'vdec_enum_fmt':
>> drivers/media/platform/qcom/venus/vdec.c:157:22: note: 'valid' was
>> declared here
>>  157 |                 bool valid;
>>      |                      ^~~~~
>>
>> This driver does this:
>>
>> 	bool valid;
>>
>>        if (V4L2_TYPE_IS_OUTPUT(type)) {
>>                valid = venus_helper_check_codec(inst, fmt[i].pixfmt);
>>        } else if (V4L2_TYPE_IS_CAPTURE(type)) {
>>                valid = venus_helper_check_format(inst, fmt[i].pixfmt);
>>
>> With your patch both V4L2_TYPE_IS_OUTPUT(type) and
>> V4L2_TYPE_IS_CAPTURE(type)
>> can return false, something that wasn't possible without this patch.
>>
>> In this driver the fix would just be to drop the second 'if' altogether,
>> so just
>> '} else {'.
>>
>> Since these defines are part of the public API, this change introduces a
>> subtle
>> behavior difference that can affect applications.
> 
> Thank you for a detailed description.
> 
>>
>> That said, I do consider this an improvement.
>>
>> I would like some changes, though:
>>
>> 1) Just after "V4L2_BUF_TYPE_META_OUTPUT          = 14," in enum
>> v4l2_buf_type,
>>   add a comment saying that V4L2_TYPE_IS_VALID and (for output types)
>>   V4L2_TYPE_IS_OUTPUT must be updated if a new type is added. It's all
>>   too easy to forget that otherwise.
> 
>> 2) Add a patch fixing the venus/vdec.c code.
> 
> 1), 2) I will address both in v3.
> 
>> 3) Something else I noticed, but I think this change should be in a
>> separate patch:
>>   V4L2_TYPE_IS_OUTPUT() returns true for V4L2_BUF_TYPE_VIDEO_OVERLAY, but
>> that
>>   definitely belongs to CAPTURE. Nobody really uses that type anymore,
>> but still,
>>   it should be fixed.
> 
> 3) Would you prefer this modification to be included as a separate patch
> in the v3 of this patch series, or should it be submitted as a new
> standalone patch ?

Separate patch in this series, please.

Regards,

	Hans

> 
> Thanks.
> Nas.
> 
>>
>> Regards,
>>
>> 	Hans
> 


