Return-Path: <linux-media+bounces-37571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF7AB03081
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 11:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51F543BE8AB
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 09:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35B325524D;
	Sun, 13 Jul 2025 09:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jbdo54Pn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7801DE4F1
	for <linux-media@vger.kernel.org>; Sun, 13 Jul 2025 09:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752399575; cv=none; b=at8CAbvVK9iCvMp16ZgVjnLumcUlkzrorHVpPd+WvnKRZ0cJWjcinFObkTpPmWptNhK77sYO0DFIj80juPdnyM77pvWmSKbnSTQLx17PzC026QA+6GVoSnEX/RCWI7iyC9EF7xcI0flHDuLRGsYhH2ScddsJR+++ZHDTF16LABI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752399575; c=relaxed/simple;
	bh=xy7Z4dB0SZnUO/TJyQTV/ZIHJ+YGQLSRSuzFwWuOJJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FkgivC0XKp7BtAU4IfWhFGFDWcNEStVZt7T5o0pcDz0oijS1seO/NtBljISEiiqIH6YTUlqioTj9nKCKjNbRfh0YNmXibfYTDLVhtVZR13qK97k6IzI9JRIqlUryHvmztch1ExGcymOSHzNn81we1Cb58IT+pJR2al89eTJoLdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jbdo54Pn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4535fc0485dso3952635e9.0
        for <linux-media@vger.kernel.org>; Sun, 13 Jul 2025 02:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752399571; x=1753004371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o2imWwtvIFUM/l/O0s1JDHC2tQgH1ev1xHjGwkKxShY=;
        b=Jbdo54Pngeo10Ji66h1B1wVrgQL6HY4ooPttvsz1tfFCZfNlkx2qtKdazgDbJzO0b7
         1o7X9Ght+A2DZciIQW4VOk9pD1MmZoNR8zS9J7JykZlnWZ6F3QmpDBUsjWERBHhT+ZZP
         Oe1mPWfV6wO3q0Qrfm0lPeJdiHfoRS+DOCcsVOlxjQbaNOLwYUJ3oLTNlA0tgDrO0JSa
         AYQMxRN7MWk0/93pKh0t/d1FWAAluCRpmHyMdjb7tD4Ts4uehDgVyUk7oMYyO3cXCo6P
         2K/A5GSGwaYRa/f1BxdozI+hlR+X020WgstXKvfo21WOo58LVCj9sJ/1wzNmHcApw9Do
         UK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752399571; x=1753004371;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2imWwtvIFUM/l/O0s1JDHC2tQgH1ev1xHjGwkKxShY=;
        b=S1pNha9Gh/ScgCT8WBa8WFexTL91I1uA3a8WJdbqgevJFLVDTTYViueZzQEoxXnnJB
         3t0Ixjbw9e/7VTmqN+ocTUgnrFlr7I7ggNzU6W/N6YICBjk8q7PsI3RB0i5nfQtWwmcW
         qdJIdfr1rIbvv0i5YIOsWamcSADhmUOaqTetb/FEN8ulZpW+mpK1WHTMwSW4/XPeAg+C
         Yszt/MXj5xtzu7bTM7BqwoW4ugXGIIIihOnGaahQI8Net9TxmKq50AZYfHA6XDuzWP8a
         hjaWe6cvN6oehq7uw7SERfPvPEJyf/0UwHHQi3ZmA4NpmlIZM4fERL0nrnefEt6/BBUR
         /Rxw==
X-Forwarded-Encrypted: i=1; AJvYcCUxads/N39lUjpjOA2LesfYwukS2ZvkCyOmeKkFyzYELMwdzJr6Q8baAFr6fanOXodR8vN/TlcPjawIfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGmCVBjWf6uiTNtN/vZ7acIEJuNMs1Z1pHqxGWgisJbnd6C2PX
	IU6iSHWjYTvMOtlArJi7gQ/taEXbWBfceEwicp5+14IPggd1SM72yd7+/8YvPeoT3kk=
