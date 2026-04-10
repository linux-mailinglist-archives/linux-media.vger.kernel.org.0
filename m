Return-Path: <linux-media+bounces-58486-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMsbLGav2GljgwgAu9opvQ
	(envelope-from <linux-media+bounces-58486-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 10:05:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 365343D3C0B
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 10:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 270A530164BC
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 07:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DEB33A960E;
	Fri, 10 Apr 2026 07:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QGtl0Ggr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEE839E183
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 07:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775807976; cv=none; b=LL7YY+Z4EfapT0GkC3zsrAiKT92e6TAL7ia/iHdAPzW+N07beT1eS/dN/PtYwe8WyOxpYqJqwDcm74JeDrRH0X0Qh9K5Li+Fer/KgGEAWL2lyBT+HXwG0kgjAHe+sMHHD9YSuujL0LqM5ffgjXVYEI00mnoIvm+YwtBsvbk2IG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775807976; c=relaxed/simple;
	bh=ReCnQiXwPqST0TGoob6Ww1TBHNZ5qFEgT0ouTZPYyGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A72c5+06hScp1aQoubZY+79FYknBStLlUraX0ZkTU2cUyzbs4RCSXJj7ylFQAcJwIRwITpZfMjJkE3aTPFhSrYE73QrzauhOhsYf7daNzFRRxmaMfNDMs70bs2fBacLvUxCEaxlhIYDYkB5u5kNmVNP5lQg4OhrYXdAoTp/6FjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QGtl0Ggr; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6708c954b94so604684a12.1
        for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 00:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775807973; x=1776412773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fEyhOgcjSBi5KOFIDLHmALEjF7/wDBOBx21rWp3qA6k=;
        b=QGtl0GgrS+/b0Jf8nmB9weYBhz5CremIVYrZa2ZF9alsBFZcG4Y9WdpoWnHwnLoMcE
         Pm8vTLgrTl54UPVvwqUEgVmmupSdb0yGUu7NQ28qU7+5TTr9dJbDo1oEpi3Tu30MXt8P
         jTpbUhP424ZDuc4qCh+SFE/OwgoZm0n93g/U1PPB1JuEbU5oMw9yTITZ2xgZSWzf6fsw
         tgBOgQ5bFqWxC8vTc8rj04tR6QScgEppYzZEf2RdDEgxioIFT5dkMpzQ9wvjPUxF1kXj
         /KRfbfys0PU/BblS/XbRC3F73w134PaohGDrbho1bM4ZALX2czI0zyIUuUyjgbrFNmOZ
         E6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775807973; x=1776412773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEyhOgcjSBi5KOFIDLHmALEjF7/wDBOBx21rWp3qA6k=;
        b=RFb+RGB9LtcGufFu5qGJOBvxM5qQPYzK7asgTrbmgnt37bSOIETwo5XrJTvO4ZWdZR
         c7L25cTaG9x+FJUio01jcF0rHitKDXJXGo10FuMDOV51wAaKKgkhHwAaUyI3NkoHkv1V
         0FxaeMkySz8YDJgtbUXsA6xNLWUYf4Pz7dhMCeKAifvwk5q7AbJ+WKW9gjwpUkXiHTp4
         YoHXHHSBLsoE6PngknpvQWG6JflgQz+tgfThKB84Y6i35WhwpzswDeiGqQciHwKPQg3e
         Hmil/2E+ogIwl/DnmNrkkEX3k2xORNmBEBN/czUWhOOYB5Mz8bynGxoWDcDJaBZl4/72
         jhQA==
X-Gm-Message-State: AOJu0YzmDWSWLbAX9CRLOOLMPJD2noW+zo4+OP/M/gMXJLlhfUiVjJof
	+0//yhX3fTVoU1OEPjBgwKoKD0gsMl+uyw+3t+HF6zgmvZbSiEURf32ePUKvg1UtAmo=
X-Gm-Gg: AeBDietyY4s7Oi1FuCVISNlS3xlbRf9sTU+hQDKKAIdzewSGcGQ3A1s8IOZ9nKW90hF
	BIaxsE5Lb2gCFhFyvIuPBROgFEnwTC1xwCTU+jqvxxcYlPceAQeRxgTNV1NrIV0hyYLctp081mv
	QeulRTwEBt4EDE2fFyzjtEac9W3w3jvDYFWLmdfDyvI8rcOT1mf1MsfSGEW2aC7xMAYupoiN4Le
	wvVS1pOs2WZgXPBIceMT0nLGafR0/urtVreSWztiVJl/OC7+LtE+KH8gm9zdbtHYFp65WQpjadR
	MPdjvLVwZJU1CTFl+dNlGVjK6HWsIndhYvxfitGIVTqGg9wg0dL+crC1DRAEsrmzmU29ztOinkf
	1pXEcTx4Wo9HID6SotaI3DUHOBpPXOPT1p+wQ5T84fJX2VFaNJMJGeUSTJoDJBDfRJGkkCj7OEE
	vqD1x9PBHeWYaTYeKaDT0yrOXe16M/4GtI5LVzJGl3hG9k6ecyRPzmkpuwqgxRktSh0u8CBQkpK
	S4uw5+gssl4C51/m0m8ekiG8j/7q3y9T82NN42zFVGtluM/325MBI68Rz4rg8wcbhrqYTVEbHS2
	SgTktNriR0Wang==
X-Received: by 2002:a17:907:6b8e:b0:b9c:a5b4:6208 with SMTP id a640c23a62f3a-b9d727931bbmr115842566b.16.1775807972889;
        Fri, 10 Apr 2026 00:59:32 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f188fsm58134166b.59.2026.04.10.00.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 00:59:32 -0700 (PDT)
Message-ID: <ccee11ac-a84e-4120-99eb-712e88350c41@linaro.org>
Date: Fri, 10 Apr 2026 08:59:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: media: Add bindings for
 qcom,x1p42100-camss
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com>
 <20260410-purwa_camss-v1-1-eedcf6d9d8ee@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260410-purwa_camss-v1-1-eedcf6d9d8ee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58486-lists,linux-media=lfdr.de];
	R_DKIM_ALLOW(0.00)[linaro.org:s=google];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_SPAM(0.00)[0.942];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[acb7000:email,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.1:email,devicetree.org:url]
