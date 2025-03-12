Return-Path: <linux-media+bounces-28104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D01A5E5FF
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 22:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9029F3AA573
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 21:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0EA51F0E2C;
	Wed, 12 Mar 2025 20:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p21mNceg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CB31F0E28
	for <linux-media@vger.kernel.org>; Wed, 12 Mar 2025 20:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741813017; cv=none; b=ubAO3B5xZcG0GAK1hZPDcDaPFR249udWZu+e7UobJexFr1JIY4EKHnp8mUPEw7Zy2n6JikgBW85JNA+IZYdMlQghqcWxs+5OcNrCWF2hBokMnV8UC7ajPLZ2ERbFWz/czvGDQwJ4RPpskkALQyUwuZJonefoUs6agsDI+ey8J+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741813017; c=relaxed/simple;
	bh=4bMcp9kSOAlOq2JdYCU3OWX9mxxoloYS3+mBOiikIZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bimAbmKJ2WLSVyy+e7hmywsivQVP3IahL9sLEF+nUNAkxP7vo8aDDEh5ckBlMoakZQA6X8Gv6FxYR15wqTJP9MnkaTZFG2FUOb1zjKJrKABdliUMM4mfaSa+D0xs/f2E36MYo5rmf80bNt1USiL3HhW1/s+p6aVAA4P/brUAe8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p21mNceg; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso64809166b.0
        for <linux-media@vger.kernel.org>; Wed, 12 Mar 2025 13:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741813013; x=1742417813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S8n1Yu/GTOV8VtCZr/+a2PIr5Rilh36raTNTnNvfZOc=;
        b=p21mNcegMOw1jIuNnCh1FQX6+x/ozj/mPi8Uj1afWtRB9FIbN+GUsWe2NAyWHO9lKF
         4UMyTCGAh/pd1h7Y1sulEEi+/1/gEzBFp53lAbB/8BVeXt3RKotfcjMHaRlpSMCqzSNu
         PPD4WcyCNr0xzLWafHiXUDfeemBYRRANMfzU2iPBSBgQ7dIJEWhbFCJXPI3e5xIn7Y9E
         ag2nMdzCPLUnT/b5NiyZDnGp26FO/PMeFXKuBi1RgHbmVChI6XyHQ19LIT86q3CafBMi
         yhDBXa5rKLRKI6Je35N9Z0rujXNkLolNnf1rpxou7FMJWGU9ACN55WvHBmjyjMuaJTLL
         AnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741813013; x=1742417813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S8n1Yu/GTOV8VtCZr/+a2PIr5Rilh36raTNTnNvfZOc=;
        b=tcS2g/6etbKkEXyn8Bz2BhoUMTYptCNjDkylOblPj71m0HBJJ/JiPCphForPsNLExS
         O8v8OoT1xkBPTbZPGzi0nEyOUE3YtYQf934QOb7LJ5BIH0PPvH31TD2vD3nOU5kC0yy6
         V1PwlBjX9Y908a9RW7GkEvJJMoLDP0ljeUO7aJPChaL5XLxi7zZwTpOWDwHBVFDHOivt
         TTYQo8+MJnRKJzHhUD2+NbSLeP+OcocufzjLR8cxVXfDflrtm4eiGG/Zrd/3Ym0boHJc
         ignPCoN02N0IrInbe8qsQd9lA66FhZLNsgzd4NC8LCkUTUGGl1ztsd2qNYc9Z0FDa0g2
         LPwg==
X-Forwarded-Encrypted: i=1; AJvYcCWW/u5Fz5MJNdYzI0lp0LfxHZgPtAcTRIbojWmZFwV/Ez5kOvLvBfcoilkmRmugORllumjmwUDLEA8xvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyphimxiMTOVFGVSvi3iEpFRE3wzPrbFbvfg9nhHGXvx2dDkFvH
	P7dKBRjC8lqmMjN67R/itAtfQ+qg45Pn3J57ut1OBmzlwVniFMQBRyr3PyhVNHc=
X-Gm-Gg: ASbGnct1cVYfoY5v47j5/sFnr46UiVy97RlOxcdlqavCUmxSR0WA8rE2p/WlHeLx7vF
	gusvh4w29yToyBfYpNgFKy47mycr5R9LZt0Y4hc8pT8es8rdDOH1p3YLrvRvqpILHLFhuPvajnt
	oYIAv031ABuR0Asm5OdMDfF9Ji43AlPYU7UAxNNeP51+iw8lzjH0vlQW5lDlW2lnXDXU1G6Y4lN
	tzyu7Vz2+V9yrWW9V78qPi2QWjPJDJVQcVK2ogB3TPTIXeTHtCwaZltIhH+L6ByAJHY/R9yKRjP
	ZMfELoFvp9EN0XSQTnxGbpotM9yIzdVjKcLG+T4ha3YLjCOvU56tyGqUZt43g9L0B+JBJh+39b2
	3HjhoVGuwKeOlBCBFzdkN8ZhmuImxRWpIVwkAe4+qMh/N0SGiv2Yi80aIrmzrmYTmKckROMaEGO
	gzysMPcaZyAca0fs+DxLPW3uB6ocad7RA=
