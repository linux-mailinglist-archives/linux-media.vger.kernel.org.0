Return-Path: <linux-media+bounces-32533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A6BAB75E3
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 21:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E722A3B02D9
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 19:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3045828E5E6;
	Wed, 14 May 2025 19:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fvfv43iy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FB81FCFEE
	for <linux-media@vger.kernel.org>; Wed, 14 May 2025 19:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747251049; cv=none; b=G+KyvKedYw5aEJCOmGc4pNC9txsE7ctXXqBXEnnAK/7LyRJI5nywpdWQBrzUNGDX1CRCLpTcz5JgByB8zCQjXaNOFLUgAc/en0ld/MdmTfTvtVzMJi4Hyv14Lldtg2gfz3aEh5y69aJilTdskL2vcs5u4l83id6a3OiBTWbXKkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747251049; c=relaxed/simple;
	bh=ZDw3zXdwWUjhBcMzp1OiH0fhDtsrm9j+nPvpSWy+8FY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bWN5aRGmkuoqHFHN9/CglFmh+kobNnZkdYnVDPG8oPIt2BOaZSk6ahMrgpE7g40QfSp8Qy4NPxzL5UWMhA7HjTaF5g+0yW3LF3frut1QDJNCknNkyKjFAyNbhB6oew8bwmHrLBHb/ar02PhMtt77RJ1mL99QWsBXD8y3KbMsbQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fvfv43iy; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-442f4d40152so289395e9.2
        for <linux-media@vger.kernel.org>; Wed, 14 May 2025 12:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747251046; x=1747855846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wu8CYbxrZGvQTelT4Z4uIdtuj7A0yMOmk3v2JdGPTT0=;
        b=fvfv43iyyPQBfIl2Y6vN4idk774ACI5rT+jVnLN5m64Xry4BIdcfm4LDS4fk5tv6Se
         L3kSECHZjB+A2cZrAP7X2UCfTbPQtWy4MYIXbRuTMJiPhQt3aEo9DLv6yGt8fT9fCA/2
         AMCCcbjU3n8+KoeK9LnIh7qe7epPY3VAHS3uj/o55RvE2PwKnCRZDb75IJ+Rrj3909rw
         dxs0I8zhSPGKWOdCcX3IKgJU7GbZXt3B6cZhg/qQN+5jPxJsLvuZx2NjKJc422piJ34c
         peropkix4VZ8B8UxgfS4VBt2PZEi6ovlQZCI9v5+zHShvFRepx8J4RRgxmoZlmvNTo9o
         +ZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747251046; x=1747855846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wu8CYbxrZGvQTelT4Z4uIdtuj7A0yMOmk3v2JdGPTT0=;
        b=xTP0dh/eBR57cWZ5+2tflWwJZz1yEh+JqIaVQyOIcnBIp3O+IF7YSfm3wWVdzYRnsx
         HqxCIq/86LRbtuvnM7iLPEkcYV2QfzMKwqJwBHBlAaR/2nz/+Qaj1D2KAqjDNx9vbg+i
         R+6OzHb8kVFko73j68Fr6gAKsriUZWZrpQXjSiwRF1wEWvmWbC6+VZaS4vevn8SsHV0d
         bjo2ZZkGlaX6qV+Sfykup71rGyHlec04HBbNMlcZgpjHkkswkmquw44AraZ5oFAOfwNV
         FBcvXE7wnaw99nArvKDHrxmD3+DJdYDs7fKRtCPfFgaImGaAmAoB/B2nRRoftHqseLfE
         EoWg==
X-Gm-Message-State: AOJu0YyGd5D++d/Dy1hoBiyVZeOg+I/K9MKzrdrxQo//o5JkeZ7flXq9
	GHcVoRBk+gHjlij+HSXEhATakkTGZeTAs2JC0RrhJ0p/fTUz3NBA3F1wsRY0dFE=
X-Gm-Gg: ASbGnctiJ2WoJ6JcqxoertytMP8Kz8CwMHKIn+4SpLaEfdDkkzSseW715pzPyHzj4zu
	OCmSVHlitnfcaLlDEfMAQqxOYuTYKjwdL9kNecRqEh/XBvc+AIx/+46Ip++w+wG2sMlJYVHHuyp
	OD89Vx66p6afEr8nJ1M/1eurWvh7hUm86g2jqBaEMbPXK8C78m13xezzBSLWbNH3/E3yhrc7hb5
	WjXps0woDrlJLlO3/LgYutf40iB9bcdqBqaJH+0HVWSPfGzCE7FmzkIxPE/TCWyroAd/chM1bcz
	y/lLILO3Z4oabERMz3Ny7Rfbb6YWIrhuNBdOQjkz2ZOrLt1f0CTvDYs/WL1xhHjmHLpDLtTRuxt
	Srg7lnJhrT/NHsTvA
