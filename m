Return-Path: <linux-media+bounces-28067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23171A5D21C
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 22:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3FF61899B06
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 21:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53DEA264A94;
	Tue, 11 Mar 2025 21:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M/4EFY6c"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D4326139C
	for <linux-media@vger.kernel.org>; Tue, 11 Mar 2025 21:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741730214; cv=none; b=Wp46v2cPt52XXcA0xvGPFKdR99QD4LlwhJuKnso+tdclAEz2R0YQySCBON0MRZVf1AGP50hPh41kh+ZSll9ueYj+SQKKzKJPULN8ytxMvqdvbknhLvkkyGl8zONyBsQGwDT/rt2GplJQpDUwAo1vgP5VMvckwkiVj6nLd4A8eZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741730214; c=relaxed/simple;
	bh=avNY8ak+JQWmkFVsZS0aeZyCgTV7dWit3U7qT7O+ZI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X0hSzErpdoNwpPMdX12TrTe4Znyih6zwvWYGQXAJxUH2UgQu7hK4lj16iiwK7lMKycTbFRBVo+CdDl+9Qayn0vbk3nL7Bzhf8jiYE0CwrVgy67j2kdey6EZNOl1IjQ5CeNw55HvuALvM8IUDyIyOVVH0/6SHInItl0g/qMjsTDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M/4EFY6c; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bfe08889fso2615351fa.0
        for <linux-media@vger.kernel.org>; Tue, 11 Mar 2025 14:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741730211; x=1742335011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qXfL2talT+3Pc3/IEr/DhQxuVz1xDl6VWwKjRxG3X98=;
        b=M/4EFY6cIVYvdw2LILkLrz9hi5jz+hEd0WxqKe2+e2uXEhWds1c8wNc2TUGmnDd3F8
         bvF+yC8mu3usy+jlHfhVXFZF+Smn4TSKgjHxWS7xgfJC/msJ7kJoamlnTfhDziUUPCe5
         njbxjOMWOc84SrvU9qwyrO4/rCZ1moRke350leqQ2147BDUlevwfTEMyP43eKyVrLlPA
         LDUEalgs8XfrRcYrlJulv2k77ZUSeXlGPzO9d+ImhM+ca2U+OePyOZ8GK3dLsTGrp9Se
         nM3KAXw3aMM+jc/NpoIavEonN/HT32Nl8gUuAr6i6r7eI3G3LktTTa77Gh7HGIWKeXGe
         Q4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741730211; x=1742335011;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qXfL2talT+3Pc3/IEr/DhQxuVz1xDl6VWwKjRxG3X98=;
        b=PdNPlM04yZlBse51n28zKYEYePA+/f1hNmtOVXzEJZDN94777EL3BmxZjfCdN8e0kM
         U6RiQfZVVlxG0oLqC5av23EdmM0jRzE0BtNyXKjOlgKgXdbhSMyw2ztKckwasbHkn5je
         u7hVM0lStGde7aYucqDRlFLMo9ODGakY8nFSqTFoGExnaTHaI75Ay00gX4Xkbsde8jvH
         eDcXEoQpPCNiPgAD5jPYKhKrjtISetxC211BIkuOei0VCzL1WlgJIl2EKWIAr6tNJvm0
         vHz21hhH5Elqp80bbA6mqweHm1+hu7WyGGqQ462u5dBIAN8VkO3VFd5aI+zZ2+LxT/J1
         fmuA==
X-Forwarded-Encrypted: i=1; AJvYcCXBbg4Mh2MRaQU0zSgU1te5JoXctMA/mUFC79G2Q3B6mZtaW1KkJY3pX2Zfw3tBLalUsOXwcosWrEwy8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIgumWMVX/sC1TRBLFEFixd26Hll4ieiy88Y1pmdesNrb8LewE
	HT1cEXzezrW2qg15Hwz2WyfgcgHr0dU7Tomk1SQVX3qU+TIEhG7K4RlDDSMexvk=
X-Gm-Gg: ASbGncuH9JB+1w+o+2rX4063AIcAcBqpPn/bXTocW3l/5ZWt5XihDo2cCaf8a+Gkl/b
	YHqaorpDpXUbjwrA4k2d2RHPgcBxd04rxF5NaqmxYfHHQlQ4EAzfaXQXRYBlylsyHCNklNjnSNk
	9nJjwPx1SgolSA7dEgHLNf+0WQ31+AMvx3RkTmlPeFOIW3zZmAWW9td1XMofniwZIRVWpm++n+w
	M5L/NYAY6OwegIPqoDlNqtdfuVaKouaDPh9O5wDBx3wYxI6O6JcofEJnllakKnoMYB8QDKVzAHN
	hrMoVb5B9qS3LHzZLWz30JU8NrLfWLkVLuWiXU1H0qZRu3POWOyfRpCrVWtVViBwK28dD0VcPe6
	8UhWB1IoscrpyxInAc/eduvE=
X-Google-Smtp-Source: AGHT+IEYO4fmrspVYYrTHdjMDWmEnFADk1AWRMVfCLAiR2Kql+MwftBAWZmi1W1b6z3wGvyZYMCvEg==
X-Received: by 2002:a05:6512:158e:b0:549:8b24:9889 with SMTP id 2adb3069b0e04-549ababf63cmr763732e87.6.1741730210970;
        Tue, 11 Mar 2025 14:56:50 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b0bd5b5sm1901122e87.158.2025.03.11.14.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 14:56:49 -0700 (PDT)
Message-ID: <3caf6aa5-32d4-4e2a-8872-87e5ddadd7c4@linaro.org>
Date: Tue, 11 Mar 2025 23:56:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: media: Add qcom,x1e80100-camss
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org>
 <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-1-c2964504131c@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-1-c2964504131c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/19/25 02:54, Bryan O'Donoghue wrote:
> Add bindings for qcom,x1e80100-camss in order to support the camera
> subsystem for x1e80100 as found in various Co-Pilot laptops.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

<snip>

> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[0-3]+$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +
> +        description:
> +          Input port for receiving CSI data from a CSIPHY.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              clock-lanes:
> +                maxItems: 1
> +
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +

bus-type property of the endpoint is missing.

--
Best wishes,
Vladimir

