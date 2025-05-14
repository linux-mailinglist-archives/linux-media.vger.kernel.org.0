Return-Path: <linux-media+bounces-32460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30768AB68D1
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 12:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D20DB3A84BD
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 10:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DD227055F;
	Wed, 14 May 2025 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wc/IYILC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9359225E461
	for <linux-media@vger.kernel.org>; Wed, 14 May 2025 10:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747218582; cv=none; b=l48c6QrAvFalOBZZXynRuheTSo+PE+gMKWAj8c4KsLaoMJUQlP3ZIL2pQKK2kNWSqU6nKMJm6mv9xEgOv94xNkJ4VSiGpPj11yk0ZH2UkCNGjKLvyZxeTMGia/wplX6lbKCZ0UuUElewTAnuzAliKz8qQsxTLvUWbIoxYWjPb3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747218582; c=relaxed/simple;
	bh=RJXzNpSAcHShZIk1m3pF10sKxteBO3dbbHyuTCEUET0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hL+XyG77jZHIsUXuU/H/xw6EcIVFAyDkH2C1jW26K3Jmq8TUhmv6G0U+AB2CECl5/nI2rxnYjZKXLLDm77YIZ7NOSw2WT9eujEwFXKup7UyShHr1Ta139gmJkSn1NGxpYLuKlfL8JFU0zg50MqmQIufM5QT8GlhWECgQwlsS1TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wc/IYILC; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a1f8c85562so3516750f8f.1
        for <linux-media@vger.kernel.org>; Wed, 14 May 2025 03:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747218579; x=1747823379; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ePg3tJASnNM57hKgSxlRFPyIUggUvcLPatD9RWreDX0=;
        b=wc/IYILCdyTZwyYLsmj6LmxC1XzenpiBhXItxOi/vWPh6CUIQoI7MjkD7/v5g925oQ
         Uh9mHCGQKiqzDUH57dKUEImq8TlZ/QCTo/pC0n+Yn8UjmYVgmh0iv4637kGDqRqv6vDe
         TFCqmGNA/S3v9OANIxUcwqUSxWNOzHuf+XPBSoG50ZyB32pfgNM6TX78TcOPajEB52x5
         iPlZePEIgBrJ9eZRHPnZLrpiOWdUa1qayVTAJ6jLVs1HRKhVHgFiGrWuGT7d5ZdB0hwE
         r3zDMOybz4dmAYAi4b9cn3ll05eRDovlu/8YzWjgIQ9dI9FxpMzysmFS0zKyAmzUPyvi
         qBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747218579; x=1747823379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePg3tJASnNM57hKgSxlRFPyIUggUvcLPatD9RWreDX0=;
        b=C0cIWVZq0ilqoSGltBKtn3Z5ziDJMaam8Foy0GmtDr67/DFA7MfYJ0SFAlVpnCGAfD
         ZCbIyL7yIavAUQRbnDE0p9vR0k+2sdTRlWh8tccNBQT1rfErsgskLItyB35OY60cOhh0
         rjWxbp6BJv1mim3kyq28oFh9jOMqYSnIJXl7HMbYjq/UBlK2RZa1odYDCnE0otcvKHI3
         0FgQr5mMJ/cuoJ3kt7Y1MWuOOMToHl680UpkxQ5uRXLEA+Gg4J1rMfgVvdkk9AiPHCiZ
         zN8ZxqnwVgDguIJCn+MwkV7+aINZWkj3DJZmgDjQ48GHpdFSgC3HKAfD/8xujrw24oRZ
         IT4w==
X-Gm-Message-State: AOJu0YzUYevdr8TEytJYda3igEV6csxQsw0ystQjh6XxKWiRNHJRwdPu
	LSYL1rrSE6dhUTzfNMHS9AZRyUK9Q7P3omxRZHrVTmOvaZmQj9QplQRIrWNGsss=
