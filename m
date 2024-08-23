Return-Path: <linux-media+bounces-16655-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E11E595CE19
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 15:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F8DCB24C5A
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 13:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F13318755C;
	Fri, 23 Aug 2024 13:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eC913mKA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D097C17F4F2;
	Fri, 23 Aug 2024 13:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724420346; cv=none; b=IbpqyqAN6iAA/nbVZ6DowR698DAs56Naool+UXHVTzsUztG6iTB+iaFoPw+mBCJOOv83f8FWRQa2JmYc6w4IF3HwAKtAvmUbZcWCWtcqyA9kPSMtXGOb1ARAWiFo+jxmaWrN3DuCbzN0uN006L6vvJl2sz2V6QM24krc6wi0ksk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724420346; c=relaxed/simple;
	bh=ofuYoL8LcEfM9T4aeR6FNLSYMVz5COpvGfXiPo5isps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ItUiXfvzFpMP/IiRt8jdxA/uzzVMBlydsK9QRvHTQ/YE4pf2GBOr+fXToHfzsKgC56dosjJEpDlHsRkDQp+JAhUUFnYmNH5PS/ODDOMVewYTjOqdFaRRZAxDG16GzD1WebXpZseVFHGjkTy25rnV7pyYjnDF+o/mZ/NBOHzU8DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eC913mKA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 81C512D5;
	Fri, 23 Aug 2024 15:37:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724420278;
	bh=ofuYoL8LcEfM9T4aeR6FNLSYMVz5COpvGfXiPo5isps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eC913mKAm5ET748SfvQJ90Q838BkdVgictuYkXPQ6qv0Ds902P6qCXuC85UOnRHi+
	 8dEiQ1Stelmt+xbaUsL/TMXc0wR8QjBIHmJMkVVivjGZlS2UsNHfNGfmJDchBSi9ru
	 8B2r6mMu2oN8z8x0XvgQXjGO8ZfdwItRs2mM3+7o=
Date: Fri, 23 Aug 2024 16:39:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 2/6] arm64: dts: renesas: r8a779g0: Add family
 fallback for VIN IP
Message-ID: <20240823133900.GF26098@pendragon.ideasonboard.com>
References: <20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se>
 <20240704161620.1425409-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240704161620.1425409-3-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Thu, Jul 04, 2024 at 06:16:16PM +0200, Niklas Söderlund wrote:
> To make it easier to support new Gen4 SoCs a family fallback compatible
> similar to what is used for Gen2 have been added to the VIN bindings.

s/have been/has been/

