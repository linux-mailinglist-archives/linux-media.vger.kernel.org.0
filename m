Return-Path: <linux-media+bounces-39747-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F4FB242DD
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBB7C681859
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 07:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882B52D948D;
	Wed, 13 Aug 2025 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IgS2znVO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D289A225762;
	Wed, 13 Aug 2025 07:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755070467; cv=none; b=cbWs90LIGOjNJHJkxmYTaBsrNcThLGDnnJxCMSA++wa9gawh7E+xr+xNYlj/YfjbtJqu8YeauclBkwI73TJTJw4JbyQVMCl+v0HWRbjEhn7RhgIuKZwsva5jmBoWhfADDXt0v9xTAPnGYJ2XNk6e+0BW/r/uFjFvBXyA6CayMVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755070467; c=relaxed/simple;
	bh=LOw47lq3lTR3OffAqvYBcY7aTdLFREjOhrLME4xQV7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KtXKoR/J9vRHrb43o52ajG9ZJz71mCO4Nt+ZzKTxwMhGLzO++x6rKyhRiBPthoHkNoxWwprH9A8/b9Vp7HbcKmboxAMECq8nYeuFTdTDpgkpd33oeaWnm9czlAHdQOL4MnrVKreObaH9U6c9h6wvC/ejJu0SEmsgYK8JqqndIh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IgS2znVO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C75BC4CEEB;
	Wed, 13 Aug 2025 07:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755070466;
	bh=LOw47lq3lTR3OffAqvYBcY7aTdLFREjOhrLME4xQV7k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IgS2znVOJsb/2yQQhCk1/XOsk+ALrk5kbMtqU25i8vDD5NQrfftFwFA/g+YUx1Lxr
	 xvpbUjzDsFRLNZSQe4fyJZqyN48QvKuMCUdc7QP2dtGDlRp0CG/1HR1i60+JmYwhau
	 Ts0bXuajM4QBb8Ah2QcyXbkvUAJ3tl+9P+Sl6Km+ZX+j5lcr5emk38sKtv3XZS/ywp
	 6UkQQnhQXq/vKbSpiZ61ozXwQR6AeA19ov4U1UMQJ7hDK0+kmbzh/HfRZbFD+oejTY
	 OGDhVwHorYMpMamFr8MorTN+w2urXI4l6gxkmWctNhW2bGuR9NEmtzgee5mdd8hw/n
	 zh1Lhefw+iyCQ==
Message-ID: <faf398eb-2be4-43cd-a5bf-2c688dd7bc18@kernel.org>
Date: Wed, 13 Aug 2025 09:34:20 +0200
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
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
 <e695c61a-e183-4eea-a7f6-1b2861b2129f@kernel.org>
 <20250812095543.GJ30054@pendragon.ideasonboard.com>
 <CAFoNnrzWot_Bf=YZFac1GkZgOOnJycwpidvwL93p3p-C-zn8BA@mail.gmail.com>
 <6d6dc9e6-751f-4079-b21e-2e3461885b03@kernel.org>
 <CAFoNnrwoRbtvTHHnjarDTKEHnQMaMDERPKi_vnYym3n8tVpzOA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAFoNnrwoRbtvTHHnjarDTKEHnQMaMDERPKi_vnYym3n8tVpzOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/08/2025 08:38, Will Whang wrote:
