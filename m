Return-Path: <linux-media+bounces-57157-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPkqNnxHxWkU8wQAu9opvQ
	(envelope-from <linux-media+bounces-57157-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 15:49:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83440337069
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 15:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F04DA305AC8E
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 14:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9623FE363;
	Thu, 26 Mar 2026 14:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pvMT+E3w"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45463FD138;
	Thu, 26 Mar 2026 14:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774536134; cv=none; b=hD8244Edk4mV61548H2rtU+/qM5KAIw+DmtWsA1f3z3sRBvIpB1yu1wXM08rgm/+pAV4+LkCbSluKBLAv4LVpawdtMK4l7bU4dvyj/7veKGil4e/c6WRz+sqnIVv6xzk8FtVxfbB9RbD6k+H1OglkLSfaeJ3eXm72NexaCLkwE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774536134; c=relaxed/simple;
	bh=MTJP2oisWG7BF1HsPDguerRmNEgncTtHi666WRC4WZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=psRXS7pXMaTo/x3M6B9Od4ThLh8igCXuHaNSJNWswTxz4HjRGZ/WwZVUdSb8LHF9KphX2Kmg8xR26/FB66NwBQF0K7kldY5HvGeQ4B1EWW1QDsx4KWS1CvWABiVCHzs+7d094DOO8c3Ckm50BkZxgtfpxHp1/fdNvbzj3cjF/LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pvMT+E3w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30C4C19423;
	Thu, 26 Mar 2026 14:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774536134;
	bh=MTJP2oisWG7BF1HsPDguerRmNEgncTtHi666WRC4WZU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pvMT+E3wy0UCs6zWh8lf8kbKeKOZiIgqyn/5tVRQctj5uFf2gonuZdT/6NnznwcRB
	 1pwEFCQaAodROwxGXhCv77FF88vhagof9+Q6w8JlhWD8djge2MlZyJlj7Ys+YmyZ+L
	 JmfszFWXVcHtdvxnNx5ozsuCDxHnT9SFrpZYZr7rLgxlRuSWHWGWTQyzaDswPByJZK
	 aOVasZeG6awhOrbiTitiH4tLfiBjpLCJtp7HNXLGRHPg9qwnTwXB6mB4eNrW25C45J
	 14gUUU4K/PDynZ2BX+NzBqgVW7SMZY4cig6oJJ8e7a+46B5TSqa1iSFmAcEgfPrBkK
	 EsCnmVx5+3ydA==
Message-ID: <5d7d5bf8-4420-4d75-b928-820bb9233e52@kernel.org>
Date: Thu, 26 Mar 2026 14:42:10 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <72ef6c9e-feb6-4e57-b8cc-7801bd748698@linaro.org>
 <f1c8c412-1d27-4c83-8c5e-76b9369ea6e9@linaro.org>
 <VwCtoebjwHqLTucsrGruvBpedA4k-Melt7C0DA0aHSVld3PeotwZdtMUm3EFpvQyScrl6yejmLaK7bY1avT1zQ==@protonmail.internalid>
 <8ac55e5f-72ed-4331-bf42-92ccf97507dd@linaro.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <8ac55e5f-72ed-4331-bf42-92ccf97507dd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57157-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 83440337069
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/03/2026 10:28, Vladimir Zapolskiy wrote:
> On 3/26/26 04:03, Bryan O'Donoghue wrote:
>> On 26/03/2026 01:46, Vladimir Zapolskiy wrote:
>>> On 3/26/26 03:04, Bryan O'Donoghue wrote:
>>>> Add a base schema initially compatible with x1e80100 to describe MIPI
>>>> CSI2
>>>> PHY devices.
>>>>
>>>> The hardware can support both CPHY, DPHY and a special split-mode
>>>> DPHY. We
>>>> capture those modes as:
>>>>
>>>> - PHY_QCOM_CSI2_MODE_DPHY
>>>> - PHY_QCOM_CSI2_MODE_CPHY
>>>> - PHY_QCOM_CSI2_MODE_SPLIT_DPHY
>>>
>>> Distinction between PHY_QCOM_CSI2_MODE_DPHY and
>>> PHY_QCOM_CSI2_MODE_SPLIT_DPHY
>>> is
>>> 1) insufficient in just this simplistic form, because the assignment of
>>> particular lanes is also needed,
>>> 2) and under the assumption that the lane mapping is set somewhere else,
>>> then
>>> there should be no difference between PHY_QCOM_CSI2_MODE_{DPHY,SPLIT_DPHY},
>>> it's just DPHY, and the subtype is deductible from data-lanes property on
>>> the consumer side.
>>>
>>> So far the rationale is unclear, why anything above regular PHY_TYPE_DPHY
>>> and PHY_TYPE_CPHY is needed here, those two are sufficient.
>>
>> Because knowing the split-mode exists and that you have asked about how
>> such a thing would be supported, I thought about how to represent that
>> mode right from the start, even if we don't support it.
> 
> It is good to think about this hardware confguration in advance, however
> the process of describing such hardware setup is incomplete.
> 
>>
>> To support split phy we will need to pass the parameter.
> 
> What you call "split phy" is a DPHY, and "split phy" can not be supported
> by adding this parameter, because it does not provide information about
> lanes, and after removing this information it is just DPHY.

