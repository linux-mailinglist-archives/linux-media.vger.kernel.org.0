Return-Path: <linux-media+bounces-50094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED842CFBFE4
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 05:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCFDF30274E1
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 04:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E25121772A;
	Wed,  7 Jan 2026 04:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cRIG66WO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53F91DDF3
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 04:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760927; cv=none; b=h0A2jrOLOih9aPOE6JB8V0gJu8LJY8swPVERxXJZjXf5j4rYNx6MqUR2TGgk9EOloEHsKEeS/T52xCW2i72ui9GwKwFX4N9+bsw6xxUjPNjah4dmSAMZWjcuC65wHMV/BPaGDMdLkji7kwY+Ter6YqHDX++8EFDpavMIFLLwg68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760927; c=relaxed/simple;
	bh=G+lJppHttUXeF/evLjii3rbMw6q86usTSMy6wwMLUz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WMZD8uGnx8C+I+srQJCrD7gt62ktx6GF56AGV43LgoGmwZ8YXE/GWQE5KVkM4Uy3xHx/MqHo/GBsT9IRUUEudmY0np1EvaWbcm7myMH69tToodG5JsoC42DyeVlv8IGGWnmUo4wy1Bn3INgZIvLHVFf9crxP+BJ5EsaNII5Xzy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cRIG66WO; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-382f6ca9fbcso1437731fa.3
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 20:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767760923; x=1768365723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkfCVyd53/ucNy9M3nl2k9rQ6JcMrMCnqE4mBt0wduk=;
        b=cRIG66WOs+/PB1MILgK+JM+FyyIqfnRFld+voZ2EWjUV28RABeJpWd8oA/Cs3R91bo
         r5FJTbfUYoea97SQsYQ+oWPH7FkWCAsBW7oFDID6QlmzRxMGFZTZkQFSqk56OxJkSq+f
         ob3mF+EWopRyaGnV8G0WeiWZn2I5cr1DtUgmPGdXVVi9KvvcbBkzoyUMk5KQH6lOCf4L
         Y8Mj02u0rY/jzzuwyRbrteo2myffJxrghiXUbBjkuIlicZmE1zw9DQUnFQQfUD10JURH
         bvBQe2Kyl4F4XI/3y39C0O+c4B92McD0NtD34QJr1GYVFRD4LHga3IDujmV47Eeh1hOp
         ByQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760923; x=1768365723;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YkfCVyd53/ucNy9M3nl2k9rQ6JcMrMCnqE4mBt0wduk=;
        b=PmlOw9u9JadBmZLFc0chtlZ7C+8b1ElXOzOx+WjCX5sdGxvdGUCDrIo+N6rBWIkbXg
         62PZVupZWiNo38iTAIVb0UKvB+FMNLOkBuaSZNkf8RWg/XkRWryHYm0SkogC6/Ivdz1S
         /gKEhEAzOmCrIKU+SacffHZnYpdaiTkE6GjP1XvzYEUlOI2xzZ9JKgsZMNOGCJllCT6T
         BUuD5WnQRCYB6bSB41dWTXuYWRSmSfdG7m8uYTUErjnBvnGzuprqFflj0UdTjIvhCjYh
         H3wljBqkB6w3N+YTmsf1GMJfxD6AJ6E8gruEkJRe8PCF0nNDikLa6pa46LGbnD9wK0US
         +tUg==
X-Forwarded-Encrypted: i=1; AJvYcCVwGM2g8onOX4046i11vZJOoApTZYyGbU6RGB0WK0mXQvB8GbpCzUk6Xxfh6E2NiNX9bCoOUqVeqiBbag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBSyLKYvqKH3HFMXVXpdgaWH8sx+46Q2WEdFi2flmyJgvVA4q0
	6jhRR2Gq68CEJCpu7+MmxoUmwTBaR35PF1QWMbkQpeIxq6d5108whGJxLRMas08SLNw=