> On Tue, Aug 12, 2025 at 11:08 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 13/08/2025 06:30, Will Whang wrote:
>>> On Tue, Aug 12, 2025 at 2:56 AM Laurent Pinchart
>>> <laurent.pinchart@ideasonboard.com> wrote:
>>>>
>>>> On Tue, Aug 12, 2025 at 08:47:12AM +0200, Krzysztof Kozlowski wrote:
>>>>> On 12/08/2025 08:31, Will Whang wrote:
>>>>>> On Mon, Aug 11, 2025 at 11:23 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>>>> On 12/08/2025 04:47, Will Whang wrote:
>>>>>>>> On Mon, Aug 11, 2025 at 1:01 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>>>>>> On Sun, Aug 10, 2025 at 11:09:18PM +0100, Will Whang wrote:
>>>>>>>>>> +description:
>>>>>>>>>> +  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
>>>>>>>>>> +
>>>>>>>>>> +properties:
>>>>>>>>>> +  compatible:
>>>>>>>>>> +    enum:
>>>>>>>>>> +      - sony,imx585
>>>>>>>>>> +      - sony,imx585-mono
>>>>>>>>>
>>>>>>>>> I don't understand this second compatible. Is this different hardware?
>>>>>>>>> Can you point me to "mono" datasheet?
>>>>>>>>>
>>>>>>>>> Your description should explain this. Commit msg as well, instead of
>>>>>>>>> speaking about driver (in fact drop all driver related comments).
>>>>>>>>>
>>>>>>>> Mono version of this sensor is basically just removing the bayer
>>>>>>>> filter, so the sensor itself actually doesn't know if it is color or
>>>>>>>> mono and from my knowledge there are no registers programmed in the
>>>>>>>> factory that will show the variant and model number. (That is why when
>>>>>>>> the driver probing it only test blacklevel register because there are
>>>>>>>> no ID registers)
>>>>>>>> Originally in V1 patch I've made the switch between color and mono in
>>>>>>>> dtoverlay config but reviewer comments is to move it to compatible
>>>>>>>> string and not property.(https://lore.kernel.org/linux-media/20250703175121.GA17709@pendragon.ideasonboard.com/)
>>>>>>>
>>>>>>> You only partially answer and judging by mentioning driver below:
>>>>>>>
>>>>>>>> In this case, what would you recommend?
>>>>>>>>
>>>>>>>> compatible:
>>>>>>>>   enum:
>>>>>>>>     - sony,imx585
>>>>>>>>     - sony,imx585-mono
>>>>>>>>   description: IMX585 has two variants, color and mono which the
>>>>>>>> driver supports both.
>>>>>>>
>>>>>>> ... I still have doubts that you really understand what I am asking. Is
>>>>>>> this one device or two different devices?
>>>>>>
>>>>>> One device that has two variants: IMX585-AAMJ1 (Mono) and IMX585-AAQJ1
>>>>>> (Color). Silicon-wise the difference is just with or without bayer
>>>>>> filter.
>>>>>
>>>>> Then I would propose to use sony,imx585-aamj1 and -aaqj1 with short
>>>>> explanation either in comment or description about difference in RGB
>>>>> mosaic filter.
>>>>
>>>> Works for me. We could possibly omit the "j1" suffix too.
>>>>
>>> My thinking is that imx585 and imx585-mono are easier to comprehend
>>> than IMX585-AAM and IMX585-AAQ.
>>> Because in dtoverlay for the users/me they will have to know what is
>>> the exact name instead of easy to remember name.
>>>
>>> dtoverlay=imx585-aam
>>> is not as nice as
>>> dtoverlay=imx585-mono
>>
>> I have datasheet for AAQ, so how above is easier for me to figure out
>> which compatible I am using?
>>
> I propose this:
> 
> compatible:
>   enum:
>     - sony,imx585
>     - sony,imx585-mono
>     - sony,imx585-AAQJ1
>     - sony,imx585-AAMJ1
> 
>   description: IMX585 has two variants, color (IMX585-AAQ) and mono
> (IMX585-AAM) which
> the driver supports both.

So why four compatibles? BTW, driver does not matter.

> 
> Description is there for a reason, dtoverlay has description also. See
> sony,imx296.yaml as an example.
> If you are looking at AAQ you know it is a color sensor and all the
> color sensors from sony can be used with imx+three numbers in the
> current list.
> This is following the established convention.
Which? Sorry, point me anywhere to convention that we do not use proper
full model names but shortened version for some variant of a device?
Such approach lead to many issues in the past, for example current
Risc-v reset mess where contributor wants to remove completely
incomplete compatible :/

Best regards,
Krzysztof

