Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 885756750A2
	for <lists+linux-media@lfdr.de>; Fri, 20 Jan 2023 10:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbjATJUm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Jan 2023 04:20:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbjATJUl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Jan 2023 04:20:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D27794C87;
        Fri, 20 Jan 2023 01:20:29 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 17EF6514;
        Fri, 20 Jan 2023 10:20:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674206427;
        bh=ZpjEdpxmp0MOhQncB4X9KLDvc6Eb6mlNo8Th3w38MgA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mD1w388r9+eI010yQLul2/0vDGJV1Yo6++L0HS7MPo2z+VAIviYFW3BRBdFiHDydx
         3YIgPhe2qZyzsjpSiDUSG1w0Ic/GDS4cKPPfC2iurld7rul27CTHe1T22V9mXt43KJ
         5QobO9LYudcxLGMtp2SlB2BMAzrm2NElnHrN4A9s=
Date:   Fri, 20 Jan 2023 11:20:24 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 08/16] ARM: dts: imx7d: add node for PXP
Message-ID: <Y8pc2IZl09iNaUiR@pendragon.ideasonboard.com>
References: <20230112-imx-pxp-v2-0-e2281da1db55@pengutronix.de>
 <20230112-imx-pxp-v2-8-e2281da1db55@pengutronix.de>
 <Y8V6yU8bZoVt32wN@pendragon.ideasonboard.com>
 <20230120090609.GB13264@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230120090609.GB13264@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 20, 2023 at 10:06:09AM +0100, Michael Tretter wrote:
> On Mon, 16 Jan 2023 18:26:49 +0200, Laurent Pinchart wrote:
> > On Fri, Jan 13, 2023 at 10:54:14AM +0100, Michael Tretter wrote:
> > > The i.MX7d contains a Pixel Pipeline in version 3.0. Add the device tree
> > > node to make it available.
> > > 
> > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > 
> > Should this go through Shawn's tree ? If so, how would you like to
> > handle the dependency on the DT bindings in patch 01/16 ?
> 
> There is no actual dependency. The binding was already specified as a txt,
> just not as a yaml, and the added node matches both.

Good point. I'll send a pull request for the series then, without this
patch, which can be picked by Shawn separately.

> > > ---
> > > Changelog
> > > 
> > > v2:
> > > 
> > > - fix alignment
> > > ---
> > >  arch/arm/boot/dts/imx7d.dtsi | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > > 
> > > diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
> > > index 7ceb7c09f7ad..4b94b8afb55d 100644
> > > --- a/arch/arm/boot/dts/imx7d.dtsi
> > > +++ b/arch/arm/boot/dts/imx7d.dtsi
> > > @@ -165,6 +165,15 @@ pcie_phy: pcie-phy@306d0000 {
> > >  		  reg = <0x306d0000 0x10000>;
> > >  		  status = "disabled";
> > >  	};
> > > +
> > > +	pxp: pxp@30700000 {
> > > +		compatible = "fsl,imx7d-pxp";
> > > +		reg = <0x30700000 0x10000>;
> > > +		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> > > +			     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> > > +		clocks = <&clks IMX7D_PXP_CLK>;
> > > +		clock-names = "axi";
> > > +	};
> > >  };
> > >  
> > >  &aips3 {

-- 
Regards,

Laurent Pinchart
