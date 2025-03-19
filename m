Return-Path: <linux-media+bounces-28490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9694A69031
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 15:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B976016B290
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 14:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5661D5AD9;
	Wed, 19 Mar 2025 14:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r6kqrDly"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A042147E0;
	Wed, 19 Mar 2025 14:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742395048; cv=none; b=mPch7Wf9hTpGogxbWSCIO0MmrlhaLeQ9TWsxxAXMpN1fNYz63jwSRJ/b34M6DHjh+RmlxD2wMzwGQNFHdY1e8ySd2t37txSOURE49WlPF4xe45xZ2biF0MNInnjCTjBGoAdWzdX/Lt0vFuyICTqCOD/wT1S1tyMfS0xKIQNpU4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742395048; c=relaxed/simple;
	bh=ha1jQUymfUJf6HbK+MWkz1bZSWOObq2cVcVVWvwyOZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ly9SzWWoq2Dnl2EowUAaAG3llUmtHymbPvQ0oaaChMAEiEIa2KFN76nP13IVten895yhAqGn0FtHm21H6KCDXLegWhMOWL+qnh0/f9nn40RVty/KtN88wUtrLbhZAz30KPfDOYDBHxoNrV79DzOijcflyodZs8IV/DwYFBSu/TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r6kqrDly; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4B0455A;
	Wed, 19 Mar 2025 15:35:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742394941;
	bh=ha1jQUymfUJf6HbK+MWkz1bZSWOObq2cVcVVWvwyOZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r6kqrDlyp1/MGttJ0hjZanl67nOXu8jIyuP4kRiRUgfHoToRYODffsKNTdBSMTo52
	 Emy5dDtCafvSkuszDbYLHmI+Q7qfs4jcILyExFGoNoo4DMla9QQwsGZmE0cOvg/HtL
	 1kAE4QQh/S7hmKnJgWN3Ae01ixTVb50JhCGSem+g=
Date: Wed, 19 Mar 2025 15:37:20 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: renesas: r8a779g0: Add ISP core function
 block
Message-ID: <yowtihzhludntnqveo4k3ceglna7cew4bufwytp33rb45vopjx@uafjxdiwxetd>
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
 <20250315152708.328036-4-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250315152708.328036-4-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas

On Sat, Mar 15, 2025 at 04:27:04PM +0100, Niklas Söderlund wrote:
> All ISP instances on V4H have both a channel select and core function
> block, describe the core region in addition to the existing cs region.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 30 +++++++++++++++++------
>  1 file changed, 22 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> index 1760720b7128..6dbf05a55935 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -2277,13 +2277,20 @@ du_out_dsi1: endpoint {
>  		isp0: isp@fed00000 {
>  			compatible = "renesas,r8a779g0-isp",
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
>  			power-domains = <&sysc R8A779G0_PD_A3ISP0>;
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
> @@ -2361,13 +2368,20 @@ isp0vin07: endpoint {
>  		isp1: isp@fed20000 {
>  			compatible = "renesas,r8a779g0-isp",
>  				     "renesas,rcar-gen4-isp";
> -			reg = <0 0xfed20000 0 0x10000>;
> -			interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_LOW>;
> -			clocks = <&cpg CPG_MOD 613>;
> +			reg = <0 0xfed20000 0 0x10000>, <0 0xfee00000 0 0x100000>;
> +			reg-names = "cs", "core";
> +			interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "cs", "core";
> +			clocks = <&cpg CPG_MOD 613>, <&cpg CPG_MOD 17>;
> +			clock-names = "cs", "core";
>  			power-domains = <&sysc R8A779G0_PD_A3ISP1>;
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
> --
> 2.48.1
>
>

