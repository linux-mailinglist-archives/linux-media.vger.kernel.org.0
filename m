Return-Path: <linux-media+bounces-16358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B60953D52
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 00:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 212CE285F10
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 22:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A172154C1D;
	Thu, 15 Aug 2024 22:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sj3xJan1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC2C154456;
	Thu, 15 Aug 2024 22:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723760581; cv=none; b=b5oCreyFEMznQqwL7iO19npRysQtFM4CKxyACEZiN3RJhI56W2U2dfCJ6BYPLRYxywNMF/TVnPbjHUksTHNDyRCYv5IDxhn8DR2El5iiHN4SLVDRgalg9Yuok9qoMlAi6h8m2I9XvTQiX02OY0PzEg9NiU3Xe1a1C2aRunvioBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723760581; c=relaxed/simple;
	bh=PFdmgapN2g4RD/uxMXT/UTOpJWmDAeo1UG+kQusjXy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3qjmydHklsHtYxzizkc4igrWO0kAnM//Qoks2afiGO7nJ0lvkuTu1iiGdX88UhyiaDi4GtifkMMyNv9kizVzeAteqFRujiTr9H9PrGMvzxYkxlEbeytbjRCLeRwqG1lERNQP42eRt30ABMw4OjE2XdpXspGPU3XNCdm/Ttdbpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sj3xJan1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28277471;
	Fri, 16 Aug 2024 00:21:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723760519;
	bh=PFdmgapN2g4RD/uxMXT/UTOpJWmDAeo1UG+kQusjXy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sj3xJan18IFKXKGtebAcqFtGBeVlg1aLm04hUn2YFXbO6FVPvWb19sJAEdsYcOpYp
	 nCkVhOYap6lEUOWIN2h2B3YxO82xlOTCXA/XgvKLrf29WNNHRwsJ1GrZTKbziVvwsd
	 doj/JjoCmZ+y6CiDQrRdtLz4b5EOi363wcxhW9bc=
Date: Fri, 16 Aug 2024 01:22:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Marek Vasut <marex@denx.de>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: Clarify csis clock frequency
Message-ID: <20240815222230.GB23911@pendragon.ideasonboard.com>
References: <20240813234010.17852-1-laurent.pinchart@ideasonboard.com>
 <3314370.44csPzL39Z@steina-w>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3314370.44csPzL39Z@steina-w>

On Thu, Aug 15, 2024 at 02:12:09PM +0200, Alexander Stein wrote:
> Am Mittwoch, 14. August 2024, 01:40:10 CEST schrieb Laurent Pinchart:
> > The DT nodes for the MIPI CSI-2 receivers (MIPI_CSI) configure the
> > CAM1_PIX and CAM2_PIX clocks to 266 MHz through the assigned-clock-rates
> > property, and report that frequency in the clock-frequency property. The
> > i.MX8MP reference manual and datasheet list 266 MHz as a nominal
> > frequency when using both CSI-2 receivers, so all looks normal.
> > 
> > In reality, the clock is actually set to 250 MHz, as the selected
> > parent, IMX8MP_SYS_PLL2_1000M, has a 1/4 output that is selected as the
> > closest frequency to 266 MHz. This doesn't break operation of the
> > device, but is clearly misleading.
> > 
> > Clarify the clock configuration by selecting the IMX8MP_SYS_PLL2_250M
> > parent, dropping the redundant assigned-clock-rates, and setting
> > clock-frequency to 250 MHz. This doesn't cause any functional change.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > index 603dfe80216f..d9b5c40f6460 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -1687,7 +1687,7 @@ mipi_csi_0: csi@32e40000 {
> >  				compatible = "fsl,imx8mp-mipi-csi2", "fsl,imx8mm-mipi-csi2";
> >  				reg = <0x32e40000 0x10000>;
> >  				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> > -				clock-frequency = <266000000>;
> > +				clock-frequency = <250000000>;
> 
> This doesn't seem to be necessary, no? I can't be read from
> IMX8MP_CLK_MEDIA_CAM1_PIX_ROOT. But oh well, that's what we have right now.

I don't like the clock frequency property much, but as it's there, I
decided to update it. Removing the property, if desired, belongs to a
separate patch.

> Despite that:
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Shawn, could you please pick this up for v6.12 ?

> >  				clocks = <&clk IMX8MP_CLK_MEDIA_APB_ROOT>,
> >  					 <&clk IMX8MP_CLK_MEDIA_CAM1_PIX_ROOT>,
> >  					 <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT>,
> > @@ -1695,9 +1695,8 @@ mipi_csi_0: csi@32e40000 {
> >  				clock-names = "pclk", "wrap", "phy", "axi";
> >  				assigned-clocks = <&clk IMX8MP_CLK_MEDIA_CAM1_PIX>,
> >  						  <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF>;
> > -				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
> > +				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
> >  							 <&clk IMX8MP_CLK_24M>;
> > -				assigned-clock-rates = <266000000>;
> >  				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
> >  				status = "disabled";
> >  
> > @@ -1723,7 +1722,7 @@ mipi_csi_1: csi@32e50000 {
> >  				compatible = "fsl,imx8mp-mipi-csi2", "fsl,imx8mm-mipi-csi2";
> >  				reg = <0x32e50000 0x10000>;
> >  				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> > -				clock-frequency = <266000000>;
> > +				clock-frequency = <250000000>;
> >  				clocks = <&clk IMX8MP_CLK_MEDIA_APB_ROOT>,
> >  					 <&clk IMX8MP_CLK_MEDIA_CAM2_PIX_ROOT>,
> >  					 <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT>,
> > @@ -1731,9 +1730,8 @@ mipi_csi_1: csi@32e50000 {
> >  				clock-names = "pclk", "wrap", "phy", "axi";
> >  				assigned-clocks = <&clk IMX8MP_CLK_MEDIA_CAM2_PIX>,
> >  						  <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF>;
> > -				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
> > +				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
> >  							 <&clk IMX8MP_CLK_24M>;
> > -				assigned-clock-rates = <266000000>;
> >  				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_2>;
> >  				status = "disabled";
> >  
> > 
> > base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba

-- 
Regards,

Laurent Pinchart

