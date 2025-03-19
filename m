Return-Path: <linux-media+bounces-28492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1FFA6920C
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 16:00:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56B94164125
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 14:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E9A1DE4F8;
	Wed, 19 Mar 2025 14:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MoT6kVbq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA7B1C9B62;
	Wed, 19 Mar 2025 14:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742395813; cv=none; b=ZrhhwWRfVSAACYOlDwxa+1M5k5Xsto8WIPi6e2rFZmw0STQXwc5dV2fbWMUs5fNONI/GpT/dkSf9dgxI8WCIQSYiw3QnN38cmIzogvHpj7fXOeBK40Le2pgos3nEcXaiYwbq3cuxqJU0jJQV7Ei81EUv5nq5hd2gCl8U3/fEncA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742395813; c=relaxed/simple;
	bh=3F9NEowTuNHLMAc1h4HtO+FWEVyEP264qY5xCg55J2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQyv6gR3FhIdfMrt75ZfqDXo6tWdJzXYdt+HAqGiO/nMZhYHWgQCv1+x+DUM+3YakCTQl31eQkH7G13kHQ9RfJ/sUboOFUM/AB/UPGwNct09T69TPqjCzm4Ye3nvyA0Z8SUOH6e4P7/1bM65hNC50WM7JOw5b5PXUMwUnLzdo6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MoT6kVbq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5269D55A;
	Wed, 19 Mar 2025 15:48:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742395700;
	bh=3F9NEowTuNHLMAc1h4HtO+FWEVyEP264qY5xCg55J2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MoT6kVbqXJO/mKemirJD9knzCTwtiPN8lWz4kmOW1QYyDdbnjdGSSc0iikafpL3Rn
	 /sm9LJT4esblrzSBlnrsui4dsliLO82MCT2JmFG3K8LrlRK1j75pADqMkL9X3iaWoY
	 rJ2BECcyEhfdm6sISo3TyEN/TNbikBJ+Mi4mG3Bw=
Date: Wed, 19 Mar 2025 15:50:00 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: renesas: r8a779a0: Add ISP core function
 block
Message-ID: <hwj6d3ll75magopi5oak4zmboy5dol3ztv3isd6wvrxmvbkx4b@ayjumbqmuk3l>
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
 <20250315152708.328036-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250315152708.328036-3-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas

On Sat, Mar 15, 2025 at 04:27:03PM +0100, Niklas Söderlund wrote:
> All ISP instances on V3U have both a channel select and core function
> block, describe the core region in addition to the existing cs region.
>
> The interrupt number already described intended to reflect the cs
> function but did incorrectly describe the core block. This was not

I can't find the interrupt mapping table for V3U, so this is the only
thing I can't check

> noticed until now as the driver do not make use of the interrupt for the
> cs block.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

The rest looks good

> ---
>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 60 +++++++++++++++++------
>  1 file changed, 44 insertions(+), 16 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> index f1613bfd1632..95ff69339991 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -2588,13 +2588,20 @@ du_out_dsi1: endpoint {
>  		isp0: isp@fed00000 {
>  			compatible = "renesas,r8a779a0-isp",
>  				     "renesas,rcar-gen4-isp";
> -			reg = <0 0xfed00000 0 0x10000>;
> -			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 612>;
> +			reg = <0 0xfed00000 0 0x10000>, <0 0xfec00000 0 0x100000>;
> +			reg-names = "cs", "core";

However, won't the presence of a "core" part trigger the probing of
the forthcoming RPP core support, which should not support V3U as far
I understood ?

> +			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "cs", "core";
> +			clocks = <&cpg CPG_MOD 612>, <&cpg CPG_MOD 16>;
> +			clock-names = "cs", "core";
>  			power-domains = <&sysc R8A779A0_PD_A3ISP01>;
> -			resets = <&cpg 612>;
> +			resets = <&cpg 612>, <&cpg 16>;
> +			reset-names = "cs", "core";
>  			status = "disabled";
>
> +			renesas,vspx = <&vspx0>;
> +
>  			ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> @@ -2672,13 +2679,20 @@ isp0vin07: endpoint {
>  		isp1: isp@fed20000 {
>  			compatible = "renesas,r8a779a0-isp",
>  				     "renesas,rcar-gen4-isp";
> -			reg = <0 0xfed20000 0 0x10000>;
> -			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 613>;
> +			reg = <0 0xfed20000 0 0x10000>, <0 0xfee00000 0 0x100000>;
> +			reg-names = "cs", "core";
> +			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "cs", "core";
> +			clocks = <&cpg CPG_MOD 613>, <&cpg CPG_MOD 17>;
> +			clock-names = "cs", "core";
>  			power-domains = <&sysc R8A779A0_PD_A3ISP01>;
> -			resets = <&cpg 613>;
> +			resets = <&cpg 613>, <&cpg 17>;
> +			reset-names = "cs", "core";
>  			status = "disabled";
>
> +			renesas,vspx = <&vspx1>;
> +
>  			ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> @@ -2756,13 +2770,20 @@ isp1vin15: endpoint {
>  		isp2: isp@fed30000 {
>  			compatible = "renesas,r8a779a0-isp",
>  				     "renesas,rcar-gen4-isp";
> -			reg = <0 0xfed30000 0 0x10000>;
> -			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 614>;
> +			reg = <0 0xfed30000 0 0x10000>, <0 0xfef00000 0 0x100000>;
> +			reg-names = "cs", "core";
> +			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "cs", "core";
> +			clocks = <&cpg CPG_MOD 614>, <&cpg CPG_MOD 18>;
> +			clock-names = "cs", "core";
>  			power-domains = <&sysc R8A779A0_PD_A3ISP23>;
> -			resets = <&cpg 614>;
> +			resets = <&cpg 614>, <&cpg 18>;
> +			reset-names = "cs", "core";
>  			status = "disabled";
>
> +			renesas,vspx = <&vspx2>;
> +
>  			ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> @@ -2840,13 +2861,20 @@ isp2vin23: endpoint {
>  		isp3: isp@fed40000 {
>  			compatible = "renesas,r8a779a0-isp",
>  				     "renesas,rcar-gen4-isp";
> -			reg = <0 0xfed40000 0 0x10000>;
> -			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&cpg CPG_MOD 615>;
> +			reg = <0 0xfed40000 0 0x10000>, <0 0xfe400000 0 0x100000>;
> +			reg-names = "cs", "core";
> +			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "cs", "core";
> +			clocks = <&cpg CPG_MOD 615>, <&cpg CPG_MOD 19>;
> +			clock-names = "cs", "core";
>  			power-domains = <&sysc R8A779A0_PD_A3ISP23>;
> -			resets = <&cpg 615>;
> +			resets = <&cpg 615>, <&cpg 19>;
> +			reset-names = "cs", "core";
>  			status = "disabled";
>
> +			renesas,vspx = <&vspx3>;
> +
>  			ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> --
> 2.48.1
>

