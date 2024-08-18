Return-Path: <linux-media+bounces-16425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE390955EA1
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2024 21:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D173D1C209B6
	for <lists+linux-media@lfdr.de>; Sun, 18 Aug 2024 19:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F1E414EC44;
	Sun, 18 Aug 2024 19:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ipn9rVhx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829602581;
	Sun, 18 Aug 2024 19:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724008060; cv=none; b=Xg6bo6VpYDPdnWXcag6P4K4JG+PZIzVLA82VC1QoWgPhUcABVStrBuVLa/d/uE/RB2GzZC/5NozKLlnMjEC4vOp+YEaBpPof+W64ngDLLSw5HeHU22ADwY31USV0dka2G9u73pXwbHq3Uj+U7hab1AqZKzehon5YrUIBY3Yd9Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724008060; c=relaxed/simple;
	bh=jaMEt/0IkNYQq3UZExZCuV0E4RJu+8yP2Q/hsIZXZtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meyTMBTIGVr9T6tuOsfaYpez7N+CKQsKHgMO2MHzaX4SGhqkQkIEc4SwVVlJXLpTZMsYRwzYrxJ3Pb3iy257CTc8SxuJjgcmoM1wgz5iHAAdIVtWwK8UVncnbQAsMcVpxYcm98WjzYYl0q8nqfhgAq1UPYS8RofzjvGXgFxxo80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ipn9rVhx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F15E9541;
	Sun, 18 Aug 2024 21:06:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724007990;
	bh=jaMEt/0IkNYQq3UZExZCuV0E4RJu+8yP2Q/hsIZXZtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ipn9rVhxEBcqMyPuxQh1kzHP2asCruv770CjxL/pk8oFt1lySEhVw2QxC61miUrPN
	 MCHjqBSJ2sSevvpI+70WcGnxgkgEUuSJ6FI0jjAXs/YMjwjCAkPFUCu7f5fhJAdNr3
	 Lf3VWaP5z4gS79hKyxm90lqcXi+wcSh0ovqHnwyc=
Date: Sun, 18 Aug 2024 22:07:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Adam Ford <aford173@gmail.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: imx8mp: Add DT nodes for the two ISPs
Message-ID: <20240818190703.GA1148@pendragon.ideasonboard.com>
References: <20240813234004.17807-1-laurent.pinchart@ideasonboard.com>
 <CAHCN7xJULS-mR_2KoikzMt7piGWvaLHAfMbMkJtgESW-6pfv8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xJULS-mR_2KoikzMt7piGWvaLHAfMbMkJtgESW-6pfv8g@mail.gmail.com>

On Sun, Aug 18, 2024 at 01:24:01PM -0500, Adam Ford wrote:
> On Tue, Aug 13, 2024 at 6:40 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
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
> >                                 };
> >                         };
> >
> > +                       isp_0: isp@32e10000 {
> > +                               compatible = "fsl,imx8mp-isp";
> > +                               reg = <0x32e10000 0x10000>;
> > +                               interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > +                               clocks = <&clk IMX8MP_CLK_MEDIA_ISP_ROOT>,
> > +                                        <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
> > +                                        <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
> > +                               clock-names = "isp", "aclk", "hclk";
> > +                               power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
> > +                               fsl,blk-ctrl = <&media_blk_ctrl 0>;
> > +                               status = "disabled";
> > +
> > +                               ports {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +
> > +                                       port@1 {
> > +                                               reg = <1>;
> > +                                       };
> > +                               };
> > +                       };
> > +
> > +                       isp_1: isp@32e20000 {
> > +                               compatible = "fsl,imx8mp-isp";
> > +                               reg = <0x32e20000 0x10000>;
> > +                               interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> > +                               clocks = <&clk IMX8MP_CLK_MEDIA_ISP_ROOT>,
> > +                                        <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
> > +                                        <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
> > +                               clock-names = "isp", "aclk", "hclk";
> > +                               power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
> > +                               fsl,blk-ctrl = <&media_blk_ctrl 1>;
> > +                               status = "disabled";
> > +
> > +                               ports {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +
> > +                                       port@1 {
> > +                                               reg = <1>;
> > +                                       };
> > +                               };
> > +                       };
> > +
> >                         dewarp: dwe@32e30000 {
> >                                 compatible = "nxp,imx8mp-dw100";
> >                                 reg = <0x32e30000 0x10000>;
> > @@ -1873,13 +1917,16 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
> >                                                   <&clk IMX8MP_CLK_MEDIA_APB>,
> >                                                   <&clk IMX8MP_CLK_MEDIA_DISP1_PIX>,
> >                                                   <&clk IMX8MP_CLK_MEDIA_DISP2_PIX>,
> > +                                                 <&clk IMX8MP_CLK_MEDIA_ISP>,
> >                                                   <&clk IMX8MP_VIDEO_PLL1>;
> >                                 assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
> >                                                          <&clk IMX8MP_SYS_PLL1_800M>,
> >                                                          <&clk IMX8MP_VIDEO_PLL1_OUT>,
> > -                                                        <&clk IMX8MP_VIDEO_PLL1_OUT>;
> > +                                                        <&clk IMX8MP_VIDEO_PLL1_OUT>,
> > +                                                        <&clk IMX8MP_SYS_PLL2_500M>;
> >                                 assigned-clock-rates = <500000000>, <200000000>,
> > -                                                      <0>, <0>, <1039500000>;
> > +                                                      <0>, <0>, <0>, <500000000>,
> 
> Is the insertion of the extra <0> here correct?  You inserted one
> clock above for IMX8MP_CLK_MEDIA_ISP, but it appears you inserted two
> here.
> I think this might break the IMX8MP_VIDEO_PLL1 rate and not set the
> IMX8MP_CLK_MEDIA_ISP as expected.
> 
> Am I missing something?

You're missing v4 :-)

> > +                                                      <1039500000>;
> >                                 #power-domain-cells = <1>;
> >
> >                                 lvds_bridge: bridge@5c {
> >
> > base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba

-- 
Regards,

Laurent Pinchart

