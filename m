Return-Path: <linux-media+bounces-16659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E8295CE3C
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 15:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F30E72828F9
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 13:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE552188011;
	Fri, 23 Aug 2024 13:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u36CbmL2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC334430;
	Fri, 23 Aug 2024 13:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724420571; cv=none; b=ZigU9577wtMf4NRJhhVOdhl2BXWMGU6sJJ04j52fWKIADRbMnaUVoVPkYfRA53c+XYW+b2bwrFqpbDvbWwLyIWczOkMDaA/l0qvZNnzlMfT4/Lc5bj3fFi712zRqZeVxVliCDJDyvxlgx6xCzh6tyH4y/2/LrC6y++CmCd61zGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724420571; c=relaxed/simple;
	bh=uPf1FEqDRDZ587fNXRrYBb3EjdY4z83iy4gjjmDNIjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKr4jxqTl53S1eIFO1OGQIw0dWRVsWvB5LyxThPSCKIZWG+0NbVmGhkbRn3yaF6NADC8SEI3HWLCWU0Joe4QebtCpYg2FQCRBR5PXfEPmNriziJ6OjaHrthF7lCU4JGfkJC2Tr+RKv1hgNiYtpxosnInpThLQiVWq+fNAdxKsNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u36CbmL2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 135542D5;
	Fri, 23 Aug 2024 15:41:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724420504;
	bh=uPf1FEqDRDZ587fNXRrYBb3EjdY4z83iy4gjjmDNIjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u36CbmL2qugMtBhx2jxqAmmILKrihYQRYPrJIm5JRCsdZrYJa5WIemnHzTmq4RGTC
	 Cq+cFdIxVE1yk0ZTUK+sOxE3IOdXkwHWpS1FG7K3jEOlwe0z53k7sb+XgZI/25ABIr
	 F0MStKEBHkKuNnerM/vblFBjq7gV+7ZZ3dipYLfA=
Date: Fri, 23 Aug 2024 16:42:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 6/6] arm64: dts: renesas: r8a779h0: Add family
 fallback for VIN IP
Message-ID: <20240823134245.GJ26098@pendragon.ideasonboard.com>
References: <20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se>
 <20240704161620.1425409-7-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240704161620.1425409-7-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Thu, Jul 04, 2024 at 06:16:20PM +0200, Niklas Söderlund wrote:
> The usage of the V4M VIN bindings where merged before the bindings where

s/where/were/g

