Return-Path: <linux-media+bounces-16409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4DF95594A
	for <lists+linux-media@lfdr.de>; Sat, 17 Aug 2024 20:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60EDA282895
	for <lists+linux-media@lfdr.de>; Sat, 17 Aug 2024 18:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D0115535A;
	Sat, 17 Aug 2024 18:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rjJM0k8o"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6915B78281;
	Sat, 17 Aug 2024 18:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723919183; cv=none; b=IajwK/fYN3PaIYBrenKAtrDAS3vxpkYqUJ8ZBz+tjozBy4AooNWewHyLfTWRK0DixEk4MuPE8FK66bmexuqsuUwmhbqJlnHAmAF7CN4yumg2KkicwPOB3ZH9sJM+IWZ8uAz2bguBiNnklfOCczr+g4ASF2FBOZ67VqiQAW0jFBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723919183; c=relaxed/simple;
	bh=2lM1Fdl0Fhnxz66GrhRJ5x6xf8UpXYyNmF9e4vege68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwA3SLq5oBi931GSNilmZo3f1oayquPJwVqSLOdrVJNZH6fii4jX9oNoJ55y37wJNpvelitUqFIDeUkOftMIEJ3cEVtSoyNKYGA/j3N+jkOodaEtoFf4jKeWJysfQ2Km1z8/YNfG4PAi5XCHqhcJGtnwt2lUAIUM+384itARstM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rjJM0k8o; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01B013D5;
	Sat, 17 Aug 2024 20:25:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723919113;
	bh=2lM1Fdl0Fhnxz66GrhRJ5x6xf8UpXYyNmF9e4vege68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rjJM0k8oxAgxNIWL0lKr1kxsAiWp79TCYCvhH2RUtZoOhiwm7MWH6b9HQxaBR0f7l
	 zodELw7gVIACnWwbAKM09AD90lIm+TDufyQXOjwYsoO17Q7EfwNCwIjnQaz0bHXmlX
	 XHY0WnKP+aCI6ucegWq2KIKVuTri7rMh3eOsBe1c=
Date: Sat, 17 Aug 2024 21:25:46 +0300
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
Subject: Re: [PATCH v4] arm64: dts: imx8mp: Add DT nodes for the two ISPs
Message-ID: <20240817182546.GC29320@pendragon.ideasonboard.com>
References: <20240814161451.32119-1-laurent.pinchart@ideasonboard.com>
 <13578505.uLZWGnKmhe@steina-w>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <13578505.uLZWGnKmhe@steina-w>

Hi Alexander,

On Thu, Aug 15, 2024 at 02:05:39PM +0200, Alexander Stein wrote:
> Am Mittwoch, 14. August 2024, 18:14:51 CEST schrieb Laurent Pinchart:
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
> > Changes since v3:
> > 
> > - Add comment regarding the IMX8MP_CLK_MEDIA_ISP clock rate
> > - Fix assigned-clock-rates
> > - Dropping Tested-by as the clock configuration has changed
> > 
> > Changes since v2:
> > 
> > - Assign clock parent and frequency in blk-ctrl
> > 
> > Changes since v1:
> > 
> > - Fix clock ordering
> > - Add #address-cells and #size-cells to ports nodes
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 57 ++++++++++++++++++++++-
> >  1 file changed, 55 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > index d9b5c40f6460..f3531cfb0d79 100644
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
> > @@ -1869,17 +1913,26 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
> >  				clock-names = "apb", "axi", "cam1", "cam2",
> >  					      "disp1", "disp2", "isp", "phy";
> >  
> > +				/*
> > +				 * The ISP maximum frequency is 400MHz in normal mode
> > +				 * and 500MHz in overdrive mode. The 400MHz operating
> > +				 * point hasn't been successfully tested yet, so set
> > +				 * IMX8MP_CLK_MEDIA_ISP to 500MHz for the time being.
> > +				 */
> >  				assigned-clocks = <&clk IMX8MP_CLK_MEDIA_AXI>,
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
> > +						       <0>, <0>, <500000000>,
> > +						       <1039500000>;
> 
> Unfortunately for some reason this reparenting doesn't work (on my platform).
> 'media_isp' is still below IMX8MP_CLK_24M.
> $ grep -B1 media_isp /sys/kernel/debug/clk/clk_summary
>     mipi_dsi_esc_rx                  0       0        0        24000000    0          0     50000      N      deviceless                      no_connection_id         
>     media_isp                        0       0        0        24000000    0          0     50000      N      deviceless                      no_connection_id         
>        media_isp_root_clk            0       0        0        24000000    0          0     50000      N         32e10000.isp                    isp

Hmmm... I get

                sys_pll2_500m        3       3        0        500000000   0          0     50000      Y                  deviceless                      no_connection_id
                   media_isp         0       0        0        500000000   0          0     50000      N                     deviceless                      no_connection_id
                      media_isp_root_clk 0       0        0        500000000   0          0     50000      N                        32e10000.isp                    isp

> I have to add this diff for isp_0 (and isp_1 if you use it):
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1683,6 +1683,9 @@ isp_0: isp@32e10000 {
>                                 clock-names = "isp", "aclk", "hclk";
>                                 power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
>                                 fsl,blk-ctrl = <&media_blk_ctrl 0>;
> +                               assigned-clocks = <&clk IMX8MP_CLK_MEDIA_ISP>;
> +                               assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
> +                               assigned-clock-rates = <500000000>;
>                                 status = "disabled";
>  
>                                 ports {
> 
> Now clock is setup properly:
> $ grep -B1 media_isp /sys/kernel/debug/clk/clk_summary
>                 sys_pll2_500m        3       3        0        500000000   0          0     50000      Y                  deviceless                      no_connection_id         
>                    media_isp         0       0        0        500000000   0          0     50000      N                     deviceless                      no_connection_id         
>                       media_isp_root_clk 0       0        0        500000000   0          0     50000      N                        32e10000.isp                    isp

I'm not sure why that's the case, I don't have assigned-clock*
properties in the ISP nodes in my device tree and things still work
properly. Would you be able to investigate ?

> >  				#power-domain-cells = <1>;
> >  
> >  				lvds_bridge: bridge@5c {
> > 
> > base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> > prerequisite-patch-id: ad2bbccf3b0f27415fb14851cec52c431ccb354f

-- 
Regards,

Laurent Pinchart

