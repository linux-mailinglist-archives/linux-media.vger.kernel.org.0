Return-Path: <linux-media+bounces-63451-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F/EVHUxgH2qGlQAAu9opvQ
	(envelope-from <linux-media+bounces-63451-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 00:59:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDED632BA9
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 00:59:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nSNBrbGU;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63451-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63451-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 151EE3093286
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 22:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940253B5E07;
	Tue,  2 Jun 2026 22:51:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36703A7597;
	Tue,  2 Jun 2026 22:51:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780440704; cv=none; b=QA/DwzaH6qglkK4jLrz+Pwm2jwwEU2pstLqCGMmp64e3ZIwv6T6AD7SPK1YYH7LABD7kq2jkLbzftU2SNd75NyHShsc0vCXEI3pMGN9/oCrqwjnKlkPC1Ch8BFvz+C33uFw4vbV327OzBCbG1q4IqZAVJ5Yzp7WUf+KNJrlV/vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780440704; c=relaxed/simple;
	bh=T7S14RzSTS2wo8K1Bljh4WEg7901q+Yr6AGAL7BZMd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F28pCThj0uDLcVqq78klAkWeHrXLX8PHpY+3l+RCeE8GtdTRFba6C9RB2RzEsRUaYsTeoZWGTcDpvzoVtfgH+38yZlbe10GUnyRpl+MyMPlswJj4POp8VqvaoMekFAk9iPzIqKgByLAFCr+Ajmy0dUYYeOlWc7cVD5ad9592ego=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSNBrbGU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F168F1F00893;
	Tue,  2 Jun 2026 22:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780440702;
	bh=Sz5/MvLLQbOnGXSnuWO8WURL3Y3h66L7BNfbnbvuQXM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nSNBrbGULN/CxYwstnK7Mu/aTW9axi+Q90F4q/3PIM70imp7NJagf8KyKdhje2GAp
	 0wlpTcsKT9HlfYOlwu6zAvyh5QICGf7tWD8PaSf+fc72eaatdfBG6+XaDXh5Nl02XQ
	 nCYV8DNEGnAar89v9R4PCOZSxgAF4d+1rFr01LCIEjJbruq4ys0m2i7iOwVsP1xOGt
	 9ekAdH3m9IRjVNPXfqpydIy677A1OXz/KkNl4CSF9RottHPlUu8lVNcOzc+L4Dgi7L
	 5u3D2egPrSXuNojY6cwX0XPQy/Q4rYi/DQQiot63hwQlB5KEyGIPvVUCAdIscp9wE3
	 8fE7KbiW9Z3DQ==
Message-ID: <478df3ed-d4ef-43aa-bb84-e2075798542b@kernel.org>
Date: Tue, 2 Jun 2026 23:51:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:bryan.odonoghue@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-63451-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BEDED632BA9

On 02/06/2026 22:59, Vladimir Zapolskiy wrote:
> On 5/23/26 05:48, Bryan O'Donoghue wrote:
>> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
>> PHY devices.
>>
>> The hardware can support both CPHY, DPHY and a special split-mode DPHY.
>>
>> The schema here defines three ports:
>>
>> port@0:
>>       The first input port where a sensor is always required.
>>
>> port@1:
>>       A second optional input port which if present implies DPHY split-mode.
>>
>> port@2:
>>       A third always required output port which connects to the controller.
>>
> 
> This port numeration is imperfect, because port@0 and port@2 are required,
> while middle port@1 is optional.
> 
> Like it was stated before a number of times, it seems natural to operate
> with two ports, where input port may have two endpoints rather than 3 ports,
> also that approach solves the problem of a hole in the port numeration.

Can you confirm this is what you are after ?

port@0 {
     #address-cells = <1>;
     #size-cells = <0>;

     endpoint@0 {              /* primary sensor */
         reg = <0>;
         data-lanes = <0 1 2 3>;
         remote-endpoint = <&sensor0_out>;
     };

     endpoint@1 {              /* split-mode second sensor, optional */
         reg = <1>;
         data-lanes = <0>;
         remote-endpoint = <&sensor1_out>;
     };
};

port@1 {                     /* output to CAMSS, was port@2 */
     endpoint { remote-endpoint = <&controller_in>; };
};

This works for me BTW.

>> The CSIPHY devices have their own pinouts on the SoC as well as their own
>> individual voltage rails.
>>
>> The need to model voltage rails on a per-PHY basis leads us to define
>> CSIPHY devices as individual nodes.
>>
>> Two nice outcomes in terms of schema and DT arise from this change.
>>
>> 1. The ability to define on a per-PHY basis voltage rails.
>> 2. The ability to require those voltage.
>>
>> We have had a complete bodge upstream for this where a single set of
>> voltage rail for all CSIPHYs has been buried inside of CAMSS.
>>
>> Much like the I2C bus which is dedicated to Camera sensors - the CCI bus in
>> CAMSS parlance, the CSIPHY devices should be individually modelled.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>    .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 209 +++++++++++++++++++++
>>    1 file changed, 209 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> new file mode 100644
>> index 0000000000000..270375f949880
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> @@ -0,0 +1,209 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm CSI2 PHY
>> +
>> +maintainers:
>> +  - Bryan O'Donoghue <bod@kernel.org>
>> +
>> +description:
>> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
>> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
>> +  modes.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,x1e80100-csi2-phy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#phy-cells":
>> +    const: 1
>> +    description:
>> +      The single cell specifies the PHY operating mode.
> 
> #phy-cells should be 0, because the PHY operating mode is well defined
> by 'bus-type' property of an endpoint on the sensor side, the opposite
> side of CAMSS/CSID as a CSIPHY "consumer" should not dictate the PHY type.

Rob said consumer but, I'm also not very bothered about that. bus-type 
is perfectly acceptable to me.

>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: timer
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  operating-points-v2:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    items:
>> +      - description: MMCX voltage rail
>> +      - description: MXC or MXA voltage rail
> 
> Only "qcom,x1e80100-csi2-phy" device is supported so far, unlikely it's
> the case that "MXC or MXA voltage rail" should be specified, it'd be
> just one of two or both.

Hmm. I'm not being clear here if this is your take, I will reword it to 
make it clearer this generation of PHY _must_ have either

- MMCX and MXC
or
- MMCX and MXA

>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: mmcx
>> +      - const: mx
>> +
>> +  vdda-0p9-supply:
>> +    description: Phandle to a 0.9V regulator supply to a PHY.
>> +
>> +  vdda-1p2-supply:
>> +    description: Phandle to 1.2V regulator supply to a PHY.
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        description: Sensor input. Always present.
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +            properties:
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +              clock-lanes:
>> +                maxItems: 1
>> +              remote-endpoint: true
>> +            required:
>> +              - data-lanes
>> +              - remote-endpoint
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        description:
>> +          Second sensor input. When present, indicates DPHY split mode.
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +            properties:
>> +              data-lanes:
>> +                maxItems: 1
>> +              clock-lanes:
>> +                maxItems: 1
>> +              remote-endpoint: true
>> +            required:
>> +              - data-lanes
>> +              - clock-lanes
>> +              - remote-endpoint
> 
> As it's stated above, it should be converted to a single port with two
> endpoints, it'd be done in accordance to video-interfaces.yaml.
> 
>> +
>> +      port@2:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        description: Output to CAMSS controller.
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>> +            unevaluatedProperties: false
>> +            properties:
>> +              remote-endpoint: true
>> +            required:
>> +              - remote-endpoint
>> +
>> +    required:
>> +      - port@0
>> +      - port@2
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - "#phy-cells"
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - operating-points-v2
>> +  - power-domains
>> +  - power-domain-names
>> +  - vdda-0p9-supply
>> +  - vdda-1p2-supply
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    csiphy4: csiphy@ace4000 {
>> +        compatible = "qcom,x1e80100-csi2-phy";
>> +        reg = <0x0ace4000 0x2000>;
>> +        #phy-cells = <1>;
>> +
>> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
>> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
>> +        clock-names = "core",
>> +                      "timer";
>> +
>> +        operating-points-v2 = <&csiphy_opp_table>;
>> +
>> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
>> +
>> +        power-domains = <&rpmhpd RPMHPD_MMCX>,
>> +                        <&rpmhpd RPMHPD_MX>;
>> +        power-domain-names = "mmcx",
>> +                             "mx";
>> +
>> +        vdda-0p9-supply = <&vreg_l2c_0p8>;
>> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +                csiphy0_in_ep: endpoint {
>> +                    data-lanes = <0 1>;
>> +                    clock-lanes = <2>;
>> +                    remote-endpoint = <&sensor_out>;
>> +                };
>> +            };
>> +
>> +            port@2 {
>> +                reg = <2>;
>> +                csiphy0_out_ep: endpoint {
>> +                    remote-endpoint = <&controller_in>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +    csiphy_opp_table: opp-table {
>> +        compatible = "operating-points-v2";
>> +
>> +        opp-300000000 {
>> +            opp-hz = /bits/ 64 <300000000>;
>> +            required-opps = <&rpmhpd_opp_low_svs_d1>,
>> +                            <&rpmhpd_opp_low_svs_d1>;
>> +        };
>> +
>> +        opp-400000000 {
>> +            opp-hz = /bits/ 64 <400000000>;
>> +            required-opps = <&rpmhpd_opp_low_svs>,
>> +                            <&rpmhpd_opp_low_svs_d1>;
>> +        };
>> +
>> +        opp-480000000 {
>> +            opp-hz = /bits/ 64 <480000000>;
>> +            required-opps = <&rpmhpd_opp_low_svs>,
>> +                            <&rpmhpd_opp_low_svs_d1>;
>> +        };
>> +    };
>>
> 
> --
> Best wishes,
> Vladimir


