Return-Path: <linux-media+bounces-63669-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 77u1EW+UIGqC5QAAu9opvQ
	(envelope-from <linux-media+bounces-63669-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:54:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EEE63B456
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 22:54:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UDwfgTj0;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63669-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63669-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9D5E83029CB1
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 20:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9C2402B92;
	Wed,  3 Jun 2026 20:52:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED763A3816;
	Wed,  3 Jun 2026 20:52:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780519946; cv=none; b=kRzC7cQ8ds+51VCda/jcse7LKDRjUNEwjPKgsyS56oi7KSPxh8ViYceE5I9ZoXUwNtjOGLfh65Yw5CdV3oDQ/q4nSmWFfZ3PpQvuijvLKR3D9IbMlmpakFDdP3xwb20N8+FYzrghf7X/8gpeLPv1wE9INQkAign9aEuuBnSG/wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780519946; c=relaxed/simple;
	bh=FqcZgc7ZIjoBwbbu4FAv9SlB9aWsVxht2QXmUv0T4z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MVvlTb4yz0zdio0QKU5//FJrvf9iKZBB0hGcjirQ1h1zFM03bhIzxPpo18bdY4cfBiTfjjRStQsvoIwZ7UGKF52Q9T2dfaUZP0R+Pm/erpkk3zmLIMDRFRqtRdNfuman1Tzx1V6R7CXR/UkdxA08/nHW8POUvaw4XFstob0t6Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UDwfgTj0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE2E1F00893;
	Wed,  3 Jun 2026 20:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780519944;
	bh=YS+6UAe3eWKQ6I/deKGAHEi/uKiRdTdYTAK7SD/sfio=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UDwfgTj062Fo7wFHvKZQYtGqjCmabLdXZ4HVexYOR8i3cJ87e2XFQTupOuS41Sy4H
	 zYl3rZ9akqFhCQp7cEvu00YKk3NAqZ2j0/XiavWJuo7nNR0/gffUAo1oRvI2ej1KUr
	 Rle04Hcy5dHDw4rNVs4anzzA2rdNJlCSrIRTvPc+5fdenJuM4VNBx4pvB5kzn5X1ZF
	 OgQSZgKMEhu5CWo8ZsQ3a5OFQU33DAqdb7BJ1b9zTGNnI1m3bxlGYhftBCP4/UEwe+
	 SiVA4YjlfIM8uJ3gvwCBRenLSliNG0udrwvRrQtFMqob/Uv12LcHvpNKQ2slXQkI6l
	 DxfdAdpZcjWVA==
Message-ID: <dbc4b9b9-5c7a-4426-85bb-e99ad6be6ac6@kernel.org>
Date: Wed, 3 Jun 2026 21:52:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
 <478df3ed-d4ef-43aa-bb84-e2075798542b@kernel.org>
 <ec98ef2f-02b4-4086-8b4b-07b6953dbd20@oss.qualcomm.com>
 <tgG0QPGHUXMOoExQ9gjtNbUKbFpoiuWPHWCsh5vpGqFRGIeTcWiiNC1okUddn3T6nCfDzNbLlYkpSMdhfFVxmA==@protonmail.internalid>
 <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63669-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vijay.tumati@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:bryan.odonoghue@linaro.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0EEE63B456

On 03/06/2026 21:24, Vijay Kumar Tumati wrote:
> 
> 
> On 6/3/2026 1:16 PM, Vijay Kumar Tumati wrote:
>> Hi,
>>
>> On 6/2/2026 3:51 PM, Bryan O'Donoghue wrote:
>>> On 02/06/2026 22:59, Vladimir Zapolskiy wrote:
>>>> On 5/23/26 05:48, Bryan O'Donoghue wrote:
>>>>> Add a base schema initially compatible with x1e80100 to describe
>>>>> MIPI CSI2
>>>>> PHY devices.
>>>>>
>>>>> The hardware can support both CPHY, DPHY and a special split-mode DPHY.
>>>>>
>>>>> The schema here defines three ports:
>>>>>
>>>>> port@0:
>>>>>        The first input port where a sensor is always required.
>>>>>
>>>>> port@1:
>>>>>        A second optional input port which if present implies DPHY
>>>>> split-mode.
>>>>>
>>>>> port@2:
>>>>>        A third always required output port which connects to the
>>>>> controller.
>>>>>
>>>>
>>>> This port numeration is imperfect, because port@0 and port@2 are
>>>> required,
>>>> while middle port@1 is optional.
>>>>
>>>> Like it was stated before a number of times, it seems natural to operate
>>>> with two ports, where input port may have two endpoints rather than 3
>>>> ports,
>>>> also that approach solves the problem of a hole in the port numeration.
>>>
>>> Can you confirm this is what you are after ?
>>>
>>> port@0 {
>>>       #address-cells = <1>;
>>>       #size-cells = <0>;
>>>
>>>       endpoint@0 {              /* primary sensor */
>>>           reg = <0>;
>>>           data-lanes = <0 1 2 3>;
>>>           remote-endpoint = <&sensor0_out>;
>>>       };
>>>
>>>       endpoint@1 {              /* split-mode second sensor, optional */
>>>           reg = <1>;
>>>           data-lanes = <0>;
>>>           remote-endpoint = <&sensor1_out>;
>>>       };
>>> };
>>>
>>> port@1 {                     /* output to CAMSS, was port@2 */
>>>       endpoint { remote-endpoint = <&controller_in>; };
>>> };
>>>
>>> This works for me BTW.
>> Either way, do we need to document the constraint of using port@0 or
>> endpoint@0 'only' for the 4+1 or 2+1 mode and the other one is for the
>> 1+1 mode? Or is it implicit from this bindings for a developer?

The binding mandates it with an if / else structure

>
>>>>> The CSIPHY devices have their own pinouts on the SoC as well as
>>>>> their own
>>>>> individual voltage rails.
>>>>>
>>>>> The need to model voltage rails on a per-PHY basis leads us to define
>>>>> CSIPHY devices as individual nodes.
>>>>>
>>>>> Two nice outcomes in terms of schema and DT arise from this change.
>>>>>
>>>>> 1. The ability to define on a per-PHY basis voltage rails.
>>>>> 2. The ability to require those voltage.
>>>>>
>>>>> We have had a complete bodge upstream for this where a single set of
>>>>> voltage rail for all CSIPHYs has been buried inside of CAMSS.
>>>>>
>>>>> Much like the I2C bus which is dedicated to Camera sensors - the CCI
>>>>> bus in
>>>>> CAMSS parlance, the CSIPHY devices should be individually modelled.
>>>>>
>>>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>> ---
>>>>>     .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 209 ++++++++
>>>>> + ++++++++++++
>>>>>     1 file changed, 209 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-
>>>>> csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-
>>>>> csi2-phy.yaml
>>>>> new file mode 100644
>>>>> index 0000000000000..270375f949880
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>>>> @@ -0,0 +1,209 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Qualcomm CSI2 PHY
>>>>> +
>>>>> +maintainers:
>>>>> +  - Bryan O'Donoghue <bod@kernel.org>
>>>>> +
>>>>> +description:
>>>>> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI
>>>>> CSI2 sensors
>>>>> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and
>>>>> D-PHY
>>>>> +  modes.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: qcom,x1e80100-csi2-phy
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  "#phy-cells":
>>>>> +    const: 1
>>>>> +    description:
>>>>> +      The single cell specifies the PHY operating mode.
>>>>
>>>> #phy-cells should be 0, because the PHY operating mode is well defined
>>>> by 'bus-type' property of an endpoint on the sensor side, the opposite
>>>> side of CAMSS/CSID as a CSIPHY "consumer" should not dictate the PHY
>>>> type.
>>>
>>> Rob said consumer but, I'm also not very bothered about that. bus-type
>>> is perfectly acceptable to me.
>>>
>>>>> +
>>>>> +  clocks:
>>>>> +    maxItems: 2
>>>>> +
>>>>> +  clock-names:
>>>>> +    items:
>>>>> +      - const: core
>>>>> +      - const: timer
>>>>> +
>>>>> +  interrupts:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  operating-points-v2:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  power-domains:
>>>>> +    items:
>>>>> +      - description: MMCX voltage rail
>>>>> +      - description: MXC or MXA voltage rail
>>>>
>>>> Only "qcom,x1e80100-csi2-phy" device is supported so far, unlikely it's
>>>> the case that "MXC or MXA voltage rail" should be specified, it'd be
>>>> just one of two or both.
>>>
>>> Hmm. I'm not being clear here if this is your take, I will reword it
>>> to make it clearer this generation of PHY _must_ have either
>>>
>>> - MMCX and MXC
>>> or
>>> - MMCX and MXA
>> I am not sure of this, Bryan. If you look at the PHY core clock
>> separately, sure, that is correct. But all of them, on this platform as
>> well, share the RCG, which requires all 3 power domains. So
>> fundamentally, you need to enable all of those from each PHY. You can
>> make it constant 3 power domains.>

Hmm do you mean the GDSC which I omitted form the example and shouldn't 
have TITAN_TOP_GDSC or do you mean MMCX, MXC and MXA are required ?

I don't believe the clock definitions say that. Also not what you said 
in the previous cycle.

I'd be obliged if you could be precise and clear since as you know the 
PHY as a separate thing is important to release new SoC additions.
>>>>> +
>>>>> +  power-domain-names:
>>>>> +    items:
>>>>> +      - const: mmcx
>>>>> +      - const: mx
>>>>> +
>>>>> +  vdda-0p9-supply:
>>>>> +    description: Phandle to a 0.9V regulator supply to a PHY.
>>>>> +
>>>>> +  vdda-1p2-supply:
>>>>> +    description: Phandle to 1.2V regulator supply to a PHY.
>>>>> +
>>>>> +  ports:
>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>> +
>>>>> +    properties:
>>>>> +      port@0:
>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>> +        description: Sensor input. Always present.
>>>>> +        unevaluatedProperties: false
>>>>> +
>>>>> +        properties:
>>>>> +          endpoint:
>>>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>>>> +            unevaluatedProperties: false
>>>>> +            properties:
>>>>> +              data-lanes:
>>>>> +                minItems: 1
>>>>> +                maxItems: 4
>>>>> +              clock-lanes:
>>>>> +                maxItems: 1
>>>>> +              remote-endpoint: true
>>>>> +            required:
>>>>> +              - data-lanes
>>>>> +              - remote-endpoint
>>>>> +
>>>>> +      port@1:
>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>> +        description:
>>>>> +          Second sensor input. When present, indicates DPHY split
>>>>> mode.
>>>>> +        unevaluatedProperties: false
>>>>> +
>>>>> +        properties:
>>>>> +          endpoint:
>>>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>>>> +            unevaluatedProperties: false
>>>>> +            properties:
>>>>> +              data-lanes:
>>>>> +                maxItems: 1
>>>>> +              clock-lanes:
>>>>> +                maxItems: 1
>>>>> +              remote-endpoint: true
>>>>> +            required:
>>>>> +              - data-lanes
>>>>> +              - clock-lanes
>>>>> +              - remote-endpoint
>>>>
>>>> As it's stated above, it should be converted to a single port with two
>>>> endpoints, it'd be done in accordance to video-interfaces.yaml.
>>>>
>>>>> +
>>>>> +      port@2:
>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>> +        description: Output to CAMSS controller.
>>>>> +        unevaluatedProperties: false
>>>>> +
>>>>> +        properties:
>>>>> +          endpoint:
>>>>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>>>>> +            unevaluatedProperties: false
>>>>> +            properties:
>>>>> +              remote-endpoint: true
>>>>> +            required:
>>>>> +              - remote-endpoint
>>>>> +
>>>>> +    required:
>>>>> +      - port@0
>>>>> +      - port@2
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +  - "#phy-cells"
>>>>> +  - clocks
>>>>> +  - clock-names
>>>>> +  - interrupts
>>>>> +  - operating-points-v2
>>>>> +  - power-domains
>>>>> +  - power-domain-names
>>>>> +  - vdda-0p9-supply
>>>>> +  - vdda-1p2-supply
>>>>> +  - ports
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>>>>> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>>>>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>>>>> +
>>>>> +    csiphy4: csiphy@ace4000 {
>>>>> +        compatible = "qcom,x1e80100-csi2-phy";
>>>>> +        reg = <0x0ace4000 0x2000>;
>>>>> +        #phy-cells = <1>;
>>>>> +
>>>>> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
>>>>> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
>>>>> +        clock-names = "core",
>>>>> +                      "timer";
>>>>> +
>>>>> +        operating-points-v2 = <&csiphy_opp_table>;
>>>>> +
>>>>> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
>>>>> +
>>>>> +        power-domains = <&rpmhpd RPMHPD_MMCX>,
>>>>> +                        <&rpmhpd RPMHPD_MX>;
>>>>> +        power-domain-names = "mmcx",
>>>>> +                             "mx";
> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +

Yes the DTSI has TITAN_TOP_GDSC I haven't updated the YAML to capture that.

So it should be

top
mmcx
mx

With obviously on mmcx and mx scalable. We established that CSIPHY4 had 
MXA whereas the other CSIPHYs had MXC in v5 or v4 - can you be clear if 
you agreeing with that still or saying something different. Per my 
memory of reading the docs, there was nothing in the clock tree to 
indicate both MXA and MXC were required for all PHYs.

>>>>> +        vdda-0p9-supply = <&vreg_l2c_0p8>;
>>>>> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
>>>>> +
>>>>> +        ports {
>>>>> +            #address-cells = <1>;
>>>>> +            #size-cells = <0>;
>>>>> +
>>>>> +            port@0 {
>>>>> +                reg = <0>;
>>>>> +                csiphy0_in_ep: endpoint {
>>>>> +                    data-lanes = <0 1>;
>>>>> +                    clock-lanes = <2>;
>>>>> +                    remote-endpoint = <&sensor_out>;
>>>>> +                };
>>>>> +            };
>>>>> +
>>>>> +            port@2 {
>>>>> +                reg = <2>;
>>>>> +                csiphy0_out_ep: endpoint {
>>>>> +                    remote-endpoint = <&controller_in>;
>>>>> +                };
>>>>> +            };
>>>>> +        };
>>>>> +    };
>>>>> +
>>>>> +    csiphy_opp_table: opp-table {
>>>>> +        compatible = "operating-points-v2";
>>>>> +
>>>>> +        opp-300000000 {
>>>>> +            opp-hz = /bits/ 64 <300000000>;
>> I wonder why you would have only one clock here. You should be setting
>> the rate for both the core and timer, isn't it?

Yes the dtsi has it, the example does not. I had pushback from others 
about the example being too complex - you can't please all of the people 
all of the time.

I will drop the full table @ v9

>>> + required-opps =
>> <&rpmhpd_opp_low_svs_d1>,
>>>>> +                            <&rpmhpd_opp_low_svs_d1>;
>> Same here, it should 3 power domains set.>>> +        };

Two power domains scaled, one set at least I hope that's what you mean 
i.e. add the GDSC, already in my code I just didn't add it here as I 
should have.

- GDSC enabled
- MMCX scaled
- MX scaled

When MX points to MXA the scaling is a NOP @ rpmhpd_opp_low_svs_d1.

Agreed ?
>>>>> +
>>>>> +        opp-400000000 {
>>>>> +            opp-hz = /bits/ 64 <400000000>;
>>>>> +            required-opps = <&rpmhpd_opp_low_svs>,
>>>>> +                            <&rpmhpd_opp_low_svs_d1>;
>> Why is one at svs and the other at svs_d1? Shouldn't both be svs?>>>
>> +        };
>>>>> +
>>>>> +        opp-480000000 {
>>>>> +            opp-hz = /bits/ 64 <480000000>;
>>>>> +            required-opps = <&rpmhpd_opp_low_svs>,
>>>>> +                            <&rpmhpd_opp_low_svs_d1>;
>> And here, both should be svs_l1?>>> +        };
>>>>> +    };
>>>>>
>>>>
>>>> --
>>>> Best wishes,
>>>> Vladimir
>>>
>>>
>> Thanks,
>> Vijay.
>>
> 


