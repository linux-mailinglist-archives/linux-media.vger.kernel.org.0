Return-Path: <linux-media+bounces-55834-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELcWItZjt2kMQwEAu9opvQ
	(envelope-from <linux-media+bounces-55834-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 02:58:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3F9293B47
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 02:58:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 330E4300F5E3
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 01:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3552D2DEA9B;
	Mon, 16 Mar 2026 01:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GZX53rIG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BFD15CD74
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 01:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773626306; cv=none; b=shVPItZ4nJpAPe9FQmJyHvDXMW0ZuI1nBzMqn3NeuetDnFuo0cXIiMw/Lxm26mwuzd2JDNdNpTkyUMgwYxW99vgKaGMFU8kqaffOywCGWRFgLEP6+JpFO2GoCUQhKMw/JErQL5Tj/P78bmEdAL/c4CcQzFuOHsiL3YRDwR+tKR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773626306; c=relaxed/simple;
	bh=Ty2dBj+8Bw2CujJp8+SVaVCWYcyRifchJHq8g0U4lnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qCAXFQSF/aKyLn45Zu7UhCTwo5vJBOLMy8+AJlbawlHNjo6YYTYK2LORICfc3+ypYHxVij3RwMD8gL7arQ3JaYQF4YN+8L7azLqJ1+ki/lNsj/+vLumRXHsMVX/U8dc3VhVGtnaUkUA2QM0N4mb84o1ZgV2HMSTcswsHBoRkvLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GZX53rIG; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a1253d63a8so580539e87.0
        for <linux-media@vger.kernel.org>; Sun, 15 Mar 2026 18:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773626303; x=1774231103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWl/vihcNT+qze+DwQkZ3TOdVObh3Uxnygms3P6Epps=;
        b=GZX53rIGxoH08N64zSTdao4SP9GzAM/pDx4LEK7kOSmkEfjzr0rm/uPV7d5zzdWcFl
         0ZPZslWlv/wxACe3aQ4RVOEIYXAJKc2EO8VBzPRVczPumdCIoCCl0lOjs9QY+VptSAxL
         o8zcLC3Hzo8lsbBFeKqrocT/kqRz/IdhlTOocqjX7lH+2R8CnFFu9gELyGlQYhmKG55C
         ZjVoSSsXZ1jGborIHkHK5UKx70XVPkrFx6YliqU3rOrfxckkUUUID36J8Y+1EHuOCbMY
         Fxy0P5oftGv9FmLsKLpjpT6wG5sa4rNSL5tNNWEU2UUaUbV1KVxnSy3+nXLx1tD5twE1
         0fkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773626303; x=1774231103;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gWl/vihcNT+qze+DwQkZ3TOdVObh3Uxnygms3P6Epps=;
        b=J24FjjzKzw9bdcEQ5SU7jqGjyQTFZCE3p2iYbwtt6eL1qpg4dkstc5gbVyEJ8Q7P6X
         AQffJt5zWWBGpBROYIPdU6Bcx8zPcxbaPL1QJsqTXbl1iMVsrT6pm/UN2/jt+K6dyNX1
         aIVlFa56B5hvVaz+5ubncojrIi+ifJUMmNwhqGux0hZzcRlKFrLKUqhLvvj5OkaBENfL
         jy5WMtBsiuFgT09QH4jBslTl0lhTzblFTAyCHA8xCLmG1naYN5XXtXTgJaKue+8fM4SM
         m5iKlf9KUy3EElbUFULhNnbIqKuDH2+4JjaecMPdAL/8wNNtV0xNIsmupAwICSaDsKsV
         QuGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU51gKoRAxYCJUVLE5gFnCQrmyNNJWUFzjpOIzAgLBj0EGXVUU8MLyPNSWggedUCVCJR5muH8AnJsaA/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/mYfeyk/XYd2TL2TvECaeslFchstd7KM/uVexkCP7huTfCrAS
	q1opugnvoBljdjUg3t5Z0ENFy23X/Ff+E5/kxSSwsRfjSBt/ShMGA38X4rVYYHLOZXQ=
X-Gm-Gg: ATEYQzznFnabz002RmWEam+GV+4SCuzS3wjumdgMC68ZdFv2YgJaQV/LLejVoVDe8hD
	eZTTF68cRax5bmNT5AYWh05k/sO2wEyX/Z9MjPshA5LYLARuJVU270iw6Q8a/SJ9kCfwuWtoNi5
	geMwH+0Ik/F41vh3P/9ei/9FnKMJFPNL6gN75HOCwa9B8igwESPn9Gku84IgdPPm6OghxuHm9Xs
	KEhcpv6EPf1Z/P1mipsBsGrBIp1xJLpkWp4NfxL6cR0nHE2NgviEjZJ1viO4OY1dC84CG3ViXx1
	f1NUjrpYyDOlCDFW5X8uwZiDXTsioZx6oSZim7eqERIQMYsifrVKjuog2nj/xSrcElF6YzSQd5U
	rsVC5nM+dcBZbKjaqD0LuSFRqGwj4AiTnDm22GjepPkCv/HlIOaNXXkBrNLZ7Z55q/3U2GXc7gT
	TTjoxW+xC7bRfZE/dJGKRbeD3tRKbBKE30YvXA/npd0m9evw7zUDtJg8WfsySE78xggq85eN8/R
	MhzIQ==
X-Received: by 2002:a05:651c:f13:b0:38a:2e66:c9f6 with SMTP id 38308e7fff4ca-38a8976d463mr16594801fa.4.1773626303262;
        Sun, 15 Mar 2026 18:58:23 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5f0ecsm29971971fa.29.2026.03.15.18.58.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 18:58:21 -0700 (PDT)
Message-ID: <c59f621f-23a0-4c60-b8e3-5a9082c816e2@linaro.org>
Date: Mon, 16 Mar 2026 03:58:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-1-90c09203888d@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260315-x1e-csi2-phy-v4-1-90c09203888d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-55834-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid,ace4000:email,devicetree.org:url]
X-Rspamd-Queue-Id: DE3F9293B47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 01:52, Bryan O'Donoghue wrote:
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
>   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 133 +++++++++++++++++++++
>   1 file changed, 133 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..b83c2d65ebc6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -0,0 +1,133 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm CSI2 PHY
> +
> +maintainers:
> +  - Bryan O'Donoghue <bod@kernel.org>
> +
> +description:
> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY

Hence there should be a description of phy-type property, or it could be
specified in a cell on the client's side.

> +  modes.
> +
> +properties:
> +  compatible:
> +    const: qcom,x1e80100-csi2-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 1

The description is missing.

> +
> +  clocks:
> +    maxItems: 4
> +
> +  clock-names:
> +    items:
> +      - const: csiphy
> +      - const: csiphy_timer
> +      - const: camnoc_axi
> +      - const: cpas_ahb
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  operating-points-v2:
> +    maxItems: 1
> +
> +  power-domains:
> +    items:
> +      - description: TITAN TOP GDSC
> +      - description: MXC or MXA voltage rail
> +      - description: MMCX voltage rail
> +
> +  power-domain-names:
> +    items:
> +      - const: top
> +      - const: mx
> +      - const: mmcx
> +
> +  vdda-0p8-supply:
> +    description: Phandle to a 0.8V regulator supply to a PHY.

On Hamoa the CSIPHY supply voltage is 0.88-0.92, so it is 0p9 rather than 0p8.

> +
> +  vdda-1p2-supply:
> +    description: Phandle to 1.2V regulator supply to a PHY.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - operating-points-v2
> +  - power-domains
> +  - power-domain-names
> +  - vdda-0p8-supply
> +  - vdda-1p2-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/phy/phy.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>

Please sort the list of headers alphanumerically.

> +
> +    csiphy@ace4000 {
> +        compatible = "qcom,x1e80100-csi2-phy";
> +        reg = <0x0ace4000 0x2000>;
> +        #phy-cells = <1>;
> +
> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +                 <&camcc CAM_CC_CPAS_AHB_CLK>;
> +        clock-names = "csiphy",
> +                      "csiphy_timer",
> +                      "camnoc_axi",
> +                      "cpas_ahb";
> +
> +        operating-points-v2 = <&csiphy_opp_table>;
> +
> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +                        <&rpmhpd RPMHPD_MX>,
> +                        <&rpmhpd RPMHPD_MMCX>;
> +        power-domain-names = "top",
> +                             "mx",
> +                             "mmcx";
> +
> +        vdda-0p8-supply = <&vreg_l2c_0p8>;
> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
> +    };
> +
> +    csiphy_opp_table: opp-table {
> +        compatible = "operating-points-v2";
> +
> +        opp-300000000 {
> +            opp-hz = /bits/ 64 <300000000>;
> +            required-opps = <&rpmhpd_opp_low_svs_d1>,
> +                            <&rpmhpd_opp_low_svs_d1>;
> +        };
> +
> +        opp-400000000 {
> +            opp-hz = /bits/ 64 <400000000>;
> +            required-opps = <&rpmhpd_opp_low_svs>,
> +                            <&rpmhpd_opp_low_svs>;
> +        };
> +
> +        opp-480000000 {
> +            opp-hz = /bits/ 64 <480000000>;
> +            required-opps = <&rpmhpd_opp_low_svs>,
> +                            <&rpmhpd_opp_low_svs>;
> +        };
> +    };
> 

-- 
Best wishes,
Vladimir

