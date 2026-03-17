Return-Path: <linux-media+bounces-55991-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IN/NAB7muGlulAEAu9opvQ
	(envelope-from <linux-media+bounces-55991-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 06:26:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 257D52A3F88
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 06:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 44C003017AB9
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 05:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F10937E317;
	Tue, 17 Mar 2026 05:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DG2ofQYc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6DC30EF6F;
	Tue, 17 Mar 2026 05:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773725199; cv=none; b=Oxc0sYxWV1RDt20/hwQV6GIGFzxdNZghwgIWDOU4Rd0MPUeAtPbUb81wv5yoWpX1P4B5HXu6Hz6v1oniUDZGCYiznINOQuFuysAMC6gdk0el+h47QNM01qsMg2f+QGQA5cwAOhHJS70Fd2jPzdLY04qcf9PhfQDzTjOd9rMN5sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773725199; c=relaxed/simple;
	bh=iRRuxqRIArqXAoR/NBolpSJ0w2RG2sEua0rX3QTRhAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fEQRQ4ULbstqeEEJlWV7L+kQDpAiSFMHRs7CsCzeIyiAL7Tf2H/mQJS9nxXQdyU7ED1nUK4DxwJnTONFfyjWocOGxVe9h7i0YXa1jKEqo7E9seuGz/TVxSURajH5q61swwkSY6V/4pLH/sfZdMR8Zco0Xnl/tt9U44Qycl2AUwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DG2ofQYc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB66CC4CEF7;
	Tue, 17 Mar 2026 05:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773725199;
	bh=iRRuxqRIArqXAoR/NBolpSJ0w2RG2sEua0rX3QTRhAI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DG2ofQYcOyhl31A2USOEdaGUOarol/cHRyEL/51Tq13oizmN/DcrvFJLPF7uGoOUr
	 FN2852k1L81iX4Nwqcs6fST+H5cTsuyo3vqf6MDIZtzjZxBTjdQai/5k1nzvIB7NgB
	 fSRdG7t2tLV9wHpx4VZgltxt136jYETum/Qi1corRl2oiN4RDfdzDj+G0e69brz3pM
	 djOpFM+0+NNj0SjCvI/7qXtO48zlfEmE3rXH0pOcb5lKYbb9TcMvpJ/qG7l7KG3lM3
	 5HSp1F7Sayo9FCpIauk1+eOF7IEqAALpO6egjc5JHMrmDx0WMxf5t5f5buA5ahYrcH
	 LXMg8GeSMdHkA==
Message-ID: <edf766b8-2664-4dac-b626-551807b3e5ef@kernel.org>
Date: Tue, 17 Mar 2026 05:26:35 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-1-90c09203888d@linaro.org>
 <3VqSGUgMUKaCja5WYOrOP8nJ_mw_eDPdItA8d1CvqUg4ASPS5IUc_aT2E-XIo0YmnYo8QltXVw8_6NDxtdqGGw==@protonmail.internalid>
 <5705b48a-fc24-4c5f-aa6d-40952f0070d9@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <5705b48a-fc24-4c5f-aa6d-40952f0070d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55991-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 257D52A3F88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16/03/2026 21:31, Vijay Kumar Tumati wrote:
> Hi Bryan,
> 
> On 3/15/2026 4:52 PM, Bryan O'Donoghue wrote:
>> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
>> PHY devices.
>>
>> The hardware can support both C-PHY and D-PHY modes. The CSIPHY devices
>> have their own pinouts on the SoC as well as their own individual voltage
>> rails.
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
>>    .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 133 +++++++++++++++++++++
>>    1 file changed, 133 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> new file mode 100644
>> index 0000000000000..b83c2d65ebc6e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> @@ -0,0 +1,133 @@
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
>> +
>> +  clocks:
>> +    maxItems: 4
>> +
>> +  clock-names:
>> +    items:
>> +      - const: csiphy
>> +      - const: csiphy_timer
>> +      - const: camnoc_axi
>> +      - const: cpas_ahb
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  operating-points-v2:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    items:
>> +      - description: TITAN TOP GDSC
>> +      - description: MXC or MXA voltage rail
> Would it be better to provision MXA or MXC as an additional optional
> power domain? I see 'cam_cc_cphy_rx_clk_src', the parent of all CSIPHYx
> clocks, need all three power domains on this chipset.

I don't think this should be optional. Have the dts point to an "mx" 
power-domain and then select which one is right for a PHY MX/MXA or MXC.

Your worst case here is some future PHY which has more or fewer PDs 
which is then either a special case in this file or a whole new file for 
that compat.

>> +      - description: MMCX voltage rail
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: top
>> +      - const: mx
>> +      - const: mmcx
>> +
>> +  vdda-0p8-supply:
>> +    description: Phandle to a 0.8V regulator supply to a PHY.
>> +
>> +  vdda-1p2-supply:
>> +    description: Phandle to 1.2V regulator supply to a PHY.
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
>> +  - vdda-0p8-supply
>> +  - vdda-1p2-supply
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>> +    #include <dt-bindings/phy/phy.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    csiphy@ace4000 {
>> +        compatible = "qcom,x1e80100-csi2-phy";
>> +        reg = <0x0ace4000 0x2000>;
>> +        #phy-cells = <1>;
>> +
>> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
>> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
>> +                 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
>> +                 <&camcc CAM_CC_CPAS_AHB_CLK>;
>> +        clock-names = "csiphy",
>> +                      "csiphy_timer",
>> +                      "camnoc_axi",
>> +                      "cpas_ahb";
> Although it's not a concern from my side, just want to be explicitly
> sure that everyone is happy with the clock names, just to avoid any
> changes later on when other modules are separated out.

These are the names we already use in CAMSS so ... they're good enough 
to start from.

>> +
>> +        operating-points-v2 = <&csiphy_opp_table>;
>> +
>> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
>> +
>> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
>> +                        <&rpmhpd RPMHPD_MX>,
>> +                        <&rpmhpd RPMHPD_MMCX>;
>> +        power-domain-names = "top",
>> +                             "mx",
>> +                             "mmcx";
>> +
>> +        vdda-0p8-supply = <&vreg_l2c_0p8>;
>> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
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
>> +                            <&rpmhpd_opp_low_svs>;
>> +        };
>> +
>> +        opp-480000000 {
>> +            opp-hz = /bits/ 64 <480000000>;
>> +            required-opps = <&rpmhpd_opp_low_svs>,
>> +                            <&rpmhpd_opp_low_svs>;
> 480mhz should be svs?

Yes you're right thanks for spotting.

>> +        };
>> +    };
>>
> Thanks,
> Vijay.


