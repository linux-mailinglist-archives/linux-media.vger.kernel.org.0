Return-Path: <linux-media+bounces-67364-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WFQSIs1dUmqDOwMAu9opvQ
	(envelope-from <linux-media+bounces-67364-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 17:14:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA363741ECF
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 17:14:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=FFX7kGTD;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67364-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67364-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 795CD302989B
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 15:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E567433EAF9;
	Sat, 11 Jul 2026 15:13:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3283A2D5A19;
	Sat, 11 Jul 2026 15:13:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783782835; cv=none; b=spOKdds1Xl+evZi3JMGZ+AcFNVRgtTFUn4rXUHrq6jcVe69x4+YNsljSwhP7vWDI+ClSI/SNYQ0+tsSadGae5BXMJdVxLtWqylNU0UJZKyKOgAoIjC9kxYJC8Lo2LMpBx2OscLxzALaPIGtA3Y5n+glcDIL6slazcrsp4JCykfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783782835; c=relaxed/simple;
	bh=sDXWQS6dOHId7445+Y/ZGN5y9lFGKjA7sUnzyFygZdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WeXTSb40F47GYaNY2EZ6Z2RQ1Jegk4qYKPGegfS2GLOSUTdtIc3SrixPjBxtRKnu6QZ/PbfJajTOTljQVdsqFDC79uK0EnwyVVxR46q4tRf/bA5ALP+kC1wCvWA9CgAnByS1D3pemN+GtHMW3JdwPs9i2VUnCmXzbaeFeW/8TIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FFX7kGTD; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0B9A1477;
	Sat, 11 Jul 2026 08:13:47 -0700 (PDT)
Received: from [10.20.1.47] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A7053F85F;
	Sat, 11 Jul 2026 08:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783782832; bh=sDXWQS6dOHId7445+Y/ZGN5y9lFGKjA7sUnzyFygZdE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FFX7kGTD7Dm5jT3f9oQBpF2GinvIozz2BLkJfOevHZOF93dKmhapKSP2oBd4ZVKKT
	 ZNaed3qMVh0NXCsAclQ1gL3SyjgeomTEQYirlFPsIEb7dirRj2/bXiFYKpYPqkqTBU
	 CBdySDNvnKzcgYTsdhpziU87bFo90FMy5BWgVBys=
Message-ID: <da0f77df-80bc-4917-8892-e61da365454b@arm.com>
Date: Sat, 11 Jul 2026 17:13:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: sun50i-h616: Add video
 engine
To: Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260711135959.3616919-1-wens@kernel.org>
 <20260711135959.3616919-8-wens@kernel.org>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260711135959.3616919-8-wens@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-67364-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wens@kernel.org,m:mripard@kernel.org,m:paulk@sys-base.io,m:mchehab@kernel.org,m:jernej@kernel.org,m:samuel@sholland.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andre.przywara@arm.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.przywara@arm.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA363741ECF

Hi,

On 7/11/26 15:59, Chen-Yu Tsai wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> The H616 SoC has a video engine, and two SRAM regions needed by it.
> 
> Add the video engine to the dtsi file.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> [wens@kernel.org: Add VE SRAM region and commit message]
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Checked against the binding and the manual: clocks, regs, interrupts and 
reset matches. Also test-built the DTB: that worked fine, not sure what 
Sashiko was complaining about.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks,
Andre

> ---
> Changes since v1:
> - Corrected second IOMMU port
> ---
>   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> index 1598e86259ab..c6b3a3f8359a 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -175,6 +175,18 @@ crypto: crypto@1904000 {
>   			resets = <&ccu RST_BUS_CE>;
>   		};
>   
> +		video-codec@1c0e000 {
> +			compatible = "allwinner,sun50i-h616-video-engine";
> +			reg = <0x01c0e000 0x2000>;
> +			clocks = <&ccu CLK_BUS_VE>, <&ccu CLK_VE>,
> +				 <&ccu CLK_MBUS_VE>;
> +			clock-names = "ahb", "mod", "ram";
> +			resets = <&ccu RST_BUS_VE>;
> +			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> +			iommus = <&iommu 3>, <&iommu 2>;
> +			allwinner,sram = <&ve_sram 1>, <&sram_c 1>;
> +		};
> +
>   		syscon: syscon@3000000 {
>   			compatible = "allwinner,sun50i-h616-system-control";
>   			reg = <0x03000000 0x1000>;