X-Google-Smtp-Source: AGHT+IFvXW9lDEbATxNOLcqkk2qKYmb2LjJaI24O9bk39OdZTYE2y1+5m007eE4YtTFHo4ArFYYXmA==
X-Received: by 2002:a05:600c:1c8e:b0:43e:94fa:4aef with SMTP id 5b1f17b1804b1-442f21905eemr15565055e9.8.1747251045917;
        Wed, 14 May 2025 12:30:45 -0700 (PDT)
Received: from [10.61.0.68] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f33691bbsm44060495e9.7.2025.05.14.12.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 12:30:45 -0700 (PDT)
Message-ID: <634e9d0d-fbab-4101-b968-d335b656e099@linaro.org>
Date: Wed, 14 May 2025 22:30:26 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dt-bindings: phy: Add Qualcomm MIPI C-/D-PHY schema
 for CSIPHY IPs
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20250513143918.2572689-1-vladimir.zapolskiy@linaro.org>
 <959b9c65-50d7-426d-9c2a-64e143e28ded@kernel.org>
Content-Language: ru-RU
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <959b9c65-50d7-426d-9c2a-64e143e28ded@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Krzysztof.

On 5/14/25 13:25, Krzysztof Kozlowski wrote:
> On 13/05/2025 16:39, Vladimir Zapolskiy wrote:
>> Add dt-binding schema for the CAMSS CSIPHY IPs, which provides
>> MIPI C-/D-PHY interfaces on Qualcomm SoCs.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   .../devicetree/bindings/phy/qcom,csiphy.yaml  | 110 ++++++++++++++++++
>>   1 file changed, 110 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/qcom,csiphy.yaml
> 
> 
> Looks like not tested, so limited review follows.
> 
> Filename matching compatible.
> 

Thank you for the review, the change is deliberately tagged as RFC.

I read this review comment as the displayed generic compatible 'qcom,csiphy'
shall be added to the list of compatibles.

>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,csiphy.yaml b/Documentation/devicetree/bindings/phy/qcom,csiphy.yaml
>> new file mode 100644
>> index 000000000000..ef712c5442ec
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,csiphy.yaml
> 
> Please post the driver or any other user. Or explain why this is RFC or
> what you expect here from us.
> 

The CSIPHY driver agnostic CAMSS changes are on the linux-media list [1], the CSIPHY
driver specific changes will be added on top of these changes, however I believe
it makes sense to review these two different CAMSS changesets independently.

Here the RFC tag is given explicitly to get change reviews for the dt binding
documentation part, and the first user is the example embedded into the change.

>> @@ -0,0 +1,110 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/qcom,csiphy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm CSI PHY
> 
> SM8250 ?
> 

It's supposed to be a generic device tree binding, and it covers SM8250
CAMSS CSIPHY IP as well, which could be quite handly for testing/review.

>> +
>> +maintainers:
>> +  - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 

Ack.

>> +  Qualcomm SoCs equipped with a number of MIPI CSI PHY IPs, which
>> +  supports D-PHY or C-PHY interfaces to camera sensors.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,sm8250-csiphy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 2
> 
> Need to list the items instead
> 

Ack.

>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  vdda-csi-0p9-supply:
>> +    description: Voltage supply, 0.9V
>> +
>> +  vdda-csi-1p2-supply:
>> +    description: Voltage supply, 1.2V
>> +
>> +  '#phy-cells':
>> +    const: 0
>> +
>> +  port:
>> +    $ref: /schemas/graph.yaml#/$defs/port-base
>> +    description: CAMSS CSIPHY input port
>> +
>> +    patternProperties:
>> +      "^endpoint@[0-1]$":
> 
> Keep consistent quotes, either " or '
> 

Ack.

>> +        $ref: /schemas/media/video-interfaces.yaml#
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          data-lanes:
>> +            minItems: 1
>> +            maxItems: 4
>> +
>> +          bus-type:
>> +            enum:
>> +              - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>> +              - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>> +
>> +        required:
>> +          - data-lanes
>> +
>> +    oneOf:
>> +      - required:
>> +          - endpoint
>> +      - required:
>> +          - endpoint@0
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - interrupts
>> +  - '#phy-cells'
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sm8250-csiphy
>> +    then:
>> +      required:
>> +        - vdda-csi-0p9-supply
>> +        - vdda-csi-1p2-supply
> 
> This makes no sense - it is only sm8250 - so this if is always true.
> 

Ack, thank you for the review comments.

--
Best wishes,
Vladimir