That's just not true. If you read the camx source code you can see 
split/combo mode 2+1 1+1 data/clock mode requires special programming of 
the PHY to support.

https://review.lineageos.org/c/LineageOS/android_kernel_motorola_sm6375/+/423960/1/drivers/cam_sensor_module/cam_csiphy/cam_csiphy_core.c#b285

There is disjunction all over this file depending on the mode.

https://review.lineageos.org/c/LineageOS/android_kernel_motorola_sm6375/+/423960/1/drivers/cam_sensor_module/cam_csiphy/cam_csiphy_core.c#b767

And besides, think about it - you need different init sequences if one 
of the lanes is clock instead of data...

If we use phy.h::PHY_TYPE_DPHY then that means to support split-mode in 
the future we need to get that mode represented in phy.h - but really 
this fixed split mode isn't a generic CSI2 PHY mode, its a Qualcommism.

Nothing wrong with that - but then the mode should reflect the fact it 
is vendor specific and we absolutely 100% have to do different things in 
the PHY driver whether we are in regular DPHY mode or in split DPHY mode.

If we use PHY_TYPE_DPHY as I did in the previous patch then we can't 
convert to a vendor type later on as its an ABI break.

So we have both a sound technical reason hardware will require it to 
differentiate between DPHY and split-mode DPHY - and we also don't want 
to be bound to phy.h and then try to upstream a new DPHY_SPLIT_MODE here 
which a reviewer might reasonably say "why is this special mode from a 
specific vendor driving new defines in a shared file"

