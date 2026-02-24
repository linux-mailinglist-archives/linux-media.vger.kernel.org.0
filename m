Return-Path: <linux-media+bounces-53266-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CsHM+9RnWk2OgQAu9opvQ
	(envelope-from <linux-media+bounces-53266-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 08:23:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DE007182F8B
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 08:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1DF1F3020FC2
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 07:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7116036405C;
	Tue, 24 Feb 2026 07:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eWFIBFTF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EDA364031;
	Tue, 24 Feb 2026 07:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771917743; cv=none; b=b/ZRG8C7G33k79gJiESXobGvI51FfAap6/EMlwGCq/Y7hCMhpyrKYlAqeDOhSepwV7fOW/xg8Aojj+WKEdR+vPZH9bSH1vlobXKeT/rP3W9MmP6mF+iZa7BE3UJvaq4ICgeVMXOcZkG5WOBll2/mXjc+Kp7RNFQxz9mnIiN5RQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771917743; c=relaxed/simple;
	bh=8sYxib13fUYmbRr8GN0ErWAgBVzMRPr1YYVyj9V9drg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThjLq7kDDemVsBb675+AGIaFIZXgDUmfS8irpcH4yX6/B6P6vwkMGuAhxghzlSym+8otya2FNoFz7rVd9Cmx30r1BeH5pnupmKT2qnipe+jT29W9fH687l/5oT6FvRQmukhT1HthNSYSP6P5/Z386R+9TKMBRyzJuvuHXSok9rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eWFIBFTF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC75EC116D0;
	Tue, 24 Feb 2026 07:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771917743;
	bh=8sYxib13fUYmbRr8GN0ErWAgBVzMRPr1YYVyj9V9drg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eWFIBFTFfD96BBFjZyhR8OqD6QzhH3cB5oEsh8Ydkk3OcGGvYH3mF8alU7drTiAjB
	 xgDVCDtq4TsWk5y1w2IwFngLZzSTL+UWH+P4j3n1wm/2kw6fy9maApDpWFcuhzQnqK
	 mtFLm0d1vQJGT+GhjbTJ432c6aiQBQq5YY5XGr1K7xt0ZTQ/m6zM9FaLcL+hcoK7Vo
	 n/rVIzUck7mJAFLj8YmZslzSZsDHBXAQgGwdAPE0it1BJTFL9t3HEgbbDL9BskqhQE
	 1UJJ6cKy2uqC8Ev/SjRA1yZPwr172Ffv+Fdd998t/UYZqZ19WyBHwHg+7OgDn0cf1C
	 B0tBsqlycriLg==
Date: Tue, 24 Feb 2026 08:22:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Fix vdec register blocks
 order on RK3576
Message-ID: <20260224-glaring-poetic-goshawk-b44d7b@quoll>
References: <20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com>
 <20260223-vdec-reg-order-rk3576-v2-2-daf4942dfc02@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260223-vdec-reg-order-rk3576-v2-2-daf4942dfc02@collabora.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53266-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[1.168.49.192:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,collabora.com:email,27b00000:email]
X-Rspamd-Queue-Id: DE007182F8B
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 09:49:50PM +0200, Cristian Ciocaltea wrote:
> When building device trees for the RK3576 based boards, DTC shows the
> following complaint:
> 
>   rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"

So you need to fix the unit address. This is what the warning tells you.

> 
> Provide the register blocks in the expected address-based order.
> 
> Fixes: da0de806d8b4 ("arm64: dts: rockchip: Add the vdpu383 Video Decoder on rk3576")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> index 49ccdf12ef7e..45eb0d053a6f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1281,10 +1281,10 @@ gpu: gpu@27800000 {
>  
>  		vdec: video-codec@27b00000 {
>  			compatible = "rockchip,rk3576-vdec";
> -			reg = <0x0 0x27b00100 0x0 0x500>,
> -			      <0x0 0x27b00000 0x0 0x100>,
> +			reg = <0x0 0x27b00000 0x0 0x100>,
> +			      <0x0 0x27b00100 0x0 0x500>,
>  			      <0x0 0x27b00600 0x0 0x100>;

The main block, so probably the lowest address as in unit address,
should be used, but this ship has sailed. You shipped this DTS, because
the order of items is FIXED. Your binding change is clearly incorrect
and ABI break without explanation and without reason, so you cannot use
such as an argument here.

You cannot change it without impact, so just fix the unit address.

Best regards,
Krzysztof