X-Rspamd-Queue-Id: 365343D3C0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10/04/2026 05:25, Wenmeng Liu wrote:
> Add bindings for the Camera Subsystem for X1P42100.
> 
> The X1P42100 platform provides:
> - 2 x CSIPHY
> - 3 x TPG
> - 3 x CSID
> - 2 x CSID Lite
> - 1 x IFE
> - 2 x IFE Lite
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   .../bindings/media/qcom,x1p42100-camss.yaml        | 424 +++++++++++++++++++++
>   1 file changed, 424 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..8bfa7e616c3b6b91adc8e21ebfbbe6fb579484f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml
> @@ -0,0 +1,424 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,x1p42100-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm X1P42100 Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,x1p42100-camss
> +
> +  reg:
> +    maxItems: 14
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csid_wrapper
> +      - const: csiphy0
> +      - const: csiphy4
> +      - const: csitpg0
> +      - const: csitpg1
> +      - const: csitpg2
> +      - const: vfe0
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +
> +  ranges: true
> +
> +  clocks:
> +    maxItems: 22
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_nrt_axi
> +      - const: camnoc_rt_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: cpas_fast_ahb
> +      - const: cpas_vfe0
> +      - const: cpas_vfe_lite
> +      - const: cphy_rx_clk_src
> +      - const: csid
> +      - const: csid_csiphy_rx
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy4
> +      - const: csiphy4_timer
> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf
> +      - const: vfe0
> +      - const: vfe0_fast_ahb
> +      - const: vfe_lite
> +      - const: vfe_lite_ahb
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +
> +  interrupts:
> +    maxItems: 10
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy4
> +      - const: vfe0
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: ahb
> +      - const: hf_mnoc
> +      - const: sf_mnoc
> +      - const: sf_icp_mnoc
> +
> +  iommus:
> +    oneOf:
> +      - items:
> +          - description: S1 HLOS IFE and IFE_LITE non-protected read
> +          - description: S1 HLOS IFE and IFE_LITE non-protected write
> +          - description: S1 HLOS SFE non-protected read
> +          - description: S1 HLOS SFE non-protected write
> +          - description: S1 HLOS CDM IFE non-protected
> +          - description: Legacy slot 0 - do not use
> +          - description: Legacy slot 1 - do not use
> +          - description: Legacy slot 2 - do not use
> +      - items:
> +          - description: S1 HLOS IFE and IFE_LITE non-protected read
> +          - description: S1 HLOS IFE and IFE_LITE non-protected write
> +          - description: S1 HLOS SFE non-protected read
> +          - description: S1 HLOS SFE non-protected write
> +          - description: S1 HLOS CDM IFE non-protected
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: top
> +
> +  vdd-csiphy-0p8-supply:
> +    description:
> +      0.8V supply to a PHY.
> +
> +  vdd-csiphy-1p2-supply:
> +    description:
> +      1.2V supply to a PHY.
> +
> +  phys:
> +    maxItems: 2
> +
> +  phy-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy4
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports. Supports either standard single sensor mode or
> +      Qualcomm's combo mode with one sensor in 2x1 + 1x1 data-lane, clock-lane mode.
> +
> +    patternProperties:
> +      "^port@[0-3]$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +
> +        description:
> +          Input port for receiving CSI data.
> +
> +        properties:
> +          endpoint@0:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            description:
> +              Endpoint for receiving a single sensor input (or first leg of combo).
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4 # Base max allows 4 (for D-PHY)
> +
> +              clock-lanes:
> +                maxItems: 1
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +          endpoint@1:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            description:
> +              Endpoint for receiving the second leg of a combo sensor input.
> +
> +            properties:
> +              data-lanes:
> +                maxItems: 1
> +
> +              clock-lanes:
> +                maxItems: 1
> +
> +              bus-type:
> +                const: 4 # Combo is D-PHY specific
> +
> +            required:
> +              - data-lanes
> +
> +        allOf:
> +          # Case 1: Combo Mode (endpoint@1 is present)
> +          # If endpoint@1 exists, we restrict endpoint@0 to 2 lanes (D-PHY split)
> +          - if:
> +              required:
> +                - endpoint@1
> +            then:
> +              properties:
> +                endpoint@0:
> +                  properties:
> +                    data-lanes:
> +                      minItems: 2
> +                      maxItems: 2
> +                    bus-type:
> +                      const: 4
> +                endpoint@1:
> +                  properties:
> +                    data-lanes:
> +                      minItems: 1
> +                      maxItems: 1
> +                    bus-type:
> +                      const: 4
> +
> +          # Case 2: Single Mode (endpoint@1 is missing)
> +          # We explicitly allow up to 4 lanes here to cover the D-PHY use case.
> +          - if:
> +              not:
> +                required:
> +                  - endpoint@1
> +            then:
> +              properties:
> +                endpoint@0:
> +                  properties:
> +                    data-lanes:
> +                      minItems: 1
> +                      maxItems: 4
> +
> +patternProperties:
> +  "^phy@[0-9a-f]+$":
> +    $ref: /schemas/phy/qcom,x1e80100-csi2-phy.yaml
> +    unevaluatedProperties: false
> +
> +  "^opp-table(-.*)?$":
> +    type: object
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +  - power-domains
> +  - power-domain-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
> +    #include <dt-bindings/phy/phy.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss: isp@acb7000 {
> +            compatible = "qcom,x1p42100-camss";
> +
> +            reg = <0 0x0acb7000 0 0x2000>,
> +                  <0 0x0acb9000 0 0x2000>,
> +                  <0 0x0acbb000 0 0x2000>,
> +                  <0 0x0acc6000 0 0x1000>,
> +                  <0 0x0acca000 0 0x1000>,
> +                  <0 0x0acb6000 0 0x1000>,
> +                  <0 0x0ace4000 0 0x1000>,
> +                  <0 0x0acec000 0 0x4000>,
> +                  <0 0x0acf6000 0 0x1000>,
> +                  <0 0x0acf7000 0 0x1000>,
> +                  <0 0x0acf8000 0 0x1000>,
> +                  <0 0x0ac62000 0 0x4000>,

