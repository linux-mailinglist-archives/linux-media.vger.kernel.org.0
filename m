Return-Path: <linux-media+bounces-34748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A10AD8AF2
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 13:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1177E17F1A0
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 11:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856DF2E2EE3;
	Fri, 13 Jun 2025 11:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dPKPmXui"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63DD18BC0C
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 11:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814960; cv=none; b=Xmc1kJ/vuTvRPVDryYO7lE3KX1VT+s7ufqEGXj3x4sQJEW1Ms0WG/XrFp57Hx6E7qOxJ+79+O9pnfa+ZoeWc9Byuvu9vS0UvKLgSszA+Pe7Qqehft3hrJQWg/qAiIP54l6Cz1/6usXmxBfLkJYsCVOU7aF3dv5Z2uBi3edFihHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814960; c=relaxed/simple;
	bh=j+WpPPNJFVv5cc8th/z2eLNPWQbQU7n97BO8H4n+ffk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VWoq3wmaa+BUFhBQSH6fecn8rqnJba9gxFYs10aaWmw2wiXygOmB2SOqt0/pj09tY6jmkCow4awrWpr24j1YmwMWb7M0AJO+eimDoFRTORjiuad+eeGi7ocl6Fx1bLzrX/58bgc47yMx0ne/700WIjf8o996CQKThYhz+fTuPgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dPKPmXui; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso2039084f8f.1
        for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 04:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749814955; x=1750419755; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MvwEhGPx6wb8xbrbsUHrrq52O4YNiUINr5fVID9eklE=;
        b=dPKPmXuiGOVeHOs5gcat0XHSdBSmIQ3XEmr8rDTHAei2Y0eGSxxTSflxbWbZ0WwSVN
         1UiOxhrzK2BRPt1HIik2FDNA9nuC616I5eZKlBxFlvLmkT3jDlYFGL0GDit3KRvk9O8Z
         s5Mar8l8bsKH9BfJlD7kWunPaa+w5W3D5J0ohgH13yE3ZXQqSK1kIXhTD3ou/Z+yjz/i
         qv0x5ExnLJtZU05htDP4VsFjVf2sGlmUiMPduGR+jDogBMAYFcmWTlInyk22X0m9P0xG
         0vEZaUwx5aj2oU+4t+s0B8ir0JwUxdleRs+v1cV+wcDW4Xi90Gm/iokgu3RFBgdXRn7U
         PZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814955; x=1750419755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MvwEhGPx6wb8xbrbsUHrrq52O4YNiUINr5fVID9eklE=;
        b=LlEP25KwUW4MiW5oj3Q8WcaYOS4JiaiyVO8FRtQzOTlR93ug2UCMsh9/D9sj8UdLI8
         JhD1aDnksmXjVnp6OkpjXpOT5AsrhszfYPM/rk7ubMq4cXK5vC7teQOg5fARM3c8cWDw
         9CMZYutFnds1bc7HMrkcKIGVeKzEh1OSkVYwObRbblzzfdFZY2nedYWKt8P7GzoXDppz
         fwTDeYZTQf2zepMYRYepQgVbYh4JhTOAkL4LhHnlPgUfWqGAHqgxi2Md90emMJdBgVPO
         aQz+oYvecJHFhcqqtW01OTOJvaqDIf62grojsy3Q16v3CkrF3q6RtBGNbvHVqonCA5Y1
         luxw==
X-Forwarded-Encrypted: i=1; AJvYcCXHsZkyBlkE1swuScAR0zJleAHA7y+BsXG1OfTf/FwY4B0sXZZeRX1lzlUrHmZXMwsbO65hnpgsP0iTIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx106yYSqJfBHx8/gqQiVGuLS5q+s0GgL0Ra1pUn0lEudy5/w5v
	08dx3WvrL6FblOp45UGGX6bvhxseer1iZBVpamQ6fFMEr94PlfZjdCFcSbbCyHZQMKE=
