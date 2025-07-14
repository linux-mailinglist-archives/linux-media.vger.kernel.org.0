Return-Path: <linux-media+bounces-37634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99035B04121
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 16:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8C94178CC3
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 14:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5739255F56;
	Mon, 14 Jul 2025 14:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U4TgVQW4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A89248191
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 14:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752502439; cv=none; b=Ven4wESPK+hbfB4vxXvOQPuNZLOIEShXucD4RrM6MGyfyHKn5CU2Ssr3vn/7fqJCTXKR9Yjj5iMG4TINHr/jKwDGNhUHT/sjJXPXgXSRCdNjp4/iwEsmUE48fjx7rK4nquR0a+oUTUmMABpnf8iYwPPXWY3GIiyhZfNdmlqwqd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752502439; c=relaxed/simple;
	bh=wCIdKtNSrC0FHDfQjLImfojsGLriWqqzsA7IN5oCePM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qmcsAX2+O/huvP1gkfnqzlXIsUUiRiuvYVKxDty1TrmShnQgXioZgPsnM6MEcw6PLR8bhDX7fEbjItTP/w+G5wXiYd7iyQpT7uufI9MtCAGZRHW/ndtRmfp0ZT4ApkfeHO2Dzt3kG50hmLaz9OaW/qU6AGCZaJ258e+Q4u00z6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U4TgVQW4; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32b4a0915b1so6914421fa.0
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 07:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752502435; x=1753107235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OiyN54HqkGhaI3X2oE54WY0+m9go1W47ITpgZXXs7J0=;
        b=U4TgVQW4o4706aj+htZpqRSmaNX2SHB+0VSeQkNVAWvrmY8FXCHT2rtlbBOrXzSOiS
         WfcxnOIjuCjAJ/yubGqQHIwHRFQDXxdbvibYbIXJKCzyN8DOLIaYzGjboJxupGEnLxHb
         tvz2Stl9Yxh5XprlP019NdEgnsLiNHOiI/TqfSXLRQsHoAcwdG1xwR/STBIBZTzfEX4n
         rR9YtkKibR4Ll7Ev6dbHW+NL8r6GJsLYbwLhehx3qiyvKLEejOHBp3cg5pthx4W76rNe
         FQj4Zj68II0XnadD2u0fbjdDCJE4SecWqp14e+NjnXuY0nhCgxB3BdZrvCZvbbiFyrzH
         VobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752502435; x=1753107235;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OiyN54HqkGhaI3X2oE54WY0+m9go1W47ITpgZXXs7J0=;
        b=P8a7kblP5jGcXaz0xxy3vYKnBuj5IW4Dalnzn1t5L8HqKHZNyI8Ihp07tL791DO8qQ
         uTB/2UiLLx1K1AnsQRsBv7w35Tazk4hggFOtOmSYCJYr9Oi0hNX/8C0BPnaayHeD55lw
         WpEFOxrqJgYzPkSG+3lGIkFA1Tm2WzXHWbqxh3kg92UcdXX9QH/QeQTEd1vhagr7QG76
         2KoT/ub5JtXs63gzc8f3YGEzF96h2DwkFg8GM4vKY9X0YrQj91yIM4Fn9Gg+hfKbWOlo
         q3ymZx0iM7ANBaE7N/wrxGHb8ype2Mb1+5yhSC6hme4YGXJutVC7xTUCHG0+6v9ygRf7
         gh/w==
X-Forwarded-Encrypted: i=1; AJvYcCVv6VZWULxkbFjuVzl0vWXvz00Mi6BmbemmUwuR0jrXipkLaOxHfceIsCviMvKklpI0rNiqoCesOIDFng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1B5OxCjhaX+iVis0NyVxRR56YZB+eihWGV7k9IT96IdoFsXSQ
	3BN9ZhtUW/EoJHBU8T/oDcJTSzAp74GukOzkq1VwR7SxCcQHYuBnoO9UHGWhVCgllFA=