X-Gm-Gg: ASbGncuvHUSxOuYx0OQe2HhWfbtwbN9rD6YhV/cIklEICJzWGpN+hztz7jqcBvNnqJ6
	ed54bYbI12tMXylZNbZqByiQb0D9Y5M28Y2pATlRAHYgmu4rcjC+zpTfAsZhLQ8MiLoY85cgZxs
	1WcdfO8+uIxv1sdUkARpLpLX0Zq7HnkVkKTlKLBt7uJ6+82TcpHrF+SpaK2ukXG9nt66nBX6waJ
	u3T87VRZjBeGrFMxVqp4es8oQ+v4Ogu94R7fbXzd1HltuHP8NOQRXebcJwfB+hBf+arKY2u+nIa
	1/K2lru0D02fHwJTLtan2Klo4eKWJZqmNLwiCrUrw/FNsP16fk0cehN8cg/IpT6Uyo8u4E5ayYv
	gDE0fgEd1ElnzKhsLyQ/S6dTQFaYL4kbFpu4tjg9L2Q==
X-Google-Smtp-Source: AGHT+IF6ORHe5JEYvPXdztAskmBBiLT4qYNeI+0/ouz0maJY1w1XXjzWo2XIGtoP1NknXRfYW7HoCw==
X-Received: by 2002:a05:600c:8888:b0:442:e0e0:24d with SMTP id 5b1f17b1804b1-455e7b68d69mr20701065e9.7.1752399571488;
        Sun, 13 Jul 2025 02:39:31 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-455f222e4f4sm58198895e9.10.2025.07.13.02.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jul 2025 02:39:30 -0700 (PDT)
Message-ID: <352421e6-f151-435b-8dce-6c02a6d0e747@linaro.org>
Date: Sun, 13 Jul 2025 11:39:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/15] dt-bindings: media: qcom,x1e80100-camss: Convert
 from inline PHY definitions to PHY handles
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-2-0bc5da82f526@linaro.org>
 <3376b0fb-f3c6-464a-9c35-30a3f589b856@linaro.org>
 <eac19ad2-78dc-44e9-bc02-517272ba737d@linaro.org>
 <3506d911-da9f-4639-9c83-aee0a637e9b4@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <3506d911-da9f-4639-9c83-aee0a637e9b4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/07/2025 11:14, Bryan O'Donoghue wrote:
> On 13/07/2025 09:20, Krzysztof Kozlowski wrote:
>> On 13/07/2025 10:18, Krzysztof Kozlowski wrote:
>>> On 11/07/2025 14:57, Bryan O'Donoghue wrote:
>>>> We currently do not have an upstream user of the x1e CAMSS schema which
>>>
>>> On first glance there is, in Linus tree:
>>>
>>> git grep qcom,x1e80100-camss
>>> drivers/media/platform/qcom/camss/camss.c
>>>
>>> If this wasn't released mention it.
>> ... and then this should be marked as fixes and picked up fast, because
>> you have only like 2 weeks to fix it.
>>
>> Best regards,
>> Krzysztof
> 
> I thought schema changes were acceptable so long as we haven't applied 
> dts, which we haven't done yet.


Accepted DTS is just one story, but following your argumentation that
docs do not define ABI break, then accepted DTS also does not matter,
because it is always in the kernel sources synced with the ABI.
Following your argument about "accepted DTS", what is different between:
1. accepted DTS, then changed DT binding and changed DTS,
2. not accepted DTS and changed DT binding?

Why can't you accept DTS and then change it?

Lack of in-kernel DTS is a good argument in your case, but you must
mention ALL OTHER USERS:
1. All drivers in Linux
2. All other upstream projects, BSD, U-boot, everywhere upstream
3. ... all possible other users of the ABI, so out of tree DTS and out
of tree kernel folks. This one is close to impossible to prove...
Luckily we assume this point does not apply here at all. No one out of
upstream trees uses these new bindings.

Best regards,
Krzysztof

