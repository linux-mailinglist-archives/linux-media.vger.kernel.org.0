Return-Path: <linux-media+bounces-20599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D170D9B6593
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 15:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87CBE1F2146E
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 14:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFF11F131B;
	Wed, 30 Oct 2024 14:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rhHJUZxk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B3B1EF0A2
	for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 14:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730298005; cv=none; b=g1JRs25ZcCXVQ4L4BGyR1eThv9BOv+HmP46ZJY3VlvNsniCaUbJcguIlGT1WjIyScG/32uEmcXe1Q9ZSbaNLKZ4VIrW+C4rEWtiPrt2GuDVekzXo5HwuxU9d8EmAMwh1UZvGGQauOB2l6ScjRsG6/2QQIwOlQpRmnqJOf+YnfeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730298005; c=relaxed/simple;
	bh=9n2Cu2ePch2ms0FFl3bNeigfT6SNUlw7Zpv8Px6XQpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sf+pMEO5tyAdup0WT3wgGDv6FHaizmmFCYT5GkYJhXPlcj8vpLnF4tzkQnIRWv7+spGZR/5aQHauUAFQDjDep2ZeeZmGWO5YR9jZUh4Uu4q/Mk8VPBzAiG7rr/KPZX8tHILDHm6/xhkT7bKb0I2eYTpcgOZKSFRdRimA9RDA67g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rhHJUZxk; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb514a4a8aso2880561fa.1
        for <linux-media@vger.kernel.org>; Wed, 30 Oct 2024 07:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730298001; x=1730902801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=82rcCu3gIrKY+PHZjdj2CrHmVabjaVjth3BNggh+O6E=;
        b=rhHJUZxk62ItStkZHHfKuQ4JMWGWrJZ6ZhFGfuUijUgIToz+3Tecfsw16HzYtfqw9M
         7ri4KXqRmoBLk4uykBDAEqfT0iDZVJ9b2M0+hb9SdrR1cNkpgf9kpAMnAhwzd+J/2IUL
         fOtwtOLGAgpb1KX1yRHucP2+FHOwYdJlgXPsoJlaiyYD1EbEvjCiPuHZEQHkbKxEgAuc
         1EOpljKAxGVbK1JJ6LzKy/xkXxlloB8l1nfRQo+3hcMpdqXSrPLHBohpySyuROj5EYJz
         /iUY+Qz7vFJYba0cNNaf8I2QhmTYbx1kYGcVJbAUMBYsoPzf2UR0BnrNTgkbK04OQ4gr
         1oLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730298001; x=1730902801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=82rcCu3gIrKY+PHZjdj2CrHmVabjaVjth3BNggh+O6E=;
        b=MEwMCkH0ITcbReM6ymQaAeVaR7XltLz2MFuJN0QIh/f3F7V8wAIRaFjKHaatA31PAD
         FjQPHjAmPLmfSkC5vQOYTdm0UBRSZtV8Z6HcIghTdhVzXMmcB8/XjJgc8rs2sbu4hn++
         8q4U+bVM0ihD8i9wETa5rbizb38kLfE0YH25EMVYQut4kyzkDwS/WrqP0KRfesJAEdGV
         VvoDoxKT42SaVWlBqG+1q78fQ4h2+kp5v22yeuznKUtBc3QU+GPjjdeDSTFlZ8N0Vb4L
         Yvf3Ho9azq0VnlDCQlGVGeLETnl0nsj10L6x08NRmM+RbcWtkoyNMo9LFp0dvMJLXu2W
         0bkA==
X-Forwarded-Encrypted: i=1; AJvYcCXnpZeaI2DW9hrzjB4sjIY2dgmYoNqv4/A+5WAGHwfeQhPyHAxwlLKbLQRtmBYnZNEUkSIt6YReop14ig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj6DfZEjTLTTtnAyLOuNbAwJ4SQS99zgTx6MqRZisy6zf+UBZ2
	9ABuEvM6tI4M2d2lKYsk4zm+6lNIxkEVIDH56WwGBPi6yc7Fq6esy/AvbRsF1s0=
X-Google-Smtp-Source: AGHT+IGAwh7DR+FhZ+SEOUWTA1tmk1Cae59Xk7puiy28TdTltwsTlj5fX0YOP2ApRqJs509g0czV0w==
X-Received: by 2002:a05:651c:50f:b0:2fb:5a45:f8ab with SMTP id 38308e7fff4ca-2fcbe10d243mr22880251fa.12.1730298001069;
        Wed, 30 Oct 2024 07:20:01 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fd4ae6f782sm2836901fa.20.2024.10.30.07.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 07:20:00 -0700 (PDT)
Message-ID: <ca89bbae-193b-4636-b1a6-ff0c9cecae58@linaro.org>
Date: Wed, 30 Oct 2024 16:19:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
References: <20241011023724.614584-7-mailingradian@gmail.com>
 <20241011023724.614584-9-mailingradian@gmail.com>
 <785c82d5-549d-454b-86bf-a00a39e6f521@linaro.org>
 <a230de8f-a11d-41c1-9bc6-7e06e850b51d@linaro.org>
 <20241011144129.GA2295617-robh@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241011144129.GA2295617-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rob.

On 10/11/24 17:41, Rob Herring wrote:
> On Fri, Oct 11, 2024 at 09:31:06AM +0100, Bryan O'Donoghue wrote:
>> On 11/10/2024 08:14, Vladimir Zapolskiy wrote:
>>>
>>> Two most recently added CAMSS IP descriptions (qcom,sm8250-camss.yaml and
>>> qcom,sc8280xp-camss.yaml) do implement sorting by reg values, I believe
>>> from now on
>>> it should be assumed that all subsequently added CAMSS IP descriptions
>>> to follow
>>> the same established policy.
>>
>> My preference is sort by address not sort by name => we sort the device
>> nodes themselves by address so it seems more consistent to sort by address
>> inside of the devices too.
> 
> Strictly speaking, the values of addresses are unknown to the binding,
> so you can't sort by address. However, if something is truly a single
> block, then the offsets are probably fixed in order by offset makes
> sense. But when a block is changed, any rule on sorting may go out
> the window since we add new regions on the end.

Exactly, and this is an argument why the sorting is a subject to a device
driver policy, kind of any sorting order is equally bad. Sorting 'reg'
values by addresses helps to avoid a notorious problem with unit addresses.

> This one in particular I have to wonder why csiphy is not a separate
> node.

There were dicussions about it in the past, and kind of enforced outcome of
the discussions is to keep all CAMSS IP components together under one huge
plain device tree node. I personally dislike this approach, but obedience
is the way to get things merged.

>>
>> Which means sorting reg by address and irq too.
> 
> IRQs make little sense to sort IMO.

For all non-reg properties with a present *-names property the sorting
order should be done by *-names property. Only 'reg' is very special.

--
Best wishes,
Vladimir