> Add this fallback to the V4H DTSI.
> 
> There is no functional change, but the addition of the family fallback
> in the bindings produces warnings for V4H for DTS checks if they are not
> added.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> * Changes since v3
> - New in v4.
> ---
>  arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 48 +++++++++++++++--------
>  1 file changed, 32 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> index c5fc414928c9..9e75b3f4d317 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -1189,7 +1189,8 @@ msiof5: spi@e6c28000 {
>  		};
>  
>  		vin00: video@e6ef0000 {
> -			compatible = "renesas,vin-r8a779g0";
> +			compatible = "renesas,vin-r8a779g0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef0000 0 0x1000>;
>  			interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 730>;
> @@ -1217,7 +1218,8 @@ vin00isp0: endpoint@0 {
>  		};
>  
>  		vin01: video@e6ef1000 {
> -			compatible = "renesas,vin-r8a779g0";
> +			compatible = "renesas,vin-r8a779g0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef1000 0 0x1000>;
>  			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 731>;
> @@ -1245,7 +1247,8 @@ vin01isp0: endpoint@0 {
>  		};
>  
>  		vin02: video@e6ef2000 {
> -			compatible = "renesas,vin-r8a779g0";
> +			compatible = "renesas,vin-r8a779g0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef2000 0 0x1000>;
>  			interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 800>;
> @@ -1273,7 +1276,8 @@ vin02isp0: endpoint@0 {
>  		};
>  
>  		vin03: video@e6ef3000 {
> -			compatible = "renesas,vin-r8a779g0";
> +			compatible = "renesas,vin-r8a779g0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef3000 0 0x1000>;
>  			interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 801>;
> @@ -1301,7 +1305,8 @@ vin03isp0: endpoint@0 {
>  		};
>  
>  		vin04: video@e6ef4000 {
> -			compatible = "renesas,vin-r8a779g0";
> +			compatible = "renesas,vin-r8a779g0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef4000 0 0x1000>;
>  			interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 802>;
> @@ -1329,7 +1334,8 @@ vin04isp0: endpoint@0 {
>  		};
>  
>  		vin05: video@e6ef5000 {
> -			compatible = "renesas,vin-r8a779g0";
> +			compatible = "renesas,vin-r8a779g0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef5000 0 0x1000>;
>  			interrupts = <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 803>;
> @@ -1357,7 +1363,8 @@ vin05isp0: endpoint@0 {
>  		};
>  
>  		vin06: video@e6ef6000 {
> -			compatible = "renesas,vin-r8a779g0";
> +			compatible = "renesas,vin-r8a779g0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef6000 0 0x1000>;
>  			interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 804>;
> @@ -1385,7 +1392,8 @@ vin06isp0: endpoint@0 {
>  		};
>  
>  		vin07: video@e6ef7000 {
> -			compatible = "renesas,vin-r8a779g0";
> +			compatible = "renesas,vin-r8a779g0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef7000 0 0x1000>;
>  			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 805>;
> @@ -1413,7 +1421,8 @@ vin07isp0: endpoint@0 {
>  		};
>  
>  		vin08: video@e6ef8000 {
> -			compatible = "renesas,vin-r8a779g0";
> +			compatible = "renesas,vin-r8a779g0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef8000 0 0x1000>;
>  			interrupts = <GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 806>;
> @@ -1441,7 +1450,8 @@ vin08isp1: endpoint@1 {
>  		};
>  
>  		vin09: video@e6ef9000 {
> -			compatible = "renesas,vin-r8a779g0";
> +			compatible = "renesas,vin-r8a779g0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef9000 0 0x1000>;
>  			interrupts = <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 807>;
> @@ -1469,7 +1479,8 @@ vin09isp1: endpoint@1 {
>  		};
>  
>  		vin10: video@e6efa000 {
> -			compatible = "renesas,vin-r8a779g0";
> +			compatible = "renesas,vin-r8a779g0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6efa000 0 0x1000>;
>  			interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 808>;
> @@ -1497,7 +1508,8 @@ vin10isp1: endpoint@1 {
>  		};
>  
>  		vin11: video@e6efb000 {
> -			compatible = "renesas,vin-r8a779g0";
> +			compatible = "renesas,vin-r8a779g0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6efb000 0 0x1000>;
>  			interrupts = <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 809>;
> @@ -1525,7 +1537,8 @@ vin11isp1: endpoint@1 {
>  		};
>  
>  		vin12: video@e6efc000 {
> -			compatible = "renesas,vin-r8a779g0";
> +			compatible = "renesas,vin-r8a779g0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6efc000 0 0x1000>;
>  			interrupts = <GIC_SPI 541 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 810>;
> @@ -1553,7 +1566,8 @@ vin12isp1: endpoint@1 {
>  		};
>  
>  		vin13: video@e6efd000 {
> -			compatible = "renesas,vin-r8a779g0";
> +			compatible = "renesas,vin-r8a779g0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6efd000 0 0x1000>;
>  			interrupts = <GIC_SPI 542 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 811>;
> @@ -1581,7 +1595,8 @@ vin13isp1: endpoint@1 {
>  		};
>  
>  		vin14: video@e6efe000 {
> -			compatible = "renesas,vin-r8a779g0";
> +			compatible = "renesas,vin-r8a779g0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6efe000 0 0x1000>;
>  			interrupts = <GIC_SPI 543 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 812>;
> @@ -1609,7 +1624,8 @@ vin14isp1: endpoint@1 {
>  		};
>  
>  		vin15: video@e6eff000 {
> -			compatible = "renesas,vin-r8a779g0";
> +			compatible = "renesas,vin-r8a779g0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6eff000 0 0x1000>;
>  			interrupts = <GIC_SPI 544 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 813>;

-- 
Regards,

Laurent Pinchart

