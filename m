Return-Path: <linux-media+bounces-28637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12021A6DC21
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 14:52:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88CF5188F4AF
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 13:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462F825F789;
	Mon, 24 Mar 2025 13:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aaYO7qAx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04D025D55A;
	Mon, 24 Mar 2025 13:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742824351; cv=none; b=j2kaYBFqJwueF4wS1C/sA3RCUc6kPm7frgfuoEIZGvNt8upmsO3UKnr4LGlUHeVTP4Jv0Y9zhMlMDyd/m+rP0l0JhZlW5EE2wwBrbRNEWI3kXWNNrdku2dhNP5jl2AU5ogA3u5cvjYRG5TQHBesAPF4On01e/aQaVQ+cA+D+dA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742824351; c=relaxed/simple;
	bh=0gBQvoWNbPV8R1XE5aFQgAXlTo/KN58aWfA4fs/7tHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MieLt5dGcuolYmLg7OBPP4s+NFRK8xv//JedtsaYOJAhuRO4qX4JlW0TmpuwY7k9dRnis3Uu0jUeHeu8FNbkLsQNcnnImxFdWvPyR0KGuFaDcHxKMYP8dUnvjZ4V2HMR4KbaWPY7x5jkrfkuT7JcOjKye4l6e9KhSUPs2w57ZYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aaYO7qAx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7D5C4CEDD;
	Mon, 24 Mar 2025 13:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742824351;
	bh=0gBQvoWNbPV8R1XE5aFQgAXlTo/KN58aWfA4fs/7tHk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aaYO7qAxqSfa8KGnSaEOYQGXvH9vF/1jAdLpTwewPz9AN5LlXbDtLlLc4G1IJsYLY
	 pQjlq7F2qJrOk+m4/Qp0VAQYuYb6oGZPXz9/+o7r+OmZ9XhGrDOjxhZ4+tYrJXmpMf
	 sbyN17sf4B5GTeWRkkhDI55I/AKqDVX5xdcaPQTyAv50rQ+WM/ACIBK+ffHECbzTTA
	 ugtnFVnnvMr3Wtlr3dMSdcUS9yBq0l8y4DpIt2C0v8XSPkmCS1hqDnHxFTvU7s83Jp
	 94upFKCdkjWyjlQvCICm957bqkhJ6BJTzfvezEiNITQFddhkrkOZ6qsgxdyOeCYUcb
	 ECKJer3EWvQ9g==
Message-ID: <4234995e-69cb-4112-9fe8-63c2d1ab418b@kernel.org>
Date: Mon, 24 Mar 2025 14:52:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/18] dt-bindings: media: coda: Fix resets count
To: Sergey Khimich <serghox@gmail.com>
Cc: linux-media@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
 Vladimir Yakovlev <vovchkir@gmail.com>, Maksim Turok <turok.m7@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
 <20250314152939.2759573-4-serghox@gmail.com>
 <3c85ee34-2e64-40aa-8398-675bcaa92b10@kernel.org>
 <CABd6DqVZiW4ybyfBi4qgkP7RjRLpaAc4G1n+nBJzTW8fLh3sVQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CABd6DqVZiW4ybyfBi4qgkP7RjRLpaAc4G1n+nBJzTW8fLh3sVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/03/2025 14:46, Sergey Khimich wrote:
>>> diff --git a/Documentation/devicetree/bindings/media/coda.yaml
>> b/Documentation/devicetree/bindings/media/coda.yaml
>>> index c9d5adbc8c4a..3cb0e9afc100 100644
>>> --- a/Documentation/devicetree/bindings/media/coda.yaml
>>> +++ b/Documentation/devicetree/bindings/media/coda.yaml
>>> @@ -60,7 +60,7 @@ properties:
>>>      maxItems: 1
>>>
>>>    resets:
>>> -    maxItems: 1
>>> +    minItems: 1
>>
>> No, this must be specific.
>>
> Here I can suggest the following patch with adding standalone (without a
> SoC-specific fallback) definition of coda980 codec:

How can it be used outside of soc?

> 
> @@ -30,6 +30,8 @@ properties:
>                - fsl,imx6dl-vpu
>                - fsl,imx6q-vpu
>            - const: cnm,coda960
> +      - items:
> +          - const: cnm,coda980
> 
>    reg:
>      maxItems: 1
> @@ -60,7 +62,15 @@ properties:
>      maxItems: 1
> 
>    resets:
> -    maxItems: 1
> +    if:

There is no such syntax - see other files or example-schema.

> +      properties:
> +        compatible:
> +          contains:
> +            const: cnm,coda980
> +    then:
> +      maxItems: 2  # CODA980 supports 2 resets

Still not specific - you need to list the items. See other files.



Best regards,
Krzysztof

