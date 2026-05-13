Return-Path: <linux-media+bounces-61553-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SC06FJQABWrxRAIAu9opvQ
	(envelope-from <linux-media+bounces-61553-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 00:52:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE8253BA78
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 00:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2246F3041A49
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 22:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79719383C7F;
	Wed, 13 May 2026 22:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GyikPo6j"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D878538E120;
	Wed, 13 May 2026 22:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778712702; cv=none; b=bbEX5eBNqxZBJoW+YDiv4YvAN7cA/ljuI3uprjclSup/QeMMM0j8OCGZb0byxyoToQdqZSSZob/GWgtzM3BFPNU18ZCuCw8yYsZWUI7MsVNdvYQhjQKppW9dQB3VhDxOUwO18MngUOjKTOdXOS9Sgwh4QsH2dg6JxpYcPL0ZL7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778712702; c=relaxed/simple;
	bh=wUMpwhwilzNmRvbXOEo9SAv3BseRKnCQdVuFjH9lNqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/H+Pd8/GWxPw7KRaWBGz+AqJkbzbvSR+775gGXJBqt2luFh6ZWnA+YzcfRfxNsQBiw92UbFmQi4qiQS+INF/Zv7yPVFLfEybWI5rJubgFE36lg/bqJR9GRB6XJor5Ta/zbJ6wt51+j3ZiChU0K+Bnfmkkkc/OLk9xkGGQxoWf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GyikPo6j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA97C19425;
	Wed, 13 May 2026 22:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778712702;
	bh=wUMpwhwilzNmRvbXOEo9SAv3BseRKnCQdVuFjH9lNqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GyikPo6jz4MU5gqJ/qUXTLTCmrzOP37ZEtVlCDl9bu3v5sFbCg00OW2GW73GLddNw
	 VtNueE5GPRhPOt+P/1fKAXI15cg4hWOX4yky3fBI9mVJb/zQD9gK59YyVzX+EJGqFG
	 rVO3C/avEOavbcKWd0MkiQh3rDbL0utUEgLVeH4MIJlGJj3CrEL+6mh4FUgG3KPQEv
	 iVaY5m+d0OSKQY5lwXcjHAsUwOtld1FOxiDYOjMElyFI3HLX1SOovIOK4dxt35lk6L
	 Enz57ctHnxRFHcZ9EImBaMet7zyaT2883jCQwTMIpWp8x0oG8tj+ibHqRVpCNXQlx/
	 C5X2VM5cHDclw==
Date: Wed, 13 May 2026 17:51:38 -0500
From: Rob Herring <robh@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
	johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v3 10/15] dt-bindings: media: qcom,qcm2290-camss: Add OPE
 ISP subnode
Message-ID: <20260513225138.GA2234805-robh@kernel.org>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
 <20260508-camss-isp-ope-v3-10-bb1055274603@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-camss-isp-ope-v3-10-bb1055274603@oss.qualcomm.com>
X-Rspamd-Queue-Id: ADE8253BA78
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61553-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 12:49:25AM +0200, Loic Poulain wrote:
> Extend the qcm2290 CAMSS binding to describe CAMSS as a simple bus by
> allowing child ISP nodes. Add the required address and size cells, as
> well as ranges, and validate ISP subnodes against the existing
> qcom,qcm2290-camss-ope schema.
> 
> On qcm2290 the OPE (Offline Processing Engine) is a memory-to-memory
> ISP (Image Signal Processor).
> 
> The address-cells for the CAMSS bus is <2> (64-bit) as related
> DMA/IOMMUs offer 36-bit addressing support.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,qcm2290-camss.yaml       | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> index 391d0f6f67ef5fdfea31dd3683477561516b1556..e70f4cd1348b8065ee9f0e4448185cfd8a8fb7de 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> @@ -52,6 +52,14 @@ properties:
>        - const: vfe1
>        - const: vfe1_cphy_rx
>  
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
>    interrupts:
>      maxItems: 8
>  
> @@ -117,6 +125,11 @@ properties:
>              required:
>                - data-lanes
>  
> +patternProperties:
> +  "^isp@[0-9a-f]+$":
> +    $ref: /schemas/media/qcom,qcm2290-camss-ope.yaml
> +    unevaluatedProperties: false

The referenced schema will get applied twice. Instead, just define 
here what compatible must be present. IIRC, the QCom display bindings 
are structured like that if you need an example.

Rob

