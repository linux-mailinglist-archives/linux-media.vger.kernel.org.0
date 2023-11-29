Return-Path: <linux-media+bounces-1350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BE27FD4C0
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 11:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BA7A1C20F61
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 10:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C291BDCF;
	Wed, 29 Nov 2023 10:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XWiYmfme"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68E1795;
	Wed, 29 Nov 2023 02:55:31 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C3CF842;
	Wed, 29 Nov 2023 11:54:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701255293;
	bh=+thUs3ZwcJ7OeP27zmFr2bOov1zQu5Uq4z2RuS7YBr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XWiYmfmeMKqDhB0F2WsNEs6VV63CnIAh3vt3iikQMvWHm6oJaFzS3UNUeiotYfog1
	 8/CaBBCqAbFGlgxu2wuse+PbF5pu3CKhP+UiRQ79+Tq/nVH2tGI99CcUOXyr9UYrv4
	 A2zvZ/HRl0wBisDUrTq7BNS4EFf+O5ON+G/Kdz3A=
Date: Wed, 29 Nov 2023 12:55:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Adam Ford <aford173@gmail.com>
Cc: Marco Felsch <m.felsch@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-imx@nxp.com,
	kernel@pengutronix.de, Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: imx8mp: Add CSIS DT nodes
Message-ID: <20231129105536.GE24293@pendragon.ideasonboard.com>
References: <20230417055627.16482-1-laurent.pinchart@ideasonboard.com>
 <20230417055627.16482-2-laurent.pinchart@ideasonboard.com>
 <CAHCN7x+kymRGO2kxvN2=zLiqRjfTc3hdf3VdNVkWjsW3La0bnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7x+kymRGO2kxvN2=zLiqRjfTc3hdf3VdNVkWjsW3La0bnA@mail.gmail.com>

Hi Adam,

(CC'ing Kieran)

On Tue, Nov 28, 2023 at 09:17:51PM -0600, Adam Ford wrote:
> On Mon, Apr 17, 2023 at 1:01 AM Laurent Pinchart wrote:
> >
> > Add DT nodes for the two CSI-2 receivers of the i.MX8MP.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> 
> Laurent,
> 
> Sorry to dig up an old thread, but I have a concern about the clock
> ratings and nominal mode vs overdrive mode.  I started investigating
> the different data sheets amongst the various imx8m[mnp] families to
> make the default device trees run at nominal mode while also creating
> a separate dtsi file with settings for overdrive so boards who use it
> can include them without having to duplicate the clock settings for
> everyone who supports overdrive.
> 
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 60 +++++++++++++++++++++++
> >  1 file changed, 60 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > index 2dd60e3252f3..2a374a4c14a2 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -1239,6 +1239,66 @@ ldb_lvds_ch1: endpoint {
> >                                 };
> >                         };
> >
> > +                       mipi_csi_0: csi@32e40000 {
> > +                               compatible = "fsl,imx8mp-mipi-csi2", "fsl,imx8mm-mipi-csi2";
> > +                               reg = <0x32e40000 0x10000>;
> > +                               interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> > +                               clock-frequency = <500000000>;
> > +                               clocks = <&clk IMX8MP_CLK_MEDIA_APB_ROOT>,
> > +                                        <&clk IMX8MP_CLK_MEDIA_CAM1_PIX_ROOT>,
> > +                                        <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT>,
> > +                                        <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>;
> > +                               clock-names = "pclk", "wrap", "phy", "axi";
> > +                               assigned-clocks = <&clk IMX8MP_CLK_MEDIA_CAM1_PIX>;
> > +                               assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
> > +                               assigned-clock-rates = <500000000>;
> 
> According to Rev 2.1 of the Data sheet (IMX8MPCEC), dated July 2023,
> 500MHz is listed as single-camera, overdrive mode.  Single-camera,
> nominal mode is 400MHz, but there is more...
> If configured for dual cameras, both CSI can only support up to
> 266MHz, but we have partially configured both albeit without the
> actual camera sensors connected.
> 
> > +                               power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
> > +                               status = "disabled";
> > +
> > +                               ports {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +
> > +                                       port@0 {
> > +                                               reg = <0>;
> > +                                       };
> > +
> > +                                       port@1 {
> > +                                               reg = <1>;
> > +                                       };
> > +                               };
> > +                       };
> > +
> > +                       mipi_csi_1: csi@32e50000 {
> > +                               compatible = "fsl,imx8mp-mipi-csi2", "fsl,imx8mm-mipi-csi2";
> > +                               reg = <0x32e50000 0x10000>;
> > +                               interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> > +                               clock-frequency = <266000000>;
> > +                               clocks = <&clk IMX8MP_CLK_MEDIA_APB_ROOT>,
> > +                                        <&clk IMX8MP_CLK_MEDIA_CAM2_PIX_ROOT>,
> > +                                        <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT>,
> > +                                        <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>;
> > +                               clock-names = "pclk", "wrap", "phy", "axi";
> > +                               assigned-clocks = <&clk IMX8MP_CLK_MEDIA_CAM2_PIX>;
> > +                               assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
> > +                               assigned-clock-rates = <266000000>;
> 
> 266MHz is correct for dual camera, but in single camera, the second
> CSI is capable of 277MHz.
> 
> At a minimum, I'd like to fix the overdrive frequency to nominal, but
> since we're plumbing in both cameras, I wonder if it would be better
> to run both at 266MHz with a note on CSI0 that states it could run at
> 400 or 500 if the second CSI is disabled and a note on the second CSI
> that it could run at 277 when the first one is disabled? What are your
> thoughts?

My thoughts is that this all should be selected at runtime, based on how
many cameras are used. That won't be trivial to do though :-S Kieran,
you've been working with two cameras, any opinion ?

> > +                               power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_2>;
> > +                               status = "disabled";
> > +
> > +                               ports {
> > +                                       #address-cells = <1>;
> > +                                       #size-cells = <0>;
> > +
> > +                                       port@0 {
> > +                                               reg = <0>;
> > +                                       };
> > +
> > +                                       port@1 {
> > +                                               reg = <1>;
> > +                                       };
> > +                               };
> > +                       };
> > +
> >                         pcie_phy: pcie-phy@32f00000 {
> >                                 compatible = "fsl,imx8mp-pcie-phy";
> >                                 reg = <0x32f00000 0x10000>;

-- 
Regards,

Laurent Pinchart

