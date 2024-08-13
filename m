Return-Path: <linux-media+bounces-16248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D01A950FA6
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 00:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 658851C20DA7
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2024 22:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD1C1AB50D;
	Tue, 13 Aug 2024 22:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qp17ilNu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1651AAE10;
	Tue, 13 Aug 2024 22:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723587752; cv=none; b=ge/48zwnsDxUL0tbq99hit9LZH1Zy5ErdToP3719W2QbYwkFRfqgl5RynEHzPr9mEtAG+RD90Ef/117eMRHx/lXqaDxpIzdUQEDXb//cJ8v2ddjnI3z+cHDMnsRfCXhYvlN/1EFjSb6Ymf+8SxYM/olhtXz+GO5f5a9RyKFPSnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723587752; c=relaxed/simple;
	bh=Nu47LHmyebcQD9ZUs/Zy0IP09UjDbX5KrKUZGzUsAWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXS530gMQ7czCznfwzTrI2vVMD+Bw3WW3WZiVkyIXtv9bBEtvYZZWX2A49veyB1akqq/TRteUlFtUigbS7JlhphcKJNtiO8ifeSVe794RmEbbYlid9W+hvvNlvBfXwXb0RDnn4pn0V2QMb04sWrF+fQzn6wzzsLPCwKeAvWrdik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qp17ilNu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B488E6B5;
	Wed, 14 Aug 2024 00:21:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723587690;
	bh=Nu47LHmyebcQD9ZUs/Zy0IP09UjDbX5KrKUZGzUsAWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qp17ilNugjZRTa/60aXRw9GY9bDN6b1ckMG5CxeidKiVrM+8U+dQZJIIqAy1bLS+d
	 mut/AC0sYmLxhTvvQB1eDty0AorkMAEc2tuFlEELBXofTNNWPHoteI7fODcMFcFuSF
	 ntB8wE2Bz9RRw+bAx0d+EdYbNkr+cEHcO+elh96Q=
Date: Wed, 14 Aug 2024 01:22:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Adam Ford <aford173@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Marek Vasut <marex@denx.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Add DT nodes for the two ISPs
Message-ID: <20240813222204.GA21831@pendragon.ideasonboard.com>
References: <20240325151339.19041-1-laurent.pinchart@ideasonboard.com>
 <4879631.GXAFRqVoOG@steina-w>
 <20240325204924.GY18799@pendragon.ideasonboard.com>
 <2929432.e9J7NaK4W3@steina-w>
 <CAHCN7xLFjJUZQZwPbj5xyxnprwAV3TOvd_6A6sBwOPK+V6uQPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xLFjJUZQZwPbj5xyxnprwAV3TOvd_6A6sBwOPK+V6uQPA@mail.gmail.com>

