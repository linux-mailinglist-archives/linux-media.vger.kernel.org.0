Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67D7C660252
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 15:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235186AbjAFOg0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 09:36:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235046AbjAFOgY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 09:36:24 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A868D77D17
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 06:36:23 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDnpV-0007Td-UF; Fri, 06 Jan 2023 15:36:21 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1pDnpV-0005gf-80; Fri, 06 Jan 2023 15:36:21 +0100
Date:   Fri, 6 Jan 2023 15:36:21 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 8/8] ARM: dts: imx7d: add node for PXP
Message-ID: <20230106143621.GF24101@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
References: <20230105134729.59542-1-m.tretter@pengutronix.de>
 <20230105134729.59542-9-m.tretter@pengutronix.de>
 <Y7gV2bGXqPMLr4Vv@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y7gV2bGXqPMLr4Vv@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 06 Jan 2023 14:36:41 +0200, Laurent Pinchart wrote:
> Hi Michael,
> 
> Thank you for the patch.
> 
> On Thu, Jan 05, 2023 at 02:47:29PM +0100, Michael Tretter wrote:
> > The i.MX7d contains a Pixel Pipeline in version 3.0. Add the device tree
> > node to make it available.
> > 
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> >  arch/arm/boot/dts/imx7d.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
> > index 7ceb7c09f7ad..728cc9413a7c 100644
> > --- a/arch/arm/boot/dts/imx7d.dtsi
> > +++ b/arch/arm/boot/dts/imx7d.dtsi
> > @@ -165,6 +165,15 @@ pcie_phy: pcie-phy@306d0000 {
> >  		  reg = <0x306d0000 0x10000>;
> >  		  status = "disabled";
> >  	};
> > +
> > +	pxp: pxp@30700000 {
> > +		compatible = "fsl,imx7d-pxp";
> 
> Hmmm... The i.MX7S also has a PXP that seems compatible. I thus wonder
> if we shouldn't move this node to imx7s.dtsi.

The i.MX7S has a PXP at the same address, but the architecture in the
reference manual (Figure 13-71. PXP Architecture, p. 3797) looks slightly
different wrt. the location of the multiplexers. The reference manual is also
conspicuously lacking documentation of the DATA_PATH_CTRL0 register.

I wouldn't risk adding the node to the imx7s.dtsi and would rather keep the
option to add a different compatible for the i.MX7S to be able to handle the
difference.

Michael

> 
> > +		reg = <0x30700000 0x10000>;
> > +		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> > +			<GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> 
> Nitpicking, alignment ?
> 
> > +		clocks = <&clks IMX7D_PXP_CLK>;
> > +		clock-names = "axi";
> > +	};
> >  };
> >  
> >  &aips3 {
