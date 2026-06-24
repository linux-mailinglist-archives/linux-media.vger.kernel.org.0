Return-Path: <linux-media+bounces-65542-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 03IuIzLFO2qrcggAu9opvQ
	(envelope-from <linux-media+bounces-65542-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 13:53:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5316BDDB0
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 13:53:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=dolcini.it header.s=default header.b=GzI6Ho+2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65542-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65542-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=dolcini.it;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5607630DC775
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 11:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2197C2E65D;
	Wed, 24 Jun 2026 11:51:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E113009E2;
	Wed, 24 Jun 2026 11:51:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782301865; cv=none; b=TxJtsFLMQuUZHYMrhYHomke2P4iez+rOT4eTSmJNODQ+NMU9fe9dTRM4fTCt9CWOb67dwJ3dK6VmP0Dt1KUbqybcaSI0XXhfnbUBk89V2Rfrw1dXUN+Fpldz3mAFVibZ1qk9hO0Mb2OOoZhRe/FPDQqZbe/IiSa77pZRXUZL4G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782301865; c=relaxed/simple;
	bh=5dzyQLxWEzLeVXPIbmDbho+uwuzcOyKZe8Bzdgi69Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/UNOFNMJ5TA/aeYddwiRZPZWvMNsfEScVziyhe1/iJvFT17IRooDikpZmhc+/B5OGsWLAbNT/nMHal6tbi10w+F6TtcIoY+86AXmSUXwcdal+Kao+WTZ5HhOFeIJO2v8cr0CAl9EYVtnibFDYZ1HaXoJGdNXXgLJA7B26lI1f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=GzI6Ho+2; arc=none smtp.client-ip=217.194.8.81
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id BC1831F842;
	Wed, 24 Jun 2026 13:50:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1782301855;
	bh=HbvPqVl23P2DsY6H61wNv+/45EFbasMQlkmFk62Tx6A=; h=From:To:Subject;
	b=GzI6Ho+2HqSaGIvywvx8Nn2XInWYLXh0fV7tRcTtVPYdJPC6TROoTVTp0Nx8gbag1
	 KqLaP8FOjxEonaEKWUkHnNK80qvlkEOm32Qe/tz67mMtkXb+G/vHFswU7HRpegajnL
	 dOmAnHw9xWuQKxDctvb7+eN8iGzfZd9hIoBwd1EN6rB+b1nc+bWb1IIqiUYseQokSL
	 kEHNGxiByuB1+K/u1+bXv2NdkR0dN5WSOp8byaIN9AmnQ2UZplD3Nm21VJm19Upbkp
	 A6Un/48P3iK0WPut+dhcuaa0UqOSmh49+KMyZUVk4Ep7TZ6PfiBYZbC0TLoo1qFXFA
	 piBUUHCOPKgQg==
Date: Wed, 24 Jun 2026 13:50:50 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org
Subject: Re: [PATCH v6 9/9] arm64: dts: freescale: imx95: Add video codec node
Message-ID: <20260624115050.GA38214@francesco-nb>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
 <20260624072043.238-10-nas.chung@chipsnmedia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624072043.238-10-nas.chung@chipsnmedia.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[dolcini.it,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[dolcini.it:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65542-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nas.chung@chipsnmedia.com,m:mchehab@kernel.org,m:hverkuil@xs4all.nl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-imx@nxp.com,m:linux-arm-kernel@lists.infradead.org,m:jackson.lee@chipsnmedia.com,m:lafley.kim@chipsnmedia.com,m:marek.vasut@mailbox.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[francesco@dolcini.it,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[dolcini.it:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[francesco@dolcini.it,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,pengutronix.de,vger.kernel.org,nxp.com,lists.infradead.org,chipsnmedia.com,mailbox.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[francesco-nb:mid,chipsnmedia.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA5316BDDB0

On Wed, Jun 24, 2026 at 04:20:43PM +0900, Nas Chung wrote:
> Add the Chips and Media wave633 video codec node on IMX95 SoCs.
> 
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  .../boot/dts/freescale/imx95-19x19-evk.dts    | 11 ++++++
>  arch/arm64/boot/dts/freescale/imx95.dtsi      | 36 +++++++++++++++++++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> index 041fd838fabb..7edd1c69966a 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> @@ -76,6 +76,11 @@ linux_cma: linux,cma {
>  			linux,cma-default;
>  			reusable;
>  		};
> +
> +		vpu_boot: memory@a0000000 {
> +			reg = <0 0xa0000000 0 0x100000>;
> +			no-map;
> +		};
>  	};
>  
>  	flexcan1_phy: can-phy0 {
> @@ -1142,3 +1147,9 @@ &tpm6 {
>  	pinctrl-0 = <&pinctrl_tpm6>;
>  	status = "okay";
>  };
> +
> +&vpu {
> +	memory-region = <&vpu_boot>;
> +	sram = <&sram1>;

Can the `sram` node moved to imx95.dtsi or not?

Francesco

