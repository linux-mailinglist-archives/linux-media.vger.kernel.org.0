Return-Path: <linux-media+bounces-45107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A88BF520D
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 10:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 393C43A7B65
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 08:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2882E9EDD;
	Tue, 21 Oct 2025 08:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DQgfuRP3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FB32EAB7D
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 08:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761033640; cv=none; b=BFIPgw2+UJvGD1jHBNmNyK12Zo55fLbQOLiIGg7FAeLeYbcwZcX05BD4F9TkjbLNs1sW1VqfAP6B3P2P/fcARgmEqOfFwcNsyhSzEhufEB6HgvfBMrZF0OIZLgrC7+ce86uHkCE1g1TeFaSmnQ8jP02qlo2aF6lgxuUGsl1FBkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761033640; c=relaxed/simple;
	bh=as74uJHWhlreB0WiQygF1rJw2SEOj1ZJMrc9Npm69Rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XTjWXbcKJz24kduo/lPFHQJapkiT3g7YJ1KdX5gPhTy0dFG17lwQoEUqYaksM46YmgheKH2Z3q+CmgJPr90d1x9ZP7miEvVuG1qRADeTUmNPwzXnFj3bN4b9qlCsJZfMd3jnMj2TLfJe8h3XNRtfWguR6JF799Uxqik2fiq6yRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DQgfuRP3; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3615d93c3d1so2628891fa.1
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 01:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761033637; x=1761638437; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qHJVpyvcNiLDFs3rrvWmc51XDnNs0OU5eRzngg6P+g=;
        b=DQgfuRP372qyiPufz0tc0SaIRY5KGbb9HXNOue2PLVW/fJX5nwUiVT9JK7Wa70S8YZ
         cYWC1rME4cCdWvcNOiUHSNfukP98GhfdOG/GFAGQMdARJj309DXe0/YLerrkfBSBnHu4
         npLjngzHJnp2KTYFsc4N13wag5OX9SqTZMKD1v5e4/j/W3Ahen/QSf4zFVKHBRDafZUy
         SU3fBnA2WIgCCtPzOAxXJcBJ4Aw+HDUApbHBg89BAxKq7HnsK7NfJiMMg5+6xZ9h+YFs
         hb48lsJesDFqoWmvSD6LZNTkNNOcuQ2SYuiazKuCeXaYs1BXY1JWg9Go8F1U2Xrm08f6
         Hfzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761033637; x=1761638437;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7qHJVpyvcNiLDFs3rrvWmc51XDnNs0OU5eRzngg6P+g=;
        b=GnBa5XkW6jnXnI/+ef7C6DODZ85Esxj4XQSWqPsExERI70BaRQHeL2pzdJPisIVToE
         ftMlfhAdDN9a6+HG5tMxCdsJzUh2rI3VYAHcDMCJgR0r0Q4oJFLbieecU3kZPIZEo1wi
         rrNvafSrydXBAma1+A40s9U2n5obCCuA71+DQWlEI6xjQZH46cwfCvUAAmDpDAsmVbj7
         h7jBDbfxoYzbgk2EWpZ49d4qVJbZ6u68Oh6VIe82cxWSaAyQYdUAlQdiCoCeNMjexqVP
         SudfSsHMs73CmfBs9joKWvmtzqWO3tq3dHLDxQ0ORlJ4gE3wKMms6PbW0E3cmSZ6uEFT
         v/OQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyvtVdWvkItK3gZo4oSwQ5N4Pp1Ui7HIcaU4tMrSsGaAE+fn+2qRKG4LWKuXme/AhGf2rw/X+iSZTU0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVOcu3iphM+QrzPMRctn8NV/jJFAnTOW8dzh8mAIYbg7EXLpKw
	gQS7uEou4rQ/2lxzVbgODwMOjAX0AR2FusbdZnvfFOyNzha+nG5lIs5RcRZY6BEOxLc=
