Return-Path: <linux-media+bounces-46168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E955C2994C
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 00:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A54413A8A88
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 23:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A45F1B423B;
	Sun,  2 Nov 2025 23:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K2eDJo9p"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC462F5E;
	Sun,  2 Nov 2025 23:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762124536; cv=none; b=FXa1pjhYnAYnARgwb/8NM6ESZauC0wX1ITfeOkSfnOYQie1VJ5n79kTwIi3MbbNpSSphyV3hKXFNAnv2MOD/FN0KC3LV6RI4OwBUTGTBl7JuWl9gwDuj567TZokAd6ikXG8xsPVQbAw35Gg1eBdx1bd7sP2xA8UR8znJUTtE9+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762124536; c=relaxed/simple;
	bh=nZm+KO4+ZVuNc4gxK7tkO1KbJMk9/Tr67Ic5LCJjzF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/nh6rihDhjUXol62uefOAOXl5ncETWCEqjw1P2TOZc1WEBapKoboCKA7kF3N+0tUewUItfJQ8HyiG8cPhWYgpPh61/5wOEkTJlIP1w52RDgo9dasa/xbOyRrfWcyRNuYmrrtfOabqMp5N92izJYYCLVRZbL8B84+rHX0oNie4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K2eDJo9p; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-160-149.bb.dnainternet.fi [82.203.160.149])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D35E71E2E;
	Mon,  3 Nov 2025 00:00:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762124419;
	bh=nZm+KO4+ZVuNc4gxK7tkO1KbJMk9/Tr67Ic5LCJjzF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K2eDJo9pQwFOmxXLCxfKT48xZOvC6SoDhjDn6pR+J5Ofi8Zlpv7dkpPpm1DxhyQy3
	 QVuvKTvyw2cfUBB9HVhNnDLP72N2bI0JEjHiXSOoFdvvffhOBUF5O1m7dVdmE67+jV
	 vltwYGu2sFTnnysEuPqwwyBJIublm9T9GboUkhk4=
Date: Mon, 3 Nov 2025 01:01:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 13/13] arm64: dts: imx8mp: Specify the number of
 channels for CSI-2 receivers
Message-ID: <20251102230157.GA31427@pendragon.ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
 <20250822002734.23516-14-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250822002734.23516-14-laurent.pinchart@ideasonboard.com>

Hi Shawn,

The DT bindings have been merged in v6.18, could you please pick this
patch for v6.19 ?

On Fri, Aug 22, 2025 at 03:27:33AM +0300, Laurent Pinchart wrote:
> The CSI-2 receivers in the i.MX8MP have 3 output channels. Specify this
> in the device tree, to enable support for more than one channel.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index bb24dba7338e..1e52840078df 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1764,6 +1764,7 @@ mipi_csi_0: csi@32e40000 {
>  				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
>  							 <&clk IMX8MP_CLK_24M>;
>  				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
> +				fsl,num-channels = <3>;
>  				status = "disabled";
>  
>  				ports {
> @@ -1799,6 +1800,7 @@ mipi_csi_1: csi@32e50000 {
>  				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
>  							 <&clk IMX8MP_CLK_24M>;
>  				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_2>;
> +				fsl,num-channels = <3>;
>  				status = "disabled";
>  
>  				ports {

-- 
Regards,

Laurent Pinchart

