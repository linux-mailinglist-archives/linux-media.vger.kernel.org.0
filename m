Return-Path: <linux-media+bounces-19246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 808649947F1
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 14:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD2B0B21B7E
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 12:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A41618CC12;
	Tue,  8 Oct 2024 12:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iiUSYOKU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD7D1D8E1F
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 12:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728388874; cv=none; b=ceh8CR6nDAbg9YDLiEwLlsq7EvN4S09sVWf1pzQ2vwZ5MefaLHTEWrazQV3uTkKz9U0d4RWYnMmaBaS+W8RvYYYnSUdbAvxMrqmxLzFoa/R8IGZMWjF4xKX7nauh8cXJYJ9agfKy/irg0JVRF1k3v9nR0gFqOmPY1VKhc2pYwDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728388874; c=relaxed/simple;
	bh=dQLhmUpU45I7aRkJ2VBRsu5lpPpYcrysghoaT8VNp7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MA7lO5BGOfxrA4ff+JMXb4AFCmeH4+dDyLAueYknFxOUlhf5da7qUyK8zhlMwSYxURtTdaEdLOTsaYmAkxA61KhjAr0L7JgHxH933YXjHBCsTziPttcdI58u2BZkGTghUGr0KLx6xKkMLPHf+RGcgpYbqJuBBrb2V7z2oxWUp5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iiUSYOKU; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43052b41f25so989215e9.3
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2024 05:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728388871; x=1728993671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G5VwymyICaX2n22SndI8WND7u4WXV+b/j1GxtQSLhfU=;
        b=iiUSYOKUHpS6UF5HQEJOrRWnpqLo26NYe2469wjnqfS0CKlcZR8uhwH0hqtevjcBaH
         f4eH+Tejh4Rj2etc3R5ZzzApn4WBfeJqqGUlumSKMQZFF7efNwV2Hjh/8B2HXTd/6qr4
         a20LfAviCMzTJwSn8pZAckH3iub3FVzOPG7dCqsw4y27V7lTq/80Mb/D0iyF0atl1zm7
         p0dSojfISZgVgN03PY+sZh2CQZFLCLUlKPkkxRU3JVoBxAS7CTc3qlJbVxZtTsbXBszJ
         MWY9Q7Mi4LNuigibzYlTeCU2gl+wrKDExxutXE3/BPRZk/PlFup4oLfV+6hjACZbhA21
         jLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728388871; x=1728993671;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5VwymyICaX2n22SndI8WND7u4WXV+b/j1GxtQSLhfU=;
        b=JqH+eWP7jUJtDxconlWkp7/ug7+sFEsgA8lUcrG7qP/oScNtZ2eJSSimmal1VNrmS5
         f9wcLxINazDh7pYuGrg1XWxuQrLeXKIiD7mtvK8v81ltaaJDpk7arMoQLXfKfPQjyT3g
         JcpiIBPDImBlG6qnqzYNojEYGELpPyiBOh9mYA40z0vviw1PApycZGPb82vKN6+0L/9s
         MiRzKH5liQXFuctf1mZ/7JL7qHqEAIG6qNGMekC1656tWc/fMSjdmQ32N95lp19evv4X
         f4Mwc1UleFTLRoCpmeCivYCqfBoW/+6lZE/zDMcxLSOxwiYKVJTYVDjSZ/ZdGMfPSJIh
         oZng==
X-Forwarded-Encrypted: i=1; AJvYcCWLtHZmot4cOGJusC+IgGxyC9CpF8IZqgMYXbtv2LodXmPwD1GL9Ud5pB24FEkPPceznFanF5lCkoxdFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwY7F85YoKLKNTM8gE04Zthd/nOCPSOH4/J+1RKHBd72fJx6ykz
	t4ahYo0rRGfLbk4a72pY3Dv/UFaeZNlv+fBxuACKD6xHCnYb9yeInTsylasT6PA=
X-Google-Smtp-Source: AGHT+IEt+0Pd+otpiZGUtQD5oAkr6HJCAjuJrUDBmz+bHPPr0CoOyWjOIFwxwZwRuzBAA9GJR1OfBg==
X-Received: by 2002:a05:600c:4fc8:b0:42c:ba6c:d9a7 with SMTP id 5b1f17b1804b1-42f85aea5fdmr53444575e9.4.1728388871132;
        Tue, 08 Oct 2024 05:01:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d376009a0sm354873f8f.88.2024.10.08.05.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 05:01:10 -0700 (PDT)
Message-ID: <8aa5135b-386a-42bf-923b-6ff999694da8@linaro.org>
Date: Tue, 8 Oct 2024 14:01:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: media: qcom,sc8280xp-camss: Fix
 interrupt types
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
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
 <27f39cda-932c-4b79-84d4-be78d266ebdf@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <27f39cda-932c-4b79-84d4-be78d266ebdf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/10/2024 13:50, Bryan O'Donoghue wrote:
> On 08/10/2024 12:37, Vladimir Zapolskiy wrote:
>>
>> I don't have access to datasheets or hardware of sc8280xp powered board,
>> someone may either verify, if CAMSS level high type interrupts are
>> supported/working at all or not (obviously its current presence in dts is
>> insufficient), or check the SoC datasheet.
> 
> I've tested both as was submitted and your change.
> 
> I _always_ test my patches. I'm not sure there's a datasheet which 
> spells this out to be honest.

Datasheet, HPG, interrupt list in the IP catalog. They all might provide
some hints, e.g. recommendation.

> 
> Rising or High can both be justified, its really down to how your 
> interrupt controller latches the state change. However I personally am 
> fine with the change you've provided because I trust it fixes an error 
> for you.

That's a GIC, right? So most of the GIC interrupts are level high.

I can easily imagine that 10 years ago one engineer made mistake and
wrote camss downstream DTS with edge and this kept going, because
"99.999% it works" and no one will ever hit that 0.001%. And if it is
hit, we blame something else because debugging is very difficult.

If this entire patchset is based on downstream driver code, not
datasheets, then it should be clearly explained in commit msg, not just
"The expected type is...".

Why? Because "the expected type" means datasheet or some hardware
engineer says it, not driver.

Best regards,
Krzysztof


