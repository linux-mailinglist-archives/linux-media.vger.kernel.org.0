Return-Path: <linux-media+bounces-57110-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAwaLg+SxGnH0gQAu9opvQ
	(envelope-from <linux-media+bounces-57110-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:55:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB5C32E195
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 71124301C8F9
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 01:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069B93914E1;
	Thu, 26 Mar 2026 01:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F3XwXZnX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70A538F647
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 01:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489602; cv=none; b=f7IS4MjlJEbVrNRr9+r/QChLGEfwPo1k9ZED8wmQYizUfh0r2y6eavFm9eovoR3uxwqC25BtTtbonlirby77MhF6y+45PGymmO4uODKYjK7P7p4d2ynkovymnJdzq96LRxBI9eTou+5MDFF9xg3gigaPJ2IZ4ibHJbJPCIb2N54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489602; c=relaxed/simple;
	bh=evJCgtmUCKMOUoX5jIoibYRIq4Js+xZOoni/9Fwf0RA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fznrIol8qleN6MvsJvmlFeMojaM3RR3KIT6LJbnkm+VxHCzn4izH/q5+aYZuCKe/6l+UtrYXQ5aGNSOMGOz3nFJqpQQ8itUy4X4JOCXIwcymp1Lqd9XO4ZKtUzxbq0LVxqUByTNPRiueEMaPRul/iKe+vAluWd0OL8dEN8k5zyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F3XwXZnX; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a28cdf7a92so70364e87.2
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 18:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774489598; x=1775094398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMM8gnzSZHuXSR/4tgTYg0ThVeyoW9N0uLZg0sQTEPk=;
        b=F3XwXZnX5ju96FUaDalJB4ylLq2PiI9l3XXhGChR0Hee6/hD49o7wGfzJZ72hMtPYe
         wngoq+vWFQmckdIf7Q/JpVvXMxRU8lGwR9/ucdnmDDu1e/3iE2iuvs/BdbXJkXwN9yVJ
         nVXQVnAE9jFgRhi+bQLyEga67x26VAyUFz3t5q+zgTLdzueYJRwc+Gx53OIXkc0IMpre
         41MsieE7UOTWXC+KfO5n0BdP23P+s+HgcEHa1iycTot9zwpUPDoVzVvQoLQ2DFQ9YxT1
         UgzEmxvClT8Xq3Lqd3wHqsgwL5lKp5QT/TRvUoBPGLAFb01m8lTvru2XY6BpiTKwkV8A
         OwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774489598; x=1775094398;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tMM8gnzSZHuXSR/4tgTYg0ThVeyoW9N0uLZg0sQTEPk=;
        b=Iim9KN5lpFw5Y/0m2NtOZX+CCkJ9so1V3CEHlEznfwdntILRl3bGpVrXo4q8wA9SGG
         3X6xXD61r6CCd3WTtWEOMpRFhiy38XQWw9Q4TebD/j1PioxStaBVpwtGBaQrXGTkVYPy
         xlrnZGcC8YADMi/AjM8buObWzvWZlKLtaiELidgwdvjY2C0chkNKvcl9cUd6LsnhgRjv
         O2VUX3Hzi+7t4chiZdlVmo870R2Fsa9Jt7c6m6bdk/8enDapkxE9RfKf+ow729sf/G+N
         R1aorfLP1hmqMmrvP0xasYNC5WtU/tRt1n0JIM2ClggtukXQd0vIbbA80wrSKsUpK74W
         VyTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxlPtjO/5rArlIUdCi+BpgVDnDcnZ2xw3tmmWkRy/cv/dzTa4yrtRDMCI/QDtcIBmSEBULWubf/hHSqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0uYy8qXWSi48/1uJsjvCjZPjjcCKDVAUalzInVbRPUHMT5Zgb
	Wwc1i8YeWwkwKZvv5XluFPwkLQZA+QoAbEsHQrKi3mWHCwQwbnQcEQAdm3y9RrfgzxI=
X-Gm-Gg: ATEYQzyAra0vK/lBmijnLFikKgAdGm1INSoAp+qxD23gJTJdwpnLqpoQ+WIxMiSeWU9
	5u82zXPokj6OBCO7tw9QVkIGOKV23Y6aukWP++x/nsS+7mz3uIWSkeENIAKpt+Sez83MZBRF76F
	Jm8LTbSOK/FxehYNE4ztn41ncbds0eO9Exe3F8WgLMyOUxTKgnALtzOhM7Cn5DWCuvsxaZhCmXo
	a9ko0ILCh7Dz5bRjS+Jj4kLDhVL33RMtyu3q1998QUiSRjIacPk/pTlPnCQ7atbAkxzjOELRtgT
	KiP3m08EBXVFQdWWrM/qyY8pNWX07KXQMzPux8kI1+XbCROg8z1kAnwJ9PoAn1MDvYkNQo9HWdZ
	YNwqir/qXIS/iYzhMlpTB7iTVZpiMv5sGVTpYP7u4p6n7YTslok3d12FgkhxbSI8kOyBZ2+NLCm
	jWRzSTmhTJZaMQSc24dswbBXUYYTfnv9rDSqVkroLPdOB4hPiLivhLxDToZV3skAyiNJ56VSQeL
	7uUrX+8sYdE7vEQ
X-Received: by 2002:a05:6512:3d0b:b0:5a2:78e2:504b with SMTP id 2adb3069b0e04-5a29b9a974emr1031388e87.7.1774489597790;
        Wed, 25 Mar 2026 18:46:37 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a064c187sm243911e87.27.2026.03.25.18.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 18:46:37 -0700 (PDT)
Message-ID: <72ef6c9e-feb6-4e57-b8cc-7801bd748698@linaro.org>
Date: Thu, 26 Mar 2026 03:46:27 +0200
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-57110-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,devicetree.org:url,acb7000:email,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 0EB5C32E195
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 03:04, Bryan O'Donoghue wrote:
> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
> PHY devices.
> 
> The hardware can support both CPHY, DPHY and a special split-mode DPHY. We
> capture those modes as:
> 
> - PHY_QCOM_CSI2_MODE_DPHY
> - PHY_QCOM_CSI2_MODE_CPHY
> - PHY_QCOM_CSI2_MODE_SPLIT_DPHY

Distinction between PHY_QCOM_CSI2_MODE_DPHY and PHY_QCOM_CSI2_MODE_SPLIT_DPHY
is
1) insufficient in just this simplistic form, because the assignment of
particular lanes is also needed,
2) and under the assumption that the lane mapping is set somewhere else, then
there should be no difference between PHY_QCOM_CSI2_MODE_{DPHY,SPLIT_DPHY},
it's just DPHY, and the subtype is deductible from data-lanes property on
the consumer side.

