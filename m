Return-Path: <linux-media+bounces-28877-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22125A73E3F
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 19:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A0B617A0D5
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 18:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7074C21B195;
	Thu, 27 Mar 2025 18:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WckAHETZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409AE21ADA9;
	Thu, 27 Mar 2025 18:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743101919; cv=none; b=pPpSUKnbL/7YkgiBwJqw6LfynAn2DYbJE5lkPs6jrMkvhioj9fUU8YiQ69ta8LqsVfll2fBLhsGCv5KrPYGKhN+FNo2QjBcFNimzDpxi1olPaejJ1JxDC5wHPbWnOuY9wrzf5QbzQ1hsuylPoJNn3UKlYRKAMlg+byCgUWGnuvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743101919; c=relaxed/simple;
	bh=R/uKdU7aA4BfJOc345ybd2WNSZ2vLTa39onAL07P+ZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNYIPq3nUb7mJjKqqXWy94BVLIAwXNg6RWAVG2KwzQp430q2P0vt5haXeM1X5c3pYBz4oz2UqUR2njbzA2eiq3h7IAdca3ClfqJ5vahAW1RQkfIg4DGGspG5/0VcoV0e3IO0TvhgUMhNhjrFIPeGggkxFsvSl0KH2HKPY+MThec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WckAHETZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 628C2F6;
	Thu, 27 Mar 2025 19:56:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743101807;
	bh=R/uKdU7aA4BfJOc345ybd2WNSZ2vLTa39onAL07P+ZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WckAHETZwTaOAbY4L/obIAwGhwkgdpF6a73wdM6Hqlh/t8yyP+Tk+idQZPHBVpE1x
	 p6oBcYz8mdBa/nMBEEWnn362SP4cj0kZs63Xv9MnEVZJZEJ7HHpDoF52eafEk4k/e/
	 34I3l52duhq21Z+bslz0UIIU/0G8+fg63Qqcpt7Y=
Date: Thu, 27 Mar 2025 20:58:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 10/12] arm64: dts: imx8qm: add 24MHz clock-xtal24m
Message-ID: <20250327185813.GA22659@pendragon.ideasonboard.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-10-324f5105accc@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210-8qxp_camera-v3-10-324f5105accc@nxp.com>

Hi Frank,

Thank you for the patch.

On Mon, Feb 10, 2025 at 03:59:29PM -0500, Frank Li wrote:
> Add fixed clock node clock-xtal24m to prepare to add camera support.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v1 to v3
> - none
> ---
>  arch/arm64/boot/dts/freescale/imx8qm.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> index c6a17a0d739c5..40cd45cd9f88f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
> @@ -590,6 +590,13 @@ mipi_pll_div2_clk: clock-controller-mipi-div2-pll {
>  		clock-output-names = "mipi_pll_div2_clk";
>  	};
>  
> +	xtal24m: clock-xtal24m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +		clock-output-names = "xtal_24MHz";
> +	};

This is a clock oscillator mounted on the PCB, isn't it ? It shouldn't
be in imx8qm.dtsi, but in board-specific DT sources.

> +
>  	vpu_subsys_dsp: bus@55000000 {
>  		compatible = "simple-bus";
>  		#address-cells = <1>;

-- 
Regards,

Laurent Pinchart

