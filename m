Return-Path: <linux-media+bounces-53265-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAx+JvVQnWkBOgQAu9opvQ
	(envelope-from <linux-media+bounces-53265-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 08:19:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC4B182E9B
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 08:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1E663300AD99
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 07:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C339336404E;
	Tue, 24 Feb 2026 07:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uPcCf2iL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318C9362130;
	Tue, 24 Feb 2026 07:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771917534; cv=none; b=IIEJ5EhtROANYrU0dWbJTPrpSGdI+dnhLYsHcRpxav74j4+6dfymQB78k5pEWBhdTxq8GfY75x19p/Gw9pSBXSdfaSUPbQLjphTy5eUqQARdSiqe5/Fj/FhfPsQxYOLFEmqu0Fv/Ubc70B0aju5/I0ByxTc1tkKgzX0zeZdoqWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771917534; c=relaxed/simple;
	bh=sFluk2eGI1W3PJqITBVgNfyYqxuSd712xdTbU3mm0ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEGj+IImkf5fg3p93++rsAhP6yA4CEJQ10BU+69jF/5yuaXwt2boWOe5IteuCNGqYS1x2M/KsPAIU6g6C1BFCZrtjWjriYFA4r8VQY8gnK6aTyJlFuctcV0nJnZQ5n3nfwjSQOCIcuVd7iimHBgVNIygFyZudZLNTizOnXzaN8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uPcCf2iL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36135C116D0;
	Tue, 24 Feb 2026 07:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771917533;
	bh=sFluk2eGI1W3PJqITBVgNfyYqxuSd712xdTbU3mm0ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uPcCf2iLfv2sxBENzOpEkV2r/3y5OqlFS27BZZVNYSsEwu9H6INImRvEfLs6gMfSM
	 ODp4+SX77RDBGtqUa8uhbEhaxg1Enr0P8rqGgbqdZwI+psYwtOxHzibg34WRKtEH7c
	 a6ClA/CpMHCUs8C59So3PsEZXBT98nO9VDJuVv50Ihd+RJMAaQFzeFxOysubC5Ut1M
	 qTwyr68eD5oi052iu54QedFz+j2UResYOobkzMCDL5YihJeNCzk4hiwYPmQkv6OQTm
	 vBmXjLUKEMO4nclSNvo+Aiir2QOkf0xV7LX/2gnvU0HLnqwUFsO66hjcKXDgs1Q/Be
	 9sEX5p7ugJGAA==
Date: Tue, 24 Feb 2026 08:18:51 +0100
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
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Fix vdec register blocks
 order on RK3588
Message-ID: <20260224-enchanted-scallop-of-art-f442c2@quoll>
References: <20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com>
 <20260223-vdec-reg-order-rk3576-v2-3-daf4942dfc02@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260223-vdec-reg-order-rk3576-v2-3-daf4942dfc02@collabora.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53265-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,collabora.com:email,fdbac800:email,fdc38000:email]
X-Rspamd-Queue-Id: DAC4B182E9B
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 09:49:51PM +0200, Cristian Ciocaltea wrote:
> Provide the register blocks in the expected address-based order for

No, there is NO such convention. Don't make up rules.

> vdec0 & vdec1 nodes.  This aligns with a similar fix for RK3576 where
> DTC complained about the bus address format.
> 
> Fixes: f61731bd6062 ("arm64: dts: rockchip: Add the vdpu381 Video Decoders on RK3588")

Not true, otherwise explain user-visible bug.

> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> index 7fe9593d8c19..b95129f85aba 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -1355,10 +1355,10 @@ vepu121_3_mmu: iommu@fdbac800 {
>  
>  	vdec0: video-codec@fdc38000 {
>  		compatible = "rockchip,rk3588-vdec";
> -		reg = <0x0 0xfdc38100 0x0 0x500>,
> -		      <0x0 0xfdc38000 0x0 0x100>,
> +		reg = <0x0 0xfdc38000 0x0 0x100>,
> +		      <0x0 0xfdc38100 0x0 0x500>,
>  		      <0x0 0xfdc38600 0x0 0x100>;

NAK, impacts DTS users without any reason.

Best regards,
Krzysztof


