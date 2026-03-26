Return-Path: <linux-media+bounces-57137-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BbUBzILxWma5wQAu9opvQ
	(envelope-from <linux-media+bounces-57137-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 11:32:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEEF333697
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 11:32:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C7A43064539
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 10:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CC33C8734;
	Thu, 26 Mar 2026 10:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PeMC9ePd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5096A3C2798
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 10:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520900; cv=none; b=Slz4MfgoLm95KPOpzAoWPt5waV0sG0jZaoGWBM6ZhiQ62CpDSSIxo97DQdMrdbQhW0crkWfhSfsx05ziQdCa8NovxeVHrrCNBb22qVbTFYboxAbYkDhe3dxVc4VQ8yEh7YiXEGgKA0f4Hb4kEbi57MDNNvHhXsg5RQiWYj0pUmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520900; c=relaxed/simple;
	bh=2v8In7hFhC2acihj/gCFd+Mm9poF2ssGBqAgCBK6CXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rxLKvt3fkuDS3d5d3V0qnSNzdrgoDP/ficVeFeOZ1mSFY1q2w2SnZM6dwQGlGcMJwt2FLTlzqE37hFSfWCzuk87p1NnvdT5Ste9G48SqomB8ZTroFkFEKTnI9QZPPvL7m65xZ2xvIfJaiDPO6yjTE4rn+JcXZTL/Xi73cuhAg1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PeMC9ePd; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a2792e8799so137075e87.1
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 03:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774520896; x=1775125696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5ZuGKNhYbtjjVYQLs3YjXvMYuMo8Bw6xr92IXGXhQs=;
        b=PeMC9ePdCskzV9lJ+Hql0XmL1zyUEsQLpNgw91baglqnfDXYjIhyfF6IqfHVZgw4QK
         c9aLpGnrU8Z63yUJfL8/lu8Nog1B46l1JzZnXTLfcD+VLvJSaYI/nTSFCViCWLUi/u1+
         ET3sYUpxvPRkHL/0RZDHoMiTQ2L9iRHJgcEyIU0y3mMIddB4HD8SeFI7zqTvtwg+nq6O
         8fmr39Vv27Oa9NyA8iGudsfVtpBd7fbu4/CHJeqcNVWZ59UQCQYQW8KeN/Jv2kG7TkoW
         a9AVTXx8A7X03FJYwuhMSRmysS004UgnCG9iPlrPgWRWqhhYGMSAPi6skf+gFEVRR1N0
         XeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520896; x=1775125696;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l5ZuGKNhYbtjjVYQLs3YjXvMYuMo8Bw6xr92IXGXhQs=;
        b=ctKrE6/D3UT4Rm5aq2GfToDI4Um1ErFV0FK/GDLQYy4oFuzU1rD7oSEU2Y9hqIU5hn
         DB2GXT5PfMoiFI6ycMQVKHcKWn5BC/x+4VsMQC1Rb+oN/qL/dloUNjXBynJ7qccYCX4/
         8bHxqw0AZ/sP2227pSxj+a0JZ7APsCq4QBJbEyUEg/X/sl/8tuxu5gsy70QoIJVowIod
         hdiJJYsb8HaE4/7vfP7P2GpXR67NbwNQA5bSp6jQVWGubPzwXeQNxhHRZxSQkpxqac+t
         un5BDRRkUEgHkaFmoKDTsCTyRpUZikMziCpx+GPqQq6rXHHpuCGmEF49RXGVROZEuY0Y
         rKRw==
X-Forwarded-Encrypted: i=1; AJvYcCXhcnotEBjxupBXzpiIKa0xLGxguhqJZow8+t4rC+c81nA8kq3jzUuuB4lpXa9bBGv2+wEGxNH6N2TLeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJR4lG5zeCX3/Bt79GzcKQb6FMaxgCzXaXA6KlsyWONBEbsljI
	W78WTcsT2G7ADUertI8QrU9j9Z5fj33ppRYf7paKmOkWwV1FBlp5nynl2JBi7Sd8j9c=
X-Gm-Gg: ATEYQzy6U4GbRwIhuvy8N1ul/oF0vDA1MZgMU+nfgdTl0RoUC0emutMfSCSQ0dgPSX3
	hRaiVWtrv1SXzxBmexqH8iaPORkrrpeKL0HSlBD0qzozDK7cLhS/ECaa3/jDV1/QVELge11W8Vi
	AssoygPEVpANsHENgzI4r32zlOyUzXFjA+qYJky5kg/9mlBrxcepdJJPdW++ZpqgQWs0pvW/Bi/
	czze+rICpdJSeirP24SgQYDgxiyLwsfqmHTRscSn10GMC2bjTTmjHDHawiCUoPrm3S1NRK4KEzq
	b0ScJT7pOOYN/UD4N1l7+Qmkbtb+CJlJMcbiql9AVA1ydHR+SJ/f6kII4fgTVcxLczO6C7MJPOc
	piE3de7pBxBueJUq0gybviv3Mg1Gw7kF9izn9UljOWwSI4q944TXiYtqgBd3hwu92fkxSNjx4vb
	6iYJYWJJdhlM15UnyYq0R7B3Arm+Ltoa9KGgU9H9Ft+/vt0icUD+6w44xCu5Zx6npKmyb28jRaH
	LaCVg==
X-Received: by 2002:a19:7017:0:b0:5a2:a1d9:daa1 with SMTP id 2adb3069b0e04-5a2a1d9dc26mr311772e87.6.1774520896295;
        Thu, 26 Mar 2026 03:28:16 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a068f5e6sm479318e87.62.2026.03.26.03.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 03:28:15 -0700 (PDT)
Message-ID: <8ac55e5f-72ed-4331-bf42-92ccf97507dd@linaro.org>
Date: Thu, 26 Mar 2026 12:28:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <72ef6c9e-feb6-4e57-b8cc-7801bd748698@linaro.org>
 <f1c8c412-1d27-4c83-8c5e-76b9369ea6e9@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <f1c8c412-1d27-4c83-8c5e-76b9369ea6e9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-57137-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ace4000:email]
