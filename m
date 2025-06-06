Return-Path: <linux-media+bounces-34222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDDCAD00BC
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 12:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B32F5189CA3D
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 10:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3334287508;
	Fri,  6 Jun 2025 10:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tPyoyjUi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBB528643F
	for <linux-media@vger.kernel.org>; Fri,  6 Jun 2025 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749206831; cv=none; b=sIGjuQURj7IYVLeuttQh7KBoPOK9F2ZLmOXkYD4N2MCUX9VKUIQ5UU1LWqLdKA+3HcBtGXzpqes+Jj9hJqItVityCDW8qJB9CWTs03msBzWsulzPXDVzqvqXK39mEXJgf4tlcGH4Id/uw3nAxbojJuCOb4eFNcMn2DkQZVQECYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749206831; c=relaxed/simple;
	bh=f+/j1GlnG7yRbwOXO1wHIG7cgcq9EW09L+j7P/rKe1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GAn4MtvvN9QqaWQCm40dxu1EbdJHuCH7MWpncwjsQ9p6c/ZdpJx1JXW3l2xI/4iEUJ7Qo6GraWvxkT06ZS8JAAzbkNPMOSCAr3VJiJKTrHoIR5GMmaMrd1ewTCgASn1QeTxqY50E0m+bJJaxfJjPQTivP4Q/8FFmoZEzSjIDtKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tPyoyjUi; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32a8abb1613so2074321fa.2
        for <linux-media@vger.kernel.org>; Fri, 06 Jun 2025 03:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749206827; x=1749811627; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sdh3DYrunzvdU87ptIswN2gqeFyihiWuxRVoLIp7jeA=;
        b=tPyoyjUiWWXQlWbmAywAoEgb95uFXimp9DGWTF9bnPOfoetyO9LhY5eRf1B3l4NS42
         p8QMipdHZ4eJ0sT9yloT19TE9BX6ywU2RNJLDrbVuryl5yDWtueOBrRxzT0qFhEwfE9H
         q+Fmg7fhwjfLzJNL9DxAG1NzmB/KjlT4zQTEAR3SWQfbE0xA9flHNZ1B5U/XRJGCnetP
         DFjo/ifQNB98y1ziAz/I2QvDGXZ5nxHRoN9RIC5ZEeLjZdktjIsorjgr9DihoDFGwt8p
         MX14o1o8bD8LnpwLu6RulESjXrste7fGpUKPLX/EMEHn1/gcPm4vdXRUgxmISnpfWPak
         h/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749206827; x=1749811627;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sdh3DYrunzvdU87ptIswN2gqeFyihiWuxRVoLIp7jeA=;
        b=vIMOKrFs28AFcRU8U5tw4ngtrVhP/GWOwi7xaBiBweGGVRDwm45IOgEVByCyTkyNGW
         zBbVfx+0SEZRKiIKHr03YB9BudQtbSiPAgnm27SI9V1VGo5oiWxEENSkEqQwRKQ6/WkA
         MmK58kvUYps5+SvHD2HIwnceMLB/8m3yPD74e1xFSiKxM92tFrPFRaBPUrMp8fOkwxEJ
         VdFQnWT/ZA19p2R7ks3BSVQWBwxtsUtfX9L+orSYtfnfJLtlKknnS/EQE1ExsQZ8pWe+
         h0SQT7H5G8/JwP/IOqN8nq/FRFO73UsXyPI33cKTsmJQMrdBWi+HbrXmhzmoDrxxm5Tk
         7KvA==
X-Forwarded-Encrypted: i=1; AJvYcCUE7Cvn4ZvnV9p5iOS/NdgtCM1cKU685ujYmcn3exoZoEm4GdLs+voZfHOhM/MGW7YlBOcqbNrBz1tDWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfNvK3+CLFY0y2lWh0Pa6dwRCwZFP466VuWm/mMNQL+iXADhgY
	7xFAr81OS681fZ8E/kk4MxkzVvwH0rs771VJmUXmuepyA61X0bNZ6MnTp9I4mYGNfQA=