X-Gm-Gg: ASbGnctTkXN2t99SZMXAL+RC2rNGqJz/THOnW3n9wYzpWUzjrzCIdFZXPak7VYhRsNB
	jEFr1PNZqdWiV4xkBsvO5LMpw7DOeUU10G6/eNAU8ryERdnmiUvlXvvEV6zY2JYNOzLTywAtqfB
	MsyKQJlaZxcyM7Yte956tNzClFqQMasFStdlREM+uuw8FNZ+js43GvBpLFpsOoUUgFIVWGbAGgq
	dvB1iGt8yM16iAoe2slJNm5x+tQDzy1lZ8qcR3HPObgrcOKWN/N0Mp6YlNQRzzr0QL+gNEZAxuH
	aH+O6n8BXSzYQzBq3Dt+++gd+roOzK7Sf5lcuQ8liT+qG2cXUeEhwsYGPKc4iHf+aztxibXIKpw
	Os0ZC4CmJ+BcVgRRJfK/txfaOSP7mfhVV5GLSZo+3t3Vkj9pIcI3U3CLegJUtbzKp2o8SaQCf/J
	of9YPA32AgDlEcosrgRxckOsk9cLBjhxSGUVVWH38Hq2fZJ4l3tL1g9FE=
X-Google-Smtp-Source: AGHT+IGhfokm2FvG8zqbWNf/gHXEVsdl6yYSXJ8RwgxhN/iYvU2dfv9HuK1zEz9WBIXdVY35Ka9g6A==
X-Received: by 2002:a05:651c:4098:b0:368:2cf8:5110 with SMTP id 38308e7fff4ca-37797a79fb1mr16245191fa.6.1761033636707;
        Tue, 21 Oct 2025 01:00:36 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a922c196sm27361131fa.25.2025.10.21.01.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 01:00:36 -0700 (PDT)
Message-ID: <060938d1-9c9e-4a0b-a4ca-838b4b9cfa1d@linaro.org>
Date: Tue, 21 Oct 2025 11:00:35 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: Add Samsung S5KJN1 image
 sensor
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251016020419.2137290-1-vladimir.zapolskiy@linaro.org>
 <20251016020419.2137290-2-vladimir.zapolskiy@linaro.org>
 <aPaaLZoLMH3TfyJl@kekkonen.localdomain>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aPaaLZoLMH3TfyJl@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari.

On 10/20/25 23:23, Sakari Ailus wrote:
> Hi Vladimir,
> 
> Thanks for the set.
> 
> On Thu, Oct 16, 2025 at 05:04:18AM +0300, Vladimir Zapolskiy wrote:
>> Add device tree bindings documentation for Samsung S5KJN1 image sensor.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   .../bindings/media/i2c/samsung,s5kjn1.yaml    | 95 +++++++++++++++++++
>>   1 file changed, 95 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
>> new file mode 100644
>> index 000000000000..2220b3e528d4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
>> @@ -0,0 +1,95 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/i2c/samsung,s5kjn1.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Samsung S5KJN1 Image Sensor
>> +
>> +description:
>> +  Samsung S5KJN1 (ISOCELL JN1) image sensor is a 50MP image sensor.
>> +  The sensor is controlled over a serial camera control bus protocol,
>> +  the widest supported output image frame size is 8160x6144 at 10 frames
>> +  per second rate, data output format is RAW10 transferred over 4-lane
>> +  MIPI D-PHY interface.
> 
> Can the sensor work with fewer lanes? This is almost always the case. In
> this case you'd need data-lanes property but feel free to make 4 the
> default if you like.

As usual I don't have access to the sensor datasheet, what is known to me
is that

1) there is no examples in the downstream, when MIPI CSI interface is
configured in any other mode but 4 lanes D-PHY RAW10,

2) right the same information is given in the official scarce booklet:

https://semiconductor.samsung.com/image-sensor/mobile-image-sensor/isocell-jn1/

The same reasoning as above is directly applicable to the second sent
sensor driver of Samsung S5K3M5.

There is a known practical pattern that if it happens to be of necessity
any new properties can be added to device's dt bindings later on, thus
it should be safe to omit any presumably non-configurable hardware
properties from the description on an early stage.

-- 
Best wishes,
Vladimir

