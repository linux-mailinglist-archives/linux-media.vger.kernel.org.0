Return-Path: <linux-media+bounces-8604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F3C89814A
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 08:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1722C1C21576
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 06:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3564C634;
	Thu,  4 Apr 2024 06:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YAgLNSig"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673E347796
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 06:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712211356; cv=none; b=sEjxMdb9jud8kC9dmWYxamcEN9kZ5mQZvfcxtXAEosyY60DG2OpyPyQUdtW0S/Lv1bJ934S9pJA2lgncS+GUuaEHF6fER1r7eOlwwqgfka1lidd8ZJ4AhsqUiLyJOa75+yfCsK3oYy7v8lVEjGvugYoqPVmwVY+rSo9jH1RMPyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712211356; c=relaxed/simple;
	bh=oEfmaNWz0Z/HE/GpBGwT412D1LQTjGwAgrYN+Del55M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UksUJwB/uGkTbsT6n5B3b9wIht8xgTitNk9ElKQrubs9YLm78PwmoW2IWRy9JH3gc9G0Ggv2GpI0k3peRwYxw8AxjQhMxprqIcXXrLgNeEVNTbYX1fQ6NZD+RsoDBs/onwhwFQP00jdhZm/sjiQTJwaTwmAXB/3nGC/oBxzBlEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YAgLNSig; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56e0f8480fbso565581a12.1
        for <linux-media@vger.kernel.org>; Wed, 03 Apr 2024 23:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712211353; x=1712816153; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bkkryztGvxqua4G6Yd1fhJtXsUUxe+HUuwQ8GN8ouqc=;
        b=YAgLNSigoKeywtPTAlXlJ99hECTa9+fjbY7QQ4dcm/CY+iwnAyGjgU9zmHOwS8bHMK
         T29chX/qVYPWdQSD8APel2Xo5Ul/KV/tDKs71AEzS+07cEgPfZd4F8+LOtZUlmZTRyRw
         uUs2UZr9mdSUIkIK3xTrn1iWeT4Nps1Bm/GWikGip/Irc0KSHXL763DCj0OpxoyaJSla
         USTGSXt7uG920c3KkujD3GNe7t9g9h7bSq0x+/RjzKGwanm4yl8ZJQ6S5gbL5JDjC9Bc
         shgE3U2zuL1VibMGWCqvEppZjz15nXnVUQtkb7AUq3zNsv4gnlwz5oQFF5v1mtZXpr20
         aVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712211353; x=1712816153;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkkryztGvxqua4G6Yd1fhJtXsUUxe+HUuwQ8GN8ouqc=;
        b=xDGmrkIpxz/372S9twNSY5opT3L1JHQXNyCYVFaqwhaMPDMy2pCGteInKbdbls9MqM
         9isn8KDatkplbWufm/EolNUAnhd88eov26nAwZs7Klw+z40lOFZz9t51PRF0Y5/dskcH
         YObkxz6SdRWt3y6vi3XBnsfq7fbRBR09yVQuCovWJ1PEYR4TRYQAD9AKuaXuhRbLNiKD
         LrIbHzVBSNe4PkOVKFJR2nVjCzdQfVMnHg8lrKrUFDfn8c+EwnRA7hq8U61JnDNGdtFC
         wz/nWgo+Aq+qMPg6VCBNeWHq5Ix9M6dbrmm+fmSObUX8dWevdJcX50QwC2xuXt/NqSwg
         yi/A==
X-Forwarded-Encrypted: i=1; AJvYcCWzUqVyQ0wRGrSbPoB3vi51yjHOwZszcuh5nPG5OZn10SVjk8ZlgKfosrUINxoI0PklPJjxzcR4iPur2Y9+Ggc3x30gxhkrj33IDuo=
X-Gm-Message-State: AOJu0YzvbUgMz9XGde1X4Nhxa0UMUFk4flnCQdD/EnKJrvNgxy0wy5Zr
	1oCJ96kRScxrfV5TcQD9lc1tBowwBrZki4KiM+9EIGybkPEkmEm9uWIVjzFEeYs=