X-Gm-Gg: ASbGnctMI2ZS5hc9sZwwKvtF8A6NxeiVC6ofLWMsigtjkEJVplRzOK8d7f9R4ouY2g9
	4Xeft/kU5XxmF3oPTShyFYHncz1jmjCU9ytlzm+YRaBWq/NvRhcYlYSGskgft4iUkjD0ibzYu/u
	qvW51jVTIjKWgNwWc2P7ug2ztO0CdkVHGD4VE8KjtPILAKs8ATGjqkE7gjUUVnihgN6jo2T8rsJ
	zBQwi9+KwBo8Pj5HV4JLEVrStAAYNbJPieklhtniz2LajU9/8rhAVtrMDlhJHs6fURa5ByWedCn
	ImrdIvSS8fHngjBSv6nPJX7O4QUyQvtTIRaOw6clqKsMScZg1AkU/U8Xa8iycMpakVq2TEbMMQJ
	ufPfeZjaz1MGhzCvPcBU2yCdluTetqJQlo9aFTSAK
X-Google-Smtp-Source: AGHT+IGxjhoxsgVGEZoQ3YemtpUiJRV1bf+P3EhChyczWjkpXHPpDvcvXiPRpgWGAH6vjpJO+8TgQw==
X-Received: by 2002:ac2:4e0d:0:b0:553:2e82:162e with SMTP id 2adb3069b0e04-553685e5a0dmr156612e87.2.1749206827030;
        Fri, 06 Jun 2025 03:47:07 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b33b48sm1379641fa.30.2025.06.06.03.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 03:47:06 -0700 (PDT)
Message-ID: <2884f55c-6b80-406a-ba21-aaa26297b1bf@linaro.org>
Date: Fri, 6 Jun 2025 13:46:59 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] media: dt-bindings: Add qcom,msm8939-camss
Content-Language: ru-RU
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250602-camss-8x39-vbif-v4-0-32c277d8f9bf@mailoo.org>
 <20250602-camss-8x39-vbif-v4-3-32c277d8f9bf@mailoo.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250602-camss-8x39-vbif-v4-3-32c277d8f9bf@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Vincent.

On 6/2/25 20:27, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> Add bindings for qcom,msm8939-camss in order to support the camera
> subsystem for MSM8939.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>   .../bindings/media/qcom,msm8939-camss.yaml         | 254 +++++++++++++++++++++
>   1 file changed, 254 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..59bf16888a8235495a2080e512ce179583bcd25d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8939-camss.yaml
> @@ -0,0 +1,254 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,msm8939-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm MSM8939 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Vincent Knecht <vincent.knecht@mailoo.org>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms
> +
> +properties:
> +  compatible:
> +    const: qcom,msm8939-camss
> +
> +  reg:
> +    maxItems: 11
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csiphy0
> +      - const: csiphy0_clk_mux
> +      - const: csiphy1
> +      - const: csiphy1_clk_mux
> +      - const: csi_clk_mux
> +      - const: ispif
> +      - const: vfe0
> +      - const: vfe0_vbif

Please sort the list alphanumerically, accorting to the ASCII character set
the underscore symbol precedes lower case letters.

> +
> +  clocks:
> +    maxItems: 24
> +
> +  clock-names:
> +    items:
> +      - const: ahb
> +      - const: csi0
> +      - const: csi0_ahb
> +      - const: csi0_phy
> +      - const: csi0_pix
> +      - const: csi0_rdi
> +      - const: csi1
> +      - const: csi1_ahb
> +      - const: csi1_phy
> +      - const: csi1_pix
> +      - const: csi1_rdi
> +      - const: csi2
> +      - const: csi2_ahb
> +      - const: csi2_phy
> +      - const: csi2_pix
> +      - const: csi2_rdi
> +      - const: csiphy0_timer
> +      - const: csiphy1_timer
> +      - const: csi_vfe0
> +      - const: ispif_ahb
> +      - const: top_ahb
> +      - const: vfe0
> +      - const: vfe_ahb
> +      - const: vfe_axi

Same comment as above.

> +
> +  interrupts:
> +    maxItems: 7
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: ispif
> +      - const: vfe0
> +
> +  iommus:
> +    maxItems: 1
> +
> +  power-domains:
> +    items:
> +      - description: VFE GDSC - Video Front End, Global Distributed Switch
> +          Controller.
> +
> +  vdda-supply:
> +    description:
> +      Definition of the regulator used as analog power supply.

