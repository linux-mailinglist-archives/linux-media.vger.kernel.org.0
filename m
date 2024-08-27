Return-Path: <linux-media+bounces-16950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9B096199D
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 23:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D19251C20CF9
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 21:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D391D4169;
	Tue, 27 Aug 2024 21:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qfx3/qvb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566541C8FC4;
	Tue, 27 Aug 2024 21:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724795942; cv=none; b=NfACDJ6jAW94+pPLgz0jMip2dVbyHiOTBHNmLuK0OCFUa6Hx+UHseATk5AiB08s2W8FFSl8q5OSZve4uwNM9L0ieCyeOhS3iuRj8sWOcJIyu5RKEUASCt3ggloZObIrDpvGX/lW3TQf0KEYLeT1AsxnkWK1sPTmyjRIJ4dVTBOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724795942; c=relaxed/simple;
	bh=lpbWRRFoAPCGGhmtuUzL0XqGAIx3NmzVjdG0de4s4L0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CR6QInVK6EDfIaBoXmaWaODMgwMQ3YAX8NIVTD3dCbYn3SrNaEdmB+JfL+oGwisZ0d1MRBqHf25dR6DqcHZHjf3BrjLqUvMdBr7MpgWw9tp+epoUJmNnhszBmTbXC05MaP9osWXeQ6KC7FIZTq7flrXkLn0XGqqkFZPFiwQ9aok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qfx3/qvb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F0AB4C9;
	Tue, 27 Aug 2024 23:57:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724795871;
	bh=lpbWRRFoAPCGGhmtuUzL0XqGAIx3NmzVjdG0de4s4L0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qfx3/qvbQztcRJutQ7OerO/vT7+KFkx39LNLrdRl90M71prkGszKe55yKqKG2PFI6
	 6irUte8vAbGqKnl6T5Et1JmXl/YPuxVu4ZdCy0TZpr7HTkbMiuticLVkXxQA360HTS
	 xOwWtTJFc2gdfwuYYLXIP0nY09YY2rikoiKnUxlE=
Date: Wed, 28 Aug 2024 00:58:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/6] arm64: dts: renesas: r8a779a0: Add family
 fallback for CSISP IP
Message-ID: <20240827215854.GC30398@pendragon.ideasonboard.com>
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se>
 <20240826144352.3026980-4-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240826144352.3026980-4-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Mon, Aug 26, 2024 at 04:43:49PM +0200, Niklas Söderlund wrote:
> To make it easier to support new Gen4 SoCs add a family fallback
> compatible similar to what was done for VIN on Gen4.
> 
> There is no functional change, but the addition of the family fallback
> in the bindings produces warnings for V3U for DTS checks if they are not
> added.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Assuming 1/6 gets accepted,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> * Changes since v1
> - New in v2.
> ---
>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> index bf23cc1dc7be..1f4ab27acc33 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -2501,7 +2501,8 @@ du_out_dsi1: endpoint {
>  		};
>  
>  		isp0: isp@fed00000 {
> -			compatible = "renesas,r8a779a0-isp";
> +			compatible = "renesas,r8a779a0-isp",
> +				     "renesas,rcar-gen4-isp";
>  			reg = <0 0xfed00000 0 0x10000>;
>  			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 612>;
> @@ -2584,7 +2585,8 @@ isp0vin07: endpoint {
>  		};
>  
>  		isp1: isp@fed20000 {
> -			compatible = "renesas,r8a779a0-isp";
> +			compatible = "renesas,r8a779a0-isp",
> +				     "renesas,rcar-gen4-isp";
>  			reg = <0 0xfed20000 0 0x10000>;
>  			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 613>;
> @@ -2667,7 +2669,8 @@ isp1vin15: endpoint {
>  		};
>  
>  		isp2: isp@fed30000 {
> -			compatible = "renesas,r8a779a0-isp";
> +			compatible = "renesas,r8a779a0-isp",
> +				     "renesas,rcar-gen4-isp";
>  			reg = <0 0xfed30000 0 0x10000>;
>  			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 614>;
> @@ -2750,7 +2753,8 @@ isp2vin23: endpoint {
>  		};
>  
>  		isp3: isp@fed40000 {
> -			compatible = "renesas,r8a779a0-isp";
> +			compatible = "renesas,r8a779a0-isp",
> +				     "renesas,rcar-gen4-isp";
>  			reg = <0 0xfed40000 0 0x10000>;
>  			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 615>;

-- 
Regards,

Laurent Pinchart

