Return-Path: <linux-media+bounces-38444-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAAEB11A7E
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 11:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49EF03AFFCB
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 09:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A38273811;
	Fri, 25 Jul 2025 09:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="pSikeqVh"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ADF2737E5;
	Fri, 25 Jul 2025 09:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753434333; cv=none; b=XXoEEzKptDomGJb4duWZEWcMnyciA5eHrjWAxVVFcKCF65DrBIZAWxRlx79a1LhU3n+G2Lb4XOmaibGy4trDgxK0vaRKVaOMQbl6n6ztwlPuZByns28ksMEG9Hp6fPLh1mUdyt/miweDnNouh4MbEAA/KYXVYUJneF4DFX8PwKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753434333; c=relaxed/simple;
	bh=Vgafa3vbljfQRNzyc9Mb8JSo2I+9EP9jfVb0WOnptHU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RxzUBy+z2ncL/V4n5T1SofAiA48kCH3+MMZhcFISJBLDD6CoJQSKggTs9+QaVmWRSohORJzoOKdNL++deq0sVveFAJZqiI8I2aeJpjkgTgjP5vNgYJ/dDpp9MBtSUlp9n3/13pr7GsYFK3t9e66sM08CjJJwVP80Dq61NpBRrZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=pSikeqVh; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4bpMQw6Jk9z10nF;
	Fri, 25 Jul 2025 09:05:28 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.107]) by freedom.nl (Postfix) with ESMTPSA id 4bpMQw2wHCz7P;
	Fri, 25 Jul 2025 09:05:28 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=pSikeqVh;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1753434328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Pullx83NlaIpxJg6m+vDjhNOh5Jd1i42EPX4CAcQhro=;
	b=pSikeqVhVsfiOhiCgZc1z4GJKwfAHeq6DIcOyrSD4I/cll1WkgCjaskzwUS3ktvctYuPqR
	y1PYRiOoHuo5Lfnpa2oscfc4znrRfi6Qt6drQif1Ho5LEyS1nvSpQl422T/acz6CRDbg0a
	t9wD8XB9AJeQuQaBmMzxC91v4PYds8yGZfqULWk8rCvaftrquPE4lVigByQyvHhR+k9nNE
	X1Gmr6R7bBjz1r0Ws0wbyaJIoIT1gaMZeXDoAdNcpo1lXUtBMN4VAGggke8AO2bwvgXuhM
	7RztSUCa5lYxW7AtEL9oRcUHqR7RrVV86VYrgblYLvUusdGwByaJ107/T/behg==
X-CM-Analysis: v=2.4 cv=d/oPyQjE c=1 sm=1 tr=0 ts=688348d8 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=8AirrxEcAAAA:8 a=vWrmB23aV7b_PkFYOm0A:9 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
Message-ID: <8d452d63-b52b-4cda-acf0-14deeb81d65e@jjverkuil.nl>
Date: Fri, 25 Jul 2025 11:05:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: hans@jjverkuil.nl
Subject: Re: [RFC 2/2] Documentation: media: Describe exposure and gain
 controls for multiple captures
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, ribalda@chromium.org, jai.luthra@ideasonboard.com,
 laurentiu.palcu@nxp.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, LnxRevLi@nxp.com, julien.vuillaumier@nxp.com,
 celine.laurencin@nxp.com
References: <20250710220544.89066-1-mirela.rabulea@nxp.com>
 <20250710220544.89066-3-mirela.rabulea@nxp.com>
 <20250716000738.GF19299@pendragon.ideasonboard.com>
 <fcb87e2d-5ddf-4f33-b5f7-5af67c438af5@nxp.com>
 <20250723134942.GC6719@pendragon.ideasonboard.com>
Content-Language: en-US, nl
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <20250723134942.GC6719@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

