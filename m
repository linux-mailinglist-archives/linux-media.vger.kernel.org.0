Return-Path: <linux-media+bounces-55850-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LKCFSqyt2m9UQEAu9opvQ
	(envelope-from <linux-media+bounces-55850-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 08:32:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2F1295A84
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 08:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F7EE304500D
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 07:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C203D3502AC;
	Mon, 16 Mar 2026 07:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZpsaSSL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D15617B50F;
	Mon, 16 Mar 2026 07:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773646268; cv=none; b=g9NOjQWBVDITwcgITgfgnDV1DDcLAH/EkMUrSGIfTWnvW9pZfARNAG/CHT4vF7zWeS4vl4rcmUnuJ7NwmI/1cpRtcg/TBSmUFH9MkkUU60l6afwpmPh6+Y5fL7IbIxTg4yWyynlbsX+SibMaFSMsPFK+fV6HNQAvzt+FT+vO1dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773646268; c=relaxed/simple;
	bh=+9GGc+7ev5420IQR36OWwvORqpVrbPUVHbp+ilv50is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rO0F6XJyCDj0pe8+6lorxKjmHYYHWKxveK+MZLHuVagPQS1KVn1xkD8bWUkFmHTH6p0kPusWK9MtSIm6BntFBTyBKuLT4cILH0wMbROoajGtA2+fOjXnmG+wfwEgwSVoYpglpsNOtG6fm1mlayf9PLhiUzOlFZLYsAB2x78wXOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZpsaSSL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276C8C19421;
	Mon, 16 Mar 2026 07:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773646267;
	bh=+9GGc+7ev5420IQR36OWwvORqpVrbPUVHbp+ilv50is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lZpsaSSLMLJvOkfj8wlDEO9WFmWVTysEqX1s5IrrxWFecQ+KD+r2MqGYUauqY+I3D
	 CeSuNfuhmd8oh8uhiGGqUJhg0DYHOCnPd0LvZ9Ql71DAFqKElOyCSvoHEfk2ftrsct
	 ZIrpxGLzYrx65gZDc8vKSwg9/ELfWCfjxkf6FJV5DvVtw2bu4g8bjHbGR/BNRjVLi8
	 xUQUex9d7tBk2/BGM6fMWFsWEiVaur0avybPlyQl61q4xXQ39tn41f+OvIG+ehWnG0
	 rx2jHqNQJ0Ck2Kpayg7A8Owt1zb04WJCw5NvYYPsNHO2C2dKXHoGpcmDxgOki8wv51
	 0KvqNOm4kuquw==
Date: Mon, 16 Mar 2026 08:31:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v10 2/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
Message-ID: <20260316-papaya-mink-of-examination-6db401@quoll>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-2-fdfe984fe941@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-2-fdfe984fe941@linaro.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55850-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: EC2F1295A84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 01:02:02AM +0000, Bryan O'Donoghue wrote:
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
>  .../bindings/media/qcom,x1e80100-camss.yaml        | 33 ++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index b5654ef71bd89..5442f981baebc 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -43,6 +43,14 @@ properties:
>        - const: vfe_lite0
>        - const: vfe_lite1
>  
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +
> +  ranges: true
> +
>    clocks:
>      maxItems: 29
>  
> @@ -130,6 +138,16 @@ properties:
>      description:
>        1.2V supply to a PHY.
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
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> @@ -162,6 +180,14 @@ properties:
>              required:
>                - data-lanes
>  
> +patternProperties:
> +  "^phy@[0-9a-f]+$":
> +    $ref: /schemas/phy/qcom,x1e80100-csi2-phy.yaml
> +    unevaluatedProperties: false
> +
> +  "^opp-table(-.*)?$":

Why do you expect multiple opp-tables?

And where are operating-points phandle? Please look how other bindings
do it.

> +    type: object
> +
>  required:
>    - compatible
>    - reg
> @@ -175,8 +201,6 @@ required:
>    - iommus
>    - power-domains
>    - power-domain-names
> -  - vdd-csiphy-0p8-supply
> -  - vdd-csiphy-1p2-supply
>    - ports
>  
>  additionalProperties: false
> @@ -188,6 +212,7 @@ examples:
>      #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>      #include <dt-bindings/interconnect/qcom,icc.h>
>      #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
> +    #include <dt-bindings/phy/phy.h>
>      #include <dt-bindings/power/qcom-rpmpd.h>
>  
>      soc {
> @@ -233,6 +258,10 @@ examples:
>                          "vfe_lite0",
>                          "vfe_lite1";
>  
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges;

Again, incomplete example. Where the the phy?

> +
>              clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
>                       <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
>                       <&camcc CAM_CC_CORE_AHB_CLK>,
> 
> -- 
> 2.52.0
> 

