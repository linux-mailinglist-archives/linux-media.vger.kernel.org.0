Return-Path: <linux-media+bounces-63445-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BwVtMXhVH2q+kgAAu9opvQ
	(envelope-from <linux-media+bounces-63445-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 00:13:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 507AD6325C2
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 00:13:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=T8eoBPUk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63445-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63445-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4E428301EE07
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 22:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EA43AB482;
	Tue,  2 Jun 2026 22:13:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCE137EFFE
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 22:13:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780438385; cv=none; b=qhDkt06tZflLZdqWQIpUlNwSaMgGoBam3OAjqQIw11MfNzvwHcpWHPNIKH4KnAEgFNirdt3pf01CXO3fCHnptO0cWzHXBm9J9jcjhwlcFxMe/awzJJlgVMElPxYqGj/nIQm2ZrgeEyFKd92/pkTWpboWwSaG5WPNm1mrB2Vqw1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780438385; c=relaxed/simple;
	bh=qM4XqWtIg2PORbxS53w9ybBOhtXfa8uLP61m+QhLlkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l5yBWNI0+Ur/c4o28hltZ/K/vSvVLSz8HZzKx2h7DnihkJstdmNnS58M9F4QXuSxbHc/wrRou3P9FJ2YzimzuzTtCFFJkKaPqZNWlhjvnm6or1w8YbG9XD2W7jf9CnmmI/E3UnZzThyffs86plobM00QPuSio1XXaXg0R6FEn0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T8eoBPUk; arc=none smtp.client-ip=209.85.208.169
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-396773734e8so4634701fa.3
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 15:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780438382; x=1781043182; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwPqpx2eAFRp9E0K+20Elh+3F5oZBRku1zUCHwD0yp0=;
        b=T8eoBPUk6HgHuo/16UhV3/5y/XXxx6EKtGoAPrGQHi2wTgSuyFSgNcd8YmsJguezo4
         Tbpa9QZQ2BAjb/fE3ouc69EhY5ktN24YDQjC1eEmkktO+Aa8oj6G60J4dM+PyrjF4ihi
         KO9uz0EwrruSTmfG69Ch8cUdQAqkERfGtp/4g/xQGeE4dmKb/Nyas7B1zFFobWgjWzVe
         nfN+l7uiApn74kMk4PJIOm5Pr46hWHcnRapg603Co8x30xshOD4g/zYsSW4V8mqIRE0D
         5mairp2a5Qu2voSo0PdycDONCrL+eaX1It4nTS414tbQZT/Zzuols4U8o7P5nL7xGzqR
         I5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780438382; x=1781043182;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MwPqpx2eAFRp9E0K+20Elh+3F5oZBRku1zUCHwD0yp0=;
        b=GV5VuuBne/gqExdargBjUacdnYRTix1OsWAPBgyh3pb9t6pqBsY3bNNEZ/zjgcbFY2
         TAn0xE45KabKPzebY+QFk3xYUvhDNGyh+hhyUn+DFH0/6K8Jvk1g8PPWEF9Y1vwyayHf
         nvP/0HKmMgO7bt2mdyNOVV6upOSi61gd1BfgfnEY+ntjvY9I+hKvkuvSz7r7GXwg94hs
         gWHBRliQ0btcDF6E9C4aBn0r7nQ/OLulcTt/TgpAfZS4zIhjBQi+biNMx+vsNVCsmYS2
         dF9Rso0sSYbVbQGXra26C+MTa+cdsV2fdntm8MIQgQweSK3jWd6+RvYHVPO9n0Oj4uYJ
         3Kqw==
X-Forwarded-Encrypted: i=1; AFNElJ+SUEIzbn64gNB+oxW0gA/DuOpxlf8PjQ1k3N7gb4yBWlIDQcTragil/m0D7juatjIRK1gxw6ZiBYl2+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3nzMqt4zsKXg6A+5wQECECZJBl1hphmRGAAShT5V+gGXHdXGO
	YDhfq8NnWcHAN1Bo9J2BaEeDfgXN596C63Ev+91I98IPwKSU7lg1esSc9WCzRGawgrI=
X-Gm-Gg: Acq92OHcgFpzYMpWLgKtPjbj0v3JlW6QJyWzzaRhDmp7uXRtnXSJvD1lYhTif50P0m+
	xNZefLJvteM5V1yQIS0bP43hEaowAxc6wWPG8O+XfcJo8HFPGrhNd6ddBdBqwK1A5mNUkc+MaGi
	i83UteilVTkgBKGkQLtpY1HsSnX8l46DY7alm6mGP8trZtX1uGmvwZJWyosePlLLxjlI6foRyTn
	Pr5X2Ib52Qo8EDp0rarKd1CAdWc6H98nM+Pry2Y8PbIw9J4WPHH3yefgPaNATY+5Gvj2/SDwyTL
	goJPEPpexHtTmPuLvIomslvhVhZixlvm80lntLlaq/GFbBuGg2QeccvP4FkgJlYTkSL7b+XvJIs
	VHCVNPSFs28vxmVMI4rapYlJJV+H7PNU78IjxeMcBR9vs7Gzhle5vo+20cbzrj3hQmC9VXh1SPK
	xiY6X32VWOEVYuhNDRgx9ypQoDnXoUZTLj13FZa0e2Y7XYgiX+Zgycj/a2xlLfqOtMZv3Zp1moR
	f+HUQ3EANtxXhyR
X-Received: by 2002:a05:6512:2305:b0:5aa:7371:db45 with SMTP id 2adb3069b0e04-5aa7bf67e87mr89547e87.8.1780438381947;
        Tue, 02 Jun 2026 15:13:01 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fdc6bsm211520e87.29.2026.06.02.15.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 15:13:01 -0700 (PDT)
Message-ID: <c2cf2cfe-7649-474e-a8ed-c45faf8cd378@linaro.org>
Date: Wed, 3 Jun 2026 01:13:00 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/5] media: dt-bindings: Add CAMSS device for
 Kaanapali
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260508-kaanapali-camss-v13-0-2541d8e55651@oss.qualcomm.com>
 <20260508-kaanapali-camss-v13-1-2541d8e55651@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260508-kaanapali-camss-v13-1-2541d8e55651@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63445-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hangxiang.ma@oss.qualcomm.com,m:bod@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jeyaprakash.soundrapandian@oss.qualcomm.com,m:vijay.tumati@oss.qualcomm.com,m:krzk@kernel.org,m:todortoo@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:from_mime,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 507AD6325C2