X-Gm-Gg: ASbGncvtWyM6mkwvpzKAe0ANR6I1A9+4xnBAsgfrc8qTn1l1O1bakaFAB3Yj0g/dWWe
	YVNP/350rqfBY0IlkxqaL9XtOpNQ7jCLXztLETsXl0G2G/g/TRC5uXKrDSJ0qW41r6l9vUQySi8
	Fo8J39AY522sgZdTd9XqK8ELPugfph6ZIR2ts6eXVwe+RqAtk2YAl7mN+xndflLBedjari2Cpz2
	iXXoUoGQqkZ0RlmDDlMQ4/hd09/pydFsvi8E3hJ6AWJmYzCaO2dvxWqpndOdHrus//3czio2aNU
	R+teFt8wrFHOLSTu788KUkHehtIfTE37M1wvqjk4duC19jlOvLasxVdNiTxuNn7h794dqqULCik
	AHMsdf6qBk+PU
X-Google-Smtp-Source: AGHT+IHjhoBaynMax8DR4vj3heXMVE+0fDfHEiV7SJCVMWgYWeESkB2IAbrN10SkOnXtoBTQY+++DQ==
X-Received: by 2002:a05:6000:18a5:b0:3a1:fd29:b892 with SMTP id ffacd0b85a97d-3a34994b07bmr2207420f8f.49.1747218578833;
        Wed, 14 May 2025 03:29:38 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde01sm19583563f8f.15.2025.05.14.03.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 03:29:38 -0700 (PDT)
Message-ID: <5905cee1-9ad3-4984-86b4-1709aaed1c1c@linaro.org>
Date: Wed, 14 May 2025 11:29:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dt-bindings: phy: Add Qualcomm MIPI C-/D-PHY schema
 for CSIPHY IPs
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20250513143918.2572689-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250513143918.2572689-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2025 15:39, Vladimir Zapolskiy wrote:
> Add dt-binding schema for the CAMSS CSIPHY IPs, which provides
> MIPI C-/D-PHY interfaces on Qualcomm SoCs.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   .../devicetree/bindings/phy/qcom,csiphy.yaml  | 110 ++++++++++++++++++
>   1 file changed, 110 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/phy/qcom,csiphy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,csiphy.yaml b/Documentation/devicetree/bindings/phy/qcom,csiphy.yaml
> new file mode 100644
> index 000000000000..ef712c5442ec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,csiphy.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,csiphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm CSI PHY
> +
> +maintainers:
> +  - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> +
> +description: |
> +  Qualcomm SoCs equipped with a number of MIPI CSI PHY IPs, which
> +  supports D-PHY or C-PHY interfaces to camera sensors.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm8250-csiphy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  vdda-csi-0p9-supply:
> +    description: Voltage supply, 0.9V
> +
> +  vdda-csi-1p2-supply:
> +    description: Voltage supply, 1.2V
> +
> +  '#phy-cells':
> +    const: 0
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    description: CAMSS CSIPHY input port
> +
> +    patternProperties:
> +      "^endpoint@[0-1]$":
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            minItems: 1
> +            maxItems: 4
> +
> +          bus-type:
> +            enum:
> +              - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +              - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +        required:
> +          - data-lanes
> +
> +    oneOf:
> +      - required:
> +          - endpoint
> +      - required:
> +          - endpoint@0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - '#phy-cells'
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sm8250-csiphy
> +    then:
> +      required:
> +        - vdda-csi-0p9-supply
> +        - vdda-csi-1p2-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    phy@ac6e000 {
> +      compatible = "qcom,sm8250-csiphy";
> +      reg = <0x0ac6e000 0x1000>;
> +      clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
> +               <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
> +      interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
> +      vdda-csi-0p9-supply = <&vreg_l5a_0p88>;
> +      vdda-csi-1p2-supply = <&vreg_l9a_1p2>;
> +      #phy-cells = <0>;
> +
> +      port {
> +        csiphy_in: endpoint {
> +          data-lanes = <1 2 3 4>;
> +          remote-endpoint = <&sensor_out>;
> +        };
> +      };
> +    };

I have something similar in the csiphy rewrite I've been doing.

Lets sync up IRL to discuss.

---
bod