X-Gm-Gg: AY/fxX5kfqTq5xqnOu/lE3iD9wjP9fLhPoi0hZ3W9PB/KNnVMNFRw37JL+iXsdhQoOM
	f69X0kQCmIAz7HJReGq6lP+CK/eWw7LUS2QX9r6BMxA1I8Lygk6p2qF2mrrOhdtCTP5sedEqcDB
	RRDRyvyexAxu7UlCjzD1ZRCodXk9Vbu9/Qf4OQmPKqhPmMPxmXqb3I0V9PrLrsC9PaC910SMtBv
	bVuzhWXW+mb9pgBtwrLTO5jBBpfpLVatOCsgDaG/MpkqME4EZAn7Z/wS6B7cgaGI/xE0RuKoBvR
	BFf21Q/ndaQk1ZSeCBM+Wc9/DVbuEq4diKwWRoCOtYyyaNAERza9fdYHbU1ATlpRghb0tqGc1WV
	dcitYJ2Wr9TNPfstYEYzsRqIdRY21CcPDRoHxbo6Qx2rfc8BAxvbq/m40aaVV3Yd+liEDRU3k5r
	w9Zs+5URncQUx5+t0mT8F9zHKzoZDRUcTm2yleX6rEUgDWdOXdUtlohRz5xfhSY9ZZqA==
X-Google-Smtp-Source: AGHT+IFuxyEOJSsVILPAwetJUmHD+jF6p5U6vU9/JjiGrP44p16/Cr5nFrGos/EVs9geMZQAqG0x9Q==
X-Received: by 2002:a2e:b8c8:0:b0:37f:c5ca:7428 with SMTP id 38308e7fff4ca-382ff5ae8a2mr1609001fa.0.1767760922695;
        Tue, 06 Jan 2026 20:42:02 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8f146bsm8786921fa.36.2026.01.06.20.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 20:42:01 -0800 (PST)
Message-ID: <e5c52f0c-a5bb-49d9-a673-9dbaffe3e689@linaro.org>
Date: Wed, 7 Jan 2026 06:41:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] dt-bindings: media: i2c: Add Sony IMX355
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Robert Mader <robert.mader@collabora.com>, Bryan O'Donoghue
 <bod@kernel.org>, David Heidelberg <david@ixit.cz>,
 phone-devel@vger.kernel.org
References: <20260107043044.92485-1-mailingradian@gmail.com>
 <20260107043044.92485-2-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260107043044.92485-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/26 06:30, Richard Acayan wrote:
> The IMX355 camera sensor is a camera sensor that can be found as the
> front camera in some smartphones, such as the Pixel 3, Pixel 3 XL, Pixel
> 3a, and Pixel 3a XL. It already has a driver, but needs support for
> device tree. Document the IMX355 to support defining it in device tree.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   .../bindings/media/i2c/sony,imx355.yaml       | 115 ++++++++++++++++++
>   1 file changed, 115 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> new file mode 100644
> index 000000000000..33d253ca0e4f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx355.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX355 Sensor
> +
> +maintainers:
> +  - Richard Acayan <mailingradian@gmail.com>
> +
> +description:
> +  The IMX355 sensor is a 3280x2464 image sensor, commonly found as the front
> +  camera in smartphones.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: sony,imx355
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Analog power supply.
> +
> +  dvdd-supply:
> +    description: Digital power supply.
> +
> +  dovdd-supply:
> +    description: Interface power supply.
> +
> +  reset-gpios:
> +    description: Reset GPIO (active low).
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            items:
> +              - const: 1
> +              - const: 2
> +              - const: 3
> +              - const: 4
> +
> +        required:
> +          - link-frequencies
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - avdd-supply
> +  - dvdd-supply
> +  - dovdd-supply
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sdm845.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        camera@1a {
> +            compatible = "sony,imx355";
> +            reg = <0x1a>;
> +
> +            clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +
> +            assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +            assigned-clock-rates = <24000000>;
> +
> +            reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
> +
> +            avdd-supply = <&cam_front_ldo>;
> +            dvdd-supply = <&cam_front_ldo>;
> +            dovdd-supply = <&cam_vio_ldo>;
> +
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&cam_front_default>;
> +
> +            rotation = <270>;
> +            orientation = <0>;
> +
> +            port {
> +                cam_front_endpoint: endpoint {
> +                    data-lanes = <1 2 3 4>;
> +                    link-frequencies = /bits/ 64 <360000000>;
> +                    remote-endpoint = <&camss_endpoint1>;
> +                };
> +            };
> +        };
> +    };

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

