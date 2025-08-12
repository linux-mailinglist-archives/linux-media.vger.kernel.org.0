Return-Path: <linux-media+bounces-39512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD35B21E95
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3316C3A7D02
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 06:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0D5269D06;
	Tue, 12 Aug 2025 06:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXTxxK6U"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936BF204C36;
	Tue, 12 Aug 2025 06:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754981239; cv=none; b=EXePrb7UqSimLRTSSVe5KHWUmV1tFxvpfhNDAnN6TwZs6tImTOhdrk3IhKmj7WzAMTQ1tR39VMQUE3G3bhtG1IsvmnLt1kjg8TY1vfkvjmF546NnhrLieOYautrrKJvrRd2W5dguSy6m9zq26XVOM3YYZzhva87ZzeM6Mlh1WLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754981239; c=relaxed/simple;
	bh=/HZqQfR9eGDYw52QNI2P2rJt4fBRwuB/h0GTLpd4Xek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FTBhm0hDZZDAGSD369U/EOcw7eTTdFq8PBjzjtD2W4OHG4wJ3NsfN0hm1kDXGfvDnhJWKL1FgyhP3F7FIfxWQJb10ak9/9g7qY0XMlfDBLzFyOB0YJxqq1BEc0iJjQfuJ7eL968RrQnDO/LyW9RjNPA8RTRChuT2NQ4aP3wjYaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXTxxK6U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA68C4CEF0;
	Tue, 12 Aug 2025 06:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754981237;
	bh=/HZqQfR9eGDYw52QNI2P2rJt4fBRwuB/h0GTLpd4Xek=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IXTxxK6UaeBi3I4CEDYFNOhvzeZDrcnMZRNlK4ga9/i8THpqqn3sj5jecXiGOKOsM
	 u8YT828jgG+PTBp86bsbR36fuRfDDiuMvnDtZIC5xQTUvezx6bH3GoaoZtuUcSeEQm
	 R0eA5lNuvMdKRKe7JCF3ZWqnAh7cGS3pTLLepqk3LC+dGmxPoSfCVQObpcSdxWPQFT
	 +tTuzrIXVjgtp7YEnnUN2P7nRc0q8v4uuzbroJvbX0CxIaBnQ3QNdnMzOdRbCRqNm+
	 2IC70RGDkRsFkeVLkfSQnOo7fz31ag4mJI10DKwoYWZXXvbr5ReQfinot5xj9SdKSU
	 CsAnAYBpK1y9Q==
Message-ID: <e695c61a-e183-4eea-a7f6-1b2861b2129f@kernel.org>
Date: Tue, 12 Aug 2025 08:47:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: media: Add Sony IMX585 CMOS image
 sensor
To: Will Whang <will@willwhang.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250810220921.14307-1-will@willwhang.com>
 <20250810220921.14307-2-will@willwhang.com>
 <20250811-successful-military-dragon-d72486@kuoka>
 <CAFoNnrxWwqT9WA-h2WOsUe6Q-qEoz2mTHLpDogAyMwiXXZ9MrA@mail.gmail.com>
 <f12e6ff3-6ec3-487f-bf9c-0f8c06ee6444@kernel.org>
 <CAFoNnrxhUof8BBrefm1L1peTxg==Koz72TY+54G_8QUy-rrT8g@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAFoNnrxhUof8BBrefm1L1peTxg==Koz72TY+54G_8QUy-rrT8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/08/2025 08:31, Will Whang wrote:
> Hi Krzysztof,
> 
> Reply inline,
> Thanks,
> Will Whang
> 
> On Mon, Aug 11, 2025 at 11:23 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 12/08/2025 04:47, Will Whang wrote:
>>> Hi Krzysztof,
>>> Reply inline.
>>> Thanks,
>>> Will Whang
>>>
>>> On Mon, Aug 11, 2025 at 1:01 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On Sun, Aug 10, 2025 at 11:09:18PM +0100, Will Whang wrote:
>>>>> +description:
>>>>> +  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - sony,imx585
>>>>> +      - sony,imx585-mono
>>>>
>>>> I don't understand this second compatible. Is this different hardware?
>>>> Can you point me to "mono" datasheet?
>>>>
>>>> Your description should explain this. Commit msg as well, instead of
>>>> speaking about driver (in fact drop all driver related comments).
>>>>
>>> Mono version of this sensor is basically just removing the bayer
>>> filter, so the sensor itself actually doesn't know if it is color or
>>> mono and from my knowledge there are no registers programmed in the
>>> factory that will show the variant and model number. (That is why when
>>> the driver probing it only test blacklevel register because there are
>>> no ID registers)
>>> Originally in V1 patch I've made the switch between color and mono in
>>> dtoverlay config but reviewer comments is to move it to compatible
>>> string and not property.(https://lore.kernel.org/linux-media/20250703175121.GA17709@pendragon.ideasonboard.com/)
>>
>> You only partially answer and judging by mentioning driver below:
>>
>>
>>>
>>> In this case, what would you recommend?
>>>
>>> compatible:
>>>   enum:
>>>     - sony,imx585
>>>     - sony,imx585-mono
>>>   description: IMX585 has two variants, color and mono which the
>>> driver supports both.
>>
>> ... I still have doubts that you really understand what I am asking. Is
>> this one device or two different devices?
> One device that has two variants: IMX585-AAMJ1 (Mono) and IMX585-AAQJ1
> (Color). Silicon-wise the difference is just with or without bayer
> filter.
Then I would propose to use sony,imx585-aamj1 and -aaqj1 with short
explanation either in comment or description about difference in RGB
mosaic filter.

Best regards,
Krzysztof