X-Google-Smtp-Source: AGHT+IFX5DpYodSDqwK+QP4lduao5tkExCL1ZGC9AKS8A3mu6fHWPG1jsVixJk0/WmrXUL+1tBq7OQ==
X-Received: by 2002:a17:907:9452:b0:ab6:362b:a83a with SMTP id a640c23a62f3a-ac25274acf4mr2728967866b.8.1741813013073;
        Wed, 12 Mar 2025 13:56:53 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23943897esm1135776666b.13.2025.03.12.13.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 13:56:52 -0700 (PDT)
Message-ID: <7e3b9e7d-fe9f-4df4-aa50-3f385d53ae4c@linaro.org>
Date: Wed, 12 Mar 2025 20:56:51 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: Describe Qualcomm SM8650 CAMSS IP
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250312001132.1832655-1-vladimir.zapolskiy@linaro.org>
 <20250312001132.1832655-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250312001132.1832655-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/03/2025 00:11, Vladimir Zapolskiy wrote:
> Add device tree bindings for Qualcomm SM8650 camera subsystem.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   .../bindings/media/qcom,sm8650-camss.yaml     | 389 ++++++++++++++++++
>   1 file changed, 389 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> new file mode 100644
> index 000000000000..c405d4e1f81d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> @@ -0,0 +1,389 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8650-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8650 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sm8650-camss
> +
> +  reg:
> +    maxItems: 17
> +
> +  reg-names:
> +    items:

Does this silicon have the CSID wrapper ?

If so then this answers your question in the x1e series, csid_wrapper 
should come first as it routes between CSID, SFE and SBI and is the 
"main register set" for that reason.

> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csid_wrapper

Oh there it is.

Sigh I honestly thought the decision was to have csid_wrapper come 
first, followed by alphabetised name sorting.

Looking at

commit cabab3257eb0b6b3badc3f0264d11ebbd57900f6
Author: Depeng Shao <quic_depengs@quicinc.com>
Date:   Mon Jan 13 10:01:29 2025 +0530

     dt-bindings: media: camss: Add qcom,sm8550-camss binding

what you have here is consistent with what we comitted so, lets stick to 
this format and not relitigate again the ordering.

> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: csiphy5
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  clocks:
> +    maxItems: 36
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_axi_nrt
> +      - const: camnoc_axi_rt
> +      - const: cpas_ahb
> +      - const: cpas_fast_ahb
> +      - const: cpas_vfe0
> +      - const: cpas_vfe1
> +      - const: cpas_vfe2
> +      - const: cpas_vfe_lite
> +      - const: csid
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: csiphy4
> +      - const: csiphy4_timer
> +      - const: csiphy5
> +      - const: csiphy5_timer
> +      - const: csiphy_rx
> +      - const: gcc_ahb_clk
> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf
> +      - const: qdss_debug_xo
> +      - const: vfe0
> +      - const: vfe0_fast_ahb
> +      - const: vfe1
> +      - const: vfe1_fast_ahb
> +      - const: vfe2
> +      - const: vfe2_fast_ahb
> +      - const: vfe_lite
> +      - const: vfe_lite_ahb
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +
> +  interrupts:
> +    maxItems: 16
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: csiphy5
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  iommus:
> +    maxItems: 3
> +
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_0_mnoc
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: ife1
> +      - const: ife2
> +      - const: top
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    properties:
> +      "^port@[0-5]$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +
> +        description:
> +          Input port for receiving CSI data from a CSIPHY.
> +
> +        properties:

   ports:
     $ref: /schemas/graph.yaml#/properties/ports

     description:
       CSI input ports.

     patternProperties:
       "^port@[0-3]+$":
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false

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
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - clock-lanes
> +              - data-lanes
> +
> +  vdda-csi01-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY0 and CSIPHY1 IP blocks.
> +
> +  vdda-csi24-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY2 and CSIPHY4 IP blocks.
> +
> +  vdda-csi35-0p9-supply:
> +    description:
> +      Phandle to a 0.9V regulator supply to CSIPHY3 and CSIPHY5 IP blocks.
> +
> +  vdda-csi01-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY0 and CSIPHY1 IP blocks.
> +
> +  vdda-csi24-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY2 and CSIPHY4 IP blocks.
> +
> +  vdda-csi35-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY3 and CSIPHY5 IP blocks.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interconnects
> +  - interconnect-names
> +  - interrupts
> +  - interrupt-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,sm8650-camcc.h>
> +    #include <dt-bindings/clock/qcom,sm8650-gcc.h>
> +    #include <dt-bindings/interconnect/qcom,sm8650-rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        isp@acb8000 {
> +            compatible = "qcom,sm8650-camss";
> +            reg = <0 0x0acb8000 0 0x1000>,
> +                  <0 0x0acba000 0 0x1000>,
> +                  <0 0x0acbc000 0 0x1000>,
> +                  <0 0x0accb000 0 0x1000>,
> +                  <0 0x0acd0000 0 0x1000>,
> +                  <0 0x0acb6000 0 0x1000>,
> +                  <0 0x0ace4000 0 0x2000>,
> +                  <0 0x0ace6000 0 0x2000>,
> +                  <0 0x0ace8000 0 0x2000>,
> +                  <0 0x0acea000 0 0x2000>,
> +                  <0 0x0acec000 0 0x2000>,
> +                  <0 0x0acee000 0 0x2000>,
> +                  <0 0x0ac62000 0 0xf000>,
> +                  <0 0x0ac71000 0 0xf000>,
> +                  <0 0x0ac80000 0 0xf000>,
> +                  <0 0x0accc000 0 0x2000>,
> +                  <0 0x0acd1000 0 0x2000>;
> +            reg-names = "csid0",
> +                        "csid1",
> +                        "csid2",
> +                        "csid_lite0",
> +                        "csid_lite1",
> +                        "csid_wrapper",
> +                        "csiphy0",
> +                        "csiphy1",
> +                        "csiphy2",
> +                        "csiphy3",
> +                        "csiphy4",
> +                        "csiphy5",
> +                        "vfe0",
> +                        "vfe1",
> +                        "vfe2",
> +                        "vfe_lite0",
> +                        "vfe_lite1";