On Sun, Jun 09, 2024 at 03:21:19PM -0500, Adam Ford wrote:
> On Tue, Mar 26, 2024 at 2:14 AM Alexander Stein wrote:
> > Am Montag, 25. März 2024, 21:49:24 CET schrieb Laurent Pinchart:
> > > On Mon, Mar 25, 2024 at 04:52:21PM +0100, Alexander Stein wrote:
> > > > Am Montag, 25. März 2024, 16:13:39 CET schrieb Laurent Pinchart:
> > > > > From: Paul Elder <paul.elder@ideasonboard.com>
> > > > >
> > > > > The ISP supports both CSI and parallel interfaces, where port 0
> > > > > corresponds to the former and port 1 corresponds to the latter. Since
> > > > > the i.MX8MP's ISPs are connected by the parallel interface to the CSI
> > > > > receiver, set them both to port 1.
> > > > >
> > > > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > ---
> > > > > Changes since v1:
> > > > >
> > > > > - Fix clock ordering
> > > > > - Add #address-cells and #size-cells to ports nodes
> > > > > ---
> > > > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 50 +++++++++++++++++++++++
> > > > >  1 file changed, 50 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > > index bfc5c81a5bd4..1d2670b91b53 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > > @@ -1616,6 +1616,56 @@ isi_in_1: endpoint {
> > > > >                           };
> > > > >                   };
> > > > >
> > > > > +                 isp_0: isp@32e10000 {
> > > > > +                         compatible = "fsl,imx8mp-isp";
> > > > > +                         reg = <0x32e10000 0x10000>;
> > > > > +                         interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > > > > +                         clocks = <&clk IMX8MP_CLK_MEDIA_ISP_ROOT>,
> > > > > +                                  <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
> > > > > +                                  <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
> > > > > +                         clock-names = "isp", "aclk", "hclk";
> > > > > +                         assigned-clocks = <&clk IMX8MP_CLK_MEDIA_ISP>;
> > > > > +                         assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
> > > > > +                         assigned-clock-rates = <500000000>;
> > > > > +                         power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
> > > > > +                         fsl,blk-ctrl = <&media_blk_ctrl 0>;
> > > > > +                         status = "disabled";
> > > > > +
> > > > > +                         ports {
> > > > > +                                 #address-cells = <1>;
> > > > > +                                 #size-cells = <0>;
> > > > > +
> > > > > +                                 port@1 {
> > > > > +                                         reg = <1>;
> > > > > +                                 };
> > > > > +                         };
> > > > > +                 };
> > > > > +
> > > > > +                 isp_1: isp@32e20000 {
> > > > > +                         compatible = "fsl,imx8mp-isp";
> > > > > +                         reg = <0x32e20000 0x10000>;
> > > > > +                         interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> > > > > +                         clocks = <&clk IMX8MP_CLK_MEDIA_ISP_ROOT>,
> > > > > +                                  <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
> > > > > +                                  <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
> > > > > +                         clock-names = "isp", "aclk", "hclk";
> > > > > +                         assigned-clocks = <&clk IMX8MP_CLK_MEDIA_ISP>;
> > > > > +                         assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
> > > > > +                         assigned-clock-rates = <500000000>;
> > > > > +                         power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
> > > > > +                         fsl,blk-ctrl = <&media_blk_ctrl 1>;
> > > > > +                         status = "disabled";
> > > > > +
> > > > > +                         ports {
> > > > > +                                 #address-cells = <1>;
> > > > > +                                 #size-cells = <0>;
> > > > > +
> > > > > +                                 port@1 {
> > > > > +                                         reg = <1>;
> > > > > +                                 };
> > > > > +                         };
> > > > > +                 };
> > > > > +
> > > >
> > > > The patch itself is okay. But you might not be able to
> > > > configure the parent of IMX8MP_CLK_MEDIA_ISP if dewarp is enabled before.
> > > > This is due to IMX8MP_CLK_MEDIA_ISP_ROOT being enabled in 'pgc_ispdwp'
> > > > power domain. Reparenting is not possible anymore in this case.
> > >
> > > Good point.
> > >
> > > > Something like
> > > > ---8<---
> > > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > @@ -1837,11 +1837,13 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
> > > >                                                   <&clk IMX8MP_CLK_MEDIA_APB>,
> > > >                                                   <&clk IMX8MP_CLK_MEDIA_DISP1_PIX>,
> > > >                                                   <&clk IMX8MP_CLK_MEDIA_DISP2_PIX>,
> > > > +                                                 <&clk IMX8MP_CLK_MEDIA_ISP>,
> > > >                                                   <&clk IMX8MP_VIDEO_PLL1>;
> > > >                                 assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
> > > >                                                          <&clk IMX8MP_SYS_PLL1_800M>,
> > > >                                                          <&clk IMX8MP_VIDEO_PLL1_OUT>,
> > > > -                                                        <&clk IMX8MP_VIDEO_PLL1_OUT>;
> > > > +                                                        <&clk IMX8MP_VIDEO_PLL1_OUT>,
> > > > +                                                        <&clk IMX8MP_SYS_PLL2_500M>;
> > > >                                 assigned-clock-rates = <500000000>, <200000000>,
> > > >                                                        <0>, <0>, <1039500000>;
> > >
> 
> According to the i.MX8MP Data sheet, the nominal speed for
> MEDIA_ISP_CLOCL_ROOT is 400MHZ with 500MHz being allowed in overdrive
> mode.
> 
> I think this clock rate should drop to  the nominal value of 400MHz
> and those boards who support overdrive can increase it to 500MHz to
> avoid stiability issues and/or running out of spec.  I created an
> imx8mm and imx8mn-overdrive.dtsi file.  If there is interest, I can do
> the same for the 8MP as well.

I've experimented with this, and lowered the ISP clock to 400MHz by
selecting IMX8MP_SYS_PLL1_400M as the parent. I couldn't capture images
anymore :-S

The camera sensor I'm using outputs a 74.25 Mpix/s pixel rate, which is
way below the maximum in either normal or overdrive mode. The reference
manual states, regarding the CSI-2 receivers,

- When one ISP is used, MIPI CSI interface 1 supports:
  - Pixel clock up to 400MHz at nominal voltage and 500MHz at overdrive
    voltage
- When two ISPs are used, both MIPI CSI interfaces supports:
  - Pixel clock up to 266MHz at nominal and overdrive voltage

The datasheets for both the CEC and IEC variants give slightly
different information:

- For single Camera, MIPI CSI 1 can support up to 400/500 MHz pixel
  clock in the Nominal/Overdrive mode.
- For single Camera, MIPI CSI 2 can support up to 277 MHz pixel clock.
- For dual Camera, both MIPI CSI can support up to 266 MHz pixel clock.

The also list the maximum clock frequencies as

- MEDIA_ISP_CLK_ROOT: nominal 400 MHz, overdrive 500 MHz
- MEDIA_CAM1_PIX_CLK_ROOT: nominal 400 MHz, overdrive 500 MHz
- MEDIA_CAM2_PIX_CLK_ROOT: nominal 277 MHz, overdrive 277 MHz

