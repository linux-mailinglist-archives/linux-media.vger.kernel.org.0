Return-Path: <linux-media+bounces-38019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F5AB08DC4
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 15:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDBE27B32EC
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 13:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA1F2D949E;
	Thu, 17 Jul 2025 13:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sPHQTEIa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6A22D8DC5;
	Thu, 17 Jul 2025 13:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752757259; cv=none; b=AV47CichiXsSrI9vfuVse7JABWTseZHK5JaCnv5+qIUaV6gV8AJeDPivtNnoNfPPMbM7uP7xiXuwACzd+IY2wz30KXZWbOCh1o+4BSOqXGi57THTW7yTFaoRX5iKWYqKwOblF+dt24JuaAu9QdC0HczO0ZhS8rtWx7KlPqmb0Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752757259; c=relaxed/simple;
	bh=WsrnxRFgk4YdAIg8GBjZrRJX6IRI0hJv13ASmf9n3nQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQbGWQgyD8Ufk1dLN9T67oikAtpx0i9LyrbvbDT6P1IMF04QnaGgeh5lkjXKSb5ceH+VZce5KEKLdhQszHoL1vndCFxvOk2Aux6zR02M18atUPM1RiRW82fjQEEkfwKQGBoltCLqqGfTDcHAKdYeCghev9CseSFQXaC8M2FN+Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sPHQTEIa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 146F8C4CEED;
	Thu, 17 Jul 2025 13:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752757259;
	bh=WsrnxRFgk4YdAIg8GBjZrRJX6IRI0hJv13ASmf9n3nQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sPHQTEIaLOqHjAd+a6VGO4LFhX0K5x0qNlj2wV/3jCbBEZWb04BOgr8Ah9zfISCbB
	 LwHFPlzh7wbWeUoIKQdGpuRhH+QrbDtVPrrfZdp7ppmOze2G7eB38KTM6HvHf9PBVH
	 +N18EFxrryJskRxta+gEzXWi6WaKVb99prOmozOJkK0fZx9xURDbq/H5lW1W/ZrQyY
	 tnI82vXmG2BWgxFS/Pzcg8FAYhFz/jRxcmBLuEzpB4/xF1ryR1S6yh2SD6WQGntxwC
	 NuDIdlrEZ+ysaQt3344+lWmGvmRxq2iFo2HW6qx5XdaRCE6UdaS24SmEzsx2sduxFk
	 0lAuQjD7zHsvg==
Message-ID: <8cdea7c7-739a-4101-9e2f-1bb36632ff5a@kernel.org>
Date: Thu, 17 Jul 2025 15:00:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add ov2735 sensor
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Cc: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Matthias Fend <matthias.fend@emfend.at>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Jingjing Xiong <jingjing.xiong@intel.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Hans de Goede <hansg@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250716134426.8348-1-hardevsinh.palaniya@siliconsignals.io>
 <20250716134426.8348-2-hardevsinh.palaniya@siliconsignals.io>
 <20250717-hulking-earthworm-of-atheism-68a02c@kuoka>
 <PN3P287MB3519C2A2B8DC207AC0AF2C50FF51A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
 <25eb573c-a37e-4f8c-8fd6-5ca62e1a29b9@kernel.org>
 <PN3P287MB3519907E3C113D6CD9D564E3FF51A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <PN3P287MB3519907E3C113D6CD9D564E3FF51A@PN3P287MB3519.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/07/2025 13:55, Hardevsinh Palaniya wrote:
>> On 17/07/2025 09:28, Hardevsinh Palaniya wrote:
>>>  Hi Krzysztof,
>>>
>>>> On Wed, Jul 16, 2025 at 07:14:16PM +0530, Hardevsinh Palaniya wrote:
>>>>> +        properties:
>>>>> +          data-lanes:
>>>>> +            items:
>>>>> +              - const: 1
>>>>> +              - const: 2
>>>>> +          link-frequencies: true
>>>>
>>>> Drop
>>>>
>>>> I don't understand why this appeared. I don't think anyone asked for it?
>>>
>>> Laurent suggested validating the link frequency in the Device Tree.
>>>
>>> Link[1]: https://lore.kernel.org/linux-media/20250710212131.GG22436@pendragon.ideasonboard.com/
>>
>> ... and I do not see here validation "that the link frequencies
>> specified in DT match".
>>
>> How do you validate that 1111 Hz is not / is a valid link frequency? How
>> did you exactly resolve the comment about validating?
> 
> In the ov2735_parse_endpoint() function, the driver validates the link frequency
> from DT using `v4l2_link_freq_to_bitmap()`. If an unsupported value like 1111 Hz is
> provided, it returns an error: 


But that's driver. You said that you added this property based on
feedback on validation. There is no validation here, thus the reason of
this property is not fulfilled and that's why I was asking. I know now
the answer...



> 
> ret = v4l2_link_freq_to_bitmap(ov2735->dev, bus_cfg.link_frequencies,
>                                bus_cfg.nr_of_link_frequencies,
>                                link_freq_menu_items,
>                                ARRAY_SIZE(link_freq_menu_items),
>                                &link_freq_bitmap);
> if (ret) {
>         ret = dev_err_probe(ov2735->dev,
>                             -EINVAL, "only 420MHz frequency is available\n");
>         goto error_out;
> }
> 
> So, validation is already done in the driver.
> 
> I understand that `link-frequencies: true` in the schema only declares the property
> without restricting values. Would you prefer the schema to explicitly allow only
> 420MHz like this?


You missed the last paragraph of my last email. I don't want to have
here what the driver is doing, but what the hardware is/needs/requires.
It can also be missing completely, because we don't enforce such rules
on other bindings.


Best regards,
Krzysztof

