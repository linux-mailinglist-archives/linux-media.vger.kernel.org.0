Return-Path: <linux-media+bounces-16474-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A137A9569FD
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 13:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6DCC1C231A6
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 11:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77846166F39;
	Mon, 19 Aug 2024 11:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VVt7sf+/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10E215B972;
	Mon, 19 Aug 2024 11:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724068507; cv=none; b=s1dF7+U5/CFJL2+RWvn4iKbD5qHhNIR6dePCC3LjG5RT74D0sk7D3sdfXO+JPg8JZYvlJY5p81J8OlpsegyPP8vormP4oB70d5GN3VY0vGaCgsHoKbm0ljneEwdgRmw+kc0QdKUB8QMwJDlVMYGe4dGzpXAq5UIX8uQawUma1BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724068507; c=relaxed/simple;
	bh=ADWXrDlK2TOC5ed5aHz13xfeLULR1CvNY44felqqWPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MbjmOiHYYi7qhPL6X0OBj6MIhjMMDHfeus+E2miB81Mpx3w+8qmeNi0emcVeY3eBkNNLYF7orEeL+kgMGknB/sCgPeU267z+Md8hkAdI2z9bpSln4vXy09eZI+LPualNc9ji6t/ArNEXJGK99SFflYRXe45QYCEtexdRpCbKTRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VVt7sf+/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 926615A5;
	Mon, 19 Aug 2024 13:54:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724068441;
	bh=ADWXrDlK2TOC5ed5aHz13xfeLULR1CvNY44felqqWPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VVt7sf+/OjCJ4gDuztQSjs7CK3kSDFyG7ygZDiFtlt8bE2xkzbYauPGAv5fleXH8j
	 jwmsHviZSqkMzZLMfjdyZp9vWSweRtLhRNcoiiZcJU5YsDvRKhiAxmj7rIvQV4TuUG
	 N4vt3+bXvMyZAQ2XUeSLs8ujDga2MrTHwB8IYIkQ=
Date: Mon, 19 Aug 2024 14:54:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Adam Ford <aford173@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: imx8mp: Add DT nodes for the two ISPs
Message-ID: <20240819115435.GA13022@pendragon.ideasonboard.com>
References: <20240814161451.32119-1-laurent.pinchart@ideasonboard.com>
 <13578505.uLZWGnKmhe@steina-w>
 <20240817182546.GC29320@pendragon.ideasonboard.com>
 <CAHCN7x+LCeNpaDi65aiEAWTgukWY7YufCnBmym5OU6FAujAxbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7x+LCeNpaDi65aiEAWTgukWY7YufCnBmym5OU6FAujAxbg@mail.gmail.com>

Hi Adam,