> 
>> So we define those parameters upfront.
> 
> This new header file has to be removed, it does not bring anything valuable.
> 
>>>
>>>>
>>>> The CSIPHY devices have their own pinouts on the SoC as well as their own
>>>> individual voltage rails.
>>>>
>>>> The need to model voltage rails on a per-PHY basis leads us to define
>>>> CSIPHY devices as individual nodes.
>>>>
>>>> Two nice outcomes in terms of schema and DT arise from this change.
>>>>
>>>> 1. The ability to define on a per-PHY basis voltage rails.
>>>> 2. The ability to require those voltage.
>>>>
>>>> We have had a complete bodge upstream for this where a single set of
>>>> voltage rail for all CSIPHYs has been buried inside of CAMSS.
>>>>
>>>> Much like the I2C bus which is dedicated to Camera sensors - the CCI
>>>> bus in
>>>> CAMSS parlance, the CSIPHY devices should be individually modelled.
>>>>
>>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> ---
>>>>     .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 130 +++++++++++
>>>> ++++++++++
>>>>     include/dt-bindings/phy/phy-qcom-mipi-csi2.h       |  15 +++
>>>>     2 files changed, 145 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-
>>>> phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-
>>>> phy.yaml
>>>> new file mode 100644
>>>> index 0000000000000..63114151104b4
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>>> @@ -0,0 +1,130 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm CSI2 PHY
>>>> +
>>>> +maintainers:
>>>> +  - Bryan O'Donoghue <bod@kernel.org>
>>>> +
>>>> +description:
>>>> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2
>>>> sensors
>>>> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and
>>>> D-PHY
>>>> +  modes.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,x1e80100-csi2-phy
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  "#phy-cells":
>>>> +    const: 1
>>>> +    description:
>>>> +      The single cell specifies the PHY operating mode.
>>>> +      See include/dt-bindings/phy/phy-qcom-mipi-csi2.h for valid values.
>>>
>>> include/dt-bindings/phy/phy.h should be good enough as it's stated above.
>>
>> While include/dt-bindings/phy/phy.h provides generic definitions for
>> D-PHY and C-PHY, it does not contain a definition for Qualcomm's
>> proprietary Split D-PHY mode. Because this hardware supports a
> 
> What Qualcomm's proprietary Split D-PHY mode is manifested by lane mapping,
> there is no need to introduce another PHY mode, it is DPHY.
> 
>> vendor-specific operating mode, introducing a vendor-specific header to
>> define that state is necessary.
>>
>> This is exactly what we do with the QMP to support a similar use-case -
>> the PHYs do vendor specific things, so we use vendor specific defines.
>>
>> If we lock to phy.h CPHY/DPHY only then we exclude the possibility of
>> say adding split-mode to an upstream SoC as the DT ABI will not then
>> facilitate the mode.
>>
>>>
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 2
>>>> +
>>>> +  clock-names:
>>>> +    items:
>>>> +      - const: core
>>>> +      - const: timer
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  operating-points-v2:
>>>> +    maxItems: 1
>>>> +
>>>> +  power-domains:
>>>> +    items:
>>>> +      - description: MXC or MXA voltage rail
>>>> +      - description: MMCX voltage rail
>>>> +
>>>> +  power-domain-names:
>>>> +    items:
>>>> +      - const: mx
>>>> +      - const: mmcx
>>>> +
>>>> +  vdda-0p9-supply:
>>>> +    description: Phandle to a 0.9V regulator supply to a PHY.
>>>> +
>>>> +  vdda-1p2-supply:
>>>> +    description: Phandle to 1.2V regulator supply to a PHY.
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - "#phy-cells"
>>>> +  - clocks
>>>> +  - clock-names
>>>> +  - interrupts
>>>> +  - operating-points-v2
>>>> +  - power-domains
>>>> +  - power-domain-names
>>>> +  - vdda-0p9-supply
>>>> +  - vdda-1p2-supply
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>>>> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>>>> +    #include <dt-bindings/phy/phy-qcom-mipi-csi2.h>
>>>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>>>> +
>>>> +    csiphy4: csiphy@ace4000 {
>>>> +        compatible = "qcom,x1e80100-csi2-phy";
>>>> +        reg = <0x0ace4000 0x2000>;
>>>> +        #phy-cells = <1>;
>>>> +
>>>> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
>>>> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
>>>> +        clock-names = "core",
>>>> +                      "timer";
>>>> +
>>>> +        operating-points-v2 = <&csiphy_opp_table>;
>>>> +
>>>> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
>>>> +
>>>> +        power-domains = <&rpmhpd RPMHPD_MX>,
>>>> +                        <&rpmhpd RPMHPD_MMCX>;
>>>> +        power-domain-names = "mx",
>>>> +                             "mmcx";
>>>> +
>>>> +        vdda-0p9-supply = <&vreg_l2c_0p8>;
>>>> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
>>>> +    };
>>>> +
>>>> +    csiphy_opp_table: opp-table {
>>>> +        compatible = "operating-points-v2";
>>>> +
>>>> +        opp-300000000 {
>>>> +            opp-hz = /bits/ 64 <300000000>;
>>>> +            required-opps = <&rpmhpd_opp_low_svs_d1>,
>>>> +                            <&rpmhpd_opp_low_svs_d1>;
>>>> +        };
>>>> +
>>>> +        opp-400000000 {
>>>> +            opp-hz = /bits/ 64 <400000000>;
>>>> +            required-opps = <&rpmhpd_opp_low_svs>,
>>>> +                            <&rpmhpd_opp_low_svs>;
>>>> +        };
>>>> +
>>>> +        opp-480000000 {
>>>> +            opp-hz = /bits/ 64 <480000000>;
>>>> +            required-opps = <&rpmhpd_opp_low_svs>,
>>>> +                            <&rpmhpd_opp_low_svs>;
>>>> +        };
>>>> +    };
>>>> +
>>>> +    isp@acb7000 {
>>>> +        phys = <&csiphy4 PHY_QCOM_CSI2_MODE_DPHY>;
>>>> +    };
>>>
>>> This example is incomplete in sense that it does not include CAMSS
>>> CSIPHY IP hardware configuration in whole.
>>
>>
>> No that's not the way examples work. You don't replicate entire nodes
>> from other schemas you just give a terse reference.
>>
> 
> If so, then this example makes no sense and it'd be better to remove it.
You know you're right its not strictly necessary - its just there to be 
helpful.

"Be less helpful" is not usually review feedback I give or take but, 
I'll drop this anyway.

---
bod