X-Gm-Gg: ASbGnctoE9ERuDYGvKeotZ82DxRWrJdRCAy6G0DlLzubqp7xRiz/vhx4pihKdmmkQ0V
	/49UsO+zJfY7/Hs9jC+luZhSuta7/Jm3KR3lw+HWCiR8D+gLqZjYME1UcsZdA4GIiQjvX72Vpr5
	Kz58y/S/Q45jf4XfaJnr1xHuhXNLJnXtF1gcJCbOIgVAhJ8W5JO533wnq7aCbW/WZHl4VAaLldb
	/q51MQcOHEr9EY++xmNciQMkTX7XwCbqb/A/SVtA/dX1SdCCa+ORARY+eajjCzQWvVxmeBzqY5y
	nerTk5YdCU2JkvwSNFbqnuZuuAxSSdd99jEfWyvxZ6eJ5Il8iXhSADJCGuXTEAh+EurXZx/x/yI
	vlKrZAMzH1kcp7Iu4vT748jcrJbjPDj+qlVM4wOD90jqpNRuJKGlfrNR31GZWHjtFXx6n5dTVPa
	8J
X-Google-Smtp-Source: AGHT+IGC8Q7q44pTIG5Hqdyx76e0tz+NV3O/Al80pmn7k0s9+o2E96eS2uXy7hjZVJc9Tqvik/DEmQ==
X-Received: by 2002:a05:651c:b21:b0:32b:3b00:406b with SMTP id 38308e7fff4ca-3306ce94988mr4877941fa.4.1752502435259;
        Mon, 14 Jul 2025 07:13:55 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab8ed35bsm15350211fa.84.2025.07.14.07.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 07:13:54 -0700 (PDT)
Message-ID: <8ed5eeee-78a2-4b26-989f-03676a9e5da7@linaro.org>
Date: Mon, 14 Jul 2025 17:13:48 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom: Add MIPI CSI2 C-PHY/DPHY
 Combo schema
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-1-74acbb5b162b@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250710-x1e-csi2-phy-v1-1-74acbb5b162b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/25 19:16, Bryan O'Donoghue wrote:
> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
> PHY devices.
> 
> The hardware can support both C-PHY and D-PHY modes. The CSIPHY devices
> have their own pinouts on the SoC as well as their own individual voltage
> rails.
> 
> The need to model voltage rails on a per-PHY basis leads us to define
> CSIPHY devices as individual nodes.
> 
> Two nice outcomes in terms of schema and DT arise from this change.
> 
> 1. The ability to define on a per-PHY basis voltage rails.
> 2. The ability to require those voltage.
> 
> We have had a complete bodge upstream for this where a single set of
> voltage rail for all CSIPHYs has been buried inside of CAMSS.
> 
> Much like the I2C bus which is dedicated to Camera sensors - the CCI bus in
> CAMSS parlance, the CSIPHY devices should be individually modelled.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml     | 95 ++++++++++++++++++++++
>   1 file changed, 95 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e0976f012516452ae3632ff4732620b5c5402d3b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-mipi-csi2-combo-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm MIPI CSI2 Combo PHY
> +
> +maintainers:
> +  - Bryan O'Donoghue <bod@kernel.org>
> +
> +description:
> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
> +  modes.
> +
> +properties:
> +  compatible:
> +    const: qcom,x1e80100-mipi-csi2-combo-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  clocks:
> +    maxItems: 4
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi
> +      - const: cpas_ahb
> +      - const: csiphy
> +      - const: csiphy_timer
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  vdda-0p8-supply:
> +    description: Phandle to a 0.8V regulator supply to a PHY.
> +
> +  vdda-1p2-supply:
> +    description: Phandle to 1.2V regulator supply to a PHY.
> +
> +  phy-type:
> +    description: D-PHY or C-PHY mode
> +    enum: [ 10, 11 ]
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - clocks
> +  - clock-names
> +  - vdda-0p8-supply
> +  - vdda-1p2-supply
> +  - phy-type
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/phy/phy.h>
> +
> +    csiphy0: csiphy@ace4000 {
> +        compatible = "qcom,x1e80100-mipi-csi2-combo-phy";
> +        reg = <0x0ace4000 0x2000>;
> +        #phy-cells = <0>;
> +
> +        clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                 <&camcc CAM_CC_CSIPHY0_CLK>,
> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
> +        clock-names = "camnoc_axi",
> +                      "cpas_ahb",
> +                      "csiphy",
> +                      "csiphy_timer";
> +
> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +        vdda-0p8-supply = <&vreg_l2c_0p8>;
> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
> +
> +        phy-type = <PHY_TYPE_DPHY>;
> +    };
> 

There is no ports at all, which makes the device tree node unusable,
since you can not provide a way to connect any sensors to the phy.

--
Best wishes,
Vladimir

