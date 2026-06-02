Return-Path: <linux-media+bounces-63443-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fbo4Jl9TH2o1kgAAu9opvQ
	(envelope-from <linux-media+bounces-63443-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 00:04:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B65263253B
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 00:04:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="e26UbWN/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63443-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63443-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF59D307349F
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 21:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F75A3B1029;
	Tue,  2 Jun 2026 21:59:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A6D383338
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 21:59:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780437591; cv=none; b=pqRXzxZjaHyAVSi1hlR9fFx7PECox3k9fKPsTP6MS9rXH2XelTeaoZzb8zLs3NBrZj30cXSYCrWeaALGfL6auUD/z4G9CC6Rbwefkl0ZlHwkqEgOMDyrGV5V5VWiBvzftAHPHebke/vf3DEgiWI9bsoNNv765a8cByb0sbjUZlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780437591; c=relaxed/simple;
	bh=B5wOD4aE4a17EXFpKcNzecgy6k/iGpJ3WdyEjdtjTrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lwv0h6dxDqc7x03s5+pAuS0UaM+JDcMKZNbTHOfwgEmI/Pfe/WGDsnSINde89bhvVtV9ylV6BKhWpGtI4vsWpcVOg6lUNepvDVN9cCkoKWWx2REOCi5m0rhnfRirQjA+BptU+81EeFU5Xrhxu48XGIc7R3ckJXgY0Y330qtuI2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e26UbWN/; arc=none smtp.client-ip=209.85.208.181
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3966e5e7cebso4953591fa.2
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 14:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780437587; x=1781042387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rYnZ3lqT7DmKRSTxtVSgTNnxHdLejTszMrt6K93BCk=;
        b=e26UbWN/7eZLaMpiJIw3nw5ADo2j0I/ERoKbCdORwsrvLSDdw+iIGoWk+j+HYfp3zE
         FIw24wHtYm2SCP+d6DTmH3V0bIiRPrgoQgIkYEr31P+kNUb5OXcvOj9pTU1m1iKHjisw
         VDZhkXeyULah1M5ttYEpElI5qi5mWwN3wffQozAkBug+BffRK5nknStpts+uLxUHRUaS
         EQy1RI0+SPsIHvcqgBoDmd4ooekzev26DiXSFE8XfLURzsbKzURLSjUHoRox5Dg56ART
         PWissr7BWWbP6+7bWW8bLDxuUnt6X//Y3Wfl+fDtuVfLLwPhtUplIencnRLLS3yeF8S2
         SopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780437587; x=1781042387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/rYnZ3lqT7DmKRSTxtVSgTNnxHdLejTszMrt6K93BCk=;
        b=TanDhnv03xkihQzy3N4Wy5ob4t6UWs4rQDR+D7bUob4ylMwfxl7LXuEZW0FtzfnR48
         LTgQzkITZ3yYdKj4iCn7M0b2hbqiHhV6PjPt0GhLSpJKG9inAN2GIbF7ndoej+jqkwky
         KVyBcm9mhFMHe8BhYbQ0h4R/Mx7rqaM1U+miXNEqRbLwrb+AdO7q3Ph60tQ3ea3aCs4/
         dNlOLSbI13vyyzfqd0ozTXhPiKdP+3Mx66qKbpGXvuREPcfgQ+4DSgeCr9ta9GlZFRFs
         QkRubTGATmjg5B6Bu5VjsX0uDyPIqxdsfdam3PdILud/lXupWJat27ZOTQQ0EVtOKqkV
         LcUw==
X-Forwarded-Encrypted: i=1; AFNElJ+lE19Snj78LeTOAxT0dOTLFCFT8GVhIHGZNgD8lIxRFvPvB4TbjYmSK5uoIM59rD37sR6XJHtrH4ScyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi6Y+f+8zk8Y8F3WDTCSmSYFr98g7bu5i6ao2l/P8EyFlZujtd
	6x7dbmS/1DMwyX+kBHej7YGx3rK70G0HeM9/egl9QxBKcPaY2G/b0QgNjGC2JuWAPSI=
X-Gm-Gg: Acq92OHzvloInQuzdddEcfRh5Ia3aPj57ea7wnEngBPkYPsgwMyn3Xgu0hxPvovGIIN
	jip3f/qiyEwkEx2Ncr7vpB4KFsMaSLsZhLj+gDMv/AuJcay7Um56lsQYfLWZ9LWxZEq15e9RiQi
	9/alqFjeGrO30InjqnwfQlbV7Jpv+JZIkCZ/8e0WTZ9JSD1GC/OYB+yXQCtasTx0bhk8S3xUJ3x
	n7dQKr7l+wguRCojK1Z+mEko/vFijed/Of3IvFf4rYLaOljG34g4FHwBCUcJ+xGvHj8Kz06TMh8
	tR1cpkn9VVzMzI+GDIPOV8FquPfSTaiy0vc7N8PPr7U4FAjVgctZzC7Qe+DuxZcrvNFAjUzkzgr
	hcUjHlACkjnDcSmrrQvQEhx56Skl2a4cH+HpMDzTXLH5HxeV4togDtx3Cs3TeIVw4t0lQIHxX93
	VVzcLB/jpwNpcjoUt42i0PCOHDLJlNyOJgac9g+sAbD2R2WLvOfQAvKm7fHGsho554NlZPtX1i/
	HkrY6FudWNWanDS
X-Received: by 2002:a2e:bc2a:0:b0:396:975f:c384 with SMTP id 38308e7fff4ca-396ac314d06mr1880491fa.6.1780437587064;
        Tue, 02 Jun 2026 14:59:47 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abd6cbe6sm3606351fa.0.2026.06.02.14.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 14:59:46 -0700 (PDT)
Message-ID: <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
Date: Wed, 3 Jun 2026 00:59:40 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63443-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:bod@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:mid,linaro.org:dkim,linaro.org:from_mime,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B65263253B

On 5/23/26 05:48, Bryan O'Donoghue wrote:
> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
> PHY devices.
> 
> The hardware can support both CPHY, DPHY and a special split-mode DPHY.
> 
> The schema here defines three ports:
> 
> port@0:
>      The first input port where a sensor is always required.
> 
> port@1:
>      A second optional input port which if present implies DPHY split-mode.
> 
> port@2:
>      A third always required output port which connects to the controller.
> 

This port numeration is imperfect, because port@0 and port@2 are required,
while middle port@1 is optional.

Like it was stated before a number of times, it seems natural to operate
with two ports, where input port may have two endpoints rather than 3 ports,
also that approach solves the problem of a hole in the port numeration.

> The CSIPHY devices have their own pinouts on the SoC as well as their own
> individual voltage rails.
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
>   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 209 +++++++++++++++++++++
>   1 file changed, 209 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..270375f949880
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -0,0 +1,209 @@
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
> +    description:
> +      The single cell specifies the PHY operating mode.

#phy-cells should be 0, because the PHY operating mode is well defined
by 'bus-type' property of an endpoint on the sensor side, the opposite
side of CAMSS/CSID as a CSIPHY "consumer" should not dictate the PHY type.

> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: timer
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  operating-points-v2:
> +    maxItems: 1
> +
> +  power-domains:
> +    items:
> +      - description: MMCX voltage rail
> +      - description: MXC or MXA voltage rail

Only "qcom,x1e80100-csi2-phy" device is supported so far, unlikely it's
the case that "MXC or MXA voltage rail" should be specified, it'd be
just one of two or both.

> +
> +  power-domain-names:
> +    items:
> +      - const: mmcx
> +      - const: mx
> +
> +  vdda-0p9-supply:
> +    description: Phandle to a 0.9V regulator supply to a PHY.
> +
> +  vdda-1p2-supply:
> +    description: Phandle to 1.2V regulator supply to a PHY.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description: Sensor input. Always present.
> +        unevaluatedProperties: false
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +              clock-lanes:
> +                maxItems: 1
> +              remote-endpoint: true
> +            required:
> +              - data-lanes
> +              - remote-endpoint
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description:
> +          Second sensor input. When present, indicates DPHY split mode.
> +        unevaluatedProperties: false
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                maxItems: 1
> +              clock-lanes:
> +                maxItems: 1
> +              remote-endpoint: true
> +            required:
> +              - data-lanes
> +              - clock-lanes
> +              - remote-endpoint

As it's stated above, it should be converted to a single port with two
endpoints, it'd be done in accordance to video-interfaces.yaml.

> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description: Output to CAMSS controller.
> +        unevaluatedProperties: false
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +            unevaluatedProperties: false
> +            properties:
> +              remote-endpoint: true
> +            required:
> +              - remote-endpoint
> +
> +    required:
> +      - port@0
> +      - port@2
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
> +  - vdda-0p9-supply
> +  - vdda-1p2-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    csiphy4: csiphy@ace4000 {
> +        compatible = "qcom,x1e80100-csi2-phy";
> +        reg = <0x0ace4000 0x2000>;
> +        #phy-cells = <1>;
> +
> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
> +        clock-names = "core",
> +                      "timer";
> +
> +        operating-points-v2 = <&csiphy_opp_table>;
> +
> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +        power-domains = <&rpmhpd RPMHPD_MMCX>,
> +                        <&rpmhpd RPMHPD_MX>;
> +        power-domain-names = "mmcx",
> +                             "mx";
> +
> +        vdda-0p9-supply = <&vreg_l2c_0p8>;
> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                csiphy0_in_ep: endpoint {
> +                    data-lanes = <0 1>;
> +                    clock-lanes = <2>;
> +                    remote-endpoint = <&sensor_out>;
> +                };
> +            };
> +
> +            port@2 {
> +                reg = <2>;
> +                csiphy0_out_ep: endpoint {
> +                    remote-endpoint = <&controller_in>;
> +                };
> +            };
> +        };
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
> +                            <&rpmhpd_opp_low_svs_d1>;
> +        };
> +
> +        opp-480000000 {
> +            opp-hz = /bits/ 64 <480000000>;
> +            required-opps = <&rpmhpd_opp_low_svs>,
> +                            <&rpmhpd_opp_low_svs_d1>;
> +        };
> +    };
> 

-- 
Best wishes,
Vladimir