X-Rspamd-Queue-Id: DDEEF333697
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 04:03, Bryan O'Donoghue wrote:
> On 26/03/2026 01:46, Vladimir Zapolskiy wrote:
>> On 3/26/26 03:04, Bryan O'Donoghue wrote:
>>> Add a base schema initially compatible with x1e80100 to describe MIPI
>>> CSI2
>>> PHY devices.
>>>
>>> The hardware can support both CPHY, DPHY and a special split-mode
>>> DPHY. We
>>> capture those modes as:
>>>
>>> - PHY_QCOM_CSI2_MODE_DPHY
>>> - PHY_QCOM_CSI2_MODE_CPHY
>>> - PHY_QCOM_CSI2_MODE_SPLIT_DPHY
>>
>> Distinction between PHY_QCOM_CSI2_MODE_DPHY and
>> PHY_QCOM_CSI2_MODE_SPLIT_DPHY
>> is
>> 1) insufficient in just this simplistic form, because the assignment of
>> particular lanes is also needed,
>> 2) and under the assumption that the lane mapping is set somewhere else,
>> then
>> there should be no difference between PHY_QCOM_CSI2_MODE_{DPHY,SPLIT_DPHY},
>> it's just DPHY, and the subtype is deductible from data-lanes property on
>> the consumer side.
>>
>> So far the rationale is unclear, why anything above regular PHY_TYPE_DPHY
>> and PHY_TYPE_CPHY is needed here, those two are sufficient.
> 
> Because knowing the split-mode exists and that you have asked about how
> such a thing would be supported, I thought about how to represent that
> mode right from the start, even if we don't support it.

It is good to think about this hardware confguration in advance, however
the process of describing such hardware setup is incomplete.

> 
> To support split phy we will need to pass the parameter.

What you call "split phy" is a DPHY, and "split phy" can not be supported
by adding this parameter, because it does not provide information about
lanes, and after removing this information it is just DPHY.

> So we define those parameters upfront.

This new header file has to be removed, it does not bring anything valuable.

>>
>>>
>>> The CSIPHY devices have their own pinouts on the SoC as well as their own
>>> individual voltage rails.
>>>
>>> The need to model voltage rails on a per-PHY basis leads us to define
>>> CSIPHY devices as individual nodes.
>>>
>>> Two nice outcomes in terms of schema and DT arise from this change.
>>>
>>> 1. The ability to define on a per-PHY basis voltage rails.
>>> 2. The ability to require those voltage.
>>>
>>> We have had a complete bodge upstream for this where a single set of
>>> voltage rail for all CSIPHYs has been buried inside of CAMSS.
>>>
>>> Much like the I2C bus which is dedicated to Camera sensors - the CCI
>>> bus in
>>> CAMSS parlance, the CSIPHY devices should be individually modelled.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>    .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 130 +++++++++++
>>> ++++++++++
>>>    include/dt-bindings/phy/phy-qcom-mipi-csi2.h       |  15 +++
>>>    2 files changed, 145 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-
>>> phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-
>>> phy.yaml
>>> new file mode 100644
>>> index 0000000000000..63114151104b4
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>>> @@ -0,0 +1,130 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm CSI2 PHY
>>> +
>>> +maintainers:
>>> +  - Bryan O'Donoghue <bod@kernel.org>
>>> +
>>> +description:
>>> +  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2
>>> sensors
>>> +  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and
>>> D-PHY
>>> +  modes.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,x1e80100-csi2-phy
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  "#phy-cells":
>>> +    const: 1
>>> +    description:
>>> +      The single cell specifies the PHY operating mode.
>>> +      See include/dt-bindings/phy/phy-qcom-mipi-csi2.h for valid values.
>>
>> include/dt-bindings/phy/phy.h should be good enough as it's stated above.
> 
> While include/dt-bindings/phy/phy.h provides generic definitions for
> D-PHY and C-PHY, it does not contain a definition for Qualcomm's
> proprietary Split D-PHY mode. Because this hardware supports a