> approved. At that time the family fallback compatible where not part of
> the bindings, add them.
> 
> Fixes: 2bb78d9fb7c9 ("arm64: dts: renesas: r8a779h0: Add video capture nodes")
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> * Changes since v3
> - New in v4.
> ---
>  arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 48 +++++++++++++++--------
>  1 file changed, 32 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> index 8f5763b5f267..b9f49288a115 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> @@ -945,7 +945,8 @@ msiof5: spi@e6c28000 {
>  		};
>  
>  		vin00: video@e6ef0000 {
> -			compatible = "renesas,vin-r8a779h0";
> +			compatible = "renesas,vin-r8a779h0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef0000 0 0x1000>;
>  			interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 730>;
> @@ -973,7 +974,8 @@ vin00isp0: endpoint@0 {
>  		};
>  
>  		vin01: video@e6ef1000 {
> -			compatible = "renesas,vin-r8a779h0";
> +			compatible = "renesas,vin-r8a779h0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef1000 0 0x1000>;
>  			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 731>;
> @@ -1001,7 +1003,8 @@ vin01isp0: endpoint@0 {
>  		};
>  
>  		vin02: video@e6ef2000 {
> -			compatible = "renesas,vin-r8a779h0";
> +			compatible = "renesas,vin-r8a779h0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef2000 0 0x1000>;
>  			interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 800>;
> @@ -1029,7 +1032,8 @@ vin02isp0: endpoint@0 {
>  		};
>  
>  		vin03: video@e6ef3000 {
> -			compatible = "renesas,vin-r8a779h0";
> +			compatible = "renesas,vin-r8a779h0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef3000 0 0x1000>;
>  			interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 801>;
> @@ -1057,7 +1061,8 @@ vin03isp0: endpoint@0 {
>  		};
>  
>  		vin04: video@e6ef4000 {
> -			compatible = "renesas,vin-r8a779h0";
> +			compatible = "renesas,vin-r8a779h0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef4000 0 0x1000>;
>  			interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 802>;
> @@ -1085,7 +1090,8 @@ vin04isp0: endpoint@0 {
>  		};
>  
>  		vin05: video@e6ef5000 {
> -			compatible = "renesas,vin-r8a779h0";
> +			compatible = "renesas,vin-r8a779h0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef5000 0 0x1000>;
>  			interrupts = <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 803>;
> @@ -1113,7 +1119,8 @@ vin05isp0: endpoint@0 {
>  		};
>  
>  		vin06: video@e6ef6000 {
> -			compatible = "renesas,vin-r8a779h0";
> +			compatible = "renesas,vin-r8a779h0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef6000 0 0x1000>;
>  			interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 804>;
> @@ -1141,7 +1148,8 @@ vin06isp0: endpoint@0 {
>  		};
>  
>  		vin07: video@e6ef7000 {
> -			compatible = "renesas,vin-r8a779h0";
> +			compatible = "renesas,vin-r8a779h0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef7000 0 0x1000>;
>  			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 805>;
> @@ -1169,7 +1177,8 @@ vin07isp0: endpoint@0 {
>  		};
>  
>  		vin08: video@e6ef8000 {
> -			compatible = "renesas,vin-r8a779h0";
> +			compatible = "renesas,vin-r8a779h0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef8000 0 0x1000>;
>  			interrupts = <GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 806>;
> @@ -1197,7 +1206,8 @@ vin08isp1: endpoint@1 {
>  		};
>  
>  		vin09: video@e6ef9000 {
> -			compatible = "renesas,vin-r8a779h0";
> +			compatible = "renesas,vin-r8a779h0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef9000 0 0x1000>;
>  			interrupts = <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 807>;
> @@ -1225,7 +1235,8 @@ vin09isp1: endpoint@1 {
>  		};
>  
>  		vin10: video@e6efa000 {
> -			compatible = "renesas,vin-r8a779h0";
> +			compatible = "renesas,vin-r8a779h0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6efa000 0 0x1000>;
>  			interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 808>;
> @@ -1253,7 +1264,8 @@ vin10isp1: endpoint@1 {
>  		};
>  
>  		vin11: video@e6efb000 {
> -			compatible = "renesas,vin-r8a779h0";
> +			compatible = "renesas,vin-r8a779h0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6efb000 0 0x1000>;
>  			interrupts = <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 809>;
> @@ -1281,7 +1293,8 @@ vin11isp1: endpoint@1 {
>  		};
>  
>  		vin12: video@e6efc000 {
> -			compatible = "renesas,vin-r8a779h0";
> +			compatible = "renesas,vin-r8a779h0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6efc000 0 0x1000>;
>  			interrupts = <GIC_SPI 541 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 810>;
> @@ -1309,7 +1322,8 @@ vin12isp1: endpoint@1 {
>  		};
>  
>  		vin13: video@e6efd000 {
> -			compatible = "renesas,vin-r8a779h0";
> +			compatible = "renesas,vin-r8a779h0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6efd000 0 0x1000>;
>  			interrupts = <GIC_SPI 542 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 811>;
> @@ -1337,7 +1351,8 @@ vin13isp1: endpoint@1 {
>  		};
>  
>  		vin14: video@e6efe000 {
> -			compatible = "renesas,vin-r8a779h0";
> +			compatible = "renesas,vin-r8a779h0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6efe000 0 0x1000>;
>  			interrupts = <GIC_SPI 543 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 812>;
> @@ -1365,7 +1380,8 @@ vin14isp1: endpoint@1 {
>  		};
>  
>  		vin15: video@e6eff000 {
> -			compatible = "renesas,vin-r8a779h0";
> +			compatible = "renesas,vin-r8a779h0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6eff000 0 0x1000>;
>  			interrupts = <GIC_SPI 544 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 813>;

-- 
Regards,

Laurent Pinchart

