Return-Path: <linux-media+bounces-66952-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9cXrI7sDTmq1BgIAu9opvQ
	(envelope-from <linux-media+bounces-66952-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 10:00:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE88722E4B
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 10:00:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=hV7Iasce;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66952-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66952-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BFA93023DC2
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 07:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40A13F1AD9;
	Wed,  8 Jul 2026 07:49:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A660C3F4DF0
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 07:49:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496960; cv=none; b=DSaUHWZFsj204KMe1fG++OajRFOuoD/NlFqqf9fdMEfUyJ6uSgrPpT02JM8O8UL52tvhNH/raA1U1F9wEQORROJOvvX6vW9HhBR+b+TASMv57pbw1c5dNk58aNb4yTHywdIq1x5RitM0Y6RaiKj7YpO88U+ttdLPWE6CfO/Egpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496960; c=relaxed/simple;
	bh=iD6EbhdjTImQiP7DV3hDp8W9DVyZurMh8iMlgLBN7b8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ST4W7hOdDS77x1oQ7DV1LO/mLdNkGVOq8are8Zt8dbsBbZvgtgAT1pxiLBakVYVVJAXcgpzKjgkTezXEzOLIKMsLo10Wu4n77AW9ZnbDch3dgIP3pHSnhn9wjkic3bGmZ9onT42JiQzVIcZBbWbZu1GvVp8PlcjRMkU+LyNORzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hV7Iasce; arc=none smtp.client-ip=209.85.167.49
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aebe49b227so89575e87.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 00:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783496947; x=1784101747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MCt+qXqsFWK3xJYzpIGst74sX1gCmnXNutx6uCCcmyQ=;
        b=hV7IasceItoym4w5w+gkoaoMsDxU1xyqcknRkmSWh5KG8nxoz3qHHGl81LZmy0mI4N
         ZCE22YM9n7UX0anPoPi9dG/TrEwVL4xdtH7+0HMHjrs4ZMcitOPCam4QK+WA0pZF4Zqc
         7rKGLAkIW4O9qIl2X4hSCtsNSt/EYzy8Fk5N3wET/AG5ZS87ib/9Jgj0EPFY2J/EHjGo
         Yh1OhzDXDNuIYkQacpiYRtwbngCF/wyn7QAyUf827rtg9cbHB54Zhv6AFqrgrbIWkkCT
         5QpYlt+cZw7djIp2IguktTVLtRk7vGtNd6ieFWYlzigOJkFp/7YDFS1AiA+N7djjhGGg
         OsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783496947; x=1784101747;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCt+qXqsFWK3xJYzpIGst74sX1gCmnXNutx6uCCcmyQ=;
        b=MOQ+K00zXY3xaQ4jeTk8O0eNWI84OIgMUjg+Tv8hP6VMI/aG7K5rPR8kzXbn0333UW
         951OoS9tDdNcmu+oRZlQCI4Q+F5YjQd4KmNkPopnhd1PXmg1SbpJDM77r6vZmDlbH+BH
         8pDVglhJt2AONZLNtPI8e4/yhJxhKr4h7+qggTT6/lax8LnonZNEZAO07uu6hkOL+6oq
         lngEag2ZI17jHdySLeM2cqmiYh403rpr4DVNJgG0sVxDZpn7Jq3/oS9SIVNOXHQiZuEk
         T2DW3kuLFRYEaqL52c1Ei0mbIYioI6irhnu6DIQBhZ2g4WcQstGhuH1wcPHm0yM4qz/4
         S/XQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8a/lb0TcSQIqt9YLPzQ2aclA8K6zJs4tFtWjQgb2P6G0ZknPaAyz6cmYn+ecFnRx7Q33gOlidIVePtg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+RPRjDKqhCFUKJ6Cd+T40jKnno9jQMwiElqPRL2UHT39j95o1
	Dojp1snnXqcDXwdIFNJR3exZMVTQ7NgpZNoPgsyYbKq6Rc7W7YKIVfp86i3WHWGKfCPzhscSUXB
	fGozALdo=
X-Gm-Gg: AfdE7cmivleCLlCwJb3KvNi4hiyFmCNd9KmfiAjsxiKINBTypi6uOClLnWnGwvNDMS8
	37afmPcF0tMYuUn7DYPVOpU5BhICOQJLsCWQAVFAzofPACbaY+slVxJ556iNJAkfefPnG/3zWbj
	M+xN8nsEslbvjYVzLqweqA+m+re1y8tGMw7SQd5Rp6cyFsxCVUPTB/Q+32WSH5LQniwJI7xJGlf
	ju72pX2s/uZGaAZNCoq0Bg5E/R4jsg3ak6CkEYUXvStubUB0DBtDuPqYhg5JZgNrXH0RTN5TX4Z
	/QouXXO83RwZewwsv3VF++GwkCjVmQlg2kqrxZRHB0F/4pcsO7W1b7whbSbhRt08gDUDPw3mmmF
	PdgQUYcyM827uqFG9C9j3hI1i2fbviLp8O+pIxnOtg/qEV+CQTWvATSKOlbdENATtki+6NWvBUN
	yoCIXsT/6ugudwzrE8WbsLsA8NrUd8+m0RuD5tYyJP7bHyeP05IzvOCo/8aRUKCFsx/ys=
X-Received: by 2002:a05:6512:3a87:b0:5ad:2e00:c596 with SMTP id 2adb3069b0e04-5b0113dae7emr226711e87.0.1783496946656;
        Wed, 08 Jul 2026 00:49:06 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b007f68765sm1417696e87.10.2026.07.08.00.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 00:49:06 -0700 (PDT)
Message-ID: <6520f340-c219-47a3-99e0-b48007896164@linaro.org>
Date: Wed, 8 Jul 2026 10:49:05 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/6] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-1-f8588da41f16@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-1-f8588da41f16@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66952-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBE88722E4B

