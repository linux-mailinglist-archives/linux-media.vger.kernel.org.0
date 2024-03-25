Return-Path: <linux-media+bounces-7796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7318188B303
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 22:44:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED0F1B47F7A
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 20:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C736BFCC;
	Mon, 25 Mar 2024 20:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aSRJ5t/h"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C09A5B697;
	Mon, 25 Mar 2024 20:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711399774; cv=none; b=e/odQ/CCFjJhFxmo4eZViFTDOcNjAcXXzohkyYERS5F8/sBoEwpYHmZvmtKeAaECF0V4VRkbIDApfoR7QaZ0WT4mNoZEGxg25tqMDpaoEn6Vho15vN4pJX9YPjd+zPZNcVKPNS9nvcv+m1qHVCi/ED/pW0DPNKtVoRcyFNGEQr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711399774; c=relaxed/simple;
	bh=v2sCagyw5B4R+DhIJI4upQC0K1saLorduD0I/khMud4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vAFfFsN7g1oxo1edi3pflQeXnTl+JevbKZx0fg7iSDegzcQvOzDnXPM1Vxx6vGjyL2V5v8tVdXnttPCfVJjLHD1Cl9VKbI7bmGlnu6BJ4KRks4Fr9NBp4Thr+T2iWoxUT+BaJInuiPUUDAOpqu4VRC9gYfTVjvE3dHF5b9Um8fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aSRJ5t/h; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3E767E4;
	Mon, 25 Mar 2024 21:48:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711399740;
	bh=v2sCagyw5B4R+DhIJI4upQC0K1saLorduD0I/khMud4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aSRJ5t/hKEaL5Y5fRmdbT70h4MxoUrkGFIdTymqWiHi0DyeHGKLeINLO10hR+yUeH
	 RoptWoC3sxp8Tf2h6kb9Q5eOtDaIei218uS5Gw+UinPqZtJMBC8mFTtQ87IQu2IV1C
	 H/QKuF9QLk8TKx9krPIASnHmMsxRtPmvIgVMmae4=
Date: Mon, 25 Mar 2024 22:49:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Marek Vasut <marex@denx.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Add DT nodes for the two ISPs
Message-ID: <20240325204924.GY18799@pendragon.ideasonboard.com>
References: <20240325151339.19041-1-laurent.pinchart@ideasonboard.com>
 <4879631.GXAFRqVoOG@steina-w>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4879631.GXAFRqVoOG@steina-w>

Hi Alexander,

On Mon, Mar 25, 2024 at 04:52:21PM +0100, Alexander Stein wrote:
> Am Montag, 25. März 2024, 16:13:39 CET schrieb Laurent Pinchart:
> > From: Paul Elder <paul.elder@ideasonboard.com>
> > 
> > The ISP supports both CSI and parallel interfaces, where port 0
> > corresponds to the former and port 1 corresponds to the latter. Since
> > the i.MX8MP's ISPs are connected by the parallel interface to the CSI
> > receiver, set them both to port 1.
> > 
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Fix clock ordering
> > - Add #address-cells and #size-cells to ports nodes
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 50 +++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > index bfc5c81a5bd4..1d2670b91b53 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -1616,6 +1616,56 @@ isi_in_1: endpoint {
> >  				};
> >  			};
> >  
> > +			isp_0: isp@32e10000 {
> > +				compatible = "fsl,imx8mp-isp";
> > +				reg = <0x32e10000 0x10000>;
> > +				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clk IMX8MP_CLK_MEDIA_ISP_ROOT>,
> > +					 <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
> > +					 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
> > +				clock-names = "isp", "aclk", "hclk";
> > +				assigned-clocks = <&clk IMX8MP_CLK_MEDIA_ISP>;
> > +				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
> > +				assigned-clock-rates = <500000000>;
> > +				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
> > +				fsl,blk-ctrl = <&media_blk_ctrl 0>;
> > +				status = "disabled";
> > +
> > +				ports {
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> > +
> > +					port@1 {
> > +						reg = <1>;
> > +					};
> > +				};
> > +			};
> > +
> > +			isp_1: isp@32e20000 {
> > +				compatible = "fsl,imx8mp-isp";
> > +				reg = <0x32e20000 0x10000>;
> > +				interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&clk IMX8MP_CLK_MEDIA_ISP_ROOT>,
> > +					 <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
> > +					 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
> > +				clock-names = "isp", "aclk", "hclk";
> > +				assigned-clocks = <&clk IMX8MP_CLK_MEDIA_ISP>;
> > +				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
> > +				assigned-clock-rates = <500000000>;
> > +				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
> > +				fsl,blk-ctrl = <&media_blk_ctrl 1>;
> > +				status = "disabled";
> > +
> > +				ports {
> > +					#address-cells = <1>;
> > +					#size-cells = <0>;
> > +
> > +					port@1 {
> > +						reg = <1>;
> > +					};
> > +				};
> > +			};
> > +
> 
> The patch itself is okay. But you might not be able to
> configure the parent of IMX8MP_CLK_MEDIA_ISP if dewarp is enabled before.
> This is due to IMX8MP_CLK_MEDIA_ISP_ROOT being enabled in 'pgc_ispdwp'
> power domain. Reparenting is not possible anymore in this case.

Good point. 

> Something like
> ---8<---
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1837,11 +1837,13 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
>                                                   <&clk IMX8MP_CLK_MEDIA_APB>,
>                                                   <&clk IMX8MP_CLK_MEDIA_DISP1_PIX>,
>                                                   <&clk IMX8MP_CLK_MEDIA_DISP2_PIX>,
> +                                                 <&clk IMX8MP_CLK_MEDIA_ISP>,
>                                                   <&clk IMX8MP_VIDEO_PLL1>;
>                                 assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
>                                                          <&clk IMX8MP_SYS_PLL1_800M>,
>                                                          <&clk IMX8MP_VIDEO_PLL1_OUT>,
> -                                                        <&clk IMX8MP_VIDEO_PLL1_OUT>;
> +                                                        <&clk IMX8MP_VIDEO_PLL1_OUT>,
> +                                                        <&clk IMX8MP_SYS_PLL2_500M>;
>                                 assigned-clock-rates = <500000000>, <200000000>,
>                                                        <0>, <0>, <1039500000>;

With an assigned clock rate here too then ?

>                                 #power-domain-cells = <1>;
> ---8<---
> is needed.

Sascha, are you OK with this approach ?

> >  			dewarp: dwe@32e30000 {
> >  				compatible = "nxp,imx8mp-dw100";
> >  				reg = <0x32e30000 0x10000>;
> > 
> > base-commit: 4cece764965020c22cff7665b18a012006359095

-- 
Regards,

Laurent Pinchart

