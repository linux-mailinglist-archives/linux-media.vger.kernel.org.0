Return-Path: <linux-media+bounces-55835-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGImHgJmt2kMQwEAu9opvQ
	(envelope-from <linux-media+bounces-55835-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 03:08:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 306D9293CD3
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 03:08:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE4043007673
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 02:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB06F30B509;
	Mon, 16 Mar 2026 02:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="swu4qAbw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B8A285406
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 02:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773626869; cv=none; b=bt2lKKOoBZYepLrKP3ZQjwMMeF8qjWqQEFWEMfar73P7j9bDTFn0y5u9d3PPSx1d8uP4dCAHkzq9Twi+85s9anOI7wCsMJGVCd4k1WlttJuNU+HUEDmNxqY7Ic8OZfRGV2wgZjeSFOnUxjwpXOtVRZ58UPlh8cYnM1H8pYsqpJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773626869; c=relaxed/simple;
	bh=HPaBKR3U80fvQSWgEj+y8B7ck4aIug1oSsSLAqE/2d0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PLWe4phzBzeXW61vLC4OkBB8N2z3xqcP8bvm6wA0OJXJ5B+VVxowZwOX73PwzpvfyyJYRLi2321lQQGqDr4YQTN0NF8o4WDUJJhFsB676+5HzxnvRkC3ikmS5sVDr/6Db3QNxS+oaHni3u2SJxaJwJOMKyV75ISFafsYInb/w5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=swu4qAbw; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a134d4ef56so490515e87.3
        for <linux-media@vger.kernel.org>; Sun, 15 Mar 2026 19:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773626866; x=1774231666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpc22jmT6VGQLTKw1GYmfyJRKbbmD8YhSAyUKYDuoLA=;
        b=swu4qAbwCyHfJnb0idTa86iBrORMw1XPGnKWKZelBm88cGruQtM/VRr+45wNGWsYDX
         GIeHZhDWop1hf/j+yRZ1F7SmBezs1URR/DjrMtXcyWOclIZBkpc1S5BdpymGJi0R/3Jg
         6cP/ZQJOQvv73oOt1NCUX9YGpxFVNOgKhM3Gzxk1BQ7YMy/btKsSJAHcgU/6fJwig7NG
         TdSpknAIx28+3NXwba/8k/t0ZP4w0a0xxVJtrBx95dSw5maAzHJyITZ6aZHhcgeKjvJx
         /2YkvGo1YioHJWJPpDUkVb+8YaxiC+v+QzkxiC9o4VbZFM3tb7cvnYtCwpUwq3QsTX1k
         9jTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773626866; x=1774231666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dpc22jmT6VGQLTKw1GYmfyJRKbbmD8YhSAyUKYDuoLA=;
        b=E9O7oOl3A3ZXqGqLyQbTUKV9Y4RpdNecPlniQbrkCIJwBfFlo8hO2CTU+aFUU+AFPw
         SmWVigYP/7Vgvi6VK2e15SpSVTcm/dlvEY+Fm1ZEBIFMvM7tfHmwNWR+t5vgXiNX175T
         MlEvefSA1XGeBkT1t+Q54vttv5VQ/mOVXg/hVgeBC+V3qZ4knSmP7iL4cslzomJDnXjT
         OayDaZ3EADs7TCIK5Om3cPInM/pzksU9nH+GHIIr2xkqEHKj7/UUJFvpg9W0y8ZNhLwk
         SV3dNCkRmceQnwkvYSYZM9KBr/V4hH7uwxqESSSvdTA1BOsB8oaiJdoqAgk+imFV5Que
         BYog==
X-Forwarded-Encrypted: i=1; AJvYcCWs+xS5Ym2fJndQTP0+uq9AoxEMA95e9TwXMkdyCwG4PoLI5nkP621VDyOTPhln2DzDBZBEdzXzwlRY3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw96Pl7p2bOolzvpPwXjG7vB5achn7JHKGp8Q0P1UZ4W/1WVpyF
	Eu+BPeqfsi75tw/oVWegRmqK2ocEMLguhoNx5hZhavmVa0lY1xTFvG5xBnPHA3nNxvo=
X-Gm-Gg: ATEYQzwYettY2BJaGmvsscE2wlw90Nlyi43tpNJlR0nxTaw1E+fR60gMYiniQ1Bhoxb
	HVAxtGOFWdeoSYhxEvWQyvr+TZYYAJGZDXgaVL7+NnqFowxWy3U+HqURyl1lEPz7S/Kwct4FfYE
	WbKeZDQClBl8e/6Y7D/Wbe69roLJZ8+PVnirHNqmfsDZAllHfADiHoDgVt7EhXEGiuWpejVMLfK
	2cmVE1fpbg4QKXE3yXyFFp0YsUff1yk5/A51WbDe1+yfUbBH4X3LS8n3WzWoktWfUkrmVbZLL3k
	uhkZjNAgE0PLq0NIoSNOFDu9uNzuEOr66AOqDxrLn4pOM13L9W60qv+vnqn9KaMewrSoKXBQXrm
	9JejllAqvuzTRQSZtVAXDLtC3rCzycLnkkfFJYqPRv0BFjwwC7rPJTujqQHAXqRUEZnySN55Zq7
	/s8j0IwWYHo/62ueeF71ENRSYpm+GchfVHnRkuj36Ha9d8SbwZkIJs42bzocAd+XgpOZz4wbTN5
	nRNAg==
X-Received: by 2002:a05:651c:546:b0:38a:8602:71df with SMTP id 38308e7fff4ca-38a89769958mr19446821fa.3.1773626865535;
        Sun, 15 Mar 2026 19:07:45 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366676sm3121084e87.71.2026.03.15.19.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 19:07:44 -0700 (PDT)
Message-ID: <6a25af47-1593-4d2d-b72a-38a68f76ead6@linaro.org>
Date: Mon, 16 Mar 2026 04:07:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-2-fdfe984fe941@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-2-fdfe984fe941@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55835-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 306D9293CD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 03:02, Bryan O'Donoghue wrote:
> Add optional PHY handle definitions. This will allow for supporting both
> legacy PHY definitions as well as supporting the optional new handle based
> approach.
> 
> Drop the legacy high-level 0p8 and 1p2 supplies as required, each PHY has
> its own individual rails. The old binding is still valid but with
> individual nodes we define the rails in the CSIPHY sub-nodes.

The new proposed CSIPHY device tree nodes should be outside of CAMSS
device tree node.

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../bindings/media/qcom,x1e80100-camss.yaml        | 33 ++++++++++++++++++++--
>   1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index b5654ef71bd89..5442f981baebc 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -43,6 +43,14 @@ properties:
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
> @@ -130,6 +138,16 @@ properties:
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
> @@ -162,6 +180,14 @@ properties:
>               required:
>                 - data-lanes
>   
> +patternProperties:
> +  "^phy@[0-9a-f]+$":

CSIPHY device tree nodes shall be put outside of CAMSS device tree node.

> +    $ref: /schemas/phy/qcom,x1e80100-csi2-phy.yaml
> +    unevaluatedProperties: false
> +
> +  "^opp-table(-.*)?$":
> +    type: object
> +
>   required:
>     - compatible
>     - reg
> @@ -175,8 +201,6 @@ required:
>     - iommus
>     - power-domains
>     - power-domain-names
> -  - vdd-csiphy-0p8-supply
> -  - vdd-csiphy-1p2-supply
>     - ports
>   
>   additionalProperties: false
> @@ -188,6 +212,7 @@ examples:
>       #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>       #include <dt-bindings/interconnect/qcom,icc.h>
>       #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
> +    #include <dt-bindings/phy/phy.h>
>       #include <dt-bindings/power/qcom-rpmpd.h>
>   
>       soc {
> @@ -233,6 +258,10 @@ examples:
>                           "vfe_lite0",
>                           "vfe_lite1";
>   
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges;

Here 'ranges' machnery is unexpected, the new proposed CSIPHY devices shall
be described outside of CAMSS device tree node, as it's stated above.

CAMSS is supposed to become a consumer of CSIPHYs, see phy-bindings.txt
for 'phys' property.

> +
>               clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
>                        <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
>                        <&camcc CAM_CC_CORE_AHB_CLK>,
> 

-- 
Best wishes,
Vladimir

