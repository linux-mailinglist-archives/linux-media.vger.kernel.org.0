Return-Path: <linux-media+bounces-16948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02436961952
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 23:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B8B61C22292
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 21:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29C31D4163;
	Tue, 27 Aug 2024 21:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="csYA4AeQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548111D1F59;
	Tue, 27 Aug 2024 21:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724794630; cv=none; b=BOAtVCeBMAgxcQ7Sx+hl3GP0N/8pvhopZnO+fHXIujWJsA1FKodfV+orGVwFGL/fJK/Vb/Qw+IwyG5OcFwnkOQmVxijo1icetcciX2uebRGjZCV0FJGPjOKPlAqY5pYpMM9ubURWK7zcnUCZZtnKwsUtRc03ZRy3XSY9JpiGj6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724794630; c=relaxed/simple;
	bh=kuO4FK6LsZcvC6gcKesEVyZ4VK1c2ZkzhEfP3tnNQSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sI1xU6qLCKnreStq3bQI6+zt+ZPrKp+eSLjib2jxQspQ+77DK1tqzUucmqD0s8NKESJvLSik+iBTBxPgMJyr38CvU+2VclXyF6vtbCwbP+9EJRq3qujolZOp6qo6qqWuO79V4nVmFIGRgIO8nYEzHHpLSM34uHSTBqHovwpKRqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=csYA4AeQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 887BC4C9;
	Tue, 27 Aug 2024 23:35:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724794557;
	bh=kuO4FK6LsZcvC6gcKesEVyZ4VK1c2ZkzhEfP3tnNQSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=csYA4AeQbmoLQVDT3QCWB6EaKhw4K9TEAFlOY2dA6iRyMb01BTiR5Cf7+uhIyVmdz
	 EOD1SfiYUrF7x7Ykx9Wy8FJKMaY9uyijD5z9ynJR0csdJt3TqTNIq0opdKgF6IM601
	 tJYSQqPnAK3N/eeFe03FSSGWf4uxigMFrLkmuUNk=
Date: Wed, 28 Aug 2024 00:37:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/6] arm64: dts: renesas: r8a779g0: Add family
 fallback for CSISP IP
Message-ID: <20240827213700.GB30398@pendragon.ideasonboard.com>
References: <20240826144352.3026980-1-niklas.soderlund+renesas@ragnatech.se>
 <20240826144352.3026980-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240826144352.3026980-3-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Mon, Aug 26, 2024 at 04:43:48PM +0200, Niklas Söderlund wrote:
> To make it easier to support new Gen4 SoCs add a family fallback
> compatible similar to what was done for VIN on Gen4.
> 
> There is no functional change, but the addition of the family fallback
> in the bindings produces warnings for V4H for DTS checks if they are not
> added.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Assuming 1/6 gets accepted,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> * Changes since v1
> - New in v2.
> ---
>  arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> index ac3d4062c2fa..ded805f0e633 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -2075,7 +2075,8 @@ du_out_dsi1: endpoint {
>  		};
>  
>  		isp0: isp@fed00000 {
> -			compatible = "renesas,r8a779g0-isp";
> +			compatible = "renesas,r8a779g0-isp",
> +				     "renesas,rcar-gen4-isp";
>  			reg = <0 0xfed00000 0 0x10000>;
>  			interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_LOW>;
>  			clocks = <&cpg CPG_MOD 612>;
> @@ -2158,7 +2159,8 @@ isp0vin07: endpoint {
>  		};
>  
>  		isp1: isp@fed20000 {
> -			compatible = "renesas,r8a779g0-isp";
> +			compatible = "renesas,r8a779g0-isp",
> +				     "renesas,rcar-gen4-isp";
>  			reg = <0 0xfed20000 0 0x10000>;
>  			interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_LOW>;
>  			clocks = <&cpg CPG_MOD 613>;

-- 
Regards,

Laurent Pinchart

