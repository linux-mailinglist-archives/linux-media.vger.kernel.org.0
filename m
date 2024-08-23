Return-Path: <linux-media+bounces-16656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8045195CE1C
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 15:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEE351C228A9
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 13:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83DD18787F;
	Fri, 23 Aug 2024 13:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="plcda0+9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E0417F4F2;
	Fri, 23 Aug 2024 13:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724420408; cv=none; b=u1DUbtjVgRJ5GXujcGnaNnSaeB8O5+WWdHlFKnw6KY2ug5boEmQh/D7o42vrCVSXAzNWfVDYbGaU8y1LVoyZeuYBnw67LPaiK3tjQIlGV00xAzd94raiLd4mPnrF9gLYFKspkwLn29g74hcroQnxSTkFHI8X9zWcUI8NGXsykL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724420408; c=relaxed/simple;
	bh=PVNIeyol8IYLtJCfItEm/7Yr3ehMx/xBpSZLPYAErBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oq/sz4TA231CmWSDgYDOvHRS5ghOd5qwTnSdwERNQCCATTXm1VJCQ72MDLAgt7sHznTHfVy5v3QtwSmeNd1JVj9DiAb+6heXrqQDh5VqkGIPFDpoL4p0j5it1oFYxRvvNzk+ps60OtFHw9eDkSIF8f7ZOOrE8l0kubJN9aEDJeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=plcda0+9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCE812D5;
	Fri, 23 Aug 2024 15:39:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724420341;
	bh=PVNIeyol8IYLtJCfItEm/7Yr3ehMx/xBpSZLPYAErBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=plcda0+9ahnJPCITJcxRctfGGYk47kzQzBO0ROQR0PvvaomtveuRtqNTOF4LnoTbR
	 3Xz/jG+RItjRMXRSxhj/w2DoP0DIS3DGByE4muhuMnplyF4t3NSCWZt9N+1g3Ef9wX
	 AomcrilT2WMShglvGmAF0fURO0/C/Q4Bp/whYiEg=
Date: Fri, 23 Aug 2024 16:40:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 3/6] arm64: dts: renesas: r8a779a0: Add family
 fallback for VIN IP
Message-ID: <20240823134002.GG26098@pendragon.ideasonboard.com>
References: <20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se>
 <20240704161620.1425409-4-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240704161620.1425409-4-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Thu, Jul 04, 2024 at 06:16:17PM +0200, Niklas Söderlund wrote:
> To make it easier to support new Gen4 SoCs a family fallback compatible
> similar to what is used for Gen2 have been added to the VIN bindings.

s/have been/has been/

