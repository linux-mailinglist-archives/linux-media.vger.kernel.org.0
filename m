Return-Path: <linux-media+bounces-16310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCBC951DC6
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 16:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B420286637
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 14:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5761B3F0E;
	Wed, 14 Aug 2024 14:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IzdG/RmK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FA81B3759;
	Wed, 14 Aug 2024 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723647167; cv=none; b=iWuSSzGT6Fxc+Aesk99F8JnIfJfy43/k4NcCKZ3JUwA00iFwQl5EgCx1gAg8JlW4ViPgaIdW+6CSaXm+wn1JsMrUcl1UGOB10bsRbPER8m6iD2owX6z2A5G/d2L2aI1iEyWgu626uA/iIxvYkwAFyuqsDPXQ/9UWZgTJXcngSRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723647167; c=relaxed/simple;
	bh=K0/wHAcpwETDUIAlPPQ4qlBcoy4QlTDvDP3az0PwbY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sp/FUaFlzrkTyDc3OCTUNOkJJ6RTQRMQgJ4X2GfxNJShvIhm0ISpamZlK+TW5ILi6LQ0vDTES35mEl597Pk/AbVgeACYml0GsVxbJ1tPkLpCYLIjE0W7AOgOFIwyqnOHSIGA7sZYwVugjSDcpfBK0TgT1IBgG+he14mT2eyomuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IzdG/RmK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7B4A2E0;
	Wed, 14 Aug 2024 16:51:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723647106;
	bh=K0/wHAcpwETDUIAlPPQ4qlBcoy4QlTDvDP3az0PwbY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IzdG/RmKzRhFmlUxmin4448IlLEvlz6jbokEhLmBMKAkJ/Q/h1o8aE+3kVuwD4Vvy
	 PQa1ZIlLTRUy7cW2pmw7jdv20h6iSn4EOViAaooyUn/K3U8soUTxqPao/mu9b1UjF8
	 e+FDJ78MaSL/GEpJZ1Y05XweD9Ys1tMWkNm2ZEGI=
Date: Wed, 14 Aug 2024 17:52:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: imx8mp: Add DT nodes for the two ISPs
Message-ID: <20240814145218.GB22567@pendragon.ideasonboard.com>
References: <20240813234004.17807-1-laurent.pinchart@ideasonboard.com>
 <5809346.DvuYhMxLoT@steina-w>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5809346.DvuYhMxLoT@steina-w>

Hi Alexander,

On Wed, Aug 14, 2024 at 12:02:26PM +0200, Alexander Stein wrote:
> Am Mittwoch, 14. August 2024, 01:40:04 CEST schrieb Laurent Pinchart:
> > From: Paul Elder <paul.elder@ideasonboard.com>
> > 
> > The ISP supports both CSI and parallel interfaces, where port 0
> > corresponds to the former and port 1 corresponds to the latter. Since
> > the i.MX8MP's ISPs are connected by the parallel interface to the CSI
> > receiver, set them both to port 1.
> > 
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Tested-by: Adam Ford <aford173@gmail.com> # imx8mp-beacon
> > ---
> > Changes since v2:
> > 
> > - Assign clock parent and frequency in blk-ctrl
> > 
> > Changes since v1:
> > 
> > - Fix clock ordering
> > - Add #address-cells and #size-cells to ports nodes
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 51 ++++++++++++++++++++++-
> >  1 file changed, 49 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > index d9b5c40f6460..09f1e27ee220 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -1673,6 +1673,50 @@ isi_in_1: endpoint {
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
> >  			dewarp: dwe@32e30000 {
> >  				compatible = "nxp,imx8mp-dw100";
> >  				reg = <0x32e30000 0x10000>;
> > @@ -1873,13 +1917,16 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
> >  						  <&clk IMX8MP_CLK_MEDIA_APB>,
> >  						  <&clk IMX8MP_CLK_MEDIA_DISP1_PIX>,
> >  						  <&clk IMX8MP_CLK_MEDIA_DISP2_PIX>,
> > +						  <&clk IMX8MP_CLK_MEDIA_ISP>,
> >  						  <&clk IMX8MP_VIDEO_PLL1>;
> >  				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
> >  							 <&clk IMX8MP_SYS_PLL1_800M>,
> >  							 <&clk IMX8MP_VIDEO_PLL1_OUT>,
> > -							 <&clk IMX8MP_VIDEO_PLL1_OUT>;
> > +							 <&clk IMX8MP_VIDEO_PLL1_OUT>,
> > +							 <&clk IMX8MP_SYS_PLL2_500M>;
> >  				assigned-clock-rates = <500000000>, <200000000>,
> > -						       <0>, <0>, <1039500000>;
> > +						       <0>, <0>, <0>, <500000000>,
> > +						       <1039500000>;
> 
> Isn't this one '<0>' too much? <500000000> is for IMX8MP_CLK_MEDIA_ISP, right?

Indeed. I'll send a v3.

> >  				#power-domain-cells = <1>;
> >  
> >  				lvds_bridge: bridge@5c {
> > 
> > base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba

-- 
Regards,

Laurent Pinchart

