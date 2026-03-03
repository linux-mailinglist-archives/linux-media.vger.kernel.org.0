Return-Path: <linux-media+bounces-54282-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MM5K7uqpmn9SgAAu9opvQ
	(envelope-from <linux-media+bounces-54282-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 10:32:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B6A1EBE79
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 10:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3A5130D0B23
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 09:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB17838C431;
	Tue,  3 Mar 2026 09:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HC4Py1tb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEC8388377;
	Tue,  3 Mar 2026 09:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772530074; cv=none; b=WiX3U1GyhH6tqH2CB4lYHoHWIpxBgQkrFcfkA9zzwkLVu4gO/tuP5Yz0AF8Xww5Cy9JooS+Hv4HV8w0PYFtq0JMkWEOici/ddAMi4uJL9Vg8q6NGarZgdeheaMhek/vpUXZZvKbi/ofwo/AQKk5jqI6ilL6pYPi3ftIxQCFdn5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772530074; c=relaxed/simple;
	bh=SBVQh6r2Q+TQ8oufapkjvVPEEK4nBLLPJpy29offkyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=suaeoYMYlFPCBl1Rrd0aT6ZBvwBV2gPHXZTgTAbCKqIhFdVkS+YgL/Mj7/P+TZ9PwzIC6gCYq7fRWoXuCXoDY9aOcvTk0nxE9EtNa7t0JknMBHw6AwscPDZCt7D7HAVcLSuGh5gmSeNo95KBXxO/aahaZ180+AbTgzzb9n0wNrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HC4Py1tb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED395C19425;
	Tue,  3 Mar 2026 09:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772530074;
	bh=SBVQh6r2Q+TQ8oufapkjvVPEEK4nBLLPJpy29offkyU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HC4Py1tb6Xk6lZN3vnm53HvzK+DePoC3Loc5E59wRwVS++gJTFH6g0SB417J9Nc9s
	 ltuigYBv+/c0w3Be3jQYjPYnpI6c11nwJFPTrSde8hB8DRm9EtNyHNWvCEOIWdjK/v
	 Fu27uJaBWS/CCrqO+bHh/xDG6A3g+t6L+09g9A8gV70CPvDPx3NqP8K4WTJ7BHmof5
	 cOL5EepIfxjnYFTgjMwft+VSpzL+ZF3pETqtV5Sb56RKoeC7SsQqHwGF+U7Ustftl9
	 cG5+D5dpRRttO+whCm0JLeagFH+T26Iu1giHUnL8kwNchmRUDzOuQjZAJXxVAmMO97
	 rHiyVnia+O48w==
Message-ID: <03b44922-72d5-465b-96e1-97a19655e97d@kernel.org>
Date: Tue, 3 Mar 2026 09:27:47 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
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
References: <20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org>
 <20260226-x1e-csi2-phy-v3-1-11e608759410@linaro.org>
 <4pFL6wOeTKUt-Zq4YbjqJdacMgUIPSYJD-4-5DcIMEZ1sM7JsNFYcSv1bd7ZRVOklTsmkEfxM2b6tTflmiECNQ==@protonmail.internalid>
 <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <c85fe457-c140-441c-93ed-342dce32e604@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 04B6A1EBE79
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54282-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,devicetree.org:url,ace4000:email]
X-Rspamd-Action: no action

On 03/03/2026 01:51, Vijay Kumar Tumati wrote:
> Hi Bryan,
> 
> On 2/26/2026 4:34 AM, Bryan O'Donoghue wrote:
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
>>    .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 114 +++++++++++++++++++++
>>    1 file changed, 114 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> new file mode 100644
>> index 0000000000000..c937d26ccbda9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> @@ -0,0 +1,114 @@
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
>> +    maxItems: 1
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
>> +
>> +        operating-points-v2 = <&csiphy_opp_table>;
>> +
>> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
>> +
>> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> As we are cleaning up the PHY device nodes, we should consider fixing
> the power domains as well. Although TOP GDSC is defined as a power
> domain, it is not the power source for the PHY devices. Rather, it is
> the MMCX, MXC and optionally MXA based on the architecture (Refer to
> 'Voltage rail' column for PHY clocks in IPCAT). 

Feel free to send me a qcom laptop and I will :)

 From memory though I _thought_ only the TOP was required for the PHY. 
I'd be grateful if you could confirm yourself in ipcat.

- TITAN_TOP_GDSC
- MXC
- MMCX
- MXA - first time I've heard of this rail, from memory I don't remember
         having seen this in ipcat when I could do so.

There is no
> parent-child relationship between the TOP GDSC and these in the clock
> driver and it was just working as the required power rails are getting
> enabled by/for other MM devices.

Well only the GDSC is supplied by the clock controller.

>> +
>> +        vdda-0p8-supply = <&vreg_l2c_0p8>;
>> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
>> +    };
>> +
>> +    csiphy_opp_table: opp-table-csiphy {
>> +        compatible = "operating-points-v2";
>> +
>> +        opp-300000000 {
>> +            opp-hz = /bits/ 64 <300000000>;
>> +            required-opps = <&rpmhpd_opp_low_svs_d1>;
>> +        };
>> +
>> +        opp-400000000 {
>> +            opp-hz = /bits/ 64 <400000000>;
>> +            required-opps = <&rpmhpd_opp_low_svs>;
>> +        };
>> +
>> +        opp-480000000 {
>> +            opp-hz = /bits/ 64 <480000000>;
>> +            required-opps = <&rpmhpd_opp_low_svs>;
>> +        };
>> +    };
>>
> Thanks,
> Vijay.