X-Google-Smtp-Source: AGHT+IECxEGe1zWvmCgAOpHAIAYRCeDTejPuXOKuqZUxaRFgNCPybdhXgvVdvf3cPcwAdtHZQFMMaA==
X-Received: by 2002:a50:cd4e:0:b0:56d:f637:451c with SMTP id d14-20020a50cd4e000000b0056df637451cmr805971edj.32.1712211352779;
        Wed, 03 Apr 2024 23:15:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id m7-20020aa7c487000000b0056bf2e2c898sm8832781edq.1.2024.04.03.23.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 23:15:52 -0700 (PDT)
Message-ID: <c790c8ba-a9bd-4820-8084-1294e5e523d9@linaro.org>
Date: Thu, 4 Apr 2024 08:15:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Add Synopsys DesignWare HDMI RX Controller
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Shreeya Patel <shreeya.patel@collabora.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 shawn.wen@rock-chips.com, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm@lists.infradead.org
References: <20240327225057.672304-1-shreeya.patel@collabora.com>
 <35f774-660d3b80-3-513fcf80@97941910>
 <86150c89-11d5-4d52-987e-974b1a03018f@linaro.org> <3049149.687JKscXgg@diego>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <3049149.687JKscXgg@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/04/2024 00:48, Heiko Stübner wrote:
> Am Mittwoch, 3. April 2024, 13:24:05 CEST schrieb Krzysztof Kozlowski:
>> On 03/04/2024 13:20, Shreeya Patel wrote:
>>> On Wednesday, April 03, 2024 15:51 IST, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>>>
>>>> On 03/04/2024 11:24, Shreeya Patel wrote:
>>>>> On Thursday, March 28, 2024 04:20 IST, Shreeya Patel <shreeya.patel@collabora.com> wrote:
>>>>>
>>>>>> This series implements support for the Synopsys DesignWare
>>>>>> HDMI RX Controller, being compliant with standard HDMI 1.4b
>>>>>> and HDMI 2.0.
>>>>>>
>>>>>
>>>>> Hi Mauro and Hans,
>>>>>
>>>>> I haven't received any reviews so far. Hence, this is just a gentle reminder to review this patch series.
>>>>
>>>> Why did you put clk changes here? These go via different subsystem. That
>>>> might be one of obstacles for your patchset.
>>>>
>>>
>>> I added clock changes in this patch series because HDMIRX driver depends on it.
>>> I thought it is wrong to send the driver patches which don't even compile?
>>
>> Hm, why HDMIRX driver depends on clock? How? This sounds really wrong.
>> Please get it reviewed internally first.
> 
> For the change in question, the clock controller on the soc also handles
> the reset controls (hence its name CRU, clock-and-reset-unit) .
> 
> There are at least 660 reset lines in the unit and it seems the hdmi-rx one
> was overlooked on the initial submission, hence patches 1+2 add the
> reset-line.
> 
> Of course, here only the "arm64: dts:" patch depends on the clock
> change, is it references the new reset-id.

Wait, that's expected, but it is not what was written. Claim was HDMIRX
driver depends *build time* ("don't even compile").

> 
> 
> Am Mittwoch, 3. April 2024, 12:22:57 CEST schrieb Krzysztof Kozlowski:
>> Please do not engage multiple subsystems in one patchset, if not
>> necessary. Especially do not mix DTS into media or USB subsystems. And
>> do not put DTS in the middle!
> 
> picking up your reply from patch 4/6, there seem to be different "schools
> of thought" for this. Some maintainers might want to really only see
> patches that are explicitly for their subsystem - I guess networking
> might be a prime example for that, who will essentially apply whole series'
> if nobody protests in time (including dts patches)

There is no school saying DTS is allowed to be in the middle.

Other schools are indeed saying that seeing DTS is good and
recommendation is to post it separate and provide a link. That's way you
avoid DTS being pulled by Greg, media or networking.

> 
> On the other hand I also remember seeing requests for "the full picture"
> and individual maintainers then just picking and applying the patches
> meant for their subsystem.
> 
> The series as it stands right now is nice in that it allows (random)
> developers to just pick it up, apply it to a tree and test the actual driver
> without needing to hunt for multiple dependant series.
> 
> 
> Of course you're right, the "arm64: dts:" patch should be the last in the
> series and not be in the middle of it.


Best regards,
Krzysztof