\n

> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +                     <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_1_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_2_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_CSID_CLK>,
> +                     <&camcc CAM_CC_CSIPHY0_CLK>,
> +                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY1_CLK>,
> +                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY2_CLK>,
> +                     <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY3_CLK>,
> +                     <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY4_CLK>,
> +                     <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY5_CLK>,
> +                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +                     <&gcc GCC_CAMERA_AHB_CLK>,
> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CLK>,
> +                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_1_CLK>,
> +                     <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_2_CLK>,
> +                     <&camcc CAM_CC_IFE_2_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +            clock-names = "camnoc_axi_nrt",
> +                          "camnoc_axi_rt",
> +                          "cpas_ahb",
> +                          "cpas_fast_ahb",
> +                          "cpas_vfe0",
> +                          "cpas_vfe1",
> +                          "cpas_vfe2",
> +                          "cpas_vfe_lite",
> +                          "csid",
> +                          "csiphy0",
> +                          "csiphy0_timer",
> +                          "csiphy1",
> +                          "csiphy1_timer",
> +                          "csiphy2",
> +                          "csiphy2_timer",
> +                          "csiphy3",
> +                          "csiphy3_timer",
> +                          "csiphy4",
> +                          "csiphy4_timer",
> +                          "csiphy5",
> +                          "csiphy5_timer",
> +                          "csiphy_rx",
> +                          "gcc_ahb_clk",
> +                          "gcc_axi_hf",
> +                          "gcc_axi_sf",
> +                          "qdss_debug_xo",
> +                          "vfe0",
> +                          "vfe0_fast_ahb",
> +                          "vfe1",
> +                          "vfe1_fast_ahb",
> +                          "vfe2",
> +                          "vfe2_fast_ahb",
> +                          "vfe_lite",
> +                          "vfe_lite_ahb",
> +                          "vfe_lite_cphy_rx",
> +                          "vfe_lite_csid";

\n

> +            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 602 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 688 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csid_lite0",
> +                              "csid_lite1",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csiphy2",
> +                              "csiphy3",
> +                              "csiphy4",
> +                              "csiphy5",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe2",
> +                              "vfe_lite0",
> +                              "vfe_lite1";

\n

> +            interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_CAMERA_CFG 0>,
> +                            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>;
> +            interconnect-names = "ahb",
> +                                 "hf_0_mnoc";

\n

> +            iommus = <&apps_smmu 0x800 0x20>,
> +                     <&apps_smmu 0x18a0 0x40>,
> +                     <&apps_smmu 0x1860 0x00>;

\n

> +            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
> +                            <&camcc CAM_CC_IFE_1_GDSC>,
> +                            <&camcc CAM_CC_IFE_2_GDSC>,
> +                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +            power-domain-names = "ife0", "ife1", "ife2", "top";
> +
> +            vdda-csi01-0p9-supply = <&vreg_0p9>;
> +            vdda-csi01-1p2-supply = <&vreg_1p2>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@1 {
> +                    reg = <1>;
> +
> +                    csiphy1_ep: endpoint {
> +                        clock-lanes = <4>;
> +                        data-lanes = <0 1>;
> +                        remote-endpoint = <&camera_sensor>;
> +                    };
> +                };
> +            };
> +        };
> +    };

Other than the patternProperties and newlines looks OK to me.

---
bod