On Sun, Aug 18, 2024 at 01:33:26PM -0500, Adam Ford wrote:
> On Sat, Aug 17, 2024 at 1:26 PM Laurent Pinchart wrote:
> > On Thu, Aug 15, 2024 at 02:05:39PM +0200, Alexander Stein wrote:
> > > Am Mittwoch, 14. August 2024, 18:14:51 CEST schrieb Laurent Pinchart:
> > > > From: Paul Elder <paul.elder@ideasonboard.com>
> > > >
> > > > The ISP supports both CSI and parallel interfaces, where port 0
> > > > corresponds to the former and port 1 corresponds to the latter. Since
> > > > the i.MX8MP's ISPs are connected by the parallel interface to the CSI
> > > > receiver, set them both to port 1.
> > > >
> > > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > > Changes since v3:
> > > >
> > > > - Add comment regarding the IMX8MP_CLK_MEDIA_ISP clock rate
> > > > - Fix assigned-clock-rates
> > > > - Dropping Tested-by as the clock configuration has changed
> > > >
> > > > Changes since v2:
> > > >
> > > > - Assign clock parent and frequency in blk-ctrl
> > > >
> > > > Changes since v1:
> > > >
> > > > - Fix clock ordering
> > > > - Add #address-cells and #size-cells to ports nodes
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 57 ++++++++++++++++++++++-
> > > >  1 file changed, 55 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > index d9b5c40f6460..f3531cfb0d79 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > @@ -1673,6 +1673,50 @@ isi_in_1: endpoint {
> > > >                             };
> > > >                     };
> > > >
> > > > +                   isp_0: isp@32e10000 {
> > > > +                           compatible = "fsl,imx8mp-isp";
> > > > +                           reg = <0x32e10000 0x10000>;
> > > > +                           interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > > > +                           clocks = <&clk IMX8MP_CLK_MEDIA_ISP_ROOT>,
> > > > +                                    <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
> > > > +                                    <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
> > > > +                           clock-names = "isp", "aclk", "hclk";
> > > > +                           power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
> > > > +                           fsl,blk-ctrl = <&media_blk_ctrl 0>;
> > > > +                           status = "disabled";
> > > > +
> > > > +                           ports {
> > > > +                                   #address-cells = <1>;
> > > > +                                   #size-cells = <0>;
> > > > +
> > > > +                                   port@1 {
> > > > +                                           reg = <1>;
> > > > +                                   };
> > > > +                           };
> > > > +                   };
> > > > +
> > > > +                   isp_1: isp@32e20000 {
> > > > +                           compatible = "fsl,imx8mp-isp";
> > > > +                           reg = <0x32e20000 0x10000>;
> > > > +                           interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> > > > +                           clocks = <&clk IMX8MP_CLK_MEDIA_ISP_ROOT>,
> > > > +                                    <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
> > > > +                                    <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
> > > > +                           clock-names = "isp", "aclk", "hclk";
> > > > +                           power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
> > > > +                           fsl,blk-ctrl = <&media_blk_ctrl 1>;
> > > > +                           status = "disabled";
> > > > +
> > > > +                           ports {
> > > > +                                   #address-cells = <1>;
> > > > +                                   #size-cells = <0>;
> > > > +
> > > > +                                   port@1 {
> > > > +                                           reg = <1>;
> > > > +                                   };
> > > > +                           };
> > > > +                   };
> > > > +
> > > >                     dewarp: dwe@32e30000 {
> > > >                             compatible = "nxp,imx8mp-dw100";
> > > >                             reg = <0x32e30000 0x10000>;
> > > > @@ -1869,17 +1913,26 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
> > > >                             clock-names = "apb", "axi", "cam1", "cam2",
> > > >                                           "disp1", "disp2", "isp", "phy";
> > > >
> > > > +                           /*
> > > > +                            * The ISP maximum frequency is 400MHz in normal mode
> > > > +                            * and 500MHz in overdrive mode. The 400MHz operating
> > > > +                            * point hasn't been successfully tested yet, so set
> > > > +                            * IMX8MP_CLK_MEDIA_ISP to 500MHz for the time being.
> > > > +                            */
> > > >                             assigned-clocks = <&clk IMX8MP_CLK_MEDIA_AXI>,
> > > >                                               <&clk IMX8MP_CLK_MEDIA_APB>,
> > > >                                               <&clk IMX8MP_CLK_MEDIA_DISP1_PIX>,
> > > >                                               <&clk IMX8MP_CLK_MEDIA_DISP2_PIX>,
> > > > +                                             <&clk IMX8MP_CLK_MEDIA_ISP>,
> > > >                                               <&clk IMX8MP_VIDEO_PLL1>;
> > > >                             assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
> > > >                                                      <&clk IMX8MP_SYS_PLL1_800M>,
> > > >                                                      <&clk IMX8MP_VIDEO_PLL1_OUT>,
> > > > -                                                    <&clk IMX8MP_VIDEO_PLL1_OUT>;
> > > > +                                                    <&clk IMX8MP_VIDEO_PLL1_OUT>,
> > > > +                                                    <&clk IMX8MP_SYS_PLL2_500M>;
> > > >                             assigned-clock-rates = <500000000>, <200000000>,
> > > > -                                                  <0>, <0>, <1039500000>;
> > > > +                                                  <0>, <0>, <500000000>,
> > > > +                                                  <1039500000>;
> > >
> > > Unfortunately for some reason this reparenting doesn't work (on my platform).
> > > 'media_isp' is still below IMX8MP_CLK_24M.
> > > $ grep -B1 media_isp /sys/kernel/debug/clk/clk_summary
> > >     mipi_dsi_esc_rx                  0       0        0        24000000    0          0     50000      N      deviceless                      no_connection_id
> > >     media_isp                        0       0        0        24000000    0          0     50000      N      deviceless                      no_connection_id
> > >        media_isp_root_clk            0       0        0        24000000    0          0     50000      N         32e10000.isp                    isp
> >
> > Hmmm... I get
> >
> >                 sys_pll2_500m        3       3        0        500000000   0          0     50000      Y                  deviceless                      no_connection_id
> >                    media_isp         0       0        0        500000000   0          0     50000      N                     deviceless                      no_connection_id
> >                       media_isp_root_clk 0       0        0        500000000   0          0     50000      N                        32e10000.isp                    isp
> >
> > > I have to add this diff for isp_0 (and isp_1 if you use it):
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > @@ -1683,6 +1683,9 @@ isp_0: isp@32e10000 {
> > >                                 clock-names = "isp", "aclk", "hclk";
> > >                                 power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
> > >                                 fsl,blk-ctrl = <&media_blk_ctrl 0>;
> > > +                               assigned-clocks = <&clk IMX8MP_CLK_MEDIA_ISP>;
> > > +                               assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
> > > +                               assigned-clock-rates = <500000000>;
> > >                                 status = "disabled";
> > >
> > >                                 ports {
> > >
> > > Now clock is setup properly:
> > > $ grep -B1 media_isp /sys/kernel/debug/clk/clk_summary
> > >                 sys_pll2_500m        3       3        0        500000000   0          0     50000      Y                  deviceless                      no_connection_id
> > >                    media_isp         0       0        0        500000000   0          0     50000      N                     deviceless                      no_connection_id
> > >                       media_isp_root_clk 0       0        0        500000000   0          0     50000      N                        32e10000.isp                    isp
> >
> > I'm not sure why that's the case, I don't have assigned-clock*
> > properties in the ISP nodes in my device tree and things still work
> > properly. Would you be able to investigate ?
> 
> For what it's worth, when I remove the extra <0> clock reference on my
> board like:
> 
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1927,7 +1927,7 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
>                                                          <&clk IMX8MP_VIDEO_PLL1_OUT>,
>                                                          <&clk IMX8MP_SYS_PLL2_500M>;
>                                 assigned-clock-rates = <500000000>, <200000000>,
> -                                                      <0>, <0>, <0>, <500000000>,
> +                                                      <0>, <0>, <500000000>,

You're looking at v3, v4 doesn't have the extra 0.

>                                                        <1039500000>;
>                                 #power-domain-cells = <1>;
> 
> 
> I am able to get:
> 
>                 sys_pll2_500m        1       1        0
> 500000000   0          0     50000      Y                  deviceless
>                     no_connection_id
>                    media_isp         0       0        0
> 500000000   0          0     50000      N
> deviceless                      no_connection_id
>                       media_isp_root_clk 0       0        0
> 500000000   0          0     50000      N
> 32e10000.isp                    isp
> 
> 
> The video pll is also  set to 1039500000
>
> > > >                             #power-domain-cells = <1>;
> > > >
> > > >                             lvds_bridge: bridge@5c {
> > > >
> > > > base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> > > > prerequisite-patch-id: ad2bbccf3b0f27415fb14851cec52c431ccb354f

-- 
Regards,

Laurent Pinchart

