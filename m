Return-Path: <linux-media+bounces-66718-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z4J5C9KTS2piVwEAu9opvQ
	(envelope-from <linux-media+bounces-66718-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 13:38:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD0670FF64
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 13:38:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=bhpNUUzz;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66718-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66718-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0E6D35C17A7
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 09:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC4742255A;
	Mon,  6 Jul 2026 09:21:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200B541DEE4;
	Mon,  6 Jul 2026 09:21:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329696; cv=none; b=XGpQ4uo8UHEPG31NyqduDw9+2RMpdSEgS9yL2ZGMj3rPoCB+gJfJtBwZClmloEjPMZr4wBsdKCAfcFxiLYVMc6ET6y0y6quO8+/gjnIxC1F+XSBeBWwPP/vWSLHAuRl/hwymj8L4jEO7YC1+fe2XBoP7WyiFEJaxGl6D/YwsCYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329696; c=relaxed/simple;
	bh=1JBo9aYBrCOqV4k9LD/HWHclWEQxNqoysZ2Aob1Jdtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z43QRkCt3vy2i1jYkZ0pLNt+twh9pfNel3k0wHQGuiDPzPTzWP9Emtj/puNFQRtoHczkZDnE0FY9Vz/E22ta2v3B1BSZY+5syWnFCxPunWKlnMOwpy/zKPX06tGfV2/jPnB/p5tJrB8/dvnS4xojMKpIfAJHGnOU2aPY4dPXqk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bhpNUUzz; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B61E228C7;
	Mon,  6 Jul 2026 02:21:27 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEDE33F7B4;
	Mon,  6 Jul 2026 02:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783329692; bh=1JBo9aYBrCOqV4k9LD/HWHclWEQxNqoysZ2Aob1Jdtk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bhpNUUzzt7h988FqRrP93aumvnNVwYOtonMg08GWB5J4D2QYAtvsZbkUt66scOHwj
	 ixJ3LsVaTnTKR2mM8yIrdRGyh0Di9+GPvIAxUO0+LvWPjK0YNmPtGZuJoVtJB7DLf9
	 E7alh2RhRaJMc+GFTWlk490rDd51ivOycSXaDojU=
Message-ID: <97a674a3-4833-4aa6-a9a2-3ab5472ee4b3@arm.com>
Date: Mon, 6 Jul 2026 11:21:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: allwinner: a523: add IR receiver node
To: Justin Suess <utilityemal77@gmail.com>, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Sashiko <sashiko-bot@kernel.org>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
 <20260702214750.3428694-4-utilityemal77@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260702214750.3428694-4-utilityemal77@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66718-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,mess.org,kernel.org,sholland.org];
	FORGED_RECIPIENTS(0.00)[m:utilityemal77@gmail.com,m:sean@mess.org,m:mchehab@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mripard@kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:sashiko-bot@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andre.przywara@arm.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:from_mime,arm.com:dkim,arm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FD0670FF64

Hi Justin,

I checked the numbers below against the manual, they match up: MMIO base 
address, interrupt number, clocks and resets.

One thing I figured is that the A523/T527 contains another CIR-RX 
instance, in the "CPUX" domain. That's used for instance on the 
Avaota-A1. So we need another node describing this instance.

Some more below...

On 7/2/26 23:47, Justin Suess wrote:
> The A523 has a CIR receiver in the RTC power domain, clocked from the
> R-CCU, with its RX signal available on PL11.
> 
> Clock the module directly from the 24 MHz host oscillator; the driver
> selects a /256 sample divider on this SoC, giving a sample period
> close to the legacy 8 MHz / 64 configuration of older SoCs.
> 
> Keep the node disabled by default; boards with an IR receiver can
> enable it.
> 
> Signed-off-by: Justin Suess <utilityemal77@gmail.com>
> ---
>   .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index ca6a16807049..5e46c4b1ee61 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -927,6 +927,25 @@ r_i2c_pins: r-i2c-pins {
>   				allwinner,pinmux = <2>;
>   				function = "r_i2c0";
>   			};
> +
> +			r_ir_rx_pin: r-ir-rx-pin {
> +				pins = "PL11";
> +				allwinner,pinmux = <2>;
> +				function = "s_cir";
> +			};
> +		};
> +
> +		r_ir: ir@7040000 {
> +			compatible = "allwinner,sun55i-a523-ir";

As mentioned in the other email, I think we can use the fallback 
compatible, so add this here.

> +			reg = <0x07040000 0x400>;
> +			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&r_ccu CLK_BUS_R_IR_RX>, <&r_ccu CLK_R_IR_RX>;
> +			clock-names = "apb", "ir";
> +			clock-frequency = <24000000>;

As said in the other email, I think this property is misnamed and 
misleading, just drop it, and let the driver select the sample rate.

> +			resets = <&r_ccu RST_BUS_R_IR_RX>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&r_ir_rx_pin>;

There is another pin which carries the R-IR-RX signal, on pin PM8. In 
those cases we do not add the pinctrl properties to the .dtsi DT node, 
but let each board add it, right next to where they enable the IP.
So please drop those two lines from here.

Cheers,
Andre

> +			status = "disabled";
>   		};
>   
>   		pck600: power-controller@7060000 {