On 5/8/26 11:05, Hangxiang Ma wrote:
> Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Kaanapali
> platform.
> 
> The Kaanapali platform provides:
> - 6 x CSIPHY (CSI Physical Layer)
> - 3 x TPG (Test Pattern Generator)
> - 3 x CSID (CSI Decoder)
> - 2 x CSID Lite
> - 3 x VFE (Video Front End), 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   .../bindings/media/qcom,kaanapali-camss.yaml       | 433 +++++++++++++++++++++
>   1 file changed, 433 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
> new file mode 100644
> index 000000000000..2f2bb682f32f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
> @@ -0,0 +1,433 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
> +
> +maintainers:
> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> +
> +description:
> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,kaanapali-camss
> +
> +  reg:
> +    maxItems: 19
> +
> +  reg-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: csiphy5
> +      - const: csitpg0
> +      - const: csitpg1
> +      - const: csitpg2
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  clocks:
> +    maxItems: 35
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_nrt_axi
> +      - const: camnoc_rt_axi
> +      - const: cpas_ahb
> +      - const: cpas_fast_ahb
> +      - const: cpas_vfe0
> +      - const: cpas_vfe1
> +      - const: cpas_vfe2
> +      - const: cpas_vfe_lite
> +      - const: csid
> +      - const: csid_csiphy_rx
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: csiphy4
> +      - const: csiphy4_timer
> +      - const: csiphy5
> +      - const: csiphy5_timer
> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf
> +      - const: vfe0
> +      - const: vfe0_fast_ahb
> +      - const: vfe1
> +      - const: vfe1_fast_ahb
> +      - const: vfe2
> +      - const: vfe2_fast_ahb
> +      - const: vfe_lite
> +      - const: vfe_lite_ahb
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +      - const: qdss_debug_xo
> +
> +  interrupts:
> +    maxItems: 16
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: csiphy5
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
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
> +    maxItems: 1
> +
> +  power-domains:
> +    items:
> +      - description:
> +          IFE0 GDSC - Global Distributed Switch Controller for IFE0.
> +      - description:
> +          IFE1 GDSC - Global Distributed Switch Controller for IFE1.
> +      - description:
> +          IFE2 GDSC - Global Distributed Switch Controller for IFE2.
> +      - description:
> +          Titan GDSC - Global Distributed Switch Controller for the entire camss.
> +
> +  power-domain-names:
> +    items:
> +      - const: ife0
> +      - const: ife1
> +      - const: ife2
> +      - const: top
> +
> +  vdd-csiphy0-0p8-supply:
> +    description:
> +      Phandle to a 0.8V regulator supply to CSIPHY0 core block.