On 7/8/26 03:06, Bryan O'Donoghue wrote:
> Add optional PHY handle definitions. This will allow for supporting both
> legacy PHY definitions as well as supporting the optional new handle based
> approach.
> 
> Drop the legacy high-level 0p8 and 1p2 supplies as required, each PHY has
> its own individual rails. The old binding is still valid but with
> individual nodes we define the rails in the CSIPHY sub-nodes.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../bindings/media/qcom,x1e80100-camss.yaml        | 33 ++++++++++++++++++++--
>   1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 2d1662ef522b7..c17b9757b2c86 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -39,6 +39,14 @@ properties:
>         - const: vfe_lite0
>         - const: vfe_lite1
>   
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +
> +  ranges: true
> +
>     clocks:
>       maxItems: 29
>   
> @@ -126,6 +134,16 @@ properties:
>       description:
>         1.2V supply to a PHY.
>   
> +  phys:
> +    maxItems: 4
> +
> +  phy-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy4
> +
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
> @@ -158,6 +176,14 @@ properties:
>               required:
>                 - data-lanes
>   
> +patternProperties:
> +  "^phy@[0-9a-f]+$":

This is too wide regexp mask for 4 children CSIPHYs.

> +    $ref: /schemas/phy/qcom,x1e80100-csi2-phy.yaml
> +    unevaluatedProperties: false
> +
> +  "^opp-table(-.*)?$":
> +    type: object
> +
>   required:
>     - compatible
>     - reg
> @@ -171,8 +197,6 @@ required:
>     - iommus
>     - power-domains
>     - power-domain-names
> -  - vdd-csiphy-0p8-supply
> -  - vdd-csiphy-1p2-supply
>     - ports
>   
>   additionalProperties: false
> @@ -184,6 +208,7 @@ examples:
>       #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>       #include <dt-bindings/interconnect/qcom,icc.h>
>       #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
> +    #include <dt-bindings/phy/phy.h>

The inclusion of this header is not needed.

>       #include <dt-bindings/power/qcom-rpmpd.h>
>   
>       soc {
> @@ -229,6 +254,10 @@ examples:
>                           "vfe_lite0",
>                           "vfe_lite1";
>   
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges;
> +
>               clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
>                        <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
>                        <&camcc CAM_CC_CORE_AHB_CLK>,
> 

-- 
Best wishes,
Vladimir