So far the rationale is unclear, why anything above regular PHY_TYPE_DPHY
and PHY_TYPE_CPHY is needed here, those two are sufficient.

> 
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
>   .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 130 +++++++++++++++++++++
>   include/dt-bindings/phy/phy-qcom-mipi-csi2.h       |  15 +++
>   2 files changed, 145 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> new file mode 100644
> index 0000000000000..63114151104b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> @@ -0,0 +1,130 @@
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
> +      See include/dt-bindings/phy/phy-qcom-mipi-csi2.h for valid values.

include/dt-bindings/phy/phy.h should be good enough as it's stated above.

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
> +      - description: MXC or MXA voltage rail
> +      - description: MMCX voltage rail
> +
> +  power-domain-names:
> +    items:
> +      - const: mx
> +      - const: mmcx
> +
> +  vdda-0p9-supply:
> +    description: Phandle to a 0.9V regulator supply to a PHY.
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
> +  - vdda-0p9-supply
> +  - vdda-1p2-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
> +    #include <dt-bindings/phy/phy-qcom-mipi-csi2.h>
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
> +        power-domains = <&rpmhpd RPMHPD_MX>,
> +                        <&rpmhpd RPMHPD_MMCX>;
> +        power-domain-names = "mx",
> +                             "mmcx";
> +
> +        vdda-0p9-supply = <&vreg_l2c_0p8>;
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
> +
> +    isp@acb7000 {
> +        phys = <&csiphy4 PHY_QCOM_CSI2_MODE_DPHY>;
> +    };

This example is incomplete in sense that it does not include CAMSS
CSIPHY IP hardware configuration in whole.

> diff --git a/include/dt-bindings/phy/phy-qcom-mipi-csi2.h b/include/dt-bindings/phy/phy-qcom-mipi-csi2.h
> new file mode 100644
> index 0000000000000..fa48fd75c58d8
> --- /dev/null
> +++ b/include/dt-bindings/phy/phy-qcom-mipi-csi2.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> +/*
> + * Qualcomm MIPI CSI2 PHY constants
> + *
> + * Copyright (C) 2026 Linaro Limited
> + */
> +
> +#ifndef __DT_BINDINGS_PHY_MIPI_CSI2__
> +#define __DT_BINDINGS_PHY_MIPI_CSI2__
> +
> +#define PHY_QCOM_CSI2_MODE_DPHY		0
> +#define PHY_QCOM_CSI2_MODE_CPHY		1
> +#define PHY_QCOM_CSI2_MODE_SPLIT_DPHY	2
> +
> +#endif /* __DT_BINDINGS_PHY_MIPI_CSI2__ */
> 

-- 
Best wishes,
Vladimir