(On a side note, the revision history indicates the revision 2.1 of the
datasheet changed MEDIA_CAM2_PIX_CLK_ROOT from 266/266 MHz to 277/277
MHz, but the 277 MHz frequency has been listed since revision 0.)

The MIPI CSI-2 RX (MIPI_CSI) receives data for the camera sensor at the
CSI-2 link frequency rate. It reclocks the data stream using an internal
FIFO, with an output pixel rate selected by the
IMX8MP_CLK_MEDIA_CAM1_PIX_ROOT (for the first CSI-2 receiver) or
IMX8MP_CLK_MEDIA_CAM2_PIX_ROOT (for the second CSI-2 receiver). Those
clocks support the following parents, with the following frequencies on
my system:

- 24M_REF_CLK		24 MHz
- SYSTEM_PLL1_CLK	800 MHz
- SYSTEM_PLL1_DIV3	266 MHz
- SYSTEM_PLL2_CLK	1000 MHz
- SYSTEM_PLL2_DIV4	250 MHz
- SYSTEM_PLL3_CLK	600 MHz
- AUDIO_PLL2_CLK	361.2672 MHz
- VIDEO_PLL_CLK		400 MHz

This makes it easy to configure the CAM PIX ROOT clock to 266 MHz or 400
MHz easily. Achieving 277 MHz or 500 MHz would I assume require
modifying some of the PLL configurations. I'm not sure how the clock
tree was designed to be configured for overdrive mode.

imx8mp.dtsi configures the CAM1_PIX and CAM2_PIX clocks with

	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_CAM1_PIX>;
	assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
	assigned-clock-rates = <266000000>;

and

	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_CAM1_PIX>;
	assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
	assigned-clock-rates = <266000000>;

This is misleading as it selects the SYSTEM_PLL2_DIV4 parent, with a
clock frequency of 250 MHz. I'll send a patch to set the assigned clock
rate to 250 MHz to avoid misunderstandings, we can in parallel decide if
the parent should be set to SYSTEM_PLL1_DIV3 instead.

As the CSI-2 transmits, as far as I can tell, one pixel per clock cycle
to the ISP for raw sensors, this is well within the hardware limits.

The clock domains of the ISP are briefly described in the reference
manual as follows:

- Core Clock (clk) - Core clock is the main clock domain used by the ISP
  modules and is the biggest clock domain in the ISP.
- Sensor Clock (sclk) - The sensor clock domain is selected from the
  sensor interface and is the data input clock.
- AHB Clock (hclk) - The AHB Clock is the AHB Interface clock.
- AXI Clock (m_hclk) - The AXI Clock is the AXI Interface clock.

Additionally, the reference manual states that

    The communication between the different domains in ISP occurs mostly
    by way of asynchronous FIFOs. All clocks are asynchronous to each
    other. There is no communication between AHB and AXI clock domains.

The sensor clock (sclk) is the clock received by the ISP, which is the
MIPI_CSI output clock (MEDIA_CAM[12]_PIX_CLK_ROOT). This clock isn't
listed in the ISP DT node, as it isn't controlled directly by the ISP.
It isn't clear where the transition to the core clock (clk) happens, I
would assume quite early in the ISP pipeline. That clock is the
MEDIA_ISP_CLOCK_ROOT, which that patch configures to 500 MHz. My
assumption is that the core clock frequency needs to be at least as high
as the sensor clock, but as configuring the ISP clock to 400 MHz breaks
image capture, there's something I'm missing.

As the 500 MHz ISP clock frequency is exactly twice the sensor clock
frequency in my setup, I wondered if there could be a x2 relationship
between those two clocks. I have tried to increase the CAM1_PIX clock to
266 MHz, and the ISP then operates correctly with a 500 MHz ISP clock.
There must thus be something else.

I'm not sure how to move forward. There's no further information I could
find in the datasheet or reference manual that would hint how to operate
with a 400 MHz ISP clock frequency. We may require help from someone at
NXP. In the meantime, could we merge this patch with a 500 MHz ISP
clock frequency (setup in the blk-ctrl@32ec0000 node instead of the isp
nodes) ?

> I haven't gone through all the clocks to determine if/what clocks are
> being overdriven.
> 
> > > With an assigned clock rate here too then ?
> >
> > You are right. This posted diff is what I was using for a while now though.
> > Apparently the clock frequency was still correct.
> >
> > > >                                 #power-domain-cells = <1>;
> > > > ---8<---
> > > > is needed.
> > >
> > > Sascha, are you OK with this approach ?
> 
> This patch appears to have gone stale.  Is there any way we can push
> this forward?
> 
> > > > >                   dewarp: dwe@32e30000 {
> > > > >                           compatible = "nxp,imx8mp-dw100";
> > > > >                           reg = <0x32e30000 0x10000>;
> > > > >
> > > > > base-commit: 4cece764965020c22cff7665b18a012006359095

-- 
Regards,

Laurent Pinchart