Is this the full extent of the VFE ? It looks like not to me.

For each register block please make sure you cover the _entire_ range of 
the block not just the RDI part of it.

> +                  <0 0x0acc7000 0 0x2000>,
> +                  <0 0x0accb000 0 0x2000>;
> +
> +            reg-names = "csid0",
> +                        "csid1",
> +                        "csid2",
> +                        "csid_lite0",
> +                        "csid_lite1",
> +                        "csid_wrapper",
> +                        "csiphy0",
> +                        "csiphy4",
> +                        "csitpg0",
> +                        "csitpg1",
> +                        "csitpg2",
> +                        "vfe0",
> +                        "vfe_lite0",
> +                        "vfe_lite1";
> +
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges;
> +
> +            clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +                     <&camcc CAM_CC_CORE_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> +                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_CPHY_RX_CLK_SRC>,

_SRC clocks are generally not necessary, is this one ?

> +                     <&camcc CAM_CC_CSID_CLK>,
> +                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +                     <&camcc CAM_CC_CSIPHY0_CLK>,
> +                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY4_CLK>,
> +                     <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                     <&camcc CAM_CC_IFE_0_CLK>,
> +                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +
> +            clock-names = "camnoc_nrt_axi",
> +                          "camnoc_rt_axi",
> +                          "core_ahb",
> +                          "cpas_ahb",
> +                          "cpas_fast_ahb",
> +                          "cpas_vfe0",
> +                          "cpas_vfe_lite",
> +                          "cphy_rx_clk_src",
> +                          "csid",
> +                          "csid_csiphy_rx",
> +                          "csiphy0",
> +                          "csiphy0_timer",
> +                          "csiphy4",
> +                          "csiphy4_timer",
> +                          "gcc_axi_hf",
> +                          "gcc_axi_sf",
> +                          "vfe0",
> +                          "vfe0_fast_ahb",
> +                          "vfe_lite",
> +                          "vfe_lite_ahb",
> +                          "vfe_lite_cphy_rx",
> +                          "vfe_lite_csid";
> +
> +           interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +                        <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +                        <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +                        <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +                        <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +                        <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +                        <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +                        <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +                        <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +                        <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
> +
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csid_lite0",
> +                              "csid_lite1",
> +                              "csiphy0",
> +                              "csiphy4",
> +                              "vfe0",
> +                              "vfe_lite0",
> +                              "vfe_lite1";
> +
> +            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +
> +            interconnect-names = "ahb",
> +                                 "hf_mnoc",
> +                                 "sf_mnoc",
> +                                 "sf_icp_mnoc";
> +
> +            iommus = <&apps_smmu 0x800 0x60>,
> +                     <&apps_smmu 0x820 0x60>,
> +                     <&apps_smmu 0x840 0x60>,
> +                     <&apps_smmu 0x860 0x60>,
> +                     <&apps_smmu 0x18a0 0x0>;

Please define which IOMMUs these are - I'd like to make sure the top 
level node maps the IFE IOMMUs and not the ICP IOMMUs - as ICP should be 
its own sub/separate node.

> +
> +            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
> +                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +            power-domain-names = "ife0",
> +                                 "top";
> +
> +            vdd-csiphy-0p8-supply = <&csiphy_0p8_supply>;
> +            vdd-csiphy-1p2-supply = <&csiphy_1p2_supply>;



> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    csiphy_ep0: endpoint {
> +                        data-lanes = <0 1>;
> +                        remote-endpoint = <&sensor_ep>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> 


