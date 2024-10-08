Return-Path: <linux-media+bounces-19249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CDC994809
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 14:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B23D1C23DFD
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 12:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589481DE2AD;
	Tue,  8 Oct 2024 12:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="giwKSVby"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC35320F
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 12:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728389201; cv=none; b=Po0GwJjpeuvvCD8SHBFBPpr8dz0AjgZf1UxhqGnPpQHgk0M3EUIgqSVQG8AfYQQU1khwSIoqRiP3g+8WxZ0AT5Hjf0iLrJivBmq1WDHb2/FGeDTE5PHfquxWA3xVQUb6yCvM3TFy/2Tc2R531ZYmJL89fzCaz6kxZqugVBniyco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728389201; c=relaxed/simple;
	bh=C9cDbrrxtx4ZmBKHBu4HVjd7F8cAetIH8uHWjTs36Dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HX+55YOmI66FfSOs9diAmyQg6Aq4pikIPb4QCuGPU62fvsetHxhUPMJHdChUL9t6OJAzMPUXX01EmZIj3KiukaHjdkCAIIpMd4BHWm5/Po3FIGEspBlSw0/69q4j+FqkpMaS7LhuQWP3UEE2XvztIKyQpvbHnU/teIJ7oLGWxk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=giwKSVby; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d37e85271so5986f8f.0
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2024 05:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728389198; x=1728993998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iGf+BR0KrrmgaGAuaJbmSqaodYMEl3pXPdxzjA7otv0=;
        b=giwKSVbyk9H6VTjwCtHv0CGAU+7xZYnVIOW5F26lcPJdq622yHrkFHsNdibwgfW4LW
         Nx0d3vh8ZYX7SqhxkyZ9nm67KV0iy41bk7jWYnmRD4mnq/UeK9Wz3rgT/LftBXMzbSgB
         T3lUCds5/fFOX7+9IZwaPNiYnuaIcD9o0/5tGMoeIdj5AQoWGV+0MD7NQh8qAOIdIkFI
         92e3oXtuYRq8VcfotVkIDLHbQQ7moPUP5FGuZP9mFQn76debE294SmWbjWGmDj8uT4XL
         nn232khdYpbaAH+L8wk2HGBo9Qj1mSlks+OjI9xCm2naLAs35cE/B86hDx8yEaIAgFAV
         MbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728389198; x=1728993998;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iGf+BR0KrrmgaGAuaJbmSqaodYMEl3pXPdxzjA7otv0=;
        b=oWGgZey0DJRNs4Bf/ekREmejpr2/Up3QnMg8ISzYxWNVkoE1KP/O1uSjU4ICph5r/z
         w22/SUbdvIOlk2BRl5+787iS0S3kBPBJBvqzmIcQpGVlNY+QEsr1gj90CEuqISYMl1Ii
         y2kxr2G4scvcHNXsynBYOHvlICZ3GPv9gs655lrtSl8m2pK1trChe2e4HPdVu46dMykG
         jsVhX7hZKj5NwmB1risTgsxzt+6KMfuUf2X8pUx576arFIJAzFFBZP4H+4ESTft2GkhQ
         7mZudd9NrBNJcS+I551dD0WfanuaQgz8LW83oioyQyoOSDAPOcn7+NdEL3IJYNf4sF2E
         FbHw==
X-Forwarded-Encrypted: i=1; AJvYcCVYx+cBqYxHYl78MUyq61VODnxHP2bgqDy2BGjfhjdgyHxrgNZzobed5dLYANGLNeRGbgtogKn7tC5wYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQo7p4PJSD59LmJ8FamZaTtaLgb9IM+11A8gaD5/Zc6/dngcbm
	L/ltrZy6/jrSjNLiR8qzlIyowoVHHBbmFzvz4yfO5fn5Lsw2La6mEvfJ1CKWfRw=
X-Google-Smtp-Source: AGHT+IETx4zJQG9Gtv9tJl5KEt3s5Nj6WvOe8z1JDWgXuG3lKhsMf0Q8IFdD+xxXTnMptWM+cE+r7g==
X-Received: by 2002:a5d:5850:0:b0:37c:ffdd:6d57 with SMTP id ffacd0b85a97d-37d0e6cc8f2mr4354911f8f.1.1728389198183;
        Tue, 08 Oct 2024 05:06:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1695ec1esm8013990f8f.74.2024.10.08.05.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 05:06:36 -0700 (PDT)
Message-ID: <268d0dd0-a65f-4eaa-a317-fe9fcc06e718@linaro.org>
Date: Tue, 8 Oct 2024 14:06:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: media: qcom,sc8280xp-camss: Fix
 interrupt types
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
 <20240923072827.3772504-2-vladimir.zapolskiy@linaro.org>
 <datahu33nmsser2p4fb2hyncsujtkwaca377ivwmpc6yj2naut@2sjsbebfm3gf>
 <3f87e855-8779-4df3-8f26-e3d2b611d3e9@linaro.org>
 <313667a6-afcd-44cb-a6f6-0d550e8f68a0@linaro.org>
 <4bf490cb-228d-4f01-a956-cacbafa94e2a@linaro.org>
 <5ea36051-1e1b-44ca-b5ef-d6305079201b@linaro.org>
 <80744e19-71f8-4ae7-b2e8-1dc14e55385c@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <80744e19-71f8-4ae7-b2e8-1dc14e55385c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/10/2024 14:03, Vladimir Zapolskiy wrote:
> 
> 
> On 10/8/24 14:45, Krzysztof Kozlowski wrote:
>> On 08/10/2024 13:37, Vladimir Zapolskiy wrote:
>>> Hi Krzysztof.
>>>
>>> On 10/8/24 14:15, Krzysztof Kozlowski wrote:
>>>> On 08/10/2024 12:02, Vladimir Zapolskiy wrote:
>>>>> Hi Bjorn,
>>>>>
>>>>> On 10/6/24 05:36, Bjorn Andersson wrote:
>>>>>> On Mon, Sep 23, 2024 at 10:28:22AM GMT, Vladimir Zapolskiy wrote:
>>>>>>> The expected type of all CAMSS interrupts is edge rising, fix it in
>>>>>>> the documented example from CAMSS device tree bindings for sc8280xp.
>>>>>>>
>>>>>>
>>>>>> Who/what expects them to be RISING?
>>>>>
>>>>> I've checked CAMSS device tree bindings in a number of downstream kernels,
>>>>> all of them describe interrupt types as edge rising.
>>>>>
>>>>> $ grep -Hn IRQF_TRIGGER drivers/media/platform/qcom/camss/*
>>>>> drivers/media/platform/qcom/camss/camss-csid.c:619:			       IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN,
>>>>> drivers/media/platform/qcom/camss/camss-csiphy.c:605:			       IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN,
>>>>> drivers/media/platform/qcom/camss/camss-ispif.c:1164:			       IRQF_TRIGGER_RISING, ispif->irq_name, ispif);
>>>>> drivers/media/platform/qcom/camss/camss-ispif.c:1168:			       IRQF_TRIGGER_RISING, ispif->irq_name, ispif);
>>>>> drivers/media/platform/qcom/camss/camss-vfe.c:1327:			       IRQF_TRIGGER_RISING, vfe->irq_name, vfe);
>>>>
>>>> Downstream has a lot of bad code, so I am not sure how good argument
>>>> this is.
>>>>
>>>> I acked the patch because I assumed you *checked in hardware*.
>>>>
>>>>>
>>>>>    From runtime point of view it's more important to get re-probed camss
>>>>> driver, see an absolutely similar and previously discussed case (in the
>>>>> cover letter):
>>>>>
>>>>> https://lore.kernel.org/lkml/20220530080842.37024-4-manivannan.sadhasivam@linaro.org/
>>>>>
>>>>> Now in runtime I get this error, it's easy to check by unbinding/binding any
>>>>> camss device:
>>>>>
>>>>> irq: type mismatch, failed to map hwirq-509 for interrupt-controller@17a00000!
>>>>>
>>>>> Basically camss devices can not be bound on the second time on the
>>>>> number of platforms touched by this changeset.
>>>>
>>>> This is solveable different way and I do not understand this rationale.
>>>> The driver should not request trigger type but use what DTS is
>>>> providing, unless of course only one valid trigger is possible.
>>>
>>> Right at the moment the driver uses rising edge type of interrupts, and
>>> it works properly.
>>>
>>>> But so
>>>> far you did not provide any arguments for this. Downstream crappy code?
>>>
>>> Downstream code works, that's the argument to support the change.
>>
>> That is not acceptable argument. If downstream has a bug, but somehow
>> works, you will implement the same bug upstream?
>>
>> Downstream is well known of shortcuts, incomplete solutions and crappy
>> code, which passes some tests but might not be really correct.
>>
>> I understand that downstream can be a supportive case, but not for level
>> of interrupts! People, not only downstream but it's even worse there, do
>> not see the difference between level and edge, between GPIO ACTIVE_HIGH
>> and ACTIVE_LOW.
>>
>>>
>>>> Nope. Existing driver? Same.
>>>
>>> The existing driver works, that's the argument to support the change.
>>
>> We are not going to get into such discussions. Code might be incorrect,
>> but mostly works because race issues are very tricky to spot, yet you
>> use that code as argument to say hardware is like that.
>>
>> No. Hardware is not because driver is written that way.
>>
>>
>>>
>>>> Was anything here actually checked with datasheets/hardware?
>>>
>>> The initially open question is unanswered, why sc8280xp CAMSS does
>>
>> This is about all CAMSS, not only sc8280xp.
>>
>>> specify interrupts as level high type, was it actually checked with
>>> datasheets/hardware, as you say it? It has never been tested by anyone
>>> and anywhere, downstream or upstream wise, only rising edge interrupts
>>> were tested, and they do work.
>>
>> I did not ask about testing. I ask how the manual, hardware engineers
>> designed it.
>>
>>>
>>> I don't have access to datasheets or hardware of sc8280xp powered board,
>>> someone may either verify, if CAMSS level high type interrupts are> supported/working at all or not (obviously its current presence in dts is
>>> insufficient), or check the SoC datasheet.
>>>
>>> To sum up, the intention of this change:
>>> 1) fix the unpleasant runtime issue with no regressions (it's been tested),
>>
>> Did you test races and all the tricky issues arising when you use
>> incorrectly edged interrupts? Or you just checked that "interrupt works"?
> 
> Right from the beginning and any other day CAMSS interrupts are tested as
> rising edge interrupts. So, I don't undestand your point here, please
> elaborate.

So you did not test whether these are correct interrupt types. What to
elaborate more? You have very tricky race condition, for example, so you
test that it is not possible.

> 
>>> 2) align CAMSS device description in firmware with known to work well
>>> IP hardware configuration.
>>
>> Where is this description in firmware? Where is this IP hardware
>> configuration? You just said it is purely on downstream driver.
> 
> CAMSS IP configuration, in particular interrupt type, is done by the
> upstream driver, note that the fixes in this changeset is also sent
> against the upstream driver, tested on the upstream driver etc.

What does it even mean? You said "device description in firmware" and
"IP hardware configuration", but now speak about drivers.

Best regards,
Krzysztof