Please specify the wanted voltage level in the description, due to
the example below I would expect it's 2.8V.

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[0-1]$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +
> +        description:
> +          Input port for receiving CSI data.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - data-lanes
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - iommus
> +  - power-domains
> +  - vdda-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,gcc-msm8939.h>
> +
> +    isp@1b08000 {
> +        compatible = "qcom,msm8939-camss";
> +
> +        reg = <0x01b08000 0x100>,
> +              <0x01b08400 0x100>,
> +              <0x01b08800 0x100>,
> +              <0x01b0ac00 0x200>,
> +              <0x01b00030 0x4>,
> +              <0x01b0b000 0x200>,
> +              <0x01b00038 0x4>,
> +              <0x01b00020 0x10>,
> +              <0x01b0a000 0x500>,
> +              <0x01b10000 0x1000>,
> +              <0x01b40000 0x200>;
> +
> +        reg-names = "csid0",
> +                    "csid1",
> +                    "csid2",
> +                    "csiphy0",
> +                    "csiphy0_clk_mux",
> +                    "csiphy1",
> +                    "csiphy1_clk_mux",
> +                    "csi_clk_mux",
> +                    "ispif",
> +                    "vfe0",
> +                    "vfe0_vbif";
> +
> +        clocks = <&gcc GCC_CAMSS_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_CSI0_CLK>,
> +                 <&gcc GCC_CAMSS_CSI0_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_CSI0PHY_CLK>,
> +                 <&gcc GCC_CAMSS_CSI0PIX_CLK>,
> +                 <&gcc GCC_CAMSS_CSI0RDI_CLK>,
> +                 <&gcc GCC_CAMSS_CSI1_CLK>,
> +                 <&gcc GCC_CAMSS_CSI1_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_CSI1PHY_CLK>,
> +                 <&gcc GCC_CAMSS_CSI1PIX_CLK>,
> +                 <&gcc GCC_CAMSS_CSI1RDI_CLK>,
> +                 <&gcc GCC_CAMSS_CSI2_CLK>,
> +                 <&gcc GCC_CAMSS_CSI2_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_CSI2PHY_CLK>,
> +                 <&gcc GCC_CAMSS_CSI2PIX_CLK>,
> +                 <&gcc GCC_CAMSS_CSI2RDI_CLK>,
> +                 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
> +                 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
> +                 <&gcc GCC_CAMSS_CSI_VFE0_CLK>,
> +                 <&gcc GCC_CAMSS_ISPIF_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_VFE0_CLK>,
> +                 <&gcc GCC_CAMSS_VFE_AHB_CLK>,
> +                 <&gcc GCC_CAMSS_VFE_AXI_CLK>;
> +
> +        clock-names = "ahb",
> +                      "csi0",
> +                      "csi0_ahb",
> +                      "csi0_phy",
> +                      "csi0_pix",
> +                      "csi0_rdi",
> +                      "csi1",
> +                      "csi1_ahb",
> +                      "csi1_phy",
> +                      "csi1_pix",
> +                      "csi1_rdi",
> +                      "csi2",
> +                      "csi2_ahb",
> +                      "csi2_phy",
> +                      "csi2_pix",
> +                      "csi2_rdi",
> +                      "csiphy0_timer",
> +                      "csiphy1_timer",
> +                      "csi_vfe0",
> +                      "ispif_ahb",
> +                      "top_ahb",
> +                      "vfe0",
> +                      "vfe_ahb",
> +                      "vfe_axi";
> +
> +        interrupts = <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 153 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
> +
> +        interrupt-names = "csid0",
> +                          "csid1",
> +                          "csid2",
> +                          "csiphy0",
> +                          "csiphy1",
> +                          "ispif",
> +                          "vfe0";
> +
> +        iommus = <&apps_iommu 3>;
> +
> +        power-domains = <&gcc VFE_GDSC>;
> +
> +        vdda-supply = <&reg_2v8>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@1 {
> +                reg = <1>;
> +                csiphy1_ep: endpoint {

There should be an empty line between the end of the list of properties
and the beginning of the list of children device tree nodes.

> +                    clock-lanes = <1>;

Please remove 'clock-lanes' propoerty from here.

> +                    data-lanes = <0 2>;
> +                    remote-endpoint = <&sensor_ep>;
> +                };
> +            };
> +        };
> +    };
> 

--
Best wishes,
Vladimir