> Add this fallback to the V3U DTSI.
> 
> There is no functional change, but the addition of the family fallback
> in the bindings produces warnings for V3U for DTS checks if they are not
> added.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> * Changes since v4
> - New in v5.
> ---
>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 96 +++++++++++++++--------
>  1 file changed, 64 insertions(+), 32 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> index 395f8d43ce2d..9870455714da 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -1176,7 +1176,8 @@ msiof5: spi@e6c28000 {
>  		};
>  
>  		vin00: video@e6ef0000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef0000 0 0x1000>;
>  			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 730>;
> @@ -1204,7 +1205,8 @@ vin00isp0: endpoint@0 {
>  		};
>  
>  		vin01: video@e6ef1000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef1000 0 0x1000>;
>  			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 731>;
> @@ -1232,7 +1234,8 @@ vin01isp0: endpoint@0 {
>  		};
>  
>  		vin02: video@e6ef2000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef2000 0 0x1000>;
>  			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 800>;
> @@ -1260,7 +1263,8 @@ vin02isp0: endpoint@0 {
>  		};
>  
>  		vin03: video@e6ef3000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef3000 0 0x1000>;
>  			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 801>;
> @@ -1288,7 +1292,8 @@ vin03isp0: endpoint@0 {
>  		};
>  
>  		vin04: video@e6ef4000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef4000 0 0x1000>;
>  			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 802>;
> @@ -1316,7 +1321,8 @@ vin04isp0: endpoint@0 {
>  		};
>  
>  		vin05: video@e6ef5000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef5000 0 0x1000>;
>  			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 803>;
> @@ -1344,7 +1350,8 @@ vin05isp0: endpoint@0 {
>  		};
>  
>  		vin06: video@e6ef6000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef6000 0 0x1000>;
>  			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 804>;
> @@ -1372,7 +1379,8 @@ vin06isp0: endpoint@0 {
>  		};
>  
>  		vin07: video@e6ef7000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef7000 0 0x1000>;
>  			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 805>;
> @@ -1400,7 +1408,8 @@ vin07isp0: endpoint@0 {
>  		};
>  
>  		vin08: video@e6ef8000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef8000 0 0x1000>;
>  			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 806>;
> @@ -1428,7 +1437,8 @@ vin08isp1: endpoint@1 {
>  		};
>  
>  		vin09: video@e6ef9000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ef9000 0 0x1000>;
>  			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 807>;
> @@ -1456,7 +1466,8 @@ vin09isp1: endpoint@1 {
>  		};
>  
>  		vin10: video@e6efa000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6efa000 0 0x1000>;
>  			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 808>;
> @@ -1484,7 +1495,8 @@ vin10isp1: endpoint@1 {
>  		};
>  
>  		vin11: video@e6efb000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6efb000 0 0x1000>;
>  			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 809>;
> @@ -1512,7 +1524,8 @@ vin11isp1: endpoint@1 {
>  		};
>  
>  		vin12: video@e6efc000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6efc000 0 0x1000>;
>  			interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 810>;
> @@ -1540,7 +1553,8 @@ vin12isp1: endpoint@1 {
>  		};
>  
>  		vin13: video@e6efd000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6efd000 0 0x1000>;
>  			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 811>;
> @@ -1568,7 +1582,8 @@ vin13isp1: endpoint@1 {
>  		};
>  
>  		vin14: video@e6efe000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6efe000 0 0x1000>;
>  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 812>;
> @@ -1596,7 +1611,8 @@ vin14isp1: endpoint@1 {
>  		};
>  
>  		vin15: video@e6eff000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6eff000 0 0x1000>;
>  			interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 813>;
> @@ -1624,7 +1640,8 @@ vin15isp1: endpoint@1 {
>  		};
>  
>  		vin16: video@e6ed0000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ed0000 0 0x1000>;
>  			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 814>;
> @@ -1652,7 +1669,8 @@ vin16isp2: endpoint@2 {
>  		};
>  
>  		vin17: video@e6ed1000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ed1000 0 0x1000>;
>  			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 815>;
> @@ -1680,7 +1698,8 @@ vin17isp2: endpoint@2 {
>  		};
>  
>  		vin18: video@e6ed2000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ed2000 0 0x1000>;
>  			interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 816>;
> @@ -1708,7 +1727,8 @@ vin18isp2: endpoint@2 {
>  		};
>  
>  		vin19: video@e6ed3000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ed3000 0 0x1000>;
>  			interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 817>;
> @@ -1736,7 +1756,8 @@ vin19isp2: endpoint@2 {
>  		};
>  
>  		vin20: video@e6ed4000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ed4000 0 0x1000>;
>  			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 818>;
> @@ -1764,7 +1785,8 @@ vin20isp2: endpoint@2 {
>  		};
>  
>  		vin21: video@e6ed5000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ed5000 0 0x1000>;
>  			interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 819>;
> @@ -1792,7 +1814,8 @@ vin21isp2: endpoint@2 {
>  		};
>  
>  		vin22: video@e6ed6000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ed6000 0 0x1000>;
>  			interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 820>;
> @@ -1820,7 +1843,8 @@ vin22isp2: endpoint@2 {
>  		};
>  
>  		vin23: video@e6ed7000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ed7000 0 0x1000>;
>  			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
G>  			clocks = <&cpg CPG_MOD 821>;
> @@ -1848,7 +1872,8 @@ vin23isp2: endpoint@2 {
>  		};
>  
>  		vin24: video@e6ed8000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ed8000 0 0x1000>;
>  			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 822>;
> @@ -1876,7 +1901,8 @@ vin24isp3: endpoint@3 {
>  		};
>  
>  		vin25: video@e6ed9000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ed9000 0 0x1000>;
>  			interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 823>;
> @@ -1904,7 +1930,8 @@ vin25isp3: endpoint@3 {
>  		};
>  
>  		vin26: video@e6eda000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6eda000 0 0x1000>;
>  			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 824>;
> @@ -1932,7 +1959,8 @@ vin26isp3: endpoint@3 {
>  		};
>  
>  		vin27: video@e6edb000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6edb000 0 0x1000>;
>  			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 825>;
> @@ -1960,7 +1988,8 @@ vin27isp3: endpoint@3 {
>  		};
>  
>  		vin28: video@e6edc000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6edc000 0 0x1000>;
>  			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 826>;
> @@ -1988,7 +2017,8 @@ vin28isp3: endpoint@3 {
>  		};
>  
>  		vin29: video@e6edd000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6edd000 0 0x1000>;
>  			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 827>;
> @@ -2016,7 +2046,8 @@ vin29isp3: endpoint@3 {
>  		};
>  
>  		vin30: video@e6ede000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6ede000 0 0x1000>;
>  			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 828>;
> @@ -2044,7 +2075,8 @@ vin30isp3: endpoint@3 {
>  		};
>  
>  		vin31: video@e6edf000 {
> -			compatible = "renesas,vin-r8a779a0";
> +			compatible = "renesas,vin-r8a779a0",
> +				     "renesas,rcar-gen4-vin";
>  			reg = <0 0xe6edf000 0 0x1000>;
>  			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 829>;

-- 
Regards,

Laurent Pinchart