What Qualcomm's proprietary Split D-PHY mode is manifested by lane mapping,
there is no need to introduce another PHY mode, it is DPHY.

> vendor-specific operating mode, introducing a vendor-specific header to
> define that state is necessary.
> 
> This is exactly what we do with the QMP to support a similar use-case -
> the PHYs do vendor specific things, so we use vendor specific defines.
> 
> If we lock to phy.h CPHY/DPHY only then we exclude the possibility of
> say adding split-mode to an upstream SoC as the DT ABI will not then
> facilitate the mode.
> 
>>
>>> +
>>> +  clocks:
>>> +    maxItems: 2
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: core
>>> +      - const: timer
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  operating-points-v2:
>>> +    maxItems: 1
>>> +
>>> +  power-domains:
>>> +    items:
>>> +      - description: MXC or MXA voltage rail
>>> +      - description: MMCX voltage rail
>>> +
>>> +  power-domain-names:
>>> +    items:
>>> +      - const: mx
>>> +      - const: mmcx
>>> +
>>> +  vdda-0p9-supply:
>>> +    description: Phandle to a 0.9V regulator supply to a PHY.
>>> +
>>> +  vdda-1p2-supply:
>>> +    description: Phandle to 1.2V regulator supply to a PHY.
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - "#phy-cells"
>>> +  - clocks
>>> +  - clock-names
>>> +  - interrupts
>>> +  - operating-points-v2
>>> +  - power-domains
>>> +  - power-domain-names
>>> +  - vdda-0p9-supply
>>> +  - vdda-1p2-supply
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>>> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>>> +    #include <dt-bindings/phy/phy-qcom-mipi-csi2.h>
>>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>>> +
>>> +    csiphy4: csiphy@ace4000 {
>>> +        compatible = "qcom,x1e80100-csi2-phy";
>>> +        reg = <0x0ace4000 0x2000>;
>>> +        #phy-cells = <1>;
>>> +
>>> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
>>> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
>>> +        clock-names = "core",
>>> +                      "timer";
>>> +
>>> +        operating-points-v2 = <&csiphy_opp_table>;
>>> +
>>> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
>>> +
>>> +        power-domains = <&rpmhpd RPMHPD_MX>,
>>> +                        <&rpmhpd RPMHPD_MMCX>;
>>> +        power-domain-names = "mx",
>>> +                             "mmcx";
>>> +
>>> +        vdda-0p9-supply = <&vreg_l2c_0p8>;
>>> +        vdda-1p2-supply = <&vreg_l1c_1p2>;
>>> +    };
>>> +
>>> +    csiphy_opp_table: opp-table {
>>> +        compatible = "operating-points-v2";
>>> +
>>> +        opp-300000000 {
>>> +            opp-hz = /bits/ 64 <300000000>;
>>> +            required-opps = <&rpmhpd_opp_low_svs_d1>,
>>> +                            <&rpmhpd_opp_low_svs_d1>;
>>> +        };
>>> +
>>> +        opp-400000000 {
>>> +            opp-hz = /bits/ 64 <400000000>;
>>> +            required-opps = <&rpmhpd_opp_low_svs>,
>>> +                            <&rpmhpd_opp_low_svs>;
>>> +        };
>>> +
>>> +        opp-480000000 {
>>> +            opp-hz = /bits/ 64 <480000000>;
>>> +            required-opps = <&rpmhpd_opp_low_svs>,
>>> +                            <&rpmhpd_opp_low_svs>;
>>> +        };
>>> +    };
>>> +
>>> +    isp@acb7000 {
>>> +        phys = <&csiphy4 PHY_QCOM_CSI2_MODE_DPHY>;
>>> +    };
>>
>> This example is incomplete in sense that it does not include CAMSS
>> CSIPHY IP hardware configuration in whole.
> 
> 
> No that's not the way examples work. You don't replicate entire nodes
> from other schemas you just give a terse reference.
> 

If so, then this example makes no sense and it'd be better to remove it.

-- 
Best wishes,
Vladimir