X-Gm-Gg: ASbGncs28giA7vLnZxvQns1VFbojqJ6TILPgsan1F826exyxl6exyY55dHs2hLCYa23
	jVzAcKKXJr5OO/6dMdYb2sjVaS2KC7ZRauVYmhjW62bCt1875xRB0V7t1x03JCAsLMaylvzf+fI
	5FhQ5OAgWnk3ETGstjzbqb6OiS9owUvNO4ie43UwDIrDpp6dvVgdSnbt6S5ADfocJ9dHlDFiTgj
	Ygw510Rw2QWkdrqE+TObGcnUQoIqsqdHlU90V+bPJc3lVxUS+VPOJfdmhTh1TWnrdlFssdE/daZ
	1614tzHI3JtyR30JkwzjY1vHT09KfSvGUi3409iioLOSVo2yp8BmX4tgbyNFws8ZTtd52rmTKAv
	yyCQEJrazERC4O1n7M26NVvOx9C8=
X-Google-Smtp-Source: AGHT+IFHSX81XGRTonZWsTCONugCLIzvlTJnwuwWqkN66G3W6Veq1ddBm9U4o0xZRHNlrQelgSceTw==
X-Received: by 2002:a05:6000:4205:b0:3a5:3e64:1ac4 with SMTP id ffacd0b85a97d-3a5687665e0mr2632048f8f.33.1749814955260;
        Fri, 13 Jun 2025 04:42:35 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08e21sm2136681f8f.52.2025.06.13.04.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 04:42:34 -0700 (PDT)
Message-ID: <59944b49-67dd-43a8-b6a4-a1ad0b9baa59@linaro.org>
Date: Fri, 13 Jun 2025 12:42:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] media: dt-bindings: Add qcom,msm8939-camss
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250613-camss-8x39-vbif-v5-0-a002301a7730@mailoo.org>
 <20250613-camss-8x39-vbif-v5-3-a002301a7730@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250613-camss-8x39-vbif-v5-3-a002301a7730@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/2025 10:33, Vincent Knecht via B4 Relay wrote:
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
> index 0000000000000000000000000000000000000000..9fbb4b204ac8728b822864ad8336aa9d826d6b5b
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
> +      - const: csi_clk_mux
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csiphy0
> +      - const: csiphy0_clk_mux
> +      - const: csiphy1
> +      - const: csiphy1_clk_mux
> +      - const: ispif
> +      - const: vfe0
> +      - const: vfe0_vbif
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
> +      - const: csi_vfe0
> +      - const: csiphy0_timer
> +      - const: csiphy1_timer
> +      - const: ispif_ahb
> +      - const: top_ahb
> +      - const: vfe0
> +      - const: vfe_ahb
> +      - const: vfe_axi
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
> +      Definition of the regulator used as 1.2V analog power supply.
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
> +    isp@1b00020 {
> +        compatible = "qcom,msm8939-camss";
> +
> +        reg = <0x01b00020 0x10>,
> +              <0x01b08000 0x100>,
> +              <0x01b08400 0x100>,
> +              <0x01b08800 0x100>,
> +              <0x01b0ac00 0x200>,
> +              <0x01b00030 0x4>,
> +              <0x01b0b000 0x200>,
> +              <0x01b00038 0x4>,
> +              <0x01b0a000 0x500>,
> +              <0x01b10000 0x1000>,
> +              <0x01b40000 0x200>;
> +
> +        reg-names = "csi_clk_mux",
> +                    "csid0",
> +                    "csid1",
> +                    "csid2",
> +                    "csiphy0",
> +                    "csiphy0_clk_mux",
> +                    "csiphy1",
> +                    "csiphy1_clk_mux",
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
> +                 <&gcc GCC_CAMSS_CSI_VFE0_CLK>,
> +                 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
> +                 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
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
> +                      "csi_vfe0",
> +                      "csiphy0_timer",
> +                      "csiphy1_timer",
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
> +        vdda-supply = <&reg_1v2>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                csiphy1_ep: endpoint {
> +                    data-lanes = <0 2>;
> +                    remote-endpoint = <&sensor_ep>;
> +                };
> +            };
> +        };
> +    };
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