Please double check the expected voltage on the rail, here 0.8V is
outstanding in comparison to 0.9V found in other CAMSS dt bindings.

> +
> +  vdd-csiphy0-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY0 pll block.
> +
> +  vdd-csiphy1-0p8-supply:
> +    description:
> +      Phandle to a 0.8V regulator supply to CSIPHY1 core block.
> +
> +  vdd-csiphy1-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY1 pll block.
> +
> +  vdd-csiphy2-0p8-supply:
> +    description:
> +      Phandle to a 0.8V regulator supply to CSIPHY2 core block.
> +
> +  vdd-csiphy2-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY2 pll block.
> +
> +  vdd-csiphy3-0p8-supply:
> +    description:
> +      Phandle to a 0.8V regulator supply to CSIPHY3 core block.
> +
> +  vdd-csiphy3-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY3 pll block.
> +
> +  vdd-csiphy4-0p8-supply:
> +    description:
> +      Phandle to a 0.8V regulator supply to CSIPHY4 core block.
> +
> +  vdd-csiphy4-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY4 pll block.
> +
> +  vdd-csiphy5-0p8-supply:
> +    description:
> +      Phandle to a 0.8V regulator supply to CSIPHY5 core block.
> +
> +  vdd-csiphy5-1p2-supply:
> +    description:
> +      Phandle to a 1.2V regulator supply to CSIPHY5 pll block.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    description:
> +      CSI input ports.
> +
> +    patternProperties:
> +      "^port@[0-5]$":
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input ports for receiving CSI data on CSIPHY 0-5.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +
> +              bus-type:
> +                enum:
> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
> +
> +            required:
> +              - data-lanes
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
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
> +    #include <dt-bindings/clock/qcom,kaanapali-camcc.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        isp@9253000 {
> +            compatible = "qcom,kaanapali-camss";
> +
> +            reg = <0x0 0x09253000 0x0 0x5e80>,
> +                  <0x0 0x09263000 0x0 0x5e80>,
> +                  <0x0 0x09273000 0x0 0x5e80>,
> +                  <0x0 0x092d3000 0x0 0x3880>,
> +                  <0x0 0x092e7000 0x0 0x3880>,
> +                  <0x0 0x09523000 0x0 0x2000>,
> +                  <0x0 0x09525000 0x0 0x2000>,
> +                  <0x0 0x09527000 0x0 0x2000>,
> +                  <0x0 0x09529000 0x0 0x2000>,
> +                  <0x0 0x0952b000 0x0 0x2000>,
> +                  <0x0 0x0952d000 0x0 0x2000>,
> +                  <0x0 0x093fd000 0x0 0x400>,
> +                  <0x0 0x093fe000 0x0 0x400>,
> +                  <0x0 0x093ff000 0x0 0x400>,
> +                  <0x0 0x09151000 0x0 0x20000>,
> +                  <0x0 0x09171000 0x0 0x20000>,
> +                  <0x0 0x09191000 0x0 0x20000>,
> +                  <0x0 0x092dc000 0x0 0x9000>,
> +                  <0x0 0x092f0000 0x0 0x9000>;
> +            reg-names = "csid0",
> +                        "csid1",
> +                        "csid2",
> +                        "csid_lite0",
> +                        "csid_lite1",
> +                        "csiphy0",
> +                        "csiphy1",
> +                        "csiphy2",
> +                        "csiphy3",
> +                        "csiphy4",
> +                        "csiphy5",
> +                        "csitpg0",
> +                        "csitpg1",
> +                        "csitpg2",
> +                        "vfe0",
> +                        "vfe1",
> +                        "vfe2",
> +                        "vfe_lite0",
> +                        "vfe_lite1";
> +
> +            clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
> +                     <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                     <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_CSID_CLK>,
> +                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +                     <&camcc CAM_CC_CSIPHY0_CLK>,
> +                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY1_CLK>,
> +                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY2_CLK>,
> +                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY3_CLK>,
> +                     <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY4_CLK>,
> +                     <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +                     <&camcc CAM_CC_CSIPHY5_CLK>,
> +                     <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                     <&camcc CAM_CC_TFE_0_MAIN_CLK>,
> +                     <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_TFE_1_MAIN_CLK>,
> +                     <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_TFE_2_MAIN_CLK>,
> +                     <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> +                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
> +            clock-names = "camnoc_nrt_axi",
> +                          "camnoc_rt_axi",
> +                          "cpas_ahb",
> +                          "cpas_fast_ahb",
> +                          "cpas_vfe0",
> +                          "cpas_vfe1",
> +                          "cpas_vfe2",
> +                          "cpas_vfe_lite",
> +                          "csid",
> +                          "csid_csiphy_rx",
> +                          "csiphy0",
> +                          "csiphy0_timer",
> +                          "csiphy1",
> +                          "csiphy1_timer",
> +                          "csiphy2",
> +                          "csiphy2_timer",
> +                          "csiphy3",
> +                          "csiphy3_timer",
> +                          "csiphy4",
> +                          "csiphy4_timer",
> +                          "csiphy5",
> +                          "csiphy5_timer",
> +                          "gcc_axi_hf",
> +                          "gcc_axi_sf",
> +                          "vfe0",
> +                          "vfe0_fast_ahb",
> +                          "vfe1",
> +                          "vfe1_fast_ahb",
> +                          "vfe2",
> +                          "vfe2_fast_ahb",
> +                          "vfe_lite",
> +                          "vfe_lite_ahb",
> +                          "vfe_lite_cphy_rx",
> +                          "vfe_lite_csid",
> +                          "qdss_debug_xo";
> +
> +            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
> +                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csid_lite0",
> +                              "csid_lite1",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csiphy2",
> +                              "csiphy3",
> +                              "csiphy4",
> +                              "csiphy5",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe2",
> +                              "vfe_lite0",
> +                              "vfe_lite1";
> +
> +            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc MASTER_CAMNOC_NRT_ICP_SF QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +            interconnect-names = "ahb",
> +                                 "hf_mnoc",
> +                                 "sf_mnoc",
> +                                 "sf_icp_mnoc";
> +
> +            iommus = <&apps_smmu 0x1c00 0x00>;
> +
> +            power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
> +                            <&camcc CAM_CC_TFE_1_GDSC>,
> +                            <&camcc CAM_CC_TFE_2_GDSC>,
> +                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +            power-domain-names = "ife0",
> +                                 "ife1",
> +                                 "ife2",
> +                                 "top";
> +
> +            vdd-csiphy0-0p8-supply = <&vreg_0p8_supply>;
> +            vdd-csiphy0-1p2-supply = <&vreg_1p2_supply>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    csiphy_ep0: endpoint {
> +                        data-lanes = <0 1>;
> +                        remote-endpoint = <&sensor_ep>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> 

Apart of the notice given above, the change looks good to me.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

