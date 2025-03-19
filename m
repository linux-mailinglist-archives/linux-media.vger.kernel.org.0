Return-Path: <linux-media+bounces-28491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6C8A69119
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 15:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 340AE424A4C
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 14:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1041DEFD8;
	Wed, 19 Mar 2025 14:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D1UZ3fyb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4400020551C;
	Wed, 19 Mar 2025 14:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742395216; cv=none; b=JscncTgU2NAlzoXKncJoxA8lpYz0DS7r2EDW/bknQhcC3kg0nVctrm5HnWqnjanuggmFoknIAn3MF8j0nxmYOmLAjTKN8xzGfWWKM/HY7kq9F5YBcns6xLl5Q6sXZeLOl4BGGB4y90Yn6v/Xmwm4Me0QvDmZATAuZv7tdK32/w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742395216; c=relaxed/simple;
	bh=R+ZZbFzbps3/FLcZJK8zCM2mxDs4A9BUtNyXnmqHTEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+87fEzq/mTi7WVWTILiDTIT71bVHTsGvSXKjaagW2dEV9BaEn/2Gw6AqHar2UiXur1I0WKuteqZDpYpmpgnEAmNIkCMq3OL0alg+PIzMz0Ii5kw/m1cimWpvcHRLG3w4rB8c4bMX2mvkVzNA3OaS206GSGDXuEohdMv0atreIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D1UZ3fyb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85D8655A;
	Wed, 19 Mar 2025 15:38:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742395110;
	bh=R+ZZbFzbps3/FLcZJK8zCM2mxDs4A9BUtNyXnmqHTEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D1UZ3fyboHkbZe/lFgKSw/qluTRhmYgcOevb4w4jQlK+LfFkEQKZ3B/4upN7JgDkW
	 vLaEL15khO8BPQZwWqN4JkJwA/0XXLJxOzAKFZ6aqEDkWLiZro75g+/mqjjzt6f+xE
	 u1Kr6vp/FfL6NZ3fTsRNAIn6IdtybcZfj8mjGJIw=
Date: Wed, 19 Mar 2025 15:40:10 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/7] arm64: dts: renesas: r8a779h0: Add ISP core function
 block
Message-ID: <r36wqdvfxeuyni2tab7hf5b7cdt2bngahpn45jmfk2fex6iwrp@z5wwi3pehpk5>
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
 <20250315152708.328036-5-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250315152708.328036-5-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas

On Sat, Mar 15, 2025 at 04:27:05PM +0100, Niklas Söderlund wrote:
> The first ISP instances on V4M have both a channel select and core

instance -> has

> function block, describe the core region in addition to the existing cs
> region. While at it update the second ISP to match the new bindings and
> add the reg-names and interrupt-names property.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> index 8524a1e7205e..ed1eefa3515d 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> @@ -1968,13 +1968,20 @@ du_out_dsi0: endpoint {
>  		isp0: isp@fed00000 {
>  			compatible = "renesas,r8a779h0-isp",
>  				     "renesas,rcar-gen4-isp";
> -			reg = <0 0xfed00000 0 0x10000>;
> -			interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_LOW>;
> -			clocks = <&cpg CPG_MOD 612>;
> +			reg = <0 0xfed00000 0 0x10000>, <0 0xfec00000 0 0x100000>;
> +			reg-names = "cs", "core";
> +			interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "cs", "core";
> +			clocks = <&cpg CPG_MOD 612>, <&cpg CPG_MOD 16>;
> +			clock-names = "cs", "core";
>  			power-domains = <&sysc R8A779H0_PD_A3ISP0>;
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
> @@ -2053,10 +2060,14 @@ isp1: isp@fed20000 {
>  			compatible = "renesas,r8a779h0-isp",
>  				     "renesas,rcar-gen4-isp";
>  			reg = <0 0xfed20000 0 0x10000>;
> -			interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_LOW>;
> +			reg-names = "cs";
> +			interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "cs";
>  			clocks = <&cpg CPG_MOD 613>;
> +			clock-names = "cs";
>  			power-domains = <&sysc R8A779H0_PD_A3ISP0>;
>  			resets = <&cpg 613>;
> +			reset-names = "cs";
>  			status = "disabled";
>
>  			ports {
> --
> 2.48.1
>
>