On 23/07/2025 15:49, Laurent Pinchart wrote:
> On Sun, Jul 20, 2025 at 10:02:13PM +0300, Mirela Rabulea wrote:
>> On 7/16/25 03:07, Laurent Pinchart wrote:
>>> On Fri, Jul 11, 2025 at 01:05:44AM +0300, Mirela Rabulea wrote:
>>>> The standard controls for exposure and gains allow a
>>>> single value, for a single capture. For sensors with HDR
>>>> capabilities or context switching, this is not enough, so
>>>> add new controls that allow multiple values, one for each
>>>> capture.
>>>
>>> One important question not addressed by this patch is how the new
>>> controls interact with the old ones. For instance, if a sensor
>>> implements 2-DOL, it should expose a V4L2_CID_EXPOSURE_MULTI control
>>> with 2 elements. Should it also expose the V4L2_CID_EXPOSURE control,
>>> when operating in SDR mode ? What should happen when both controls are
>>> set ?
>>
>> Yes, it's a good point. I experimented with the option of implementing 
>> both, at least for backward compatibility (libcamera requires them) and 
>> kept them consistent, I mean if V4L2_CID_EXPOSURE_MULTI values change, 
>> also change V4L2_CID_EXPOSURE and viceversa, so basically keep 
>> consistent the values from V4L2_CID_EXPOSURE with the values for the 
>> first exposure from V4L2_CID_EXPOSURE_MULTI. Also, I had to check if hdr 
>> mode is not enabled, do nothing in s_ctrl for V4L2_CID_EXPOSURE_MULTI 
>> (cannot return error, as it will make __v4l2_ctrl_handler_setup fail).
>>
>>> There are also sensors that implement multi-exposure with direct control
>>> of the long exposure, and indirect control of the short exposure through
>>> an exposure ratio. The sensors I'm working on support both, so we could
>>> just ignore the exposure ratio, but if I recall correctly CCS allows
>>> sensors to implement exposure ratio only without direct short exposure
>>> control. How should we deal with that ?
>>
>> I'm not sure I understand, but in case of indirect short exposure 
>> control I think we do not need these multiple exposure controls, we can 
>> use the existing ones, as only the value for the long exposure is 
>> needed, the driver can derive the value for the short exposure using the 
>> ratio.
> 
> I'm talking about sensors that implement the CCS exposure ratio, or a
> similar mechanism. With those sensors, the long exposure time is set
> directly, and the short exposure time is calculated by the sensor by
> dividing the long exposure time by a ratio. The ratio is programmed by
> the driver through a register. The ratio could be set to a fixed value,
> but I think there are use cases for controlling it from userspace.
> 
> Some sensors support both direct control of the short exposure and
> indirect control through a ratio, while other may support indirect
> control only. For the sensors that support both, we could decide to only
> expose the multi-exposure control with direct control of the short
> exposure. For sensors that support indirect control only, we need to
> define an API. We could possibly still use the same multi-exposure
> control and compute the ratio internally in the driver, but there may be
> a better option.
> 
>> In some cases, this may be enough, but when direct individual 
>> control is needed for both long and short exposure, then we need the 
>> multiple exposure controls. Do you have a specific sensor example in mind?
>> I think in the past we looked at imx708, and my understanding was that 
>> the exposure control affects only the long exposure and the sensor will 
>> automatically divide the medium and short one with the corresponding ratio:
>> https://github.com/raspberrypi/linux/blob/rpi-6.12.y/drivers/media/i2c/imx708.c
> 
> The ratio seems configurable. Register 0x0220 is programmed to 0x62,
> which selects ratio-based control of the exposure. I don't know if the
> sensor supports direct control of the short (and very short) exposure.
> 
>>> Finally, I was recently wondering if it would be possible to reuse the
>>> existing controls instead, allowing them to be either single values or
>>> arrays. The idea would be that setting the control to a single value
>>> (essentially ignoring it's an array) would provide the current
>>> behaviour, while setting values for multiple elements would control the
>>> separate exposures.
>>
>> You mean to divide the 32 bits value of the current controls between the 
>> multiple exposures?
>> Just one comment here, we have encountered the ox03c10 sensor with 4 
>> exposures (that will leave only 8 bits per exposure), and the ox05b1s 
>> sensor with context switching and the exposure on 24 bits (for 2 
>> contexts, 2x24=48). So reusing current 32 bit controls  might not be 
>> enough.
> 
> I'm not sure the controls here should be used in the context switching
> use case. It would be better to define a more generic mechanism that
> supports multiple contexts for all controls.
> 
>> Or do you mean changing the current controls type from 
>> V4L2_CTRL_TYPE_INTEGER to u32 array?
> 
> Yes, this is what I mean.
> 
>> Would that not cause issues with 
>> applications already using current controls?
> 
> That would only work if the kernel could handle some type of backward
> compatibility, doing the right thing when userspace sets the control to
> a single value (as opposed to an array of values). That's probably not
> very realistic, as the control would enumerate as a compound control,
> and that may break existing userspace.
> 
> Another option would be to change the control type at runtime based on
> whether or not HDR is enabled, but that also sounds like it will cause
> lots of issue.

While technically it is possible to change the type at initialization time
(although probably not dynamically), it is basically a uAPI change since it
was never documented that you had to check the control type first for these
controls before using them.

I think introducing these MULTI variants makes sense and is the right way to
go.

Regards,

	Hans

>>> I haven't checked if the control framework supports
>>> this, or if it could be supported with minimum changes. The advantage is
>>> that we wouldn't need to define how the new and old controls interact if
>>> we don't introduce new controls. 
>>
>> I think the same advantage will be achieved with stream-aware controls 
>> (no new controls, also the min/max/def semantics remain clear), but 
>> there is the issue we do not have streams if the sensor does internally 
>> the hdr merge. Does it sound any better to introduce some fake streams 
>> or pads that are not associated with any pixel stream, but just to allow 
>> multiple exposure control?
> 
> That also sounds like quite a bit of complexity for little gain. It
> seems that new controls are the best option. There are still a few
> issues to solve:
> 
> - Should sensors that support multi-exposure (or gains) implement
>   V4L2_CID_EXPOSURE for backward compatibility, or only
>   V4L2_CID_EXPOSURE_MULTI ? If both are implemented, how should the two
>   controls interact ?
> 
> - How do we handle ratio-based exposure control ?
> 
> - In which order are the exposures (and gains) stored in the array ?
> 
>> BTW, Jay, what are your plans around the stream-aware controls?
>>
>> Thanks again for feedback, Laurent!
>>
>>> Hans, what do you think ?
>>
>> Same question from me ;)
>>
>>>> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
>>>> ---
>>>>   .../media/v4l/ext-ctrls-image-source.rst             | 12 ++++++++++++
>>>>   1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
>>>> index 71f23f131f97..6efdb58dacf5 100644
>>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
>>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
>>>> @@ -92,3 +92,15 @@ Image Source Control IDs
>>>>       representing a gain of exactly 1.0. For example, if this default value
>>>>       is reported as being (say) 128, then a value of 192 would represent
>>>>       a gain of exactly 1.5.
>>>> +
>>>> +``V4L2_CID_EXPOSURE_MULTI (__u32 array)``
>>>> +    Same as V4L2_CID_EXPOSURE, but for multiple exposure sensors. Each
>>>> +    element of the array holds the exposure value for one capture.
>>>> +
>>>> +``V4L2_CID_AGAIN_MULTI (__u32 array)``
>>>> +    Same as V4L2_CID_ANALOGUE_GAIN, but for multiple exposure sensors. Each
>>>> +    element of the array holds the analog gain value for one capture.
>>>> +
>>>> +``V4L2_CID_DGAIN_MULTI (__u32 array)``
>>>> +    Same as V4L2_CID_DIGITAL_GAIN, but for multiple exposure sensors. Each
>>>> +    element of the array holds the digital gain value for one capture.
> 


