Return-Path: <linux-media+bounces-16953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E04AC9619CF
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 00:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E63E28731E
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 22:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D411D2F72;
	Tue, 27 Aug 2024 22:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="h4/JXfrZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781AF20328;
	Tue, 27 Aug 2024 22:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724796129; cv=none; b=cndL7Rq1JQfmjW7ZqNnNVx6a2PeqpZzkFGcgv7e5+dndRlOrvx7y09/6Z4Lql7X5BCdQ/TrSB0PsbsirSnOGI8QMeE39xsDKHa+AjGyI44395CjKVgA0R4bukdiW/KMxr7H4yW9ucwKjHxYbFG23477eM0sUwdPUdv9ZlOu+K44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724796129; c=relaxed/simple;
	bh=k6zc/+/TqWBL8663PTUnJeaV85AJUycIgD3tUKgolEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZCa+RSDHnEoJvcvoZMxBsox5mGoFOn3GaooB1LnRX3pQW8AUPaGEXMSIH424zDn+vWxVsUbkmbNtN2bQuZkby6MZgaXkjX1l/5m3BXMO0DxKto8injdMpKFmRlMphwHTm93ijq8RPWnny/ZEfgvh21UAKKEcZpe8ozW+1PBTho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=h4/JXfrZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AD49667;
	Wed, 28 Aug 2024 00:00:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724796056;
	bh=k6zc/+/TqWBL8663PTUnJeaV85AJUycIgD3tUKgolEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h4/JXfrZYBMB7Wfqyr0TPvwKCeZwosfyWMi20Q5yNymC0yjGF8jU0Edr36TNYRCD9
	 EqWeLckK9VdIPujFqiz1u9f7HVsrI06A0FC+NkztxIR7owSoDR00u2q3BqqCyarCPo
	 N0M36B9avqk53Z+JcvIck5Lm2NI6tN3zpi4qgJdg=
Date: Wed, 28 Aug 2024 01:01:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 6/6] arm64: dts: renesas: r8a779h0: Add family
 fallback for CSISP IP
Message-ID: <20240827220159.GF30398@pendragon.ideasonboard.com>
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se>
 <20240826144352.3026980-7-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240826144352.3026980-7-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Mon, Aug 26, 2024 at 04:43:52PM +0200, Niklas Söderlund wrote:
> The usage of the V4M CSISP bindings where merged before the bindings
> where approved. At that time the family fallback compatible where not
> part of the bindings, add them.
> 
> Fixes: 2bb78d9fb7c9 ("arm64: dts: renesas: r8a779h0: Add video capture nodes")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> * Changes since v1
> - New in v2.
> ---
>  arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> index 28ca59e735e5..12d8be3fd579 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> @@ -1829,7 +1829,8 @@ csi41isp1: endpoint {
>  		};
>  
>  		isp0: isp@fed00000 {
> -			compatible = "renesas,r8a779h0-isp";
> +			compatible = "renesas,r8a779h0-isp",
> +				     "renesas,rcar-gen4-isp";
>  			reg = <0 0xfed00000 0 0x10000>;
>  			interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_LOW>;
>  			clocks = <&cpg CPG_MOD 612>;
> @@ -1912,7 +1913,8 @@ isp0vin07: endpoint {
>  		};
>  
>  		isp1: isp@fed20000 {
> -			compatible = "renesas,r8a779h0-isp";
> +			compatible = "renesas,r8a779h0-isp",
> +				     "renesas,rcar-gen4-isp";
>  			reg = <0 0xfed20000 0 0x10000>;
>  			interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_LOW>;
>  			clocks = <&cpg CPG_MOD 613>;

-- 
Regards,

Laurent Pinchart

