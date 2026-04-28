Return-Path: <linux-media+bounces-59761-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D8OIZdV8GndRwEAu9opvQ
	(envelope-from <linux-media+bounces-59761-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 08:37:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0051047E1EE
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 08:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D465D3043523
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 06:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6414534EF04;
	Tue, 28 Apr 2026 06:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dN6IpnOh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FC3348883;
	Tue, 28 Apr 2026 06:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777358149; cv=none; b=WFAwIVmZcqc/VaH4EZVg3AFWzsTrsTArzl+6nq36FGwiYSr6neGglNmV1UmVZwBsW1KCDY0dHDUJAaCLz0n6PQEhY1DVq+AnC57zY9VXWTPu28V00oMDUGY6VTqSQf1YSBhqgY8yeM7rBR4BO0rblmelz00xwPoHmgovjnaT2ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777358149; c=relaxed/simple;
	bh=vz/Sb1hlBnsqaIN7hQ/T+8KinGrjDXu1ayrskd2xKrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFPZ6WFirLgidTOID4BNcWfYHoTCEEZ2qTzWSlO1+sUonPwcbyYhQ44KHvMEK2wSVgU3xFWzxGm2778OEoGjdQUrV8RrhOkClotRZltuc9zK1OuWNphkRQS4r/5UEP12qDqYtaiECPwttU3nu16hHQTGB3LWAOHWCSjNDAuEkzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dN6IpnOh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7136C2BCB5;
	Tue, 28 Apr 2026 06:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777358149;
	bh=vz/Sb1hlBnsqaIN7hQ/T+8KinGrjDXu1ayrskd2xKrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dN6IpnOhoAGIEKdNAX2u+DsYtps6nSP7JtpjHEYxaJTFQDZxCIOCfEVaosRWGM+nn
	 SNvghifzMRb9LIAeqwWVy9hxhvifBQbdpoVpajj28sCRJPVMbd57imH23fSJoHv7UJ
	 2bTmVJIgqH0nBRTOESGjt1tdvxfhsGXSWJm+buheKVnF4j3H5OA4hdumUSf+xjeyZq
	 4ai8jjI8fToPiD/ca5fGTxoQkz8bt/KNV5d0SQYaeeVEMZYDiPesxmaIA9kG0ysUtJ
	 rSdEwHzhO8PtnPKXGHSbRvZKoSHfEtIPqEVNZ3xhLgBwdnBkyivrUw9Tz6SxLjWihV
	 DFunPsGmgDang==
Date: Tue, 28 Apr 2026 08:35:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 11/14] dt-bindings: media: qcom,qcm2290-camss: Add OPE
 ISP subnode
Message-ID: <20260428-demonic-albatross-of-enrichment-aa6f26@quoll>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-11-f430e7485009@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427-camss-isp-ope-v2-11-f430e7485009@oss.qualcomm.com>
X-Rspamd-Queue-Id: 0051047E1EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59761-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 02:43:38PM +0200, Loic Poulain wrote:
> Extend the qcm2290 CAMSS binding to describe CAMSS as a simple bus by
> allowing child ISP nodes. Add the required address and size cells, as
> well as ranges, and validate ISP subnodes against the existing
> qcom,qcm2290-camss-ope schema.
> 
> On qcm2290 the OPE (Offline Processing Engine) is a memory-to-memory
> ISP (Image Signal Processor).
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,qcm2290-camss.yaml       | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> index 391d0f6f67ef5fdfea31dd3683477561516b1556..d8b356028e24c3c5b2e9b7f20e220db7d491ad68 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> @@ -52,6 +52,14 @@ properties:
>        - const: vfe1
>        - const: vfe1_cphy_rx
>  
> +  '#address-cells':

Please use consistent quotes, either ' or "

> +    const: 2

This means the child will use 64-bit addressing, but does it need that?
Or do you need that to have 36-bit DMA addressing? If there are true no
needs for above, usually recommendation is to use narrowe address space
for children, so only 32-bit.


> +
> +  '#size-cells':
> +    const: 2

Best regards,
Krzysztof


